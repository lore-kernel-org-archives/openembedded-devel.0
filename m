Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70C7ECAAD1
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 01:19:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32010.1661476786965402963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 18:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HbDNzr/t;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52378942be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27Q0r63M005358
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=v1pxMPyhrlTv16nfOBqecA/wA5ykk36FvV+nKNv+KDQ=;
 b=HbDNzr/tXAqmEv/i/aEzeWSvwlLHhDRS46/yiub/QJesIkYE0jtJMpCuFHwXhn8WDvtd
 skALmF4yynfAs/Xye4yuBzF5FOn/UAnCPX2rN/HVJ2JC6vp+IR9c6spKtqlaH/rOnA+x
 jTWrXvfl+aAaEO7f4Bb9js4v7taoJ3Eq2sHNuB9FD2+wnDB4li6vkMomF3Kxf/8I+w8V
 iiNhb/dSTeVa++pX8x/hKai22C7bZfC+/fRbyV9MBQ1diZ9eLJenAkaOGcAkCoXvabw9
 7V2Q5SJp56ntWUuxH+ihR7cuMNvvjaLjMkPROACRQucvPlJkO/nKQEOHqp4B3q+K4moi Cw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53s329gt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRaX8LABEHIgBjsKKnAjKJqHnXhzo5fasDNGdm12xCzILoPVIbBwdDcc/i2MZ7ny6AB3UAweahONLujaKBVXHiKOriB3dTTuZ0aKkbG/1TH+JuxZKLiuYhrXqxQWFMenpf/u/qsYRN/cAJW2q9lcHa7ewRdF6PFVDHf9DsmPFJoEPVtREAQD72H1OXvAMsfDuBEF9eObB6f2trelHPtYplSJqQnx58Ve7BxhZutyWm1kfVApB0nNgrEbdmZidxbLs493ymGGs4k2m/2AIjv8Eyx6D9usRfBrh1cgEpua3nzVz120eN/w2CJ5J1Kjr2dFC+MfsvncDx8KjuY/VxIwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1pxMPyhrlTv16nfOBqecA/wA5ykk36FvV+nKNv+KDQ=;
 b=M4nK+Rcfq2Eu7InmwgY0JEKD8DQgQnfp0BFNgm+jZSRoq45d0MhgMQbKe9dWhkK246hOtUh7JmocSjfhIHMVhliJc5n/bPjmxCeCMb8VbZN6vapJpSh1pB3m+HpdSypM20WYaQVm0CMCW8c2Pa/gLWSvD+s65OzqYtYQnr+trN5XPErWO2pQ6mZivCJd8CFxaD5isH1arlX9V+e8Q3hK/UQRKXaogCRMWgG/W4etaKWMSM7vN4YVQKjBzudezFJSH5exwvN6ijExlDLdjPobpwHhsh9OtP3/2dAGcjq6TgFlqVOIoYpsASwrVsRTfrlNyGxaWPjc1Q7RHX5yZXPsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL0PR11MB3332.namprd11.prod.outlook.com (2603:10b6:208:6b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 01:19:45 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 01:19:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] samba: upgrade 4.14.13 -> 4.14.14
