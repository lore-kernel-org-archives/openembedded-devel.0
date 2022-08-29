Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5C5ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71586.1661786671904250248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iiyPlD5o;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TEgZjh031219
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mOtG5oztpG3lPceHAKiFPnbFzuVGn27KNU3liN76uPQ=;
 b=iiyPlD5oUbYAA79pLMibVY1S5MMe0kvDj8bqCQPKsHma/P3vHlPY/2EI1HaNCMex89sg
 Clp+rbD7mS/KTCdvtImAYZ7s/ygRcbIIjxCww1xDOqxXV5EP4eqkF63rCUGP4cymZ7CV
 xle5TeHnnZzPIc57tlEpZvHdIN6fCvF3jCYbqSNJWHSTbo9fqWmjyNx6aUm1fJcbmz43
 Dp80WchMDSCIrFlxo6t3Z2C1qwt1x21oN0OjAPS3Ol7Z53ed/vCRCYMdDlu9IX/LzotQ
 nKnHeZ52u3+Rd06NZKysU872nGp+500OsC80jEddeLEcFNEBj4Cu8dvls3BKZQfv9dPN /g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFOU6M032698
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsvx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsJqETiVcVrgguIWY66JQjRPPdCbuFKPO+1PYDD5wbHakDBncZ7Cs67tMw+nH/XYSxHxmcBtyUlIIG2Q1LjpHzDSUmnJR+obP0RYZkERO7e/wlhhWqgH9Fjjk1gAenxHOuX9NWsw/KSrGpeykebw9C0V9B0TrxCnKnQ+xyMeRTGLxzFRsta3KSxVH1ImVjBTkiwCcWyjguSKyAVX3hdl6wrgnSmuxOSQ3bK5JDtp4MZiaVY61Bk5aBgMj5uO7zi8L2ughex/ms4hiVgBLJk1e2+M9+Cp73BhzZCaRAuQ4iCMjSyHSwypTxi7H01ZE3nK5YCiaoU9RL0vgvtyEM3ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOtG5oztpG3lPceHAKiFPnbFzuVGn27KNU3liN76uPQ=;
 b=ceDoLXkQEPpDIiEb8GmXz5zefFlfZblfO/fkPF8xNUosFrFhzqEKs5+5woiWg1DtvPBEosHOIQEapKzM21uG4NH6SdbEZhSdG+gcL6sGAq/aWhcxwfp+hDQwgZ8ctY7q4iBQ2BDS3STqCX8hhe+ybJDzEgjmvwl5blPCdmUnPtQF3LQFtOosmhBkOmPKXcDWo4z8o8lsrlMqc4WgEYK0TnG2lSK3V8rc0wt//vwzjN+7E2SgBlGiLk0mAVz3NzNYhsmzpcZWEhVSxCoxMRH+RgkA8Gvr7BmwoW3Fl0ZTlqrA0+Ow+fGddaasibEKAIvc4Vt7MI+c6gYDjxC3tGwxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:28 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:28 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 01/10] libipc-signal-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:05 -0700
