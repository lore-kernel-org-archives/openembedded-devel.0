Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.2721.1623982780078481358
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IEGSBvhc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982777; i=@fujitsu.com;
	bh=X9bJtVv+5K/m5dGFyUl+l7Tmh4/E9Kxjr2V7/xMaznU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IEGSBvhcZK14W2xY9NOHh2p+VpEqdATLbx4+mkZdq4UsJd2/vPTIi203Ha2UibPe9
	 JB33Cn7WeT2adh/ZZYXwLMPRnHHPOsBaIwrKvn9Ls9cU26Der+BeOY1+qdIR4Z7T6n
	 Rfrlyyc6wv3m0Tc6cuz831Xq3ycFV4KYP4xnZde9VfzdcHGrPcJxsimJ2s+c+nJ7fM
	 zJQjrjfL8RBTr2k2Q0bzZJv+VdUSBSx0FNtId0WWMRnDQ84bcVLykoCir8Iri1MspW
	 ydD1pXLtmNC2bzDOLFU+4SVT79CrUzzA8Cs1LHiB9pjBZn8k5qt1MQyxN/WFfV8bMF
	 RelJmnLOE+R7g==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 66/F1-14259-8B20CC06; Fri, 18 Jun 2021 02:19:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRoruD6Uy
  CQdcXdYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPPgavsBZs4Ki5MfM7WwHiMvYuRi0NIYDaT
  xPvOySwQzglGiZfv/jB2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILCzhInP40nRXEZhFQlbj27
  QY7iM0r4Cbx78EtJhBbQkBBYsrD98wQcUGJkzOfgM1hFpCQOPjiBTNEjaLE9p1nWCDsCokZM7
  axTWDkmYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXXNdI1MDPQSq3ST9FJLdZNT80q
  KEoGyeonlxXrFlbnJOSl6eaklmxiBoZRSyPZhB+OUNx/0DjFKcjApifJavTydIMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mC9xbjmQQhwaLU9NSKtMwcYFjDpCU4eJREeK2BoS3EW1yQmFucmQ6RO
  sWoy/Fl1ZJFzEIsefl5qVLivHYgRQIgRRmleXAjYDF2iVFWSpiXkYGBQYinILUoN7MEVf4Voz
  gHo5Iw7zaQS3gy80rgNr0COoIJ6Ig2oVMgR5QkIqSkGpjqJM7EqQSev+5mWxCkEZEf4Lxn+bK
  yjFuzV0twWhTK+ZxKPTD53byiXNbTWpYCb3LmZV89WfDwzMFLmn+nbngrrPxr/5Xt+2NZDc5X
  7jv6p/v+sTm/Fjleu2pRlfveaHn/dbcJ8/rXXJuVwsoUPe3/jZjJ/5hu9ak8D9midTeBd+qpa
  1sSCtZXnz0+S2aKL2f84rkd1x34ZcTDXom0R9medJUSij9wUazz1N505owO27WuH/JWmu43nv
  t13sOfwZvdKjP23pl1KvHM/Gnc0kZzd3qvvP/32paeo4a20byeiotD/l5QZnUS+XfsbcMBeUX
  lhCPe/w7ylJ3c+Cm1ZeauOTu/OFRou7ht7+G89ZbJV4mlOCPRUIu5qDgRAPXJ/FgsAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1623982776!85453!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2780 invoked from network); 18 Jun 2021 02:19:36 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:19:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2JZCO005560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:19:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:19:34 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mg: upgrade 20210314 -> 20210609
Date: Fri, 18 Jun 2021 22:19:28 +0800
Message-ID: <1624025968-7749-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/mg/{mg_20210314.bb => mg_20210609.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mg/{mg_20210314.bb => mg_20210609.bb} (95%)

diff --git a/meta-oe/recipes-support/mg/mg_20210314.bb b/meta-oe/recipes-support/mg/mg_20210609.bb
similarity index 95%
rename from meta-oe/recipes-support/mg/mg_20210314.bb
rename to meta-oe/recipes-support/mg/mg_20210609.bb
index 9275dd233d..eb7de1279f 100644
--- a/meta-oe/recipes-support/mg/mg_20210314.bb
+++ b/meta-oe/recipes-support/mg/mg_20210609.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "598f7a028f01f85f0dee0e798753bccf93233add"
+SRCREV = "688f49cd67ab30dfa6482c74815e117cbf7af63a"
 SRC_URI = "git://github.com/hboetes/mg \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.25.1

