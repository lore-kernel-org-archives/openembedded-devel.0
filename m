Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web08.778.1626398885423309301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 18:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ts+URRmF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626398882; i=@fujitsu.com;
	bh=FDvadT4GEyyMgVdgm5FNUo4rxYtm22n7ANxrTC6ANY4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ts+URRmFIBX+yOb+urHXH4fkKNq+pb3Z7M9uG/fG4f0TJc/AGJblWeqWqhwzBZcNN
	 CVW2fJECXI678YGo39Sz6TA7br+3N5oC/vsTsE4zgv8Hg9Du1rz4XwQUb3GstmvWtv
	 tIZEqRhw3REvMOO6ryunC04JVaemi8CbxmVtGsMtgPQ2zygZTZ6a8cvp1dYNTIZo43
	 Duwkx09qOMSMZGI/5H1MV2ildNbsXC0KWLtA96pwxB+okMpdBO4vtlbW9QwNsliYrH
	 /2b7QYwjhKX/KuGN/iUDaDJzADMfi/sa3kVmiS5EP3/w93T1VDOHODoqmWlwEewR7c
	 BfLWg9PWNZ/lQ==
Received: from [100.112.197.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 2B/32-07336-1A0E0F06; Fri, 16 Jul 2021 01:28:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRXfhgw8
  JBhePyVtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBm3T19iKZjMVbHo4Qz2BsavHF2MXBxCAtuY
  JFoOvGGCcPYySvQ+ncLaxcjJwSagK3Hu8Vp2EFtEQF9i6ew9zCC2sICDxKSGuUwgNouAqsTL7
  odg9bwCnhJL990DsyUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDllRJ7Zv
  UzTWDkmYWkYxaSjgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLS10DY0N9BKrdJP0Ukt1y1O
  LS3QN9RLLi/WKK3OTc1L08lJLNjECwyil4FjTDsaTrz/oHWKU5GBSEuVdf/lDghBfUn5KZUZi
  cUZ8UWlOavEhRhkODiUJXte7QDnBotT01Iq0zBxgSMOkJTh4lER4N98BSvMWFyTmFmemQ6ROM
  epyXFm1ZBGzEEtefl6qlDjv5ntARQIgRRmleXAjYPF1iVFWSpiXkYGBQYinILUoN7MEVf4Voz
  gHo5IwrzHIJTyZeSVwm14BHcEEdIT2mrcgR5QkIqSkGpiq9hWePPoiaY76CsM7px43rbQ+lzI
  viYGh3HByzdlC2xkhboGW8o3Xcxc++H7XU/rS6tdntZ7vmvBkqad9tVCBc8ac93tK+59OZSvs
  9Pm7yUnd427y3Wb2wzs37t26hOEY24+d/OoMU+7MtzTcsXYiY0hG7B0XzaquS5LHDveuMi/vK
  7l04dC/860Hdv56cD5s2ybTK3mTzopXsK9YVlDz3mzfdTlDl+dO29/+/hP0zKHk7xrd6e+mFu
  Z4vcte09bk9zRzx6aUpT2X9Ja28UXcLLyfHbHtToNUzKP0/8GTbD7GcCb2ibQ517b+Oyrrnbx
  Becnx7m9KFSUh7+ybj3NrBm4IOfBw08bVdyXmhzKUKrEUZyQaajEXFScCANvNSxEqAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1626398881!55355!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16600 invoked from network); 16 Jul 2021 01:28:01 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 01:28:01 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1RvPr025407
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:28:01 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:27:55 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2021.2 -> 2021.3
Date: Fri, 16 Jul 2021 09:27:44 +0800
Message-ID: <1626398864-103296-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Changelog:
This release adds new repository-locking methods to the API, 
in order to make lock handling more granular and better suited
for multi-threaded consumers of the library.

Several bugs have been fixed related to service unit ordering
and enablement. 
Pulling from remotes with unknown schemes now produces more
friendly error messages.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ostree/{ostree_2021.2.bb => ostree_2021.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2021.2.bb => ostree_2021.3.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb b/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2021.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.3.bb
index c3505ab06b..c735f6d8b8 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
-SRCREV = "6a72674ec621a2282043c3a083fe1e45cd6a8761"
+SRCREV = "38c14b374567f736533f7f515595208fe359819f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1

