Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.10582.1630436015204897892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Aug 2021 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ei2078kD;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4877e94da6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17VHWYKH018381
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Aug 2021 11:53:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=BxJyRxhBbZsSTkhG73JoE37d7HyMUxATHunfpV64Ky8=;
 b=Ei2078kDAEA46RksLQlyKtEM3b8GqRxUdCyK0iMVuWE+7CDk0ffDK6flbg3IEeIa8vvi
 MNOic9AQciXl9UYjBPaWy8fO/jaTS0YJG95bBUdNqJOZbBaqRG6YUvrP2MSMHCwWxnmQ
 S92QbfLuLBhy3jPeC/xiCQJmuAmnw8LZtXtqA9b+/8faRG1VB60edtspnPjkZjcywDjB
 wPV43PNU2K1TwQZgZ9gNWG4cp4IwnsprcUwQrQf0ibtZIcd3sW+dKW8KPth6QpMGQq/F
 5NIVWNANncPmEtEXB+X43bGMFctLX7Lv3cD6diwyKInvS1+6TFQIN0CdiLpeuyMcISGg 3Q== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3asbdjrjtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Aug 2021 11:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncn/EEq1ycNqD8RpnEtlkC9Ldkr1pwLcMvxQvnu9QEKGQqJhhtmJHIm/EL6cG9vB1jydPlH44nmdeswW192Vu51/0qvRtDRVRKPJtGcWZ3vSwcdPjG+hFJnqHCEzEB5VTJ8lNkOnXZZU4Ub7ohTyIi73NH6JTPd/bQ7xuAZO+fhmKwYTAaH/Mj9VzQxo6TNpliIAUAtGZxsUOdD1WX9LaGflgCV0V2/JOdaTHzjhefouIgdh3ykXDaVSMItRXFgVgbKGo6NCfIredmEUkoW9jznLT+Fj8p1mpnXzJVT3NqYeF48JsUEp+cehkJ+vKBNmN8IHstzO88X56svRimSUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxJyRxhBbZsSTkhG73JoE37d7HyMUxATHunfpV64Ky8=;
 b=X95TjpGDzEVHoQKlbO3qjolZZz4THuXb1LGUHSNI5AT9k3fH9VpuPr+4YDF0ac99eplLFv+2E9c3G7aHAyktxuzifkSM+EgkztX5aU1WHxD5hlRmDELY8nGkfvWzQ0XvvugtN8A+yQgR6oPOScP90cCTdK15PqgJcxXSutMevWIjSBK8nhDlcfnJwkjgQT0LYQWsQ+wmUbdXMLl+5SpG9DER6d23ROp2iUMIEWdH/Pz+EWMvp7dOMR3I2uzTeu+6I+elzzJZzUTR535dM5hOkGITQZmHW/M5mApDtdGT/tMOQ9Q77QZGvZMA219WzJ8j2O4BJce+vyYgvQvuWdlwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3399.namprd11.prod.outlook.com (2603:10b6:a03:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 18:53:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 18:53:31 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nftables: upgrade 0.9.9 -> 1.0.0
Date: Tue, 31 Aug 2021 14:53:02 -0400
Message-Id: <20210831185302.746713-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BL1PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL1PR13CA0151.namprd13.prod.outlook.com (2603:10b6:208:2bd::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14 via Frontend Transport; Tue, 31 Aug 2021 18:53:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f399257a-e023-4b8a-8574-08d96cb0a067
X-MS-TrafficTypeDiagnostic: BYAPR11MB3399:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3399A26640A4FFAF294E18249FCC9@BYAPR11MB3399.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eaRQzBYG3f59xacKIr3fl/GCB7/XsDU6EUJyY4U9KgWIOXKP46XDFPeEOSdRAlzXkjqTYtEbWKw/AoGFdrz7ITaRdyM9JM8JCQGrVnR3qg6wr/Ig+Txh1AsoJTLgdduAYnMtCBI2WgtpFaRlpWsvfMqpqFnEotv3v9+kRhmoM3OadjmyVpUYuCCPPkxKLRjDvRz7D+CGvlLUi/LmhURDj0JrIRLVFbpKe+aojwES1VtIggi/qso5mBM+TgSusBW9d6nWe5P8+mExTmpgoJmr9ZozL0DeZEf8zbHW3fAfyz9HT2HQJ5xNPtzE5LBN9pqZjp0o2k2blrkxxAN++KKgig/0TKghtK42FLhMx3rmplQ6SCd4JBXIz3pILc0Qr6rljg0bjiIbvcTumHYBIY9n3aPx0nP8Bt9Ei/dpYztKMwDW9Wo7SrEti4UzuTeDicWJFfJBYKqhoHtJhkncnMhjLZZga6xYP4jRH6T/6UYz4N7okuEwx6M1HxyKWrLcoZr696gpqD7+bHPiaVRIS+5U8Vrzj2KLQdtjsCY3bicbPmu41I+DhAWjAN6gasvme4cf0jsSDWDyrF2Pv+OS91BW9KU5bIkAdcPjwPI4LnVB8WR6ueq28lqo9BdqXuRUsneD/2wqoB+NE8G6oCIvPhx+EgADKvKu6umCtE8HQy9ln4jPhYiKSm7TQLGu2rzec2wbrbVIh+sqNSu0Jegtaf6E9260Q9QyjcGZJzj70JD5uw0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(316002)(66556008)(1076003)(52116002)(83380400001)(2906002)(2616005)(66946007)(8936002)(66476007)(186003)(6506007)(5660300002)(6916009)(44832011)(36756003)(86362001)(6666004)(38100700002)(8676002)(6486002)(478600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uwL5LVWXGI/0PMALdBcWW+1kIyxD5YZvBK3ak+N5WiGo+X7dqh8sEva0/JMj?=
 =?us-ascii?Q?sDi5/h1lFq5i3CHN3fFTW8TEZOzFX6LpCBTlOBK0tvGLhm7oObapAdf/ztP7?=
 =?us-ascii?Q?F0mU7afw+U7wC1QGEtCBIJkQ4ln/9P3MsfSpwnZ+VsfsMbdhr1prT+Xu003s?=
 =?us-ascii?Q?WUZgdTytPt+IH17whuX01i2Luds/USBU8c7+42kZa+3YepKbTQr11jcRXZhL?=
 =?us-ascii?Q?BsFyItrPzxoILaIw4EOZCAJZrVA4kncluiGKfqEAs4OJZ0bUbANAvKdZcYCH?=
 =?us-ascii?Q?3N1TAeUfWORnHRyAmjSAtRJpG4Sn87hcTYPRiOAGnzB2ow0e9xeUZf/QgP/4?=
 =?us-ascii?Q?ghkpmiVhfP2vSFyK9+PQsoec3wHIRLPAJwvnkyd7ROGROx0nbbBYNqvRUaic?=
 =?us-ascii?Q?aJyOxbCUC9t2fz8xepxnnRpy9NQAMiYGAEQiVASV6NkH8CHUIei5hC7RNbom?=
 =?us-ascii?Q?0HG1cp2xupLN9JKV+yJjMUgWpVusdW7rESTHRKyZUlkDU5WDsjuNy4/UgHEL?=
 =?us-ascii?Q?1rgr8ATjwdHrBwZ2XAaVxxNjETAhEido9lhwN9E1hr1k1T882VhJwU1A1Pzf?=
 =?us-ascii?Q?RLzhTw6OzAsWrAIPYOhZH09Kc7RTb35UACayZEyW50e0dMRAalUw1tqKc96d?=
 =?us-ascii?Q?zaCm2sHqTPuQX0k43s+UAGmWj8yy0xhG/kpzsmUt754YtVLmqm1QbAGeS12o?=
 =?us-ascii?Q?3BhOiiaG8DlCunBLydzPpHqx2yDrkiNnJD3MGUxe6BwUvsjc4LeSTjGTbtUk?=
 =?us-ascii?Q?Jn5HGVPyuVcgOHiR+cH+9SOUMwJCacIzracGjujAttUZL/bvtS/5xv8GRPjN?=
 =?us-ascii?Q?NFrwpPknQAFCBEQMxpapkyM2anmXsQRJ9pzetyGIncltVgiOU0C9rqjUZ2Vt?=
 =?us-ascii?Q?TismxBfOntyOoocLZQyYzUtX3KqWDVDG1eDlGhDiLiCsJWMVnPvfMZ7n+4YQ?=
 =?us-ascii?Q?9JhIJmhmXRhWVU8Nh6EwRlVSaLHGiGlxj2WOzHqK/7buD3f4O+TZscJW2lp6?=
 =?us-ascii?Q?I9aLNrU3JmYjpm2wUPVDjJAOCM1uGEGFZb06Ox+PIKjZecD0LZZT5LDqY+Gy?=
 =?us-ascii?Q?4SF/pgs/pEBFD5d28NCluAHvbQCeC89iLF7XVUNrypHthnI6bvNLs28uIVJH?=
 =?us-ascii?Q?v+x+xTnXVK5khzzSLqcirKLG1uDd84gBMU+mMzbwum/OnuoWOcy93JBz4zQ0?=
 =?us-ascii?Q?EUaipuUcpAdT5bMyB5s/0nwhutfEq8JHE6J9ttJIRzuRSk9Up15JYEKcvSKH?=
 =?us-ascii?Q?ztecTCUKsFnUSjwu/nOZbaLtdt54l4TpT+hGEPn/b8wIoc9RLWhvQPkO16z0?=
 =?us-ascii?Q?dsbChEJUIfLbHR7nhiJCxP7R2rdtvB5HExKJaw8Y7BYUkoBq6cm0DmovlpBS?=
 =?us-ascii?Q?HfgXJYLtaD3f6WHiXcTt7215V7SW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f399257a-e023-4b8a-8574-08d96cb0a067
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 18:53:31.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfhEUXdmXyFB0Qwg9LUgmGubUD0hcHrhVqWcX7Qjg9VIsZA8ZiVvR3Bc3dTpHMiizrsFmT6qohvCNU2VVfGReh+g6uEVJQEa/qNRxuIyWro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3399
X-Proofpoint-ORIG-GUID: tiBHCChcH-XVKeibrA9PBTal0i2um8RP
X-Proofpoint-GUID: tiBHCChcH-XVKeibrA9PBTal0i2um8RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_08,2021-08-31_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108310104
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From the changelog (https://marc.info/?l=netfilter&m=162939459210790&w=2):

- Catch-all set element support: This allows users to define the
  special wildcard set element for anything else not defined in
  the set
- Define variables from the command line through --define
- Allow to use stateful expressions in maps
- Add command to list the netfilter hooks pipeline for a given packet
  family. If device is specified, then ingress path is also included
- Allow to combine jhash, symhash and numgen expressions with the
  queue statement, to fan out packets to userspace queues via
  nfnetlink_queue
- Expand variable containing set into multiple mappings
- Allow to combine verdict maps with interval concatenations
- Simplify syntax for NAT mappings. You can specify an IP range, or a
  specific IP and port, or a combination of range of IP addresses and
  ports
- Bugfixes

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../nftables/{nftables_0.9.9.bb => nftables_1.0.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.9.bb => nftables_1.0.0.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.0.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.9.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.0.bb
index cf7c01bbc..68409c910 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "76ef2dc7fd0d79031a8369487739a217ca83996b3a746cec5bda79da11e3f1b4"
+SRC_URI[sha256sum] = "58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4"
 
 inherit autotools manpages pkgconfig
 
-- 
2.31.1

