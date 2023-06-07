Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7613CC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 05:16:25 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1841.1686114979205625821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 22:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=JQ1uPA30;
 spf=pass (domain: mvista.com, ip: 209.85.167.171, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-38c35975545so6138721b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 22:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686114978; x=1688706978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nonjC6c2uTPCAQk+4Gbhv2vvr9+2WzRGeEZjJ32PYj0=;
        b=JQ1uPA30C1mTu6b2b0ZZvGkMEgVzMO1M9/KCKk/3QT221zFl8mXFcnPTmVAoH4V8lV
         VMkGl2e9UbOAcTogx+g7JsbAtP3T+HFNtF51rktF85snTlnaqv7faR8p2mce0FnmzS8B
         Jwx++7P5vhpkFCVB9rGhY6N6SWEW4Cp5nWKi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114978; x=1688706978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nonjC6c2uTPCAQk+4Gbhv2vvr9+2WzRGeEZjJ32PYj0=;
        b=S9VAKoTFPGJVLgB7r8cyjI4Z1KtByt9NbdFDhycUeRQ2NtM4sr+GRBE+ZVAOuFYmkW
         niMQX3sbHDuVvyeSBpIUKnUEkMyeEE/hagfOhQpegVk3i3zpjjM7ad0YIvzH0Z4z26d2
         cyS7/D1gZmL/qxxK7TbWVBh5ahLLKWo6UhBNK6CYqYUJ7tbjyLXus8N9Zx20JpJ449MU
         7az1dndhG7cGxF5tW6gflW39w1dIfM9QQIqfdXT25CvAWYfbaTtEmuxt9iykNzChYKMT
         W7j9DyfiPpwFEDlhfjr4JAjPryVQh+gks1v/HiF+Yptifqv9q9Y6hiZULRgEyg3jYp8G
         3lNA==
X-Gm-Message-State: AC+VfDyD5y6AmQccbaKwKFJxGz8ZDXhZdfrSkWjvRXGPvajgPYveXhWQ
	t9F0E46Q5KC8+AANcw4cm13rtlGT8FJnbMxD4ek=
X-Google-Smtp-Source: ACHHUZ4CVKtifDi4+WzSFL+LE1wnZ8KVgUrpCw0fYqMVBr+3cNFKRe8Yd9Z4rllzGtfRCipkUzvAew==
X-Received: by 2002:a05:6808:4c8:b0:396:4a76:95b0 with SMTP id a8-20020a05680804c800b003964a7695b0mr4470866oie.6.1686114978087;
        Tue, 06 Jun 2023 22:16:18 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.214])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902ec8a00b001ab0669d84csm9438405plg.26.2023.06.06.22.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:16:13 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 07 Jun 2023 10:46:01 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][master][PATCH] wireshark: Fix CVE-2023-2855 & CVE-2023-2856
Date: Wed,  7 Jun 2023 10:46:00 +0530
Message-Id: <20230607051600.7107-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 05:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103155

Backport fixes for:
* CVE-2023-2855 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb
* CVE-2023-2856 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2855.patch       | 108 ++++++++++++++++++
 .../wireshark/files/CVE-2023-2856.patch       |  69 +++++++++++
 .../wireshark/wireshark_3.4.12.bb             |   2 +
 3 files changed, 179 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch

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
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
new file mode 100644
index 000000000..863421f98
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
@@ -0,0 +1,69 @@
+From db5135826de3a5fdb3618225c2ff02f4207012ca Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Thu, 18 May 2023 15:03:23 -0700
+Subject: [PATCH] vms: fix the search for the packet length field.
+
+The packet length field is of the form
+
+    Total Length = DDD = ^xXXX
+
+where "DDD" is the length in decimal and "XXX" is the length in
+hexadecimal.
+
+Search for "length ". not just "Length", as we skip past "Length ", not
+just "Length", so if we assume we found "Length " but only found
+"Length", we'd skip past the end of the string.
+
+While we're at it, fail if we don't find a length field, rather than
+just blithely acting as if the packet length were zero.
+
+Fixes #19083.
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca]
+CVE: CVE-2023-2856
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/vms.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/wiretap/vms.c b/wiretap/vms.c
+index 0aa83ea..5f5fdbb 100644
+--- a/wiretap/vms.c
++++ b/wiretap/vms.c
+@@ -318,6 +318,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+ {
+     char    line[VMS_LINE_LENGTH + 1];
+     int     num_items_scanned;
++    gboolean have_pkt_len = FALSE;
+     guint32 pkt_len = 0;
+     int     pktnum;
+     int     csec = 101;
+@@ -374,7 +375,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+                 return FALSE;
+             }
+         }
+-        if ( (! pkt_len) && (p = strstr(line, "Length"))) {
++        if ( (! have_pkt_len) && (p = strstr(line, "Length "))) {
+             p += sizeof("Length ");
+             while (*p && ! g_ascii_isdigit(*p))
+                 p++;
+@@ -390,9 +391,15 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+                 *err_info = g_strdup_printf("vms: Length field '%s' not valid", p);
+                 return FALSE;
+             }
++            have_pkt_len = TRUE;
+             break;
+         }
+     } while (! isdumpline(line));
++    if (! have_pkt_len) {
++        *err = WTAP_ERR_BAD_FILE;
++        *err_info = g_strdup_printf("vms: Length field not found");
++        return FALSE;
++    }
+     if (pkt_len > WTAP_MAX_PACKET_SIZE_STANDARD) {
+         /*
+          * Probably a corrupt capture file; return an error,
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 693a16793..ff99a7508 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -16,6 +16,8 @@ SRC_URI += " \
     file://0003-bison-Remove-line-directives.patch \
     file://0004-lemon-Remove-line-directives.patch \
     file://CVE-2022-3190.patch \
+    file://CVE-2023-2855.patch \
+    file://CVE-2023-2856.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


