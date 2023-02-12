Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E490C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 09:07:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.7913.1676192865171353025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 01:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qCq6u2t3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676192863; i=@fujitsu.com;
	bh=+Nu2IvLGA3Om9wqcrQgl1BpTpPBX23yTFvQoj91UDX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qCq6u2t3fcZghJWQW2dhpyvZEeXnykBLV7euUNVwD9AkCTcdawaNBLAbadp9J/Qy+
	 dT5aG13Q4wbR8xP9yloJrl3GUijIgXD4qAqLq+LOIbK4HvaIske5JnAgGzwlY9ypB6
	 4orTC9yw66mhGnppY9ijQiK/Et6NMW6TccSeyRPdCsleBLibbjl5DLSZlkcMEhEPi+
	 M4XSkgU4On3mCed2PZYJbqcmFdN/bHRqzSXkMqaf1Ac48CpDXtK1mjE6ErAiTGIhEq
	 Z2CT0MlSdBdxJLJmnZBSpd7HWZu4GXkFUvKU4ORFdCufrpMeS+KgOcXWw2KwUdpL4b
	 15V8JqHozcOnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8OxWTduzYt
  kgy835C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy+aa+ZCpp5KmZuf8jSwPiPq4uRk0NI4AGj
  xKM2ti5GLiD7CpPEmvf/WSGcvYwSD9ffZASpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQEfiSs3uEHCLAKqEstPzWMBsXkFnCTaDu9iBbElBBQkpjx8D9bKKeAsce7CKUaQVi
  GgmqXNchDlghInZz5hgZguIXHwxQtmiFZFidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdE30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDNqWY9e0Oxv+9f/UOMUpyMCmJ8i7b/DRZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gQvy+oXyUKCRanpqRVpmTnAGIJJS3DwKInwVi0ASvMWFyTmFmemQ6ROMSpKifOag/QJgCQySv
  Pg2mBxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO/RVUBTeDLzSuCmvwJazAS0mEHqKcj
  ikkSElFQDU8rzC99SEnesaJg8IbBnpcOL7y+u3C7123X024WwDBP5FyKvuF4Vdq28dvTaGmVW
  hQXb49deDDXpnurymnPNWQ72i/f/PwlbaHRKwK8h7xpfjPxivXP3OAye7rWd8Cv2hPOv7UnM8
  j+/JExatvg8+97i+4Y8Idv++v7u3+zsvu+6xvSuFcsF9xz8M+NdbcXl5/eDbtisfFMkfExmro
  CdFz/H8YgzD1c0ptY2y1jHBUzdst9OsMdxrrTK5J4Pk6sVjwv/inr+zoFftWWJbKDni1mcWXz
  zmE2s4/dwvt3Is/DTcRbXsCk9+tq38ryObiy/M2njyptL98WZKccXPGDRXvP7rlhw2ryQzxyb
  710/vURHiaU4I9FQi7moOBEAhUwIx1YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1676192862!480657!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27807 invoked from network); 12 Feb 2023 09:07:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 09:07:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2A9097B
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1ECF473
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 09:07:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-reedsolo: upgrade 1.6.1 -> 1.7.0
Date: Sun, 12 Feb 2023 17:07:18 +0800
Message-ID: <1676192839-13378-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
References: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101046

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Drop cythonization by default, to avoid installation issues for users with
  Cython installed but no C++ compiler. Cythonization needs to be requested
  explictly now, using pip install --upgrade reedsolo
  --install-option="--cythonize" --verbose.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reedsolo_1.6.1.bb => python3-reedsolo_1.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_1.6.1.bb => python3-reedsolo_1.7.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
index 51651f3bc..b6c40921c 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "a7ce6b0efad8df491a70b87b6ab3543e751f7700dc4ac0b12081a456ef634f5d"
+SRC_URI[sha256sum] = "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
 
 inherit pypi setuptools3
 
-- 
2.34.1


