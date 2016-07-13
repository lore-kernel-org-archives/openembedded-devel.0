Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7498F6FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:37:44 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id c13so2271268ywh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MwEG4iGAQ8AKs+SIMMZ0dPE9vhzrfEEEN9rKr2QsJv8=;
	b=OZxND4fsy3Y71JWSHyNvjiwY65Bfyi4t+pZNrtgmsIgekb8UvMjEj1qu92clHBWUsA
	Wj5B6y3txPhLQaxwRxyJfImdO3Aqp7bIyvoORXOIm6yXsvFdd9Cc7hiAdkfW4VQLPg7T
	Zu1uMsw85zpEWWJeDGZ6Mx5avLDP8JmgdpY4g2riN6T0aHeYFURSHNitp7b6AW+caIKy
	e8LD4BSjJlUeJSOLC6t/D59djVpxUn0AbhjcKMu47ZGnbWlFSekOmMlgLNK5x2lDST1f
	6cgkT8DAyEyohfa1OQpT1vOlkctCftUb39cWeG4GTxYmzjSTJSMO49Krobd7ow14gUdi
	lIXw==
X-Gm-Message-State: ALyK8tKfRu1B9FU+WTc/toB1bmU0V6wGO+xqWbmvf96EOx1C+BY6smnhElDjp2ANnsIULQ==
X-Received: by 10.129.78.147 with SMTP id c141mr4000135ywb.57.1468377464535;
	Tue, 12 Jul 2016 19:37:44 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id
	h62sm6738582ywd.46.2016.07.12.19.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 19:37:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 22:37:35 -0400
Message-Id: <1468377456-5886-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-cffi: update to version 1.7.0
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
X-List-Received-Date: Wed, 13 Jul 2016 02:37:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cffi_1.6.0.bb => python-cffi_1.7.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.6.0.bb => python-cffi_1.7.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
index 7a02514..6f4d77a 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "2fae9160991afefb20ff0fbde3b14faf"
-SRC_URI[sha256sum] = "a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db"
+SRC_URI[md5sum] = "34122a545060cee58bab88feab57006d"
+SRC_URI[sha256sum] = "6ed5dd6afd8361f34819c68aaebf9e8fc12b5a5893f91f50c9e50c8886bb60df"
 
 inherit pypi setuptools
 
-- 
1.9.1


