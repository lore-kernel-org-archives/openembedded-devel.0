Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0766D71AE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:45:46 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id m5so3162224qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IH/LGU1J9NyP3Vxt610AJVx6XFH6lQ7IqK0n41WSF5Y=;
	b=aZP6wrmwLqa5sh7r4pt3GjkEG5GHafi7Co4Fs26+cpTLYJI70I8BwI9YXGP4sTiDp6
	++TPYF2V+ZhjbcMwugj5FWj95l5nDbXE0hBziakAxqp4wE7D+XYabvoM+iLpjimH/Bxc
	1u0J2hRDWqpiCkYsxbyc2OqSwHpOeNDAFSOu007UcUuyGI/hsnwaYtOOKcPJrJF87YnP
	T9VHn9LVDNecCphdvyywPaRvgBR6NTehaVmJYP6O1aUiuW8NqN6peKFXdil9OeYArNXU
	WYcFfRNEHGUP0gALd3XgUaL5VZ5czK3L+3A6NJ9wIZJ79SlFGXUF4eZUp3SeYUdZM026
	o1DQ==
X-Gm-Message-State: AA6/9RnVqsc0UH1cBeDlXdyl3HA5dY2uT6Z1slOFLCwNP11h/uTxp57JYxwpNvWa4pM4yA==
X-Received: by 10.200.50.78 with SMTP id y14mr8538298qta.57.1476398748016;
	Thu, 13 Oct 2016 15:45:48 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	x35sm5967240qte.40.2016.10.13.15.45.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:45:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:45:41 -0400
Message-Id: <1476398741-27341-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.18
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
X-List-Received-Date: Thu, 13 Oct 2016 22:45:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.16.bb => python-urllib3_1.18.bb}         | 0
 .../python/{python3-urllib3_1.16.bb => python3-urllib3_1.18.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.16.bb => python-urllib3_1.18.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.16.bb => python3-urllib3_1.18.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 7b62be5..938eb5e 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "fcaab1c5385c57deeb7053d3d7d81d59"
-SRC_URI[sha256sum] = "63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c4bf9ab"
+SRC_URI[md5sum] = "1eadd93bd5e58d3528d977111f2997ea"
+SRC_URI[sha256sum] = "d30dd4d1cbbc36ebab6e4a2076820cfe0c60f10adf087fecbc5a3edae79fdc81"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.16.bb b/meta-python/recipes-devtools/python/python-urllib3_1.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.16.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.18.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.16.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.18.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.16.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.18.bb
-- 
2.7.4


