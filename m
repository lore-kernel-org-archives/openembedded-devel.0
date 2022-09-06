Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F90ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 05:32:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.603.1662442356354110051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 22:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wNgWOAUI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662442354; i=@fujitsu.com;
	bh=6c+XWiQRwrB9KYeLpEkylpbeTkm+Z6Td58eumTxVaN8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wNgWOAUILZcfMefRIr/qjpCXRswokfYZVmyKJclHr1zeRAe+JyWSDg804dpS7dYUP
	 8DYgoyep9fMx+0dQZVqNRrQFpRw1G/+4Hko+FNN2zz/dOrrVs9DvA4E9Y/wf7wMV0S
	 34LGQAIyjFh4moii/lEFL8INDCrH+j9xJNSG//Yd39tvtcMtPnU/OcWnKXQF7ORXfD
	 e/6tRNKu6x0qeuvHlJopBMq8cpAuXHmv5txViBzNfJ08comLA150mF6V1cYGEb5JEy
	 TqJqRkQRmv/85RYHMCJyZU+B0/omhZVCjwkxBZ6ECVpu2WRwHZWY0Um56fn1iAYKzP
	 AiMLn2o/btOuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxSbfwtli
  ywdpzihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avI7dYCu6LV5zbcZO5gbFTpIuRk0NI4Amj
  xNdf8V2MXED2dSaJrl1zmCCc3YwSWy52sYNUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1ANB4ewgJfE6e3cIGEWoHD3kSuMIDavgKPEz2f3wWwJAQWJKQ/fM0PEBSVOznzCAjFGQuLgix
  fMEDWKErMvN7NA2BUSjdMPMUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiUVZaZnlOQmZuboGho
  Y6BoamuqaAFmGeolVuol6qaW65anFJbpAbnmxXmpxsV5xZW5yTopeXmrJJkZgSKYUs6TuYOzr
  +6l3iFGSg0lJlPffRrFkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8a68D5QSLUtNTK9Iyc4DxA
  ZOW4OBREuF1Og+U5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO/lm0BFAiBFGaV5cCNgsX
  qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvPZApPJl5JXCbXgEdwQR0hF2fMMgRJYkIKak
  GJrZrU+O3dobuK4207duwO+rccvXm445b/iz/p9Ymtn75F7E3W924XERcC8K9ZFN71bZeffrn
  t3yKwepfIqFLs+Om7nBNdORsP3X/n/MExpiqx3f+TZTTWzbvx38++bfv+N9ddhLpe9qSqvvnp
  8VLvZSTfMaRaZVvVmx4f3pqhhj31ZX3uq94FTb/OVWqtTQyZNbedxu3pMdFBJY4eKw5xGv7Il
  968fyICZOcHydJzNqiGros5tCi1dY3Zt0yC5xzgdPJZe+WBx6BG0NObliybE3kjIelbd43XPb
  9/pw3jW/9VmGxH/e8BS6KnvJZO+13W2BbTbaTzhmJ8x93uq/l8n5wM/CKbtLFhVIC259G7N6s
  xFKckWioxVxUnAgAgVO/PVADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-591.messagelabs.com!1662442353!202740!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9019 invoked from network); 6 Sep 2022 05:32:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Sep 2022 05:32:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2B7121000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  6 Sep 2022 06:32:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1EBC01000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  6 Sep 2022 06:32:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 6 Sep 2022 06:32:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdev-checklib-perl: upgrade 1.14 -> 1.16
Date: Tue, 6 Sep 2022 13:32:14 +0800
Message-ID: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Sep 2022 05:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98675

0001-CheckLib.pm-don-t-execute-the-binary.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...CheckLib.pm-don-t-execute-the-binary.patch | 20 +++++++++----------
 ...l_1.14.bb => libdev-checklib-perl_1.16.bb} |  3 +--
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdev-checklib-perl_1.14.bb => libdev-checklib-perl_1.16.bb} (87%)

diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
index 78a7e63b9e..8d4920b390 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
@@ -29,18 +29,18 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/Devel/CheckLib.pm b/lib/Devel/CheckLib.pm
-index e45cfb4..d228bb5 100644
+index 2e5a252..5c2f0b0 100644
 --- a/lib/Devel/CheckLib.pm
 +++ b/lib/Devel/CheckLib.pm
-@@ -424,7 +424,7 @@ sub assert_lib {
-             my $absexefile = File::Spec->rel2abs($exefile);
-             $absexefile = '"'.$absexefile.'"' if $absexefile =~ m/\s/;
-             if (!$not_execute && system($absexefile) != 0) {
--                push @wrongresult, $lib;
-+                print "Checking the lib $lib\n";
+@@ -403,7 +403,7 @@ sub assert_lib {
+             if ($execute) {
+                 my $retval = system($absexefile);
+                 warn "# return value: $retval\n" if $args{debug};
+-                push @wrongresult, $lib if $retval != 0;
++                print "Checking the lib $lib\n" if $retval != 0;
              }
-             else {
-                 if ($analyze_binary) {
+             push @wronganalysis, $lib
+                 if $analyze_binary and !$analyze_binary->($lib, $exefile);
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
similarity index 87%
rename from meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb
rename to meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
index 0863bb862d..74a09e7bf8 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://README;md5=7911cdbb572d25c5f2e2ea17f669efc2"
 SRC_URI = "https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-${PV}.tar.gz \
            file://0001-CheckLib.pm-don-t-execute-the-binary.patch \
 "
-SRC_URI[md5sum] = "3519cbf9fe5ec3404449d5330ee5537f"
-SRC_URI[sha256sum] = "f21c5e299ad3ce0fdc0cb0f41378dca85a70e8d6c9a7599f0e56a957200ec294"
+SRC_URI[sha256sum] = "869d38c258e646dcef676609f0dd7ca90f085f56cf6fd7001b019a5d5b831fca"
 
 S = "${WORKDIR}/Devel-CheckLib-${PV}"
 
-- 
2.25.1


