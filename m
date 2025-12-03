Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330AAD1BDEB
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27327.1764797397212508797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAxxHV1D;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2e6aa22fso114719f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797395; x=1765402195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJBxjZeRoN+q8vM4uOYUDEydyDLZyUo9RvA7McG4z34=;
        b=fAxxHV1D+7TZOhXQIwR8v2rc/CFnCUfEupa7BgPHbRNVtf+rjE217q4FUz2PNwTKDC
         S5ZQpRw7son7LuhydIoIoZXCKxdwqMMOCbnVekV8Y+RMX1SMKcim5W2ziijboo195fm0
         B25pNdlmYfjCEJDyL5u4XDbhHPHhLSmwLz+YN0qDDN6+nrKvxh5eBwL4h+S600LudvRk
         rNSEUL0BSHKdx9B4jPUzN6nXzC58r+cqoTRkpCeJw5GeSSinBzh5Sdlq4uW7AAnWwU5L
         Qi0xGnzSZGyTxGcj6FeT3450fg7vPzu4VqkfnNOL51+SguFtDZ+mQ1xhVKv5fwgicqrK
         oWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797395; x=1765402195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJBxjZeRoN+q8vM4uOYUDEydyDLZyUo9RvA7McG4z34=;
        b=jbmLrVbtiXX/jN18rfEgXSPKhVrDl1Hg7j5vfC+vsipepCq+929XRwMoPfkOlStxiV
         jISUfRpKbow6+6znGacB60KTopNNlYtarQhQUt3LeSh36qeRwtNFgnlm+YjPwRXfILk5
         2iCIvWXNNDV4B7d1G3w4KO+oGroI63hLrslTFs539ngBbIjWV75f8Gh6E/fzoJMxJ4jS
         ofsRwIc1sJPC8ZQIy5SyVFLqYHa/Ae71/n1xsuS3P3t6ltOyVEcN5devhzfZbDeqtGyw
         aR4PKgrRQXjPG5OmxRJKqBku9ZCQ2x1qMMGndJFfnLhvt6aIr0a71puD6WyYZnltd+dd
         ASIQ==
X-Gm-Message-State: AOJu0Yy/Xr0Vh0aFvdtSdaGDOZVhmTqj3T70s6H8+WdJyGEAjrcyBhk5
	49d5OLpcPC7t3ELIrLQQEx6rXeZwmlaV6taV9c3uinta2tKW21evJYRd2S8IHw==
X-Gm-Gg: ASbGnctnQUKopg866oKLWsH8dVZwXv4UBlvvoj2yzOjIivfg3k9jhcd6v3jdmc+7UiC
	uYK97GR8dGyunSiWGtna08T9eKZIYri5pMyDxs1KdcUJ0bWA+rWh6VH1iYex6eHo2o2FMBjtRp5
	uc7ELf4BWBHNboZBo/5SRAwhWkR+v2lAw6+pds4qEttikkvT0sMA8D2iBqbcNSwN/pKFyWq92Sp
	jLtZhKAYnsx99B6joD/WO7SAfKxMOe4GVmC6tpZFUTF2THfCtKRb+Uaf8iqQjc0X37B064+waCK
	53jRjsxB5VHaeS1HCeRYtznaKnwtbNymI8poE/nf8nyklwA78NStYO+ipo0sm1vEdAbWZwU9zbT
	M+AuFLhIOQTVmnLOYEdSy7MTY6OdvtSYUPmiUnC3s2g==
X-Google-Smtp-Source: AGHT+IE68zNw1yz9ofyOkThMVUOPZ9PXb5mZzosuVuSHfLUphKAuQCfEZCsIx/8Jp6KWfh4slSqycQ==
X-Received: by 2002:a05:6000:220b:b0:429:cbba:b246 with SMTP id ffacd0b85a97d-42f794b35a0mr542589f8f.0.1764797395513;
        Wed, 03 Dec 2025 13:29:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 08/12] xrdp: patch CVE-2022-23483
Date: Wed,  3 Dec 2025 22:29:45 +0100
Message-ID: <20251203212949.4046524-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122286

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23483

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23483.patch            | 65 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
new file mode 100644
index 0000000000..6c488f7e3e
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
@@ -0,0 +1,65 @@
+From 35cca701c753db65d3c05b7ea4fff9bd09e76661 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:21:41 +0000
+Subject: [PATCH] CVE-2022-23483
+
+Sanitise channel data being passed from application
+
+Avoids OOB read if the size field is incorrect.
+
+CVE: CVE-2022-23483
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/35cca701c753db65d3c05b7ea4fff9bd09e76661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ xrdp/xrdp_mm.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..64ae229e01 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -676,22 +676,31 @@ xrdp_mm_trans_send_channel_setup(struct xrdp_mm *self, struct trans *trans)
+ static int
+ xrdp_mm_trans_process_channel_data(struct xrdp_mm *self, struct stream *s)
+ {
+-    int size;
+-    int total_size;
++    unsigned int size;
++    unsigned int total_size;
+     int chan_id;
+     int chan_flags;
+-    int rv;
+-
+-    in_uint16_le(s, chan_id);
+-    in_uint16_le(s, chan_flags);
+-    in_uint16_le(s, size);
+-    in_uint32_le(s, total_size);
+-    rv = 0;
++    int rv = 0;
+ 
+-    if (rv == 0)
++    if (!s_check_rem_and_log(s, 10, "Reading channel data header"))
++    {
++        rv = 1;
++    }
++    else
+     {
+-        rv = libxrdp_send_to_channel(self->wm->session, chan_id, s->p, size, total_size,
+-                                     chan_flags);
++        in_uint16_le(s, chan_id);
++        in_uint16_le(s, chan_flags);
++        in_uint16_le(s, size);
++        in_uint32_le(s, total_size);
++        if (!s_check_rem_and_log(s, size, "Reading channel data data"))
++        {
++            rv = 1;
++        }
++        else
++        {
++            rv = libxrdp_send_to_channel(self->wm->session, chan_id,
++                                         s->p, size, total_size, chan_flags);
++        }
+     }
+ 
+     return rv;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 29245f3747..f9e2105500 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
+           file://CVE-2022-23483.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