Date: Fri, 26 Aug 2022 09:19:29 +0800
Message-Id: <20220826011930.2818670-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826011930.2818670-1-yi.zhao@windriver.com>
References: <20220826011930.2818670-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f846c75e-3399-4a66-6304-08da87010f3d
X-MS-TrafficTypeDiagnostic: BL0PR11MB3332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J3nf27HIldel+Puf+gyosKYaGiI9zVPwuO8fz1eF9/bPVmCyO/Bb3mKT4uqv1+18g2YPJVcP/FwmeRphJ7v4hVmZHqZckV0YMxzNPDl9MJY93pCEbyacylfTd6b3TgCPwlS7E9eS/vki8/T74WShmb9UkV7UEqNWjaLW/0OG9o/SkNX4QQ1uaekiga6vR4SMHUADA/mYDlQnzpuznCGxr+GQgzU1Ud72wYFRK88WbvFuDjsxaiqobudxzXLgaEUxSkk0nGpEzAHbzEBSCrGBkFniu/FJ6F3N8FE7B3z0frEjpyV8XFlPXGrZ+DO+rfxyghtN/W4IR0FbMxdN7h2m6Jr63Q/H9ftSo4H3ZlRFYr1FqfFYFdoxP/BGZUwyEV07Kto/+qKsc8e6HFSS8voGmcg0wOr+3FnMpebpBZ6HH7eJgfqGLfyctCMNvI4SgAiEpChTQaDuUS2qM57mK//I0k4LSto4k2FfYiefrF4z96geIbP1Z0YVBi25+V207l+/rH9HPfypx0nKdd22t+ZTgDSacSGAdD/EXjFvIVeeQz+CD8vIuyKFE0qfUUjpszQ9EKeB6AY7zBdB1VKZV9kF1JJNnDP0BVeARmJ+0JI6iyv0QK0YKxpRhL96hK2VsceoS2QYjYm8cZuYAiKBrK95DqqE1AR7bTY+5f76CZ9vkfwX5W0u/GRxeWj7SsNgMeycZVbtWuwANWVyU2R1j0wss2xZetrEfJQNVm170qSZ0CoD4aTR9h9CLIWr4O9L+EeQmh1jdS0tth0eam6nDZFlUIYLrVNoqfJwD2f85HbwUB0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(6506007)(83380400001)(186003)(2616005)(26005)(52116002)(1076003)(2906002)(6512007)(86362001)(38350700002)(38100700002)(8936002)(316002)(41300700001)(44832011)(5660300002)(66476007)(66556008)(8676002)(36756003)(966005)(66946007)(6486002)(6916009)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fYMDkwxJKbhKwiWnS8e94c35oDI8wyRhltgljx8AgUCMSaT8381Ll6u0P8ad?=
 =?us-ascii?Q?Wr8OLHYVAU2l2zZl/3TZ5U30dIOMOEQW7t/uM9rJ85AhE23M0TVXQiKV3Q41?=
 =?us-ascii?Q?rAp2ao9IcBUYHlQH5RKhfY3D7JiWmuaSH9TMTWabM9QQQtp3TqFeCnLq15Yp?=
 =?us-ascii?Q?ESLSjJXzfIcwKpmeBWX8h2aP7/Xd6Ar9Sm8B1NoCLuwXd/bvYJGJZMKz/mCF?=
 =?us-ascii?Q?/2Nhc+fZ9tpf3SrXI4QGYp4DAUhBhTPFLkdp67hwb0d7FJSCJtOzajtE0VCY?=
 =?us-ascii?Q?Ji/7Z+L6BJtiZyjcifD7Pk9T4/AUCynvIfjHwnsOtTfwwdhYMeyRVZkFyL4U?=
 =?us-ascii?Q?JcEJ2Zn+E8gdmfviRQSAjsKXIkzjgjs43YySEupCQTYmM19nJGRPQBqpxehK?=
 =?us-ascii?Q?YSe4qR8/DbGvx+NJcY0MYzwEfC/XSWa8JZ/TWnfSQQJyd2kYQKbd8pjy+Kf4?=
 =?us-ascii?Q?fu532Zl0zUSF26sHIxgz3X0qBWr2b35FBs/YR3K8tU5YYucJ/mTYTBCb36Vh?=
 =?us-ascii?Q?Rcy8QCYNt16lTgQgQMUmezVsPDmuKPAt+SDxSLwHhnPQBoMJQFvlhl7sqMYD?=
 =?us-ascii?Q?Ln6qlCzpt45SibmC2ZKwT43mJRd2X9W6cEsV46jwLuxJMkK4KcBKxiIzAzqu?=
 =?us-ascii?Q?dPIKXvoa8vNTgfZwqgnU5o9TkT7D3omVVXqzdcufYC6jBamNgE5nxOnWEHr2?=
 =?us-ascii?Q?lIeCs0XSw9AJbt68h7aH2kjI4lvBJKYyqf5kCyURyeuusrd0DyQp0gYTELhU?=
 =?us-ascii?Q?lVGsNVlm8CXP0IKGjI+icdhzrk2mRnQEqZCAzlWPbbO4Caa5kDMKSUXmK8+d?=
 =?us-ascii?Q?PCSsUEjxRTSpmQ+41kIje8JrYPApj2zz8lFoKAaLCi0hE/Qb3MN8VSPV9Hip?=
 =?us-ascii?Q?1NZZO4biXFjupJGzp9s3bY87Kt8j51AXhzUYv23Fpfa8jiDn8Bl3HDi26QQY?=
 =?us-ascii?Q?No450HauHzQD7UHsjMilSQXN2UelnSg+ndyU4m+4oKxrkJQH+mDcIA2f+rkt?=
 =?us-ascii?Q?ZW6e2TTN37wCCvjGA1jC2kefl07PoVXzBjj0TY7Tv5rkSph+8BOp+K+AFjvf?=
 =?us-ascii?Q?s6AzKPWbTAUuK1R4915hgxwI14/6qYKmsBn0VzG/F3Pbhg5JsTSC+C4TT+Dx?=
 =?us-ascii?Q?y8W1m542Yt9d5DJEVRErG1W2wX8ekEVHqf/sFcp6QaJ9iH7pUespEpJhaK5p?=
 =?us-ascii?Q?1+8dSED86l7Rm2J6/HXyAPa3l6bEuAaVyEUubEeWrq1Uc4nANh2HhwbaEJm6?=
 =?us-ascii?Q?va6ig8WvjBbJZvV8l43WtddxaH94x8sOwpbbD0WQvlNEQj0ZMqGes1XtE1EL?=
 =?us-ascii?Q?OzmfCgpTk5hcICLX+RpeAuZE/mIYQVPifW2R0pieXPGSXTu7UrtO9j64Cb57?=
 =?us-ascii?Q?/U3YPJjuF7ZhFfTT/3Bq41kYa1SWmNXzFIliIQhK61qcG6SZaMd1nSIF6wsb?=
 =?us-ascii?Q?YCcoUvgJFLrDeeQtiCJCkLrTjDRz3SclM+gFj7R7DcUBxu8EMmRSjfoWTG4s?=
 =?us-ascii?Q?qPYGfLu/ezjjPLFpIGJgM6yjfr4RxtpDPil37dSKn1YmAAQROiz1L1A+z3p2?=
 =?us-ascii?Q?pd2ya54HZqt4Vtxwja3keKHyXC1Soef/XSGeFgzS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f846c75e-3399-4a66-6304-08da87010f3d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 01:19:45.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w61yZ0yTJlmDb6+QMsUmVtyVUH+XKGf/61HEjF+CNwulWDm6xKWwfA6Q9ovF2R0RJd5ebpspsZ1yclbRpQLa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3332
