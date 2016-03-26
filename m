Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04E266067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:26 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 14so8508269qgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=453PhOOSbZ80Va6yWWvITUA7RqL63H8ernkoVRdmt/o=;
	b=XU3Fw9oJAcIZgolm69NWHsU6r4sg3uKYexV2fP75gkxqj0DOeo/yO6f6S4LMZAZUja
	FZYRiZLwT9OUEDv3AvrrtAtp46PTseag3jO+I7dXYBtPHUwtP3dYLrKLWKrb7GFkTluD
	pnUChUbOEm9CZ4Xxu1dFTIFfHiZ82WUXf/vew4k/yeYPsy6YzTL9rYRUsuF3Z4UimgmO
	Iq8KkMU3KYszw7iXMMwoxXFg5I06I5Vj+Zi/gcPL1y5643y+KvRdv9zrhl+2+tFAY++O
	GygpENTDtN2d5Gz8VtVLPb+5twJU+mdNV2GfxOiv+MWnmac3byQ4gz/xNZ4UjCAlYJ0P
	KEhQ==
X-Gm-Message-State: AD7BkJL/xHWICGJt8XEfTwDTNCgIKNpcQqrqxD4nCPwxncZKqoMvEp/GfPiRd5HNv8l5Nw==
X-Received: by 10.140.102.232 with SMTP id w95mr23179342qge.21.1458997526846; 
	Sat, 26 Mar 2016 06:05:26 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:50 -0400
Message-Id: <1641c10a585fb7fa0ceca1c43198ac674f1c0eaf.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 30/30] python-urllib3: update to 1.14
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-urllib3_1.10.1.bb => python-urllib3_1.14.bb}       | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.10.1.bb => python-urllib3_1.14.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.14.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.14.bb
index 89f7428..4e30991 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.14.bb
@@ -1,15 +1,11 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3be3707c5f24a69709682265e29566fe"
 
-SRC_URI = "https://github.com/shazow/urllib3/archive/${PV}.zip"
-SRC_URI[md5sum] = "73935fe42b6ef51d078edbbca7c1bd55"
-SRC_URI[sha256sum] = "5fadd55b46bf826e46a482bb3d53662a8a88d8f9ea8656e351b659b8ad9bfc0f"
+SRC_URI[md5sum] = "5e1407428ac33b521c71a7ac273b3847"
+SRC_URI[sha256sum] = "dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37"
 
-S = "${WORKDIR}/urllib3-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-netclient"
-- 
1.9.1


