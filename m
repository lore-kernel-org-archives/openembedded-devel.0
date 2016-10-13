Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96CA260746
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 14:24:35 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x79so13005000lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WVgZSnEUckS60p9CVFDKyyOpNOmFLghCLJKOWXHeiPk=;
	b=ueK9fmcIDZXXJc7pzMvqAyIy34+bZ8pQHUzlisFbPtU1dzYAP7oTW25O381zzoGU+W
	i4+3JnH7jjEhFDG7psNxVp1cmDqPdBYWPNmw+ok0hgD+tCJ5Th4TesOqoJMN6Dorz8yO
	Ve5bWMxsvPFP2kHqnm61PDOAATVaVd+L2YqJJ0UVcQE/x+q8UC+3jm7W0lVYI9vYwlqy
	aKgSiyvhBAJ2qa3/lF/92czqmcjGF9lQuM5TdVer5xRa7VI2e3gvZ1sJACCWOD2a6Ypi
	BQnBLWKN+nQtkngGiJJ4D2ki4nzUPm0XvrVq/fYz8xUQ9xpMtSt9OegwiiwSX/DlHfj5
	cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WVgZSnEUckS60p9CVFDKyyOpNOmFLghCLJKOWXHeiPk=;
	b=DDyWpM9e0X15JZE4wkLjqQsy7JdUbQZ6eQ5PqkI/T/rAixWqSqsoa9c3i5JOyEsoUP
	s6Sqfa+8/w/KrRWCNfcREhLhoPL1Ak6FJgFvCrExidUeFWAG2Ch4bNIdkZ7oByfNglyf
	lk96DokJ8e/BWQm8dY7FPifd27pRlANgT+BwaBhep1oNUxB0fSWNszfDhYmXy2C3O05C
	1twpRFSFZSQHg48pbrE+/2sDGsnaDzlRxfk3mzX2d3L/m8lIZ+Ct55YAkZ16+R+CYJ+j
	kYKqnqdBCsxDnh2sD2U9nK4Gtw63PChTdqOxHrUaStxqt2rX8RIAlSKm25wVzg5iROuC
	n6rA==
X-Gm-Message-State: AA6/9Rm6l1y2vIqDtavVQPTBz1R330eku2GPikhsH4KM5AN32zaKs4Nv2/yNjxg1yodVsQ==
X-Received: by 10.194.87.7 with SMTP id t7mr7069778wjz.196.1476368675790;
	Thu, 13 Oct 2016 07:24:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a2sm23039322wjn.10.2016.10.13.07.24.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Oct 2016 07:24:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 16:24:32 +0200
Message-Id: <20161013142432.32326-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-browser][PATCH] chromium-wayland: add wayland to REQUIRED_DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 14:24:37 -0000

* otherwise chromium-wayland recipe might build with CHROMIUM_ENABLE_WAYLAND 0 and then
  autodetect couple of x11 libraries
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it isn't a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, but it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it isn't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, but it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsaver, but it isn't a build dependency, missing libxscrnsaver in DEPENDS or PACKAGECONFIG? [build-deps]

* reported a while ago in:
  http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109131.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index f7ad2ce..bad3d71 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -2,6 +2,9 @@ include chromium-browser.inc
 
 DEPENDS += "wayland libxkbcommon"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "wayland"
+
 SRC_URI += "\
         file://chromium-wayland/add_missing_stat_h_include.patch \
         file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-- 
2.10.1


