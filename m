Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6C7766A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:53 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so96409442wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=o9n9iA9mFfyL6RUs+LN1eHDzCu3VLvSncFqURukMCcc=;
	b=BnDa1UXitljlQLy9Ew6jPUlNt6+Pg5fWKqojVYaqtISEo3m79hN/nJBqNy1fLaPy7X
	KJfDB8PiXWL/Z1t+d0NaR6sTN/VCdzgYBZxbLggr1GqPGzLpUtlCLs5rwT3jDvxYqKDA
	pXfV5+So/jBA8FX3tCRj9zEKxGs9PBhe9I/b6C3Q3/nqJZqPmuJ+DXuR7AxQ6BgSc5d3
	GwaKL0jlVYHezF15Nbel0x1AhGuw0XFrJAX2mejoP8m3sWoKaGyL5tqE7M9HSpDm47ng
	tT9TcuLfST78zBD9EiKEbeW9KpUx5oFjJSHP6bVFySTHd4M8fUcvdFxzTsHuc/T54gIB
	cKJw==
X-Received: by 10.194.92.68 with SMTP id ck4mr28839908wjb.141.1442450513458;
	Wed, 16 Sep 2015 17:41:53 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:24 +0200
Message-Id: <1442450491-14912-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] thunar-volman: replace udev by libgudev in DEPENDS
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| checking for gudev-1.0 >= 145... not found
| *** The required package gudev-1.0 was not found on your system.
| *** Please install gudev-1.0 (atleast version 145) or adjust

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
index 6e63bef..08e6f5b 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
+DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify libgudev"
 
 inherit xfce
 
-- 
2.1.0


