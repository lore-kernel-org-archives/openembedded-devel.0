Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22466.1794808955930482383
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p9CvdaWq;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3687551eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808955; x=1795413755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a4xfzgirlOR2Ky1NFe9eK9vF7P7MLcZti1KpZzXJSw=;
        b=p9CvdaWq560w1LLz7ce01a85AVcnixYe68ooa6ya1aLjib3McinZHW9g9LW+F9LYZO
         /Qn6SyE0Gc/b8mT3KYVcyT7DcWAkwhbcrmnaWgrcuMAvz/FYLeIIja1kB03bGOsKiBwq
         TpkrsivHVphvuPccX9FGYR8V7Q+Dq8IeY5yeo/KkYLBIaAeNr3oxuElCQ+UL06h5UnS7
         1Q15Eb0fVpFDo1qPzaIoWEHCgEMI51StFdyWizayZqOY9wvRWOoyQQoizLa3PfuUrNLG
         yeyJdlZMoULmU6JvXcEv/fj8o3FueSjxOkNcWamLoKJ1t5ddcoCaJmuphUcJaxTRH5te
         YLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808955; x=1795413755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3a4xfzgirlOR2Ky1NFe9eK9vF7P7MLcZti1KpZzXJSw=;
        b=qMxbQVJ0Mc0yYpaoLcSfuN0y6NntiTkj5LUYE5v7gISqLKCGgrqdBwEZ1ZhR4cKzQB
         lV/94U7DM63LIXdTQy1B1kYhWW+wFSLKdEuhrg7atn6z9vZBlk++fJd5VnxTz4hUagQj
         XxgsSUL5EKrLjw6ZKB9Til3dgSbY3Q8ZBvKmqZ5RkhYjO8Ui0m7anVKqKp5JOQXI1c8K
         cjwOky9KMXUOsbG5FZtMB2+/t1BrSSt/Qg+iUG4ehIF2YR53x08oxUwsYH+4Y9Og63P0
         sto50qP9hV+9o5LWjTsuk5EXLKVCRAAa6AfxYfO2PiBq5XUijBj9fa9vjjxb4jaz41qs
         99HA==
X-Gm-Message-State: APuU4Z9yU5tE2WpUewZ7I8FXz7SoKwBvoWFEEjWZ7F1LZSfb5ndU+mEn
	+CQQrat1ocuWunMPNLccZWkotYdtyfr8W0UKM10U5WEqmMLG6JlPezXj5y3vcEoy
X-Gm-Gg: AYBFou2QUlu768rX8dAeP+PLm8NdhZfbE8hWmFs82JjUC5M2Dz0S6GhsQyIfYyoGiN0
	QHnD5oA1b3Ss8Ux1icg3XW2I1EQEhGcbi3hR1rYhikjvONhFgR1aW27WmB9F1ZF9gIUOOSvmAD5
	i1ks9rY2w2ZqwTDx/OGbzEOS7MMus7sOsvveyC97IQtii7eRp8KtitiTDkmCPpCGsZ4+RXifpad
	wQv54rEJJP9FHKG/8lxY0lSqw5zJ7+/a09vJhV5CATkXS56UGPPZISuCnC/YTV/fVEBTeb2UL/S
	cIup+Z2qnT7t66H9T8aEIzmGeVf8TuPp0iR2gcmz/K0VMYdiGCo3A4/hDfEBYP3xUZQM4zmF+Pu
	hbGcqSZh2Sn7HiIXtIXdBs7tAN88CzRhEJ5yzczEiHWfSAeniNwwL02S+OPv7Crcpj2ZvlX5FTH
	3MIvKjo5t6IOtgF58iGUjAts5Fkp7ljVyIYfvLrOfBgxrDrsv55EtyNpipbT8S6cJ/qIf5zvbvG
	T7DDlcK78wgCqnkl4oibssnoGTK1a1dMlca+rdXhRb+jQgZyEbCvTL+I5VRK9gTddikdRr7wDyz
	T+Fs3Gu5CMdaVgw56oVpMReuOGTnN6gYn3vy2ea3Ty234aR4xTKM2hUZ+5nUo6GVmnZWE+G68HB
	Z1hRd6mhExsC42jQbL27CLj2yCznd8PjdzfBIQz2vehyWNC8VFB4htZsTtB2JQ7peteonX1K7+V
	KiybEXyfW2SPR1V6uxiEzkjJyDDGp7tu91m3ghu6duoZuTDrNTsj222LeOXE/OJaS9x0X6NwBPs
	ztGRwWmgqMMvCnttW6M0cevoZERGVwGNqy4KKScVhGrcdw6wRRhYDBZpfcZgIetwvRfGssEI4r2
	XUCs
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr15984612eec.22.1794808955135;
        Sun, 15 Nov 2026 22:02:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 21/30] cockpit: upgrade 366.1 -> 372
Date: Sun, 15 Nov 2026 22:01:59 -0800
Message-ID: <20261116060209.2916444-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132419
Content-Type: text/plain; charset="utf-8"

License-Update: LICENSES/LGPL-2.1.txt has the current FSF address and
example names, the license is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cockpit/{cockpit_366.1.bb => cockpit_372.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_366.1.bb => cockpit_372.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_372.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_372.bb
index 3aa1f155e7..2d0d31cd24 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_372.bb
@@ -2,14 +2,14 @@ SUMMARY = "Admin interface for Linux machines"
 DESCRIPTION = "Cockpit makes it easy to administer your GNU/Linux servers via a web browser"

 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1.txt;md5=4bf661c1e3793e55c8d1051bc5e0ae21"

 SRC_URI += " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/cockpit-${PV}.tar.xz \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "514723bdac652ec1fb55d0288ae775799e784708f34a5db66b9d8984c4ac4735"
+SRC_URI[sha256sum] = "a74d28489341e880f73224174dd21e0b48ce7e78999801369855f74d6df4a53b"

 UPSTREAM_CHECK_URI = "https://github.com/cockpit-project/cockpit/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)*)"
