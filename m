Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AE7C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29914.1660748972676447085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PaqZiMIP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HDiQC8013747
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+i18HBKEwIdVK+9lwWAj7mIxPjLbtOLNVrjLr1+C55Y=;
 b=PaqZiMIPsRFQvjNLGA1YGG0oVPXtVue8k1aezdzVwHSlazdOgpuChojqGs/jUSxJZ/S8
 HHXfyqT6LZmoRbSSfYemmQiLSMhQjY8LXSEF9WsFlLttzqgTmLornWddYmUqZfGeD+nM
 Zm13dHhfjOAMYD3RvsxmKH0Mo5F7XrPBTswoGPA6pEHmAyK38CwhDr8NqB4ok6a4f/mD
 4sNGNCAEhGLqL7uTZsVTJXihbvxndHeYMKbVdo5guC2a+JDJ/TWYblMZWefKbtF9uztj
 yqb+dFLzG2FCvXhva+DDLPLoJ7CX874r8u3Pvsz+qcYntbcmvXjzFKGBZQVKjnL+CptQ pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:32 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9V7A017372
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:31 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpFgvu0nbw9lDmqJdo/bz3V2l7HZHpornz/KtrgOIu+0rphBW1ue/Mt+5VsNEKKxrUQIMYk1+nsmcoMCcJmKtY8u6udpb09Yo4P6kUYOQFXtB0RZHuyL/8vhRzELXDqkWlp7VdryiCsNhM07JEshq6KPdUYUPSRnoVjNFGbjvdgAh179v+R0fUluO7HBbuHyUJbZ+e4mPyDGo6lWOmSdhF4KJkqNcgZY/QBlMIFZUsAxAxTkAPWwnbdOtTgMjdWCGzCvl+sZrcgylbwfCL7wrRu0oN1Jhrf1Sh9AD2Beixsce1OzllZPmE1LoqT3ie/2j23sDLO9SPyDIAHkPGSEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i18HBKEwIdVK+9lwWAj7mIxPjLbtOLNVrjLr1+C55Y=;
 b=kxy2K+E5oXCGWy+WYSEAgFcR91dzGQRPwSrYlZpjN5LTB6q+ByWRlU8lFh1C+7bGL6Ee9kxflNvR7Ea9un5S/h7zEw+n9swcAAhCklMsUzP188M98fzPpy+LqWcCNznSHrJJHm2FA9OWmADdbh8U91vFpujKqIhMfxzOcWDB5AUM3NCIObWGho4KyBb0/HvRVIYdXiDRxljr7NROKEgaKMVvXoAZR9F6ftGRb1SNpEi9P0Kn+MhKJlv4sm+OAt6rD339g/sNnUPj/LcWvSmUC8TRA72mIlXKAThOkQD29IQyrl/lrgTsf+1bnVnRkfsmaxe3ZAHLo29mQwm3vziROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:29 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:29 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 05/10] libipc-signal-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:48 -0700
