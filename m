Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7705CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.7557.1759409988893148749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=esqg/1Li;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3e44f22f15so139260166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409987; x=1760014787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihfARbXOEOHAMOM8xT/KKw57wdpSnoRGNmn19j8Vz/0=;
        b=esqg/1LiVToB6ax5twBuwLgAb8eZ9KDOtG2QQIgGh7jq6o3z8U14GjAdu5TC0xunE0
         pq9CvMgxl6o1Y5mFuudyE4/2ZfIYlcrACGgYqTG71F9m9Nwzu719Hd4eacvxcKGqCdAt
         0+kyDonXd4w90W3n1UoOtKv9HD/2ZqOGms4g5TyN0VdS3WXGvZ1Va3nJkbuw9g+iMAJ+
         BvfzRk451LVNmhAYiwnZ72xwz9NSYryunK83mS3n+Lo3OF075cfi36XBloYjdY4lAMZb
         zNGpr2o6D5fdqjfRuPAdcX11K/xOv5TlinrgWAmWOI+7Iv3YSzHM2cX0AXfaZUS6Sedi
         wn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409987; x=1760014787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihfARbXOEOHAMOM8xT/KKw57wdpSnoRGNmn19j8Vz/0=;
        b=bDBSvMg+3suRHbdxXmRc78c9wOH1iIfedqEwEqR6HxjBLVvG1egOj4Nsme6Z52zBX1
         uYLRfIgZwXERWtjJQe1Tlq2VR9viY/wF+TG5QJvRqIvoqzHLAW9ke157l2bf+HcBHWu+
         Le3mxrC1W4Wcl+xbMfeuHjCJoKE4A1kfuR7d123oTuACfqT61mSHV23jMxOQOcf8hLEl
         s9UDRTZFc3e5t2qd0rCEvFIlWFR/NtTaqpbDHtgpUwc+5i7/pEupGQc8klqzXeT/YPFr
         DMeL155aYg1m0gqpLVG5L82MOGPcQRy8IEpZmIhDujnEBJfsUKYnV5iYak0xGsb+7Cq+
         dAhg==
X-Gm-Message-State: AOJu0YxODPpKcQn3D22+QqeXsELj1SxfoC9ZMwYnfBlAsH0SEjN4g4Kl
	sse3b7VuCzvGDDqqwaaeX9kCKUCqTIW7nFULo4maELWB0zsmfZsK2444Tj6zeg==
X-Gm-Gg: ASbGncsQiaBv36Yhzx6j9uqHDVWGY4ObmSp5y1ar4+lOE+bPZRQ0GsuseUykbbRa+nN
	6eUqdxIkUZmycIM0DrcHGtvnNyt5calDbHXLR5rJdFVcVNVoCpcT3GeYDBJhlyVwV0cD5039fyp
	8iHlOVCWJ0X6ggzyWtdADGYpaFspakiXqBS0MZu+XTXUSLNZxR/q6daebxYSeYNvMpf5hSwyige
	A6NpPa/qGYGLs2qFNnvsBlS9d/sthi/CJeP/l+uAMu2iZBG1qLy5l7OrwLA1EKBzxdqHTE38ekC
	fHq02XgeCiEx1/nYCLQ/3/ToRTbJQqooOq0/HJh9kcgDgh/hB6kfeJygk9Eev2IMOc9bnF64kq/
	mzdoxNJKBbiwmgY7WkznqPI/QSkcYngXpI0eQJ/h/w/7tZrDblGuEQwM=
X-Google-Smtp-Source: AGHT+IFZvVHv8K/7ikyvLRZe9MXzcc2raGoCoqj/I5WZ1y+/9ArT1rB23HoX/v/kMkuXFBI/SdEoMw==
X-Received: by 2002:a17:906:c156:b0:b28:f64f:2fdb with SMTP id a640c23a62f3a-b46e2626cccmr856584366b.4.1759409987120;
        Thu, 02 Oct 2025 05:59:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 26/26] xfce4-sensors-plugin: correct netcat PACKAGECONFIG
Date: Thu,  2 Oct 2025 14:59:26 +0200
Message-ID: <20251002125926.2624522-27-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120195

In case netcat PACKAGECONFIG is enabled, do_configure fails
with the following error message:

| configure: error: hddtemp isn't queryable via netcat (use --disable-pathchecks to disable this check)

hddtemp service keeps a TCP port open to query the sensor data.
In case netcat is enabled for this recipe, the configure script
will search for the netcat binary, and will try to query this
hddtemp port, as a sanity check. This check is performed
independently from the hddtemp PACKAGECONFIG. Since hddtemp
isn't running in the build environment (probably) and
network connection is also disabled, this check fails.

To avoid this problem, add the extra config argument suggested by the
error message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b16f9c6f046fa6275d1afa7ee60acc8d85849163)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
index 142f98eef1..4c44af4410 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
@@ -20,7 +20,7 @@ do_configure:prepend() {
 PACKAGECONFIG ??= "libnotify"
 PACKAGECONFIG[libsensors] = "--enable-libsensors,--disable-libsensors, lmsensors"
 PACKAGECONFIG[hddtemp]    = "--enable-hddtemp,--disable-hddtemp, hddtemp"
-PACKAGECONFIG[netcat]     = "--enable-netcat,--disable-netcat, netcat"
+PACKAGECONFIG[netcat]     = "--enable-netcat --disable-pathchecks,--disable-netcat, netcat"
 PACKAGECONFIG[libnotify]  = "--enable-notification,--disable-notification, libnotify"
 
 FILES_SOLIBSDEV = "${libdir}/xfce4/modules/lib*${SOLIBSDEV}"

