Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFA3C47088
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:18:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.101923.1670066330013834055
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gWn3gnjN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066327; i=@fujitsu.com;
	bh=Q1vzA+rYGMQFBZA4Kqt5/MOE8FYJxR6+R9wGqAYtYpA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gWn3gnjNKaivM9DLfue5rQ0utBz0myT9UCUFWaIyCuzHjYAT8GuI0VryRFeBvZ4io
	 FC39zJXrpVoAqctecLc8VZ9lt4KgOzzL6Xl6LuoqinO6/tYrhnq4bp6rkTcVc6w+kM
	 2bgOoIu+PqR0ILze2o8+4UngANYOGH7BJagnpvK9lkxIhV0Q0t2nAB69fETzLkYKI8
	 +T9W7oP+224G2jd8XnmZenC/XyaDrT9iQnDQAAr8B8Jz+2iafZyFOwxKX3Ftxsz8UH
	 VEjxhHsyCxNokkskAtBsAA5HYCxmBVXlrLGj+dpN1EheGoEUnQzP5eJtKJxJEQpueD
	 1y3uMtwkbDOkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpDvdoDv
  ZYLGyxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa8e7hE5aCp7wVG7eWNTCu4Oli5OIQEnjIKHF0
  5UVmCOcKk8Tyad+hnN2MEs8+9rF0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SzgJdGz9QoriM0CFJ89ezUTiM0r4CTx8vJDsF4JAQWJKQ/fg/VyCjhLfGlrBrOFgGru37vNDF
  EvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8DItIr
  RvDi1qCy1SNfQUC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB4U4pTzXcwfl/2R+8QoyQHk5Io77GwrmQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryB+
  t3JQoJFqempFWmZOcBIgklLcPAoifB2qQKleYsLEnOLM9MhUqcYFaXEeZVA+gRAEhmleXBtsO
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV0wPaApPZl4J3PRXQIuZgBZv5O8CWVySiJC
  SamCquyO87OXvHYfqtRfElik/VBZW13K8tmzRDL8VggzMM+4ELfm4bFHLxAcyqk75f+eaXRBk
  vHHDNVuuQn3Hvd2ym502NrD3m5e+WbpL/99tNZV5t7na/t754c1SH3DFicmkX+TsV5UzyZGzF
  b+5m+kn8TnkSTJOvV8q8UTl9Xued0/XbnynF7is+Lr3/OtL0rvWnzsd35xY7nD4z+vKoyr5yW
  csDhzvvzDh4cSJjPyVoX4z73AqJaeV5iXJ7X7O+9Du4dvqxVy5B1oU639PCvZ89v1CmFvEAb6
  GJ/3LfBdaiqetfWKVsv5o3aZtZZE/DHfO3CS648qKrF/bVHR6102SK9rFsKe+ef6f6kaLP5N9
  lViKMxINtZiLihMB5V/LwFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1670066326!65824!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26186 invoked from network); 3 Dec 2022 11:18:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:18:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 79C801AD
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6DB191AC
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:18:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-geomet: upgrade 0.3.0 -> 1.0.0
Date: Sat, 3 Dec 2022 19:18:13 +0800
Message-ID: <1670066295-24879-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
References: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix bug in _round_and_pad with exponential coordinate values (#73)
 Use assertNotEqual instead of assertNotEquals in tests, for Python 3.11 compatibility (#77)
 Add support for Python 3.8, 3.9, and 3.10 (#79, #84)
 Drop support for end-of-life Python versions 2.7, 3.4, 3.5, and 3.6 (#84)
 Fix structure of coordinate values in GeoJSON to EsriJSON conversion (#82)
 Update README with to add History and Limitations sections, and to expand on functionality (#86)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-geomet_0.3.0.bb => python3-geomet_1.0.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-geomet_0.3.0.bb => python3-geomet_1.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb b/meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb
index 8e907462a..84356cf6f 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.0.0.bb
@@ -9,9 +9,8 @@ SRCNAME = "geomet"
 SRC_URI[sha256sum] = "cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29bda2e1b"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=release-${PV} \
-           "
-SRCREV = "73ec5ec96cca32f2e2461d3964fc3d4ab80248f9"
+SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=master"
+SRCREV = "7fff4438510c30e592db858b2d519eddb5837a6c"
 
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "geomet"
-- 
2.25.1


