Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0530FC61DDA
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.258.1787962288671769283
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WIpz19Dr;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1724609a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962288; x=1788567088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTPX5esoDfhaw0Yks5JCmnWsQ/vT7ustAmfti8PWSuU=;
        b=WIpz19Dr1AzztYVZ/Z5gK8ifMCQzlW/eY9scHPD/CY9wtgtZGi3PWPH3ZWz+bj+g7W
         guRM6rbKeqNnFizP966SANyqJazXvJzL+cXU6Kcs0XFkuVLEwtkxXdnDOmK87T+dbFk9
         bm7IR6ZVoScHXjNLtYLdg/VbZCR9R169DAGxXtvqczB38s7ubJCekQFqJswq9wNyIuhg
         364AwuvVfkcjfqeypa7AJZ5tr3V0nUZHZX4zQ2VfTiHZjubarcSnmFGr+YzIyM3q44il
         po1+4LwjCU2buAPQZ/p3uRqzQRMusxgZiOEC5YwarSqaRfOuIz5JnVmfXrbQbkMNVl3N
         bGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962288; x=1788567088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTPX5esoDfhaw0Yks5JCmnWsQ/vT7ustAmfti8PWSuU=;
        b=idaLEy+umJaC3Fh/GCki1JXvsZVEw7vRcAcD9XijLzSycq1k5JSrrpEZW4EtDImCMy
         b+Vu+kcPwqPzi1qFkT8fKLZuriu8NmGlAfSAZDBNzk689Pv/pcyKncRGH61xTKHHoCMO
         D7Wh9jolpNPpmS0Jhq8EYowe8AH7V6OLR8vMpHjOgTTk9SjCyVP0wjsdMb3BtQLrHXN6
         fyymZAYgHPFEuqFcaE/9NyhzMaDtvnigHO56ww9qLiJHeQjY0aLqfHae2loOx/t2PvX2
         67f06BnY6Bk5Hc2LVhJUIonXTRfD+AS4TCgd4HYcprWCzME8Fq+GklEy7Do1xBvVyzKu
         uB+w==
X-Gm-Message-State: AFuF++n/Ye/pXCo9XkCT1fEDktj4t3PN8KtJB1nGpyMRhGonu7HVSuMl
	45j+F5jLznxhj1UhX6I51OU8Jctx41POFvh+ecdbqIZKglBOFTueX3cQK9vv21lY
X-Gm-Gg: AYBFou27uPBrFTzCtwRJjCdLNwUEt3293Bu6rJs0PqQBx1suhYn8Qs+9XcEd0QrW88e
	gUDNOPi25Q+P1RKduK5ttMwX97tIU1eI3qFxmjKr8XRzzgNnRnEZW/zjlcn0UPT5tRiy44Z0ZMu
	KVYtlKkNOWSVjcC+eUKnIg4sFeynfnAD9FDwumWjOuog6OE7Y06OgR0kpImv33iykBsC5/u3qpm
	eOTBUB5MpocbS+14VaMU85CWJ5D6QHX4hbyfGTZv/Nv2Oyw1ZzF/ysYLGinsi6KChJ70OlaCDfg
	fWpvccBxqzhdrlJQ5fihEkrPA97Uqlb+3yHeIwu8HK+DByyLl/rumLRIweiPRz0WZ8bcgdxYjjt
	nyed9DYMvDauWMup3L/lGt2WzPMjS7ePa/KvyeTpMWSYrepW/wKB/2kdtxW4FgfjCUXRn2hT1aO
	MbTW0M7QO8dmfhCa6i9vSeKZt6MoWIymAGcnjDTo2jQjW2BorLRaUabyQp3eCPESx4raEbNF6Cp
	70/fgoM+5HQOozWo7wVIgTeyeG70qs/AiagacgF/KVE4i3p9wHjsrbAIYYQdQEVQ20xjFfgx1zu
	+BVTgP4VpIHKtWLGgbMKUbhvnrQFFGEjHLfIdtY4a52jApoyOMbC+fG0irhP+Zd7K8/7gfnMSNV
	HmHZdAc2Olwb7Pk/+0IF5B+73e3hvjj2u9cpPpdbSfoFqVf2XzUp0CepcXQ==
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr18206491a91.7.1787962287904;
        Fri, 28 Aug 2026 17:11:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 14/16] python3-time-machine: fix ptest tzdata/dateutil issues
Date: Fri, 28 Aug 2026 17:11:05 -0700
Message-ID: <20260829001108.559544-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129573

From: Khem Raj <raj.khem@gmail.com>

time_machine's C-level time/timezone patching relies on libc's
tzset()//usr/share/zoneinfo, which requires the system tzdata package -
distinct from python3-tzdata (Python's importlib zoneinfo data), which
the recipe already had. Add tzdata to RDEPENDS:${PN}-ptest.

Deselect test_destination_datetime_tzinfo_non_zoneinfo:  it builds an
aware datetime from dateutil's tz.gettz("America/Chicago") and expects
the CST (-6h) offset at the 1970 epoch. OE builds /usr/share/zoneinfo
in "slim" format (zic -b slim); dateutil's tzfile parser mishandles
the pre-first-transition instant of a slim tzfile and returns a 0
(UTC) offset there, so the epoch maps to 0 instead of 21600. Python's
own zoneinfo reads the same file correctly, so this is a
dateutil/slim-tzdata limitation, not a time_machine bug.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-time-machine_3.2.0.bb              | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
index 8e2fa51bb4..32d64f8d14 100644
--- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
@@ -19,10 +19,21 @@ RDEPENDS:${PN} += "\
 do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    # test_destination_datetime_tzinfo_non_zoneinfo builds an aware datetime
+    # from dateutil's tz.gettz("America/Chicago") and expects the CST (-6h)
+    # offset at the 1970 epoch. OE builds /usr/share/zoneinfo in "slim" format
+    # (zic -b slim); dateutil's tzfile parser mishandles the pre-first-transition
+    # instant of a slim tzfile and returns a 0 (UTC) offset, so the epoch maps to
+    # 0 instead of 21600. Python's own zoneinfo reads the same file correctly, so
+    # this is a dateutil/slim-tzdata limitation, not a time_machine bug.
+    sed -i -e "/--automake/ s|\$| --deselect tests/test_time_machine.py::test_destination_datetime_tzinfo_non_zoneinfo|" \
+        ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN}-ptest += "\
     python3-dateutil \
+    python3-dateutil-zoneinfo \
     python3-freezegun \
     python3-tokenize-rt \
+    tzdata \
 "

