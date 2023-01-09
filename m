Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33473C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 15:25:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.74843.1673277954156960535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 07:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BnQPuhlV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0373b3ca0b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309DvfdP025077
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Jan 2023 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=E7v9zVJZxDMBriCb8TC9WdozM+o+dVX0kueuupq9mo8=;
 b=BnQPuhlVag5yL2MuVe2S5ah8DeE7zs3nFs+SVs39hmJwtxJYcLhrcFUaVwS53TtH1pBz
 urqcZoN4ppIsyYIZBTtrEahqAouxMG0ahJmTjbOJjlD2cdOO3sY6iQ83d18FWzfFBJGt
 j82x6+EvXA0D3geonOvvEjZZr3XmA7vjwGjUsVz9zlNwK0OzfDJCFHQzyR0H9zVLXZCa
 aS41is9FB36LsOgvk7tfRIjGTJ3Zxe6DxbBnQidmLQUvlpRXwBVUtX4M1xoMsw/2iv5W
 JchTPx7gLxaXZSu0GX/yC5k9z+mU0E047M+URHwDv/7qZTE2/slX/56u6JEP4QH6OGe6 XQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxyqasxv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 15:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGjSv+T+rEbHlrbLjwI+C6+GKZ+PVy45dxxmBW6EIo+Nv+WVTAVUNToDVSGIrZsvQ5m72qWqLYZQ3vEsCj5vWxrBMm9XPy2qYbn3EPkNlgK85Lz2JWc56eBS7NAhAIixEZDGNfxo4hs+ey87F/nAPIOmMzL0m64mD367l4witR2kVn4pEtT/2GHA9izUCtMnk6ntu41UX4PlXJkS2yUkbmMXbEk1qLEwDwjwL7HlSd9wevctt7S7c3eD3HIJrJHuJS5VBbsES0J1c8RzxerCZYTJORiQxFvMCdVzQEmepfOyshnMTFu32XRavsBOnfmrUe5IBK8WKgafeOHOFb2WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7v9zVJZxDMBriCb8TC9WdozM+o+dVX0kueuupq9mo8=;
 b=bKVzbxJWU0/G2mvTZmTNy8vb79hiRXI9N8hGtORQFd6GNT0+/5UI71wSDJP0DVJMXv3fIun36G9bNzIU9MFZljWRdWBNhP/wY2wuMs+/jukbyFvN9rNMCgr7Q3nrq4rslhxHOu4UBFopMB02GBfeC8iVQEXeMiqRW/YfHdBxlm04xYZ6DMo+hx3+ln6kMNjlpDTbHYtFTnw8deU4a2jSlCtG92fBeRtugR9D8pk8zvtBcmq11nuW4C3F+rZwy/xrMTWDJW2+Y8Fu8CIbHwTLEYLut5K/6cac3K9ih3gBPK0XLIIRoP4z4UEpcMmZu0w3DD7cH4yYY4CoOfH/rA28pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:25:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:25:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: upgrade 3.0.21 -> 3.0.26
Date: Mon,  9 Jan 2023 23:25:38 +0800
Message-Id: <20230109152538.896240-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BN9PR11MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 22119b93-50b2-4642-adab-08daf255c852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TqFxdJGHhrDRWJLlknmTduPP+9sSghXnTmqh4GLlLAWA5ljv3oDVfdNwOVTlRG/sv5NawnSUge5SQ3VzNiEHQoZPjFDIQK/g9mm/LS+KMbeTXLFw8ti577cT5Ll/Ez7lhTqn6P3IqrItEVOOmcVK/4OaE5y+EOrMqm6ANR2G4oT6MLh8Tj0KklFhX4yk+DexOfzEBzq64AMV1Z+/vsdcpR5sKUr1Rorsti6AasbW+KCq1t1NfV4AvWyzTy0uYdLMGAUeDMW/S2zVeMuNHCR4xWJjgWKgrA/mTsX/JEfm6LjBCxVV6E6Z1qDsuEQ1tgjj4DV5bIZXWPD/F+IdibAbrcj0RTCScfoOGKK9bKruVJl505uYc4GsQ49If8JU2YVQ2wB+BJoLooLZ+C2IM4rC3JlGF6sB/NGGm2Dajd2Jk42c3k3Wl0ZNx0BqmRL2veatHrxbq6TVqFq1vtvxoFzJcrV1qPQjhRsGG/SN/blfl5dunOosIAkTG39XDeDC+hQu7Cvnwa5jbBSrAZOWKIuZR6u8F16tPCyrdE9sg51pBMYPx9DyFnHrEFPC/NAX1tHISXGpdlqs8jaaHBjnx6gV2DGeacA0RZGaF2WnjFabU2pDJTe/WIVjU6c9ziUyLJZM6TqeNI5JPrvZFcUz+pL+xUgjPPWa0kmrFuTxDcHBmUeQ+SvHLpsQU0vV3A5t2w1S6zX4cnZ5JD0sWXKIDbIBt8SHOe4KpGSlklm4nRkr0uzXNgAtm7nXZxObZr4+4fgHCMzjcjJWRNqySf4MGtKYwEblbTW/qmJdhT4w92aspWuRKa5AMZ6uc+2lsintmo052hQNgPdhj9HWT8HCBZ0V/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199015)(316002)(66476007)(66946007)(8676002)(6916009)(66556008)(52116002)(44832011)(2906002)(5660300002)(8936002)(41300700001)(6512007)(86362001)(478600001)(83380400001)(6486002)(53546011)(966005)(6666004)(6506007)(1076003)(26005)(2616005)(38100700002)(30864003)(186003)(38350700002)(36756003)(84970400001)(2004002)(547064002)(579004)(559001)(460985005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UebtHJ4x1jsNtfAmPLr3sNOCaWdC+hVWvxRls5oSBXD+pc4Lyb32iQzz4ihh?=
 =?us-ascii?Q?wl4+VQmdZhJ8uApZ8VC+POwc4R+R056X5lhsHvSjlH9RBJ7SWQAyGGwhPBXb?=
 =?us-ascii?Q?4O2ozqWRtS+bEH8L6Bre2HthwA/gjuLHzCjHnm03CTJBdlbwTRVcA2RzaIp8?=
 =?us-ascii?Q?abzgyUAcf32CkRp1LYWxLmQXCJaSyUyY1xebbtAUqKe5qWs8A2+SvIo4Hkcc?=
 =?us-ascii?Q?2EmVq6k8eE7eHbMibvTrloDV5SMtOAbdDysGChnmUbNDJSIMg+tVaeyWwvuo?=
 =?us-ascii?Q?2cbEc8P1jMEm2j8p2NplbR8/Zh4kfFTOQyJnMIRcqklnZpGO/myuNC2uibDP?=
 =?us-ascii?Q?GF8k9Am9vwMkXo8e6MU8hRewGdZ9R8mWNdzUH0CoGZsMQrmWTIHGFWRbrDWm?=
 =?us-ascii?Q?JYroCBLomVzG9q3Lniru6Q61D7LkQz/3cZskSmEbz908SZ5CUJpyg+uPyGL6?=
 =?us-ascii?Q?h93njVlzTXLGOdqCT2cr0eZ2Sn+NaNtLLshSQFvURSdvGCbmwyGfeXEjXKOh?=
 =?us-ascii?Q?duM/wuzx338Hl6GTO+YKEDEQflol8yJGuscQ3KPnrM0c7fUdoIsqStLd8oC8?=
 =?us-ascii?Q?Y+7eAKZy6kfjQ9lvojUCFd91IC3LKNDr7cMy5NuI4S3EFkiVIxGSNj1+vr64?=
 =?us-ascii?Q?6K7YHUaXfDYHoAQ3BqjQ/NRob6s/iPkpBy1GsMTSesKjqqarArdYt5Mv2jZR?=
 =?us-ascii?Q?eSfj9d+ebCldYSkI2U1ARgA0afVHjBJMYkZt75j4ZTRkm25e+wxFhI9pdF5e?=
 =?us-ascii?Q?PeRbsEaySXxYfATlOtXNKGkZsn8QYH5EuIiX8lPwbGu+Mw7Xtjznp/xoVACh?=
 =?us-ascii?Q?C5ctKVRdMbhOFgBDaMoRN3Xj7ESwjshyH3nXoKd4o9U+UutFvtkrRsDh63yV?=
 =?us-ascii?Q?Z8MzP+tZKOsd9HUD01hLUszQUKyGE1ASrpXEGtt7382wZ3qVPutkGc5NPAG/?=
 =?us-ascii?Q?qEG852v6l5MYSfiSNFimvAoA/wm37zldYA/w4CxhnCaxq4FDnVMGKp7ciwrE?=
 =?us-ascii?Q?IdvyrOz5hL8Ud6jYjkw7eHkUTcDRy3ga0Zi5AYK/LDf0eAoNF9ixGfwl5XFb?=
 =?us-ascii?Q?eGO72IPfzr7bL2V7vrrxC7iklBaJ+ubgsXKUpke2hhWuHtN4zcZCjaiOBTV4?=
 =?us-ascii?Q?XH78vgek3FsZZpvd8mTZj2jziyDfi5hY7gCHCUJU1xWCzJ43tpjxQEAM/xIV?=
 =?us-ascii?Q?6GOFiVpT3r+68LCUnnxgSN4Z2fii98jIRe5lPsUh6z19qa/CQVEBMFVXgY3t?=
 =?us-ascii?Q?LHiWhvSuKiz4LzPbvC6BQffWzubO1ltBi7UFemuEfuoicHzkGVJgU4ndfr7k?=
 =?us-ascii?Q?PXMOMupUaZH5ywRX70LsJ57ga4NWlozBlUs7ooAXeaULEQGxcbRECrUXfJ2E?=
 =?us-ascii?Q?IiwKbmFr02U89gWk4+a+IlYwNn7hQkieJQzEW3C9tUN5K35xCCGqdQhkph10?=
 =?us-ascii?Q?w/vznLxaMNTQ8JFwAphlmlizG/fcQHooefhLa+e4YC2IDBp6OS+Q0qqAtpMG?=
 =?us-ascii?Q?YYUU7ou1etPx3TNF7r55RvE85O9TsDBB3QgRCWfUIx/QkOvt8d35xcvArdwK?=
 =?us-ascii?Q?FfYeKk/jMqO99eUenHVlvWKVvM57r7mK/62VrS3E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22119b93-50b2-4642-adab-08daf255c852
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 15:25:48.0549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVRBdFUw8g+rhrHhZRfh5/MAhYL9lQK7RhAQigVCqpzgNdI/nhrgxhsvMGWDCX71K7zDwoqlh3kN1HvK6OYj1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
X-Proofpoint-GUID: sEylYV1SOp2gbQYxsKCXB79i9_y6oyX-
X-Proofpoint-ORIG-GUID: sEylYV1SOp2gbQYxsKCXB79i9_y6oyX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_08,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 15:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100482

Release Notes:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_0_26

* Refresh patches
* Add autogen.sh as we still need it in do_configure
* Backport a patch to fix configure error for rlm_python3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-Add-autogen.sh.patch           |  46 ++
 ...-user-and-group-of-freeradius-serve.patch} |  12 +-
 ...onfigure.ac-allow-cross-compilation.patch} |  10 +-
 ...patch => 0004-Fix-libtool-detection.patch} |  33 +-
 ...-configure.ac-add-option-for-libcap.patch} |  12 +-
 ...h => 0006-Avoid-searching-host-dirs.patch} |  57 +--
 ...python-add-PY_INC_DIR-in-search-dir.patch} |  12 +-
 ...=> 0008-libtool-do-not-use-jlibtool.patch} |  24 +-
 ... => 0009-Fix-quoting-for-BUILD_WITH.patch} |  13 +-
 ...-for-expansion-of-macro-in-thread.h.patch} |   6 +-
 ...cludedir-instead-of-hardcoding-usr-.patch} |  17 +-
 ...ile-fix-the-existed-certificate-err.patch} |  10 +-
 ...ile-fix-the-occasional-verification.patch} |  17 +-
 ...-Workaround-error-with-autoconf-2.7.patch} |  14 +-
 ...rap-check-commands-of-openssl-exist.patch} |  10 +-
 ...6-version.c-don-t-print-build-flags.patch} |   6 +-
 ...-python.m4-for-detecting-python-3.10.patch | 427 ++++++++++++++++++
 ...eradius_3.0.21.bb => freeradius_3.0.26.bb} |  60 +--
 18 files changed, 632 insertions(+), 154 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-enble-user-in-conf.patch => 0002-Enable-and-change-user-and-group-of-freeradius-serve.patch} (67%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-allow-cross-compilation.patch => 0003-configure.ac-allow-cross-compilation.patch} (85%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-detection.patch => 0004-Fix-libtool-detection.patch} (73%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-add-option-for-libcap.patch => 0005-configure.ac-add-option-for-libcap.patch} (87%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-avoid-searching-host-dirs.patch => 0006-Avoid-searching-host-dirs.patch} (85%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-rlm_python-add-PY_INC_DIR.patch => 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} (81%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-do-not-use-jlibtool.patch => 0008-libtool-do-not-use-jlibtool.patch} (91%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-quoting-for-BUILT_WITH.patch => 0009-Fix-quoting-for-BUILD_WITH.patch} (87%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-error-for-expansion-of-macro.patch => 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} (95%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch => 0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} (59%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch => 0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} (92%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-occasional-verification.patch => 0013-raddb-certs-Makefile-fix-the-occasional-verification.patch} (94%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-workaround-error-with-autoconf-2.7.patch => 0014-Workaround-error-with-autoconf-2.7.patch} (77%)
 rename meta-networking/recipes-connectivity/freeradius/files/{check-openssl-cmds-in-script-bootstrap.patch => 0015-bootstrap-check-commands-of-openssl-exist.patch} (81%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-version.c-don-t-print-build-flags.patch => 0016-version.c-don-t-print-build-flags.patch} (86%)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.21.bb => freeradius_3.0.26.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