Message-Id: <20220829152414.1757540-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928a72d7-88de-4be4-dac4-08da89d2906c
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LxHTt49VXdRNQnM+fpFThIvJs1Ig1ilhCrmu0mNzvrIz5wi4CqI43uo6E3Iv9zHtNQlUr70FlBpanCa4nOtLK3xAq5iySIJgdbHbnQQIKtn8WXAGA4Kn6G+No+0zpQiGz/Jjhn3D/Qk1EdXRv9Ov0tayheeXNIUgQebwedFF3muiOo+FAUkkISW4LP9PbRHLCx/Ymy0RyvxI54z9QebvZiQAXMcinoR+lN4MPf5io4F3AkThjEGNWVGpvDbQCxzg+8hlaQjOwxDJOthvy6LjoBracfbAbVP5X52z068AZ7A6292vPzk86q1/rh+bfII/UWDzcQt+higo2O38dp1Yoc+cPHCZJvCygJunvo+ExfjniFbfwL9t4au07OWg7zdXBtMzNcvp7eTIvChiB6m0B5Aun5M4/LL7G3VCIlzWIQKIcSQtE6PaHxTLQ87r1GNfUnRYeOf7fgYhuFpHnonLL8CAuQUEo+uDsQoUx/KEfqOH5KBcn3bgAQ/jiM3eNDEARG8PvTs2hEGe3tdKX5NDskpoI/yj2+WRU5kE97btmyyqZdnllnMIW0Olw3vLHbocB/e1eJ1Xjqn8+7K0rEeUhoTzPA/Y0vWek5xYHQfPs/BuZHrJ2M31AU8iylHkpWA6oDl+H9WQ4gTlMtSxf9FxdevgIoiuRQZOYSqQCujuqPZKN1J7xNN9TETdL+GjGBgKfl5wqHwUYZTX3XOCyLKZ3MfjmzSVlBrCCjM/50i0JJ9QJYcb4K8hjs5n2uhmcU3P8ECWUzikpDXWdD+uK1fUrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(4744005)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?82ZD0K1D3EiKKgIyrMigT9vKwNrto0dtA4BhH5NiFloKX8vX6wOQAfwXAT4s?=
 =?us-ascii?Q?bEc7+plw684UPmbE1levJtyGI1zSxVK5eqehJ7IEdffL6iqK2YyMTRvfa3on?=
 =?us-ascii?Q?vqtpJ1B7BQtx4UF9HC9fZalzKfn8QTlyu/ZejPDZmqLyhzv1XpX0C58zzX/d?=
 =?us-ascii?Q?HtgZbgnhR99sCKjHESxi5KW/cIrTSWIAlH8xWHJOEAjlBqnZh2XWpplZWle9?=
 =?us-ascii?Q?rGRZc2TDrBLn+UcjyE1s2/7/jImIwVS9Kr62LnNE61LwLTKoQUn+1Tz5B/Uj?=
 =?us-ascii?Q?UJ7/6GQPqMturRmbNL3KHA6V1oWjFhaBel/pQCanCILoMQb/z10TVZp7aLxs?=
 =?us-ascii?Q?ImC0ea9/cGS74pL49jnKoXgmXb+P4fZkqAsyj7SWaxItMCCqfORBPFSHjtId?=
 =?us-ascii?Q?co7ZGv+w0JLafKkWfwV147oMvSHRPaUFx0Zl+ljW0kiOPi2KDef8p3/Yfcjs?=
 =?us-ascii?Q?9MhB6WQ3QOPLSTwYnRd/QJNqiIpGAy0GJfGuZNWrDUYKaQWn9OUT5STfkngn?=
 =?us-ascii?Q?85Ck6VL+rcb2WBOa+Eh+yvspAJ11hfVSkv+D++5jiI3KdTg5i5qOlPepu23g?=
 =?us-ascii?Q?jIbXTLFIJmwJtWCHUC6/HsDwvDlPpsvBCoef9xuUFwRlhC79fhrwStVW6L5S?=
 =?us-ascii?Q?qVO9uAkEvHkF3GmImW5P3bYd/iiQWhN0nU9w25SF2WHNl0eunta3oom6G6WZ?=
 =?us-ascii?Q?F+DbGVkdkdlRKSOYSJJEfalLwvYUjSp1vYByGUBOg0/T3xPLHtwLvnK5dZUU?=
 =?us-ascii?Q?H8bjil+1+VNrXRUUq5c6QGHeogZMcKjTmfuF8rPL3S/1rM1FfwkAv+6qKtJ6?=
 =?us-ascii?Q?qp3LsQ4USOHPkV1IcCRgEoc/swxRYgy5XAFhwhkG+5hTYXDOUQQdoEPe205Z?=
 =?us-ascii?Q?7JmS1ecBP1Go0NyZcci5gVPs4rsnho7Qteo6782xoradRXZRT6moY6uplfAF?=
 =?us-ascii?Q?f4U1h7FH5YRq0OzFR5F/fSfCXQn5HpJ+XwjD7F6mN6c2WvEKjuuSj+eTJhmr?=
 =?us-ascii?Q?LGV+ZJHNtXIpkRJNNJ7YNpooVUOe5NzTesimTFK+7f7OysvvVoS/F2URFhxg?=
 =?us-ascii?Q?l37Gr0ZR8iURHvesK/bAlqHdG0p+d4wheSoPJg5O8M2CtqmQveXaIQY24xSe?=
 =?us-ascii?Q?xPLiFQkY3UCc1Dhnbgd6vZQEfILyDnA5+mJsZEW8my+RjV0aBj6DAG0FKX3+?=
 =?us-ascii?Q?xqy42NUORuWVfsVbQWMrfnG3g18HDdT3KJQD8MWPBNNWaARfWrbqeOMixSzJ?=
 =?us-ascii?Q?qoylQK4LSXsWQfaAjk/KePA3PdgXY6aSGfFtYCQvAgXevebyvh0ONoOt9GhX?=
 =?us-ascii?Q?ovdh5Nqz5ErHZWdngWFXSGo9OTUfsBmv3j5J57UOEsoqTbcOld2/kv49DjoY?=
 =?us-ascii?Q?tqIJR2nTBh5W1geznaiD8A8YsEzQckpbalM03OFp1Wdp6zfN9Vr/moyCT/LW?=
 =?us-ascii?Q?eCYI8PrgwD3jHHVPs8KdpuZPQ3RSR4Exxf0oMB4u4LpTA/umGUgWEv027U/O?=
 =?us-ascii?Q?RDUZdE1U2S5z2JfqmzSsWPpfnNN3k1fQ9jH+qcmHB1X+wyE8pAYZvC1W6a2p?=
 =?us-ascii?Q?a+ybt6R91EtAwN47ossE9qL/t2Ct7GO0ARe7hAxbz7Ve4vHX2mF34+sfKuiF?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 928a72d7-88de-4be4-dac4-08da89d2906c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:28.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m1iTPV2GAiQzFwaD2VMQvwcbx1DkMiN4taBVTljr+i+10m3B0wLaAcrOtA5NJ2DR2ursxRbqKpzzEAFiZx4Lhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-ORIG-GUID: uugxbpC8Aa6nO-49WZcIBMNjY_9IfuLJ
X-Proofpoint-GUID: LLo27guwVyTSqpXhNHChPv6q-8eRlJGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98524

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 389be2c16..203db7b10 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -5,7 +5,7 @@ dealing with signals."
 HOMEPAGE = "http://search.cpan.org/~rosch/IPC-Signal-1.00/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
 
 S = "${WORKDIR}/IPC-Signal-${PV}"
-- 
2.32.0


