Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 539ED60620
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:17:56 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id b15-v6so5978813qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mqe6fwh7j3n+mUfbuooeVZts+owXOE4660tLEWjEd78=;
	b=smQiCBXUNTjG7h4fxHJw6uIWZ9vAFH/NoUgo4rGwyGYOLcWSO4mm910CHf8O0OTyr/
	GTw+pLAXBN/Wqk1xWj8rbjKRDnnobNs15inZbeLpLOPA4KD4obo7EbJhP12TYccqKiSC
	tzho+mYHF0ah5y3JLqZKdQw6BRCLIFZ53W7tmYK9JAosPeVvQgKYennQpB3/Ilcq8osu
	7At5OnqMJvOMxNxgtUEnkzfl9tfHwfQnm30SgYa+jkXBBmiKD0Fw1Bn2Br+vqXGNUE7d
	YEc0MMCNDxAhzwyjldpAjl0AoV0us2LRtqLBulHWgDc48EN8Jh3tWK/xJTxEBR3GKrPf
	UMoA==
X-Gm-Message-State: AOUpUlFkLgk+Z0WptQZhCAGIHvpFkBi49avqILqgCI6TR1Kv6l4Uj3F6
	OY59D8xmi/R1rBYHe/St2fHqTAL/oFg=
X-Google-Smtp-Source: AAOMgpdwweVA9+ZE+0kRxRP3AR2/FmDwh8ThPpRzucLk/reBAkGXOXUBNIk4cCC3kRlQ6Sk41xYzIA==
X-Received: by 2002:ac8:2734:: with SMTP id
	g49-v6mr7021567qtg.168.1532715476718; 
	Fri, 27 Jul 2018 11:17:56 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q51-v6sm2319687qtf.18.2018.07.27.11.17.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:17:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:17:42 -0400
Message-Id: <1532715462-19033-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to use the latest 2.7 supported release
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
X-List-Received-Date: Fri, 27 Jul 2018 18:17:56 -0000

The 0.9 branch only supports python>=3.4

License-Update: Use the actual LICENSE file rather than setup.py

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.9.2.bb => python-cmd2_0.8.8.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.2.bb => python-cmd2_0.8.8.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb b/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
index 74dbaef..f4c8800 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=52;endline=52;md5=0f13c9cfc75288223cf7edd2f3b985a2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=60bc6842001870a418935bd84570b676"
 
-SRC_URI[md5sum] = "bfe0900a2288283a40f0ee7533486a2f"
-SRC_URI[sha256sum] = "e7b6b4b76272a051c943c3c709cd760142af16fbc9218e0ed3c22b28ea38d0a8"
+SRC_URI[md5sum] = "1f555bb656d361d9b0212b07e232752f"
+SRC_URI[sha256sum] = "b08bc5088fdd131d659354e6b4f8cf7c01a70566f68aed146e00d296a24b687b"
 
 inherit pypi setuptools
 
-- 
2.7.4


