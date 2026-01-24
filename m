Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4AAD715D6
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14206.1769236213412069078
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mSbKWpRc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso32913275e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236212; x=1769841012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzgvOFpIVoJISX1MkLnPuhEpEG/ZyGRmZNv6oeMprrk=;
        b=mSbKWpRcz2+WRW1eukPZCIsdxD7mOSwc9rdAvpno6qTGlZPI0Wesd/fGwYucJez60K
         s+tN172x+Io8JoFXK8E6NC404ZclyLOYLW/S/4/QdDjhVfmfg6Mt8gf1lPlw6xGIRtOS
         Z90qfD/xp6XfiZO7jmzzjjflJ83xK7gsrBBa4Bo22yWXSqXHtKgT2eBVz6umNz6UGb1x
         zYSRNYrTEaw9ujAaai/hFpmLDoFFGgwza8aHKfNdpjQNyOOaz0eTz1HF/OYAVD+RQ0ju
         jvmDif6cKqf6io3v4VujX8s2SJ9p899fUzg+xNZhP3zhf27wrtRPI9RdvHDPpve9F5Bj
         AY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236212; x=1769841012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lzgvOFpIVoJISX1MkLnPuhEpEG/ZyGRmZNv6oeMprrk=;
        b=OACsdiYdVZlKu+fIwYWlvbTC4Swx43zJtpNRh/z7ub99BeLL2PndqOZJLJBYhopilX
         luSUsDY5wh7nWF65MZF+1oWbQZpqeijqUxxxXOqdjs0PNi17VRUmZFdKioO9jw1MSkmi
         AvilaEqEliujCmOah18FU2ds0w+m2c0JhQZCtwJVHJlCTJplY0rxnJWpsNhZcRzHl42C
         4X2v2pM22fX73JHV8PNyRenoXV3UvuwedTc66dm8+zQaSmzdHEK0wbAHwmwxSzIU/vs0
         c71tsSiwB+tH3kXOlzaMplZIQRnClxNQEc5F8BXP4L3Fti5dcSwl9j2Gj54D0Glt/pUP
         VkHQ==
X-Gm-Message-State: AOJu0YwcQm1ASpWwL2Ht8RlwGjlRc75aOOTxVKvJExwfcrgfGVrmazZE
	dmXrtXNkNAGPjS6bTLaIZgXIktA3S/F5OfAg5OmIQBTvZrGGv0pVs/il03ZP2Q==
X-Gm-Gg: AZuq6aI4IKu6CsH9DvVW0qj4n3T5oN3Jn41dRp7bQPnb19DuhmE88eHPjLjGY8ehtcb
	yC/nP8AivLkGXQhRif4mQyejQFdJdFuQj6ZYcLMLHaeOL2JBxwZr5VupGBIt64dSyS0rsUI2wsT
	x6ITSJoFzzKJ9MrVaCLtMMFdkqpbVlevo11tJGCTdDOqmRp4cuyGteVEK+Ra1HAXMSPYePCyfC5
	e51AyLEemXRdVJ/oNovWMcWpVwkUFu6QhnKA8lOlEpnfmXWnrScd5rGucCuiMcXVa+nAj091OMx
	R+Ye+HGrSoluYmkrJyOBOH39dnxgAlYBvUJi3rctnmazKTn8J2efHq26+wwReXjlw8tPoDwQ1gv
	N+YEIsO6iAeM1NQSSc4Vl9ZXAA8wpNU0/HWealo9pgRQyJtdEgf0TIS7RNLYHvy8q0XSyoMndg9
	hT6thggXuV
X-Received: by 2002:a05:600c:a10e:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-4804f823613mr61478525e9.31.1769236211701;
        Fri, 23 Jan 2026 22:30:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 06/13] xrdp: patch CVE-2022-23480
Date: Sat, 24 Jan 2026 07:30:00 +0100
Message-ID: <20260124063007.28313-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123812

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23480

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 71e9d02b125578593eebde2422223a9ede7265f6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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
index ea895f169e..e50accfe17 100644
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

