Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE81C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:39:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1721.1642124396083724687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LZ8V6+kx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1SUwC012691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=9EZM6K1jyCFBeKHD/tjxbyFzd+V7Sx12ql4+dYlpLqM=;
 b=LZ8V6+kxdoes7+XRkix1OQuwT3V8eV9Ac/kwPedKCFO9Ac8Tttc1V5HdGDWQPL6In9jk
 jR1Klxh6pPUoxuKpKAcVxGSCuj0B6UVIafDaMufCgDVqtOLNZTSoPsQvLNkgCT1E9Jrc
 th/qM92zuPKBe7Hj2aV48pliOJ8AfmtgxdPRHvD3qnvbOyRaaQohuKWgoVDIE+b5OdxV
 pNXpiFxNhMr3MaRY6OJEx1S4nq4WvLn8BZxjcTRVnqmLNdli9YYKoaboUZMylSNGIWlz
 +592sjCY6QoCkc8f93TCblp8IvjH0rP/h4C/U/3td6sKikSPxZGzG4Z1gWhpRLY5ugE1 Rw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy079ad6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWD+DkiKWIS1BV7vPHzTKmTlVPYh+WtKa0MdbpVcISuXX+O/QiRmECU478F1Z+g8aHoc+eGa7GzxSkdQQrZ9ZQDpiLkPBOiFDQzP8eOwWYrP07UklOIiKHPCzo8IKAvieCGQQauNw8vsc1tn194Ac94uz6+pOoGZNmGHFApcCchGtrP2mroxxG+v0od4KpM2FHEKORjWxf5lYvh9miHI3YHY8sTpvuIjxqqNqJXY0bDjRfa101f6j719pE3I8K21JsewhUDFjqPW89FwDePJIEi/elR/5oAtxE2d+dPygiO13BRi1Y0VXF/EHgQv47GyHU9kcUJprZJd3YIzYmZZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EZM6K1jyCFBeKHD/tjxbyFzd+V7Sx12ql4+dYlpLqM=;
 b=A52uyc0qnO7JrrIOoNe5fHOqqP4mLNFO8lBAWuNOusIsu9YuBb2pErjHapRv83DSETqm4wSAzt83iM29uqiARSf80pK6kc86EWfWpgukRkLTYMEjWTAcExyKKO6VPrK8DQ+ISTNcK5GFx32zdBPJWOMkpGc0l1kjdSAc3R7X3RdzRLtRzfI0LeNvN0GnEpPHd0TUf9BfMv2u+nKMd3zf7KPOAxBC8v/M5fCP5EU2niJQAfPboAqzVV0iU35DFfrKP2OViYgps1Ul3jDnSIuTMf5fvApRv7G8cgG8NtgwUJtJYTqwGBOOoIdJ5K3EXj5MV5bMzYHJ2vE8GUkDh5zCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB3145.namprd11.prod.outlook.com (2603:10b6:5:6e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:53 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/6] ipset: upgrade 7.11 -> 7.15
