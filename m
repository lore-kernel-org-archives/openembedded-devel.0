Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id A4BF573196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:11:30 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i12so71925ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kH5FSIXc08jyBG4vkND6YLZzVQ4sfp0PVnfqKCNtDG0=;
	b=Li7kDapUxC0oXmdsu3s73YGoyNOsof2Nz7WGs8VBjlEPNRl3Q7CGD5gptKzWLJrWCQ
	YqA6SXtPsPd6lQVot+jdzgbDLzK5Umb2czxGQxckXW5xpK8knp3803ogXbC+C/ZI2Q4+
	FF6aODKwIRX+2UmAS/IWF4X2ER76MoSM/IiSjIgBjfQ37PJq25zTngz1meDV/ftpKxKV
	XQGcwizm5VwZNk3BlJ2Snyt10oIrOLuPO/gUgnQcFWtS/PbuFg1xEww3qpp9YN/Pnb6S
	+7yElHXIXsCfK/o9F17pMqy9xPzbHpua3XhnkkRh0mQmcvJMx9HEAy5T0oUWuv8ilPKl
	AP+Q==
X-Gm-Message-State: ALyK8tI/gF0HPfpd3YgDYtRinggdCpj2gbuANvOIJC1WITXyFKzSKP/PIk+Rw4YdBQzhLw==
X-Received: by 10.37.60.7 with SMTP id j7mr14467693yba.22.1468285891740;
	Mon, 11 Jul 2016 18:11:31 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id 8sm7205699ywa.28.2016.07.11.18.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 18:11:31 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2016 21:11:09 -0400
Message-Id: <1468285870-24052-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] pyrtm: update to version 0.4.2
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
X-List-Received-Date: Tue, 12 Jul 2016 01:11:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/pyrtm_0.2.bb
rename to meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 3d382b9..d341ecf 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -3,7 +3,9 @@ AUTHOR = "Sridhar Ratnakumar / srid"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
-inherit pypi distutils
+PYPI_PACKAGE_EXT = "tar.bz2"
 
-SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
-SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
+SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
+SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
+
+inherit pypi setuptools
-- 
1.9.1


