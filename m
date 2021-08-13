Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.32681.1628829756188840063
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 21:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cpaJer3i;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38595f8eb2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17D4gZgS012241
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 04:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=KcwsBJaevMcfiT+2HPIZRdNmnBvskesH+x4jYgdpqYo=;
 b=cpaJer3iM/Yxkt3qGgtPqAlcGbZFuN6qIz6besTBVjq8+RDl7oIjT1Oxvl3EsZrrz+h4
 XnNHSzi5vYsmWXtHb2qlbJVbEbfXjUxmn2wFLkXV8wJCzSdz8tLT7GrMYI5uDDJtJ93E
 sUIANiUwqGMOvwDGKzJb35cDHwMEjyVHAk6R2UgUkUZpaFNfMNo27qapJepTJf8BaXLS
 0LkDoFCHJRkvYSrS5IZEmjVPdHKTZujMFnS/QSUlJ2HPrIGFkRsIhFvxyrfLTdtNbD3b
 Vba9M2HZ9GlJB0x0A0NQF7ImjcYuDT9G2fBnHmMa5AAr3fX/7e4Ob1CCq0WbHOMUSDqZ qQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acra610v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 04:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWibqSZZ0xu1rJ917QpHWUzj7kFnC+M9XbA7QTCNWClzYj4bP28hoWm9F2bK8UbjsQJt75ABd/HAM0i0ZXTklSXWSVgBX04PYwsu1wJMR+1CCwrJtMCZkkmMlNY/GSSXoHhC7JLEaO3tTUCL+Vi29dwlH1opbyVM0usuz1vC8psk8zIKdSOR5CrrYC0G/kkVKo2FXZ9sRDJeScb9n1FF3mwJbaZiyosHNK3r5J3fVEpyhR1p7SKWQ/eTEpgTrAGlEbvK3Wa564GRxpD95yVta7s7MyCcq3FGAmqARnjFm5qYIHbaHQubQY7CG4SVy7RhwWAlbDpAk3FgTUsH9hgU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcwsBJaevMcfiT+2HPIZRdNmnBvskesH+x4jYgdpqYo=;
 b=WUy8o3aW0VgrzzN1dPZgx7oSVjdx4WarMTRg6BQoHUeNthu1HAg71mqyKcr62/7WjvF6AlWFjQmWHS2e3k5edxtBL7SnyFSkPXvJC5SYVIDBj3DSLcsGjMAN20C2gvrw1pD0Y16Kv8DtK/zZ6AA97/7fHGH5pqotaAShwpGDT0c68Hyr5/E4nxjO7E07bEKfL7Y8RvUwBOdlogn0nIYyoFsOD3Osz6bAHmM8PLfsNHMQbhYhBJIzaW9xwEZBGFCjfggw+nURcgAvmZ0TX531lb9HvUxb7KMGW4pNZFCQqs4Ct5Zp5PMs1nUEPaiFG8apk2lmBi/jdW6XoucxjVxwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Fri, 13 Aug
 2021 04:42:34 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Fri, 13 Aug 2021
 04:42:34 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] network-manager-applet: add selinux to PACKAGECONFIG if enable selinux distro feature
