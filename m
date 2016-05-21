Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8CD60589
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 12:21:53 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id y6so18044905ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 05:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lNPn/+q/zQB4XLiUw41P/bb89avqwlBymVUK0h75xqs=;
	b=nE1FO/nFyk+HORQYDu9QUeA35hEZHOukMLwp4P8tPJ7mD5A7ObvV00AYIunY+E35Cy
	gqe3AqICAGPLQaRB+RXxXwBhmFMNBxqQme7MyRuoah24gJOqMo0XcgKNlbO4YsiDMgi0
	hjIAMmDkJCfhKMBXtrTUCcHe/IQiwBs6eDqAgYZtnKa9ehzjfZicbcjr4AwXiP1aPbw1
	5vFjUDgUcExg58c0tEA+HAIU9o5eWFAkrhqSbdNwCFL/ggLRxrwuzY9JmsUdFLERAQVx
	Nsb2Y6yrXT53QS5zewDH1OEy+Y1pV7vzAofV7taP8tckgCOcrS8ZlSKYV6Q2Xuphm/Jb
	/NFg==
X-Gm-Message-State: AOPr4FWX/bLHy1gabOt+vXt+wildY4lDAx0ktDTFp3Wrxz3Fh/xXBPk/ZajkrAo9WcqKAQ==
X-Received: by 10.129.97.85 with SMTP id v82mr4504925ywb.109.1463833314312;
	Sat, 21 May 2016 05:21:54 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.71])
	by smtp.gmail.com with ESMTPSA id
	j3sm13821912ywj.32.2016.05.21.05.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 05:21:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 08:21:26 -0400
Message-Id: <1463833286-6457-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-backports-ssl: update to version 3.5.0.1
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
X-List-Received-Date: Sat, 21 May 2016 12:21:56 -0000

updated license checksum for new package config file

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
rename to meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index 5e2d174..3d0f21c 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -7,10 +7,11 @@ match_hostname() function for performing this check instead of requiring every a
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95a5ee8fd779fbeca8b4cbca64433c87"
 
-SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
-SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
+SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
+SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
+PYPI_PACKAGE_HASH = "76212dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 inherit pypi setuptools
-- 
1.9.1