new file mode 100644
index 000000000..e1228c2eb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
@@ -0,0 +1,46 @@
+From 3be3b9a1345942d1578ec73efa9b2e3c41bd67c5 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 21 Jan 2022 13:22:24 +0800
+Subject: [PATCH] Add autogen.sh
+
+The autogen.sh has been removed since 3.0.22[1]. But we still need it in
+do_configure. Add it back.
+
+[1] https://github.com/FreeRADIUS/freeradius-server/commit/2e9b6227efd19e2b0926541aa26874908e7b7314
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100755 autogen.sh
+
+diff --git a/autogen.sh b/autogen.sh
+new file mode 100755
+index 0000000000..959182b39e
+--- /dev/null
++++ b/autogen.sh
+@@ -0,0 +1,19 @@
++#!/bin/sh -e
++
++parentdir=`dirname $0`
++
++cd $parentdir
++parentdir=`pwd`
++m4include="-I$parentdir -I$parentdir/m4 -Im4"
++
++autoreconf -Wcross --verbose --install --force
++
++mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
++mysubdirs=`echo $mysubdirs`
++
++for F in $mysubdirs
++do
++	echo "Configuring in $F..."
++	(cd $F && grep "^AC_CONFIG_HEADER" configure.ac > /dev/null || exit 0; autoheader $m4include)
++	(cd $F && autoconf $m4include)
++done
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
similarity index 67%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
index 4a62bf1fa..c57ee93c3 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
@@ -1,4 +1,8 @@
-Enable and change user and group of freeradius server to radiusd
+From 2a74c10836c0d2d19248ca40d113936f4a56b039 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Sun, 8 Jan 2023 22:47:11 +0800
+Subject: [PATCH] Enable and change user and group of freeradius server to
+ radiusd
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -9,10 +13,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/radiusd.conf.in b/raddb/radiusd.conf.in
-index c62f4ff..0b4a84e 100644
+index 154b50d610..4594d6d2d2 100644
 --- a/raddb/radiusd.conf.in
 +++ b/raddb/radiusd.conf.in
