Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE9AEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 06:28:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.7027.1687847320783639155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 23:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KWrNATzv;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so1738138a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 23:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687847320; x=1690439320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s5lpWM6xWFno6XYVxSdOekK1X/S7OY5GRBkPKhrrJE=;
        b=KWrNATzvIUgaHICBQ1IPd06KnC8+l4uCkvnRYotPixcIbA8diELJCrwRUcKx9aAauK
         3v62pUo+ntcY91a02Z+bcVP+L8zeXnMu5EEt0Cy5B2ps2QH5TGmHFQGbnM9ygY/Edfa6
         DAud8woa9OXVlRTQTnbcj0SbxTaSQrk9hLx6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687847320; x=1690439320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s5lpWM6xWFno6XYVxSdOekK1X/S7OY5GRBkPKhrrJE=;
        b=j//uXdX/oahBgBxDup4A2gdaHwcjFaQQggpl9EP1aw3kysbqmNaplZvIsSUuaUhPPu
         G93waOZ0Mp0ynIkDiapX8OGJYQXcU0Jnh9Mpn/25Ati06eUiARjlDPGpvepw6pzrdxhH
         eKCyiBn3byGa69nk/WiIm0HJ0KP/c7UpbZvuND7NQcjJ8ZInapRwJcr2wekTJN7kqlxx
         /S2C3qIF38LmFzJ+PwZY9Z3zWgieMiV+fH8h4TX6tBKD9bV6da0LJbbuNpf7cztgHspe
         IFQU04r7SsjSh6oH2sO51bGl637dxk91F/jiEVM/z7DUOH7qfQDgzgRATCGZ7WaCf/Tv
         DG4g==
X-Gm-Message-State: AC+VfDz6q8rZexZlCmDf8rrhqmAzP8ikapZF7MRnhZqC3OvKJzprVN30
	SkPcUINb/E5WUL6oKGdmwxg4Apu99Lb6dxMekzU=
X-Google-Smtp-Source: ACHHUZ4q0/LxzwReq+m5qGhirIzMiL+1PkYDo6HXsimUU1T9tuRaGHPpcOQYHqdkzPdJXNXtA1/vvQ==
X-Received: by 2002:a17:90b:1c09:b0:263:312:611f with SMTP id oc9-20020a17090b1c0900b002630312611fmr2796561pjb.3.1687847319368;
        Mon, 26 Jun 2023 23:28:39 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a01d500b0025e2358f146sm7433699pjd.13.2023.06.26.23.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 23:28:38 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 27 Jun 2023 11:58:33 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Fix Multiple CVEs
Date: Tue, 27 Jun 2023 11:58:32 +0530
Message-Id: <20230627062832.180594-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 06:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103593

Backport fixes for:
* CVE-2023-2855 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/0181fafb2134a177328443a60b5e29c4ee1041cb
* CVE-2023-2856 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca
* CVE-2023-2858 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/cb190d6839ddcd4596b0205844f45553f1e77105
* CVE-2023-2952 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2855.patch       | 117 ++++++++++++++++++
 .../wireshark/files/CVE-2023-2856.patch       |  68 ++++++++++
 .../wireshark/files/CVE-2023-2858.patch       |  94 ++++++++++++++
 .../wireshark/files/CVE-2023-2952.patch       |  97 +++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |   8 +-
 5 files changed, 382 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
