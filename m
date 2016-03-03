Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C8AE0760B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 12:52:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so30279177wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 04:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HY37/4fkuNw5GYS3pX1t9/B+k2dS44sxcmf7J6qtIVM=;
	b=0fbY2y6EP7zg+XabBKpxS7bVCjclIzmVMXkDWOJZvErtuKuto8Q47D9RJIqfOHuQIB
	BBz1fReOxlw5h8ZNG9rni2vMJkdL0972cx4LNJ0lGhqIOAsqO2YGMcLUJJZConb3igC1
	UHe1ovux02CJqfUY0JiQtlq2kntMB+fDOMspSmo7SMCGhw//AsonwpAHigRsv3Oul8C5
	rCm1aUY+0hv+XJAknp4LoXVCAR9j+4U2giYjWFShwfhq4Y5rAmjpM1QNZ8n/YDcXm1Os
	AROuwkdD6mcJtk8dciZj5xOH0EC/fuAFIqBPSTipn3E9Jleg7L7vnFcHuNhQ3l+5AVWI
	e9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HY37/4fkuNw5GYS3pX1t9/B+k2dS44sxcmf7J6qtIVM=;
	b=g9m/STgIHGftc+4gs85PrkN5EvrCuRwwOl98h/LZaQmiTK3xB+0uCKaodhIEiOw5cG
	1ZQSDwMdyxZsTGyFuPS104OMs6BOc+bSy0hjfBtFf9w6ThDdgxHcL9GSXJyGlZnUJpDl
	uHhyM0d/lT+Yw7yvfldp62d2hanS9agSmRJkBAqun/CQmaaP47cHpKzTBxV309rWW6Yb
	QqPa7TrBODLe6Ipn1jY/Maq9jHFoRT0NvHMWO8jKU4Aq8nygX2FhtPPjqRH+hhGdQJtH
	BdZ/nTIP2woO3xCSAyCGIiMl7J6SGt20N8KOih08k9soRpzIaro3Bmi7Kcqcs4bNHv/p
	h1YA==
X-Gm-Message-State: AD7BkJIf7ZnkVEYO2ZdTdmLuKs6r9GV6qlbOj4Noy0eHB7nhc5Ig9xaKoRMaTxjdiaU1lg==
X-Received: by 10.194.71.177 with SMTP id w17mr3330675wju.36.1457009541805;
	Thu, 03 Mar 2016 04:52:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	up6sm40484580wjc.6.2016.03.03.04.52.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 04:52:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 13:54:21 +0100
Message-Id: <1457009661-1861-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-oe] freerdp: properly fix QA issue
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
X-List-Received-Date: Thu, 03 Mar 2016 12:52:22 -0000

* without x11, wayland, directfb enabled there is no bindir directory
  so the error wasn't about empty /usr/bin/ being unpackaged, but there was
  /usr/bin binary which was winpr-makecert installed above, fix by creating
  the directory first

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 4c81b57..339a053 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -59,13 +59,10 @@ PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
 # we will need winpr-makecert to generate TLS certificates
 do_install_append () {
+    install -d ${D}${bindir}
     install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
     rm -rf ${D}${libdir}/cmake
     rm -rf ${D}${libdir}/freerdp
-    # without x11, wayland, directfb enabled this directory will be empty
-    # causing QA error: ERROR: freerdp-1.2.5+gitrAUTOINC+62da9d28c6-r0 do_package: QA Issue: freerdp: Files/directories were installed but not shipped in any package:
-    #   /usr/bin
-    rmdir ${D}${bindir} --ignore-fail-on-non-empty
 }
 
 python populate_packages_prepend () {
-- 
2.7.2


