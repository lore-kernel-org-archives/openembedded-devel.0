Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F51C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 13:05:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.82809.1675775115943964064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 05:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qpS6JO6C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1402ddce76=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317CQqO5018342
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Feb 2023 13:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ux+WLW5U7mbiAM60DSrrhp1RuuUqY8bE6fsCCJWAwMU=;
 b=qpS6JO6Ccx6Pr/MSclp6HXEMjRT5FVcL8o2ER7mFy5TKHLBIMDdW5tMlnd+bJqBy0Jlz
 If6ee9nMeijrXdomdGisJYiqg9Rdq+tsociYIc8XTTrJioNJP0tmZypfzozzYJeeHiDt
 i5uegPBDDLVWLhc3Fo84eK+rKG1xvv/NoJmyrrrDqnDIcfPfo4ZvnHVI2GpE4PSxjfJ0
 sfhJkzMeLpe1pAXIqocHkEsJU/a0Wd7scTs+8oQJRr6DzWCb8YKFmTpQLXzFhgC3IYeZ
 sdjX+wFHAMhuu50DwBzpibBP9NCYJlLBMPlVr5+69Fj7VEMgNc9FXCe4E29k39GiJNG9 3Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck32w8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 13:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmpiDq3PAK4xVQy0wGbHXJqUuUhDPfqz0O4nDyA9HRxC87kF4MunZQiGgwpKCRD2ZVeG7UvJjwNwMESMI8QAbvJbFmHXD4HJJ81VV/3BCkJg9uWBNB+bffWl3RMdJK2kYvQVYcGcNEvA4tMV5HLKNFEoOClR103tw6kGlE/6hk2fdi6Rq0paBJ9BncC0FVltpv7hq+OqJ2yj6gO5p5Ik4TM1sEwD/hTDd4/Gom/ZolRgQrnkUVcpc/AJgaimmtyHp73y+692gxJ2tvSe9tnf5KpYnXj6C/qhEiZfPWuohFMlWrzGQiX94H++NAqxsOunaWALDahFu00YL2LpHClpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux+WLW5U7mbiAM60DSrrhp1RuuUqY8bE6fsCCJWAwMU=;
 b=O+qPO8PUpyCAjvo9RoNC1as9oXSarcNuJYqqBQwosZJvgDlaGBWH5oLw8zXobik6+zl10/jDmYAMeOhKhnQM+Cgub072WvvShsuEO2USrqL7ppIlTRquGBPW0ruEO4Y5+fPhiAgWVSBF7/eU6c4TmvHn4QMzQnKSVySHT/ySqfiWyiFnZSUxQJPsmnq31mKEkMPi9YIR986iDAY7LxO8cPlNhttw2HfdmHhdQw5MobTYo8H3hWwpEqJpsFIOin7Aj5tWrzCTimVcIMYUk2rq+9oQDZnntEtAdg5KzJsJVhLjdHWXTEeIY6d0SfqYtK8Wi/GsLVN3qAPBlvo8+QxvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 13:05:12 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 13:05:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 8.4.1 -> 8.4.2