Message-Id: <20220817150853.2823101-6-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 136f5aee-7495-40bd-d1d9-08da8062706a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BcAMMaiGAHrWFCKsD20avppJt9naTnbrgfy9TvlHTFwMdDU+v2t3HVx/JGIQ/C54uqTRSaR6Z+by6uK0i9Qvr+lib2a3nSiFcG/o7vT2CUsrxOOdyRAU+9ZL/tMLuNY7vA4jIss5vdkRwhmYDdHYPkAPd55yy3+2vb6af/+dNCr+q+7DvUFUer/UucuRzQogWEAHDxnH3dHGSac82m/uIKIos4BVFIvLLpz9O9W9jM+0PZUh4dP2ooa16I9Dsjrf4Px40Fl2qqcbr1OZuv8UDKn9PJi4qfbugw1Q8sZdaOBUAOBiYkiasXMTA08nFSXdoyBF17AubOxlR0FWD6qpcWHhiZEqbkRT8AWxweXjxEh6UsRG4bJZ5gFzvn1L8XvS6VK2EnxfBttcXTGEmaaO7C0LKyPAc8A23hxuiqVvhkV5/A6Rc8GpixbpwsQP6mxxpS5sM3b38L/dqpy6fz5WmJsFt0nHzjJN2wCkXeLR7bz8LCs6KnOgucyJKvJ1qPVNCmq7L+GR5l7CEpY1s1xkBNIgxLNI12OkIUCZ22UZZtXLnAKVwWN3jFLabiuwUObKmMDi4qEe1Z2Q/D2DlKT93sE2faLMHWFwfgD76CpE0n99OOeEyjhXg7e0XP0nj6yxteDWTZU0VJWQKaw2qyLO3x5b/b8plaUFoCTPbCasmqSPfsKnKcDKc2qVv7Iu+gPXeZPP9OI0DaJvoynUrk6IZigTThhgwi/IRd6Z0mCVIBDFVlNKhtIimHGvCedG9zRVMq3x8+kmPdwfVXDKTq5cLXTQ6ljGW29GFuLRqbe/b1EaJnsQKOfBmQ2rJdGfbKD2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/AZemAuLlR4s8IBH0Wj+CUmX4cOmAYvWVRkmjZqvOOcWlJKu3i4t+GgoQWIu?=
 =?us-ascii?Q?gBvMG5EkQ/Xv64IyQGjFd95F8UadjqMAqvWHIz/6FmCTxkdveBIYXTpiUiq9?=
 =?us-ascii?Q?oC5oJTnqVfngfXfhzD+CI9eLkzafSLfSvtG60T4PTpsDTk4YNikN70dEMMmK?=
 =?us-ascii?Q?amd5ZtBsKynLBGVgpUHAf62mFdqqs/bc1r0Fjooog7mzOng4B3v3ybVsjnUA?=
 =?us-ascii?Q?jrRFIIMi42sBsh1oyeXazKRPmo8qfLtU8Je+oArwnZw5IiKqoTMJChXE4TFZ?=
 =?us-ascii?Q?Cr0goG9S6P5JfaXx3JDpx/vX2ZF2uR2pSKAACDOyOBI4nTk0QI1sxkeYzKZe?=
 =?us-ascii?Q?NYRRsvZKxlhFbldcfOQ4tGJpH0ibaP3riOL8MMtCDse07fpbdpG7cn0kbsuV?=
 =?us-ascii?Q?wGZHdd7EvgVF6fmsTyiSBadC7dZaEgJ0LQkgobNTenxTtGZCl19JPs7qfgSE?=
 =?us-ascii?Q?A8T3GWxEMwoHD5MS7OBScXbcwrun8S8Kw1sM/IVRkke5Ci6g7yobin0aSh5E?=
 =?us-ascii?Q?mN5yvMclxviKV3yrzZJdI6J9iEFPd2UB2iZg6jl8wJ13fPfwfQt10LArn07u?=
 =?us-ascii?Q?HwA4V9fcT9s2qER/S1KDa7j21iZK4TzwN14m0RMqF5ZB141agDabwPt4S3vu?=
 =?us-ascii?Q?cVxIX2JYE9v0BqOQpB8TCLrFXDH04ZDVGw4i61pn2+d9Q95KN5/Z07lFOiCt?=
 =?us-ascii?Q?feF/NqUW/43S9iqFGAd0aAmcvyiEyqTlcW/Qkc2gakICBUTT9nDEF8Y2TVIe?=
 =?us-ascii?Q?alJld3RKXIcExB3EE56evI1s40J7OYdB7zUeThyUGgiqx6ruT2DdI3opM/6j?=
 =?us-ascii?Q?WJQ6VeB8LXd9cpV2yJF6Z0BGADcdRcXiBhczGSzv8BxZnLdHoYfLeiYHdIpT?=
 =?us-ascii?Q?ajxffVaOVeEuOK3PjusgkPZBI6ENlKCsdL+7NSnHpU/fjrNTdUyIHsLSJuro?=
 =?us-ascii?Q?rvd2hS1JiQYFBHXLdqXtHAyW1RtJyDnacyAKlDuAtfQPAlmFjPpekBgUx+q7?=
 =?us-ascii?Q?7B3gdyNshR9vIcQMQ2M72Tu7hpRgNzydVaLHkI2mvKMIM7/VIliR2ybl92Dc?=
 =?us-ascii?Q?iVau89TyBLobiVjqs/d9qoiVlPJ/2afhbjSRc3fvmNLC5+LI7WwENBJjDmWY?=
 =?us-ascii?Q?LEo8xbOLFPU0RAJKdGe6b91Riugxiqp43SOCxQsfSq72DCyiI0nvCok02Z49?=
 =?us-ascii?Q?8m1LJMMjf7GDjhIL43MEZEcobupRQTf3jD1QKz0VuZbTjFU2nSBHLscNrzFd?=
 =?us-ascii?Q?it+fCmeYNKNliK8rDC24eQztkNdb+DZmzaEBfQnMeqmUzR385gPfV0bvkjbV?=
 =?us-ascii?Q?QXysZYj6uXLzzOoOuuucp+2zPERMkdIsM1YVnz7ckEYpQ4s9vEGvTV2st6Jx?=
 =?us-ascii?Q?BdNVHV0BkpJemHrVZSh+tdewIVMB3GrgI2RPnfrh57sp2LqKVH1HEOq8ujQN?=
 =?us-ascii?Q?+i4HIh/svTNg/aalUFZulDEZ89eWp8Pb4zLsFyPhDC4PsB4hAOCEcvhcNNZ9?=
 =?us-ascii?Q?Q4nIM24Pbn98HjmUNprGsRmiiEYb3N8BDk6wNNPv/ODgW960JeTt19uwPWEx?=
 =?us-ascii?Q?TxAuYf1lwuYvzfN1ZsGYDciEDDF98W5cgFKJkGIRU4d8OMyU8DAO2PV/bcL2?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 136f5aee-7495-40bd-d1d9-08da8062706a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:11.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /lJ2WfKWeEh2JYqzw4Gr27T8xHUyQ0LsuQCIuRmYx1Y0yDmr13RW96udT6wI1qdotYBy8tLvOmCJm2oSWFT/IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-GUID: 7iQmqWCOzR69uBVkkNYhDcJrtOCxRtmW
X-Proofpoint-ORIG-GUID: VnFd3gehaBCwzdxxyAviElkRWm1RQm6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98300

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
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
2.25.1


