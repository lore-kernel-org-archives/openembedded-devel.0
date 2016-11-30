Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D62271AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:35:41 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n204so219128773qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YUQ5NcoKNjppQQTml8gQM+sQOM938nx03uZVWDhPh2M=;
	b=ZRqpYokU0iqj7iRnZYgcuKAXcIYDQMfi70Bm2RR/R4tnpxIhx10sAbsNjvx4txJOCo
	hpNgYHGMbD07HBLuDZY4pVHoYHt/h4D8isnlvD6Pz1srwlfz6e/n07/lmnEjIQC3Y4Q5
	daPeCG58wPzjgi5xzQbUA5SEsFJJR3MBCXYJYwaG1O1jcCQAqETqfmi38H8LZhUk4B/1
	35S0VqzrJgFuSwQD18J6jf2HLnAVpTpUGpf+n5CB7ELWNTYFZU3TWy0681KiSJZ3DOdp
	HEXq7YAW4tXQn/QroEoNZ4zpd6YF+WAh756TwT/RP3ya/gpLn/HnnbGgp4mJfu5s9Fjz
	p1Ww==
X-Gm-Message-State: AKaTC03PrO+ml1hw7q1KC9GC71cUWnK9vlxWXbvFyQOIQ4fB4/xakRabyKetvXZJhW3S2A==
X-Received: by 10.233.232.200 with SMTP id a191mr33123526qkg.208.1480530943434;
	Wed, 30 Nov 2016 10:35:43 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 8sm1287646qkk.2.2016.11.30.10.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 10:35:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:35:36 -0500
Message-Id: <1480530936-21125-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pip: update to version 9.0.1
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
X-List-Received-Date: Wed, 30 Nov 2016 18:35:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_8.1.2.bb => python-pip_9.0.1.bb}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_8.1.2.bb => python-pip_9.0.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-pip_8.1.2.bb b/meta-python/recipes-devtools/python/python-pip_9.0.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-pip_8.1.2.bb
rename to meta-python/recipes-devtools/python/python-pip_9.0.1.bb
index 8bb052e..2851761 100644
--- a/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_9.0.1.bb
@@ -2,10 +2,12 @@ SUMMARY = "PIP is a tool for installing and managing Python packages"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
-SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
+SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
+SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
 
 inherit pypi setuptools
 
 # Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
-RDEPENDS_${PN} = "python-modules python-distribute"
+RDEPENDS_${PN}_class-target = "python-modules python-distribute"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


