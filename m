Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id EFE706067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:18 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id e124so6290890qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=g17LaaViGQZGtjolwW2iqgE1T1XxqutCMPO1x5onnTE=;
	b=BJI5a0HvDdYTFILzPsxhIBdC2hhbzDivrBHt65p4psHVqhQWNyM058YnrMjh9byAWR
	lF/0usLdIBR5O+Kt+jw+v/fRgJgquGH6oGbua3LCw17kSw8aRY2Qx20IRWbtEuStBXpO
	smfHpuKJw//mgKitOQqzJhjVgQyIcUnInrF5Y/coTbx4Kuma0nJ4cwO3EEL5SRlS0eWJ
	a9JD//F18HSh2AG/bIGKgaurcDDVak/dy6jzHfvYCOUb1BP/IcMsK0PILSnUa8O09uWY
	/MQNlCs/p3+o6BuKIhEjveKNdfaZX5gsKO5AYZP6Txv3+tLu0K+2fSKoE76iAVpRrb5k
	U1sQ==
X-Gm-Message-State: AD7BkJIaVaCH3DWZ7/QcGDkbWtc2u/QN+A8VaY2Sz+nZQZ7Qs2Xh0JScrx/2IwBwffLu2A==
X-Received: by 10.55.82.195 with SMTP id g186mr23238451qkb.47.1458997519740;
	Sat, 26 Mar 2016 06:05:19 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:38 -0400
Message-Id: <8b06d21a7bfa15cff5fcb9a33d5b06520730b04f.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 18/30] python-pip: update to 8.1.1
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pip_7.1.2.bb => python-pip_8.1.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_7.1.2.bb => python-pip_8.1.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-pip_7.1.2.bb b/meta-python/recipes-devtools/python/python-pip_8.1.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-pip_7.1.2.bb
rename to meta-python/recipes-devtools/python/python-pip_8.1.1.bb
index 33e5ee2..c0c263b 100644
--- a/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_8.1.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
 LICENSE = "MIT & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "3823d2343d9f3aaab21cf9c917710196"
-SRC_URI[sha256sum] = "ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477"
+SRC_URI[md5sum] = "6b86f11841e89c8241d689956ba99ed7"
+SRC_URI[sha256sum] = "3e78d3066aaeb633d185a57afdccf700aa2e660436b4af618bcb6ff0fa511798"
 
 inherit pypi setuptools
 
-- 
1.9.1


