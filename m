Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FA5C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:42:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6776.1640014926902345947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Z4zfkiOD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=798806f43c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BKEBqlj002161
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wRkaaVHw7so31Cb/IxbVhbWFsz2QLjcJ0gaghdxdgZY=;
 b=Z4zfkiOD1mCuAEDIuJnNynRXoBp+DbM4h6yz0Hi2osc/d+UnXCIJql79IqI/bpaubl7a
 fsazzfuM+BwD7P6yiWPALvubzcrymAR+u1E6axVEkqyTtLOzvFR8YwA20moTUhTinJA/
 D5e//orvFlC+5fxO0Yt6EULC1gbCtqQvAhqheY2yRCGTONqQ1eoVrbLoWuj5iwKXLRs1
 LgiNQDKQh9RN9pE54QNxlFjU3hUy9+qmrsX/roqRLE7N84T+8iPYcD6z686KXbHg2dkA
 0lBxODVRk7Hh2LvFVD1OMOn87Q5mw4k7vFsnO8YDfNDpmmLTlMLc9cIzI2qpSAbY98OP 0Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2gb2rfyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEOE1MiIzXi2DZ1l/5UwtGHsipDM/CMnSSy7HjzxDMJPwMy39lnkiFLDj9mLbD1xj+6e/9QvKISvjyjOGoloJjTRqXYi/eazh9QpVYjVuwfRhHTemoCTBCpxysfh9EE+NcYkLqvar3/WY6FY5R3UQQrD9kqzwLBK9A5SUoPo+bVoSdSkO+1vtpcVxwh5Ew5w0/v2t5BOLPqP/PRr+nczSQuEU0S9qruI33oFT5a50IPf6UrYrkONvK88eztuMmc42MO7Zw3RW2GGJ5AptM5+yebgWtUR7YFbITHUdsx+JkrnyhjeZ166YQrN9c7Aoc2hZB3e0HZVaqD6dRSK5RRVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRkaaVHw7so31Cb/IxbVhbWFsz2QLjcJ0gaghdxdgZY=;
 b=QEVXTJPufhFEbtNTfBJuMRhnSlpgA9URkCl9TIo6fNdy07OyTJcPVjKiGjcVzPrf12jRFFBwnf9PGMviRDSdc4EkUpCkZCZkpCVtu9NX/cULGJayXoJTDF1GomihN7lC0f+QSmxIMTgMS0WiPPuKz3BGLU//y6PVQycKyVSnt3uurP4ugajUkeHkpzGqyPuiuW8dOl+UwXkul89FX69CahChjQ97cUmWKfTuzpyxPg9A5ZjbRi+pSMEQMQZLxbPd9NVKUNdZRvyutxUoxDzc2SNk5osrm6HakhKlq89MiDcuhz1+A67nRlKsv9Sk4ACfQApM2BjtL2TVGEwzDT44lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2144.namprd11.prod.outlook.com (2603:10b6:301:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 15:42:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:42:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.6.2 -> 3.6.3