-@@ -436,8 +436,8 @@ security {
+@@ -557,8 +557,8 @@ security {
  	#  member.  This can allow for some finer-grained access
  	#  controls.
  	#
@@ -24,5 +28,5 @@ index c62f4ff..0b4a84e 100644
  	#  Core dumps are a bad thing.  This should only be set to
  	#  'yes' if you're debugging a problem with the server.
 -- 
-1.9.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
similarity index 85%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
index 38e7c3622..e5442360b 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 0780b7053fb0d33d721aa70ab2ecd75299e5ba31 Mon Sep 17 00:00:00 2001
+From ba1390a80662ff2ab7bfda978cde7df9a871f6ae Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 15:03:39 +0800
 Subject: [PATCH] configure.ac: allow cross-compilation
@@ -7,7 +7,7 @@ The checking OpenSSL library and header version consistency will
 always fail in cross compiling, skip the check and give a warning
 instead for cross compiling.
 
-Upstream-Status: Inappropriate[embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
@@ -19,10 +19,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
-index efc9f29..98a97e4 100644
+index a0f510cfb3..d2f3eca03e 100644
 --- a/src/modules/rlm_krb5/configure.ac
 +++ b/src/modules/rlm_krb5/configure.ac
-@@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
+@@ -140,7 +140,8 @@ if test x$with_[]modname != xno; then
  		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
  		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
  			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
@@ -33,5 +33,5 @@ index efc9f29..98a97e4 100644
  	else
  		krb5threadsafe=""
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
similarity index 73%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
index 4265f9d0d..479e1ba76 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
@@ -1,9 +1,7 @@
-From bfe4d7ed72edc9d4ae1a0f0d2dd84367d6214886 Mon Sep 17 00:00:00 2001
+From 5ba3d140842268cbbdd983266efecb1fba5bdd59 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:45:46 +0800
-Subject: [PATCH 1/2] Fix libtool detection
-
-Upstream-Status: pending
+Subject: [PATCH] Fix libtool detection
 
 Use LT_INIT instead of the deprecated AC_PROG_LIBTOOL to detect libtool, so it
 can work with our libtoolize and libtool.
@@ -12,37 +10,20 @@ Simplify the detection of ltdl. It will find the ltdl from the sysroot; the
 switch --with-system-libltdl is no longer needed. The code is copied from
 pulseaudio configure.ac, together with the comment paragraph.
 
-Also patch autogen.sh so it uses autoreconf, which handles libtoolize better.
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- autogen.sh   |  5 +----
  configure.ac | 36 ++++++++++++++++++++++++++++++++++++
- 2 files changed, 37 insertions(+), 4 deletions(-)
+ 1 file changed, 36 insertions(+)
 
-diff --git a/autogen.sh b/autogen.sh
-index a1d08a6..959182b 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -6,10 +6,7 @@ cd $parentdir
- parentdir=`pwd`
- m4include="-I$parentdir -I$parentdir/m4 -Im4"
- 
--libtoolize -f -c
--#aclocal
--autoheader
--autoconf
-+autoreconf -Wcross --verbose --install --force
- 
- mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
- mysubdirs=`echo $mysubdirs`
 diff --git a/configure.ac b/configure.ac
-index a7abf00..65db61e 100644
+index ad8bc8cdda..ef8fced680 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -220,6 +220,42 @@ dnl #  See if we have Git.
+@@ -321,6 +321,42 @@ dnl #  See if we have Git.
  dnl #
  AC_CHECK_PROG(GIT, git, yes, no)
  
@@ -86,5 +67,5 @@ index a7abf00..65db61e 100644
  dnl AC_ARG_WITH(disablemodulefoo,
  dnl [  --without-rlm_foo         Disables module compilation.  Module list:]
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
similarity index 87%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
index 471935872..8ef3c4bdf 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
@@ -1,7 +1,7 @@
-From 98a9eff357959d1113e33a615c2178751d5b2054 Mon Sep 17 00:00:00 2001
+From 9548dc5e1a6c835cd4f387ba384d8f3f14c3fc8b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:50:21 +0800
-Subject: [PATCH 2/2] configure.ac: add option for libcap
+Subject: [PATCH] configure.ac: add option for libcap
 
 Upstream-Status: Pending
 
@@ -12,10 +12,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 27 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 65db61e..6486aac 100644
+index ef8fced680..263098f7fd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -977,6 +977,22 @@ fi
+@@ -1161,6 +1161,22 @@ fi
  dnl Set by FR_SMART_CHECKLIB
  LIBS="${old_LIBS}"
  
@@ -38,7 +38,7 @@ index 65db61e..6486aac 100644
  dnl Check for cap
  dnl extra argument: --with-cap-lib-dir=DIR
  cap_lib_dir=
-@@ -1010,15 +1026,17 @@ AC_ARG_WITH(cap-include-dir,
+@@ -1194,15 +1210,17 @@ AC_ARG_WITH(cap-include-dir,
        ;;
    esac])
  
@@ -66,5 +66,5 @@ index 65db61e..6486aac 100644
  
  dnl #
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
similarity index 85%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
index 9c997661f..8fd0dca44 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
@@ -1,14 +1,15 @@
-From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00 2001
+From 8fe25b30b6fbb3170705f4468eb4c92eef3a968f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Mon, 4 Jan 2016 01:44:04 -0500
-Subject: [PATCH] avoid searching host dirs
+Subject: [PATCH] Avoid searching host dirs
 
 Don't search the hardcoded host dirs to avoid
 host contamination.
 
-Upstream-Status: Inappropriate [cross-compile specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  acinclude.m4                                                | 4 ++--
  src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
@@ -21,19 +22,19 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  8 files changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/acinclude.m4 b/acinclude.m4
-index da48acc..b513ae1 100644
+index a953d0e1b6..ede143d3c2 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -178,7 +178,7 @@ if test "x$smart_lib" = "x"; then
-   FR_LOCATE_DIR(smart_lib_dir,[lib$1${libltdl_cv_shlibext}])
-   FR_LOCATE_DIR(smart_lib_dir,[lib$1.a])
- 
--  for try in $smart_lib_dir /usr/local/lib /opt/lib; do
+@@ -115,7 +115,7 @@ dnl #
+ dnl #  Try to guess possible locations.
+ dnl #
+ if test "x$smart_lib" = "x"; then
+-  for try in /usr/local/lib /opt/lib; do
 +  for try in $smart_lib_dir; do
      AC_MSG_CHECKING([for $2 in -l$1 in $try])
      LIBS="-l$1 $old_LIBS"
      CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
-@@ -218,7 +218,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+@@ -155,7 +155,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
  old_CPPFLAGS="$CPPFLAGS"
  smart_include=
  dnl #  The default directories we search in (in addition to the compilers search path)
@@ -43,10 +44,10 @@ index da48acc..b513ae1 100644
  dnl #  Our local versions
  _smart_try_dir=
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-index 75c851a..a262d71 100644
+index 44f84aa27e..23a1899591 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -ldb2
@@ -64,10 +65,10 @@ index 75c851a..a262d71 100644
  	if test "x$ac_cv_header_sqlcli_h" != xyes; then
  		fail="$fail sqlcli.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-index 4da57b3..752b043 100644
+index 4c2fd7ba9e..10c864def5 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-@@ -56,14 +56,14 @@ if test x$with_[]modname != xno; then
+@@ -60,14 +60,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for isc_attach_database in -lfbclient
@@ -85,10 +86,10 @@ index 4da57b3..752b043 100644
  	if test "x$ac_cv_header_ibase_h" != xyes; then
  		fail="$fail ibase.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-index ba6304f..3393557 100644
+index d26ac9c431..6e4500e948 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -liodbc
@@ -106,10 +107,10 @@ index ba6304f..3393557 100644
  	if test "x$ac_cv_header_isql_h" != xyes; then
  		fail="$fail isql.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-index 1401677..2e7db44 100644
+index df36da77bf..31359041c7 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-@@ -136,7 +136,7 @@ if test x$with_[]modname != xno; then
+@@ -140,7 +140,7 @@ if test x$with_[]modname != xno; then
  
  	dnl # Check for libmysqlclient_r
  	if test "x$have_a_libmysqlclient" != "xyes"; then
@@ -118,7 +119,7 @@ index 1401677..2e7db44 100644
  	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
  	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
  			have_a_libmysqlclient='yes'
-@@ -145,7 +145,7 @@ if test x$with_[]modname != xno; then
+@@ -149,7 +149,7 @@ if test x$with_[]modname != xno; then
  
  	dnl # Check for libmysqlclient
  	if test "x$have_a_libmysqlclient" != "xyes"; then
@@ -127,7 +128,7 @@ index 1401677..2e7db44 100644
  	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
  	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
  			have_a_libmysqlclient='yes'
-@@ -189,7 +189,7 @@ if test x$with_[]modname != xno; then
+@@ -243,7 +243,7 @@ if test x$with_[]modname != xno; then
      fi
  
      if test "x$have_mysql_h" != "xyes"; then
@@ -137,10 +138,10 @@ index 1401677..2e7db44 100644
  		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
  	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-index 3178462..5cbc8c2 100644
+index 3b45da582a..03e6607d2b 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-@@ -63,7 +63,7 @@ if test x$with_[]modname != xno; then
+@@ -68,7 +68,7 @@ if test x$with_[]modname != xno; then
      dnl # Check for header files
      dnl ############################################################
  
@@ -150,10 +151,10 @@ index 3178462..5cbc8c2 100644
      if test "x$ORACLE_HOME" != "x"; then
  	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-index 4f9a890..e1cf811 100644
+index 8ac1022e89..d46c0f66bf 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-@@ -41,7 +41,7 @@ if test x$with_[]modname != xno; then
+@@ -45,7 +45,7 @@ if test x$with_[]modname != xno; then
  	  esac ]
  	)
  
@@ -162,7 +163,7 @@ index 4f9a890..e1cf811 100644
  	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
  	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
  		fail="$fail libpq-fe.h"
-@@ -76,7 +76,7 @@ if test x$with_[]modname != xno; then
+@@ -94,7 +94,7 @@ if test x$with_[]modname != xno; then
  		  ])
  	fi
  
@@ -172,10 +173,10 @@ index 4f9a890..e1cf811 100644
  	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
  		fail="$fail libpq"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-index 3545387..c543ed4 100644
+index f10279fe1f..0081a338c8 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -lodbc
@@ -193,5 +194,5 @@ index 3545387..c543ed4 100644
  	if test "x$ac_cv_header_sql_h" != xyes; then
  		fail="$fail sql.h"
 -- 
-1.9.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
index 675940dd6..cb71fb137 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
@@ -1,14 +1,14 @@
-From a0bf65e04d2bbd3271cab94bd5ac93f8e877bfc5 Mon Sep 17 00:00:00 2001
+From e4ff7a2a9834e2589bc7bdda4b74f5bc962b15e6 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 27 Jan 2016 05:07:19 -0500
 Subject: [PATCH] rlm_python: add PY_INC_DIR in search dir
 
-Upstream-Status: Pending
-
 configure option --with-rlm-python-include-dir is used to set
 PY_INC_DIR which is never used and it fails to find Python.h,
 so add it into search dir to fix it.
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
@@ -16,10 +16,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_python/configure.ac b/src/modules/rlm_python/configure.ac
-index 831a33a..c3792d8 100644
+index 08ecb62518..d5c0944ff1 100644
 --- a/src/modules/rlm_python/configure.ac
 +++ b/src/modules/rlm_python/configure.ac
-@@ -93,7 +93,7 @@ if test x$with_[]modname != xno; then
+@@ -98,7 +98,7 @@ if test x$with_[]modname != xno; then
  
  		old_CFLAGS=$CFLAGS
  		CFLAGS="$CFLAGS $PY_CFLAGS"
@@ -29,5 +29,5 @@ index 831a33a..c3792d8 100644
  		CFLAGS=$old_CFLAGS
  
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
similarity index 91%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
index 1954586b2..559b857b6 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
@@ -1,4 +1,4 @@
-From 16bf899447fc1524ffc3c79e1d35380e5285a552 Mon Sep 17 00:00:00 2001
+From d0fa5b259c2dc942d0a43a9cf1bfc32f40c184f9 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 7 Jan 2016 22:37:30 -0800
 Subject: [PATCH] libtool: do not use jlibtool
@@ -7,7 +7,7 @@ jlibtool is hardcoded to be used but we need to use
 our libtool, so fix the makfiles to make it compatible
 with our libtool.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  4 files changed, 27 insertions(+), 15 deletions(-)
 
 diff --git a/Make.inc.in b/Make.inc.in
-index 7a77625..fd8aa3e 100644
+index 05f82776ff..e78f3fe9dc 100644
 --- a/Make.inc.in
 +++ b/Make.inc.in
 @@ -57,7 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
@@ -31,7 +31,7 @@ index 7a77625..fd8aa3e 100644
  ACLOCAL		= @ACLOCAL@
  AUTOCONF	= @AUTOCONF@
  AUTOHEADER	= @AUTOHEADER@
-@@ -163,7 +163,7 @@ ANALYZE.c       := @clang_path@
+@@ -168,7 +168,7 @@ ANALYZE.c       := @clang_path@
  #
  ifeq "$(USE_SHARED_LIBS)" "yes"
  	TESTBINDIR = ./$(BUILD_DIR)/bin/local
@@ -41,10 +41,10 @@ index 7a77625..fd8aa3e 100644
  	TESTBINDIR = ./$(BUILD_DIR)/bin
  	TESTBIN    = ./$(BUILD_DIR)/bin
 diff --git a/scripts/boiler.mk b/scripts/boiler.mk
-index bccec5e..926a13e 100644
+index 2ce0c18f34..567cc0f22f 100644
 --- a/scripts/boiler.mk
 +++ b/scripts/boiler.mk
-@@ -266,6 +266,7 @@ define COMPILE_C_CMDS
+@@ -272,6 +272,7 @@ define COMPILE_C_CMDS
  	$(Q)$(ECHO) CC $<
  	$(Q)$(strip ${COMPILE.c} -o $@ -c -MD ${CPPFLAGS} ${CFLAGS} ${SRC_CFLAGS} ${INCDIRS} \
  	    $(addprefix -I, ${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} $<)
@@ -52,7 +52,7 @@ index bccec5e..926a13e 100644
  endef
  else
  #
-@@ -281,6 +282,7 @@ define COMPILE_C_CMDS
+@@ -287,6 +288,7 @@ define COMPILE_C_CMDS
  	$(Q)cppcheck --enable=style -q ${CHECKFLAGS} $(filter -isystem%,${SRC_CFLAGS}) \
  	     $(filter -I%,${SRC_CFLAGS}) $(filter -D%,${SRC_CFLAGS}) ${INCDIRS} \
  	     $(addprefix -I,${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} --suppress=variableScope --suppress=invalidscanf $<
@@ -61,7 +61,7 @@ index bccec5e..926a13e 100644
  endif
  
 diff --git a/scripts/install.mk b/scripts/install.mk
-index 9164115..e38c1ed 100644
+index 916411563b..e38c1ed697 100644
 --- a/scripts/install.mk
 +++ b/scripts/install.mk
 @@ -46,7 +46,7 @@ define ADD_INSTALL_RULE.exe
@@ -116,10 +116,10 @@ index 9164115..e38c1ed 100644
  
  
 diff --git a/scripts/libtool.mk b/scripts/libtool.mk
-index 57915e1..2cb2f7d 100644
+index 381127ec2d..e83d7e6ad7 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -55,7 +55,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+@@ -60,7 +60,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
      # Tell GNU Make to use this value, rather than anything specified
      # on the command line.
      override LIBTOOL := ${JLIBTOOL}
@@ -130,7 +130,7 @@ index 57915e1..2cb2f7d 100644
  
  # When using libtool, it produces a '.libs' directory.  Ensure that it
  # is removed on "make clean", too.
-@@ -69,11 +71,19 @@ clean: .libs_clean
+@@ -74,11 +76,19 @@ clean: .libs_clean
  # Re-define compilers and linkers
  #
  OBJ_EXT = lo
@@ -156,5 +156,5 @@ index 57915e1..2cb2f7d 100644
  
  # LIBTOOL_ENDINGS - Given a library ending in ".a" or ".so", replace that
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
similarity index 87%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
index b0929c4b0..9386675e4 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
@@ -1,4 +1,7 @@
-Fix quoting for BUILD_WITH
+From 3e701d6274924adaed568e22af2362aa5af1f055 Mon Sep 17 00:00:00 2001
+From: Peter Seebach <peter.seebach@windriver.com>
+Date: Sun, 8 Jan 2023 23:01:28 +0800
+Subject: [PATCH] Fix quoting for BUILD_WITH
 
 The escaped quotes are to make the -D values produce strings which
 can be used to display these values. However, if the values are more
@@ -16,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/main/libfreeradius-server.mk b/src/main/libfreeradius-server.mk
-index 4495f72..07c28f1 100644
+index 4495f72481..07c28f1968 100644
 --- a/src/main/libfreeradius-server.mk
 +++ b/src/main/libfreeradius-server.mk
 @@ -18,5 +18,5 @@ SOURCES	:=	conffile.c \
@@ -27,7 +30,7 @@ index 4495f72..07c28f1 100644
 +SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
  endif
 diff --git a/src/main/unittest.mk b/src/main/unittest.mk
-index 09f3938..ed33952 100644
+index edd4f133a7..b5b44d5e11 100644
 --- a/src/main/unittest.mk
 +++ b/src/main/unittest.mk
 @@ -21,5 +21,5 @@ TGT_PREREQS	+= libfreeradius-eap.a
@@ -38,7 +41,7 @@ index 09f3938..ed33952 100644
 +SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
  endif
 diff --git a/src/modules/rlm_eap/radeapclient.mk b/src/modules/rlm_eap/radeapclient.mk
-index 6068f54..7d3c556 100644
+index 6068f54813..7d3c55625b 100644
 --- a/src/modules/rlm_eap/radeapclient.mk
 +++ b/src/modules/rlm_eap/radeapclient.mk
 @@ -23,7 +23,7 @@ SRC_CFLAGS += -DWITH_EAPCLIENT
@@ -51,5 +54,5 @@ index 6068f54..7d3c556 100644
  
  endif
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
similarity index 95%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
index af1bff051..051b66af8 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
@@ -1,4 +1,4 @@
-From 5b6d8b14f2696fcf1dca119212f9d0a0fa04defd Mon Sep 17 00:00:00 2001
+From 30ce5ccd62446349d432ff65d3fe8d46872423c8 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 18 Jan 2017 14:59:39 +0800
 Subject: [PATCH] fix error for expansion of macro in thread.h
@@ -22,7 +22,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/include/threads.h b/src/include/threads.h
-index e36d81d..2bcb6aa 100644
+index e36d81dac0..2bcb6aadcb 100644
 --- a/src/include/threads.h
 +++ b/src/include/threads.h
 @@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
@@ -57,5 +57,5 @@ index e36d81d..2bcb6aa 100644
  #endif
  #endif
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
similarity index 59%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
index db8caab12..69125eb3c 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
@@ -1,4 +1,4 @@
-From 66e8bcdcca8971b5c43c31755d56d7f675d8b5ff Mon Sep 17 00:00:00 2001
+From f0e764826e3a85488047f7f4e94ebf91460d2c12 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Jun 2017 20:10:49 -0700
 Subject: [PATCH] rlm_mschap: Use includedir instead of hardcoding /usr/include
@@ -13,12 +13,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/modules/rlm_mschap/configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
-===================================================================
---- freeradius-server-3.0.14.orig/src/modules/rlm_mschap/configure.ac
-+++ freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
-@@ -72,7 +72,7 @@ if test x$with_[]modname != xno; then
-         mod_ldflags="-framework DirectoryService"
+diff --git a/src/modules/rlm_mschap/configure.ac b/src/modules/rlm_mschap/configure.ac
+index 0fd105d7e6..6ab15509e5 100644
+--- a/src/modules/rlm_mschap/configure.ac
++++ b/src/modules/rlm_mschap/configure.ac
+@@ -75,7 +75,7 @@ if test x$with_[]modname != xno; then
+         mod_ldflags="-F /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks -framework DirectoryService"
      fi
  
 -    smart_try_dir="$winbind_include_dir /usr/include/samba-4.0"
@@ -26,3 +26,6 @@ Index: freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
      FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
  					#include <stdbool.h>])
      if test "x$ac_cv_header_wbclient_h" != "xyes"; then
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
similarity index 92%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
index 669f363e7..cbac98928 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
@@ -1,4 +1,4 @@
-From 084f5467672f2ae37003b77e8f8706772f3da3ec Mon Sep 17 00:00:00 2001
+From 0f9f18fc330fe88080be13e43f300fbf7ba4a85a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 13 Jul 2020 07:01:45 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the existed certificate error
@@ -29,13 +29,13 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index 5cbfd467ce..77eec9baa1 100644
+index c9fbc9e864..d064fe252d 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -92,7 +92,7 @@ server.csr server.key: server.cnf
  	chmod g+r server.key
  
- server.crt: server.csr ca.key ca.pem
+ server.crt: ca.key ca.pem server.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
 +	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
  
@@ -44,12 +44,12 @@ index 5cbfd467ce..77eec9baa1 100644
 @@ -117,7 +117,7 @@ client.csr client.key: client.cnf
  	chmod g+r client.key
  
- client.crt: client.csr ca.pem ca.key
+ client.crt: ca.key ca.pem client.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
 +	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
  
  client.p12: client.crt
  	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
similarity index 94%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
index dce0427e1..287e47adc 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
@@ -1,4 +1,4 @@
-From 3eda5d35fbaf66ed6bdc86ada4320a0a18681b7e Mon Sep 17 00:00:00 2001
+From bb1cb2ffc7a31c0a2bb2de51ef82d304b0a107c3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 5 Aug 2020 07:23:11 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the occasional verification failure
@@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 15 insertions(+), 15 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index 77eec9baa1..3dcb63fe71 100644
+index d064fe252d..86f4547804 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -59,7 +59,7 @@ passwords.mk: server.cnf ca.cnf client.cnf inner-server.cnf
@@ -71,7 +71,7 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f server.csr ] || $(OPENSSL) req -new  -out server.csr -keyout server.key -config ./server.cnf
  	chmod g+r server.key
  
- server.crt: server.csr ca.key ca.pem
+ server.crt: ca.key ca.pem server.csr
  	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
  
  server.p12: server.crt
@@ -85,7 +85,7 @@ index 77eec9baa1..3dcb63fe71 100644
  	chmod g+r server.pem
  
  .PHONY: server.vrfy
-@@ -113,18 +113,18 @@ server.vrfy: ca.pem
+@@ -113,19 +113,19 @@ server.vrfy: ca.pem
  #
  ######################################################################
  client.csr client.key: client.cnf
@@ -93,13 +93,14 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f client.csr ] || $(OPENSSL) req -new  -out client.csr -keyout client.key -config ./client.cnf
  	chmod g+r client.key
  
- client.crt: client.csr ca.pem ca.key
+ client.crt: ca.key ca.pem client.csr
  	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
  
  client.p12: client.crt
 -	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
 +	@[ -f client.p12 ] || $(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
  	chmod g+r client.p12
+ 	cp client.p12 $(USER_NAME).p12
  
  client.pem: client.p12
 -	$(OPENSSL) pkcs12 -in client.p12 -out client.pem -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
@@ -107,7 +108,7 @@ index 77eec9baa1..3dcb63fe71 100644
  	chmod g+r client.pem
  	cp client.pem $(USER_NAME).pem
  
-@@ -139,18 +139,18 @@ client.vrfy: ca.pem client.pem
+@@ -140,18 +140,18 @@ client.vrfy: ca.pem client.pem
  #
  ######################################################################
  inner-server.csr inner-server.key: inner-server.cnf
@@ -115,7 +116,7 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f inner-server.csr] || $(OPENSSL) req -new  -out inner-server.csr -keyout inner-server.key -config ./inner-server.cnf
  	chmod g+r inner-server.key
  
- inner-server.crt: inner-server.csr ca.key ca.pem
+ inner-server.crt: ca.key ca.pem inner-server.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
 +	@[ -f inner-server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
  
@@ -131,5 +132,5 @@ index 77eec9baa1..3dcb63fe71 100644
  
  .PHONY: inner-server.vrfy
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
similarity index 77%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
index 80c571df9..17eadc7e5 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
@@ -1,7 +1,7 @@
-From 3b4ba29c7c5800df87eecd65214244619e01162b Mon Sep 17 00:00:00 2001
+From c591da4a361496eec93625cf8c4f89bddfedaca7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 7 Feb 2021 16:02:36 +0800
-Subject: [PATCH] workaround error with autoconf 2.7
+Subject: [PATCH] Workaround error with autoconf 2.7
 
 While using autoconf 2.7, the AM_MISSING_PROG caused unexpected error:
 ...
@@ -11,7 +11,7 @@ configure.ac: error: required file 'missing' not found
 Since these tools were explicitly added by autotools bbclass,
 remove the testing to workaround the error with autoconf 2.7
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 609efb104b..2d761cf62c 100644
+index 263098f7fd..fc296832d8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -693,14 +693,6 @@ fi
+@@ -878,14 +878,6 @@ fi
  
  AC_PATH_PROG(RUSERS, rusers, /usr/bin/rusers)
  
@@ -34,9 +34,9 @@ index 609efb104b..2d761cf62c 100644
 -AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
 -AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
 -
- AC_PATH_PROG(LOCATE,locate)
  AC_PATH_PROG(DIRNAME,dirname)
  AC_PATH_PROG(GREP,grep)
+ 
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
index fcadae93a..d1d011160 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
@@ -1,4 +1,7 @@
-bootstrap: check commands of openssl exist
+From 78494ea005bd38324953b05176d6eb2c3f55af2c Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sun, 8 Jan 2023 23:21:24 +0800
+Subject: [PATCH] bootstrap: check commands of openssl exist
 
 It calls openssl commands dhparam and pkcs12 in script bootstrap. These
 commands are configurable based on configure options 'no-dh' and
@@ -18,7 +21,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/raddb/certs/bootstrap b/raddb/certs/bootstrap
-index 0f719aafd4..17feddbeeb 100755
+index 57de8cf0d7..4641c71700 100755
 --- a/raddb/certs/bootstrap
 +++ b/raddb/certs/bootstrap
 @@ -13,6 +13,14 @@
@@ -36,3 +39,6 @@ index 0f719aafd4..17feddbeeb 100755
  make -h > /dev/null 2>&1
  
  #
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
similarity index 86%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
index 697205efe..2d67fdef0 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
@@ -1,11 +1,11 @@
-From cbc64dcf6aa2a1be63f45ea6dd7d2c49b70a0bee Mon Sep 17 00:00:00 2001
+From cbbb62ddda5c189c225f96bf6b599b3b3e8c8252 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 3 Aug 2022 16:44:29 +0800
 Subject: [PATCH] version.c: don't print build flags
 
 Don't print the build flags to avoid collecting the build environment info.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
@@ -13,7 +13,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/src/main/version.c b/src/main/version.c
-index 62972d9f53..cf81de72c9 100644
+index f1f1e87810..3ffcbb25a0 100644
 --- a/src/main/version.c
 +++ b/src/main/version.c
 @@ -589,19 +589,6 @@ void version_print(void)
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch b/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
new file mode 100644
index 000000000..62a4869c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
@@ -0,0 +1,427 @@
+From f1418e1b46cb1cbd130935b76f5c78c577d1ad28 Mon Sep 17 00:00:00 2001
+From: Matthew Newton <matthew-git@newtoncomputing.co.uk>
+Date: Wed, 28 Sep 2022 23:49:32 +0100
+Subject: [PATCH] add python.m4 for detecting python > 3.10
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/86584d2753829756cc73aadce5d48f703af472b1]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_python3/configure.ac |   4 +
+ src/modules/rlm_python3/m4/python.m4 | 363 +++++++++++++++++++++++++++
+ src/modules/rlm_python3/m4/runlog.m4 |  17 ++
+ 3 files changed, 384 insertions(+)
+ create mode 100644 src/modules/rlm_python3/m4/python.m4
+ create mode 100644 src/modules/rlm_python3/m4/runlog.m4
+
+diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
+index bc0e97f9ba..90f2116e73 100644
+--- a/src/modules/rlm_python3/configure.ac
++++ b/src/modules/rlm_python3/configure.ac
+@@ -3,6 +3,10 @@ AC_INIT(rlm_python3.c)
+ AC_REVISION($Revision$)
+ AC_DEFUN(modname,[rlm_python3])
+ 
++m4_include([ax_compare_version.m4])
++m4_include([runlog.m4])
++m4_include([python.m4])
++
+ AC_ARG_WITH([]modname,
+ [  --with-[]modname              build []modname. (default=yes)])
+ 
+diff --git a/src/modules/rlm_python3/m4/python.m4 b/src/modules/rlm_python3/m4/python.m4
+new file mode 100644
+index 0000000000..78ca7635ab
+--- /dev/null
++++ b/src/modules/rlm_python3/m4/python.m4
+@@ -0,0 +1,363 @@
++## ------------------------                                 -*- Autoconf -*-
++## Python file handling
++## From Andrew Dalke
++## Updated by James Henstridge and other contributors.
++## ------------------------
++# Copyright (C) 1999-2021 Free Software Foundation, Inc.
++#
++# This file is free software; the Free Software Foundation
++# gives unlimited permission to copy and/or distribute it,
++# with or without modifications, as long as this notice is preserved.
++
++
++# AM_PATH_PYTHON([MINIMUM-VERSION], [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
++# ---------------------------------------------------------------------------
++# Adds support for distributing Python modules and packages.  To
++# install modules, copy them to $(pythondir), using the python_PYTHON
++# automake variable.  To install a package with the same name as the
++# automake package, install to $(pkgpythondir), or use the
++# pkgpython_PYTHON automake variable.
++#
++# The variables $(pyexecdir) and $(pkgpyexecdir) are provided as
++# locations to install python extension modules (shared libraries).
++# Another macro is required to find the appropriate flags to compile
++# extension modules.
++#
++# If your package is configured with a different prefix to python,
++# users will have to add the install directory to the PYTHONPATH
++# environment variable, or create a .pth file (see the python
++# documentation for details).
++#
++# If the MINIMUM-VERSION argument is passed, AM_PATH_PYTHON will
++# cause an error if the version of python installed on the system
++# doesn't meet the requirement.  MINIMUM-VERSION should consist of
++# numbers and dots only.
++AC_DEFUN([AM_PATH_PYTHON],
++ [
++  dnl Find a Python interpreter.  Python versions prior to 2.0 are not
++  dnl supported. (2.0 was released on October 16, 2000).
++  m4_define_default([_AM_PYTHON_INTERPRETER_LIST],
++[python python2 python3 dnl
++ python3.11 python3.10 dnl
++ python3.9 python3.8 python3.7 python3.6 python3.5 python3.4 python3.3 dnl
++ python3.2 python3.1 python3.0 dnl
++ python2.7 python2.6 python2.5 python2.4 python2.3 python2.2 python2.1 dnl
++ python2.0])
++
++  AC_ARG_VAR([PYTHON], [the Python interpreter])
++
++  m4_if([$1],[],[
++    dnl No version check is needed.
++    # Find any Python interpreter.
++    if test -z "$PYTHON"; then
++      AC_PATH_PROGS([PYTHON], _AM_PYTHON_INTERPRETER_LIST, :)
++    fi
++    am_display_PYTHON=python
++  ], [
++    dnl A version check is needed.
++    if test -n "$PYTHON"; then
++      # If the user set $PYTHON, use it and don't search something else.
++      AC_MSG_CHECKING([whether $PYTHON version is >= $1])
++      AM_PYTHON_CHECK_VERSION([$PYTHON], [$1],
++			      [AC_MSG_RESULT([yes])],
++			      [AC_MSG_RESULT([no])
++			       AC_MSG_ERROR([Python interpreter is too old])])
++      am_display_PYTHON=$PYTHON
++    else
++      # Otherwise, try each interpreter until we find one that satisfies
++      # VERSION.
++      AC_CACHE_CHECK([for a Python interpreter with version >= $1],
++	[am_cv_pathless_PYTHON],[
++	for am_cv_pathless_PYTHON in _AM_PYTHON_INTERPRETER_LIST none; do
++	  test "$am_cv_pathless_PYTHON" = none && break
++	  AM_PYTHON_CHECK_VERSION([$am_cv_pathless_PYTHON], [$1], [break])
++	done])
++      # Set $PYTHON to the absolute path of $am_cv_pathless_PYTHON.
++      if test "$am_cv_pathless_PYTHON" = none; then
++	PYTHON=:
++      else
++        AC_PATH_PROG([PYTHON], [$am_cv_pathless_PYTHON])
++      fi
++      am_display_PYTHON=$am_cv_pathless_PYTHON
++    fi
++  ])
++
++  if test "$PYTHON" = :; then
++    dnl Run any user-specified action, or abort.
++    m4_default([$3], [AC_MSG_ERROR([no suitable Python interpreter found])])
++  else
++
++  dnl Query Python for its version number.  Although site.py simply uses
++  dnl sys.version[:3], printing that failed with Python 3.10, since the
++  dnl trailing zero was eliminated. So now we output just the major
++  dnl and minor version numbers, as numbers. Apparently the tertiary
++  dnl version is not of interest.
++  dnl
++  AC_CACHE_CHECK([for $am_display_PYTHON version], [am_cv_python_version],
++    [am_cv_python_version=`$PYTHON -c "import sys; print ('%u.%u' % sys.version_info[[:2]])"`])
++  AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
++
++  dnl At times, e.g., when building shared libraries, you may want
++  dnl to know which OS platform Python thinks this is.
++  dnl
++  AC_CACHE_CHECK([for $am_display_PYTHON platform], [am_cv_python_platform],
++    [am_cv_python_platform=`$PYTHON -c "import sys; sys.stdout.write(sys.platform)"`])
++  AC_SUBST([PYTHON_PLATFORM], [$am_cv_python_platform])
++
++  dnl emacs-page
++  dnl If --with-python-sys-prefix is given, use the values of sys.prefix
++  dnl and sys.exec_prefix for the corresponding values of PYTHON_PREFIX
++  dnl and PYTHON_EXEC_PREFIX. Otherwise, use the GNU ${prefix} and
++  dnl ${exec_prefix} variables.
++  dnl
++  dnl The two are made distinct variables so they can be overridden if
++  dnl need be, although general consensus is that you shouldn't need
++  dnl this separation.
++  dnl
++  dnl Also allow directly setting the prefixes via configure options,
++  dnl overriding any default.
++  dnl
++  if test "x$prefix" = xNONE; then
++    am__usable_prefix=$ac_default_prefix
++  else
++    am__usable_prefix=$prefix
++  fi
++
++  # Allow user to request using sys.* values from Python,
++  # instead of the GNU $prefix values.
++  AC_ARG_WITH([python-sys-prefix],
++  [AS_HELP_STRING([--with-python-sys-prefix],
++                  [use Python's sys.prefix and sys.exec_prefix values])],
++  [am_use_python_sys=:],
++  [am_use_python_sys=false])
++
++  # Allow user to override whatever the default Python prefix is.
++  AC_ARG_WITH([python_prefix],
++  [AS_HELP_STRING([--with-python_prefix],
++                  [override the default PYTHON_PREFIX])],
++  [am_python_prefix_subst=$withval
++   am_cv_python_prefix=$withval
++   AC_MSG_CHECKING([for explicit $am_display_PYTHON prefix])
++   AC_MSG_RESULT([$am_cv_python_prefix])],
++  [
++   if $am_use_python_sys; then
++     # using python sys.prefix value, not GNU
++     AC_CACHE_CHECK([for python default $am_display_PYTHON prefix],
++     [am_cv_python_prefix],
++     [am_cv_python_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.prefix)"`])
++
++     dnl If sys.prefix is a subdir of $prefix, replace the literal value of
++     dnl $prefix with a variable reference so it can be overridden.
++     case $am_cv_python_prefix in
++     $am__usable_prefix*)
++       am__strip_prefix=`echo "$am__usable_prefix" | sed 's|.|.|g'`
++       am_python_prefix_subst=`echo "$am_cv_python_prefix" | sed "s,^$am__strip_prefix,\\${prefix},"`
++       ;;
++     *)
++       am_python_prefix_subst=$am_cv_python_prefix
++       ;;
++     esac
++   else # using GNU prefix value, not python sys.prefix
++     am_python_prefix_subst='${prefix}'
++     am_python_prefix=$am_python_prefix_subst
++     AC_MSG_CHECKING([for GNU default $am_display_PYTHON prefix])
++     AC_MSG_RESULT([$am_python_prefix])
++   fi])
++  # Substituting python_prefix_subst value.
++  AC_SUBST([PYTHON_PREFIX], [$am_python_prefix_subst])
++
++  # emacs-page Now do it all over again for Python exec_prefix, but with yet
++  # another conditional: fall back to regular prefix if that was specified.
++  AC_ARG_WITH([python_exec_prefix],
++  [AS_HELP_STRING([--with-python_exec_prefix],
++                  [override the default PYTHON_EXEC_PREFIX])],
++  [am_python_exec_prefix_subst=$withval
++   am_cv_python_exec_prefix=$withval
++   AC_MSG_CHECKING([for explicit $am_display_PYTHON exec_prefix])
++   AC_MSG_RESULT([$am_cv_python_exec_prefix])],
++  [
++   # no explicit --with-python_exec_prefix, but if
++   # --with-python_prefix was given, use its value for python_exec_prefix too.
++   AS_IF([test -n "$with_python_prefix"],
++   [am_python_exec_prefix_subst=$with_python_prefix
++    am_cv_python_exec_prefix=$with_python_prefix
++    AC_MSG_CHECKING([for python_prefix-given $am_display_PYTHON exec_prefix])
++    AC_MSG_RESULT([$am_cv_python_exec_prefix])],
++   [
++    # Set am__usable_exec_prefix whether using GNU or Python values,
++    # since we use that variable for pyexecdir.
++    if test "x$exec_prefix" = xNONE; then
++      am__usable_exec_prefix=$am__usable_prefix
++    else
++      am__usable_exec_prefix=$exec_prefix
++    fi
++    #
++    if $am_use_python_sys; then # using python sys.exec_prefix, not GNU
++      AC_CACHE_CHECK([for python default $am_display_PYTHON exec_prefix],
++      [am_cv_python_exec_prefix],
++      [am_cv_python_exec_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.exec_prefix)"`])
++      dnl If sys.exec_prefix is a subdir of $exec_prefix, replace the
++      dnl literal value of $exec_prefix with a variable reference so it can
++      dnl be overridden.
++      case $am_cv_python_exec_prefix in
++      $am__usable_exec_prefix*)
++        am__strip_prefix=`echo "$am__usable_exec_prefix" | sed 's|.|.|g'`
++        am_python_exec_prefix_subst=`echo "$am_cv_python_exec_prefix" | sed "s,^$am__strip_prefix,\\${exec_prefix},"`
++        ;;
++      *)
++        am_python_exec_prefix_subst=$am_cv_python_exec_prefix
++        ;;
++     esac
++   else # using GNU $exec_prefix, not python sys.exec_prefix
++     am_python_exec_prefix_subst='${exec_prefix}'
++     am_python_exec_prefix=$am_python_exec_prefix_subst
++     AC_MSG_CHECKING([for GNU default $am_display_PYTHON exec_prefix])
++     AC_MSG_RESULT([$am_python_exec_prefix])
++   fi])])
++  # Substituting python_exec_prefix_subst.
++  AC_SUBST([PYTHON_EXEC_PREFIX], [$am_python_exec_prefix_subst])
++
++  # Factor out some code duplication into this shell variable.
++  am_python_setup_sysconfig="\
++import sys
++# Prefer sysconfig over distutils.sysconfig, for better compatibility
++# with python 3.x.  See automake bug#10227.
++try:
++    import sysconfig
++except ImportError:
++    can_use_sysconfig = 0
++else:
++    can_use_sysconfig = 1
++# Can't use sysconfig in CPython 2.7, since it's broken in virtualenvs:
++# <https://github.com/pypa/virtualenv/issues/118>
++try:
++    from platform import python_implementation
++    if python_implementation() == 'CPython' and sys.version[[:3]] == '2.7':
++        can_use_sysconfig = 0
++except ImportError:
++    pass"
++
++  dnl emacs-page Set up 4 directories:
++
++  dnl 1. pythondir: where to install python scripts.  This is the
++  dnl    site-packages directory, not the python standard library
++  dnl    directory like in previous automake betas.  This behavior
++  dnl    is more consistent with lispdir.m4 for example.
++  dnl Query distutils for this directory.
++  dnl
++  AC_CACHE_CHECK([for $am_display_PYTHON script directory (pythondir)],
++  [am_cv_python_pythondir],
++  [if test "x$am_cv_python_prefix" = x; then
++     am_py_prefix=$am__usable_prefix
++   else
++     am_py_prefix=$am_cv_python_prefix
++   fi
++   am_cv_python_pythondir=`$PYTHON -c "
++$am_python_setup_sysconfig
++if can_use_sysconfig:
++  if hasattr(sysconfig, 'get_default_scheme'):
++    scheme = sysconfig.get_default_scheme()
++  else:
++    scheme = sysconfig._get_default_scheme()
++  if scheme == 'posix_local':
++    # Debian's default scheme installs to /usr/local/ but we want to find headers in /usr/
++    scheme = 'posix_prefix'
++  sitedir = sysconfig.get_path('purelib', scheme, vars={'base':'$am_py_prefix'})
++else:
++  from distutils import sysconfig
++  sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
++sys.stdout.write(sitedir)"`
++   #
++   case $am_cv_python_pythondir in
++   $am_py_prefix*)
++     am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
++     am_cv_python_pythondir=`echo "$am_cv_python_pythondir" | sed "s,^$am__strip_prefix,\\${PYTHON_PREFIX},"`
++     ;;
++   *)
++     case $am_py_prefix in
++       /usr|/System*) ;;
++       *) am_cv_python_pythondir="\${PYTHON_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
++          ;;
++     esac
++     ;;
++   esac
++  ])
++  AC_SUBST([pythondir], [$am_cv_python_pythondir])
++
++  dnl 2. pkgpythondir: $PACKAGE directory under pythondir.  Was
++  dnl    PYTHON_SITE_PACKAGE in previous betas, but this naming is
++  dnl    more consistent with the rest of automake.
++  dnl
++  AC_SUBST([pkgpythondir], [\${pythondir}/$PACKAGE])
++
++  dnl 3. pyexecdir: directory for installing python extension modules
++  dnl    (shared libraries).
++  dnl Query distutils for this directory.
++  dnl
++  AC_CACHE_CHECK([for $am_display_PYTHON extension module directory (pyexecdir)],
++  [am_cv_python_pyexecdir],
++  [if test "x$am_cv_python_exec_prefix" = x; then
++     am_py_exec_prefix=$am__usable_exec_prefix
++   else
++     am_py_exec_prefix=$am_cv_python_exec_prefix
++   fi
++   am_cv_python_pyexecdir=`$PYTHON -c "
++$am_python_setup_sysconfig
++if can_use_sysconfig:
++  if hasattr(sysconfig, 'get_default_scheme'):
++    scheme = sysconfig.get_default_scheme()
++  else:
++    scheme = sysconfig._get_default_scheme()
++  if scheme == 'posix_local':
++    # Debian's default scheme installs to /usr/local/ but we want to find headers in /usr/
++    scheme = 'posix_prefix'
++  sitedir = sysconfig.get_path('platlib', scheme, vars={'platbase':'$am_py_exec_prefix'})
++else:
++  from distutils import sysconfig
++  sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_exec_prefix')
++sys.stdout.write(sitedir)"`
++   #
++   case $am_cv_python_pyexecdir in
++   $am_py_exec_prefix*)
++     am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
++     am_cv_python_pyexecdir=`echo "$am_cv_python_pyexecdir" | sed "s,^$am__strip_prefix,\\${PYTHON_EXEC_PREFIX},"`
++     ;;
++   *)
++     case $am_py_exec_prefix in
++       /usr|/System*) ;;
++       *) am_cv_python_pyexecdir="\${PYTHON_EXEC_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
++          ;;
++     esac
++     ;;
++   esac
++  ])
++  AC_SUBST([pyexecdir], [$am_cv_python_pyexecdir])
++
++  dnl 4. pkgpyexecdir: $(pyexecdir)/$(PACKAGE)
++  dnl
++  AC_SUBST([pkgpyexecdir], [\${pyexecdir}/$PACKAGE])
++
++  dnl Run any user-specified action.
++  $2
++  fi
++])
++
++
++# AM_PYTHON_CHECK_VERSION(PROG, VERSION, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
++# ---------------------------------------------------------------------------
++# Run ACTION-IF-TRUE if the Python interpreter PROG has version >= VERSION.
++# Run ACTION-IF-FALSE otherwise.
++# This test uses sys.hexversion instead of the string equivalent (first
++# word of sys.version), in order to cope with versions such as 2.2c1.
++# This supports Python 2.0 or higher. (2.0 was released on October 16, 2000).
++AC_DEFUN([AM_PYTHON_CHECK_VERSION],
++ [prog="import sys
++# split strings by '.' and convert to numeric.  Append some zeros
++# because we need at least 4 digits for the hex conversion.
++# map returns an iterator in Python 3.0 and a list in 2.x
++minver = list(map(int, '$2'.split('.'))) + [[0, 0, 0]]
++minverhex = 0
++# xrange is not present in Python 3.0 and range returns an iterator
++for i in list(range(0, 4)): minverhex = (minverhex << 8) + minver[[i]]
++sys.exit(sys.hexversion < minverhex)"
++  AS_IF([AM_RUN_LOG([$1 -c "$prog"])], [$3], [$4])])
+diff --git a/src/modules/rlm_python3/m4/runlog.m4 b/src/modules/rlm_python3/m4/runlog.m4
+new file mode 100644
+index 0000000000..690efc3258
+--- /dev/null
++++ b/src/modules/rlm_python3/m4/runlog.m4
+@@ -0,0 +1,17 @@
++##                                                          -*- Autoconf -*-
++# Copyright (C) 2001-2018 Free Software Foundation, Inc.
++#
++# This file is free software; the Free Software Foundation
++# gives unlimited permission to copy and/or distribute it,
++# with or without modifications, as long as this notice is preserved.
++
++# AM_RUN_LOG(COMMAND)
++# -------------------
++# Run COMMAND, save the exit status in ac_status, and log it.
++# (This has been adapted from Autoconf's _AC_RUN_LOG macro.)
++AC_DEFUN([AM_RUN_LOG],
++[{ echo "$as_me:$LINENO: $1" >&AS_MESSAGE_LOG_FD
++   ($1) >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD
++   ac_status=$?
++   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
++   (exit $ac_status); }])
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
index b459412e0..4a23c9d90 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -16,28 +16,30 @@ DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0;;protocol=https \
     file://freeradius \
     file://volatiles.58_radiusd \