Date: Fri, 13 Aug 2021 12:42:13 +0800
Message-Id: <20210813044213.125664-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813044213.125664-1-yi.zhao@windriver.com>
References: <20210813044213.125664-1-yi.zhao@windriver.com>
X-ClientProxiedBy: YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19 via Frontend Transport; Fri, 13 Aug 2021 04:42:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f00a054-3384-4423-cc09-08d95e14c459
X-MS-TrafficTypeDiagnostic: MWHPR11MB0048:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB00488B19A9A3EDA24F1BBD72F9FA9@MWHPR11MB0048.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a31ZVjYbZCuFxWlkjJQr+oYUEQUfpIJjSBuPbNmOTzgNKfA9Uz9XqhoCCxKQB+XO43WA/ASYLJIDm/6UesGc3Jd515j6K5pmykgx9Zd7miUKqM44H2ehUjjuxxLeMP/MzhRePhmxkuFkCV8k8JM1S04tHJxW6WVclkksOB2siTW6chk9EMkrNXY2zJ39SLLYOwFeWRLz5HYTDyg0ICPLMlqJGvxq7A+t/xpjeWdSjPAF5hY4geRF8DOJ37nuuU9ab2TsqJW/1YmW9iB2UkodYIi6NYCNFLNmG+PItKxwgqm2LFslgh6P9rbu48gYUtR+w0b8MT6ylHOogcuG+Zu4xtLqEYdJTPSEQhD6tKXDLr3yVJjZUacp+sJr+8/Ddxxv7gJ0uYBBoThcMAVfUKbwc/fc9nSyO98DnvbjlGu6Gjd1Ot4N2Y3/ukDzFpA1/UJfQ6FfrkDzTuPhj91to08CgaPpCzp3MJqDntQOaOE1z4swFCGj9BWDgxlCbhUbi+lddHHgqYeK1osH4kA/HqeXPihYPv98IWFAfYpGffXjWHDMknVNGOJA/RAi6TvWtLk3gWcWpyod2tin6ZIPJap0xR/9t+/D35Xjj2Dj1N8YGmfo1heSayCXcY+dnXDwjUcOU6eOzfKdn9iO5jhMseeH+vfwWpJTWTyAqeDXet+HA6rFyz2ZScqY1Axp0aN7duX+kkHk835yy/HG0E5Jyn3TjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6666004)(66946007)(52116002)(66556008)(8676002)(6512007)(6506007)(66476007)(26005)(83380400001)(2616005)(2906002)(44832011)(86362001)(36756003)(508600001)(38100700002)(38350700002)(6486002)(316002)(4744005)(1076003)(6916009)(8936002)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SW4g+ZSqnxTcLyeR5fmIF38FY0BcpaU56tPN9bPPikPAoxG7D5dxiAHbcrar?=
 =?us-ascii?Q?2OHyxlw9/o9d0VU1JFuA7rIwgmBPCYTwx4oqGrAzKqAg6Kfvp/njRMNGkGUb?=
 =?us-ascii?Q?Fh1MjC/m9xWqbx1eStNnYHPHak4AJHJvPyK9PlEb7COxe1dRwDLJbrwYZ06d?=
 =?us-ascii?Q?9TdC0YsaYwwSgUbzK+wnzmQWIINmXNoQCZ4jJ9QcpqmqCDI3m13wda0VJdHi?=
 =?us-ascii?Q?gSHfxwP1Lb8GyqLbRmHj5zFyzq+44AFkX5JumbHzTlr2XH189Wp8wGhuk2d+?=
 =?us-ascii?Q?kkmETit+f5VxpUT1pVBK0ZUzlLL0KqRewvL30iXA2fn/ZnLJBPwVEE3jG0Kh?=
 =?us-ascii?Q?YY8qloEgGdTVzjjUxUqhG9fJ5laOwODpCD8yEMCVVCdXoPzhsztBPyYvmqBp?=
 =?us-ascii?Q?T9em3/nVXT6Ua9X0PMDorSpDwRehFBIvcGfiqMAK7vNtTkuyKiZ9kpn7qvNE?=
 =?us-ascii?Q?4SJzfysF4XSs+y87pIuLqQ7jis9RKh5PIWqzFVSM0I3cO8BmcgkrNxcQQOZw?=
 =?us-ascii?Q?dfOCF8NjmFLjMwaLOecRM/hXsW50TDX/V3Fqzp5RrSNrRAZA3Oxl9FSslDSa?=
 =?us-ascii?Q?YsQCQLauleYXv0bezB3w2F8X0fyJwR9KAXjnQL7DM0fk2+a21PyHxU9bPDAe?=
 =?us-ascii?Q?xcaBXrZKESSGFrDGHLqei/xjq74e6TYSHPYk4rYZx4VgEUNkIh64kV5i6I7d?=
 =?us-ascii?Q?Gwrbo/dqMR91/fY0n/qLe9qXyujKbK5FM24ueJThhO+XpT7p5isTgbgVk/7A?=
 =?us-ascii?Q?wvw9MmrDxuJVc56BX7YnGe7pFX6lP1Bg2t49XPzU1iuK+S919ZnGwcLZUt3t?=
 =?us-ascii?Q?yDsPBdZXMs28fG0m+K5X7ZXgLte0P4Y5bTqQzUOuyYgBheSFeO6LpvPZ9f1q?=
 =?us-ascii?Q?ytCJxb/yB6Co4EbU+66m9h6m8VvpX3t19vuDzpLvnD5wYio6NEFCgPlZWZCO?=
 =?us-ascii?Q?kKFJ/jGPpWn3bQkgPkLpZ3F1DeN8n+HSXtieXqETekIQhndWbL841alY8gx9?=
 =?us-ascii?Q?2Tx7+LGb410mTGG13ZYoMbrNEFYWISqyvCQZq6KoX1IlZ03cJmGJuY6Ei9R/?=
 =?us-ascii?Q?KtCub+X5FvssSmAU0cYtaeokXLoJY0VkBUQmUi6tWmn7oMYtShhP1Y8CLZ1V?=
 =?us-ascii?Q?6QOERhTdy9NWA3V50B4EEyst4Pk0BNPBmp/fzAYOZ+rLDYtU9USCrhksMG+c?=
 =?us-ascii?Q?a22OnNYmzU1pDK1kwwZWb1WskK3ftoSNsr8g2PIiQctvvjp8XPth1jqddOXD?=
 =?us-ascii?Q?G4G/tssYkRfkX6Qi1b0CObpnIJ2SGdZBx+GFFDbvK0YngqJWaZJoti22x6Ar?=
 =?us-ascii?Q?YqUJeP0KtHPFeJD6ot+++9mx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f00a054-3384-4423-cc09-08d95e14c459
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 04:42:33.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7EvlLsg/4+M5gk2NqgsdQXekjrYbpvV70zNXa9ypX6KizIZc8Fg2kmWrrsuwKFDbUXI+NsltzhDqCNKsf4vAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-Proofpoint-ORIG-GUID: A1qse-DGkpBexIWipQmus-lu8juk7Pi-
X-Proofpoint-GUID: A1qse-DGkpBexIWipQmus-lu8juk7Pi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-13_01,2021-08-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=996 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130028
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.22.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
index 28d95d442..cef7c7569 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
@@ -16,7 +16,7 @@ EXTRA_OEMESON = "-Dappindicator=no"
 # We currently don't build NetworkManager with libteamdctl support
 EXTRA_OEMESON += "-Dteam=false"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
 PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
 
-- 
2.25.1