Date: Mon, 20 Dec 2021 23:41:52 +0800
Message-Id: <20211220154152.65929-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0060.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa08f0a-0b96-497a-83c2-08d9c3cf4504
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2144:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2144275E0053D97F7F8B0372F97B9@MWHPR1101MB2144.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wKhG0vt5T8JyEiUMtBiIX9kTVk3jtd/LK95mX3mbOI46t30Ro9rzjro6BP2KbNrCVbpRfZnwqEr20YlIZcE7Vy/na3hDCIDTRL/Y9RZ2Edb3A+XJSiBEE3iAiwBxgs3AtRdgSoTJt1juW7CRy50h9O8OKRgl67vkmdWiSwKeTjXOfBkUJqFrGCtNlOHjXcapUewakXbmcJaQePLHbXa2rbkzONvXHe+Rovdqw3XH2pFkHOhgV0atKhHNw6LJYpoAy9A2yZkgoPnNNZofr62gKZHzPIwPsITdgpuZgTUDb6jy9ZP4G+FpGGC6Xk9C3gqip1LaF/dJNEzML6GM+huA0SWMsV5y4N6U10o28qpGKxHEDUN9UfnqNClZ04adRrfGV9L7LALYYwCEN8grv0mbc0CtLIjBQOJUg6ApfmTq8B27p815YsKXm+1UWY6gXSxvdgY4QcGTnx5RvWHkKdpwiafBERUkTd6ZD0qm4EjpSbKn6aNgVarGtzP5qzIxb/mEcWvtb/WMXSM5YLYtH8Dx/K0bpI1JJUDu+KlHdz24Y4mLyuCZjx9US8y99Q54+uw/4q786dyHF6lUsRC98WWnrcIgWQIhaIoUjkwX+4xcunDgb1puizmbweGJ1TJtY74DFNavSu7XwL7BtXhDQarfdJyf2PLgBV1P/DRhKymBDMHD0EGOv5qMBCeQIpU0Yd1gwPgDItm75Txkm19ww8De3BungL/zTFPfP+IDAmwFD9m8gi6o0TOFj51EJ8QXFP3tZWOZyJ2JoUcCYHesMn1ClQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8936002)(508600001)(6916009)(6666004)(6486002)(38350700002)(38100700002)(83380400001)(2616005)(186003)(966005)(1076003)(5660300002)(26005)(36756003)(44832011)(52116002)(6512007)(66556008)(2906002)(66946007)(6506007)(66476007)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QrnkEi+oS3q8RSitpxqRq8R6hx4IiTTJt/veOxdcwAruDQtuqcx+tz4FXyUd?=
 =?us-ascii?Q?fRlub8aA52plrRIQnquHppRXRyNWPUQR0s1LuFo6TCySPdQY8xafRzf6M07U?=
 =?us-ascii?Q?uws+26Dm7tsEbXmMrBb8+z2tpC24u23bf+g2a7V3qmdhCQ6pYrty+GNyYi4E?=
 =?us-ascii?Q?9gTRQQu7sc66bOp9WcaQnKMwM+izjZMVtBR68dBJYNmoob9EOB/68nOcwwGN?=
 =?us-ascii?Q?6wrCBEVq5F/dr2ozZMPEfjpYiMSRBxjXVRWoouiZ0EBqGnFWslsLcjAKqRCO?=
 =?us-ascii?Q?1kswNbtNpw2k3SEaJh9mRnugPUqZfmE0MjSbrscnzZJw/FjsR8uRk+Fk9LnZ?=
 =?us-ascii?Q?YHhAEPV7C/Z/owfmJyAR5+cLf4DoXaRP2G/Tx9diGnk02jV6ai9jg4FpLrcn?=
 =?us-ascii?Q?zfQoH3vIniFuGnknm4UhIiXZ9nROy1kUKPhtHxeIx7OqeCs7X1dUYOt7LaG6?=
 =?us-ascii?Q?g3SM/p2O2SYTVnqYoUY3gjp9xQKVOAMkHFEUqGKOZhv2jEED0xHnk6c9Dw2S?=
 =?us-ascii?Q?e0pqOyxxKMcD+aPjJuNC/kC+0ssxe4kkxHflVh+fHnIyS8t9S15P2ioAfqhS?=
 =?us-ascii?Q?hexBigmBqDRNSAy9A7zS5rRtLjZ7z2xe+jPJm8y7gRxvjqmOXZ2CLDZwEeAe?=
 =?us-ascii?Q?5AS+xkzD55zqu/NlQOn8nsSBKlT8rXvL2zcB/wlgQSrJ4/4yBmWsfER3iOKl?=
 =?us-ascii?Q?tLXQP0ks2Gf6t3qUmkQuOLwjEZ3rSXX6naQ+up76u/8MppoN4RU1GbTbh6vT?=
 =?us-ascii?Q?bdOt9n9jYVFA68K32DT+i961ECVGv6wfUopuPQZEaLtwRhlLgrw9R3LZ+tAq?=
 =?us-ascii?Q?LTdhq6+QFN/pWjo/kdV29pKjBcfrArjgZLxx4EOF23dwQLegn4wCiueiA3kH?=
 =?us-ascii?Q?a0EWOaA10MuTDt741TYRKv00ypshnfeb78e/ZqJ1U5YW7nYQHwjyjou0QtRx?=
 =?us-ascii?Q?Hc3J85bwni41SP+Xd9T4Baq+1LtShkLXuHWXYhall4wi3ZzSsGnEYHiplnu0?=
 =?us-ascii?Q?r5sPpp3a6OuO20dogFbtRtWTZLwJTuCFa4hOs8L5hYJMK7GM4cnPCop6y+dK?=
 =?us-ascii?Q?OSQixId05RyO33FgpExvbbKkLKOlCAHs+yj7mHa6+FgIs00ExAOq8t/vUPl0?=
 =?us-ascii?Q?52CR83gEMhn8rHEW0AmH38VUqkB7nO14AKaU6q0K+P4OsDVrxReOIcVG5pKf?=
 =?us-ascii?Q?6qAwrnpa4SvDbb27C9YuPAHK4LvPtfkBmRJTNNuxoai5xwTBJaKjGqAmx3jQ?=
 =?us-ascii?Q?V/rji4OD5HyGISsDH+mkbScCCBmj3BHZye11Ecc20WMYYW57IIC7cR6B805K?=
 =?us-ascii?Q?F8KN2XDXObu1/srRwAn1wKiHUt6bUD1NiLjywWX3ubaKbvnAZ5eeDt9dOw8v?=
 =?us-ascii?Q?GfOYg7IhCfXohdBWdIFZQBFi9PUGnMoWf8Qw31prrhlZXNtbEskq3b7wqwUt?=
 =?us-ascii?Q?4AJFg0cUrksH23Ymthonnxd61o7QHNyJ5+DwbVsoiCuo4w/w9zTB66R9xYtm?=
 =?us-ascii?Q?MOK6EG9fIkGf5BFAUn2FhztwWtZcVXgap7VExUUzAI8q4564mCMzSBx1lqM/?=
 =?us-ascii?Q?phvq/Qkv3/XsWIBrszDtQeoBvlfR2TgCr5DvVJ1MjI6pfcfgoguH6XJo2HaH?=
 =?us-ascii?Q?9B3rEmwAaunTmrwLTj4eQfQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 efa08f0a-0b96-497a-83c2-08d9c3cf4504
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 15:42:03.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IOeJ4bmIYtmZvRXWXs6lcHk8O3AHRMjpe5gohBCJruaoYfd4L/YWL+zcScvb1x6Hg+EVzdHnxq9SXeY5MnAAJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2144
X-Proofpoint-ORIG-GUID: CNXFwyNQwIs24Kmp_YqqGZWsStv4YoAg
X-Proofpoint-GUID: CNXFwyNQwIs24Kmp_YqqGZWsStv4YoAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_06,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=831
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:42:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94455

Release Notes:
http://www.postfix.org/announcements/postfix-3.6.3.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.6.2.bb => postfix_3.6.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.2.bb => postfix_3.6.3.bb} (89%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
similarity index 89%
rename from meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
index 982544d5c..98005797d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0007-correct-signature-of-closefrom-API.patch \
            "
-SRC_URI[sha256sum] = "507323d20d7b3f705f49cf8c07d437c6d8090bed07e15a3c0ec405edad54a7d4"
+SRC_URI[sha256sum] = "0f1241d456a0158e0c418abf62c52c2ff83f8f1dcf2fbdd4c40765b67789b1bc"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1


