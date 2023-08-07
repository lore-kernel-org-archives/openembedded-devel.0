Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08FAC41513
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:00:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29458.1691395205759248080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s3Yi6AB5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75832b7afd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37760L3u028957
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Aug 2023 08:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=JN1vp8CblZPRWOrNri
	3DbtioIuXA2gSlJZ2zXFyonQg=; b=s3Yi6AB5UXq7nl20UJ46vODDObYywTghzl
	GM/A6VzBZgy+rux2okAGDEdo5rFTscXcYgzsG/Ci284nqbW7XOd6ZC2nFj8188Pa
	Lyluc0qgsE/iS2x4PP6Y20+vjgQ1Aka29KXJZwkrS6dfA9EGLPgrAaJ6WbHCC/k7
	EOB5e98N1fdlOCcPa44tvDVbK1a7P1KiuM3WZEblzY6DXr6HnKY8nBpXJbMU5MLE
	N+RosMIcVcAROOeoHFqX8x96r5Si1IYvppRkmPxnrWd9K6/4no7mxvF/r9EEr7an
	Lpb4GXEmBfX9ODtolD9L7WheaW2vr5V92bPiZ28KmmHXGFo+h4ug==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd61d9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 08:00:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoBu7le8t58cmjdKy6Me6+SnzBT+8L4GugwaVXc27D0G+aqZBg4bEfJ37jjQF1tB3s4F2x4hWRjW14uLZV1qHdAdKkK2F189/p0S/2AkVJj5+CXGtxkagvcuPAxQq2NqJTTUAGbhqA2PFLYAfCqJooYNBNhbJordQi23Yf9GWxbOilsmu980hQqlhCQywzVKYPCpbDzhOLq6IBf3GCOInjSYh0z26OadTjJNuVXmjVfifG3zD196/FqISf4U22IYlDYslhdBogRvH4pzsvLK5s8p/n+uZTsPK+RtcYCuNvLGdlYx20P70JtUKg7aQtm9mNKPpazekUOVaCBjuBWi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN1vp8CblZPRWOrNri3DbtioIuXA2gSlJZ2zXFyonQg=;
 b=ecaKKkU0Eg65FOIoH3Sc8C9glGCporJ2Mv5QNualvxLPLKA+bzm7alTPXpVDHuJclVeJ3dRSJOuXpYB/E+k7vbLQqGlJu2JORZhSTzKyX4USp2IqL+c/nS0Pxei0wAchC0YEXcFECAPNiqw4fFdg5fMTuEeIv6mLL892eSSfC6V0QTblc3fWTSjdP/1AEeom/5ReiM0c8Z3BrDQfEkKd/FuPjYWFBGZkAwROyJpSW6WrAAqPrpv8h8RhY9v468dIBg5QWDEZhrB/+SSBTrUSE3A2wwEtKmViW83UX6M7tUL+/kXlkjyfWOuTNXyXd6v3Va/aUGgKErlf4OwyhzgAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 08:00:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 08:00:01 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: add CVE_PRODUCT