Date: Tue,  7 Feb 2023 21:05:02 +0800
Message-Id: <20230207130502.2380601-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4979ba65-4a79-439a-5bd3-08db090bf24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dYR6xnCzbrY5bBNVnfYHORmDrSa6erLNrZqm85eEaep7ZRjdlJgsRWALYU2Uv6oMD2DfF7+6iIB6T8OSAOLJ+YJ1Lya4Llu5XniJOwb4grfqVfgRgN0s8rTyhH08Wp89dqIPyjGsN07Tk9VRaZB0IJO7h3z9L5eo4uFpWWAZK6MJk+uglor7wOACFKG9LnyKaJV+sQLVEBSJmLGz7ld6zLrI9ENaipV39O77odAff1E9+ZnjQcuVkyl23b5ugP/uecVWhJ75FD51UV1iAZPPiHwduFjf5MOxUYWkaaBO1gcqjT399Fq46mqSE/wXsQvsmb4lIVVmdCXjFidHttXO1SnHh8m4SU6fG3cLtum2ggiDUcwTq3bvNYW8AeeCEnbtBHlb409n2iL040WCUjmsP6wU7W4p6aKaYBX+n5HKZZls9dnnSUylTY7LkrbDWVsWm+h/fmkraGZBiywnlFQP2wH+rpuuC0VjZArwOnxsTNHTE2R6aobBxguhqo94mrLp4fl3B5INFAbhGpGQ22SN0g+IBzPTcNSqH60rs3g5xGXJo7MahsNGuArwqqWNMXZs4eHrn+BJbTiEgQCcpwk6R3fQW82wrVigVRy+2CY1ld9QFVbjGfyLUP/3gn2uXy/se5oJvxFjosdxruT2jWgRKYI4s78fVVHkuYrPsbhtsmItpa5HiGX3NtYOWi5nz05AHiSYi4qkBE1fOepWGcgJ/QM1yVPwEwzQnm5RoqXn+g11rFGHmq73xdhM+N4K/MEZC/wkHVMThBl9AeKEeps5Iw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(451199018)(478600001)(186003)(26005)(6512007)(6486002)(52116002)(2906002)(36756003)(38100700002)(38350700002)(316002)(1076003)(83380400001)(6916009)(44832011)(66946007)(66556008)(6506007)(966005)(2616005)(66476007)(6666004)(8936002)(41300700001)(8676002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u2J4E1Qei/7MZL2nkr6sPb+DGH92j2Fl6y7fnmb9G5RFszFRz0Y0R9dACAF+?=
 =?us-ascii?Q?Hx2LmRqhumdllGCoiilwQFCyvjvwYq+e9Pv9G+DwKLpo1z4XH0oyfhkkfdtF?=
 =?us-ascii?Q?2iuU/h1bDwm5ZrCIrBgFmUdzB/+QI+s3fNc/XSn1laS8Y4vQeGI34IR33+jH?=
 =?us-ascii?Q?TzDhF9sZvGJxtJEzPKDoXVTxJtU7DPvCvqeYfnva3nLVyuInq4aQq3JL8aIt?=
 =?us-ascii?Q?5eRRZuzUgmDKqh+h1Pzr/GpvoC8yOxqw0Ukyr2pSJtT0XXsEEHmCbBvuE3QU?=
 =?us-ascii?Q?sq3qgUFDErIBOodQFvHe1NtgYIGv+dlYDX2cuZtrDZe4pkY0vTe295LJnOju?=
 =?us-ascii?Q?WZpySMTuPd7WXbhDnJ+QxyDqQ1AeVijzuMOo4ul3MPh3yGbxkDWnZByfiGAe?=
 =?us-ascii?Q?Tv8pUufQ/6US2mqLMriuAG1dIDVRjUxbSKnvsmg8Z6Bn36R2pANUm1l8XC+C?=
 =?us-ascii?Q?BFNiG2eJBguqr9rM+9IE6YUhhTZ2GXXiXokgWrqFpM4qzJ3XIwZyNHStgTGC?=
 =?us-ascii?Q?NW8jpXRmkwSFlES7hKFilQRmVSsczM245L6gGKRKCLYBsFVQJMp0abFJ7/tg?=
 =?us-ascii?Q?yKnrl15fBVNwhqlZdgNiGa1nUwlCR62mWAg6abiswMJKsWvqIJgjn0mn6xoU?=
 =?us-ascii?Q?+IcWkv+pmEP6O4D5CGK/yGXyaNc1x95qr1kcNkEAXJHLeYWFYuhG55rVv1oU?=
 =?us-ascii?Q?DW1AFa2Ke+FvhnzKwYniZgePcRXht+3mqzCBXKXFCtvsaQHoIP9lAo45y7M/?=
 =?us-ascii?Q?TbTiB61Syedqh+AnoZpDdQUeZqhxiizw3BDX2OM3RKYgyDvj9guzaNoScfVg?=
 =?us-ascii?Q?GZA1rYPTlXcKbaOxF8RWUmVQaVZ72F1k1KgxmEFC7jAofa9DS44p+5oN6A4N?=
 =?us-ascii?Q?vTdvw/4AlEZal+nLrmTtG3AAV1nGAUlEgfO+rQJLQNUa+8XkgSv6VruBGcTz?=
 =?us-ascii?Q?4Exz39XvWH9aWUwRDkwV2UaQUO3BWrQzWAPxGPQ/6GFgj0Cj1ooeSRQeBSmm?=
 =?us-ascii?Q?6AEFl082kvd2CAXM6mdHpqIrXEGZobaFBk8VwusER0Ae/MME+bsI/qR7I/5V?=
 =?us-ascii?Q?3JdZCpTTJF8QDeI3zuCN7hVIp7hZE+BSBvxMgo5sE/YSIFrKzusCzKo21yU6?=
 =?us-ascii?Q?M1OzmuDizAzQllN6ObIho24p+qj3tSFkGBEYHZBDaJvPF0vAgGSZIpePHAPv?=
 =?us-ascii?Q?2yH5OREW/OjwSCGKIwJALf4AyQtQja7GpTUHOCkB0mi+juuhevG3tyifSs8e?=
 =?us-ascii?Q?heypzHkuKVguwVnPAr7EV/wsVHE8szDbrMaSCgoMKNSmkXJYosEwKmAIWN37?=
 =?us-ascii?Q?KLSoCXYkZKDG106fYG9Byz4wa93U9L6B/Tz5nCMX06U4t9CEYDu8z3t9ftA0?=
 =?us-ascii?Q?Gt96lkH9eiFX9r5YcjrZIuqE0EUfUqGIaBeYguWS/qFrP9TpUhEXW6WLw2OO?=
 =?us-ascii?Q?DRc4JDpJBZGyVzRzMHAV179XN2mfljNmKMdw7ERAZ7cEzMomaPUHg/3FZtDj?=
 =?us-ascii?Q?MT3vgpM3IBu9JkgUWkrW0/G4GP3I+j3373aBryMT4oQ+X6AnEQD/Uu0a+Oe5?=
 =?us-ascii?Q?jWqkJOwSn7RzP08Qhldfl3lCiUWHpdqwwnVrZOj6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4979ba65-4a79-439a-5bd3-08db090bf24b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 13:05:12.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrfQcHlPKU7GJHWqeKyhqr+F12FbV+7S1hu1aK9jr0cjQ4zXiF//EMWjY1CPKmAKaXDacJIJGnaG/WlHGVxz5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
X-Proofpoint-ORIG-GUID: vKARjwfE19O0bQVN5lGUVe6WupSc06AH
X-Proofpoint-GUID: vKARjwfE19O0bQVN5lGUVe6WupSc06AH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_05,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 13:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100961

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-8.4.2

Per [1], update frr.pam to eliminate the warning issued by pam:
vtysh[485]: pam_warn(frr:account): function=[pam_sm_acct_mgmt] flags=0
service=[frr] terminal=[<unknown>] user=[root] ruser=[<unknown>] rhost=[<unknown>]

[1] https://github.com/FRRouting/frr/commit/6031b8a3224cde14fd1df6e60855310f97942ff9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr/frr.pam               | 1 +
 .../recipes-protocols/frr/{frr_8.4.1.bb => frr_8.4.2.bb}        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_8.4.1.bb => frr_8.4.2.bb} (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
index 83c403c2b..a9ec35dd6 100644
--- a/meta-networking/recipes-protocols/frr/frr/frr.pam
+++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
@@ -5,6 +5,7 @@
 # This allows root to change user infomation without being
 # prompted for a password
 auth		sufficient	pam_rootok.so
+account		sufficient	pam_rootok.so
 
 # The standard Unix authentication modules, used with
 # NIS (man nsswitch) as well as normal /etc/passwd and
diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.1.bb b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_8.4.1.bb
rename to meta-networking/recipes-protocols/frr/frr_8.4.2.bb
index d3c86e7d7..2cbcbb3ce 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
            "
 
-SRCREV = "70151e264bbb697a10fed711aa8c937d4f0009b1"
+SRCREV = "62ac43de9f3bc470586cf4f51fadf013bf542b32"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


