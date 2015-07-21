Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8388575979
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:51 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so42026192pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9zZvzwJE6DkSi+mZm+XA6NKfNKqoHfuh6geTgowuVLo=;
	b=ZBOy1x2k/80HKwFbr1dG/NAyS7Yyz9Q58GeFrkjQxZe/69YE5iqUwpPHCUzw3eOhs7
	bl7DPE+YjOaVbpe/CSUjVzAFTfgF1TvTpdsN9iRBUBYFbUJFZJRyaevQuo4mj5CFRwd4
	scVeBCrKv9zKtquIjbmqZf8FCcDhtuG4oWsSBqRs/TgPD33h2GQaxleecDD/g0aI9tEV
	Zj5rVY6HqsSt0o5NGccRvCQnTfu5VvlWnVwh0sj+WcdcmDLgFIDIuPWpwV7ePAlHGLht
	KM0yqHir3RkJAinIOjioDJzXUChs/O3mNZyhUilYUef/LIWoYi2WcrY53ZMbOGNwOEcn
	PG7A==
X-Received: by 10.66.161.135 with SMTP id xs7mr69934496pab.154.1437454612520; 
	Mon, 20 Jul 2015 21:56:52 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	no6sm24732541pdb.42.2015.07.20.21.56.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 21:56:49 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E448AFC0E52; Mon, 20 Jul 2015 21:56:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 20 Jul 2015 21:56:35 -0700
Message-Id: <c580b62cb2226d2be7cdef77d4ff838fd4095a03.1437454485.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
References: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
In-Reply-To: <cover.1437454485.git.akuster808@gmail.com>
References: <cover.1437454485.git.akuster808@gmail.com>
Subject: [PATCH 2/5] libssh2: fix CVE-2015-1782
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
X-List-Received-Date: Tue, 21 Jul 2015 04:56:52 -0000

From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>

Refer to: http://www.libssh2.org/adv_20150311.html

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


