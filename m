Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web08.30906.1612167358050538605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 00:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BEQB8vdX;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltlXnNclVBS2PnEIo4wEn9Zn+jNbRDS4uO4Zfm4+0OaKRpRL6nzTxbNXxVAia3An1pkRHEcoytK2MyjA15MKneCAWe4RJaR/SXAlUFqPJRslbBgOgURUUdlUlIuJTAcJyFDY/16h0i0Wj/av1zyPJr5tCuAMnicPIr3ZfyvW0f57o2+evTd5krPyJsrMyJ2KknemxsnkI3KndgeIx6mBk0uEqElnj5/n6vo92GMHncsmhpqPvAEpfcTnosFzNJxxCXk0H6FE/7w2/V/4GiQubANO5ysAya0++xQNgzkpFHpj4g1BYT0jdx7Ns8B5UYJpklj9YZEKVPcxRtC4c89heQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+XFjFDg++Vy37M8TOx6GyFW5tddN3i6WopuNw7cW7E=;
 b=UkPjGFJJsDsxcHofzz6jX5MORTlJ8xF6tNSxJcAwnD7vHqqFYJzdYGPKRSLP9/Wwx9AVMZu2JvIWDd5FPtF2f7zuccWqzGQD+M/2p+dTJDo78puNYonCndKO9Ebn4uKJrQZ+Xz1eUJaJU+Tfakn6cuuKGkegDy/sdayT3mw30WtSGh6nmO78hTzg4LzYgxtTDaZ2HfTtljVCJKNUARMT3Fh0umw1kZYyMOKWAgRDKZ0/4JnUlu7Gl6gbLaiZO2deZ14gxmKlQHZIBBmcJR3ZSNnxi+5gCogS9uv2lycCciU5anC7SC33w8rxV5tzz/m6dY1HJpCkxhx7p4i/JizDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+XFjFDg++Vy37M8TOx6GyFW5tddN3i6WopuNw7cW7E=;
 b=BEQB8vdXo5EKIBjQIQ8rvauPxJ//gUaukjcl+NoZrTgK8O+WTq0WX4K6YbkxhKX3znhRwNI4wui54PMDXZRQ23zWMXm3DKznLLmcotD7RCOPlfydcBkci0Cs2HFzPO5sQaRVrPUIzDFiGTQC2yKChhJMKq4Hmc6Gbm9NhWZIR+k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 08:15:55 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::117e:22b0:92a8:37d3]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::117e:22b0:92a8:37d3%7]) with mapi id 15.20.3805.025; Mon, 1 Feb 2021
 08:15:55 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencv: improve reproducibility
