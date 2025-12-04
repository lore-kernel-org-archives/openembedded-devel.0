Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84BFD1D893
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38413.1764835000720946885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNl+zB0v;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e29739ff1so247801f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834999; x=1765439799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6d9b6BV6xgHJ5hlTWk7qqnzVKoNRksdQ3oWh1lKLm/Y=;
        b=jNl+zB0vkur7cVNHZKKOPzYxEyJXnncc5fPOuVwSnkRgF59w9E8gEL68ujTkJ+RCaG
         UHRHx+JQ06Xsii89KeacocDvVq9KOKF4SXrZKiCRCj1qTwTz5dcY9hdt7r7YluOGOEMS
         SmqY2e+VSIs6YcbOCMEsqrQwx7Uvz+WGvEkEQXr6EA+RY2vReKrBn0pMy5k/ZndWWx7d
         U4GkfnDH99L2ypew3zF4+PKJh3fYBV3FgX2NXYPKbEW0ENGJh7J3QYBTVkJY4KeEeKJf
         JPX0Adyx8PQySj95yWOvowfiZ23h71YDvWFyFU8dwDIIUxHiWF/qTXx/67FQyhojrmhe
         3exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834999; x=1765439799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6d9b6BV6xgHJ5hlTWk7qqnzVKoNRksdQ3oWh1lKLm/Y=;
        b=ceHYbosHw18l9AyAEe3OAVHLlGCemFINtKXXPtQecapwtGMzk6u76ovuuc7+pxpmbz
         aLuPCfaQYkcCrrJKOTof+SRuaOY7JT1aGF3Udohdaq2O/3+NYIULTgxA1kjM1SBQ9yUB
         vibbHfJH3bG+FggG2tcb+vbv5ed48mTj/KV5n5aCmZENKf+1u+zWhEyLOfRJqjxTcTxk
         n0XJZkXo9O5DcjhYW5WXfiTVW4QjqJPsRxj5z1VMu61ntvwuoxGNus4AJ92zDHIn7YrI
         gVPMf8dTVTRu8GZ5FvGxbhSEa4rxolSqMV19NwnfTWUNYI3wQf6kY+3TyhgtQeJB8T8U
         VuAA==
X-Gm-Message-State: AOJu0Yx7rapbooA5DB44GFk+ThakqaHq2/R4OlDQmN8RogBE+fiDDW75
	tuVbOlHqNtKWytwOmcm/DLj4IZlIf4vUAskKYwX32yf9SbztCv6ZRdeKkEspTw==
X-Gm-Gg: ASbGncvBcz+HrkwZEY9T/oWdjrXCghPIBUCDsrq/yHFtnB5JcZEdjMfky8qkWStnzvS
	HgVWkJMxwExv8ZmJ8TM7oFZlkACY6SIW3XNJ4zsajrJOszmJu8QVHLGYr9ttwOjxEEvdYKYDJHw
	7H1kFF7ZAa4VHqw2GKTM1+Gfx41brq16PlJGHCKEjITJcL2dK683iAcmNVVfxe0COyP2mVJ7NBN
	0FG6a1XWYl61/m7JjlnkwYvUjz0cSOgRYe4ShqcZDvCYm5JJc7VGQgx+IBzhXhN+uCjDy6P849I
	45jUj1Ouyiac/VvhyCT81cs/ORRls6Nyc3HJeMtaic9B1AG7dBPOY82/5GEIeIyd6uLfW7V/Rb1
	V5tBPx5FGn74z70KI85hlIbMiE2XnuYRJ0zPKwjZws8w7LDseC2mXJDYM5ttULIttGntctIsZnf
	jZazs6yOwT
X-Google-Smtp-Source: AGHT+IEKEB80aXMrBPgfu8D0PWuqwAB4YmhIcpQ9/b0f2aVFQZSmVvgZ3ea29gzq7fTfO+bmU1pytg==
X-Received: by 2002:a5d:67ce:0:b0:42b:2eb3:c92a with SMTP id ffacd0b85a97d-42f78772726mr1770822f8f.12.1764834998991;
        Wed, 03 Dec 2025 23:56:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 05/12] xrdp: patch CVE-2022-23480
