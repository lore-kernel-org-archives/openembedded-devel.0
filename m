Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D23D1BDF6
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27232.1764797394312510812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFtyWwH2;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so2199035e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797393; x=1765402193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+ZctfLjGy0PWmY2yPVMlaMiSAPlAp17juBZRKeGlPk=;
        b=RFtyWwH2sa/UQ2ZJJ5IxGJxUv8cWX2CYTHvImy32YA21VsSvt4Au3EhlEHq+yrNq46
         QoCsIMp1NDKN+Vb0spXXJT33uaTwHXZwKQ4mlkY7S/Yu8jvYAb9Q6CbdJiRsQahklgAt
         hmHkKoDrXKDjZkX0ynbAT9eR7roQRCCCufopSLXUuwnZgOoOWiRODdbP+4hpE9EGPL9x
         mMVCYsjlK9K3u2c7N071Rr2pQMDBvTLUxauuvacdiJcmeCx1hPdrTYf0mUI1iNYhSZTZ
         x23WiJJpfZ2gnKvah9blL5MYVLFGGohhxJ3X45NbhlUOejQuosDnjsRwvjertz4dwzw+
         NU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797393; x=1765402193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+ZctfLjGy0PWmY2yPVMlaMiSAPlAp17juBZRKeGlPk=;
        b=IS3eVugOQ6zzvibBHtJSTrJmS8nbOrX0cG5F3IjZ/QArDzPIuepRj08hLRQBj1xvtD
         SE+M6pglT+Iuw6DT9hnsj+yMA8uIS9ROaH9ufZU8j5rbOAMW0A/ANlOyqSUm0bME8093
         AZH/l20067Ap/XAYjhplKfC5YF/UckCAChwHXhnw/8ZUhFwK9IX3ECSy5qB23PvVCcgu
         E5dQ3UH1EjepxgEZydmmMFeOHEfzVb/ahuKTe/3sq1tFrlDb5V3iyWDKzsyxFe2cWGjq
         hcZcJWeZB2ybQUh4ndq0ezgzGQ8htcjH8XMFbePcRpZuffEsJpc9sm1hjVFkY9ekDWpw
         rbpw==
X-Gm-Message-State: AOJu0YxvH6muDUk/SPHMP0FT7tJaBXCeSNYv4ad8Sls+Zdkc2wbMvNxg
	71zkAsBa8/EkEdJTwaQDGLYSfL+LY8aIUljSlnox3bEeY77DSTOpRyxb0jyeJQ==
X-Gm-Gg: ASbGnctXTk8ylZIk5gESTVf3LM9YArDnCPhTDOZV14Qmuktk6PIUhDW62hmI2wFIrBD
	t50clx9Q+G3d3MI4t9HBYlMRInBdCWxEhka00lapEaQJfh9XIqBJV2/lSRiowqzQHwen0Tjx9aP
	zOLBkdv+UBTg+OsVFPF6ZV6fJOTWEeP3jldXRrJ85M3BG34h5JCJAvYOisq7Gev/nvQYVK53LxS
	PvoQbNO49EySmQVFvToFZVAPbBMKdLxJzbt4OH2bjkDarcxqFckoH1EZzMjEw3HDZZCg82yl3QY
	k8vjIAY9tlsLf5FpSzdtk+OsUdX5HWfaeHobow86CVzoMXJEsXouQ4z/OIbb64jvam3vssfqWSC
	LrWrZX8yRKsvgmjSqC4Z529S90Wj0MhQYDhDc8AhxNZHEhex6uHA28Jz1jJR6kf6Nwddv+qxPZL
	+0/wkx7qSi
X-Google-Smtp-Source: AGHT+IEYJbwqycqbsni+HZkzDhiupHuAbuhzW44RSp3b2+oxteGOzyJD0DN35jnZBqvxNTMk8ZwF0g==
X-Received: by 2002:a05:600c:4504:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-4792f380e9amr5217455e9.20.1764797392527;
        Wed, 03 Dec 2025 13:29:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 04/12] xrdp: patch CVE-2022-23479
Date: Wed,  3 Dec 2025 22:29:41 +0100
Message-ID: <20251203212949.4046524-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122282

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23479

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23479.patch            | 83 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
new file mode 100644
index 0000000000..62fa83b83f
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
@@ -0,0 +1,83 @@
+From 60864014b733c10881c078048560858067fe5d0f Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 09:44:56 +0000
+Subject: [PATCH] CVE-2022-23479
+
+Detect attempts to overflow input buffer
+
+If application code hasn't properly sanitised the header_size
+for a transport, it is possible for read requests to be issued
+which overflow the input buffer. This change detects this
+at a low level and bounces the read request.
+
+CVE: CVE-2022-23479
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/60864014b733c10881c078048560858067fe5d0f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ common/trans.c | 19 +++++++++++++++----
+ common/trans.h |  2 +-
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/common/trans.c b/common/trans.c
+index 55d2a63812..1d2d3e68ae 100644
+--- a/common/trans.c
++++ b/common/trans.c
+@@ -297,8 +297,8 @@ trans_check_wait_objs(struct trans *self)
+     tbus in_sck = (tbus) 0;
+     struct trans *in_trans = (struct trans *) NULL;
+     int read_bytes = 0;
+-    int to_read = 0;
+-    int read_so_far = 0;
++    unsigned int to_read = 0;
++    unsigned int read_so_far = 0;
+     int rv = 0;
+     enum xrdp_source cur_source;
+ 
+@@ -369,13 +369,24 @@ trans_check_wait_objs(struct trans *self)
+         }
+         else if (self->trans_can_recv(self, self->sck, 0))
+         {
++            /* CVE-2022-23479 - check a malicious caller hasn't managed
++             * to set the header_size to an unreasonable value */
++            if (self->header_size > (unsigned int)self->in_s->size)
++            {
++                LOG(LOG_LEVEL_ERROR,
++                    "trans_check_wait_objs: Reading %u bytes beyond buffer",
++                    self->header_size - (unsigned int)self->in_s->size);
++                self->status = TRANS_STATUS_DOWN;
++                return 1;
++            }
++
+             cur_source = XRDP_SOURCE_NONE;
+             if (self->si != 0)
+             {
+                 cur_source = self->si->cur_source;
+                 self->si->cur_source = self->my_source;
+             }
+-            read_so_far = (int) (self->in_s->end - self->in_s->data);
++            read_so_far = self->in_s->end - self->in_s->data;
+             to_read = self->header_size - read_so_far;
+ 
+             if (to_read > 0)
+@@ -415,7 +426,7 @@ trans_check_wait_objs(struct trans *self)
+                 }
+             }
+ 
+-            read_so_far = (int) (self->in_s->end - self->in_s->data);
++            read_so_far = self->in_s->end - self->in_s->data;
+ 
+             if (read_so_far == self->header_size)
+             {
+diff --git a/common/trans.h b/common/trans.h
+index 1cd89fdac2..313c543b60 100644
+--- a/common/trans.h
++++ b/common/trans.h
+@@ -98,7 +98,7 @@ struct trans
+     ttrans_data_in trans_data_in;
+     ttrans_conn_in trans_conn_in;
+     void *callback_data;
+-    int header_size;
++    unsigned int header_size;
+     struct stream *in_s;
+     struct stream *out_s;
+     char *listen_filename;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index e28f457e87..1900b1e842 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
            file://CVE-2022-23478.patch \
+           file://CVE-2022-23479.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