Date: Mon,  1 Feb 2021 16:15:34 +0800
Message-Id: <20210201081534.6715-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0004.apcprd04.prod.outlook.com (2603:1096:203:d0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 08:15:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4b8251-2bab-432d-8519-08d8c689979e
X-MS-TrafficTypeDiagnostic: PH0PR11MB5096:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5096DE7AF1C1BDFAF4CE2EE3F1B69@PH0PR11MB5096.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aSizuBAGatV4COhowUUiRcF8KaH7sTtgDWans7F6hI+MRXJaWCbApp0RGKXp++I3ICN3ZRYP46cs5WOvIyLsqJ3MJu2ELLfdJRZO8CR3bnctaR8qMdCT+y/M95ucBo03aSpAXGaCLdd6J1/u6sU1UwadRolCHLuR7QEhzUjC2KDj2Ehf+cbxiAOXEFs6M3uN6cYJwsTjkeszCCKMP7EP9rxTNNXd5ESfPEjyknjArYEXnIqPrXpURT93AXM1LC8yoZ3C+lRtAERuPtG4ips9S/L7MWNTlhgCuEdDQ+/aC7GjLxDxKUslozjkDiXoqoB+p+JC5KkmCRJJtTuROoQr42hew2JZtjFMpGuE46cONeCeFB1J6dwukQh2MLNVJ3qOgz6/CFWuS31cmzB5U/geSJSVtrpnAvyBA4C1N3bwaZnolqHroIsfO5mWWt99o+v/lX6OFk7wH73qEO9m6jBa7dCEuKpG/qJqWNX56xZ9Gj8a53stmpIrjhHX/hQbuhvscWacnQuIzAC7DCC9mQ01Vw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(2616005)(52116002)(956004)(66946007)(478600001)(6506007)(8676002)(6486002)(186003)(2906002)(16526019)(26005)(36756003)(66556008)(66476007)(8936002)(6512007)(9686003)(86362001)(6666004)(4744005)(5660300002)(6916009)(316002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bm73xkm0tj4+0+ebI94WpPZj9boArJuQjJ07YJfn6Hn5vWAyy4S9tlx+0fRZ?=
 =?us-ascii?Q?ZPOGFFqKSbjofz+tGi3nrOv1qeVeKXTUJADLYs0//PV6YuA9uX3tnT8fgPPZ?=
 =?us-ascii?Q?1ORNMzZ0tGR0NIlzMbZltLOoUibICoW5ynnP290i7lZT67K5oy47UAvxet25?=
 =?us-ascii?Q?5Wu8YjxS/foppFEzr+ki9iFxCr9szcHXEkQqGFwKP2t3BM2UJD2pFwZzvR0I?=
 =?us-ascii?Q?K11pT/C5DG6gP9a63Xw5RdbkUpIh4W4KPlhf0Qw4v41H5kE0KNfQaYI5vB8H?=
 =?us-ascii?Q?8yNsL/xYHv62KiiY8hyjfN10pl2RXtNpT+9Y2IabujUJt9mLyjFZcJYM0Ynk?=
 =?us-ascii?Q?uUcge31tHIzqVzn7PfQs855kmYN4dfTjaW0VsE3EuO5X4QMn+J9QwaYxoE/t?=
 =?us-ascii?Q?9/wkNXF56ZqqPWyTozKEEtvSa0XDI+gb6vgrnlLOioXTGTD876rVyZxm/Jph?=
 =?us-ascii?Q?MpZwjiv4T2ezw82VJyzze/9sr6hvunuFtFRGZ5VacK/fPkjX0WluukA1KYyA?=
 =?us-ascii?Q?IufkkXqYWC/zihNUW4lK1g6sj8p6Fmc4Mfb9X42iofZKdFs/78+aE5kU3Oiv?=
 =?us-ascii?Q?Had2BLy2l8C2meq9Yfkg25Wa/9nTHOm7RW5DvD/u7zkh5YMI3QyOCqjjhk9B?=
 =?us-ascii?Q?wZvqBsNR/bzRkQnkndfOIs0iZGkgMdx+BG1hd4tqyyDWFgSU2vYLlvtUN07P?=
 =?us-ascii?Q?akWzLAU8tUOh9pSqufhI8hm9FdKiq+7u1pj33ZejCuIgHaZxLZenHmqgfIKU?=
 =?us-ascii?Q?A2UlGkbjVDIRKcAX7KqBkspEHATxe+jVC3AegRzMS8FoSxAV+z3+hhaxKusE?=
 =?us-ascii?Q?9KWLhLXTBrP/g7WEwXFyTCqp/eST7/dhqoDetJdAoEP2W+4cC4P7Z9O0Yhg5?=
 =?us-ascii?Q?5P5mfZciirrlys5mnXt6sGypnA0WyJngDpIRHgrz3kTLAnkzg2g4Pqk7Ri4x?=
 =?us-ascii?Q?/Rlf8wSXhnj9vvcxePf4EewpWlgPED0Yzd4NYfL3LuQPH5R3xTkEKy+HKNwf?=
 =?us-ascii?Q?Z3WF4LGfMx0xiIIenjEyFCitCztdsiUc4BDTEU/NjcZcfhEcN0dwUXICt0gc?=
 =?us-ascii?Q?e+KbG3P5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4b8251-2bab-432d-8519-08d8c689979e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:15:55.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6YodGoVe0pQIsy6+6H8bYZg9a5nq4AC6+WPHozhMFlXMAc3QQoc+jbpyXAtwTNP16l7FWcORVsapHlweDVkow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the build host info to improve reproducibility.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb b/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
index b223334a5..5263ffc03 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
@@ -213,6 +213,11 @@ do_install_append() {
         mv ${D}/usr/lib/* ${D}/${libdir}/
         rm -rf ${D}/usr/lib
     fi
+    # remove build host path to improve reproducibility
+    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
+        sed -e 's@${STAGING_DIR_HOST}@@g' \
+            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
+    fi
 }
 
 TOOLCHAIN = "gcc"
-- 
2.17.1

