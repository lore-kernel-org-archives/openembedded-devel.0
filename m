Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE40C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.8992.1678889332344977689
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZrP04wpa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889330; i=@fujitsu.com;
	bh=QSUm7nG7TJopNFhiIfPY6kzl3um011zxUIx870J7+n4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZrP04wpat5Gy8HqdmnGXSpQ+d2UPoLxmAfy3C0mNwauuH7HlE8gItlOAf8zAfZb6C
	 rZT77cRKEmwJ8iy6ZUbjHNsC3WtcId7xljtY9oAEF6JvzQpbzL9IXzHeG5lLguq0xr
	 fVE3tE+ZRk/Z0h2k/Kmn7vzMItJ3dT+qKCNqKT+tpH3JuhlVFPymGYV4lK0wjM3dMO
	 Yi4SA+i3GLcbJ/4r3JgHyGSa5g5zfbOilZOQvIIx92Fiu0zKcXwcgNazfpwDsSayVq
	 pCGXavYwhLHjRPtG5HSs0FAowg3BUsmQPOQUziJy8rJecsJH/ohT0Yee5jd3lOEkD2
	 qE22qOS1Vsnqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSbfoomC
  KwZ2DbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8by08uYCz6LVayc7dLAOEG4i5GLQ0jgCaNE
  77JLrBDOdSaJk/++MnYxcgI5exglnq40A7HZBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCR+DRhIyuIzSKgKvGubQ9YnFfASeL2l+lgcQkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKN0w8xQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaF6cWlaUW6Rqa6iUVZaZ
  nlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZjSnGK3A7GK31/
  9Q4xSnIwKYny/lkjkCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvffGcEUIcGi1PTUirTMHGBkw
  KQlOHiURHhTzwOleYsLEnOLM9MhUqcYFaXEef+CJARAEhmleXBtsGi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYdxnIdp7MvBK46a+AFjMBLeadJwCyuCQRISXVwGRn2JN3dqagl5tHvOG
  Dz1cnSuk+We/QIrS9oVRE+I+o44VNGZ18BtnVWrt/BPVVrQiSijr7x71BK1kyleXHVeszqWJ3
  br4pml85rUj02Yci4yuLzv+InqvA9qhruZ/OFpPjBhVPXtrMX/FPupEzfO+2XY0az2uOTlwjd
  4PR926KFXd91a6EpvetFipXmFg3rw/q/ymaupFT1Z3pmMPhbf3TVKu+Bmw5XJJXfydFed0EwS
  numjJG72IL2i55TT8YVWoW8TqkxT+sdm8B/85rbqyJVzk/HTnofdpK6QnHzNkLz867+9m1kv8
  6z4N3fvpBnFtZ9Y0/ardubOZ4dIqrPK5hzy2tollWTUsOLD2yXomlOCPRUIu5qDgRAEVNDNJB
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1678889329!736154!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27262 invoked from network); 15 Mar 2023 14:08:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:08:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6B9AC1000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:08:49 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5F0611000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:08:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:08:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.1.3 -> 3.2.0
Date: Wed, 15 Mar 2023 22:08:33 +0800
Message-ID: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101553

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Add value <-> registers converter helpers. (#1413)
    Add pre-commit config (#1406)
    Make baud rate configurable for examples (#1410)
    Clean __init_ and update log module. (#1411)
    Simulator add calls functionality. (#1390)
    Add note about not being thread safe. (#1404)
    Update docker-publish.yml
    Forward retry_on_empty and retries by calling transaction (#1401)
    serial sync recv interval (#1389)
    Add tests for writing multiple writes with a single value (#1402)
    Enable mypy in CI (#1388)
    Limit use of Singleton. (#1397)
    Cleanup interfaces (#1396)
    Add request names. (#1391)
    Simulator, register look and feel. (#1387)
    Fix enum for REPL server (#1384)
    Remove unneeded attribute (#1383)
    Fix mypy errors in reactive server (#1381)
    remove nosec (#1379)
    Fix type hints for http_server (#1369)
    Merge pull request #1380 from pymodbus-dev/requirements
    remove second client instance in async mode. (#1367)
    Pin setuptools to prevent breakage with Version including "X" (#1373)
    Lint and type hints for REPL (#1364)
    Clean mixin execute (#1366)
    Remove unused setup_commands.py. (#1362)
    Run black on top-level files and /doc (#1361)
    repl config path (#1359)
    Fix NoReponse -> NoResponse (#1358)
    Make whole main async. (#1355)
    Fix more typing issues (#1351)
    Test sync task (#1341)
    Fixed text in ModbusClientMixin's writes (#1352)
    lint /doc (#1345)
    Remove unused linters (#1344)
    Allow log level as string or integer. (#1343)
    Sync serial, clean recv. (#1340)
    Test server task, async completed (#1318)
    main() should be sync (#1339)
    Bug: Fixed caused by passing wrong arg (#1336)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.1.3.bb => python3-pymodbus_3.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.1.3.bb => python3-pymodbus_3.2.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb
index 3750f5781..d792fdf97 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "714e5d6b7e28c4016a94346e73033aff276b6ce8bd22e470ba4fd8b982e08a98"
+SRC_URI[sha256sum] = "5769ac9a00ffc154e1761c69299c1968dcab1c2a61741b1caff89c4aea81dbcf"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


