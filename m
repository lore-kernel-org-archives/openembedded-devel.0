Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXw0r-0008V6-I1
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 18:05:42 +0200
Received: by mail-da0-f54.google.com with SMTP id u36so369552dak.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gGP27Kq46LAh8myUV8g7pdE3+LbIGtN0hN7yFXymd4I=;
	b=ZfWT4SUsVu4ZG0Ra7c3mlJIJj1JUFz0tEeFFu91oK6Ng9C3SrkmEdjWyFO/UiM3Blu
	yPvOkT6bVb6RwKcsayCESZRr5tpGWyYW26OTdgwzzkvYkGnNpkkAsSz8q8kbvax8WWYl
	WfzXT2Yhqar/3n3ysEVrmVrJPTjz/t3vZazSCYVr91+S2bkmQvJQcmihCGf2HRfprEER
	KIeqzC6SLRb54eaXgrdIofnVqFmg1mIACpVWr3V1GArKNXMddzjm0jGfOmSQIQHrwX5q
	Uj8oj7d0k7hVb2E3WlkoJSQ43LIpI9krFdW6qMlPO4Bqn0OLIrMlhHfs9iYgGnr7r08R
	UquQ==
X-Received: by 10.68.225.133 with SMTP id rk5mr9422037pbc.143.1367509667120;
	Thu, 02 May 2013 08:47:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id l4sm7813527pbo.6.2013.05.02.08.47.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:47:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2013 17:47:58 +0200
Message-Id: <1367509678-3948-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH] xbmc: append +gitr${SRCPV} to PV not PR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 16:05:43 -0000

* otherwise AUTOINC in SRCPV isn't expanded and stays in PKGR and
  filename
* I haven't seen it documented anywhere, but oe-core is full of checks
  like this:
  meta/classes/migrate_localcount.bbclass: if not 'AUTOINC' in pv:
  meta/classes/package.bbclass:            if 'AUTOINC' in pkgv:
  meta/classes/prexport.bbclass:           if 'AUTOINC' in ver:
  meta/classes/prserv.bbclass:             if 'AUTOINC' in pv:
  so it looks intentional

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 30256d5..0b4d696 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -9,9 +9,8 @@ DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2d
 
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
-PV = "11.0"
+PV = "11.0+gitr${SRCPV}"
 PR = "r14"
-PR_append = "+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
-- 
1.8.2.1



