Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167E9C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:30:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.67255.1679560255016089071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cfct6MXb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=244644f2e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N7T9r0029435
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=gqAJCRnec8DdC+mZk5Upw+WTEF5sPkpPAOCoTBFdeDk=;
 b=cfct6MXb9z8vqi5ZTv8n4Sl/S0Xc8r/Y7GrjrRm95WFkrEMFKYy5QPkwKs2g27qeHwyl
 t8mwHgjOMYmLEiMOow2G4MyhnkoDBTnnEH0C/YUppg/VgWBFOzSn8+Zm5PUj7zQ4SR5w
 LKS8aff0LCf4OaHKOKFNFnjoDf3d4Cd1f/hZvINFOiHaLPuGgpEoZCXNDM6hPiyT5iQU
 idoBk+miC98wTmJqu7oFTwdCVaW7xuNfSDQiFDQI1ubZss3y5ZQVS9lB+r8MxVHmYiQ5
 sAGpCDkSraIw5K0RyN4EhtwP7KCMXUl7y2O9fCmvhVa0B1Cmbuo0hgxNbCDoVDryHoFL Rg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsmsgr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 08:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSPsgjpNRQz3VnztBHX43mgnHsrE9kEDlkPhZsyv+pB/RGQ5Rb0/kbtDcI8O3QYPsXQ8/+sD0F+qofvqGudf2HlJfn9naGyiUQw/EepyzawKw1wsFSPuzDMB07xZrT7IspzEVkqrjeZcAKfG9y3QUyHRXMlPkOFWs8fU4c9Is90VcXQMsSpVca5T24EmpcDbVxDjCxvmQnmxADw608fYVeVPcnNsIhBakD7/Noa7QTuOTZWLjJsHdZ4ncvZwKOM2/uXjNq/F7UpNu9KKMzfhVxoEIi41Az/PMUCjS9P8Ll1cLaTiwPxn6QvUnC/ILrZ0epP5lKi/7+x/j83GD8+4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqAJCRnec8DdC+mZk5Upw+WTEF5sPkpPAOCoTBFdeDk=;
 b=l/rks2Yy/yUQHLO/PDRxaXPDM8SkuYTimgP17HkD34z4iSvHQQfdDYCC7cJMr4UqZ73VnZk6eDEISVEs9PW/ouFDte3bUMByIIJh49HnUlmUoASEEkz2l4mPYecFYQ7K76tkkDBae1vDQgIbBcdlTauZdMvL0rSvuOyeQGPXLX7iEW7tNHf2/AhYtOdh9MRXTLV6j/XjY2x10cqlDRuqAm21FiltzTneNX0uWaQ8L5aDTCwe9fFgK/yXXvlGktFmbvB1uYGYuYoeU8NviMCXRUsIr7Ptwf0mb/fRIGZI6WjyPDObwcOk79RIhiUI4ClrlHaMTIcOImGPtF7AelSBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 08:30:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 08:30:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpreplay: 4.4.2 -> 4.4.3
