Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 915136CE34
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:25 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so3652407eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Kxkf56stg3/D1inWuqlQnoYR0hb0bnpXKLgXrqIdAOI=;
	b=eN+wuqjkyXDS6urcLGX/HHOwNr01azKb62sToELntSBRVqPFH99ShwZao2rRhxOyBF
	zCJ0HrjJCi2Y8FbwBcq6WK1iULcHYquayijdI6bM5IJYCLNeEQxlGed2q88r8FoaN7RF
	wxDbiv5qjk4b9SQMMHZcOU4WF4JAbVvZ3AyYd5EfZtMBbZOl/6w9Ku6uAy3j5X/g/D/p
	WEhv3BM1X+rUnnrgFrMhnEp7QZYguWkZUO3NwyF/Y2JXnd1FhdcVP65VkTIoC+Vu6UqU
	vFY/sJgnyAEfO7cXtjRXev6cCX2kseDcS3wBJ5bG6hvoqx38cv1FwdKl5kCkI30ThnRl
	72xQ==
X-Received: by 10.14.5.3 with SMTP id 3mr17791eek.49.1381187066672;
	Mon, 07 Oct 2013 16:04:26 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:53 +0200
Message-Id: <1381187036-3005-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 3/6] xfce4-settings: add exo-native to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2013 23:04:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes (found in Martin's world build)

| /bin/bash: exo-csource: command not found
| make[3]: *** [appearance-dialog_ui.h] Error 127
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-settings/4.10.0+gitAUTOINC+b7a0e1fd77-r0/git/dialogs/appearance-settings'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-settings/4.10.0+gitAUTOINC+b7a0e1fd77-r0/git/dialogs'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-settings/4.10.0+gitAUTOINC+b7a0e1fd77-r0/git'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-settings

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index f3f5634..f7d5de3 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
+DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
 
 inherit xfce
 
-- 
1.8.3.1