-    file://freeradius-enble-user-in-conf.patch \
-    file://freeradius-configure.ac-allow-cross-compilation.patch \
-    file://freeradius-libtool-detection.patch \
-    file://freeradius-configure.ac-add-option-for-libcap.patch \
-    file://freeradius-avoid-searching-host-dirs.patch \
-    file://freeradius-rlm_python-add-PY_INC_DIR.patch \
-    file://freeradius-libtool-do-not-use-jlibtool.patch \
-    file://freeradius-fix-quoting-for-BUILT_WITH.patch \
-    file://freeradius-fix-error-for-expansion-of-macro.patch \
-    file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
-    file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
-    file://0001-raddb-certs-Makefile-fix-the-occasional-verification.patch \
-    file://0001-workaround-error-with-autoconf-2.7.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
-    file://check-openssl-cmds-in-script-bootstrap.patch \
-    file://0001-version.c-don-t-print-build-flags.patch \
+    file://0001-Add-autogen.sh.patch \
+    file://0002-Enable-and-change-user-and-group-of-freeradius-serve.patch \
+    file://0003-configure.ac-allow-cross-compilation.patch \
+    file://0004-Fix-libtool-detection.patch \
+    file://0005-configure.ac-add-option-for-libcap.patch \
+    file://0006-Avoid-searching-host-dirs.patch \
+    file://0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch \
+    file://0008-libtool-do-not-use-jlibtool.patch \
+    file://0009-Fix-quoting-for-BUILD_WITH.patch \
+    file://0010-fix-error-for-expansion-of-macro-in-thread.h.patch \
+    file://0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
+    file://0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
+    file://0013-raddb-certs-Makefile-fix-the-occasional-verification.patch \
+    file://0014-Workaround-error-with-autoconf-2.7.patch \
+    file://0015-bootstrap-check-commands-of-openssl-exist.patch \
+    file://0016-version.c-don-t-print-build-flags.patch \
+    file://0017-add-python.m4-for-detecting-python-3.10.patch \
 "
 
