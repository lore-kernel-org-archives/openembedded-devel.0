Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCA178335
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:24 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id 33so15822495wrz.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cACys3YxdUDa5e8+QjQ72DuBHlcPpFUG7SRoA1ljGWA=;
	b=Nm6/X8V0lke/6bN5yEnIrgSdskJcwTlKsZUDtIzJKCn0DRoFY2IHD0EcUmm/ri0AsB
	xsAnhF0qhqPnMwiadmBsEgpWA1T8dNTKkTsBvolrZeydnKy3GgvdzqxsFWTEWriIyVqu
	lG9ElFtA74zk6SZ2UVS710Kt8CQXd2RZZ6dGsc3bOQedpMUfLUcqxKt7URCd72Mtnj/O
	0QwfPbU1o40is7vGGxrwUc8Aa5XKR+JXoaMzWK10Xg96nnWtguLBNsBz++eI8v+VYJjc
	8BwmcsBGhV6B0dpPYqMibvMK2Oz/wBmkl+LUrb1zjk0LIrE3lUfiJB0JAoJf6LhVEOp9
	G0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cACys3YxdUDa5e8+QjQ72DuBHlcPpFUG7SRoA1ljGWA=;
	b=IAi++9/j7XWisAawj9z8KH16yXDMqY5Jb0w0DPmSQVLXcYUfotvBP0oHhZZykm3rAX
	D5Qwy+YySWoawA7fmW0xpmRG2kzKR0q/nE1Kidy8SWgTWx5mcO7tnfaKOwJxB1SjE1Ad
	xGrK5t827vRyAMeQ8/v50LJrMBE7D104eaquCc/yGsD09S1Wqz6bRL1Chh1t663QacSG
	pdl88Eu6WpAoRKzZ2iwi/Hwd+4xfPTsSWrSHWlHwU2xdB6iFxlvXwtkq7UbSCVgNoyvT
	99u+6lk9K20WbiQPaYyL0canrbxWD8rpfZl2BdWs0sxmt8Z6toyUeSGr4N8JaNyAD+2d
	R11g==
X-Gm-Message-State: AIVw110PlPPqRdMH2sKK6vDlIbIJGeoZklhseN/MzQ+/hMaz1Xp+6Xy1
	A8WONz+sc+snDDn/N6o=
X-Received: by 10.223.129.6 with SMTP id 6mr7212595wrm.23.1500564925422;
	Thu, 20 Jul 2017 08:35:25 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:08 +0100
Message-Id: <20170720153508.23113-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 9/9] gimp: remove libart-lgpl build dependency
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:24 -0000

This build dependency was removed in 2008 with the port to Cairo.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index 1ecd2b715..cd7e27a19 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
     gtk+ \
     babl \
     gegl \
-    libart-lgpl \
     jpeg \
     libpng \
     libexif \
-- 
2.11.0


