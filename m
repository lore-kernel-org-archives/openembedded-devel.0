Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05870C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:25:19 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.7646.1635312317913326720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EZRX7M2I;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312316; i=@fujitsu.com;
	bh=UQm9ALsuM5E6AaM2e6iAgDlsDA0hEg8x6LoM9fqRDvA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EZRX7M2I0bpyqPHNt6jMZJU8mvFW8XEDbrGNirXVyTTY2sECtPKhNPE7gNbB1/pq6
	 OJAirqf4IdFfFoLSkTVKVWQAoXnAhfD4GS3u29J0bWobltWoZXa4yGHcOy5MzAW48f
	 ZIUklJEr5N9DI/HX5u4acvDAODJSAcsrBb3P+tD8EAQg4DRB/NUgh9SjO/1shPVlpt
	 ZFL4RWa61KAiBGmiTt6IAgVw7/Eq3y5gyX9Vp4HPOXjG5+ZTRzZwFVuRTtgtI9bAf2
	 8uNSQ9Ok/t5MSAIQBVZcDQJdpipnLmIhsvNIgri8dOoLwufBYbrhUumubeDblNWYEK
	 PfdjQP489oQpw==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id BB/34-17143-BB2E8716;
 Wed, 27 Oct 2021 05:25:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1d39qCL
  RoHORusXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH67kymgh28FR0X77E1MP7k7mLk4hASmM0k
  se3MWyYI5wSjxNYz11i7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBbwlHrztAathEVCVeH7mI
  SOIzSvgIbH83RGwegkBBYkpD98zQ8QFJU7OfAIWZxaQkDj44gUzRI2ixPadZ6DqKyReH77EPI
  GRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tDTVNTI01Uus0k3USy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKSUgsPXdzDeev1B7xCjJAeTkiiv77aKRCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvEn3gHKCRanpqRVpmTnAoIZJS3DwKInwGjwASvMWFyTmFmemQ6ROMSpKi
  fPeuwmUEABJZJTmwbXBIukSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHefyDjeTLzSuCmvw
  JazAS0mFkJbHFJIkJKqoHJzPS0vA9b3RE9L3uOuduOhb3I4GaZqXi6e7VwwLfV2u9+z/945uK
  zJbw3y0SYRbN1grkSI8+0/rzxZFmCaNPX10u7bk3v8OT0X992/PzDvBvnzn1QPruDQ3jh60vp
  fcUTHK76nrj3ODbtzprTZz40iX4pVwx6+XJSHb/Of/+QLQWJZgJyi3Suhpqb6NxJlrI7Gbvqe
  PXRSs780GTzQoUAuSBd2595qenxsyvmMrg0+xs6no0ssWeSTfyq7blHgbPwx8Ycl8Vv+U+e+j
  TjaoLrVJb+/V07NDmuym7nClPxanx2L/YmVzdjyOrFYbyyx5qnLYms/fb836YdGmUT5mTydwq
  k51lFyfxVkZ5kVafEUpyRaKjFXFScCAC1lrPUHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-267.messagelabs.com!1635312315!1243130!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6022 invoked from network); 27 Oct 2021 05:25:15 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:25:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5PF1D031488
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:25:15 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:25:14 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-smpplib: upgrade 2.1.0 -> 2.2.0
Date: Thu, 28 Oct 2021 01:25:10 +0800
Message-ID: <1635355510-112311-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93620

License-Update: README.md is modified as follows
- client = smpplib.client.Client('example.com', SOMEPORTNUMBER)
+ client = smpplib.client.Client('example.com', SOMEPORTNUMBER, allow_unknown_opt_params=True)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...python3-smpplib_2.1.0.bb => python3-smpplib_2.2.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.1.0.bb => python3-smpplib_2.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
index 56d8f9eea..ac7945f4e 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "SMPP library for python"
 SECTION = "devel/python"
 LICENSE = "GPLv3.0"
-LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
+LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
+SRC_URI[sha256sum] = "3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd"
 
 inherit pypi setuptools3 ptest
 
@@ -12,6 +12,11 @@ SRC_URI += " \
         file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-logging \
+        ${PYTHON_PN}-six \
+"
+
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-unittest \
-- 
2.25.1


