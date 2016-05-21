Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3727E731A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:47:32 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i22so18213245ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=55Q1vMeLVAgm0L9hJRNxAaBQ6Xvh0jyclpgXy76x8Z0=;
	b=QU5RRtjxX6h1WM7tWrjEqrc1/DWZQZNz/hyhYvsM2ZfmPFa83eKsuRRf4tfP8uUZRH
	ROfqt6sVC4QtPYxQTvdin0AVw6AeqsWXCCJ2Y8VvnFU/iNtP9jYDCtfbr6hY3g5qS9sn
	vDJQocldd3fi3NlvCLzaYJK631SK562RKwfEFff0Amr/3BlnxfHcdNF2Bm3S7MxTKfGb
	YxIGlkE+NCrbLWP6XhAR6LBCC7DYSdAGmzObyyehQ3LeavkOof0OGr/odnMgWPeyuFJT
	k7HKhVj8nSwfXOdqKGOh+RUuPxq1ihCABL0U5hp7axFlpGXTWkphh0s/3Ft+x5J6df3i
	h0nQ==
X-Gm-Message-State: AOPr4FVT9ozy1GDLj70FP0wqWnxeFImDF5fDXt5vTmk8t44zTkSeK8+RS1WFz1A8wkMuPQ==
X-Received: by 10.37.124.198 with SMTP id x189mr4542826ybc.40.1463838453774;
	Sat, 21 May 2016 06:47:33 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.71])
	by smtp.gmail.com with ESMTPSA id
	m188sm14048210ywe.46.2016.05.21.06.47.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:47:32 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:47:25 -0400
Message-Id: <1463838445-20267-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyudev: update to version 0.20.0
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
X-List-Received-Date: Sat, 21 May 2016 13:47:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyudev_0.19.0.bb => python-pyudev_0.20.0.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyudev_0.19.0.bb => python-pyudev_0.20.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb
rename to meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
index aa26dc7..5557fe8 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
@@ -2,8 +2,9 @@ SUMMARY = "A libudev binding"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "1151e9d05baf6ce7b43e7574dc0ef154"
-SRC_URI[sha256sum] = "5abcbd03e4965110d1fedcbdd5532974cb4638ceef34337aa2d5758eceb54ad3"
+SRC_URI[md5sum] = "30c19f94dba43b6f5a010285838a3f45"
+SRC_URI[sha256sum] = "14d85bc9611dbf798732996cb7107858f58a3a1b9d246e4063c7a20ade65842a"
+PYPI_PACKAGE_HASH = "786a2fc9ed0ffbcdb480a026274ca221b959de6c549a67753ff4b3c790db0d8a"
 
 inherit pypi setuptools
 
-- 
1.9.1