new file mode 100644
index 0000000000..a6370f91cf
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
@@ -0,0 +1,117 @@
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/candump.c | 47 ++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 34 insertions(+), 13 deletions(-)
+
+diff --git a/wiretap/candump.c b/wiretap/candump.c
+index 3eb17dd..954b509 100644
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
+@@ -57,9 +58,20 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+ 
+     if (msg->is_fd)
+     {
+-        canfd_frame_t canfd_frame;
++        canfd_frame_t canfd_frame = {0};
++
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
+ 
+-        memset(&canfd_frame, 0, sizeof(canfd_frame));
+         canfd_frame.can_id = msg->id;
+         canfd_frame.flags  = msg->flags;
+         canfd_frame.len    = msg->data.length;
+@@ -69,10 +81,21 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+     }
+     else
+     {
+-        can_frame_t can_frame;
++        can_frame_t can_frame = {0};
++
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
+ 
+-        memset(&can_frame, 0, sizeof(can_frame));
+-        can_frame.can_id  = msg->id;
++	can_frame.can_id  = msg->id;
+         can_frame.can_dlc = msg->data.length;
+         memcpy(can_frame.data, msg->data.data, msg->data.length);
+ 
+@@ -86,6 +109,8 @@ candump_write_packet(wtap_rec *rec, Buffer *buf, const msg_t *msg)
+ 
+     rec->rec_header.packet_header.caplen = packet_length;
+     rec->rec_header.packet_header.len    = packet_length;
++
++    return TRUE;
+ }
+ 
+ static gboolean
+@@ -193,9 +218,7 @@ candump_read(wtap *wth, wtap_rec *rec, Buffer *buf, int *err, gchar **err_info,
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
+@@ -219,9 +242,7 @@ candump_seek_read(wtap *wth , gint64 seek_off, wtap_rec *rec,
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
index 0000000000..1fb75353b4
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
@@ -0,0 +1,68 @@
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/vms.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/wiretap/vms.c b/wiretap/vms.c
+index 84e3def..fa77689 100644
+--- a/wiretap/vms.c
++++ b/wiretap/vms.c
+@@ -310,6 +310,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+ {
+     char    line[VMS_LINE_LENGTH + 1];
+     int     num_items_scanned;
++    gboolean have_pkt_len = FALSE;
+     guint32 pkt_len = 0;
+     int     pktnum;
+     int     csec = 101;
+@@ -366,7 +367,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+                 return FALSE;
+             }
+         }
+-        if ( (! pkt_len) && (p = strstr(line, "Length"))) {
++        if ( (! have_pkt_len) && (p = strstr(line, "Length "))) {
+             p += sizeof("Length ");
+             while (*p && ! g_ascii_isdigit(*p))
+                 p++;
+@@ -382,9 +383,15 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
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
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
new file mode 100644
index 0000000000..150b4609bb
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
@@ -0,0 +1,94 @@
+From cb190d6839ddcd4596b0205844f45553f1e77105 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Fri, 19 May 2023 16:29:45 -0700
+Subject: [PATCH] netscaler: add more checks to make sure the record is within
+ the page.
+
+Whie we're at it, restructure some other checks to test-before-casting -
+it's OK to test afterwards, but testing before makes it follow the
+pattern used elsewhere.
+
+Fixes #19081.
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/cb190d6839ddcd4596b0205844f45553f1e77105]
+CVE: CVE-2023-2858
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/netscaler.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/wiretap/netscaler.c b/wiretap/netscaler.c
+index 93da9a2..f835dfa 100644
+--- a/wiretap/netscaler.c
++++ b/wiretap/netscaler.c
+@@ -1082,13 +1082,13 @@ static gboolean nstrace_set_start_time(wtap *wth, int *err, gchar **err_info)
+ 
+ #define PACKET_DESCRIBE(rec,buf,FULLPART,fullpart,ver,type,HEADERVER) \
+     do {\
+-        nspr_pktrace##fullpart##_v##ver##_t *type = (nspr_pktrace##fullpart##_v##ver##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Make sure the record header is entirely contained in the page */\
+-        if ((nstrace_buflen - nstrace_buf_offset) < sizeof *type) {\
++        if ((nstrace_buflen - nstrace_buf_offset) < sizeof(nspr_pktrace##fullpart##_v##ver##_t)) {\
+             *err = WTAP_ERR_BAD_FILE;\
+             *err_info = g_strdup("nstrace: record header crosses page boundary");\
+             return FALSE;\
+         }\
++        nspr_pktrace##fullpart##_v##ver##_t *type = (nspr_pktrace##fullpart##_v##ver##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Check sanity of record size */\
+         if (pletoh16(&type->nsprRecordSize) < sizeof *type) {\
+             *err = WTAP_ERR_BAD_FILE;\
+@@ -1153,6 +1153,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 case NSPR_ABSTIME_V10:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1166,6 +1168,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 case NSPR_RELTIME_V10:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1183,6 +1187,8 @@ static gboolean nstrace_read_v10(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+                 default:
+                 {
++                    if (!nstrace_ensure_buflen(nstrace, nstrace_buf_offset, sizeof(nspr_pktracefull_v10_t), err, err_info))
++                        return FALSE;
+                     nspr_pktracefull_v10_t *fp = (nspr_pktracefull_v10_t *) &nstrace_buf[nstrace_buf_offset];
+                     if (pletoh16(&fp->nsprRecordSize) == 0) {
+                         *err = WTAP_ERR_BAD_FILE;
+@@ -1466,14 +1472,14 @@ static gboolean nstrace_read_v20(wtap *wth, wtap_rec *rec, Buffer *buf,
+ 
+ #define PACKET_DESCRIBE(rec,buf,FULLPART,ver,enumprefix,type,structname,HEADERVER)\
+     do {\
+-        nspr_##structname##_t *fp = (nspr_##structname##_t *) &nstrace_buf[nstrace_buf_offset];\
+         /* Make sure the record header is entirely contained in the page */\
+-        if ((nstrace->nstrace_buflen - nstrace_buf_offset) < sizeof *fp) {\
++        if ((nstrace->nstrace_buflen - nstrace_buf_offset) < sizeof(nspr_##structname##_t)) {\
+             *err = WTAP_ERR_BAD_FILE;\
+             *err_info = g_strdup("nstrace: record header crosses page boundary");\
+             g_free(nstrace_tmpbuff);\
+             return FALSE;\
+         }\
++        nspr_##structname##_t *fp = (nspr_##structname##_t *) &nstrace_buf[nstrace_buf_offset];\
+         (rec)->rec_type = REC_TYPE_PACKET;\
+         TIMEDEFV##ver((rec),fp,type);\
+         FULLPART##SIZEDEFV##ver((rec),fp,ver);\
+@@ -1580,7 +1586,6 @@ static gboolean nstrace_read_v30(wtap *wth, wtap_rec *rec, Buffer *buf,
+                 g_free(nstrace_tmpbuff);
+                 return FALSE;
+             }
+-
+             hdp = (nspr_hd_v20_t *) &nstrace_buf[nstrace_buf_offset];
+             if (nspr_getv20recordsize(hdp) == 0) {
+                 *err = WTAP_ERR_BAD_FILE;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
new file mode 100644
index 0000000000..82098271ec
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
@@ -0,0 +1,97 @@
+From ce87eac0325581b600b3093fcd75080df14ccfda Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Tue, 23 May 2023 13:52:03 -0700
+Subject: [PATCH] XRA: Fix an infinite loop
+
+C compilers don't care what size a value was on the wire. Use
+naturally-sized ints, including in dissect_message_channel_mb where we
+would otherwise overflow and loop infinitely.
+
+Fixes #19100
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5]
+CVE: CVE-2023-2952
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-xra.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/epan/dissectors/packet-xra.c b/epan/dissectors/packet-xra.c
+index f59d899..6c1445f 100644
+--- a/epan/dissectors/packet-xra.c
++++ b/epan/dissectors/packet-xra.c
+@@ -478,7 +478,7 @@ dissect_xra_tlv_cw_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
+   it = proto_tree_add_item (tree, hf_xra_tlv_cw_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_cw_info_tree = proto_item_add_subtree (it, ett_xra_tlv_cw_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -533,7 +533,7 @@ dissect_xra_tlv_ms_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
+   it = proto_tree_add_item (tree, hf_xra_tlv_ms_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_ms_info_tree = proto_item_add_subtree (it, ett_xra_tlv_ms_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -567,7 +567,7 @@ dissect_xra_tlv_burst_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, gu
+   it = proto_tree_add_item (tree, hf_xra_tlv_burst_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_burst_info_tree = proto_item_add_subtree (it, ett_xra_tlv_burst_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -607,7 +607,7 @@ dissect_xra_tlv(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* da
+   it = proto_tree_add_item (tree, hf_xra_tlv, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_tree = proto_item_add_subtree (it, ett_xra_tlv);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   tvbuff_t *xra_tlv_cw_info_tvb, *xra_tlv_ms_info_tvb, *xra_tlv_burst_info_tvb;
+ 
+   while (tlv_index < tlv_length) {
+@@ -751,7 +751,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
+   if(packet_start_pointer_field_present) {
+     proto_tree_add_item_ret_uint (tree, hf_plc_mb_mc_psp, tvb, 1, 2, FALSE, &packet_start_pointer);
+ 
+-    guint16 docsis_start = 3 + packet_start_pointer;
++    unsigned docsis_start = 3 + packet_start_pointer;
+     while (docsis_start + 6 < remaining_length) {
+       /*DOCSIS header in packet*/
+       guint8 fc = tvb_get_guint8(tvb,docsis_start + 0);
+@@ -760,7 +760,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
+         docsis_start += 1;
+         continue;
+       }
+-      guint16 docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
++      unsigned docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
+       if (docsis_start + 6 + docsis_length <= remaining_length) {
+         /*DOCSIS packet included in packet*/
+         tvbuff_t *docsis_tvb;
+@@ -830,7 +830,7 @@ dissect_ncp_message_block(tvbuff_t * tvb, proto_tree * tree) {
+ static int
+ dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _U_) {
+ 
+-  guint16 offset = 0;
++  int offset = 0;
+   proto_tree *plc_tree;
+   proto_item *plc_item;
+   tvbuff_t *mb_tvb;
+@@ -890,7 +890,7 @@ dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _
+ 
+ static int
+ dissect_ncp(tvbuff_t * tvb, proto_tree * tree, void* data _U_) {
+-  guint16 offset = 0;
++  int offset = 0;
+   proto_tree *ncp_tree;
+   proto_item *ncp_item;
+   tvbuff_t *ncp_mb_tvb;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index f9e22141c4..f80f287ab4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -9,8 +9,12 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
 SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz \
-           file://fix_lemon_path.patch "
-
+           file://fix_lemon_path.patch \
+           file://CVE-2023-2855.patch \
+           file://CVE-2023-2856.patch \
+           file://CVE-2023-2858.patch \
+           file://CVE-2023-2952.patch \
+           "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
 SRC_URI[sha256sum] = "bbe75d909b052fcd67a850f149f0d5b1e2531026fc2413946b48570293306887"
-- 
2.25.1


