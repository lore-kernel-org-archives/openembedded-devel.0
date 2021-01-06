Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.74])
 by mx.groups.io with SMTP id smtpd.web12.2983.1609902851148457354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 19:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IrwnME+u;
 spf=pass (domain: windriver.com, ip: 40.107.244.74, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW++YhUnt70iAHvKQxDrynxBYmkFBTxcFDAffqM9uBL0Uld8bpk+7zwtzyADVxZz8eHpQca/UHSXisuOQMJFGPVSPBkVJaMbYhV61UZYkpD86wIqVs5T13/msuzcG6WPuy5QNSc9CaAgViYjOPolJkoNnaGIH8G6v+sFHGlGtEvbI6hJqSoXIQgCDl+a4/Rv58oYtcRvdUzJUFdbXBmLX0iJPZLCl/YyYfi0rLysh4MGoQHN831fogGWPMcs7Qaj7O+uOFVAafrh2mvbHYxtWX1ESEU075B8z6hnLlu9qmvXp9XyV0cMZ1SsjpUG353PXAx4rToUXHHPSEAB22fSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbKjk5Z6R3Tfj2sa7AxiI5TEV0/rrk0aMFUPGMC1JR0=;
 b=A6qXRsMIrYus5h833DVHnwwR3sndnvwA1u0wNNHIsCMg3p9tncBumGMvnqH7wnPKEC58i8u4buzysgZxXjdL9clKLwvEDxM9R2oOTz+EwJ+ku9YYHYIXvZUUJm78KL/jU7O7xVOtjqBLNBVo2KTlX9bIDGPq0G5Oz1+c4YdV+I6gpIRxfMuuq3UOa4zANrKpsBAbo936ABHlm5FkgxXg6lY+vBF6DqHD//uVoTPVmVTLRSMNdspk+pBlStsZVf9LvZIZdIBUNiIfmGQCLEpWUd3McL4t8gUN7xmV2pv5BeX2SeB3zf4J5KOj4wWlQYBGEhXvYBI1rqwsJLkuVqFiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbKjk5Z6R3Tfj2sa7AxiI5TEV0/rrk0aMFUPGMC1JR0=;
 b=IrwnME+uB26odXzH5Gx4l4eUajjmcG0k7mN60H3OCVh0/Jpca9OiqMZsp0zKhYkMN/iLZvDqSKxN588FicEm/9uHTWBgC9P6+Z6Ru6Ckf6bGwW6FJuBRKpDB57dSJXxs0D2fAFVaguDB5avvNY4tMOaPu6j6+TTeLWRpkY8j4Ro=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 6 Jan
 2021 03:14:08 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7%3]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 03:14:08 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] tclap: fix branch
