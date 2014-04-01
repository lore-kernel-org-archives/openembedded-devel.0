Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id B77956F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:38 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p61so6689335wes.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zVQw/PXnOVQkoC5SmKxuoqXCCvu5zSk0fT1OK/vOWkg=;
	b=Z5E2nakbYUsdIB+dTS5Ak2sfwMv4mUDkXcR18vn7RI4zCLk0hcHIfx1R+sJieZ6Wbn
	rFIVW+/VnE7ao3d4mxgZcgGpdzqZSUxistQpiaeaMlJL/xzla/vGO58n4nLOrLpLMMRP
	XF+WrsZxklDMQmEZoFMB5zOPN2cifV9mjfjqhrP7QP+q5mkGtxMUCKyv/jTTVymUcJPM
	VDf1J1BDhGm5VzDi67eqo5R7q7/d/T6lAGbqEwNXfWzTsW58IMeJQUnEGSuIXEopPSrr
	/9VUiPTh5SiRKB+Qu+iP0LBXvNfe0VoM4F8X/gPzIiabCPQG4UY2SmagD2jVKvekwjaC
	bbwA==
X-Received: by 10.180.19.69 with SMTP id c5mr21611396wie.7.1396372479208;
	Tue, 01 Apr 2014 10:14:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm41855632eex.21.2014.04.01.10.14.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:28 +0200
Message-Id: <1396372434-10710-20-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/46] dconf: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 1fd53bf..38b2789 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/gnome"
 
-inherit gnome gsettings
+inherit gnomebase gsettings
 SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
-- 
1.9.1


