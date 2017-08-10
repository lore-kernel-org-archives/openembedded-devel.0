Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9F477F70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 00:58:13 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15so7457315qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 17:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aMQ47igudw0XkGa1tHhcr8n5m1iLxV3w1xrzftAExNY=;
	b=ZFwQM2zIKdcsE9jA7599D8pLA7VgUyH2/0tzWkfWMddrI9vEyX/sm9VvvVTqjaiBsF
	enKdvfnw+9TZMGRghvqAhjI277jCDUCMB1DFGA9DojDDxLP5u5NdSkEdbbNv3XSQ0eDe
	m16BcfUikXybdvQ5tKMxdw++mzOPpWVKgBpNf/CfmNqMZeanBeS+gOzayjTfL4Nw+8Z4
	cSg6NxE001UqKr3jIZfTdDewYXzenYPRJ8QHoHkySUHy0OV42ZCsSW71qlSm2bmhPNJk
	9WP/tGFJToQuR9HwrJBqRGIhEF7Dlp4hhunhk/AxJ4w/ud1usbMkBdw3mA4E70N0nVz7
	JFrQ==
X-Gm-Message-State: AHYfb5hh1ctQEQnqdfyRorvd8mCDeSfo4NM+PP0DM9PO57liFCtIQS0f
	vx6QqLjM4JRyXEwzFK0=
X-Received: by 10.237.37.193 with SMTP id y1mr14751020qtc.181.1502326695050;
	Wed, 09 Aug 2017 17:58:15 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	k97sm3013406qkh.29.2017.08.09.17.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 17:58:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 20:57:49 -0400
Message-Id: <1502326669-29197-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-idna: update to version 2.6
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
X-List-Received-Date: Thu, 10 Aug 2017 00:58:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-idna.inc                   | 4 ++--
 .../python/{python-idna_2.5.bb => python-idna_2.6.bb}                 | 0
 .../python/{python3-idna_2.5.bb => python3-idna_2.6.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.5.bb => python-idna_2.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.5.bb => python3-idna_2.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index d099c0f..b1d0d18 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c9ba5acd829579492fd5eb306c7a0565"
 
-SRC_URI[md5sum] = "fc1d992bef73e8824db411bb5d21f012"
-SRC_URI[sha256sum] = "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"
+SRC_URI[md5sum] = "c706e2790b016bd0ed4edd2d4ba4d147"
+SRC_URI[sha256sum] = "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-idna_2.5.bb b/meta-python/recipes-devtools/python/python-idna_2.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.5.bb
rename to meta-python/recipes-devtools/python/python-idna_2.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.5.bb b/meta-python/recipes-devtools/python/python3-idna_2.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.5.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.6.bb
-- 
2.7.4