Date: Thu,  4 Dec 2025 08:56:28 +0100
Message-ID: <20251204075635.1088007-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122307

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23480

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23480-1.patch          | 356 ++++++++++++++++++
 .../xrdp/xrdp/CVE-2022-23480-2.patch          |  54 +++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |   2 +
 3 files changed, 412 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
new file mode 100644
index 0000000000..259044eb00
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
@@ -0,0 +1,356 @@
+From 7ad7b05261c698b867c7c4f1bfffb4f911036847 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Tue, 6 Dec 2022 12:48:57 +0000
+Subject: [PATCH] CVE-2022-23480
+
+Added length checking to redirector response parsing
+
+CVE: CVE-2022-23480
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/7ad7b05261c698b867c7c4f1bfffb4f911036847]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/chansrv/devredir.c | 151 +++++++++++++++++++++++++++++++-------
+ 1 file changed, 123 insertions(+), 28 deletions(-)
+
+diff --git a/sesman/chansrv/devredir.c b/sesman/chansrv/devredir.c
+index a44d47e635..7faa9bfc7a 100644
+--- a/sesman/chansrv/devredir.c
++++ b/sesman/chansrv/devredir.c
+@@ -131,10 +131,10 @@ static void devredir_send_server_core_cap_req(void);
+ static void devredir_send_server_clientID_confirm(void);
+ static void devredir_send_server_user_logged_on(void);
+ 
+-static void devredir_proc_client_core_cap_resp(struct stream *s);
+-static void devredir_proc_client_devlist_announce_req(struct stream *s);
+-static void devredir_proc_client_devlist_remove_req(struct stream *s);
+-static void devredir_proc_device_iocompletion(struct stream *s);
++static int devredir_proc_client_core_cap_resp(struct stream *s);
++static int devredir_proc_client_devlist_announce_req(struct stream *s);
++static int devredir_proc_client_devlist_remove_req(struct stream *s);
++static int devredir_proc_device_iocompletion(struct stream *s);
+ static void devredir_proc_query_dir_response(IRP *irp,
+         struct stream *s_in,
+         tui32 DeviceId,
+@@ -323,6 +323,11 @@ devredir_data_in(struct stream *s, int chan_id, int chan_flags, int length,
+     }
+ 
+     /* read header from incoming data */
++    if (!s_check_rem_and_log(ls, 4, "Parsing [MS-RDPEFS] RDPDR_HEADER"))
++    {
++        rv = -1;
++        goto done;
++    }
+     xstream_rd_u16_le(ls, comp_type);
+     xstream_rd_u16_le(ls, pktID);
+ 
+@@ -340,27 +345,34 @@ devredir_data_in(struct stream *s, int chan_id, int chan_flags, int length,
+     switch (pktID)
+     {
+         case PAKID_CORE_CLIENTID_CONFIRM:
+-            xstream_seek(ls, 2);  /* major version, we ignore it */
+-            xstream_rd_u16_le(ls, minor_ver);
+-            xstream_rd_u32_le(ls, g_clientID);
++            if (!s_check_rem_and_log(ls, 6, "Parsing [MS-RDPEFS] DR_CORE_CLIENT_ANNOUNCE_RSP"))
++            {
++                rv = -1;
++            }
++            else
++            {
++                xstream_seek(ls, 2);  /* major version, we ignore it */
++                xstream_rd_u16_le(ls, minor_ver);
++                xstream_rd_u32_le(ls, g_clientID);
+ 
+-            g_client_rdp_version = minor_ver;
++                g_client_rdp_version = minor_ver;
+ 
+-            switch (minor_ver)
+-            {
+-                case RDP_CLIENT_50:
+-                    break;
++                switch (minor_ver)
++                {
++                    case RDP_CLIENT_50:
++                        break;
+ 
+-                case RDP_CLIENT_51:
+-                    break;
++                    case RDP_CLIENT_51:
++                        break;
+ 
+-                case RDP_CLIENT_52:
+-                    break;
++                    case RDP_CLIENT_52:
++                        break;
+ 
+-                case RDP_CLIENT_60_61:
+-                    break;
++                    case RDP_CLIENT_60_61:
++                        break;
++                }
++                // LK_TODO devredir_send_server_clientID_confirm();
+             }
+-            // LK_TODO devredir_send_server_clientID_confirm();
+             break;
+ 
+         case PAKID_CORE_CLIENT_NAME:
+@@ -378,19 +390,19 @@ devredir_data_in(struct stream *s, int chan_id, int chan_flags, int length,
+             break;
+ 
+         case PAKID_CORE_CLIENT_CAPABILITY:
+-            devredir_proc_client_core_cap_resp(ls);
++            rv = devredir_proc_client_core_cap_resp(ls);
+             break;
+ 
+         case PAKID_CORE_DEVICELIST_ANNOUNCE:
+-            devredir_proc_client_devlist_announce_req(ls);
++            rv = devredir_proc_client_devlist_announce_req(ls);
+             break;
+ 
+         case PAKID_CORE_DEVICELIST_REMOVE:
+-            devredir_proc_client_devlist_remove_req(ls);
++            rv = devredir_proc_client_devlist_remove_req(ls);
+             break;
+ 
+         case PAKID_CORE_DEVICE_IOCOMPLETION:
+-            devredir_proc_device_iocompletion(ls);
++            rv = devredir_proc_device_iocompletion(ls);
+             break;
+ 
+         default:
+@@ -727,8 +739,9 @@ devredir_send_drive_dir_request(IRP *irp, tui32 device_id,
+  * @brief process client's response to our core_capability_req() msg
+  *
+  * @param   s   stream containing client's response
++ * @return  0   for success, -1 otherwise
+  *****************************************************************************/
+-static void
++static int
+ devredir_proc_client_core_cap_resp(struct stream *s)
+ {
+     int i;
+@@ -738,15 +751,31 @@ devredir_proc_client_core_cap_resp(struct stream *s)
+     tui32 cap_version;
+     char *holdp;
+ 
++    if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CORE_CAPABLITY_RSP"))
++    {
++        return -1;
++    }
+     xstream_rd_u16_le(s, num_caps);
+     xstream_seek(s, 2);  /* padding */
+ 
+     for (i = 0; i < num_caps; i++)
+     {
+         holdp = s->p;
++        if (!s_check_rem_and_log(s, 8, "Parsing [MS-RDPEFS] CAPABILITY_HEADER"))
++        {
++            return -1;
++        }
+         xstream_rd_u16_le(s, cap_type);
+         xstream_rd_u16_le(s, cap_len);
+         xstream_rd_u32_le(s, cap_version);
++        /* Convert the length to a remaining length. Underflow is possible,
++         * but this is an unsigned type so that's OK */
++        cap_len -= (s->p - holdp);
++        if (cap_len > 0 &&
++                !s_check_rem_and_log(s, cap_len, "Parsing [MS-RDPEFS] CAPABILITY_HEADER length"))
++        {
++            return -1;
++        }
+ 
+         switch (cap_type)
+         {
+@@ -779,11 +808,12 @@ devredir_proc_client_core_cap_resp(struct stream *s)
+                 scard_init();
+                 break;
+         }
+-        s->p = holdp + cap_len;
++        xstream_seek(s, cap_len);
+     }
++    return 0;
+ }
+ 
+-static void
++static int
+ devredir_proc_client_devlist_announce_req(struct stream *s)
+ {
+     unsigned int i;
+@@ -795,12 +825,22 @@ devredir_proc_client_devlist_announce_req(struct stream *s)
+     enum NTSTATUS response_status;
+ 
+     /* get number of devices being announced */
++    if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CORE_DEVICELIST_ANNOUNCE_REQ"))
++    {
++        return -1;
++    }
++
+     xstream_rd_u32_le(s, device_count);
+ 
+     LOG_DEVEL(LOG_LEVEL_DEBUG, "num of devices announced: %d", device_count);
+ 
+     for (i = 0; i < device_count; i++)
+     {
++        if (!s_check_rem_and_log(s, 4 + 4 + 8 + 4,
++                                 "Parsing [MS-RDPEFS] DEVICE_ANNOUNCE"))
++        {
++            return -1;
++        }
+         xstream_rd_u32_le(s, device_type);
+         xstream_rd_u32_le(s, g_device_id);
+         /* get preferred DOS name
+@@ -816,6 +856,12 @@ devredir_proc_client_devlist_announce_req(struct stream *s)
+ 
+         /* Read the device data length from the stream */
+         xstream_rd_u32_le(s, device_data_len);
++        if (device_data_len > 0 && !
++                !s_check_rem_and_log(s, device_data_len,
++                                     "Parsing [MS-RDPEFS] DEVICE_ANNOUNCE devdata"))
++        {
++            return -1;
++        }
+ 
+         switch (device_type)
+         {
+@@ -881,9 +927,11 @@ devredir_proc_client_devlist_announce_req(struct stream *s)
+         devredir_send_server_device_announce_resp(g_device_id,
+                 response_status);
+     }
++
++    return 0;
+ }
+ 
+-static void
++static int
+ devredir_proc_client_devlist_remove_req(struct stream *s)
+ {
+     unsigned int i;
+@@ -891,7 +939,16 @@ devredir_proc_client_devlist_remove_req(struct stream *s)
+     tui32 device_id;
+ 
+     /* get number of devices being announced */
++    if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_DEVICELIST_REMOVE"))
++    {
++        return -1;
++    }
+     xstream_rd_u32_le(s, device_count);
++    if (!s_check_rem_and_log(s, 4 * device_count,
++                             "Parsing [MS-RDPEFS] DR_DEVICELIST_REMOVE list"))
++    {
++        return -1;
++    }
+ 
+     LOG_DEVEL(LOG_LEVEL_DEBUG, "num of devices removed: %d", device_count);
+     {
+@@ -901,9 +958,10 @@ devredir_proc_client_devlist_remove_req(struct stream *s)
+             xfuse_delete_share(device_id);
+         }
+     }
++    return 0;
+ }
+ 
+-static void
++static int
+ devredir_proc_device_iocompletion(struct stream *s)
+ {
+     IRP       *irp       = NULL;
+@@ -914,6 +972,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+     tui32      Length;
+     enum COMPLETION_TYPE comp_type;
+ 
++    if (!s_check_rem_and_log(s, 12, "Parsing [MS-RDPEFS] DR_DEVICE_IOCOMPLETION"))
++    {
++        return -1;
++    }
+     xstream_rd_u32_le(s, DeviceId);
+     xstream_rd_u32_le(s, CompletionId);
+     xstream_rd_u32_le(s, IoStatus32);
+@@ -959,6 +1021,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 }
+                 else
+                 {
++                    if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CREATE_RSP"))
++                    {
++                        return -1;
++                    }
+                     xstream_rd_u32_le(s, irp->FileId);
+                     devredir_send_drive_dir_request(irp, DeviceId,
+                                                     1, irp->pathname);
+@@ -966,6 +1032,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_CREATE_REQ:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CREATE_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, irp->FileId);
+ 
+                 xfuse_devredir_cb_create_file(
+@@ -978,6 +1048,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_OPEN_REQ:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CREATE_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, irp->FileId);
+ 
+                 xfuse_devredir_cb_open_file((struct state_open *) irp->fuse_info,
+@@ -989,7 +1063,15 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_READ:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_READ_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, Length);
++                if (!s_check_rem_and_log(s, Length, "Parsing [MS-RDPEFS] DR_READ_RSP"))
++                {
++                    return -1;
++                }
+                 xfuse_devredir_cb_read_file((struct state_read *) irp->fuse_info,
+                                             IoStatus,
+                                             s->p, Length);
+@@ -997,6 +1079,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_WRITE:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_WRITE_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, Length);
+                 xfuse_devredir_cb_write_file((struct state_write *) irp->fuse_info,
+                                              IoStatus,
+@@ -1019,6 +1105,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_RMDIR_OR_FILE:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CREATE_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, irp->FileId);
+                 devredir_proc_cid_rmdir_or_file(irp, IoStatus);
+                 break;
+@@ -1028,6 +1118,10 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+ 
+             case CID_RENAME_FILE:
++                if (!s_check_rem_and_log(s, 4, "Parsing [MS-RDPEFS] DR_CREATE_RSP"))
++                {
++                    return -1;
++                }
+                 xstream_rd_u32_le(s, irp->FileId);
+                 devredir_proc_cid_rename_file(irp, IoStatus);
+                 break;
+@@ -1051,6 +1145,7 @@ devredir_proc_device_iocompletion(struct stream *s)
+                 break;
+         }
+     }
++    return 0;
+ }
+ 
+ static void
diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
new file mode 100644
index 0000000000..38c444efcf
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
@@ -0,0 +1,54 @@
+From 191ed3e3fa892c7dc26e142c7af7af546fcce87d Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Thu, 8 Dec 2022 14:13:48 +0000
+Subject: [PATCH] Remove unused g_full_name_for_filesystem
+
+Not only was this unused, the way it was read could lead to a
+buffer overflow (CVE-2022-23480)
+
+CVE: CVE-2022-23480
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/191ed3e3fa892c7dc26e142c7af7af546fcce87d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/chansrv/devredir.c | 14 +++++---------
+ 1 file changed, 5 insertions(+), 9 deletions(-)
+
+diff --git a/sesman/chansrv/devredir.c b/sesman/chansrv/devredir.c
+index 7faa9bfc7a..6ce35e34de 100644
+--- a/sesman/chansrv/devredir.c
++++ b/sesman/chansrv/devredir.c
+@@ -103,7 +103,6 @@ int g_is_port_redir_supported = 0;
+ int g_is_drive_redir_supported = 0;
+ int g_is_smartcard_redir_supported = 0;
+ int g_drive_redir_version = 1;
+-char g_full_name_for_filesystem[1024];
+ tui32 g_completion_id = 1;
+ 
+ tui32 g_clientID;           /* unique client ID - announced by client */
+@@ -866,21 +865,18 @@ devredir_proc_client_devlist_announce_req(struct stream *s)
+         switch (device_type)
+         {
+             case RDPDR_DTYP_FILESYSTEM:
+-                /* get device data len */
+-                if (device_data_len)
+-                {
+-                    xstream_rd_string(g_full_name_for_filesystem, s,
+-                                      device_data_len);
+-                }
++                /* At present we don't use the full name - see
++                 * [MS-RDPEFS] 2.2.3.1 for details of the contents */
++                xstream_skip_u8(s, device_data_len);
+ 
+                 LOG(LOG_LEVEL_INFO, "Detected remote drive '%s'",
+                     preferred_dos_name);
+ 
+                 LOG_DEVEL(LOG_LEVEL_DEBUG,
+                           "device_type=FILE_SYSTEM device_id=0x%x dosname=%s "
+-                          "device_data_len=%d full_name=%s", g_device_id,
++                          "device_data_len=%d", g_device_id,
+                           preferred_dos_name,
+-                          device_data_len, g_full_name_for_filesystem);
++                          device_data_len);
+ 
+                 response_status = STATUS_SUCCESS;
+ 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 1900b1e842..55dab2e867 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23477.patch \
            file://CVE-2022-23478.patch \
            file://CVE-2022-23479.patch \
+           file://CVE-2022-23480-1.patch \
+           file://CVE-2022-23480-2.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

