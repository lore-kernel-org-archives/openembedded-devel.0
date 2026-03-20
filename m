Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7501D108B8ED
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:29:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9583.1774002568437616782
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IghSLjGL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c56e822eso1810835f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774002567; x=1774607367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/tQHDYkLDxEb0KQ3ULsuKRSGSCu8tSiSZzX0q2vkmc=;
        b=IghSLjGLG7R1Q1U5lzwOYOHY8/se1Zz2Oxitrzex0gZ+36EsGL6a3bxuxVV4UIJ8eA
         NB760kFYgs0ETchj/fH4PDq8QpjffN4CsukeTsAyB/lN4fajZGx0pHRUMBpO/6EpkPL/
         bSHLGR+c9BE8z9HYaT/CSGoe9m2i0lYQFAQ6KD+n2PZA9NJhJJk/Y17iT13ba8x6d5ks
         p6kwgAhrWJSz5Cp/aKnGR4FmrJSkOkBk4rJbmSNBQNJfAh/ibkYl+cKQQKzB4jm550wF
         nOa2ze1qII5hA8imQ3XHcJFwCQl0pG0uGKrqTZmzJcSUzWxxzNPVeEoEf9dy0pul9Us9
         O7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774002567; x=1774607367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/tQHDYkLDxEb0KQ3ULsuKRSGSCu8tSiSZzX0q2vkmc=;
        b=bmwmr2zKkWxwTnrXqwzJ1r/PvcTpUo8+wZqM9v/4/P7f2DVzOsuGtcVDx5OQ2dv8e8
         DSLN6IdV9UvENGU0nYliClzeomM+e9eEpvMKJNP4yq/eu/Hw3abLSmZNaiBYmRf+3I1K
         Eu9erZFGhORlpKcjHbqBp6AJDCbut8Lo0YIKXUt8BORgzV0VP0iyRPgtwZPh7jEAdoNP
         GnRoz6tBCUzoyHPF+SYyHF2dKMRPnYFlx9sqe4RnV+nKGxe4PMmLl7Y5eeQZqqkBdGxy
         XQoWLLD1/T8ZaIfGyH8ejj+LLqf79Ng8igv/KFh2Zf8yyNugvcRfhVdRQQ9hS3yQUqnN
         xPGQ==
X-Gm-Message-State: AOJu0YwfPHzNa6l8WK6TGm6a46Qt1As68WrOXhVAId1iywIJ1FxV8DS/
	PWF35T9NFBdQ3LGsxYb8i9t8L1a+OHWssV/w74PienaUwx+YVidKYZdS1ttZ6Q==
X-Gm-Gg: ATEYQzwo9xb3xQXZSjVLpHt0v1ylLK5BLNFvdYxZ1+txRhaxX5i206FbqwtwoveBIYt
	ZhzWJzU490c4rpfUzw0AaESAEzqUKVX2lprGrzdc/nMXv/A7hH3HgedOGpZHzbWhYYQBa8mMCYf
	G0rViRnO5lL6aQlEaVctbpDWRiuEeQa6emRXwUCnNgfIYGUkuO8SmyMRJsH52KD30H2vQGH5mEi
	tnfPpYICPkY3BHnpAJyaCFKiyOqANjDEZSRkLudQE9Upj/ZaHxano36K02lpiwvNi9rDMrLW7S5
	c8XJ3lpCqZlKqQsKLG3mW5pD+7ck7KM3KNGt/7To4ZT3RDqKUjqruQtIKI1F23ycq6vPILWqZwp
	mtcTcwZmQ+SxqxjHnBqAWqq2UeZ1De+2cjw1sfusTWbqXgzBjpqg4+UO+Av/ihCIQVmoDP/yUpB
	ZWWkncW0K/A3dO9HgKxXg7
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2999 with SMTP id ffacd0b85a97d-43b6427854dmr4397688f8f.37.1774002566475;
        Fri, 20 Mar 2026 03:29:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714e2esm5441196f8f.32.2026.03.20.03.29.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:29:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-system-monitor: add DEBUG_PREFIX_MAP to LDFLAGS to fix qa error
Date: Fri, 20 Mar 2026 11:29:25 +0100
Message-ID: <20260320102925.2821845-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125433

Fixes:
ERROR: gnome-system-monitor-49.1-r0 do_package_qa: QA Issue: File /usr/bin/.debug/gnome-system-monitor in package gnome-system-monitor-dbg contains reference to TMPDIR [buildpaths]
ERROR: gnome-system-monitor-49.1-r0 do_package_qa: QA Issue: File /usr/libexec/gnome-system-monitor/.debug/gsm-taskset in package gnome-system-monitor-dbg contains reference to TMPDIR [buildpaths]
ERROR: gnome-system-monitor-49.1-r0 do_package_qa: QA Issue: File /usr/libexec/gnome-system-monitor/.debug/gsm-renice in package gnome-system-monitor-dbg contains reference to TMPDIR [buildpaths]
ERROR: gnome-system-monitor-49.1-r0 do_package_qa: QA Issue: File /usr/libexec/gnome-system-monitor/.debug/gsm-kill in package gnome-system-monitor-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gnome-system-monitor/gnome-system-monitor_49.1.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
index b23e8bb8f3..e0de81db32 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
@@ -28,6 +28,8 @@ SRC_URI[archive.sha256sum] = "915b6a321ada12eba7bf578c20c9fe5e41f55d532847cbd124
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 RRECOMMENDS:${PN} = "adwaita-icon-theme"
 
 FILES:${PN} += " \

