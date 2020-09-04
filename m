Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web10.34124.1599209611301562038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 01:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=ghhYf8y1;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: arturo.buzarra@digi.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175]) by mx2.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 04 Sep 2020 08:53:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPaPCua5beyhifoxNK0IuzERDInvbN+QIMfmgMwqstN0A+hMJbaIAOfLUUR/HLY10/qRSM1WGl3ZiIQyzEg3/axncqc2acBw5jSHNqVWr1Inq5S4743EHmAsTUCI6q7n0vQmQCTBC5oEkwQIxIIpjSS3fxc4OBbSBasdH/CIGGZ2+IXqbpl87p9UJ6FEbWp/FOQv80uf/420riBBkS/vxqvwYJX38cuY1lNQ9CfDpgCdP85Pzz6V6aOYY/u9NoLhRc9uBODCfDGx7mOfxsiYQFZK4rIWnk7+q/n2IPK8N1EO7Cqg8vr8SshoR0MyZAiUPLeekEfXHGUEc9xtNNRGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkeGKc05hn7ozzE37CTK4yVZPAFdBkzyGB+1Ao1CaQI=;
 b=cHVItjbGIbKCHQyTki1hC0AtJsQz63q4JnPdg57UKVIyWR55ktj4n5iXIFFg3V+xPZixQVfMYOgabSc1D+XG38KpbTKuRfJZGHaKHCH8uxaxCWyKyhwI5Yj59GLN13PE4PYDDIbCvEXpiCZff+DDzmrBUJQF+Iqc7tY5+QuaINcsE4xjnY8x99FkT3qiviPWZsa7X4C1GYihlTini5CoHf5rk/6CB/ZbSUjSjagz95XSBejkQ/ezZiJfxXwxSKXAEsKboQv+3sxjkFEK/6gMYfL8qC9k8IByffcRnCzN/sppLwngEQ9vnn4IdC+bWm8tmkH8IQoyY46FbLjeWdQd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 192.109.95.98) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=digi.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=digi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkeGKc05hn7ozzE37CTK4yVZPAFdBkzyGB+1Ao1CaQI=;
 b=ghhYf8y1HtxFAh/18bdYAdbXrp3ZnaDNccPmyCWq+uGT18WaHWhwAamA0yIIRNimrHMehj0ZVm87ge5OFY7Xh8c/VSeDqTPMPlrfZ+lp1rRIYHPT2P8UVelhYy61MEIMLUsoMJ2cdbRqGYS38iglROF/Qr9zPpOsM7LrRAf8LLY=
Received: from MWHPR07CA0010.namprd07.prod.outlook.com (2603:10b6:300:116::20)
 by CY4PR10MB1768.namprd10.prod.outlook.com (2603:10b6:910:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Fri, 4 Sep
 2020 08:53:27 +0000
Received: from MW2NAM10FT041.eop-nam10.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::5) by MWHPR07CA0010.outlook.office365.com
 (2603:10b6:300:116::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 08:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 192.109.95.98) smtp.mailfrom=digi.com; lists.openembedded.org; dkim=none
 (message not signed) header.d=none;lists.openembedded.org; dmarc=fail
 action=none header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 192.109.95.98 as permitted sender)
Received: from DOR-VMS-XCH01.digi.com (192.109.95.98) by
 MW2NAM10FT041.mail.protection.outlook.com (10.13.155.143) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 08:53:25 +0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
 (10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Sep 2020
 10:53:23 +0200
Received: from localhost.localdomain (172.27.2.149) by dor-sms-xch01.digi.com
 (10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Sep 2020
 10:53:23 +0200
From: "abuzarra" <Arturo.Buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] byacc: add nativesdk support
Date: Fri, 4 Sep 2020 10:53:03 +0200
Message-ID: <20200904085303.8635-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: Arturo.Buzarra@digi.com
X-Originating-IP: [172.27.2.149]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9b2116e-f6e1-4c6a-098d-08d850affcd5
X-MS-TrafficTypeDiagnostic: CY4PR10MB1768:
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB17689EB39051C4AAC453C742FA2D0@CY4PR10MB1768.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dr9pziS9OnpXfwvUgFuXinX8uZqFRds5qXkJ+/qlRIxJWEG0aEizpAlgnuX+vQzdlzpwoAilze+DKo5F2HCeHS+XZVuIQ8B3gy73nZpqu2v8pIvjX2eggGO/FVDgHdTH5tfjrx5CLI16y5H8psJv7uRZsar+ZPKANRPMJ+EfAxVqWhYmzVyDCeclQID40MNfPkwAolM6izhBK6nvHw/pKsaga7aHW0Ire1ihdL7M3mQ6ZnDN3V8CmGlYxH1vi8nkF6DLfCB2CwaXJjnPxdXY8xoyff5e8S0cja2a3eVv7TfUss3nt68OZ3/jJu7iWdInOuMZmB/CPvVNWNIjsrL7BB6hEfFVNSdDDVLxlVJbNOTyZtfoEHhRpFGokmUwFgVfAV68vj4gJbfyt6Q4Ee2RTeG5bBU3vNWsxKur4OJ4bWMVS1shIvh3tdM+IEPb+sAr31XrIFUqHHSh+qBQ4bjCHmI/e0juuCtK/0oglnGpbyLamCx3Q+3njLjLQERsHHNG
X-Forefront-Antispam-Report: 
	CIP:192.109.95.98;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DOR-VMS-XCH01.digi.com;PTR:host-192-109-95-98.digi.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(46966005)(86362001)(356005)(8676002)(36906005)(4744005)(5660300002)(478600001)(16526019)(83380400001)(47076004)(186003)(82740400003)(6666004)(426003)(316002)(26005)(7636003)(6916009)(1076003)(336012)(8936002)(33310700002)(36756003)(70206006)(82310400003)(70586007)(44832011)(2616005)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 08:53:25.9646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2116e-f6e1-4c6a-098d-08d850affcd5
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[192.109.95.98];Helo=[DOR-VMS-XCH01.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT041.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1768
X-BESS-ID: 1599209609-893003-31208-358313-1
X-BESS-VER: 2019.1_20200831.2045
X-BESS-Apparent-Source-IP: 104.47.57.175
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.226656 [from 
	cloudscan14-166.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain

This support is required if a tool depends on this package and must be
installed on the sdk.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 meta-oe/recipes-extended/byacc/byacc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
index 5214715cd..cffa7f5dc 100644
--- a/meta-oe/recipes-extended/byacc/byacc.inc
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.invisible-island.net/byacc/byacc-${PV}.tgz \
 
 EXTRA_OECONF += "--program-transform-name='s,^,b,'"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 
