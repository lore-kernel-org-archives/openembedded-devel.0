Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55722FF6E8C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:32:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9261.1773822745086014548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=v9bAha4b;
 spf=pass (domain: navimatix.de, ip: 40.107.159.77, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMQfE0mfMznC6niZ2ctoSCzqZdZqZdOgQpfw5VT9UGKoUIASd4D95lsEOftfleavtKdcVZ0M/P+S2+fiiGxxLUxl9OK+otkcOvQH7oMmFMC+H1yfopzVlyPRzNCYBKlYGeBihYe50waZV/wsUn7hvJPdcZvz5AJlPXUSo907vFFrV0UeHok94z9o+6UgNCKwzVMz9jI54N7e1XLZw0Jv0h9u9o1236LYR8yx/oZUC6n45WsNtjcQJ34YKTL8NGdMT4i+C11mdyC18TSQnoddn2UrISI0UlCeraA01Hx0IFpj2zZ2pgK0l6tjGffU/HIdHHoT4jQFZLr8+ES/wlryuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfSX/b7/wkSUn+qY5GpWEnAQRVXkwqO1OFJFyGXzph8=;
 b=AM5Slz/+c88D6nhAPxxxt4CvWNOc4ipxCP84+RC/ouYgxiwgmmQJD1Dr2ciGoHqZ4to2c6OBnDE9TNZsb8aXb0LpWGm79blyNl1AMTKnRHWD2+WfARAiYsiM/urRhsJERQhccGiMUXd9F1qq++wtCbZTwMCfKTWyVWYh7nUsylI5RO9o11fCm9z/lbP+SsP4XJEgtcUJ0ZrGy5Is/t0an5FqJMi8iWBJ7k5U7ct0nK8f3MvLQhMspW/r2Znm29zT0R/g6a0XA8xCMTrdOpKHbUWzRo1h5DOeJAtLl7ZaFWqPVNIWM/kQt56TLCme+3uVnDiDcOArtpWjX+lOkkrPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfSX/b7/wkSUn+qY5GpWEnAQRVXkwqO1OFJFyGXzph8=;
 b=v9bAha4bEZxuEVGjfolpeZiYdUzL3i7QeGzFlM8w3s0+nm4zSAQAUGFNFqo+zILHipT1qel4PlWUV7gXJZhA0zypIDL8F87nEhdZeHxKYT8FC2/WkPV24mxqMvCG/nGqGzebmEcL4r5krRTBu2eraqvTleYZjLNk6KOwQQHKPeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PR3PR01MB7147.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:5c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:32:21 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Wed, 18 Mar 2026 08:32:21 +0000
Date: Wed, 18 Mar 2026 09:32:19 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] wireshark: Add xxhash to DEPENDS
Message-ID: <30f605013fdb1c5767889514cdbec44b3ceac45b.1773822738.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PR3PR01MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 7338e08d-6bc5-4008-115a-08de84c8df60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IOrnfTrqcCRIGrV516xh1M4oqHJ3jUiNYy9DsdxPHWv6IsX7cYccR0nuFUOwD1m7Rrcj4+vWJZmXNQBQMg2qY+f97JNEuF+eQrI0RuD9gntmbMKOrl+YZpvqbCa+xdpesDmt5FWuVdHef1TsT2hu3tRLdVCNPOQO3BWvnU48GYYGhvIP2h5DAliqEnq9S61LVOKnk8g6h3Em1acvIDTuwNlO5DywFelaUYRnkmWYgtv8PkzWCqJBzPtw1Kx1C0jBqx8HUeIAQkLRDF3ciNPNVc2Xhflx+xLkUVAQx+24yFTszKFwJvfw0JiYNUeRDsZaTp+VCuH0fBw1NQiUjYM7VdNasoF0sp/5kiSkUWzxYYAagYCGM5U+KDs9FUloUitvTe6P9ZfWrmrMFStS/9ACaNt4IKija7qsPCftnnzhFuWFON/0l7w5sXsjr4g7ntUGd/lyQtnpA+ZuxausXpEH/C6GcA5+oC7tHximguAmSS7PcjNzVIQ2Y1pjHigQit4QgjuPl2vzuh6pcmgXMh6kyJmUHyxqtrVuZvjtsp4o5ZGjZxpMmg2WwBa91X05nMTC1dn2p7escI6zYZeHL0v4zi1DGyiTW9StQV7wjp42cmbbDoIC4J2TUi3xkH4ACDraH5eZ+zRXd4lVuUDGcsN1pZRZjwCN/e6oexSlMT55CSPT9eaMsSzLJGy+WTKXTs9xg59CLAj/M24vxSm/pjw0mhwKd4RVwL1LBziKEqEdXv8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EGC5VvG6cp7GfJ7iIUFOtMBPc57yFVfInqnqjKNdBMjb012HTlOksREfNVxk?=
 =?us-ascii?Q?5pqiDeXWadLv+hJRrFVB/mHdv30dYDcwuMjjKAuiItIJ1RUXogzhEv4Rxisc?=
 =?us-ascii?Q?YTI8GAPeCKEVjSMzQHJO+2PtRLf4A+UNbU99dzOd42n5osWewg0uS36e7ecf?=
 =?us-ascii?Q?U3WObgoU3vhAlpU46KJf3JUC0Hh5RNHRoI/H4z0b+iJApXh+JCs/tRjMZWs2?=
 =?us-ascii?Q?6K3//m+s41waedkwegwwxpzsXXaTo8wwoun4kJlfR5IZUKg+IcC1qZ6kRfAT?=
 =?us-ascii?Q?fVfw6/3BShtc3JcH4RghzQBAGQPaWSlrTibWKQqRgdwCjkgUiAsXCHZiEJlP?=
 =?us-ascii?Q?l+/AsAroLJlJBC9Wt1pIKz3Xk/kldMzCwf4N1c7fKsqEqqdtaYaaLUu04WcF?=
 =?us-ascii?Q?m4vENdwRmPLnDW7mW3YPb+aeZ4jFQjCCr5VXyaTpcEKHi4efuWa0phtFNxtj?=
 =?us-ascii?Q?RmaW48zMQS9oMOW+EQGjaHjuWglsjNDXV9dQ3/NydpyWAQF6mDhhMN+aunQy?=
 =?us-ascii?Q?SU0XSA7XphwD3vrEzeaxHpzpMtTq1NHp+qJqfVehgT/gp5uSGpgnjJ9+mV8N?=
 =?us-ascii?Q?jVaGHVxzVwE0L/V8B+zChmcSeQlw0yU5cvzdaCJJxh/amFrvuRbMtSmslqv8?=
 =?us-ascii?Q?VQJ49D0vbEDTMhIu/RF53cF9ja7yP3ZFgAtHUjcGLmW2gyeq6hie1xF49BN5?=
 =?us-ascii?Q?ARwfZo1j8Zzte02e2NHNWDij2A334mNLNDSeJ0DlcjtDHLfjWWS7KOLeK/og?=
 =?us-ascii?Q?87yHpry5oAGO08WvUekfvWB8dGq/VtSAKkrD1W2C2p4Si6HRfk+NEucVXmMm?=
 =?us-ascii?Q?3/WU7Vw+Y6obL1EOcTQkiOf4Cvs9Hy4bKg1MGmGTupFFn0YdxzUFIto4CJL0?=
 =?us-ascii?Q?vUHZIcQIxgRL4hMVI/i7KJ0mv0uI7P027IVopnMiLa6NlLfOcDsUwhgAT9xI?=
 =?us-ascii?Q?yOpavDOUcn1rc6AGoEa3AQ+OUKsg3sJu2m17X3uXyOnU8Sd7WDWDZfCKqBO6?=
 =?us-ascii?Q?IbtBdyJfwW5FH1LslS5KKWdW7zh3402t11ZOzv/WkUnqbZIuhio3Ws+8Tz6Z?=
 =?us-ascii?Q?vw7jT5OZP388PvycOMncsFYZ8CyTtm4sk+1HqjTpkJ4i4quvoOT44h9LPZ3f?=
 =?us-ascii?Q?PHimhZsPcXwfwDGtmzbVYCha9aKNQPnRMxAX4F/PFjTuRBO8dxqPUjslXhan?=
 =?us-ascii?Q?DPt04jw4BoZfGDKeQFZsnNCvNTMjlPYoGX2lw/j/QWDLd63kfpO7aq9RKVd0?=
 =?us-ascii?Q?5NuQdxCXbm/7gTFqNJp3rVT+iBUSx9g6TFSfEUSaWlQ/V0K4px2TEIW0FO5f?=
 =?us-ascii?Q?vcWTyoZ3mA4k7olwr3FLoBcmreI4bqG1Nnu+OFn6ZFy9wdD1H4wH+uI9OYRu?=
 =?us-ascii?Q?kfdFPR0n7flpiJt/Z5WDVlgCmbvlaFtsuPpy9pQpmGZIQUB8mIetfU6wZT2Q?=
 =?us-ascii?Q?bdg3083h4KShYsQLZPv2YymzjAYNHhwkYMzVwA8ECrLdHDT3S+5XoBgHdhlB?=
 =?us-ascii?Q?FsSNHv84O6jDCbZBY/LhDxTKEdn9xk2582o4qrdu8t8Gf90xR6rrRinhEsFp?=
 =?us-ascii?Q?chfR1EtT47RCcLwHLTzUtRL/yxwyOOlTn2unFp72kmWqM14L619mzlMmgGn4?=
 =?us-ascii?Q?AE64uc0B5GFcMpKX6g/zQeTqzMgDVls9lTK8wmFhwU6BhSJA9MaoqmglpO2v?=
 =?us-ascii?Q?0y9JoKdMaOe0o6lBNToxPn69WciFJuWUo2XCeEziXthnY86ARCdVgJLIGLKn?=
 =?us-ascii?Q?CzGPN3jal/AIHqOMW7cxdMX/D0rNakQ=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7338e08d-6bc5-4008-115a-08de84c8df60
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:32:21.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMfutabSUKKRkIG6+wWMo3UfCfbYc/sf5gcqfUI1b/wNzQ5rMo+6jrWhrt8AhAJK6jrCebNUbE7o/d8hGV6y27ZPY7K9gRIRRHBEMZMu4Ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB7147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125353

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Currently, the build of wireshark fails with

