Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4DE60667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:40:22 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id n16so5044561ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cyM+VyY4TBD7xJ60DO7QPg/gZDnt5GS5fzGrbvZcRHA=;
	b=Qd8A1Cw4UtQGQm25m+gpNWT5tEuwY7q66xO5tQzHWkidi+rLp7WBZ5KNSXzvmcwefb
	XyGGBUjFuHPe2qdbM6aHCToECbZ8mrwx2QZQhTCfhEqjmXe0YUFUZvGMu9PCF6XjR+lF
	4wG+x4fWm3xNYtyYSIeHu3ENWY68phDwqrlJ+keaLCDqgZk081qe8nYmV3cUs0i03clM
	2gxnERdvVO9dnAomqm4lEf+JfsBk+387asERhIvb6QB7QP8Jtk2JijRdgOSYdnFBdrwP
	Y1smUrt9NtVb7QhmZN9UQ+PZvfh4dDgnBS6vBgJWlWMkhwBfNgHp6TdkEpURMjIVy+Hy
	cndA==
X-Gm-Message-State: AOPr4FWfab19S2LZ1nRQ/IkrKcmgmCazAtMoyfazUmIq1F1iYwI597TdYHT3xlpdhnNjiQ==
X-Received: by 10.13.227.196 with SMTP id m187mr5318231ywe.18.1463838022937;
	Sat, 21 May 2016 06:40:22 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	i196sm14029463ywg.33.2016.05.21.06.40.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:40:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:40:15 -0400
Message-Id: <1463838015-18352-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyroute2: update to version 0.3.22
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
X-List-Received-Date: Sat, 21 May 2016 13:40:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyroute2_0.3.14.bb => python-pyroute2_0.3.22.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.14.bb => python-pyroute2_0.3.22.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
rename to meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
index 43c6cec..065cafb 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
@@ -3,8 +3,9 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "1e7e771702056e61cf522cccc39ea09e"
-SRC_URI[sha256sum] = "aed742a7dbe55eb7f02dbb26719f554b9e92198c4b3c7ac501ad03bbb6421962"
+SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
+SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14a1a50ebdffbd50d4e30ffda62c0a05d7b3"
+PYPI_PACKAGE_HASH = "cde6f040ef0926f84ae7cbe89a883b58a04aa9415f91fd9f12496ab793698ec2"
 
 SRC_URI += "file://import-simplejson-as-json.patch"
 
-- 
1.9.1


