Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E379D715D5
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14297.1769236212703847877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJLa/3Jz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so24607805e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236211; x=1769841011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMMa1wYrR3lumjYbx2XLYwON4fpB3VOGc8Q3lZxtudA=;
        b=EJLa/3Jz1lnQBCTnHbTEctqDK5L2ApxrhY3ZMbJP8pckDYerN815PdbAFoysnlLwTa
         eHFcwUo4kFPnuB+e6QVMTcQ8Lq5EYicniKYQRmiwW30h/wqS7iSZQOFJ7QGmzXJd5yKJ
         dyg+AdDdDEvszQkUF8Y7TTT8neepM6ClvESG1niZSL2TNxGFodEVzK8HJlW68Xg23bHl
         LDwba+Gm+aqYsA8PR8xmKiSA0NCLhiPigAM2W8M7vjR8uzo/85opFIIsgvudZ/o1/uw0
         kZqSf+3ax7Lcx1+FfcKlKKoYVO4U9plmFXdz/jyLu5qFYwZur31N1vqbYOY2GdGyclY0
         9ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236211; x=1769841011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMMa1wYrR3lumjYbx2XLYwON4fpB3VOGc8Q3lZxtudA=;
        b=QPG5qnYEr44FxCRCZJ55vN4/ayN8p3PoBWaIXfqIdt1G0ZFopJgvKT+VH1NMAZDs5n
         zL19+CN9zEcC/e3soiiCKnEqFXQEzRclA3/DF5ohwP0Pl4esUl9DbZ9RjjU9GUJ1qAdi
         uufpPAAQRRNLNNeZQuj2mVQo1iD5J1rUXEdwuUrcTpTSHvdLWz3jpBN2hGcnK3FJmDBq
         yhfgF40UhSuHU4Ocme37AtBAFeBOvIRZsa5oLlEKA/bZYtRs2J3FaHsHO+bX3/3k61aJ
         +SZWbtojctjY1o73pD8YIRmsPPKwx/o3pJmHYWLE3wEx6uPp5h/Isrn53Fj3JnFfRbWc
         VTUQ==
X-Gm-Message-State: AOJu0YxBB9fJP7liXysEVboaktvjo3eHAngtbeIuhyZ0wPFLMC2klBmg
	net7kClCHY8Rg45Ch55fdhXaaBHQltfstSQ+drWtIxev89Czq+/rWW90aJuANQ==
X-Gm-Gg: AZuq6aIHMKwqim2v8DDBYmAr9K/qKj5NkC73T60msc6zYCIgbge0CGQME2iAnCWwvI0
	PePaEtVvSOFIJR1vBh/iRiOFkLLOGWYNDx8NTANhi70POw1nPXHVrTBL6+c4/3Y+81+JiI+HZJq
	IyB54Qy9QNU7jelW4kmVinH67WiR2lpDwH0OCwGmIwd/mXx1naMk4927g5tLtIEzj38EZOlm3ZV
	JN+nDykLG88hr4Ig/QQDkdiuBdIo0zCb8zpFxv2Rtnvi9CPKgJLs0I0M28dF8hpTg9A2/YPXrXV
	SLN17D89pSZv8PBpaNkbzT8JNmcc0kuaI19bHXUbX5utR+iBuV1EwUK8YVKKIuct4pCVUw1mQFx
	KMSKdF7OMRHak2dJ/7UBPnAgnOa1cGKKcdKZWEjc0QgTKS33gkZtxJm1nBpsZhVIQTQks6FBsgK
	QbNa52mg2XZJYHfXUJ0fc=
X-Received: by 2002:a05:600c:3e0e:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-4804d307b0cmr88565025e9.16.1769236211032;
        Fri, 23 Jan 2026 22:30:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 05/13] xrdp: patch CVE-2022-23479
Date: Sat, 24 Jan 2026 07:29:59 +0100
Message-ID: <20260124063007.28313-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123811

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23479

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 19e076e66b3e3230b1fa05580e64de45a832ab13)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23479.patch            | 83 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
new file mode 100644
index 0000000000..6940ce8f17
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
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/60864014b733c10881c078048560858067fe5d0f]
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
index bffed4c265..ea895f169e 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
            file://CVE-2022-23478.patch \
+           file://CVE-2022-23479.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

