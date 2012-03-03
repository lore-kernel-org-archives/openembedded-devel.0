Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3nsP-0003xv-KU
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2012 13:15:53 +0100
Received: by eekc1 with SMTP id c1so746812eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2012 04:07:21 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.125.3 as permitted sender)
	client-ip=10.14.125.3; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.125.3 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.125.3])
	by 10.14.125.3 with SMTP id y3mr8080534eeh.9.1330776441861 (num_hops =
	1); Sat, 03 Mar 2012 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0MAMxi+adbzjpZMQM9dIDJHXxmj68uVWev2+MxgI1yg=;
	b=SP7YBHbIEUlAxI7HFKab/uW7iGPxbm2cHF7/F8NIA+NjE6RSpCopayYt1w9Nw00AAd
	MWrjB+aj+GxQOwUQs3KXYlzjwyMVtokda281pn86XLIKoKGrtthqV12zdz7QHFErvko7
	HIMTVUngThyGyLkJX02TmitEHU4VlAMA1++dNZFvcgCvCGI2UUnsOyV/54/8D1bKePIJ
	JLo0fEL8s3vYs3ODLJUtBZfkN533iAEC1VWvPrcowbmhvtgSTdUqeRapYieDMZrIOIx9
	xzHtvN+qar1PaDMy92CBo4PuNJpNyAxNqOtCiY0Y+b4n0XTmA6QhTe+rGJNdgvAQHgv5
	T6yg==
Received: by 10.14.125.3 with SMTP id y3mr6203410eeh.9.1330776441434;
	Sat, 03 Mar 2012 04:07:21 -0800 (PST)
Received: from localhost.localdomain (p4FDF1A4D.dip.t-dialin.net.
	[79.223.26.77])
	by mx.google.com with ESMTPS id i10sm33195646eea.8.2012.03.03.04.07.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 04:07:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2012 13:10:54 +0100
Message-Id: <1330776654-2913-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330776654-2913-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330776654-2913-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 3/3] xfce4-panel: fix QA warnings static libs in dev package
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
X-List-Received-Date: Sat, 03 Mar 2012 12:15:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There was a patch sent already for fixing [1]. In that patch the static
libraries of panel plugins were deleted during install. Here all static libs
are packed into ${PN}-staticdev. The decision for this solution is based on:

* Keep recipes as simple as possible
* Although unlikely there might be a use case for having static libs for panel
  plugins

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037926.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index 0cd8eba..5baffae 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
 
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
@@ -27,7 +27,7 @@ FILES_${PN} += "${libdir}/xfce4/panel/migrate \
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 		   "
 
-FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
+FILES_${PN}-staticdev += "${libdir}/xfce4/panel/plugins/*.*a \
                    "
 
 SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
-- 
1.7.4.4



