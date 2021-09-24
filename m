Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.5355.1632471968508812609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A1FwdTiB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471960; i=@fujitsu.com;
	bh=LqCxBtlRfCTYQIy2gvcjz2CoLlxM+mYI3yN0piG/M9c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=A1FwdTiBz8PxMRIHNLQKZDzL6PTeuwVJha/gM0Q8s6EPBSVWGsJ0et7wkbWZeRgy/
	 W+9vrS6ei7AeAXcI0qodse8JTh1TCGI+q1WwnVPz0vUjdka7ceD3PFcAGxQdvudyKg
	 EVfjvhTeZKJmFGsC/b7eNWwCpnR1Tai1GqcRr7X8G7SCluQm3BMwIvCTgOv+0/Rr/o
	 AH7yCixqQUZ5KBFvV2e+ErWBjzaSWTvor5mtPsre4nAr3YJ+8WQwphg4VI6hL0JhGd
	 XT5x/LzmvayZCGU6qiBjhvfSVog39cEBSoq8UGi1V0YqxDZhWSzz/Jai0uiv5WtFA8
	 O8SvN1clXLczQ==
Received: from [100.112.196.227] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id CD/79-30018-89B8D416; Fri, 24 Sep 2021 08:26:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqjuj2zf
  R4MNqNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPdIr2Cu7wVOyZvZ2xgXM3TxcjFISQwm0ni
  +pkGRgjnBKPE/Fdn2LoYOTnYBHQkOl50s4DYIgL6Ektn72EGsYUFvCSOvvzL2sXIwcEioCrx4
  ZgpSJhXwE3i4faVYK0SAgoSUx6+Z4aIC0qcnPkEbAyzgITEwRcvmCFqFCW27zzDAmFXSLw+fI
  l5AiPPLCQts5C0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaa5raGyul1ilm6SXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYRCkFRzt3MP569UHvEKMkB5OSKK98l2+iEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQneF01AOcGi1PTUirTMHGBAw6QlOHiURHgngLTyFhck5hZnpkOkTjEqS
  onzfmsFSgiAJDJK8+DaYFF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrxHIeJ7MvBK46a
  +AFjMBLX4+1wdkcUkiQkqqgWn7oTWNwswHJr0MVWK+W+wcaNp99rni3iOf+wse7t9kcK2L7yb
  vtuvnD/bGaIddl7LaxF995i6f7MytymoVdzgaOR+1Rne2/xbrrPnvKSQXov5I0dpi+j7/E/8m
  Gv+6usrW36/nXaLRTucv7xdU3898IzDZ8cjNX7zS7olyBs4d/Wdr3zDGz4hdYWpuM2vevPu3z
  RKSzW9yVl3JUaqc+GxWUMu3kzZXsrJ2GilvjbMwuvqgvjyaT42vc4rZppzv2zzXepZc3/lfyO
  h2VitfQt6xPVv55syZMevknmu3L4l98F7s9rRkTu67S9Lul+1VW5PnzvV0WjfrsVKpn9/DmGj
  Wm1lha7ey+e0xYg3eclyJpTgj0VCLuag4EQCCTW/HHQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1632471959!64858!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28016 invoked from network); 24 Sep 2021 08:26:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:26:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8PxMf006431
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:25:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:25:58 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.62.2 -> 4.62.3
Date: Sat, 25 Sep 2021 04:25:52 +0800
Message-ID: <1632515152-4850-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Modify part description.
old: If a copy of the MPL was not distributed with this project,
new: If a copy of the MPL was not distributed with this file,

v4.62.3 (2021-09-20)#
whl|asc
fix minor typo (#1246)
minor example fix (#1246)
misc tidying & refactoring
misc build/dev framework updates
update dependencies
update linters
update docs deployment branches
misc test/ci updates
test forks
tidy OS & Python version tests
bump primary python version 3.7 => 3.8
beta py3.10 testing
fix py2.7 tests
better timeout handling

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-tqdm_4.62.2.bb => python3-tqdm_4.62.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.62.2.bb => python3-tqdm_4.62.3.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb
index bbdd795aab..148431d0ad 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
-SRC_URI[sha256sum] = "a4d6d112e507ef98513ac119ead1159d286deab17dffedd96921412c2d236ff5"
+SRC_URI[sha256sum] = "d359de7217506c9851b7869f3708d8ee53ed70a1b8edbba4dbcb47442592920d"
 
 inherit pypi setuptools3
 
-- 
2.25.1

