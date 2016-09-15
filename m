Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BCA3F77047
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:05:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so5848141wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iERfHJinoQ8dxb+8PJvFJKNL5HZSp+aVOIQr4UpH/ws=;
	b=OeHi/ojDe5jiEwalVD+4ZqrXQoSyHRevp5bnysCy03KzntlOWsi7C1Mea7j754gVO5
	FIrEsi7ypP278nLnhu9k+N63BbwD1YfStWSqBQWZXqtzVkuWd+IadB71zzdiObR9J8BX
	egXyk47bZfOU9MYQj1N5sl28auhYjJtr662dKxkNs0vL1woVxL0YHlsGHvQ5yiBv5COY
	yfZeZVk67YYszYBVX6KmBmWEX/N+u9q4qgakzLJzbp7xQbxZq6nvopdV2Mim2hGGdJUK
	Zo6KVGhF7/NGkZ4W1O3/VflXu6rDnAXf6XSgySLa0px9C4MOXxQ5h7qfiPXsgM/xK5gh
	0zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iERfHJinoQ8dxb+8PJvFJKNL5HZSp+aVOIQr4UpH/ws=;
	b=DCln72rGCPDj80jqFvdAtMg8hJ9Hxk16coMqcMeLLr1SvpPcF72N3t3wubMLje7M98
	ywGpLeuYtjz7KPngePg4RmW16//Tz/opuJ2OemE5p+lvYujjcFZZmyo+Xv3PjXhDq/XO
	qA+X/AQA/pTiGqiFVopip6H2XAmHpm3WEENb6qLvwF/jXKW2A55qi+v1mpmx4ZDkOiDy
	elG2ybGwssceBmEauxD/svQQw89q4qs1FQxET+RVq8aCK6BYreXr/0j7PT0q1ShAI8UP
	bSIW2rOSCnX1gbuLLpAu4hIk9HnersH4i2hbO0h2/6B8Es/aQN0X5Prr9ci5WV5XPygQ
	koJw==
X-Gm-Message-State: AE9vXwNyNc4wfnk/S89Top0alOPxV6wH0QKjk9XWx4wS2U1/T1jpDx9OeVpkJzElrJi1qw==
X-Received: by 10.194.90.104 with SMTP id bv8mr7896668wjb.189.1473926756829;
	Thu, 15 Sep 2016 01:05:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	190sm1227735wmk.13.2016.09.15.01.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Sep 2016 01:05:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2016 10:05:51 +0200
Message-Id: <20160915080551.15057-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-browser][PATCH] chromium-wayland: include 0006-Remove-GBM-support-from-wayland.gyp.patch only with CHROMIUM_ENABLE_WAYLAND
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
X-List-Received-Date: Thu, 15 Sep 2016 08:06:00 -0000

* otherwise build fails to apply, because there is no ozone directory
  No file to patch.  Skipping patch.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index 8db8a4e..f7ad2ce 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -7,7 +7,6 @@ SRC_URI += "\
         file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://0005-Override-root-filesystem-access-restriction.patch \
-	file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch \
 	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
@@ -22,7 +21,7 @@ SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f6
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
 OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
 
-SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
+SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch', '', d)}"
 
 # Component build is unsupported in ozone-wayland for Chromium 48
 python() {
-- 
2.10.0