ERROR: wireshark-1_4.6.3-r0 do_package_qa: QA Issue: /usr/lib/libwsutil.so.=
17.0.0 contained in package wireshark requires libxxhash.so.0()(64bit), but=
 no providers found in RDEPENDS:wireshark? [file-rdeps]
ERROR: wireshark-1_4.6.3-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
ERROR: Logfile of failure stored in: /build/tmp/work/core2-64-poky-linux/wi=
reshark/4.6.3/temp/log.do_package_qa.302606
ERROR: Task (/build/../work/layers-3rdparty/openembedded/meta-networking/re=
cipes-support/wireshark/wireshark_4.6.3.bb:do_package_qa) failed with exit =
code '1'

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-support/wireshark/wireshark_4.6.3.bb   | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b=
/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
index baf3af925d..3365a510cb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
@@ -4,7 +4,19 @@ SECTION =3D "net"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e"
=20
-DEPENDS =3D "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error l=
ibxml2 bison-native c-ares speexdsp virtual/libiconv"
+DEPENDS =3D "\
+    bison-native \
+    c-ares \
+    expat \
+    glib-2.0 \
+    glib-2.0-native \
+    libgcrypt libgpg-error \
+    libxml2 \
+    pcre2 \
+    speexdsp \
+    virtual/libiconv \
+    xxhash \
+"
=20
 DEPENDS:append:class-target =3D " wireshark-native chrpath-replacement-nat=
ive "
=20
--=20
2.53.0


