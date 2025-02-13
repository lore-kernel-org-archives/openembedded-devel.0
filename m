Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9CDC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 17:44:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.214.1739468687420792080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 09:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d45jbW0m;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so8866925e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739468685; x=1740073485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEYoo5W+Ch982E1bqkSZlHPG33ulrkrwum1fa3+v6lM=;
        b=d45jbW0mKyi+eOY17OzW2dlHLHE/h63v0XTv2AeEGttihTt3X3SMJ9WC0rpUGcBrjr
         xkCo8JNK2xqfQ4YdE/pBqvHqQz5fXkye0IrweWZluD4gTVV/jw4v1SeJp7uw+grOxuSX
         3DkxjVOXlHnNSaBmA0+Ja92GyQm72Xlbw0ooQrbZRflZGEL5uYRLGM9BVrcydYMMjpoQ
         FMidR6tosZmGe6ElBFY48xIqBGrRuPzk02/CFPnK6MfopwvuOq7hpca8c0l6NgdJmJlJ
         k+kZPNzXp8aFoeWP00kwTd4XEBsnxv434VHXQLC516L5HzlLRZL6PBK2t+pC4kIa6rNF
         AtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468685; x=1740073485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEYoo5W+Ch982E1bqkSZlHPG33ulrkrwum1fa3+v6lM=;
        b=k6ocNZqnwhHYT7hhArxFsObZkS5yiu5c5LvEK1zUHx7pR5LOfVWh8GlIMC2hNYL18G
         aZr+8LVD95CZank+Ue9FXIi0mf8QMMSruBaV+dFmEtN/Ri28ZJLm2SsayDnsTRcrJmoS
         GKcxl4wpYMawlCyEr5UpjUyvkxijwMzTXTZQzjdi6FBmCUKzouAAGTpA35gw6QTSXo0Q
         xjkXCJbkCmEPjXeGdyKV8azLqYpKHJQ2vz99HwrcbiV8GDJO04nDsb3FmR4jZUBSkysu
         J12vMQF+VrscoNSVpACyNGfIunqyEn31QD9SvUNnFz2ia/vmXxNz8f++47+gyRaaPAeW
         Pfug==
X-Gm-Message-State: AOJu0Yzgomgo8bJ9Ey/Or2EoyXNHFUeIA73hT1H4SMAadCKqeEATyhLK
	h0HU6mUXNKh/2vPLq9oQq3VVgkooviDyx4OSux+Xg79k6dG5BWglsZvL5w==
X-Gm-Gg: ASbGncuJxHm2DiZjyjlYCugTz6zFhduFtkm8Rd0nUc9caL4zyDDktWBhmzRE6sZuoYb
	7ScYIemL3kv5FUA6ptzTFjLsJ7sFhOoA0Bqwqgcb2Vj2xEd9pu0yq608H+HUQyju+1Mm6Rg2bQk
	arshWkXGDR9KuIZZLlXu9+TLacPRXOCsxDvpFCKpN/YUydo3kvGrMpZ7s9ZHPTQ3royrJFBY6/f
	c2O62mOaY2G9R9bb91ZPbDyVy+oRQh3e+lqrnoMVlQGwL3N5EkNnu0LUrgGOeCF2b/RCFxU/XBI
	kNmha6G77nyhzjhQJylmbBztOdYoXB8=
X-Google-Smtp-Source: AGHT+IGCBQU7Et3sgkcExldV6N1rz2a2Y3yWn/yTvgHh6N7YkP7IBxpvYGyDH8NB4BVtsWYEY34K0g==
X-Received: by 2002:a05:6000:1fab:b0:38d:e3da:8b50 with SMTP id ffacd0b85a97d-38dea2e8184mr8244028f8f.39.1739468685210;
        Thu, 13 Feb 2025 09:44:45 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f8c1sm55491845e9.8.2025.02.13.09.44.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:44:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-sensors-plugin: correct netcat PACKAGECONFIG
Date: Thu, 13 Feb 2025 18:44:44 +0100
Message-ID: <20250213174444.739722-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 17:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115468

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
---
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
index eb1165c578..de3232c64a 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
@@ -22,7 +22,7 @@ do_configure:prepend() {
 PACKAGECONFIG ??= "libnotify"
 PACKAGECONFIG[libsensors] = "--enable-libsensors,--disable-libsensors, lmsensors"
 PACKAGECONFIG[hddtemp]    = "--enable-hddtemp,--disable-hddtemp, hddtemp"
-PACKAGECONFIG[netcat]     = "--enable-netcat,--disable-netcat, netcat"
+PACKAGECONFIG[netcat]     = "--enable-netcat --disable-pathchecks,--disable-netcat, netcat"
 PACKAGECONFIG[libnotify]  = "--enable-notification,--disable-notification, libnotify"
 
 FILES_SOLIBSDEV = "${libdir}/xfce4/modules/lib*${SOLIBSDEV}"

