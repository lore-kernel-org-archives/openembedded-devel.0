Return-Path: <Aikaterini.Voulgari@softcom-int.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5948C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:14:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.101])
 by mx.groups.io with SMTP id smtpd.web10.44689.1693822485758007589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@softcomint.onmicrosoft.com header.s=selector2-softcomint-onmicrosoft-com header.b=nXDLV3Dx;
 spf=pass (domain: softcom-int.com, ip: 40.107.8.101, mailfrom: aikaterini.voulgari@softcom-int.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZ8FpbsMLJ+GCny0RqUkvzzum723jVigOnBCWQf2iBVl3zCAXnXwNC/QC9JrsWyVn4xDtwYxAkktuqEaxlAoORGLSV37cAzLxbjnjdLUcAcxpSqE1FxPm0YKCcp1HfWsr7TQj4VG74OAr3aEha30Jzr+WG/+SwhVzVwSHvUatSW0J1rUq3OLYxQN58o8SqrCiujg/u8gvM+3cxJkYiKSjbIvBH91fhQ7lS9NU1/rG8isGxUdPd4GvlTuSMloFx/6OIM1gZB0yMhuSW93cZKyJOaZi8B7jjtOyWDUzhd4wGuFjE0GRIGc3nVqaBN0dwOwStlUdES3vM0sv7TH0ctYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F07TntWx8xIknng8KQ8oZq854NoHRIfvNkm0izIV7ro=;
 b=YzkigVJ3qtIyI7PLaxgMPkF2NFlBZilZA0L+sP3qwKjjmmdeVCqSXTqS1P5oiB1XjCI1IOe8Lzb53M09nagfBRI5RETvkKaeMhgdANfwk5PpjEdxbt205iBF0xpWVsEs22cRKmyMrKFYOiJfALd/l4jEItoTqXc6IQhkH2H3OAh4HRqiZlIPabh/XXCNIcXLlfyAGrHbt41Iy8NIhSwVjJdPmo0u9ZtZjajAPGZLiEy9IJp6ZhP5vFDRldnItUaB+xpuRmnYmMWByMgodhirpTkxMeFGD81Ixuv+vm8VTjWvYFs2IgBrrmPQX6wPIr4ICnmGGyzlBVlq7I3y08iPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=softcom-int.com; dmarc=pass action=none
 header.from=softcom-int.com; dkim=pass header.d=softcom-int.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=softcomint.onmicrosoft.com; s=selector2-softcomint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F07TntWx8xIknng8KQ8oZq854NoHRIfvNkm0izIV7ro=;
 b=nXDLV3Dxx1qzFZngHQXZkpMt+QAZQRG9l9Y9QvQVqVYDOruW9nCef0R+Ex7YMKpG7k8pVn9bf6vMh4xbWrx2WJ2WCgVD1xjBpIe9TIHUEuIw48kwN6IfiJHqsV6xiqipFrrx9AxP7n+YaaV0bah9/OHadDtmzBVZvmyEiNgTqvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=softcom-int.com;
Received: from DB4PR02MB9598.eurprd02.prod.outlook.com (2603:10a6:10:3f2::6)
 by DB9PR02MB7067.eurprd02.prod.outlook.com (2603:10a6:10:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:14:40 +0000
Received: from DB4PR02MB9598.eurprd02.prod.outlook.com
 ([fe80::8f39:9180:ee8c:60e3]) by DB4PR02MB9598.eurprd02.prod.outlook.com
 ([fe80::8f39:9180:ee8c:60e3%3]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 10:14:40 +0000
From: aikaterini.voulgari@softcom-int.com
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?=CE=92=CE=BF=CF=8D=CE=BB=CE=B3=CE=B1=CF=81=CE=B7=20=CE=91?= =?UTF-8?q?=CE=B9=CE=BA=CE=B1=CF=84=CE=B5=CF=81=CE=AF=CE=BD=CE=B7?= <aikaterini.voulgari@softcom-int.com>
Subject: [PATCH] collectd: build with rrdcached plugin
Date: Mon,  4 Sep 2023 13:12:58 +0300
Message-ID: <20230904101258.503-1-aikaterini.voulgari@softcom-int.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA1P222CA0157.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::24) To DB4PR02MB9598.eurprd02.prod.outlook.com
 (2603:10a6:10:3f2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR02MB9598:EE_|DB9PR02MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6ab645-367b-48b4-fe0e-08dbad2fc055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O6VPGRdWOjSsD474IGEiUpf9Y5p3mIjaBeaH1wF0c1H+o2+W9/jE2myTM0qoqIQPllndgFuVW6jSvmmJ6b9baSQqoyLSSb3drnK5S2ClRplA0fshEH2mrbZq/seEnn0qp9aO6OfTJBb1kOa6nOXQCAAA07RpQ6J+9xYplTql0DcJiUPRLCgFEtt+lRxUIMuMxGvjQGbvcaDUs9DIViD+UN0JXPnQZEw7/px7IlYwcEQy9ImEl/BQnDcJJBTYCBBf8wSt8DYpyTzWFOH0quwc55zzx+8XKC84YuPdlEhoG5nZVz02pY3oA/ze59T0mZw4wwQOEFv9UeuDe/WCZ3/wU9DcReAgOkRvXtvSfqIUiQ7mg5/RID8CljUFqVA0xXemyEFlbWzMOVabONKNyfbzbUPaoaeUwKhj8pXnaCBSbhKXvyOpX+YZ4qKyJuGr9y8yBNCSFutrlp9oEamXr5JVzrZIcR+h4qXAOgD1NZFX1c9AO29qhgbFKmc3RS8BcmB2DclxuqkfaZrFneU0cUX4YEazg7jP+ZO58OdMZOg5a78pn//y6jtaK0mlSdtHk/yPw1pZ7hf7t43mKqIvr63OuyYaMFP1xqBPNWooFCPlbrO2U2aZkUz4AEKNkYQOH1up
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB9598.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(39830400003)(136003)(186009)(1800799009)(451199024)(41300700001)(38350700002)(6666004)(6486002)(6506007)(52116002)(478600001)(83380400001)(2616005)(26005)(1076003)(107886003)(9686003)(6512007)(38100700002)(66946007)(2906002)(36756003)(66556008)(66476007)(6916009)(316002)(86362001)(5660300002)(8936002)(4326008)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tXM3dpzzPeGuX81gSCj64vRGiUssGgeyBi4EKds2RQZ3NGH/hiLqvvDvIgrg?=
 =?us-ascii?Q?dbCbFHoPgHyLj/O2l8l705AYiTj/T7qz1Eq0uytZCdJiS5TI33FU1JS5nPU5?=
 =?us-ascii?Q?UhkZoQpIDEIqrEjJt1HGvanaHxhX6PzsvhlzbZtSjzVv5bv1rrioaa7fis0C?=
 =?us-ascii?Q?XSrsiuw++qbXEutyXa8K+dYN+edK6yxzeupryqPULS2GvnYJFogvUgeBViHI?=
 =?us-ascii?Q?mTNge5c8enbis9RYe9o4cQuqe1rAApGAo7UMD8jQXlR4jCY6FJAUk/ufYn9X?=
 =?us-ascii?Q?66X1sKstLxs2006ydoxidAIV47dOp6+RT2PV/LCNFi+QhUtlVjXZhTYCFjtO?=
 =?us-ascii?Q?jD9Dw24p4/pEnDwqofnIv0R13KZa5IJxc2qgZ9PhtiafrVSc767iIjHPrTVc?=
 =?us-ascii?Q?w228kBwdPL20AhlgqKnM7ZkGdEybo9R20Kmu03e1vK5EjXB+VYbZCg5rKRlA?=
 =?us-ascii?Q?pBij6xzvcagGrKaFz0oq0AgdXxRNmqynKOXMrkJLymNNSOoONahNxp7rVipv?=
 =?us-ascii?Q?0q1V0Ihjyn2Yb4qWZ5Uh9b/cVXT/G6b85n4sNKyfMspwqDLUUfgKXJuJN13h?=
 =?us-ascii?Q?xk6rRt5ubC8bxR1pgg9wOeuTQfl0DoVLWjIhpMRX/PgVeeND1NSTPpes1K2N?=
 =?us-ascii?Q?Eo9Sruwzv3DDNMxisOYMnYe6jmLY56O7MKQR1dSr+pnDm/qW5P6OxD4ol4ag?=
 =?us-ascii?Q?KJTtLv0x+p7fmjSq91b+YGXdeNWHA17R34N31YUIf/dcuAGD+AbPSDTRZ5th?=
 =?us-ascii?Q?DSqCIY8UHeH3RZMXT9NOtwaO8g5IipzxPShGIse+adEfCBWDgi4h+//2jTPR?=
 =?us-ascii?Q?0HtMo5kSyHvxFVluzzJzjgTDjcgtj/PyYpTAMUm3QBehFiyuu1QVmvtT6KE7?=
 =?us-ascii?Q?DcMjqDivcz8gp6nCgs7Yk+wweGQ3dYbO35cWbe/2Pc+qbGE01r4oPfWnvKPx?=
 =?us-ascii?Q?IWP8+MIbMkoaXbLB4OyO1+p+rRs3Nqt6KJLntvqt+bk6wxVVJWUO+friR3kZ?=
 =?us-ascii?Q?+v2F6La2vwm8ckcBHrPw/crHLqIJ65FOLgTRx1Mk9MqO0vPe4DWBdjNcLgPX?=
 =?us-ascii?Q?GGzNOHcW8eo22fzjxuBKQoteLKItEi35J5gFJAu+hloLm9cMtqJ545XX70I2?=
 =?us-ascii?Q?5WXXPRP05MO89/ybBYz8ikE3zpEuyaWCx1oGh+vsiXCz0ZrcDUh3oFgNhvm3?=
 =?us-ascii?Q?O7MZxjpY7Vi5An3zTGQL1FBDXhh77wZROVG6enDfU6KxuOMFeRpdjU146Q7n?=
 =?us-ascii?Q?ztae0Gsbm+2u1apOSS6SduHQwr4MKgUfLvEGkeDlKzJno8rrn52cv9xXPerC?=
 =?us-ascii?Q?QyceC5j4PO0DLJFWWVZrg+suHazoU3YnxKOM2huPea1KT018tLxANWTG0SYG?=
 =?us-ascii?Q?gY1W9i6iD0jED0P3Q8zccmHVckXUYtRWk64NIXsIv1emD9eZyXvmmoVNViZz?=
 =?us-ascii?Q?kRurfn6t3US5QNogXwyRbcTvKPadPZ//6/xImy6HP+nO+TDVrZWw7EF+wonz?=
 =?us-ascii?Q?DZVIJFt0QZRL8natyizdr7TjLCFLJRMhr5kN9j8doqNZ690x19OCbu8O13i3?=
 =?us-ascii?Q?E8bySJaCWFuxbMyiV4MPprUDRu3/aDxHDe19RJOl?=
X-OriginatorOrg: softcom-int.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6ab645-367b-48b4-fe0e-08dbad2fc055
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB9598.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:14:40.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ce1a3326-3971-48f5-8355-5f76f4cfa286
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBTRnK9a/dPTKExG/I0kVPeLabUI05X6QBxBmz8LfwYc05EOOmlxL1doA3GSo/h5z/h3oj8gOXLBstRczSmboQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 10:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104706

From: =CE=92=CE=BF=CF=8D=CE=BB=CE=B3=CE=B1=CF=81=CE=B7 =CE=91=CE=B9=CE=BA=
=CE=B1=CF=84=CE=B5=CF=81=CE=AF=CE=BD=CE=B7 <aikaterini.voulgari@softcom-int=
.com>

rrdcached package is provided by rrdtool recipe. The build dependency in PA=
CKAGECONFIG is changed to rrdtool.
    The error was:
     Nothing PROVIDES 'rrdcached' but ../collectd_5.12.0.bb DEPENDS on or o=
therwise requires it). Close matches:
      rrdtool RPROVIDES rrdcached
    ERROR: Required build target 'collectd' has no buildable providers.
    Missing or unbuildable dependency chain was: ['collectd', 'rrdcached']

    With the patch, collectd builds with no errors and the final image I te=
sted includes collectd with rrdcached plugin.
    Tested on custom image with collectd_5.12.0.

Signed-off-by: =CE=92=CE=BF=CF=8D=CE=BB=CE=B3=CE=B1=CF=81=CE=B7 =CE=91=CE=
=B9=CE=BA=CE=B1=CF=84=CE=B5=CF=81=CE=AF=CE=BD=CE=B7 <aikaterini.voulgari@so=
ftcom-int.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe=
/recipes-extended/collectd/collectd_5.12.0.bb
index 5dc64588d..479c12d6a 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[libmnl] =3D "--with-libmnl,--without-libmnl=
,libmnl"
 PACKAGECONFIG[libatasmart] =3D "--with-libatasmart,--without-libatasmart,l=
ibatasmart"
 PACKAGECONFIG[ldap] =3D "--enable-openldap --with-libldap,--disable-openld=
ap --without-libldap, openldap"
 PACKAGECONFIG[rrdtool] =3D "--enable-rrdtool,--disable-rrdtool,rrdtool"
-PACKAGECONFIG[rrdcached] =3D "--enable-rrdcached,--disable-rrdcached,rrdca=
ched"
+PACKAGECONFIG[rrdcached] =3D "--enable-rrdcached,--disable-rrdcached,rrdto=
ol"
 PACKAGECONFIG[python] =3D "--enable-python,--disable-python"
=20
 EXTRA_OECONF =3D " \
--=20
2.34.1


