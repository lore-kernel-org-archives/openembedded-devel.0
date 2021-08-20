Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.80180.1629440553251644036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=szpuhBpp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629440551; i=@fujitsu.com;
	bh=tYWh7mQRFuqm6uYUWH78mIdWIqIWtBo1vc8F/aa+qfg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=szpuhBppwXJm3h1lZ/ClJfMZhaEgmzSBhqTf4YdEDolELtTLAbIq/BTgf7e92oKl7
	 oQgSyeefxPdMhZm73nmAX/ORGQTkALeb/J7qyytAYsjZNnd3U5ICI8CvUISI28RNSL
	 sn16hE1rCnmHibfxu95EqokCCkq5umJgBsG4d006PrnPLhY+qGtiwzLNgXk+XQSf1T
	 1kmuleXcvtlk1+dR523F7Iz0sYnqlQ4yeM1Ft0VLCysrsLluo+ENj0knlXNoAYpLD/
	 lACNwL5+1cuO/svdorYF2UPmCm3MFS1ycXSC8XwPRJZYZv3PO3VLn/daMuKqcR95LH
	 Hg3R8HoN2cK1w==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id B6/A4-05324-72A4F116; Fri, 20 Aug 2021 06:22:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYoqvuJZ9
  o8O4gh8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHsxRfmgh2cFY+/bWdqYLzN0cXIxSEkMJtJ
  4tDun4wQzh5GiRcv/rF2MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAmcW7RHbA4i4CqROP+G
  UwgNq+Ah8SVCzfAaiQEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDlFRKvD1
  9insDIMwtJxywkHQsYmVYxmicVZaZnlOQmZuboGhoY6BoaGukaWhrpmpjoJVbpJuqlluqWpxa
  X6BrqJZYX6xVX5ibnpOjlpZZsYgQGUUrBAZ0djD9ffdA7xCjJwaQkyqtqJp8oxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYL3oTtQTrAoNT21Ii0zBxjQMGkJDh4lEd6bHkBp3uKCxNzizHSI1ClGR
  Slx3hUgCQGQREZpHlwbLIouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfWMFNIUnM68Ebv
  oroMVMQIuFVGVBFpckIqSkGpgsW+c/bNc9MUNAfs6tjgpTnkvb+77kSn6dbLhXwu+jtZHQFgG
  PgDurdV923XPfLh7jcK7ZZtdVt83L9U+L7/p1yM1xbtqBlhxHJQ6jR36M1hdrnsxt2M674URa
  Q/16r7Npe+ec2qK1LvSD1FWFy6lvljmqNp6JP/MsuXbmIdZOY0UDnlPbX5a/X/RpbgLvHmlzD
  /n9JX/L2YKOXPg7wXfzNLGZX0VnaLyZwOm0ifG/7J4tVfqJhn+PHwjtMr9gLHreZ2nSFJ4Zv3
  bMi3ysFcywY0vTAecojnmfe9edUOTxrmEq3NYtyrLh0N77+89OnxtrE1sS5biyMFnam+u71OR
  pD8y0VusmW86cMOf3jVO/lViKMxINtZiLihMBzxg97B0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1629440550!767948!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3837 invoked from network); 20 Aug 2021 06:22:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:22:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6MUcF003910
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:22:30 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:22:28 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.11 -> 3.12
Date: Fri, 20 Aug 2021 14:22:22 +0800
Message-ID: <1629440542-34589-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libencode-perl_3.11.bb => libencode-perl_3.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.11.bb => libencode-perl_3.12.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb
index f1d44b3090..90ae623f79 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "47e05cefb550ef039808564e6181a22dbf2e50d0475f8eb9de63f9d9f4912e7c"
+SRC_URI[sha256sum] = "38da5b7f74bc402075f5994557b5f1426636291efea0f39fcdf4b1366b0756fd"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1

