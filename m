Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F98AC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:37:21 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.2818.1645583840125275325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zHNUN9S4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645583838; i=@fujitsu.com;
	bh=58JQlYTx8X0GOTtEVbY0hjuFcrbrGEjO/cHh1ZpIQIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zHNUN9S4hfIZs3y8cVtbG6Tjv0MssJgA3nUz1YkZoPLQV8ibd41kNrUXco/wLOs39
	 iQKV8mMmMbw9Ng1xvmf8K2NJn/IhZ5pqHTqXqjZOucW5jPAYgKakJ3UdeoNn9K78rg
	 Dq+UThs/uw7Q4C2tnrVA1D/J2QG1un/u29pyNajMMdDkRFF7uAHavU6mOX6e4+USgm
	 C0ldFiry15Z3tbsDdINxUh/UEA9F4yDcIDBhiZ5O21wZ++vwjo9BQRXm36xU0083b8
	 RaHQKyEYuVNrJlQ/KqvXnqa1ZPX+5ZGSfhkPWsRblEK/wgDDI7kMPlONICjKq9gYIg
	 fZjP1X8Dsj2rQ==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 54/AF-13301-DDD95126; Wed, 23 Feb 2022 02:37:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MxSffuXNE
  kg6lfxC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozeJ+4FT/grPiw4yN7A2MbXxcjFISTwhFFi
  4bJeVgjnApPE22PvGbsYOYGcPYwSv/Y6gthsAroS5x6vZQexRQT0JZbO3sMMYgsLeEo0/5wPF
  mcRUJV43t/FBGLzCnhIvJl/BGyOhICCxJSH75kh4oISJ2c+YQGxmQUkJA6+eAEU5wCqUZSYPV
  0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjHZJRZnpGSW5iZk5uoYGBrqGhqa65oa
  6hsbGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3iytzknBS9vNSSTYzAAEwpdm/dwXi576fe
  IUZJDiYlUd65/qJJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4P8wCygkWpaanVqRl5gCjASYtw
  cGjJMK7fw5Qmre4IDG3ODMdInWKUVFKnFcPGENCAiCJjNI8uDZYBF5ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMx7CmQ8T2ZeCdz0V0CLmYAWT8kSAllckoiQkmpg0i+53LRMxpMnpuRt3V1
  Fqekzjj4+k3F8ttn8rv6G724hghHN58/+Ub5VnVbvy/1CiW/7rjN/Kky4CjVjt1foHi2X57ly
  vuah6/OynLmLHr9bt8TB5ker39SVG/krcjdfXdW8JHDPL10Whom2J6ovCZ76p//9spHmPZH+k
  inWp3c4LJVbcn1NklJMjkXR5qjkPJb24POSGz/FzDg6/bBh4FOu06XH96f//RQ47f+e2QuWTC
  lW9Cl7EqD0fO8U5laT0E39GyTXfeffaJNW/3JqZlB/zjSeMyuvTj2ZHc7ABfQCn+o1zcSWY1s
  68lXn16e4crB4/C5inV489XqKD/v+htKkYDsB25tFea+UDyopsRRnJBpqMRcVJwIAnaOknzsD
  AAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-532.messagelabs.com!1645583837!26134!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2120 invoked from network); 23 Feb 2022 02:37:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 02:37:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E63FF100450
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:37:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D9C37100359
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:37:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 02:37:01 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] phpmyadmin: upgrade 5.1.2 -> 5.1.3
Date: Wed, 23 Feb 2022 10:36:54 +0800
Message-ID: <1645583814-38729-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:37:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95465

Changelog:
=========
- Fix broken pagination links in the navigation sidebar
- Fix MariaDB has no support for system variable "disabled_storage_engines"
- Fix unsupported operand types in Results.php when running "SHOW PROCESSLIST" SQL query
- Fixed importing browser settings question box after login when having no pmadb
- Fix "First day of calendar" user override has no effect
- Fixed repeating headers are not working
- Fixed import of email-adresses or links from ODS results in empty contents
- Fixed a type error on ODS import with non string values
- Fixed header row show/hide columns buttons on each line after hover are shown on each row
- [security] Fix for path disclosure under certain server configurations (if display_errors is on, for instance)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../phpmyadmin/{phpmyadmin_5.1.2.bb => phpmyadmin_5.1.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.2.bb => phpmyadmin_5.1.3.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
index 7d814abd56..dca476cede 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
@@ -11,8 +11,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "1e6e0c1a15e3c6e7c8771faef19edfa5"
-SRC_URI[sha256sum] = "3aaaa86ded6308f511f67a907c0d7d6096e1dc2a8ae05581ba55a2510abde1e4"
+SRC_URI[sha256sum] = "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89ce614744d478296f"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1


