Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C01DA76FB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:52 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2927782wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=V3ZTY/jYEJiL5z2GOcgi3FpMryVmWQc79QEtLmWj/1o=;
	b=VLEdRyrNWQ8OnWKFNVaIc58WMz9obecTLUTZZl34kEhGz+s7ECZckLIbbhy8FhRz27
	YklJrReIWOEWX4VJH+J3N1TYZDK+GbEIkIGX1T4ehSxGGPBSzLvUWo39XsB4KfIh55cu
	4kbM4hcLLKzgZNB1/Q4WIbjurXOH0sx6D+lKBTSEPjZIdh80ix14iyJVG3svdzn3Ks9L
	yj0lI1zxcpOopbBZBM+xD6XGBRsphVcBQXoYEm/obKv6dHC6qlcuE1mk4nt8MRnoxNkE
	b7FzARDsnXg2fAKQ+PdlAATHHPkxsbZ9CzejRNqth4PXf+W7Sc8XQ71wLl23rQyIber+
	3+vQ==
X-Received: by 10.194.238.202 with SMTP id vm10mr59097777wjc.96.1442450512531; 
	Wed, 16 Sep 2015 17:41:52 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:23 +0200
Message-Id: <1442450491-14912-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/19] libmbim: replace udev by libgudev in DEPENDS
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
| checking for LIBMBIM_GLIB... no
| configure: error: Package requirements (glib-2.0 >= 2.32
|                   gobject-2.0
|                   gio-2.0
|                   gio-unix-2.0
|                   gudev-1.0 >= 147) were not met:
|
| No package 'gudev-1.0' found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
index 4364bb0..f1ecce5 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-DEPENDS = "glib-2.0 udev"
+DEPENDS = "glib-2.0 libgudev"
 
 inherit autotools pkgconfig
 
-- 
2.1.0


