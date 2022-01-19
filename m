Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38608C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:42:57 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.832.1642556576274384767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=whLhEmin;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556574; i=@fujitsu.com;
	bh=qcPge9xb+k8bjwCNvf+VJu3noe2XKHFF33hH7XmoIis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=whLhEminaAfmem7byfwe1oiTNLCbmdJkAIBe61cOaEuggpsZz+wLIhniBgUAEeI8+
	 m/ClQdsgK0MTo7ZLD7THxpOu/lqG3dNObtBE5/hj3dCwEQuW7pnMWRxVFru50tqkMw
	 1Dlr5GbLun+Qw58Iwnj3aWWkczyw+QQ/MSicHLTvePjmPBk6wHysVyiIGWBIBfwYCo
	 UYgP4buZaK8K8cZ2dRPtGxI20trNNHcbWHxv/UqHnO0p+HS4kcF9rC6yDqEUpVlTBN
	 eZDwEWIJG8jSt8EWLxS25Xv0yKmYSEj9Hwr420Hb0d0mwE2xkto+PWKFN6q+NaVuZ9
	 thwPhiDZjSoAw==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 BB/2E-15539-D9C67E16; Wed, 19 Jan 2022 01:42:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRojs353m
  iwePtyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ai3bdYC75LVXzb84OxgbFVoouRi0NIYCaT
  xOEvd5kgnBOMEq9uTWHsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAXeLgx
  O1gNouAqsSpWzOYQGxeASeJHX0rwGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7
  NA2BUSs2a1MU1g5J2FpGUWkpYFjEyrGO2SijLTM0pyEzNzdA0NDHQNDU11zYGUmZleYpVuol5
  qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzDYUordlu1g3Nf3U+8QoyQHk5Ior2j8
  80QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryswPAVEixKTU+tSMvMAQY+TFqCg0dJhPdpFlCat
  7ggMbc4Mx0idYrRmGPVgemrmDlet/zcwSzEkpeflyolztuZDVQqAFKaUZoHNwgWkZcYZaWEeR
  kZGBiEeApSi3IzS1DlXzGKczAqCfO+BlnIk5lXArfvFdApTECn9D97BnJKSSJCSqqBqZ/V5e3
  PY2mCU2WYlp4QVws/6jljbe7RhMKV65YsUN4Qu/6IQtxWa4W8NyIOy1kUIhrTCve8n3pe9rXU
  SolbbFbfQz4t2no2JiAtwOPp9m8niyT6bSfbchxa7tS0yPZD/dN8m54IyUWfXyyf+uvTQYWaq
  y/s7Xh+Ltz1+7LnnoNT0sMOHf/UuuTu1r3cNpMUCnUvPBXbvynHRfJtmG8ka8eVBJudr7wseO
  NXiq0K0uIt8Tu3pPftg18JKwzXK0umue26OL/uwXcn9fNvj8pr7rjwbj1bfWp4bcnbrx9PVU2
  4m1H2R+KwYKrSZAuDG7YiM7/U1vJHe/3Z553tH3rL1YHzmz/3mb+PRf9MmqXT9UGJpTgj0VCL
  uag4EQC6Cc7nQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1642556573!56832!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25089 invoked from network); 19 Jan 2022 01:42:53 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:42:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J1gkBZ020792
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:53 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:42:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cups-filters: upgrade 1.27.2 -> 1.28.11
Date: Wed, 19 Jan 2022 09:42:33 +0800
Message-ID: <1642556556-18277-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:42:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94926

License-Update:
"org.cups.cupsd.Notifier.xml" changed to "utils/org.cups.cupsd.Notifier.xml"
"GNU Library" changed to "GNU Library General"
"GNU Lesser" changed to "GNU Lesser General"

Changelog:
URL of issues  <https://github.com/OpenPrinting/cups-filters/pull/#####>
=========
Bug fix release, containing backports of many of the bugs recently fixed during
the preparation of the cups-filters 2.x release.
Important is that cups-browsed's queue naming is aligned with CUPS' temporary
queue naming now and several bugs affecting driverless printing are fixed.

-libcupsfilters: Let PPD generator take default ColorModel from printer
 (CUPS issue #277).
-Braille: In vectortopdf check inkscape version to call inkscape with the
 correct command line (Issue #315, Pull request #443).
-Build system: Make missing DejaVuSans.ttf non-fatal in ./configure as the font
 is only needed for test programs, not for actual use of cups-filters
 (Issue #411).
-libcupsfilters: In imagetoraster() fixed crash with SGray (Issue #435).
-cups-browsed: Naming of local queues is matched to CUPS' current naming of
 temporary queues (no leading or trailing underscores), to avoid duplicates in
 print dialogs which support CUPS' temporary queues.
-libcupsfilters: Make cupsRasterParseIPPOptions() work correctly with PPDs
 (Issue #436).
-libcupsfilters: Let colord_get_profile_for_device_id() not return empty file
 name, to avoid error messages in CUPS error_log.
-foomatic-rip: Debug message was wrongly sent to stdout and not to log
 (Issue #422).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-printing/cups/cups-filters.inc        | 2 +-
 meta-oe/recipes-printing/cups/cups-filters_1.27.2.bb  | 4 ----
 meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb | 3 +++
 3 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/cups-filters_1.27.2.bb
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index c01e2cd49..061c8a625 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "CUPS backends, filters, and other software"
 HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters"
 
 LICENSE = "GPLv2 & LGPLv2 & MIT & GPLv2+ & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=516215fd57564996d70327db19b368ff"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d77679ce6a2cc4d873d4ebbf2a401e6"
 
 SECTION = "console/utils"
 
diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.27.2.bb b/meta-oe/recipes-printing/cups/cups-filters_1.27.2.bb
deleted file mode 100644
index 35c4a929b..000000000
--- a/meta-oe/recipes-printing/cups/cups-filters_1.27.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include cups-filters.inc
-
-SRC_URI[md5sum] = "90ebcae31f2eabd802236408646b1dd9"
-SRC_URI[sha256sum] = "174a2a5c919bf88c63ced692a2170add6c2cd70ff06c49bcea32e9cf56960492"
diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
new file mode 100644
index 000000000..bfe5375b2
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
@@ -0,0 +1,3 @@
+include cups-filters.inc
+
+SRC_URI[sha256sum] = "472418f1a1e12c9ad91b01caa020eb668626776d85de9da488be38e6663102ca"
-- 
2.25.1


