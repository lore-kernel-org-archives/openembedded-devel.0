Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 69CEF770CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 17:52:50 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n63so49050875qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q2q2ji2eav7GFX0nL3FGAwFd7SxmNrLDObEW5a4fl6g=;
	b=fX/atDer6O5PCRBfZkZV383N+0bL8Nsv0M8G0M5BXgbGv9TrdJNTHnK9h5B6qy9Cxk
	EXEBAiYnjmaTXL7YlRiCREEN7sZt4ZMTCqrGSv5vKqAwyUWNg39V/bmFnqdLGIZD9SsV
	/8x7xHkO7dIMBsDcwpu//QjLKV8eH5J8TzPRXu8yMDuPeB9+3VTiBw31XlH5UEa1uqZQ
	WgCw6PJKOtWj7osLGKXWaOkgST1jDPKehDqgGFjcyevZlbzAj+3CgwyCk4Qfq5EtF+rU
	QglZl4+hWI01opCo+jm1FUUr75wPGtaIIKtX+HTO2Gnr5ouzVpqgrDRpTCD+xtwa1e3W
	kVgA==
X-Gm-Message-State: AOPr4FWEidZNihclFw0OHvn04X+1XNpokJVIYSCjTotGB3/FvgpquZMh7ID7E2MMB4JRrA==
X-Received: by 10.55.150.5 with SMTP id y5mr20981681qkd.144.1461952370696;
	Fri, 29 Apr 2016 10:52:50 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id a6sm4764822qhd.33.2016.04.29.10.52.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 10:52:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 13:52:40 -0400
Message-Id: <1461952360-30867-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] iozone3: update to version 434
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
X-List-Received-Date: Fri, 29 Apr 2016 17:52:50 -0000

Update the license start and end to account for release notes

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-benchmark/iozone3/{iozone3_414.bb => iozone3_434.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_414.bb => iozone3_434.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_434.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_434.bb
index 14373b9..daa36ee 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_434.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "http://www.iozone.org/"
 AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
 SECTION = "console/tests"
 LICENSE = "iozone3"
-LIC_FILES_CHKSUM = "file://iozone.c;beginline=266;endline=270;md5=ab42a6185fd0443978871f11a007ac0b"
+LIC_FILES_CHKSUM = "file://iozone.c;beginline=268;endline=272;md5=ab42a6185fd0443978871f11a007ac0b"
 
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "a40dcda593f5841d0aaffe9f21172020"
-SRC_URI[sha256sum] = "9f60e854d7bc5bc3de15355cf5621e15098bd744a26845d11730b3060f4a5fff"
+SRC_URI[md5sum] = "3e8f4213581407225065b91774e970ed"
+SRC_URI[sha256sum] = "2c388d9db393a5505b31eca38951883744c69745f687f3c7df5185b4681d462a"
 
 S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 
-- 
1.9.1


