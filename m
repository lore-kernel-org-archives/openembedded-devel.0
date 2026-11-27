Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10365.1795753074561695888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qeuh1jzA;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3542490c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753074; x=1796357874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNInnCPLibLdMoqcaBJjMZkM6SL4kzhqF2j6chQWvHk=;
        b=qeuh1jzAAMi9520UnJRECg9/7T932iOi8cjJGzWDNVsWg8RleXliRV0ZJkQoz/vsn+
         AnMylAgoZPDUCihWslRBUUFzu6T1g0N7cICx2VSMnKZ58wZc9N7EWM+gPrhGCrQtIDQV
         DydHihUstnM8hwZ2hXyzh2kno0NnwsXHlKtRf0J99YoWiJJIiVR/NqrFGIeTnTNidgLS
         CQNxbvNf4b8DRdzZw+Z6kSZ04iI4wnhHh7VUBlOFwbsQL0Aw4qwhjhLq6ORfGBykWLWH
         rjciW9br9NB2TR/PJCxalzq1sYUL0l98Y7jv0abnVyRqKvHDY/KwjjGZ8K4LnJiWf2MS
         Z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753074; x=1796357874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNInnCPLibLdMoqcaBJjMZkM6SL4kzhqF2j6chQWvHk=;
        b=WLvD7Y/roa03AsUEr0THWKLHUyCWlfXiaePs8RdCl+gbF83M5R1LLRpzKzb15ex3rj
         vH/xJN7/TB4A8+V8SU6R0IXjUTfIV83cgCW2rkrtSW4a2QVu2q2+flPLwqk3FxqyaPVt
         c8uHhganGgF7Tj9a8OuMAO0kDYk6u/fpaf4d6gDcGlkTDjJ4+MxYf8Lx7wlNfKlqLTXa
         jWW3y3J2o+PfDwIdHbMIYhUCNQMw2yhv7D8B3e3bsFe5qaoJ7LUjAD+Vl0M0103gQOSN
         WNUzOEmUaTaIV+ezr6Y2Yg0HvtO6AKmpuYkK3RhK89GlKChmpcg80Ain74QknqAa8jk8
         ExQw==
X-Gm-Message-State: APuU4Z8eP0RmC5mi9RkBeZpHTR78/y8i6wobR1wSEWSARvgAO+QScmq+
	6ON5GLy4AG521/dthl5fSuG0knqt0HzZP0RlSqebkSNz4gGCYKidHY4JPPr1Dkgs
X-Gm-Gg: AZFdTZfjrD8bqew1AfhHoW3nL/B+KLrPR+AwD6Fken4Ao5DqLLgjbi+0ZdRWuOEW8+N
	iaJbERwf6H0DWuKssMYOZS293+LuugBBHquO9apNgk0CInOpfwWzk2Y5cqINo/DriJYzYVhptdJ
	4trbjeaxIQffHlMPHyftDAxJBCPYWvUfykR42MTl9tD6m2qpVrOxrx3QDYcAYwgNUrGZSWnBTaf
	E8QhEUN0Ls1bgTLECB47pMgotKfycEdL5+3QVrZIzIUmpvHhZy+Kh8HJOEqIfg7RjVj3kYp5hxS
	31+uXKZeadquJ5pM9aNOP24DSbonrx50p0PYFpUiTqLk+DnqUDT4wes4wq29MM/2P1aXQGwF0Bn
	Z5EkN1VzOxfJUg+mSFUE/A58LE+nl/NGY0q615vGLgyillpjRnr89qX9x1avBU0U5c2NB0GMRgV
	0iHH2FE0wEAUEphsMTgFHvey6+pr5vsnXtlaKuIFwiilALSoT7gT4NkUiwIyRGI1dr94XQ52x4P
	5NXMgHYwswIqUwKlWvmgXZiTTTECrv9LQHEGTLtDC1+TsX7HpUmlIv3ZH9seZ1qRwsU13G4AMs+
	qgi2BAVs5GCt5S/3ITZDdpHSKQTsO1zzkGnX4Yu33cihfbxOx62mhFEUDv4OSETjnZ9MQYa+I2K
	egs9q9L3WR5RS/JLNK3f+YJDaldB2KbwB9pDpBz1+DvjR6bqMCfpxlgFO4rNplTr5L7ZgZPmXX0
	Ic09fFT+axAqQX7AO/4CnnP3TdlWE1M2m7Jkx4kQErl5fcIPNwl/9k6EhGHRSJcVQTcJMA4fEPr
	IPi4WVoCAjzd2EtPnHoSfXN6WApk8QSrUb44p/ZlTnT+AYxtLiF1wOYOatQPY+RZ+/bhjo11w8L
	ntbm
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr22259850c88.1.1795753073788;
        Thu, 26 Nov 2026 20:17:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 32/35] ssmping: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:12 -0800
Message-ID: <20261127041715.1776485-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133284
Content-Type: text/plain; charset="utf-8"

With downloadfilename set, the check used the tarball URL itself as the
index and the renamed file in its regex. Check the Debian pool directory
for ssmping_X.Y.Z.orig.tar files.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 9b1413df2e..669eef7b75 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -9,6 +9,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilen
 "
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/ssmping/"
+UPSTREAM_CHECK_REGEX = "ssmping_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
+
 CFLAGS += "-D_GNU_SOURCE "
 
 do_install() {
