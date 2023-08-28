Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A58C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 07:05:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8347.1693206320542605207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 00:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TJGhm3d3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760420b433=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S6A9XV022224
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 07:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nNWCVI2fuQtMZafmtL
	slBHkiLaeudmCm/h9uynGdrc0=; b=TJGhm3d3QwIbgellyJuICmbzQ/p0QHfO0K
	a2a+iWH2U5T3gnHvbCPxvM0jVqx83jPYos2FMJgJs0EPobQyZ+RXRBiFiTBJ2/Sk
	Tr6h/Qw4Mdw/e5iDM6KSOwpjtKda4IwWGvxYRmq5AELshGucMvAU5RkEBNQtyJBR
	DV/2In9TdQI1GhUlSRSdBKP9G3W70OwJzBQcYKenjFOZStpHuHpRkTLjtD8Xknlm
	VFLtFrnpUyDlsW1tOH9bSVQmmVMq556K4/qeXwBG+1cvra8x8OPcNLByClbia55D
	dYPDZ+2ZXvFLH7gMVS4EGoPMFHT3Rqg6nI1dpolsWYbQZplSm+Ng==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c61dgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 07:05:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wajmh4sVdG/zTwXHhkxDYhJg0t4ak3bFIssdYCpttet+abWT9lzMLDGtNK20CuQadDouueay9ZLudbOtxNI5tYnx29Y93D6YEPwph1UcV/It1oxPAr677NmXS73RK48ii9s4Np9Uzbiq4WzUDxu9aUqaw63ZQWcdkA1T75cbwhPqCV7y5BNjEBbblhp7LS+88kNgVjelKuVTmGXtQtzkllCxZmgvbDwafzEQKk/HFdrs2dYI3GzKRurH/1aq836DRVHgmhNwo2omp0AR9Eprlk6ytEW6a6/2VCa+kdsJ5PIHO7guC3sL84xMSZJ/IfaoS1miK4wW5b4qmeThYvyj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNWCVI2fuQtMZafmtLslBHkiLaeudmCm/h9uynGdrc0=;
 b=X7aNWTXCkkFEn/vhefCbPLAgwuUOwnROHGrwAqKZur2JLnsceT1qDcgIbjy5uk12cfqvYaHmYvCiy1QxWeSPUStclEP4uQZ/WFrNhKCFs6812mW7j7CeP6TP+eWXS91vdApIprRQfbFsblH/IPdDA/ZRCy93cHCWAnT//ydQVE2KA1vNc37WckRz8jL4Qd1B1WP2fS+pVFF/JFEZrGErE9kMA6PlgP2nf+ANJX5FWxv/Qg5xHSer5CVoiuguc07RIovG7yOGrrXXFjPaiy+PVp80PIRVqBqOIKtuAOZKVwlHXREN/Zd0Z7xEqQr2sHQgAOYH4ZBE589voJNVJcsoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 07:05:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 07:05:15 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][kirkstone][PATCH] spice-protocol: fix populate_sdk error when spice is installed
