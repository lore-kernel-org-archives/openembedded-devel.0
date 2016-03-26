Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 415ED73167
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:25 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 14so8508258qgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OpstDI5v6PPeP3HIKxKVsSkDP4eEdFCbMx/Vr5alJ4s=;
	b=GU4RTG7cuh4/t77TnfQ/p/TarL5fi7QHS9oRJoIllFAn3sqc0uAhd95HI6XUMEnQYm
	wAwrO+gzq8qz56UMBxPJt5+zOjHmWAoIJYaVDGtRxzZjCj20212sSnMVoN2qgWNcMXP8
	rSM3ugB11Y6ld1UveoAPHi01Y1Ply2DdUeYTDfij4yLa4kzYVXhBDkOGdg2oqglSl8wJ
	iGvESXR5vB/L+xi2Qzs6P6AIlNvo1CQqiSkPs5qQXgyiXDChAXrsj9vKgJ0xPSwxoPrs
	SwZbwhYVF838QK7/IZdao3ckm7UNS+PubaZNwKFlqgJ0fA5/oqPKl8sKok3Ks2hnatlJ
	V2XQ==
X-Gm-Message-State: AD7BkJLUWQQy4m3X7TVfZO+twcOQENqQGxmo9bzYYgcs6M8Ld4zR6aqAbHiMDId5DxiksQ==
X-Received: by 10.140.99.72 with SMTP id p66mr23250310qge.16.1458997526213;
	Sat, 26 Mar 2016 06:05:26 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:49 -0400
Message-Id: <9b146d4fda183ac8dd784935fd14da31309f50eb.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 29/30] python-sparts: update to version 0.7.3
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-sparts_0.7.2.bb => python-sparts_0.7.3.bb}    | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sparts_0.7.2.bb => python-sparts_0.7.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb b/meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
rename to meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
index e9a9e64..a125311 100644
--- a/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
@@ -1,14 +1,11 @@
 SUMMARY = "Library for rapid service prototyping with minimal boilerplate"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c1554636a564da3baf037ac652fc831"
-SRCNAME = "sparts"
 
-SRC_URI = "git://github.com/facebook/sparts.git"
-SRCREV = "128cf9c2f82b00cb2d8648033970870c73641f02"
+SRC_URI[md5sum] = "6aa8815652c6f5e5e8e5b2ac1813dd87"
+SRC_URI[sha256sum] = "b25707c349079a7c888155e7fdfd8394df2da9aca9c8eee4e205528cb16b7662"
 
-S = "${WORKDIR}/git"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                python-subprocess \
-- 
1.9.1


