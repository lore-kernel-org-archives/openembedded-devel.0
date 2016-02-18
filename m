Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA86E60290
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 15:10:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so32602434wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 07:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CcpEcZ+5YEie23tuOKiMblbYoB2+7Kni6YbqGpr/ZVY=;
	b=kEzkQ+x2CYcCeSaCSC/FoJ7ekp6ye0qKdcAFkv6H19dqOHLgQ8acr/5lP+hxtHIj9z
	pTp8rQak+tc76ZwJPNRebUZlcqUQ2PuiaNHbWRHW0qt6BcgZPqu/K6akGJdMJkmZov2W
	Xdg0fW+uDZpf0se5551YXrXNbeSzabmiVnh4gGBkicT+2w5GvUyxggikRhknZU6LSAaO
	J8WgsdRpkwPmEhbKLzm91ANkXkvg1ntccOh5nYPCgQnxTsyn2elVwT+yqISEGOY9A8GW
	LAt8S7AcQJRepmnYSnYqogvjseRKDMkCNLZ7HMKpGRgcxPXlGFx8Y9gnltcKasSfxwmn
	kf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CcpEcZ+5YEie23tuOKiMblbYoB2+7Kni6YbqGpr/ZVY=;
	b=bMny6R+Ea2qysqODSEXoXePqmQ3/SabpMIvYnC+8C0r+j6OqTOsI9GWUkJBxgTV/gs
	q1aKF7MmG0++cBLn6mgOAuSg7TtXmG47nK6FOucgTLoflZYfwwERLjY3IaNA+LRSoosr
	VjINAwy82Aj62J9bpfJeKGQbT4Ce86ft/HDLmi0mJX1gYHXGTUUfd93Ztjkk/iw+h0Mv
	e74ofT7yPdFZhKkyj+FFJ6PfldoqJDUWs0z5t+IXv/Puuju2Mj78YGX4c3lvT5lRCnUE
	UmjpjKL0QHheEBiw97ryiQzFCh2y8iD7N/qY4QVjYFLGMrFc8BliMfHE9EoJvAAcin6A
	1OQg==
X-Gm-Message-State: AG10YOTKAkB7wbUGWAXaMTo1V//dTw1me+1aGJqDwu+HEXFduc7uwwMHD7JE6zEBRa9LiA==
X-Received: by 10.28.132.212 with SMTP id g203mr4021405wmd.30.1455808218664;
	Thu, 18 Feb 2016 07:10:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c26sm3382268wmi.24.2016.02.18.07.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 07:10:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:10:39 +0100
Message-Id: <1455808240-29188-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] qtwebengine: Fix QA warning
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
X-List-Received-Date: Thu, 18 Feb 2016 15:10:18 -0000

* drop section with list of static libraries in workdir
* feel free to fix it properly in Qt build, I need quick hack to unblock
  my bitbake world builds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 47d3613..aa45536 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -92,6 +92,7 @@ do_configure() {
 
 do_install_append() {
     rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
+    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
 }
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
-- 
2.7.1


