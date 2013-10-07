Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id D3AE86CE99
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:27 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so3588136eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RLL4tHuyaTnFnmCkKMJow0X2RgTPVe6fyIBt6EEXSvg=;
	b=irAdS/RpRRIBmVDqwDrDR01Ciu53XG2SWsxlVBcTkL+A5JPQewuBIyn6Jm0MVPZW8v
	EXAYhitZs/je9cgQvfU5aY08+puE55iEIUo4CyIiujg+fKOys3jHC+Gi6WS1ixeKL1Zm
	CKgxT3sx6HWr/5FPXgP2m7wawBzpucJuf4yX/sP0Q1Jp1n8jTu/DmMGrq3YZapdyft6w
	vXLWV255JDv4iyCr2YEkVHVRL/CG13zeYTFLOPNrZhox2zWOnaQSp/AD/39SX7Q7UN4D
	oVU3XxYIEc5TfNlCP9cVNjznqCYLaQ4UlXrIJ6b5SkSehaOQ/d58vM+Jw99oFayLCWxZ
	D38Q==
X-Received: by 10.15.94.201 with SMTP id bb49mr53365869eeb.23.1381187069449;
	Mon, 07 Oct 2013 16:04:29 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:55 +0200
Message-Id: <1381187036-3005-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 5/6] xfwm4: add exo-native to DEPENDS
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
X-List-Received-Date: Mon, 07 Oct 2013 23:04:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes (detected in Martin's world build):

| make[2]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfwm4/4.10.1+gitAUTOINC+bce3062d08-r0/git/settings-dialogs'
| gdk-pixbuf-csource --raw --build-list \
| 	monitor_icon_data ./monitor-icon.png > monitor-icon.h
| exo-csource --static --strip-comments --strip-content --name=xfwm4_dialog_ui xfwm4-dialog.glade >xfwm4-dialog_ui.h
| exo-csource --static --strip-comments --strip-content --name=tweaks_dialog_ui xfwm4-tweaks-dialog.glade >xfwm4-tweaks-dialog_ui.h
| exo-csource --static --strip-comments --strip-content --name=workspace_dialog_ui xfwm4-workspace-dialog.glade >xfwm4-workspace-dialog_ui.h
| /bin/bash: exo-csource: command not found
| /bin/bash: exo-csource: command not found
| /bin/bash: exo-csource: command not found
| make[2]: *** [xfwm4-dialog_ui.h] Error 127
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [xfwm4-tweaks-dialog_ui.h] Error 127
| make[2]: *** [xfwm4-workspace-dialog_ui.h] Error 127
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfwm4/4.10.1+gitAUTOINC+bce3062d08-r0/git/settings-dialogs'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfwm4/4.10.1+gitAUTOINC+bce3062d08-r0/git'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfwm4

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
index b72d44f..4799460 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
+DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification exo-native"
 
 inherit xfce update-alternatives
 
-- 
1.8.3.1