X-Proofpoint-ORIG-GUID: 7YNe1u2wq1ZtRTKZArx6GHKUqlOFRoMj
X-Proofpoint-GUID: 7YNe1u2wq1ZtRTKZArx6GHKUqlOFRoMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_11,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208260003
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 01:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98438

This is a security release in order to address the following defects:

CVE-2022-2031: Samba AD users can bypass certain restrictions associated
               with changing passwords.
               https://www.samba.org/samba/security/CVE-2022-2031.html

CVE-2022-32744: Samba AD users can forge password change requests for
                any user.
                https://www.samba.org/samba/security/CVE-2022-32744.html

CVE-2022-32745: Samba AD users can crash the server process with an LDAP
                add or modify request.
                https://www.samba.org/samba/security/CVE-2022-32745.html

CVE-2022-32746: Samba AD users can induce a use-after-free in the server
                process with an LDAP add or modify request.
                https://www.samba.org/samba/security/CVE-2022-32746.html

CVE-2022-32742: Server memory information leak via SMB1.
                https://www.samba.org/samba/security/CVE-2022-32742.html

Release Notes:
https://www.samba.org/samba/history/samba-4.14.14.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.13.bb => samba_4.14.14.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.13.bb => samba_4.14.14.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 49e93fc53..cb3678d7b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[sha256sum] = "e1df792818a17d8d21faf33580d32939214694c92b84fb499464210d86a7ff75"
+SRC_URI[sha256sum] = "abd5e9e6aa45e55114b188ba189ebdfc8fd3d7718d43f749e477ce7f791e5519"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