Date: Thu, 23 Mar 2023 16:30:38 +0800
Message-Id: <20230323083038.1152008-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0167.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 793b71e1-fe19-4f9a-31c5-08db2b78e981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ifPnqSmmrRuu05WRoBj5WsE/sqyKIDLrDKG0FMP4twVoya9kBbj6hVmNvacAOjLext1oGi43QqPOo7508loGJZAWgNgtRS7jTx1CO57Oeuuq87aLskEhJ/cdjrWnF89oS/tprT+LqmSepnrMXR1iN2VXDEJz2MrnPD35lduAoZSV1N5esR4jxjzH2Z11qnI9S0JdzPYN3+vi32xfEFeQyw7c3QCOFJgGG2vMLMlWhzfanrnn/9Eh5RyLEzjL57Bkd4mf3i5UGupewz1RicYvXITQl+fZhd/FNZH/R1X0F1A2OctfzptBt8swktWD2OQbbHYSOkrJ6rRk0l8k21HwnX2EJ6DucMn302sH1EHpqyUI8jUgnAehRs4H/yNSb12q4bzdRGpH/akyGNzq6s7/hgC8ImCQjOABXayBenJ4kF3LuuQFTU/0n1lEJVUAYXueJtfHgvmC4yHhoaXX7pTynxFWUJwwgRCRZbJp0iNZzP2yBAdjM5TdprbyhWlTQS70fWbyAhjBVYs6b1GPiPXHJSV2JFG2eysS11bqIqRQxaONHnBRCRa67vjKU88NJ8ThPkbZscyB8pvwwe/pQGQZQI6iOGfuIVz7RIAWOsnpxeSnLTburLvDoN4J1LUo/ZYfG3ROLRlw0W4l+pGppO+9fU4QECyC05CEIsZJLd4CRjW1+QRpA0v/sprjueUENInsEMPv6GxkHxABsFSsRTfqDexTdN7+w5PZa3Fn27meqbY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(451199018)(8676002)(6916009)(83380400001)(66946007)(66556008)(66476007)(316002)(41300700001)(38350700002)(38100700002)(2616005)(478600001)(186003)(26005)(1076003)(6666004)(6506007)(6512007)(966005)(6486002)(52116002)(2906002)(36756003)(44832011)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V95PYWSosskxn6Hfx35TZpWx5gOXUbldnukv8O8biYn5nm7qtCL30u3eLcRy?=
 =?us-ascii?Q?Z9RxcOELOJBMYau7I8SMyKzmYd9Xfie8+snuaEPxoR+eajLGFwz97m3RSmj+?=
 =?us-ascii?Q?SjK2jyeuqsDPQBhY4EHUeHMJ6PtXblWl2TH9h1rnRtBXeIQtXQxYGxQYj6ST?=
 =?us-ascii?Q?cvAetjDIOMICpFcVdw/+EoiGLW3hsi0wXpEhvjdHnnEJDm+6IUgSUWlT9P8k?=
 =?us-ascii?Q?QxSld7/AOb3YiTCFiPn4jL9pogoqoeIAnkrzYKYTbeszYGd43bvlKD+UgH8S?=
 =?us-ascii?Q?WpT6z67J72f3wy2rHdvhrv0mdNxfpfD9ZxyP6yw+zkBI3g3VmMx1DO4N9KEv?=
 =?us-ascii?Q?pK3fH8vhxqyMW2NwbtkQrE27LZ5w8bnB+pgFRy550q8IJHNOry6tj2kMtgRf?=
 =?us-ascii?Q?dRyGTT0GCqzoQ4CMdCatyFvz9IWqPGw7nrNkEloCMNMIwdj+++nnUU1sMJPO?=
 =?us-ascii?Q?empb5U7YUkL9uHiu2EBXDsS2gPem5AwQQfDEsF1YB36Zc4GaSW/z+k/BjLl1?=
 =?us-ascii?Q?UsjYrOy8JCa+lkPsc+mWvINCmMlCI8mozdZZ7dfktkTa5XkfQutcjJdq/ioy?=
 =?us-ascii?Q?DBcjEpxTUdT19BSYPDGArAe1l1Js/1d3KNZBWO2TeEqLjzQHL/7BiN3n1OYm?=
 =?us-ascii?Q?ISdLKLld3eZXk92guGcOxVyFulf5Sw3PUeTzzujYTY+oUCsnWAxplFHCAYe8?=
 =?us-ascii?Q?a8LJ8tbB6a4zTf/MUCwNAtdorUUhUp9b2tASAaJ11fNVAy5cz+TGRLhkBrXX?=
 =?us-ascii?Q?oBkJV+ykjjb/BT+Ny8Qpt8nBy1R7cUpsl/eVdulBt1RWAy7s379/SVtFnQdk?=
 =?us-ascii?Q?MJLMwYa8W2Gj7SfuY54LHrErY+/jvakTrfOqa94D/YEHGzAAaJSScqf082Ym?=
 =?us-ascii?Q?yZy+UFfzdD/OnWRYjmVQsd98/23mltKEFVm3mywrsrkQKzd+3BCOlQLQFD8n?=
 =?us-ascii?Q?9/RZACvpiuFStc4OzztV/s1F6+nliCtJdAwpv4QWSnrktVO1LqVyp8hR0mta?=
 =?us-ascii?Q?Qpi0Oau9UvQzl9HV9TaRpS2SelbvPXfuLVO8Sz4BR0WCa0s1LlRzxDzuyTt8?=
 =?us-ascii?Q?i3IdIh0/JDbYq4lCKW82Vh3UAXyDomjY1Q6rJ6cGWUStclgulLAtBLlZ6Kvt?=
 =?us-ascii?Q?qFrNYfZaJLOEP+gGT1i4AChaF3K1YiNn0ubDS+zRv1+s0J1u+iYOJENYS1vs?=
 =?us-ascii?Q?wbuvR6WJ+TV+s66c0guhaA4g8FWmD/X4QN97lJDN9TjVIt3Vl9QymGFjLDjq?=
 =?us-ascii?Q?C8CVR5HlSpaLYrbVIZFOG4PtABuqgzotjO+MBG++9+W8GvdvuHu98tndy3pq?=
 =?us-ascii?Q?mvMGUYTe8kLav886zPJf5B4lEOxpV0DuFQI1o4IvMj+WwSW4EVKlrOxBCbeB?=
 =?us-ascii?Q?lYvClkx4xLm4rW5+D53MI/ueNbj83BFiK2aYYsog+uxk3N/hQIZZiXDfIthD?=
 =?us-ascii?Q?ncv8m4/ilqy4RhwQCqPYV3jMxmecFFs6o6zrS5y5Bv6k867bzevvO2wlewcz?=
 =?us-ascii?Q?Kk8QxPieAqrSXXU1E8EVEtCxQfED3kXPYHgvuI9f/WmqA7dMLhESjK8sm+1I?=
 =?us-ascii?Q?xpQPVggVRQeuwEP2T+o2IWB5p94Ihvzy+FH5rq51?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793b71e1-fe19-4f9a-31c5-08db2b78e981
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:30:51.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YuVlVwmMq0QqhHYHnnEcG3hItfVeK7cW4synfIGoMmVJTH7xbRWmbQ0PtiaEXbbXhqidWexT33IpeUZlNmjUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
X-Proofpoint-ORIG-GUID: ow7De8Df8S5cO5Tdzazcie9vaajjUDTL
X-Proofpoint-GUID: ow7De8Df8S5cO5Tdzazcie9vaajjUDTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=941 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 08:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101667

ChangeLog:
https://github.com/appneta/tcpreplay/releases/tag/v4.4.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.4.2.bb => tcpreplay_4.4.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.2.bb => tcpreplay_4.4.3.bb} (88%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb
similarity index 88%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb
index 7d2a6a14d..d461c8d3d 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
           "
 
-SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
+SRC_URI[sha256sum] = "216331692e10c12d7f257945e777928d79bd091117f3e4ffb5b312eb2ca0bf7c"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


