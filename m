Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id C163F7FBA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:57:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k197so14703956pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 17:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFEU3jN9mt2ODpUjali5XO7IM/0iVI390Oz5NjBxmkw=;
	b=Sg8WNq8nkmdKf/jXmRBjs0rkjz3F/Ijthz/BZGcq3QwNJbT5JCAsqQ3NJx4v+xuiu9
	FRkEtJ9rlJ49ZbijTaQ9uuymNUT44p3CgWRUyb9DxGdWT875RMP4JnfzPSVxAyqwLDu7
	cOXug8lIMpXimKET/1RqvdjO3pv8c44/oz18HN56h3Y8CMsMpZTJbn9BJ8EPt/ee4+ih
	xXakcfzPRSmHpWzz3UTMkF7GVhXbEXZmEE+U1QTNv4TaeKe+Hk5FcXkkau7iykXVy16k
	O+lFPZfu5ufaMh7n0676EJXBZVSaoXGOcWcZ+Et/TNIOrsMG+wVHnFMoNE/tAplMt33n
	vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFEU3jN9mt2ODpUjali5XO7IM/0iVI390Oz5NjBxmkw=;
	b=gMRAeN23QnltoZ9OdOCkEsTxWW72/yr3aw1i6xlO0iRlQcdn4DN742wYJwomus9rxd
	yHFLo6uKmo0mFwNfvmYah4D1RkJiMe7X8RJ2ylEWvSAQpWtAkd27XdUsSBIY7TFNOg/p
	OXsXw7gGSP7MNewn/Pw2Bqhtd6vgOfYf3bEUjldrn53sciLPmWdYMWPdbSRgLftfckIE
	jiAHH60fWt/lGP37ReqRH7bi+bPTz5zLTannAlPOAIJ84M9urr2y3vPeIlcXg2DPwAp6
	A++AJ1o8++DIeDy0qsymoUzdl/owLTWfPyyRfhhts8lG0GiOgha/QrsbhEylKkOtvhqz
	fUQg==
X-Gm-Message-State: APjAAAWd7ruIORigMG3e+EYm6Lg6/HvDfUY0MKgC7eIQmql538rZMEDe
	Ft/9Z9msPYPUv6lhIAKk0ge8Z4NXdHo=
X-Google-Smtp-Source: APXvYqwup902+WFIuEO9xggpaKCWAU9yAcFjm7OFCV2dwH1A+EVA1/wY4HQghfQA87Yp22HtPwBydQ==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr57059875pgt.124.1579485442672;
	Sun, 19 Jan 2020 17:57:22 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	x33sm35274588pga.86.2020.01.19.17.57.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 17:57:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 17:57:11 -0800
Message-Id: <20200120015711.32856-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH v2] packagegroup-meta-python2: add python-soupsieve
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
X-List-Received-Date: Mon, 20 Jan 2020 01:57:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 8ee9bad9..41ba3abd 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -57,7 +57,7 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
-    python-netifaces python-configargparse python-sqlparse \
+    python-netifaces python-configargparse python-sqlparse python-soupsieve \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.25.0