Date: Mon, 28 Aug 2023 00:05:02 -0700
Message-Id: <20230828070502.2522488-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:510:5::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e355be-fd31-4bd7-269d-08dba795210f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fxjAHC37qV6UmWHyJy2jVAMMZ3G8qjZ10LfStOpR5XAVVm8KS8g1KGKKhuhWevuT9azvTA7GB/Av4DtmOKAJZqA7qHxJg1iA+92WUm1PagKjSrVI0DepQ5h6gnMvIFYhlO9nfS2il/b3HJ+//+YaFFHGYsmt19NpjSxYUiy8TySOOTZOu+UvtzWZ8B/bLU+LwK71Jx9qfKBm3OOf4mXg4KU8Bt2BEz/77XKXEt/SjDT8DWZ6Gf8cOjKqtdeFeiKE0tREIQlLvCIx3qHh5CZZwf0jqY7MAGHqEYDOGTSPftU36+Eu6Pllo1P6GTG2+lor9Ms60kChb8wMqj12+qM4xQ9OuRrYKW02ufxTd8YD6IhEOTAqaUzWizmx2G3Tr+c1HxZ6QujXIRRniSbfSBOTp6wvpTaP6WYTdJCH1ffpOXOlHyfDW7HCXSl5VQVfBPwfsLXMLXgcrBkW77ZZmeYgb9XVfkvHYPxU6wtUbbcUUtOUB01paFkLXf7YLujK75wY/q6fmWcKJDs2uRemNYOB64Cibs1DWiAZJO4OFnbj3o9flpL1B6DCX1HeepgEaULqoySBsdFaqrTyQEHSKvOhamQNde2U0OV6YiO8MA+ftWaWJDah4p+fZgjLN55l5TA0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(396003)(376002)(186009)(1800799009)(451199024)(6666004)(52116002)(6506007)(6486002)(2616005)(1076003)(9686003)(6512007)(38100700002)(86362001)(5660300002)(2906002)(6916009)(8936002)(8676002)(38350700002)(66476007)(66556008)(36756003)(41300700001)(66946007)(316002)(478600001)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cBf/tnHendjHGlP9V5cJsGCiaI2kFSR0/w2iRXKjZKdKeYoxZS5LUaL1fhD6?=
 =?us-ascii?Q?R8yCA6ioEfazWijk8GW9gZIG6/YNhu7MzJalj/IY9nLv1wI2xew2ORSlkTRM?=
 =?us-ascii?Q?mZ8aQMZs9zwUwOuVeiZWtZU4e2YhqsvjwAknn+ha4C7rdfWry/+W8XCutQgj?=
 =?us-ascii?Q?Oc5wESQRqdu0fXA+cGqHf7eRIOdKOKxwWG/q48gqJP+QqrnzTFT3+usxdgXL?=
 =?us-ascii?Q?WssIgs6RmMseAxc70gQ873YKKgyT06Fb4G5mfO1v7/3d1Z5FTAs/BvIRFzBV?=
 =?us-ascii?Q?tLX9/2K/E3+ZG/itB1rKqrUh3U/IuOrRuIm2SxM6dV8hxla/ilD0eLgT0DRA?=
 =?us-ascii?Q?TtNN0AQXmh90tR0Nv+g/0kXUu4e+tviolKkr2FCk5/cMU0wncW7hE610aEXH?=
 =?us-ascii?Q?wYG/Stlk1wCCgLGvybDo62Jj8oJ1+v4G/pJKO/tCpQT7MidTDqomT4aw+oSk?=
 =?us-ascii?Q?GEJY0qKdzL3OCpGV8npLnSPoVWbAxouBMRf6wXwQZE0cERst/Do3z7zHIre8?=
 =?us-ascii?Q?kHBsGsdOaD0VTyQ74FiYdizHKs0bApPSXOwpNFEie3w5QbM+bZY6vFRD9TAi?=
 =?us-ascii?Q?QQlz4ZXvv4OT8R5RkSE2LAHz+kBdzpij0bv9itioxrVYeL/wqYdBMQZ3oHt6?=
 =?us-ascii?Q?HlmcZz3VDdExETVB6ggos0L9aqXK7EKlgNu7gvzr3Fr5nyAV5gzq9q/ZuK1r?=
 =?us-ascii?Q?spkrJUHTCiv6kbGt6h8novBJZKUxEQvLEgSbqK/ZRNhFe6glf50bBXbV/Fu3?=
 =?us-ascii?Q?AtDTyYN6Qvq4c2Ocov9zBrKk9VLC8HMnuDieOZbmZ7QOXMwjT6lyqs/2JOLj?=
 =?us-ascii?Q?uxumc4mCeW+2mWRzwY7KmmlL2kApFzj0gHh5c40D83fPGrbjp+0C6W7A7Wvv?=
 =?us-ascii?Q?JsMRGiZuDTIJ+itOZ6iNapjRU4ivRbwW/vvz7xFIDpdeyFI3poMCPxjqYEvC?=
 =?us-ascii?Q?C1qZ3N9Wb+fzK1dx216fUd0CadyKG2rGlEA/w021/E5rSFqKmnQxCgA6IK3y?=
 =?us-ascii?Q?0OoA0oZDG37TGMrZHHNYTFqGkEe+KFh4N9aaDbKD4NYWOuJxSSbai/Bj8+eF?=
 =?us-ascii?Q?BCEVaIFSyIAhXIlZIEL/2d2Ol0Zl8iYVnyQIC2AEY/w0/CxeN/qxG5eSjM9u?=
 =?us-ascii?Q?wFXO5MuY3BHzMZpUSCTyIW/7HvKPXMs/w8vSNpQ7WLlJMIJ7HJP8ml+R3Us+?=
 =?us-ascii?Q?ahoAG+/POPi9IKSYhDpkPJd2aqTfHnAiWSLs45nnWnpzMDvdMXz3FPDVup0R?=
 =?us-ascii?Q?qg5jtxES0lVXvKMoQVQm50uexPxgiGq8E5SftnYIxbSQpOqoHKBEiGFZbYF2?=
 =?us-ascii?Q?K3hCQPj+AbsZfj6qs+z1NtEeLOFFNzs/XCrXCs6hWou5hv6IWQBJtHFV+tAR?=
 =?us-ascii?Q?LqlNj9t9r6xgLzRVJRcyNyPBiu3EvQx83g4oKXAixzuktfihT9pJ6Q8yg3PV?=
 =?us-ascii?Q?jD+ruPyS93xlqHoMse6nlIRQ77mzC4awsFTm8CzyG9PfcJT+OmWGno5Q2slq?=
 =?us-ascii?Q?icIdmWgPKngbXMyjqipkO0FZ5zc0OOXlyjG4NRgcLR3Hb8eVvOfQFo6S+er1?=
 =?us-ascii?Q?/XCt66NneVPEIUUFFA0+SDcMz0VCJa4qbqwRR7mr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e355be-fd31-4bd7-269d-08dba795210f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 07:05:15.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwSA+opPy11+B7922efZb3RcGqMAImv1x9fi49Zb4uvAWBv32D8NlOyODEPfva7mPNFP7ml2TXyaf7scrberBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Proofpoint-ORIG-GUID: C5Da2R_U8CROnFlVH88fJwAIDpyUix7a
X-Proofpoint-GUID: C5Da2R_U8CROnFlVH88fJwAIDpyUix7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_04,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=618 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308280063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 07:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104631

From: Chen Qi <Qi.Chen@windriver.com>

spice depends on spice-protocol, when IMAGE_INSTALL contains spice,
do_populate_sdk fails with the following error:

  Error:
  Problem: package libspice-server-dev-0.14.2+git0+7cbd70b931_4fc4c2db36-r0.core2_64 requires spice-protocol-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides spice-protocol = 0.14.4-r0 needed by spice-protocol-dev-0.14.4-r0.core2_64
  (try to add '--skip-broken' to skip uninstallable packages)

For spice-protocol, it's a development package and all things are in
the dev package, so set ALLOW_EMPTY to fix the above error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
index 9ce019ed86..3c8458baac 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
@@ -16,4 +16,6 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
+ALLOW_EMPTY:${PN} = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


