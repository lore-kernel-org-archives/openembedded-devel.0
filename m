Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCWCH-0006gt-15
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 15:12:25 +0200
Received: by wgbdr12 with SMTP id dr12so4394229wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UjVexw3RY2J4QnkOM02I7x6fkr62+9OZavKZSkdTqZo=;
	b=K1nIrG+uxHkJNlR3JyYIxZkJ6VY9eIyIyhxO5rkGugHXhcQx7pQd/0TNqJQaO8Cpnv
	F41dk7/cDLRzuD2CjQXOo0i3GDmlBg9gqPQ+mSeWnG0M1j2EcJLEK9Q4GkQYgUMb7t0f
	tuhM8qLNxXMgSBXEDzJ51OR8NgBa4fcOW0RqkxjF4fwmVgFMqq95UN5C7TNsS+XHsd8h
	+twGbOZB2LK3ZuEF1OcuZTiPJ22R4GYNPYd7YpVLgxNM7uwGxqU9n2BrAAZM59c1o5va
	rYkk/kX2FqGD400cA1chudBE51EWmNs2+zaHYBR75uHCRkuKKwNgcDapjakb5zTZuWf2
	oR5w==
Received: by 10.216.136.100 with SMTP id v78mr14847057wei.88.1332853404350;
	Tue, 27 Mar 2012 06:03:24 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id 6sm12618089wiz.1.2012.03.27.06.03.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 06:03:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 15:03:17 +0200
Message-Id: <1332853398-9501-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libatasmart: fix QA warnings
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
X-List-Received-Date: Tue, 27 Mar 2012 13:12:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix the following warnings:
WARNING: For recipe libatasmart, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/vala
WARNING:   /usr/share/vala/vapi
WARNING:   /usr/share/vala/vapi/atasmart.vapi

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libatasmart/libatasmart_0.17.bb                |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb
index c8f75f8..6162b58 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "ATA S.M.A.R.T. Reading and Parsing Library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
+PR = "r1"
+
 DEPENDS = "udev"
 
 SRCREV = "v${PV}"
@@ -15,3 +17,6 @@ inherit autotools lib_package
 do_install_append() {
 	sed -i -e s://:/:g -e 's:=${libdir}/libudev.la:-ludev:g' ${D}${libdir}/libatasmart.la
 }
+
+PACKAGES =+ "${PN}-dev-vala"
+FILES_${PN}-dev-vala = "${datadir}/vala"
-- 
1.7.6.5



