Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.16879.1630890882278072475
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KFsmLXPt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630890880; i=@fujitsu.com;
	bh=uzmtbyjD1teLPkrEJRgUW49v8dk+Y4SbiNoK0gLnEho=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KFsmLXPtmTlKTvhl/QpMXfgfQdRclmzVpkMBSIXu/OaTizxOUaquD5rcQUg4/m7Ta
	 0RxGj7MUAG15QkMw2fricjr//+UpXJqCbZeiLA2HAe8MA31yEQcrRnxOT1N3zmarcW
	 yPT3meBnnAUacQK5KHSQRxAnIWB/MGa4tlTrSz1iDFXzVZ72um+E6p9wYSTuSMkBde
	 KimCX5V+9DR94Vte2qt6/aKhdV085q3HOwWN5OX1GUowT0PH4C9V56F6h+QXKoidBn
	 8JfpMSFGIlaSaSg7ZsBuhb+R1Rcx6qy/5M7AJwMiFmseJ8mkN190ZuaXTxUf5AAj3c
	 K1dLnwSboHNxA==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 45/85-29877-F7B65316; Mon, 06 Sep 2021 01:14:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRbc+2zT
  RYNVXBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZ/nVMBeeFKxb++cXYwHhFsIuRi0NIYBaT
  xLZNS1ghnOOMEttWnmLuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897F2MHBzCAm4Sd
  5YVg5gsQOEpXX4gFbwCThK75/9nBLElBBQkpjx8zwwRF5Q4OfMJC8QUCYmDL14wQ9QoSsy+3M
  wCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTWNdI1NdRLrNJN1Es
  t1U1OzSspSgRK6iWWF+sVV+Ym56To5aWWbGIEBldKIZPxDsZrrz/oHWKU5GBSEuXVsDNNFOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBG5UFlBMsSk1PrUjLzAEGOkxagoNHSYSXHyTNW1yQmFucm
  Q6ROsWoKCXOqwOSEABJZJTmwbXBousSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe1nigKT
  yZeSVw018BLWYCWtz20ARkcUkiQkqqgSnl+8vprgI7ror//KfHGalaUdNUtmXGkruCm6zuX68
  RvBhyXeNFjo/+mUtVoiFTJsr8eMvOJMq1uaRxubaaWI1EUI/g+n8h5kd3dpanX18daFTlOp3z
  zUHBY79NOBexfDjwWvPyEhF+4xvr123v+X7qm9HmF296jHeoSIrt9Uu//rIjIvKqxer2Sbkrd
  BOFFh1ImyBYeWuKSV+6lcquCs6bnck3LSa5BaXcz1KrjWN2MEn+oHrbLbFw64z553c0GdfYNt
  fM38h3SY9nUuPpxo7jBRdto/TctAyP7+f07eZi36X4ieN6CeOeWfKe6qdOZ7B+Orma+d7C7t+
  3j5XfEz/3df9K6RT3DVPUNvsVlCmxFGckGmoxFxUnAgAccIxRKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1630890879!193112!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11267 invoked from network); 6 Sep 2021 01:14:39 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:14:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861Edgs019263
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:14:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:14:37 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.9.1 -> 3.10.2
Date: Mon, 6 Sep 2021 09:14:28 +0800
Message-ID: <1630890868-12113-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release date: 2021-08-26
SHA-256: 059743e48b37e41579ee3a92e82e984bfa0d2a9a2b20b175d04db8089f46f047 (json.hpp)
61e605be15e88deeac4582aaf01c09d616f8302edde7adcaba9261ddc3b4ceca (include.zip)

Summary
This release is made days after the 3.10.1 release due to a bug in the release script:
The 3.10.1 release at GitHub contained the correct files,
but the associated tag v3.10.1 points to the wrong commit.
This release is made with a fixed build script. All changes are backward-compatible.

Improvements
Fix the release scripts to correctly tag releases. https://github.com/nlohmann/json/issues/2973
Fix some -Wunused warnings on JSON_DIAGNOSTICS when the library is built without CMake.
https://github.com/nlohmann/json/issues/2975
https://github.com/nlohmann/json/pull/2976

Deprecated functions
Passing iterator pairs or pointer/length pairs to parsing functions
(basic_json::parse, basic_json::accept, basic_json::sax_parse, basic_json::from_cbor,
basic_json::from_msgpack, basic_json::from_ubjson, basic_json::from_bson)
via initializer lists is deprecated.
Instead, pass two iterators; for instance, call basic_json::from_cbor(ptr, ptr+len)
instead of basic_json::from_cbor({ptr, len}).

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{nlohmann-json_3.9.1.bb => nlohmann-json_3.10.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.9.1.bb => nlohmann-json_3.10.2.bb} (82%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
similarity index 82%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
index c0a1560cdb..d2015771ac 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
@@ -2,12 +2,12 @@ SUMMARY = "JSON for modern C++"
 HOMEPAGE = "https://nlohmann.github.io/json/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=dd0607f896f392c8b7d0290a676efc24"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=441793d25a658d58d79a1f87516a6ad1"
 
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1 \
            "
 
-SRCREV = "db78ac1d7716f56fc9f1b030b715f872f93964e4"
+SRCREV = "626e7d61e44dee32887126c8f437dd077dec09cf"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

