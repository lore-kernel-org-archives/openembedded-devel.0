Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3846374765
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id r1-v6so7187225pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZAU63xWZGDle5X1XYLuvz5+ozxU1MGbkMY/dph93UW0=;
	b=dmwk6v+86RR0bmhwsyhuYPMaGiFcrz7QhdIK+kxwiIIjFMNIBmpy4DKUhq4fpTwhg/
	NGliwt4RRTvVbBeI5FIIbcr28nEa1VRj8qu6CsvhjDIiiKB9HSI8M/38c3PbIgqzAo5V
	gq1a54bn99RoVyWGCPe8Cmwz+JVpfo6hwWzWoWfUOZBAfcck9eKl6HV5V8hsiIlhHDfz
	6Wy23mUftPby49s/snlONcCbJsOLKB2N45DzVfcvF5suFl+ZdU+71C3NIkyN3BPrgCUj
	Mx8LfMNrVjVIeK3DCtgWdDFKd7aQF3t+f1dLiqDq483IiyebfkOMI89Fx4J5UfzVO06s
	237Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZAU63xWZGDle5X1XYLuvz5+ozxU1MGbkMY/dph93UW0=;
	b=DQEJA+q15AixjaQHB19UnFpONwZ+aTgXVnHkl+cYOrrGElgX4jh+MjNm1t9gwBMHZn
	Z3LkfX+s89C25Ff2dP5NyQ1iWkNG4MSEMDp83lhGdzhradc8HqR/S2gas1OzMch+4yAo
	iSgQwUOa7ytp3IM2Fx2pfBkzUA86pKjqj/FDfv2uE1Dt2rF1ZbDXThB7W+dFQY7e3EFB
	ycA63hB8B1u8LHbIvxJlgihnUNExQrW/5PN5pG9F1gS0SaMrMBy+rSyaTLHU7rwIj3Rw
	MbYs9b2mDOhqSAj3IDQ+UsDQoL6UFboUWN8j1B+TOq26Q15lmDGMrzB4xEb1hTnp5iPt
	Yl3Q==
X-Gm-Message-State: AOUpUlHyPdvwvd6ofMGly890bvods2rIJig3ynze1y45xvG8H2ebLWL0
	2d/QzNB5wUeIuHgZRFmFcuKBpTmX
X-Google-Smtp-Source: AA+uWPyR1dxyqwz++/SAGVAdBgZK3cWdBpaNc9U/kQMN+Y0MCww4Qqux+HJ5DMQFwDjxn+djhxOIRw==
X-Received: by 2002:a63:fa18:: with SMTP id
	y24-v6mr16246464pgh.362.1534148271730; 
	Mon, 13 Aug 2018 01:17:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:22 -0700
Message-Id: <20180813081742.6961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-webserver][PATCH 01/21] sthttpd: Add dependency on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:51 -0000

This is required with glibc 2.28+ where crypt is
no longer part of glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 81815d6526..8632b97f44 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
 
-DEPENDS += "base-passwd"
+DEPENDS += "base-passwd virtual/crypt"
 
 SRC_URI = "https://github.com/blueness/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://thttpd.service \
-- 
2.18.0


