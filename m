Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0164877DD6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w43so19841773wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Mq9a3PmvGwIQHTn6yMqzDSDN+fT+IVk1RGBNcE6Oyjw=;
	b=R4POK7g34z7Z9ikc+0o7p5R6cIeRo2fRwG62B8fu8k98uVG67FxRuXWjCg1gspVEa1
	Q5QUA8yR4ziEpTOFNr8uw3WXxTkCENE6bLjP/HZxB9DyWvX7bL//fjaibZhg3Dz69xqA
	sgppfMw0069z4iE7go8a99GHsN+owGzu+1vUnlwQfR6tvpM0nWFdj3IshTj9RjIbciY8
	EA1vin/5hGt4C8uC0w4GkoZ+zylLSSCS5im9H14mwQ9Ve7mymGXKrtU6WNY3S8UfnTEG
	RKlD8Ni3ajCv0Dij5jP819UcHva2G1IzEUEyqTWhldUX1J1lKTAedjyA1HqJBZe3VwpG
	TYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Mq9a3PmvGwIQHTn6yMqzDSDN+fT+IVk1RGBNcE6Oyjw=;
	b=KScBdOw9fDsKh4fmY5eHllkpkiVGv7kR9hTVNe60+RwN/HomzM50N0QTnlFvrtTxr2
	dw9w6CJ2DElFG0Fd7SorTQ0xomC5Re6Ub9DVYruOTRHs3UMcMvCthiMTqrVZ6il1hA9R
	pvRRM/fGBOKSUFWv22M/i3iUaFdtRK+fY1xvikv2OxWZtIPnf/a203O3HGB/G719rvt/
	Ig76VSRLvW6Gwyv0QNDyUzYBrY2wK/I5vkIhJJ/qYF0UQLqVVMqwTzTiUCGrKKz9M/v/
	gkLitUv1C/RjXNTJqLG1pZ4RuorqWrt4bS63nAyf4uGS+AKNvyVM/CBcWmVjvv2OZ2wy
	xbfQ==
X-Gm-Message-State: AFeK/H0lDyQutR9ZIKsHokNLv//7fRzPd2Q3M4y1N79XkOp3IlGGvgFbUuE9W3Vj5wdjwQ==
X-Received: by 10.28.170.212 with SMTP id t203mr2494250wme.4.1490960293495;
	Fri, 31 Mar 2017 04:38:13 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id s82sm2602400wmb.3.2017.03.31.04.38.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:38:01 +0200
Message-Id: <20170331113803.31535-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 5/7] hwdata: use github instead of fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:13 -0000

* fedorahosted is retired
  https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb}  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
similarity index 57%
rename from meta-oe/recipes-support/hwdata/hwdata_0.291.bb
rename to meta-oe/recipes-support/hwdata/hwdata_git.bb
index f00f73b91..50d35c682 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.291.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -1,13 +1,15 @@
 DESCRIPTION = "Hardware identification and configuration data"
-HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
+HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "90ffce584bbcb1a5e77eac8503949f71"
-SRC_URI[sha256sum] = "e1007a96645cb3390aa9c0ed3f090a69d2302ce4d801914b6af1ab4ec85ede4e"
+PV = "0.291+git${SRCPV}"
+SRCREV = "4bfbdcf5913d6dd53336d31b8035708075e6fdfa"
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
+
+S = "${WORKDIR}/git"
 
 do_configure() {
     ${S}/configure --datadir=${datadir} --libdir=${libdir}
-- 
2.12.2


