Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59F1F7FAA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 02:51:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xAP2pit5025398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 18:51:44 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 24 Nov 2019 18:51:43 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Nov 2019 10:51:18 +0800
Message-ID: <1574650278-205149-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] libssh2: Security Advisory - libssh2 - CVE-2019-17498
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 02:51:43 -0000
Content-Type: text/plain

Porting the patch from <https://github.com/libssh2/libssh2/commit/
dedcbd106f8e52d5586b0205bc7677e4c9868f9c> to solve CVE-2019-17498.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../libssh2/files/CVE-2019-17498.patch             | 131 +++++++++++++++++++++
 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb   |   5 +-
 2 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch

diff --git a/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch b/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
new file mode 100644
index 0000000..0010800
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
@@ -0,0 +1,131 @@
+From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 30 Aug 2019 09:57:38 -0700
+Subject: [PATCH] packet.c: improve message parsing (#402)
+
+* packet.c: improve parsing of packets
+
+file: packet.c
+
+notes:
+Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
+
+Upstream-Status: Backport
+CVE: CVE-2019-17498
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/packet.c | 68 ++++++++++++++++++++++------------------------------
+ 1 file changed, 29 insertions(+), 39 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 38ab629..2e01bfc 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                     size_t datalen, int macstate)
+ {
+     int rc = 0;
+-    char *message = NULL;
+-    char *language = NULL;
++    unsigned char *message = NULL;
++    unsigned char *language = NULL;
+     size_t message_len = 0;
+     size_t language_len = 0;
+     LIBSSH2_CHANNEL *channelp = NULL;
+@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+         case SSH_MSG_DISCONNECT:
+             if(datalen >= 5) {
+-                size_t reason = _libssh2_ntohu32(data + 1);
++                uint32_t reason = 0;
++                struct string_buf buf;
++                buf.data = (unsigned char *)data;
++                buf.dataptr = buf.data;
++                buf.len = datalen;
++                buf.dataptr++; /* advance past type */
+ 
+-                if(datalen >= 9) {
+-                    message_len = _libssh2_ntohu32(data + 5);
++                _libssh2_get_u32(&buf, &reason);
++                _libssh2_get_string(&buf, &message, &message_len);
++                _libssh2_get_string(&buf, &language, &language_len);
+ 
+-                    if(message_len < datalen-13) {
+-                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
+-                        message = (char *) data + 9;
+-
+-                        language_len =
+-                            _libssh2_ntohu32(data + 9 + message_len);
+-                        language = (char *) data + 9 + message_len + 4;
+-
+-                        if(language_len > (datalen-13-message_len)) {
+-                            /* bad input, clear info */
+-                            language = message = NULL;
+-                            language_len = message_len = 0;
+-                        }
+-                    }
+-                    else
+-                        /* bad size, clear it */
+-                        message_len = 0;
+-                }
+                 if(session->ssh_msg_disconnect) {
+-                    LIBSSH2_DISCONNECT(session, reason, message,
+-                                       message_len, language, language_len);
++                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
++                                       message_len, (const char *)language,
++                                       language_len);
+                 }
++
+                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
+                                "Disconnect(%d): %s(%s)", reason,
+                                message, language);
+@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                 int always_display = data[1];
+ 
+                 if(datalen >= 6) {
+-                    message_len = _libssh2_ntohu32(data + 2);
+-
+-                    if(message_len <= (datalen - 10)) {
+-                        /* 6 = packet_type(1) + display(1) + message_len(4) */
+-                        message = (char *) data + 6;
+-                        language_len = _libssh2_ntohu32(data + 6 +
+-                                                        message_len);
+-
+-                        if(language_len <= (datalen - 10 - message_len))
+-                            language = (char *) data + 10 + message_len;
+-                    }
++                    struct string_buf buf;
++                    buf.data = (unsigned char *)data;
++                    buf.dataptr = buf.data;
++                    buf.len = datalen;
++                    buf.dataptr += 2; /* advance past type & always display */
++
++                    _libssh2_get_string(&buf, &message, &message_len);
++                    _libssh2_get_string(&buf, &language, &language_len);
+                 }
+ 
+                 if(session->ssh_msg_debug) {
+-                    LIBSSH2_DEBUG(session, always_display, message,
+-                                  message_len, language, language_len);
++                    LIBSSH2_DEBUG(session, always_display,
++                                  (const char *)message,
++                                  message_len, (const char *)language,
++                                  language_len);
+                 }
+             }
++
+             /*
+              * _libssh2_debug will actually truncate this for us so
+              * that it's not an inordinate about of data
+@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                 uint32_t len = 0;
+                 unsigned char want_reply = 0;
+                 len = _libssh2_ntohu32(data + 1);
+-                if(datalen >= (6 + len)) {
++                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
+                     want_reply = data[5 + len];
+                     _libssh2_debug(session,
+                                    LIBSSH2_TRACE_CONN,
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index 25e0af3..185ea11 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -7,8 +7,9 @@ DEPENDS = "zlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-
+SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+           file://CVE-2019-17498.patch \
+"
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
 
-- 
1.9.1