Date: Mon,  7 Aug 2023 15:59:40 +0800
Message-Id: <20230807075940.1907591-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: d53e7947-1b84-4672-7f04-08db971c4d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1cNxTYxqGw7lKVJygmT7rH0YMftheY0Q17nbrArK1MUAYXA1ESjeSrxEktl9Ip/ivyMidJeOrBQvn0XNzKQ+B7TV9pebjm95ykF/YZjbdRqdPKi1NpnIN2B/MkPPGSw2yBMRtH1RR+q5Vi5d4wwz4UxgWGY2JzCRw8v4IIlHZL5QPmwczYCIEN7YZTP4w+otX0/tPE6qpRsiJ4V6BO4WvOhsRW05hQfdT3T+M2L9V9VFxBD3bGxJujg2MqDlwjsXprbEJK/qhRAz2tJCk9F53uoryUSIs4q5UCGTxNzU+GJ/+UVnFmgE3IYzuc/A+sjDlN9jiwG8X2nqN9G0E8S7kHQKaDQW5Nys0d1JmUguYCTlP4BNV6C1+SPEXgx+tI1EJJH8nituiji4JFfHik8vNzdyDcddZ/jbqeF80Ylx2R8xKd+kTQKR0RuJYtC0mB1IyOb46K9l5bPG5O4RJMXtrADTNrGLN9DJzNN1EiEeYgaoWCRJb1QVArtPxQDkqeKL5AngRF/2nlpF2l9lJP2ErknlZfX6IsJYSvscbYtfTEPsOqNhTLZe4SQwK7oPso2qcLoYq/JAm2/si6mIptoRXrwqIKla0kYJ39ZVpSkM2fo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39840400004)(396003)(136003)(1800799003)(186006)(451199021)(1076003)(41300700001)(26005)(2906002)(5660300002)(8676002)(4744005)(8936002)(2616005)(478600001)(6916009)(86362001)(316002)(6506007)(38350700002)(38100700002)(6486002)(66476007)(66556008)(52116002)(6666004)(66946007)(9686003)(6512007)(966005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ugwv0KQcs9NhycH+IEkeBabHEf2WnFHUn6nt0GN3H6yvy+ZJIts3cmGEO8Ev?=
 =?us-ascii?Q?OUCFwiFk4uGug06rAlJWnxMBiuUVFWPprGj1SxqPvrWP8bhh0yPt+kgtfyPf?=
 =?us-ascii?Q?PzWyAMlamdMs8OYZGce+Bhfh7PKJNiPffsN50u6sRr4Gf+Qz2rMP+IJS768B?=
 =?us-ascii?Q?MgUaj2Rl7ZZKsIDt4R+cXk/91EJD5EBZjZaUj9pkXMWSJQZxoLZqYys1e2Ci?=
 =?us-ascii?Q?SW/G+Xr41JulQg4V9z/F6fN28Gi2TCLOeSKaI5fhBYbkjCI1gIacRsuGgzOp?=
 =?us-ascii?Q?EyperVgpN7+cViUUH8VlCGkbq7f4nVN0hTVO4Qtpv0CVB3Eks1TFWz7wx/3j?=
 =?us-ascii?Q?pK+mEJ9kuk/M6K0ZuGjfF5qBSjBoRjJICQo5pQAiewfnn0wropKlSFHEfoRG?=
 =?us-ascii?Q?FBMDReHAI7ghdbG6h5uZBGDYplCqVRZlghxMapMgjH3C+25UxFEtqwEa6238?=
 =?us-ascii?Q?cwWvVRpqWXSpVANZxszHlb70gvqu6xI1IjsXeIru7s9qUPAvTEqf9NxEC/49?=
 =?us-ascii?Q?K6WdVcQc839rc9A1EpurMrvGE0r3o7Ibhmbu9CbTUfpYiM9cInMAh6POvtMe?=
 =?us-ascii?Q?VJlL2es+b0bYEHZvy6bCoN2U7s2O3HoswNGTVhrE6JCHLoOOJVZv0j0zX3tM?=
 =?us-ascii?Q?BmtPjvWK0eARazifj+cf79RnhXJJIFqIGp1lPkRCxaDzoYo1KnNJxZMHZlrW?=
 =?us-ascii?Q?E5bHGHRQtmKID6z3EhwOxA/nr52R9JCr18Tjpx581U/JfAPPX+w4VxipmVUx?=
 =?us-ascii?Q?Onq1msX83p7HhKQNoI4HuRc1UX9oEOQVvuzrZEB7Z6xdwo3LvSFN3dNT5yeP?=
 =?us-ascii?Q?kurLln6akA0yZkpjPo5AAgFchjvYj1p1r+cDTMua+0GwlBwf8oNxNrVcK0xC?=
 =?us-ascii?Q?e6DD6aaALDaWfKRJssWmMAoLhFINTmg+OlKBBgRXlqckijgV9Hz5FrMovVKM?=
 =?us-ascii?Q?3i9A8RXIt2C3oVTUgWVHDQsaSthg2GN95v470YqP3Yha0A6f/eupvFHM3SId?=
 =?us-ascii?Q?jHEWpUeWtQJIuRW3S3gQrZGMMOPWXoxPEAoNjfscR3NucRU7RfQUzExymo0T?=
 =?us-ascii?Q?kicVEpBqyHss6PhVDg6Mi0eZMHU4aU7QHCZx/9UC5MuVIBPKJY/1uLeN2LWJ?=
 =?us-ascii?Q?omisFUrjQtodk1gK7sJbz35FPd+hFak/hgKf0C1mw+A4duL+zCbi9H9YRJJT?=
 =?us-ascii?Q?dkIDMujjoc8KUPyfGEr6JYvZVILfVXO1WWxIktZBdT2uxfe3CFzCCRElinh6?=
 =?us-ascii?Q?h/Mucp+KXASV4/mPYaJEuWrm4s/b4oPjSftVZCRRe+FWZHtutfz2xcCdH29c?=
 =?us-ascii?Q?HQ90EGZIWnu1M6LGg+f7apwmpgv5TOJE/ZAFNLvrCr4MdkvnHhOHvzmmgly+?=
 =?us-ascii?Q?8UaVVsgEbAX38ASEEEravH+J+kpyTL2qGRpICp77gVuJKr7ddZOm/Y+tzBTe?=
 =?us-ascii?Q?L3Ck3wY1bVy8kmJ0ewimrSO+UJpKPVjHYR9aRZ2r3v9zEzVvJg7Xb5yBTYGG?=
 =?us-ascii?Q?uI/R4q97w2Wcg/hq82ZdzfUiyIt1RaqR2X+Vc5Nq3vgOcI8IVien/PHM1D79?=
 =?us-ascii?Q?6ZiSaABlJJa1K8FFo5vTVJJyRNM6WJ1dmkBhWUUb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53e7947-1b84-4672-7f04-08db971c4d24
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:00:01.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAUZ2HtBy6Wi2SjkQBlUE8JeERbmLVawOi4m5oZQOCROeS99UKqS0xnF7xaMGzhDoJagydDjz27SGvtviBjqkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Proofpoint-GUID: EgfhRAoJQUuGS6nGTTmWg1tG4rILjrVT
X-Proofpoint-ORIG-GUID: EgfhRAoJQUuGS6nGTTmWg1tG4rILjrVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_06,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=371 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308070073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 08:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104301

From: Chen Qi <Qi.Chen@windriver.com>

vmware:tools is also a valid CVE_PRODUCT for open-vm-tools,
e.g., https://nvd.nist.gov/vuln/detail/CVE-2023-20867.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
index e12e4be7f..4873e9d89 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
@@ -119,3 +119,5 @@ python() {
     if 'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
+
+CVE_PRODUCT = "open-vm-tools vmware:tools"
-- 
2.34.1


