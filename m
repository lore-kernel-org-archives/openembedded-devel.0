Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0945A605FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:58:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n6so13108512qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RncF/IyZ8cUdimFfJQFtaG7RSyyyy5JIx3Xpi8BRu80=;
	b=gp3FbesiohVjzvLALX5f+97vVo13Um3+NX00w36hufUGcfvJd6zQLhsyPSegX37gdc
	VcU3Wj8K3vCWFUud5/5V/MwKb5Llv9l9acmsgONRvSQtEUH1Z2cNHRa8PLKcLxs29N6n
	bs6T1ft5ZDPNjoX0nNe7xpRGvflkU7MxES6DtDJa3xkADk7NUoHDIglH5vibBRXELkBl
	IeyDkNLfMIQ1FDcbQjVmi80FHmt/PAykmSwzXVVqlA+G9XkrUE/C2XARfpbgulC/Lb9m
	5yj61sLXg2uWKyt597Rk/9uRz7Lrx0vAF7cxCMVEW7ihznNvx6HhkeJV2Gm5EmvPFB8G
	Dgbg==
X-Gm-Message-State: AKaTC00CjUO/tda3HR0C+qpAgEb791NGF76v5NSughGZ5H6clBQn/uvcwzcs/ESDBDyVTw==
X-Received: by 10.237.32.70 with SMTP id 64mr440120qta.163.1479351502055;
	Wed, 16 Nov 2016 18:58:22 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id i19sm479919qte.8.2016.11.16.18.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 18:58:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 21:58:09 -0500
Message-Id: <1479351489-31658-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.19
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
X-List-Received-Date: Thu, 17 Nov 2016 02:58:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc                | 4 ++--
 .../python/{python-urllib3_1.18.bb => python-urllib3_1.19.bb}         | 0
 .../python/{python3-urllib3_1.18.bb => python3-urllib3_1.19.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.18.bb => python-urllib3_1.19.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.18.bb => python3-urllib3_1.19.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 938eb5e..70035af 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "1eadd93bd5e58d3528d977111f2997ea"
-SRC_URI[sha256sum] = "d30dd4d1cbbc36ebab6e4a2076820cfe0c60f10adf087fecbc5a3edae79fdc81"
+SRC_URI[md5sum] = "4aa7c6c310cd938683e9b1831e110bac"
+SRC_URI[sha256sum] = "87f362d061184191d07ced0b947d8526f3e1884f21b0fe97fab313dedcb895be"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.18.bb b/meta-python/recipes-devtools/python/python-urllib3_1.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.18.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.19.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.18.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.18.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.19.bb
-- 
2.7.4


