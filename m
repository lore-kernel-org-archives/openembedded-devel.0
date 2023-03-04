Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E998AC64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:10:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.6929.1677928235871896733
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=isNxvYKE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928234; i=@fujitsu.com;
	bh=M5S1kHpfYmsUvwHDPYef3AWbpD1323mWiTiJHcYxYuA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=isNxvYKEAB3YWPzsGnop2UngDKgIQdgM8DGy1ENu/B7HMRvVaJZGkeKnPfVc/Q0t4
	 chxuidAZBUuf7POPJlgnv84UAAPyVxD0X9kFwFUaE5nRxinjt9mzYmHsCKbH8XEzc1
	 i+JlT0tKHHyswgMVqkM2FpvT4PRwoIKnez3kcXYqVI/0mC20xX4lV22y3jRAQscVIN
	 AUmUHUimXWDo7c9wr78ja3/X8i8vqP2Jnlm61zumPKI5VkHlbwtCSN9xc3O+0iYt2G
	 1L2aUrbqcbI3iIA+AbibYsrU9GfLr/PtsZUjVQOUYDv6bC0YbXgBSN5+Vp16tSV2AZ
	 85lkl3jX/BR0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWVdTnTn
  FYOMRSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPl8sdsBUf4K7oPP2JvYDzL28XIySEk8IBR
  4lArVxcjF5B9hUmiafszFghnD6PEhHk7WUGq2ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwllj99ghYPQtQ/Nbuw2D1vAJOElP6zoLVSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8gK
  pRlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEb+WUjaZyFpX8DItIrRtDi1qCy1SNdEL6koMz2jJDc
  xM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOKWd/uYPzf+1fvEKMk
  B5OSKO8kVoYUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8MqrMKUKCRanpqRVpmTnAuIBJS3DwK
  InwbhEBSvMWFyTmFmemQ6ROMSpKifMKKAMlBEASGaV5cG2wWLzEKCslzMvIwMAgxFOQWpSbWY
  Iq/4pRnINRSZh3iwrQFJ7MvBK46a+AFjMBLdY4zQCyuCQRISXVwFTPaOT9/o+DkHTT6pkR2+q
  02KUOHq9dlCubed2s9sju1VrNATs1uRiCq+Ov3Uxy+65mrSYUo/hJgWPDHZ1Ch4Xf12arLuuc
  pZmXGe8u68+pxsF+ci/Xlwk741nOPVPc+6TMyebKzDlzJYULrq5LMNFTs7t5yl7s3we3GeWS6
  nuqjl9a+Mv2u8VFjQvsevaiUa5y+Qunq6t9/r3177clhrJsLClaYc9V+O6qLOVoX1w/7bTJ2u
  4fG3M2lOh2nOLb/8FxT01s1v+UX4eaV76MMjI6brJb4Yi0ePxBbtumF9+41tS8XylzwE9A+wZ
  D2ekmqZPf83ynxW/8a+Q0xerc9EfL9L9drXBZbem++dqKz0osxRmJhlrMRcWJAIFw285AAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1677928233!149161!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1742 invoked from network); 4 Mar 2023 11:10:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:10:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 093797B
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F1E5573
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:10:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-natsort: upgrade 8.2.0 -> 8.3.1
Date: Sat, 4 Mar 2023 19:10:18 +0800
Message-ID: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101371

From: Wang Mingyu <wangmy@fujitsu.com>

Fixed
=======
    Broken test on FreeBSD due to a broken locale.strxfrm. This change has no effect outside fixing tests (issue #161)

Added
=========
    The PRESORT option to the ns enum to attain consistent sort order in certain corner cases (issue #149)
    Logic to ensure None and NaN are sorted in a consistent order (issue #149)
    Explict Python 3.11 support

Changed
========
    Only convert to str if necessary in os_sorted (@Dobatymo, issues #157 and #158)
    Attempt to use new fastnumbers functionality if available
    Move non-API documentation to the GitHub wiki

Removed
========
    Support for EOL Python 3.6


License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-natsort_8.2.0.bb => python3-natsort_8.3.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_8.2.0.bb => python3-natsort_8.3.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb b/meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb
index bc142195e..baf94caa8 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Simple yet flexible natural sorting in Python."
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "57f85b72c688b09e053cdac302dd5b5b53df5f73ae20b4874fcbffd8bf783d11"
+SRC_URI[sha256sum] = "517595492dde570a4fd6b6a76f644440c1ba51e2338c8a671d7f0475fda8f9fd"
 
 inherit pypi setuptools3
 
-- 
2.34.1