Date: Wed,  6 Jan 2021 11:13:48 +0800
Message-Id: <20210106031348.39064-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0043.apcprd04.prod.outlook.com
 (2603:1096:202:14::11) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR04CA0043.apcprd04.prod.outlook.com (2603:1096:202:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 03:14:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 077187e2-bd51-4b7d-86a2-08d8b1f121f8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3672:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3672F2D6F3429F868567F894EDD00@BYAPR11MB3672.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+S4EVgpaIXbjgRvyJ+twCT7GCk/qLknpOMITZLQL/Hj2x3MZa8bmYxOEpQchV0HXDncAq5JPJACoqKCf/F4L0QO83/3mYqHQgllEt/BMyK/7j9WVPUY+pR/VFFWMmjkUO1ouUduDse/Mbq6/H4FNqelmGMDoST6ks+XnRQampGnaFk90puldQH4uYNMqwOO77/ZnJegckMoYZ4mK9M6Ghuv80XPZFo8Ib9+EyvfTk9+FHZhKQAAmq4PZHRBkY7swA2yU0/ahw5UAP6NDBDfhJnIVI1kpbuRbrnITfIK/8gR7i4bbDpaoIEN7ckQi8S8BS3Mt2Jl9mRC/ludnnhte6pTPouVBPUF2QmdRqS3AevhjQtXp2OLNlCu/O/arEkkgYzwgDdZwHdLZyGGj1g0/gw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(8936002)(4744005)(8676002)(6916009)(66946007)(316002)(66476007)(66556008)(1076003)(478600001)(52116002)(2906002)(956004)(6666004)(6512007)(6486002)(16526019)(86362001)(83380400001)(6506007)(26005)(2616005)(186003)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?05/FFxE/k+Vwyxwk94fS9GYxyoId9aopQAv4weXMWzCJiF2CRHO6SMhVc5Q+?=
 =?us-ascii?Q?unBhHUuLOdh0MusfM81aykKSTP6Kx0e+3j6rdq+baSttGVbTdEVmsRtiOIS4?=
 =?us-ascii?Q?Ety0euGzETXYs1ET+Ii3l1YG48PxNLmJ9tllZGD7pH/h5Nf5xfr1UtrIFUIT?=
 =?us-ascii?Q?MUwIrUFMRQO0QoJyeI3f1fqrqv/9Nn+wgPfQQunoRRDGLi+aeBhtPoPjmwNS?=
 =?us-ascii?Q?lsLxzo3KuoIv3TM6zNfvhYX1RJ4n8AmQT9frS/q0ZEMML8AN7kJbNPhAZ+UR?=
 =?us-ascii?Q?YWxdr5cJ+D3bXddHV6y3bLSAK+qVuvWN5b958kn5bbW92wwMkOGZQ5Sh+HWW?=
 =?us-ascii?Q?aKwzL1INKsroIoUerRq76E2eGnd59/pKEdHtXrGJmqbYc1hXbKfw08cT3l6y?=
 =?us-ascii?Q?gEau1qNp1lwOFp3bGxMcX54fl+2CLRcfQQWvZ39xPWlViOY5prpILp2Uq5bv?=
 =?us-ascii?Q?9QKZzoIEA9Wg/oUUl+c+NTmWUzKCRs74D/ICpPDg66kaA1vzrp6QaPGBCpuS?=
 =?us-ascii?Q?IZaNmHY67pFgzexJmU4eDBncLM4/zMjpyzvFoyEDeAEUNPxqwQyymXhk/vab?=
 =?us-ascii?Q?d07fuIECAYxV0y3vesw1g8UUrihj5wpqMs2BqC7emD3xd/wFxg37RPjBTGUy?=
 =?us-ascii?Q?tLbryfbbqR/LNnZ7OVQm+yqY+/wKNRn+VihTkRzxii+1CjLGT6nZp+YG3XFR?=
 =?us-ascii?Q?umim36UdpJikZlOeiB2yV99RVnJV4cMOHAX7n5xYZta/oSqXQaK38DMOg2Wd?=
 =?us-ascii?Q?WIhgT3/auaOKk9SOVf+pNIpEqZ3BftgwxSQOMV/+FMC1+OO/VNA00dU3I08c?=
 =?us-ascii?Q?UcRCr/Sm4nk2AqBeYwfIU/xh37NgmHfkqAc2Tk4CqUWdLN7JKdVN0bnuJ4Cx?=
 =?us-ascii?Q?UohXiReVoNZK73cBjJQOIvsnuMGFgjgNkAMD4cjsZ4af9ckmpsl1eFexbgiF?=
 =?us-ascii?Q?lCsR8wUhhRxTFeyZNrP4Gkxg6fCJ962yRrmxLx3KonAu+D0gTN/2sjeeVa4M?=
 =?us-ascii?Q?dvIS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 03:14:08.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 077187e2-bd51-4b7d-86a2-08d8b1f121f8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9prR8Z9amf26+dn0PClPO1x6frYIVxwXXk3dPHfbIdf1q1iyt1FRlzRx4HrQWLUa7F1pdt9FGkgTpHJ/BQOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3672
Content-Type: text/plain

Upstream has deleted the 'master' branch, so use the 1.2 branch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
index 47ab2fd7b..bba8d5c21 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
 
 SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
-SRC_URI = "git://git.code.sf.net/p/tclap/code \
+SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.2 \
     file://Makefile.am-disable-docs.patch \
 "
 
-- 
2.17.1

