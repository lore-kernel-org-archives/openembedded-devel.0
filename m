Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AAF1060B98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 05:21:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,547,1574092800"; d="scan'208";a="86257211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 13:21:34 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2333D50A996D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 13:11:33 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 13:21:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 13 Mar 2020 13:21:36 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Mar 2020 04:10:22 -0700
Message-ID: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2333D50A996D.A11AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][zeus][PATCH] libssh2: CVE-2019-17498.patch
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
X-List-Received-Date: Fri, 13 Mar 2020 05:21:40 -0000
Content-Type: text/plain

Security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-17498

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch

diff --git a/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch b/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
new file mode 100644
index 000000000..f60764c92
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
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
+Upstream-Status: Accepted
+CVE: CVE-2019-17498
+
+Reference to upstream patch:
+https://github.com/libssh2/libssh2/commit/dedcbd106f8e52d5586b0205bc7677e4c9868f9c
+
+---
+ src/packet.c | 68 ++++++++++++++++++++++------------------------------
+ 1 file changed, 29 insertions(+), 39 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 38ab6294..2e01bfc5 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -416,8 +416,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
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
+@@ -469,33 +469,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
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
+@@ -534,23 +526,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
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
+@@ -576,7 +566,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+                 uint32_t len = 0;
+                 unsigned char want_reply = 0;
+                 len = _libssh2_ntohu32(data + 1);
+-                if(datalen >= (6 + len)) {
++                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
+                     want_reply = data[5 + len];
+                     _libssh2_debug(session,
+                                    LIBSSH2_TRACE_CONN,
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
index fe853cde4..a17ae5b7c 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
@@ -17,6 +17,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF += "\
                  --with-libz \
                  --with-libz-prefix=${STAGING_LIBDIR} \
+                 file://CVE-2019-17498.patch \
                 "
 
 # only one of openssl and gcrypt could be set
-- 
2.17.1




