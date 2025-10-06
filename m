Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA403CAC5BB
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:24 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.24000.1759715302632583066
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+VegEsP;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-73b4e3d0756so47179747b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715301; x=1760320101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfJzoMBc+fFx0zqYgluSZXQ0m3XuTaE2MQf/1freU8E=;
        b=F+VegEsP+86NIdNyRm6MrDR2GE8bSmiUQHYoZQKw3fgXuR/nYPHzrSEI/Zy9SQ8k5Q
         Jga+X88epbQf5i4sK5nja+6e/dBosqUDrdBnyQc5nh3E9wON26J11O9nazmDTEboulC1
         HyIfJv1h/UlgsIZPRPAy5YTh3YtiiFi53olPoyWn+nh3rwsHWPxqXP3kBLNJEcG1nWt/
         /aDwy1kPbSQXpIEqCsXyveC0/Z/Yo4GaIkCH/1wuvT00GysDOB4NOzpMP/z29klhmUOJ
         ew5fNmjrYqkkp5RaYc/VgmA08SoIEmdOFwgB96IFglcVOo95J9qD/bXV0HF12i6lsHd0
         VEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715301; x=1760320101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfJzoMBc+fFx0zqYgluSZXQ0m3XuTaE2MQf/1freU8E=;
        b=JLeqsk6EDZRpqovlUdkdNa7a7VHBZLaY5xjD5RaPJdM0YS/Y9GNQTfG095YEOu2Lfo
         AsqRAr6uu5gbrsE9k4OWDsCBwOGG4+5+E6D5umXvmgd4Uj+04hhZxuGiffUnNsDRAlmo
         DQoLwM9BQm15eCiB95N0JUVoNNcthcGZ1xcd+YWTuzn16CnGyIsAeDpiHO8XbUyh6YMt
         7ATWPGcJCDXQM556PstnDaksvS6z15uL1bwpYXoBl9Fs+sUT5uwM0eYh/JEStc+idI9Z
         JX0p00dfS3ZmA/EFIXZPpSXK9Bk8NVi7VgguziFvBI0maJGwD3k+987/d6o+CYb1fWhz
         vhyg==
X-Gm-Message-State: AOJu0Yy7yAba8jHpEYQU29SAE3iw45YMrFwp7UrfficDYiGeLghrYoEM
	tdbicqyfQoi4lK36913PKXIJCIzlPLYCCu19XK9rBH+9adEfGFuI032epMGLVgXb
X-Gm-Gg: ASbGncv4CJKTxVEUIaq9ffJV1jKxNvbX+EshyURKZE7/Bb2NV6Hb50YQCV/qSczS/XF
	o5l9AoPJ9mzVepNFEKkjAx20I0JMCrEphM+I2RetRBBtoSms84NTz1Z4wM/07lxifgZrHFcyH1Z
	bZJ5u3IGs6wbymarrIjtb8Le9XKhn1vtNOChcMBvldkRas/FB9xIxoi56F3f++f2pKnbuI7PuVi
	2BeSN5wH9oFWM0/DL29kMXCKs/0EYylrrtbudiXYkXS+xeWlB8m9ieaWVvRvNsZTKXWXO/oJiZT
	aOOj38zttauRb4uyJ9hQpiNrrh4wMxypXzvekqnXksgnSUo8a+gaNA1DQzYRRcbWDmBDyfMu5wa
	9rLH4I6aiQDEaY8v/IbbAkoBVRXZt2ZtU+eGbpn3jCTDp3MKovX3I
X-Google-Smtp-Source: AGHT+IFZV/yRvuhDXKg80MIgQPVD3ST4GwSY6vbaUDjZRw0Ar6b+wLU+fLHOcoYTzcW7dVuzeH09bQ==
X-Received: by 2002:a53:b5c9:0:b0:633:c066:6a6c with SMTP id 956f58d0204a3-63b9a0711a8mr9068249d50.20.1759715301308;
        Sun, 05 Oct 2025 18:48:21 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:21 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 05/10] xfce4-diskperf-plugin: upgrade 2.7.0 -> 2.8.0
Date: Sun,  5 Oct 2025 21:47:22 -0400
Message-ID: <20251006014727.58960-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120262

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin/-/tags/xfce4-diskperf-plugin-2.8.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin/-/tags/xfce4-diskperf-plugin-2.7.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...skperf-plugin_2.7.0.bb => xfce4-diskperf-plugin_2.8.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.7.0.bb => xfce4-diskperf-plugin_2.8.0.bb} (59%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
similarity index 59%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
index 583aa9a006..278c21efa4 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.8.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5909a65341a6af4d7ff3c7bb87aeac91c763f69b43ae9dc4a10668ac226fecc9"
+SRC_URI[sha256sum] = "3833920a3a4a81b3c676c4fab6dd178f4a222d66f316a0783a9149a0153b7fb6"
-- 
2.43.0


