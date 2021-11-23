Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACA4C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 06:04:46 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.7834.1637647485476926933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 22:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LYk5PAZ0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637647482; i=@fujitsu.com;
	bh=Gz4dvLSxwSaKyBC/Qjj13e2JgodXXPIEYice+n/N2Hw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LYk5PAZ061ZBa62HbjmZAfR4qFsFjun/taHoqcI6DsT88MSxm8Pj4TlK7S5CEElKG
	 qlekB5QqXaEF+TOLeB+VHN+kX7fsafrKyDvBbKTSFzMkVloZnvelAhcgidYBnrdKR8
	 y4RM+5RoIxC8vSUATjGmajTQz1yZgKhQMCJpR21IndzdM4amQFT9i1Nehoc5iWdIYK
	 ns3V9ilcbpnGGAlm78RkUeOj5jduq/bWfCPm754AhkjouU/b2reiaDLATaZlhPuVsn
	 s6ZlYugDx7EmvwWGPuN8P5R6z82c9ssXck2Bqzp9EQ3zNburowMNc7W9ObpkisoSst
	 H4beakq7XD+fA==
Received: from [100.113.5.97] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 05/D5-30139-A748C916;
 Tue, 23 Nov 2021 06:04:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqFvVMif
  RYP19PouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWN2F1/Bcu6KrYs3sDQwruHqYuTiEBJ4wihx
  88MkZgjnApPEjY5fLF2MnEDOSUaJ/oY0EJtNQF3i8c3XjCC2iIC+xNLZe5hBbGYBVYnui2vYQ
  WxhAT+JD7uXgfWyAMUv3PrJCmLzCrhJdG2YBRaXEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDF
  GjJHFixUcmCLtC4vXhS1BxNYmr5zYxT2Dkn4WkfRaS9gWMTKsYLZOKMtMzSnITM3N0DQ0MdA0
  NjXXNdQ2NDPUSq3ST9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBAZlSyF65g3Htmw96
  hxglOZiURHmTAuYkCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgvVkKlBMsSk1PrUjLzAFGB0xag
  oNHSYS3qBkozVtckJhbnJkOkTrFqCglztsCkhAASWSU5sG1wSLyEqOslDAvIwMDgxBPQWpRbm
  YJqvwrRnEORiVh3laQKTyZeSVw018BLWYCWty7ZzbI4pJEhJRUA1OtX71C5srljGdVNaYrVCy
  Zss7re17vnpOHeg5zdtp0illwHlt0YMH/MpHj89v+yrCI/w3Sy2BY9P5iwd3Yh+45U48ZtaVv
  jlfTTare75bzXH6V+OWI8qffjJ+HVorPuOyX96kyYWVRQdk7yzhp3qcnU4v/FaZlPFjmUyv/Z
  deFmSnsgr9Pcq6ePLOVzzFgclh3uOaqnsitO9iPzBbmeWLVmSdZbVUVEp60Wubl72/SirX6vl
  pKV1yyHl88c8Wy4UjvleTH29/X5vmf/5VwcvLZ3cVH7j+4J7RM1Pj7xkcK+SZbm2zuvzr06Pj
  Jhwv3rmPfsp3TK2bhry8ZzPXsLLKvfT73sn4+2db8codY5h0lluKMREMt5qLiRADCK8D2QwMA
  AA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-248.messagelabs.com!1637647481!259355!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23736 invoked from network); 23 Nov 2021 06:04:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Nov 2021 06:04:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B39C7100237
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:04:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A840C10022C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:04:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 23 Nov 2021 06:04:31 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.1 -> 3.0.2
Date: Tue, 23 Nov 2021 14:04:23 +0800
Message-ID: <1637647463-2502-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Nov 2021 06:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94105

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-xlsxwriter_3.0.1.bb => python3-xlsxwriter_3.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.1.bb => python3-xlsxwriter_3.0.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb
index aeb27cef42..04f25532a6 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4e95e368cd6cb090815046688e92d11e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e5c795ec8cf90514a6d844b1d3cc3224"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a"
+SRC_URI[sha256sum] = "53005f03e8eb58f061ebf41d5767c7495ee0772c2396fe26b7e0ca22fa9c2570"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


