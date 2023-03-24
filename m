Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697F6C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:26:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.89840.1679617564538972103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hwCAH0iX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617562; i=@fujitsu.com;
	bh=jrGKW26d4sATwSXoA1rOfV294Tb7084w6I4RNgb6eq8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hwCAH0iXBRq2QBWzpLtvHwVMOfluMHifqbQy0VmlvHiHS8hrZaRnsc4IovMSWm+26
	 3+UGNMxqquYoBZ1LTVsKT/sqdU1GsfSAFLxSRz7LV4hmFEmDgRmuSt9fr48AJXSTzG
	 3tR28wukPGRbMBx312A+xR6/S1D1TSU2GK8tPn18yS7MVESqXLAIvtAg0ZW9VCSe1v
	 s75PuCUKpi95un+GjIFaXCCgxbti/ipUB+aKaSGJlV13IgFkihHX/9ch9k+zPy2N46
	 jGw639qJfi46odcOEdpZFeXA4MRWEMXQjXMn6/h3ESke2FWUieJ3VGMsUAM7JcREUR
	 lYNHDNnLvcbgA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWVf8nUy
  KwbU/qhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bX8RamgsO8FdMmeTQw7uPpYuTiEBJ4yCjx
  4ck3NgjnMpNE958rLBDOHkaJg9tnMnYxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAmsfXBX7A4i4CqxMKGfWC9vAJOEus+7AHrlRBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRrqVeUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmAophSzOu1gPN73V+8Q
  oyQHk5Ior0SodIoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7Pb2RShASLUtNTK9Iyc4BxAZOW4
  OBREuE9dBYozVtckJhbnJkOkTrFqCglzvsYpE8AJJFRmgfXBovFS4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEefe8BprCk5lXAjf9FdBiJqDFzjVgi0sSEVJSDUxaexuuaz0tbfUo0N66pGm
  60J/dmadqOHIb7vqHf7F+yc7Das3sbfT576+YVwsKSo9ZHl0y1yD2+IVTq7kMfl/Y2bQszOPk
  6UmRz7NC55U3descuPr2XoDZ1gX+s+dd3aBZKvN0SfGbZvMIB8XHXwsNpTZuSWrV+z6jXHbmL
  1+hJY9YBHgtQq+tapJJmn63vk7Py2tOsn+gk4FzVH+Ize0HthN/3rJWY9x5svTvLFHlvfNSKx
  ZFH9P29YyPmVZqyrJTOv/STjall6Z3rkyeEd9zv+dBVq/lgrsTE/3ureZYco614PBHQeFVofX
  mHUEKNgaMy8vfxVseqDTwCSo7aRHo4ukYl6m3SMnkVnv1bSWW4oxEQy3mouJEALkJ/CdAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1679617559!255963!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15179 invoked from network); 24 Mar 2023 00:25:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:25:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3D0A5150
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:25:59 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 308C37C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:25:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:25:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libclass-method-modifiers-perl: upgrade 2.13 -> 2.15
Date: Fri, 24 Mar 2023 08:25:32 +0800
Message-ID: <1679617536-27169-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101673

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - localize $SIG{__DIE__} before calling eval
 - remove Test::Fatal and Test::Needs from test prereqs

License-Update: Removed spaces at the end of the line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-perl_2.13.bb => libclass-method-modifiers-perl_2.15.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libclass/{libclass-method-modifiers-perl_2.13.bb => libclass-method-modifiers-perl_2.15.bb} (77%)

diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
similarity index 77%
rename from meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
rename to meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
index 4cd6343878..f6ed718239 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
@@ -7,11 +7,10 @@ SECTION = "libs"
 HOMEPAGE = "https://github.com/moose/Class-Method-Modifiers/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16fd0ec7b73c0e158426f753943f1058"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d49d07ae038f38923335ac8cc301e1ba"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
-SRC_URI[md5sum] = "b1398e3682aa2e075b913b9f9000b596"
-SRC_URI[sha256sum] = "ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63"
+SRC_URI[sha256sum] = "65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc"
 
 S = "${WORKDIR}/Class-Method-Modifiers-${PV}"
 
-- 
2.34.1