-raddbdir="${sysconfdir}/${MLPREFIX}raddb"
+raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
+SRCREV = "d956f683d37ea40e7977cc5907361f3e6988a439"
 
 CVE_CHECK_IGNORE = "\
     CVE-2002-0318 \
@@ -118,7 +120,7 @@ inherit cpan-base python3-dir
 
 # The modules subdirs also need to be processed by autoreconf. Use autogen.sh
 # in order to handle the subdirs correctly.
-do_configure () {
+do_configure() {
     ./autogen.sh
 
     # the configure of rlm_perl needs this to get correct
@@ -142,11 +144,9 @@ USERADD_PARAM:${PN} = "--system --no-create-home --shell /bin/false --user-group
 
 do_install() {
     rm -rf ${D}
-    mkdir -p ${D}/${sysconfdir}/logrotate.d
-    mkdir -p ${D}/${sysconfdir}/pam.d
-    mkdir -p ${D}/${sysconfdir}/init.d
-    mkdir -p ${D}/${localstatedir}/lib/radiusd
-    mkdir -p ${D}${sysconfdir}/default/volatiles
+    install -d ${D}/${sysconfdir}/logrotate.d
+    install -d ${D}/${sysconfdir}/pam.d
+    install -d ${D}/${localstatedir}/lib/radiusd
 
     export LD_LIBRARY_PATH=${D}/${libdir}
     oe_runmake install R=${D} INSTALLSTRIP=""
@@ -157,16 +157,21 @@ do_install() {
     # remove scripts that required Perl(DBI)
     rm -rf ${D}/${bindir}/radsqlrelay
 
-    cp -f ${WORKDIR}/freeradius ${D}/etc/init.d/radiusd
     rm -f ${D}/${sbindir}/rc.radiusd
-    chmod +x ${D}/${sysconfdir}/init.d/radiusd
     rm -rf ${D}/${localstatedir}/run/
     rm -rf ${D}/${localstatedir}/log/
-    install -m 0644 ${WORKDIR}/volatiles.58_radiusd  ${D}${sysconfdir}/default/volatiles/58_radiusd
 
     chown -R radiusd:radiusd ${D}/${raddbdir}
     chown -R radiusd:radiusd ${D}/${localstatedir}/lib/radiusd
 
+    # For sysvinit
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0755 ${WORKDIR}/freeradius ${D}/etc/init.d/radiusd
+        install -m 0644 ${WORKDIR}/volatiles.58_radiusd ${D}${sysconfdir}/default/volatiles/58_radiusd
+    fi
+
     # For systemd
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
@@ -180,7 +185,8 @@ do_install() {
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/radiusd.conf
     fi
-    oe_multilib_header freeradius/autoconf.h 
+
+    oe_multilib_header freeradius/autoconf.h
     oe_multilib_header freeradius/missing.h
     oe_multilib_header freeradius/radpaths.h
 }
-- 
2.25.1


