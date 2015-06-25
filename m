Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 72ED371633
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 21:44:38 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 25 Jun 2015 18:44:33 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 25 Jun 2015 18:44:36 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 18:48:56 -0300
Message-ID: <1435268936-29638-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.4.4
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: efa1de5243ffebe9bf836ee14063171c1764dbbe
X-AkerSMTPGW-MessageID: 8bc683e4fa67d6601c12c78af540a542308f0ee3-10o
Subject: [meta-oe][fido][dizzy][PATCH] libssh2: fix CVE-2015-1782
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 21:44:42 -0000
Content-Type: text/plain

Refer to: http://www.libssh2.org/adv_20150311.html

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 .../libssh2/libssh2-1.4.3/CVE-2015-1782.patch      | 115 +++++++++++++++++++++
 meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb   |   4 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch

diff --git a/meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch b/meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch
new file mode 100644
index 0000000..5f4a7c7
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch
@@ -0,0 +1,115 @@
+From c7f66cca285033da9b8c9de8eceff52d7b3c3ef3 Mon Sep 17 00:00:00 2001
+From: Mariusz Ziulek <mzet@owasp.org>
+Date: Sat, 21 Feb 2015 23:31:36 +0100
+Subject: [PATCH] kex: bail out on rubbish in the incoming packet
+
+Upstream-Status: Backport
+
+Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
+
+---
+ src/kex.c | 73 +++++++++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 41 insertions(+), 32 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index fa4c4e1..ad7498a 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -1547,10 +1547,34 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+ 
+ /* TODO: When in server mode we need to turn this logic on its head
+  * The Client gets to make the final call on "agreed methods"
+  */
+ 
++/*
++ * kex_string_pair() extracts a string from the packet and makes sure it fits
++ * within the given packet.
++ */
++static int kex_string_pair(unsigned char **sp,   /* parsing position */
++                           unsigned char *data,  /* start pointer to packet */
++                           size_t data_len,      /* size of total packet */
++                           size_t *lenp,         /* length of the string */
++                           unsigned char **strp) /* pointer to string start */
++{
++    unsigned char *s = *sp;
++    *lenp = _libssh2_ntohu32(s);
++
++    /* the length of the string must fit within the current pointer and the
++       end of the packet */
++    if (*lenp > (data_len - (s - data) -4))
++        return 1;
++    *strp = s + 4;
++    s += 4 + *lenp;
++
++    *sp = s;
++    return 0;
++}
++
+ /* kex_agree_methods
+  * Decide which specific method to use of the methods offered by each party
+  */
+ static int kex_agree_methods(LIBSSH2_SESSION * session, unsigned char *data,
+                              unsigned data_len)
+@@ -1566,42 +1590,27 @@ static int kex_agree_methods(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+     /* Skip cookie, don't worry, it's preserved in the kexinit field */
+     s += 16;
+ 
+     /* Locate each string */
+-    kex_len = _libssh2_ntohu32(s);
+-    kex = s + 4;
+-    s += 4 + kex_len;
+-    hostkey_len = _libssh2_ntohu32(s);
+-    hostkey = s + 4;
+-    s += 4 + hostkey_len;
+-    crypt_cs_len = _libssh2_ntohu32(s);
+-    crypt_cs = s + 4;
+-    s += 4 + crypt_cs_len;
+-    crypt_sc_len = _libssh2_ntohu32(s);
+-    crypt_sc = s + 4;
+-    s += 4 + crypt_sc_len;
+-    mac_cs_len = _libssh2_ntohu32(s);
+-    mac_cs = s + 4;
+-    s += 4 + mac_cs_len;
+-    mac_sc_len = _libssh2_ntohu32(s);
+-    mac_sc = s + 4;
+-    s += 4 + mac_sc_len;
+-    comp_cs_len = _libssh2_ntohu32(s);
+-    comp_cs = s + 4;
+-    s += 4 + comp_cs_len;
+-    comp_sc_len = _libssh2_ntohu32(s);
+-    comp_sc = s + 4;
+-#if 0
+-    s += 4 + comp_sc_len;
+-    lang_cs_len = _libssh2_ntohu32(s);
+-    lang_cs = s + 4;
+-    s += 4 + lang_cs_len;
+-    lang_sc_len = _libssh2_ntohu32(s);
+-    lang_sc = s + 4;
+-    s += 4 + lang_sc_len;
+-#endif
++    if(kex_string_pair(&s, data, data_len, &kex_len, &kex))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &hostkey_len, &hostkey))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &crypt_cs_len, &crypt_cs))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &crypt_sc_len, &crypt_sc))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &mac_cs_len, &mac_cs))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &mac_sc_len, &mac_sc))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &comp_cs_len, &comp_cs))
++       return -1;
++    if(kex_string_pair(&s, data, data_len, &comp_sc_len, &comp_sc))
++       return -1;
++
+     /* If the server sent an optimistic packet, assume that it guessed wrong.
+      * If the guess is determined to be right (by kex_agree_kex_hostkey)
+      * This flag will be reset to zero so that it's not ignored */
+     session->burn_optimistic_kexinit = *(s++);
+     /* Next uint32 in packet is all zeros (reserved) */
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
index b537663..9af0f7f 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
@@ -7,7 +7,9 @@ DEPENDS = "zlib openssl"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d00afe44f336a79a2ca7e1681ce14509"
 
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
+SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+           file://CVE-2015-1782.patch \
+"
 SRC_URI[md5sum] = "071004c60c5d6f90354ad1b701013a0b"
 SRC_URI[sha256sum] = "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad7d6dc1d5d021b96d"
 
-- 
2.4.4



