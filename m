Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9A0C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 08:35:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4023.1686040536866351415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 01:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DS8X6dYz;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64d24136685so4220830b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686040536; x=1688632536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6TvBsKJRX0DMYQZYsl0Y9E6+ecDggl1fuWnz8W8bxE=;
        b=DS8X6dYzWf8jXxKi8mcNd9MdLqCXV8WP902+y5C8GSb3llI/ThHPvB8h5viWSdfwiy
         i9KZDosJXDwC22pnzItcFdpcw/AcyB74fLxQvFK+Q2XgOXxuCllNQYd2QdZdNgkZcgwb
         zWknKeqfPz2k9EWiTrdIP49AYY+96E3ei7NSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040536; x=1688632536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6TvBsKJRX0DMYQZYsl0Y9E6+ecDggl1fuWnz8W8bxE=;
        b=le5rGzNNXdV1rM5wTKiI2/2Oii3G4h8Q1aPQmnSqw0i6KsB+eQZR9UyciG9EwUf6vd
         D3iTejXt7VOs8BW5VnRc1PYvFEEpM81FLnrl2cGML2d+flOL1F7Peyn4sjuBnSFYMs0S
         HqXJaKOJE4Rb64AVQAfT1p7/LFIlhkqf/ReOjogCfkLg0zknEe0AHzDm21dqQyThP8sE
         2MxlO5ulWdLsIVajpQ4Xai0dEmEiB81u6fOFyq935c92gMXP1g2zAbcBQjQUyby+COIQ
         zjNp2DUgZoMeQbYQp9qeEyWjRg6l00Kp+t6Z0L/lypPGE488Mkw8M789oMDraqPUzy1t
         WZXA==
X-Gm-Message-State: AC+VfDzppsk5UEceoNr3u9IRWwqFg+JcIpg/2XQTD1jheI39y4RxRPR6
	ThqBjmM3w8SsPimDLh5qGUplwNGrbCiGUCx078Y=
X-Google-Smtp-Source: ACHHUZ7eCstyNMLKfe54hmQafxynHW8M7IA0OdRkisYpcVGKluH8GMU/1tkpm5WlOLVQmlAlcmoZWw==
X-Received: by 2002:a05:6a00:189b:b0:658:e9f4:f7b6 with SMTP id x27-20020a056a00189b00b00658e9f4f7b6mr2814394pfh.15.1686040536047;
        Tue, 06 Jun 2023 01:35:36 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.216])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7848b000000b0063f2e729127sm6551679pfn.144.2023.06.06.01.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:35:35 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 06 Jun 2023 14:05:29 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: CVE-2023-2855 Candump log file parser crash
Date: Tue,  6 Jun 2023 14:05:24 +0530
Message-Id: <20230606083524.123709-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 08:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103134

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2855.patch       | 108 ++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
new file mode 100644
index 000000000..b4718f460
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
@@ -0,0 +1,108 @@
+From 0181fafb2134a177328443a60b5e29c4ee1041cb Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Tue, 16 May 2023 12:05:07 -0700
+Subject: [PATCH] candump: check for a too-long frame length.
+
+If the frame length is longer than the maximum, report an error in the
+file.
+
+Fixes #19062, preventing the overflow on a buffer on the stack (assuming
+your compiler doesn't call a bounds-checknig version of memcpy() if the
+size of the target space is known).
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb]
+CVE: CVE-2023-2855
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/candump.c | 39 +++++++++++++++++++++++++++++++--------
+ 1 file changed, 31 insertions(+), 8 deletions(-)
+
+diff --git a/wiretap/candump.c b/wiretap/candump.c
+index 0def7bc..3f7c2b2 100644
+--- a/wiretap/candump.c
++++ b/wiretap/candump.c
+@@ -26,8 +26,9 @@ static gboolean candump_seek_read(wtap *wth, gint64 seek_off,
+                                   wtap_rec *rec, Buffer *buf,
+                                   int *err, gchar **err_info);
+ 
+-static void
+-candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
++static gboolean
++candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg, int *err,
++                     gchar **err_info)
+ {
+     static const char *can_proto_name    = "can-hostendian";
+     static const char *canfd_proto_name  = "canfd";
+@@ -59,6 +60,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+     {
+         canfd_frame_t canfd_frame = {0};
+ 
++        /*
++         * There's a maximum of CANFD_MAX_DLEN bytes in a CAN-FD frame.
++         */
++        if (msg->data.length > CANFD_MAX_DLEN) {
++            *err = WTAP_ERR_BAD_FILE;
++            if (err_info != NULL) {
++	        *err_info = g_strdup_printf("candump: File has %u-byte CAN FD packet, bigger than maximum of %u",
++                                             msg->data.length, CANFD_MAX_DLEN);
++            }
++            return FALSE;
++        }
++
+         canfd_frame.can_id = msg->id;
+         canfd_frame.flags  = msg->flags;
+         canfd_frame.len    = msg->data.length;
+@@ -70,6 +83,18 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+     {
+         can_frame_t can_frame = {0};
+ 
++        /*
++         * There's a maximum of CAN_MAX_DLEN bytes in a CAN frame.
++         */
++        if (msg->data.length > CAN_MAX_DLEN) {
++            *err = WTAP_ERR_BAD_FILE;
++            if (err_info != NULL) {
++	        *err_info = g_strdup_printf("candump: File has %u-byte CAN packet, bigger than maximum of %u",
++                                             msg->data.length, CAN_MAX_DLEN);
++            }
++            return FALSE;
++        }
++
+         can_frame.can_id  = msg->id;
+         can_frame.can_dlc = msg->data.length;
+         memcpy(can_frame.data, msg->data.data, msg->data.length);
+@@ -84,6 +109,8 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+ 
+     rec->rec_header.packet_header.caplen = packet_length;
+     rec->rec_header.packet_header.len    = packet_length;
++
++    return TRUE;
+ }
+ 
+ static gboolean
+@@ -190,9 +217,7 @@ candump_read(wtap *wth, wtap_rec *rec, Buffer *buf, int *err, gchar **err_info,
+     ws_debug_printf("%s: Stopped at offset %" PRIi64 "\n", G_STRFUNC, file_tell(wth->fh));
+ #endif
+ 
+-    candump_write_packet(rec, buf, &msg);
+-
+-    return TRUE;
++    return candump_write_packet(rec, buf, &msg, err, err_info);
+ }
+ 
+ static gboolean
+@@ -216,9 +241,7 @@ candump_seek_read(wtap *wth , gint64 seek_off, wtap_rec *rec,
+     if (!candump_parse(wth->random_fh, &msg, NULL, err, err_info))
+         return FALSE;
+ 
+-    candump_write_packet(rec, buf, &msg);
+-
+-    return TRUE;
++    return candump_write_packet(rec, buf, &msg, err, err_info);
+ }
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 1a4aedc13..b1f484803 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://0003-bison-Remove-line-directives.patch \
     file://0004-lemon-Remove-line-directives.patch \
     file://CVE-2022-3190.patch \
+    file://CVE-2023-2855.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