Date: Fri, 14 Jan 2022 09:39:37 +0800
Message-Id: <20220114013941.229837-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114013941.229837-1-yi.zhao@windriver.com>
References: <20220114013941.229837-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d706dc3a-ef0b-493b-a4dd-08d9d6fec31c
X-MS-TrafficTypeDiagnostic: DM6PR11MB3145:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB31456AC9D29E7A61CF22588BF9549@DM6PR11MB3145.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zguPbHUNMwCtKFf//omKnFb+KaGA5ROsFk5R6xhEpm7E5Sy3dcnJJygL6mUWXtSvUe+siNQgDB/8p+x+XtVIlNJYyhqwTP5Rjp3AuU42wJURTfDXkAaXtzv3zFWicOBKb6WF+ecxWIQHUllOO9+TffEJTogQRvJQsMYFZDaCdzmTkF4RvwtjnmbjtT3Rh1UjOB8U+pYi91ZfjvHuQD4KL2/8jlHy0GVVG/zG6VE+6QJQOt5kQniw0LVHxJKAz+bD66xwBB8eB5tjVhxs1TgKkMM3qKbr4Ljg60AFEO3Ghy7t4Wj5GRX7j7yfjG92w4NG+Oe7+CaK6yVoonquD4/1/2FDZwnziXM7B6pBlfKQkfgocFv+4LvyLLPnOje5dnpwZeXu82Q6XlM7aqQ/fZ/M+1wW+IyQF/Rgat6wV0a4Z2oItPd3XPScbu9HKYd40M4YdvgQupsEGt3vV4tdrh6IC5kN4U89dfB8NlX67MA1yUKzSBPFQzqG+FNgA7Bk2N5uL/EsAHuv1HTaDUy6efx33qAMA8SjAaQWGWktDcAeXmfQfhBwCNksXc9Ovm2aL3USNALv7zKASW8WmA1ivtOxUNUFfIqQmz1IqguQp5DZtKGEISnq7XaM4flCY5+I33EAJSLBnux8UlkG5hzyViAk9JoMJB3a/Sm45xFnMKC23cRkq3s2yOpmQS1QitUF+CQzR580aWCIRLjcJcfl7Yc1bOLxEmDJHhRkBkN7/TIWsZOytGQdePZ7pyANreN2mdZU5dDvqxVPYuZU5E4ANifGlEQZqoLbHkftmO4DuLrb88k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(66556008)(1076003)(66476007)(2906002)(5660300002)(316002)(6916009)(83380400001)(44832011)(66946007)(8936002)(2616005)(8676002)(36756003)(86362001)(52116002)(508600001)(6512007)(26005)(38100700002)(38350700002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/PQ7jisH31D/4Mj9KK+mNJy+InnfacIu3lvGGNeefaPVDfQx5nQn7L6tU9vA?=
 =?us-ascii?Q?e2f3yhQ7tLgyKg1Eu3ejXQyqRLSVsXVbqDsdgfikFjA2eJpU6xtbAf60Yzr+?=
 =?us-ascii?Q?hrtGQuE6V2zNeHDGlVkwBxEca3rybVPYiy8AIZxvoqTnipzNiFkyypfmlWhG?=
 =?us-ascii?Q?PN9Wv09lokfg5L7jYNKUmVibefzaI3NwS62qmxz1gKqaOdLPJ2dWpQllTfRM?=
 =?us-ascii?Q?plO3XHWxTSuv7OfaQewURTg9B0KwJ2sAI9oTUnZDtTAVwAgKtUZXkKdRoej5?=
 =?us-ascii?Q?h5bQuzn2CqzmH4jcgr+rP3BZQ0zi7X4d6kZUPtwRtVCUSZf6lmQIkUcpFl/n?=
 =?us-ascii?Q?LWRXi8+C/h3ms4qt43HL4gb+DBYp3fDr0XeBDL2sYJP+l7SJVSpcvw63dPT6?=
 =?us-ascii?Q?CqHz3sAWBk0rj7jVUTkDnUwQ6gNptnCW4OUPC/cbRFlhQHCpYIIFNquS9xkB?=
 =?us-ascii?Q?0G77+WZTnqsYPHdkBb+gf7ap7TOh/wNM4X91xupoz51KXg9vFQO44V2Sygge?=
 =?us-ascii?Q?Wj+1Qo8SChSjbnAtpd3HhMO6p5J2NPgVyGWZ/4GnhYGEAcP2/VYWbW46L5eu?=
 =?us-ascii?Q?TzX9LbTzAOLWXWUP97SyIF1jEwDGXLORtQJ2OhpHfRAeZ62gjMIjCqnEASKE?=
 =?us-ascii?Q?3fw1ta6H5mO1Q6fLcWdwJiItm2doaj5XBGCs3wYx8NKUfm15fx3v+kDL3q2W?=
 =?us-ascii?Q?zA+IymOXUSEo3MhNiAMauhsaV2PFY4/MIqKuJo7wv6kKCEoFfDwm9WdFyZS5?=
 =?us-ascii?Q?UQPdM4wa7IsHUpe2lMUQyGWW/drWkx3GtKlqfbnwGAqajjsvFhlwcNdgO/4G?=
 =?us-ascii?Q?auTdcaFyePKQqYJEbh+6TDXisjPj4AWFnMJj9xC7ukW0xM9FAXd+NvWE2EEC?=
 =?us-ascii?Q?mIz+C5H5S55Rlxd1Wfa6kGAkhfOGg2UYrk3iljFhT+lrUuB9HhfBcuDH9Lnt?=
 =?us-ascii?Q?PJmQdxLfaxaADFJihHRKw/HTqnEgreatEciW6vvw8DTnUp0hYr0uYrMuyD3K?=
 =?us-ascii?Q?O6pZvJp8+RM7wcBHI/4LykmyBSII5p5DntgOONf6JA8RgSAKUJz15cmP6Y4y?=
 =?us-ascii?Q?VhziV/gL/VTtIQKhGPfaEWU/BrT/10AvHXUzOwxg2rliZvhkc/xnr0Mt6XJx?=
 =?us-ascii?Q?Bj9+hEGB4o6rvxXcn2WGDXetpYkscCcVPR6j5PnUofYAWiyJKJgQK/DMqklg?=
 =?us-ascii?Q?SctkgJ9zqJ774IcyOqiSYiKOLWKu8IN4ngDttvI+B5qCU8p2/wjypCjkGJXK?=
 =?us-ascii?Q?g/FwBAuiwjbUZuSC9QNlqY9C7/QQnsPKutAD1WkgUP+3otHTbPoRYmVqDhxX?=
 =?us-ascii?Q?By0xbc7qO59b08OZeqwE/iS0srqUEXkIrmLlpmGWG962co4ar4Gw+DlqHIT6?=
 =?us-ascii?Q?WWH8NCWa9BOW7ObywqL/DYH01AC0hZ1lRhKgXoXNw4W8wTR94xYZ7qAvg/2d?=
 =?us-ascii?Q?xZggE2Pwa6nRDABdjZGxdrKltrnpR8HgytC4XBmOOMapnmcTADCgtFzbSFs5?=
 =?us-ascii?Q?LOl6J6NEK+1ToUArfiL6/aTrQL5sQZpbuo2WOcaoC3vN5/BtKZz106xZjDRI?=
 =?us-ascii?Q?Ng1cmM5DYZpxF7Son3tX5B/0Iu3OpFzKdZKzYzhI5pohroHGLFHClPXqcM4p?=
 =?us-ascii?Q?1XInSeuRTRz6hKa/87KAWm4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d706dc3a-ef0b-493b-a4dd-08d9d6fec31c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:53.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zSAqDcTroXHCVsT2QdmVGw+gflIqiUDl3dal2bpo1vOuYpP0Xu8vCht/GIpx8ORto4a2TLXroQrp5ATbELBfAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3145
X-Proofpoint-GUID: PE5fXOgA4GjaN2IPasZ_Bi8ifvpNU_tp
X-Proofpoint-ORIG-GUID: PE5fXOgA4GjaN2IPasZ_Bi8ifvpNU_tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=812 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94816

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-filter/ipset/{ipset_7.11.bb => ipset_7.15.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.11.bb => ipset_7.15.bb} (87%)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.11.bb b/meta-networking/recipes-filter/ipset/ipset_7.15.bb
similarity index 87%
rename from meta-networking/recipes-filter/ipset/ipset_7.11.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.15.bb
index 3e64f4159..7af7dea7a 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.11.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.15.bb
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "libtool libmnl"
 
 SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3151baad30f1d9e317b2ab4f2f5aa7a9f7b4dc11fcf8fe73acd0dc0b5dbabf7d"
+SRC_URI[sha256sum] = "0a5545aaadb640142c1f888d366a78ddf8724799967fa20686a70053bd621751"
 
 inherit autotools pkgconfig module-base
 
-- 
2.25.1


