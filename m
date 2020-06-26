Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.161.1593141285188263656
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L9IROt3p;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id bh7so3730458plb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=b3sblzPt+jo3HwIGy29MPxdg+PQwFw3TzTMLQ9dR65U=;
        b=L9IROt3pXbJiDvypcR65CYr8x7S0l9Iy+Rr2KiguBL2u1wC4fBislxGq5BZbYA2cnO
         XEpwXwevA1n+LxrK27q3mBi1l2O8hTx/26nej70SqyFV0eEj5fuyYZ2WeExUEtbnD235
         nmmwNtVvHD7kMpxfBoUbd3akcsWO76Oc3G8vDpCSG4br9nzeLTrwfMxpLTgAsirU9/ZX
         /H/K0R+/siZP576BDlFVD/QlbG52J5/2W1+SFRlqGurSOP2GlpPNtqweQPe5TZAd9GX5
         bbaSJWmupX/cDyT2+0C1ZMQAyYm0ryvS9P8GrpbQ2QdMamRCSMICIy0nupFZxcjQnWe/
         Fnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=b3sblzPt+jo3HwIGy29MPxdg+PQwFw3TzTMLQ9dR65U=;
        b=b7xrHZCEih3LVeIEu/ea+3et22Ovn9aEQdzIiPJwjHBt8RCE2tRHXB60rWOJ4UizCw
         oIHG1h7B6v9Ln3F+dNQJA3K1/2yrctMCsbt70BLtsoUOizbVklN7PW4GE3ezz+Fb8qwS
         oBwMG0h/SJZlAlSykLYJIUo45IRdMr8a4VdI8CvcFKJPEbV7HuhFq8hEG24K1eM6tlxF
         mqbNN66LErlBFP4tQ2q1RTPRwKHDAZRYrsjvz966AGPeNP89QwXsGwi6s3N06fLrr1s1
         akKO6iNy02+J9IVO3KOLaHVo55GuPcxHiuDp9ihZV6wKHPewgngBB9H4y631im5PHvHu
         BS5A==
X-Gm-Message-State: AOAM530X68+ufoiejePlVsWuDz/7LgES7uHRUQCwDkZwg+AhdMldgqBa
	g859iBdGiY/eCuq8iiKrbLEs8LCD
X-Google-Smtp-Source: ABdhPJy7cy4WXupDMN4X1B0F+Yw31uFZZbamvKDNPQv0f/AzdlARLZZrxhygbHjxqLNpI27xEVyufw==
X-Received: by 2002:a17:902:ab8e:: with SMTP id f14mr873862plr.80.1593141284470;
        Thu, 25 Jun 2020 20:14:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 3/6] libssh2: CVE-2019-17498.patch
Date: Thu, 25 Jun 2020 20:14:35 -0700
Message-Id: <2cf6bc0e6de881e2385a3a0f2821b411cd1237dc.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
References: <cover.1593141198.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-17498

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch

diff --git a/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch b/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
new file mode 100644
index 0000000000..f60764c92d
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
index fe853cde4f..a17ae5b7c3 100644
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

