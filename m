Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA08FC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 02:34:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1761.1641522864214828387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=njTKtWra;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80064149fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2072GO18028913
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 6 Jan 2022 18:34:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=k/FZ1ZN/MmXk3x7TgU9rWi/XEEylXcE+2MuJ8jbpBcs=;
 b=njTKtWramCUO39s+F/23TLnglQt2kZhMwtLnTIw6qljGBIk7ZyN29IInGGFzQ004DXkI
 RW0l26CPXjpRGVkOQulOe+R8F8ZpGgBsFN9cegjU3CB0jxVm5Ii1qpgvlk3LZNK9gonM
 MXFoinr6Rjb7bKfSsthwJ8U3I1y5/0wdtwYraDyB4RMqtCIfCgqrCWuuZ+mKGQnkxnZa
 tEjvoTNd44WYiHTzRKYvlUxEpIKSXxadSrFWIp/Oea+3GaPJHdHVj2kGyDnnDBSpYvbs
 WJIkBGfP0cugRJQUuAJNOSRiF1dcNcOP9OlbavozDqMWfyDnWkDC5J0SGYfjIa14/Esj Gw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wag9rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:34:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bvo5CWrI7GfqORPMwKHZTgnCHAjTZkNBoisINnl2rSVz2IJ5cWfHbhItBQrMTeMjU4SMG7jOT4m7yuL9m6ITmBSZNHEicuuWfxAI5inc+P1KxQT6ma+EJn7IyV6H/piKu+l1ByQno5LhtDxEJSTg7i14ge6i+EpdF0SqubuyLSIGZACk2UM9cn+/N08gS13LohWwwboMijbjwTlEAFNtn5IbNEoCsis2b+oIeDMNd28rRBnEKlhEa6qy++f8XsT8e+zT/c+jHOLFgTnYCw1v+otBypcuxU3OxMzaQLP1eHiaTzyOSSF6Gwhi0y0t/US5h2lvUg8ZFKp1J7P+ZMmiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/FZ1ZN/MmXk3x7TgU9rWi/XEEylXcE+2MuJ8jbpBcs=;
 b=Aw2ybV5oZ19f/DHvpZkTM3RuGoSxucIOnwAKI50/61QSqIF9spvQGl2bsIZqlXtQHYMGGThx2mJ7g8uCvhE1sJA/Qk0Q2jfrMgiBOXfqeybrDLsd7mAmxhbdbAogzL84pYN3uS7O48z9KVCA7NJI2bWIfWFLFVEEdFFDD2z+Q90WWvNG/orvjVtyr5kL8NsywrhYAX3Ze01Y+Cd/opmI/mzZBSMzQzMYIPlg23R6HgeKgFJheJWTA8AvXfVmk4UgYd6Ay60M0A/mlzN0rGF5jCH6PJMKVMrpxEX3cPQOmmOCOCA4Ir1vEtG1Npe7INVnsrR5xfUBkrhkzA+XQoXMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5619.namprd11.prod.outlook.com (2603:10b6:5:358::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 02:34:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 02:34:21 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][hardknott][PATCH V2] udisks2: upgrade from 2.9.2 to
 2.9.4
Date: Thu,  6 Jan 2022 18:34:11 -0800
Message-Id: <20220107023411.114340-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb52455-61c0-400b-3941-08d9d18635b4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5619:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56190253C4717E17829897E4ED4D9@CO6PR11MB5619.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J4Z67PiWwjyhxD7LRz/5ZnPn8VgxT4lU16na/t7INkMbg2RcabHny+dPQXc5MhR+pCnUU0/ihX6lMaBRES98vMEKs/+jyU5asxHbqVbIQ6zrJAVNAAmqr/OGlYa70uvWawDw56VQnEvT4vCok8s8T2ae2EdiEzo8XS/waCyA2JfzVKdu9ahc0OpWoGYgIFpoeXTQvZdno/KpnQrGb44Vxp3NDRg1BcN+as/MLahMehZ9VLFQzsIat76sMyA4r1GkF0cqSZDMiIFSrt6ugunzajxlHNv5GX9yUuAfHW3G+t/Iyqf4w9gaFuKUlchOIPNCzkqb1kZTPoVVcaH7SsgczAMorOWrKmfRhJM2RQ8qI1r4K6SjcPYN+qgXePn9PAA72cicDBzzNF/ZidFOSDnTjKjik6fP1vxcGqATHxMdxp/+F+4C3OxwaSGP48oaY/Q39d8iBdB55DZThPZjVS+UiXorbiq0jvAQZQwELxTyN2w1LvgnATwnH/RST+677UT1afXAAcNyHSobzt/gy75pvTLwvO45fWqBQKuhCokfF99Xu9G5JsDKIshCojgrcLO6PSjZccmBx/Vcin6OM+sx16S5WdIEhkLdoAxXB9T8G1EkjoVZKLw9PljIQDmzEDXDc+2xXlFSzG8YugpgyRyKd/s2rObuK5jOJ1on2CGDoaR0ghAO7fL5xRPiKnw7wBIyscKopET7T+vEXKf/WIGZtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(52116002)(66946007)(1076003)(66556008)(66476007)(2616005)(6512007)(8676002)(2906002)(86362001)(36756003)(6486002)(5660300002)(186003)(6666004)(6506007)(26005)(6916009)(83380400001)(316002)(38350700002)(38100700002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GBZoEJAOwhy2yErH0ifyIaDnlUCFuJ99mooOECjnNjTX9KklASjti1e5oPKM?=
 =?us-ascii?Q?i/scR1bmDxfyxYVZtKcgtKhWcZTzYeyexxkMfwo66PZkULtLCkSHxgLt21B3?=
 =?us-ascii?Q?NPSbxp43BNQ9UZ53XExt22WZmGmizXYv4XlexYrcBF4IPXB98OPE3b1Vgrav?=
 =?us-ascii?Q?2/U0d7tPMSKCYTpJDPS/3ebN0T+1joMleDOUDwAW0WqI0fpLhzoE4UpmAbg7?=
 =?us-ascii?Q?yMJehewEIF8EmgGTp4XFZhzOZKf36emAOS4M/hF9df2BIvgjbFNlIbDHHEGg?=
 =?us-ascii?Q?+96SV81uDWMPWozsV1tcucFKK+SMgtePs+b91/MGiAOuX0jMPHG7wU/TlanO?=
 =?us-ascii?Q?zWu2ZOoqzqFhI4HNbMTgzyE0yxiIPFgjoqiEvKvr3QGxWdsELZ1rWg24MbQc?=
 =?us-ascii?Q?NDNFhrU3/iPmDAcw7MiBZrNTdM5e1cWUOa3vSOJ9UaFyhe3IDkgiiNDXdOZc?=
 =?us-ascii?Q?4IVP4D1Xv6qMbUbNV6bhPSyN7TU7A/XNXCMRR49sKVBVAQOJ4w3z7QxH54g3?=
 =?us-ascii?Q?mnvTcAplj82OnOM4oxU+lNpPBGg4wz19+fIwWwcX3HF1zWLiKs/dqqsfHeQx?=
 =?us-ascii?Q?tBohhZu1O6OVH2WZ+ohuyOZ2+b35bSCaFKG+PKuEAl+5vuBgpfS/7yKnA5pc?=
 =?us-ascii?Q?/TRePOesZ3/9h86SZ7034nSCglohYREsIpRY5bJRfIVKPdIAOYpAIfktOfYk?=
 =?us-ascii?Q?x6ZZhrVBLaT7J/s7yot+xjqsYN/XoNdRT5MUNtCJL9uoPxwLWyqUPIf/1lgh?=
 =?us-ascii?Q?zAvfM2E9mEe2O/H8N4sivcgTcuO7sz7x503VV1qZSkBqso3QAWuipAZWHqry?=
 =?us-ascii?Q?XCAwCgAjckb3AdNBORDZ1eNuknbieZ3pI3iaR3tjbNCNzx2ZWsR/xEz4xQhU?=
 =?us-ascii?Q?8AktSOuUCrW8/oXs19oNjAt1VX8taMLsIQ5+tEtrHfx69M4CO47ZSsteGhTm?=
 =?us-ascii?Q?xjMMNthcUXutc9ZFXbdqFWTDfIcpnHOcVpK8xlApKeRpbLr0zfyIGQmWyoIz?=
 =?us-ascii?Q?U+cU8SNKkTQeFF96ZwqiJe62DcfOXO68DVC8G8aCty9ythveJreWkY7PM7T2?=
 =?us-ascii?Q?6xO6KNNVK15PedwB654PKgiHXZSIQgUbNFD0wrRRaRE7Z8C8FuJAJxwBOYq1?=
 =?us-ascii?Q?Jx74Q9ymo3j5uxghUw9qudcwwWCu7ETAdvGXtc3+78EcCAjKE3WzgFa7crVj?=
 =?us-ascii?Q?NsaBBa02jWhJaChbqTSQMnRJBoc6w8wPgW5Cf56JbfLmBZF/rx6BnJ67v+rw?=
 =?us-ascii?Q?TFFN0NIbidq2PTnkzCQxlkMIkpK0XRXM+2LgFjMW3plum3tU1clFg0JzVVLp?=
 =?us-ascii?Q?3qhsZH9+n6vEe/v/aT0llcMa9GhnBDbn2rVMWyGwhB9tspa5Kn8Z67jV2Qyu?=
 =?us-ascii?Q?1vOB+QY/douSqcF7PqhYy6Fkr9AWuc2bvNDDOZMH46dZ2gsKFBw+Px3oN5bv?=
 =?us-ascii?Q?36fUNyR+uEQqKx9+iijuyNAMyaA56ulCec6+JTLfomnaxLXti3x4jOjQvB+y?=
 =?us-ascii?Q?9DwXM0e65DHp5KeUROj59jj7yh0jhMQXR43FRFNjyHLAQwdaAD09iiHMKDkZ?=
 =?us-ascii?Q?5SUGzDyLVlRnmT38DeaUkMwYVBxiBK8gkEU4lLZLNIV5/DSWlaDBbixksq6L?=
 =?us-ascii?Q?1TM/IE15t0rGhts9MkKrxog=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afb52455-61c0-400b-3941-08d9d18635b4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 02:34:20.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wuVbgEU3lXfkNOqab/UkypMn/2PZ3rXZ+5xDz1I3w/mafwG1QQvCN0cfRHPedmID3vP+l8sHZO3LV5VEJwxhJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5619
X-Proofpoint-ORIG-GUID: amki4-5T7vNreHaJUzcq2QQ0eqCu0SMG
X-Proofpoint-GUID: amki4-5T7vNreHaJUzcq2QQ0eqCu0SMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_01,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=852 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 02:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94677

Upgrade udisks2 from 2.9.2 to 2.9.4. This upgrade will solves
CVE-2021-3802.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
index 4c64f91a9..a25860fd9 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS_${PN} = "acl"
 
-SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master;protocol=https"
-SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https"
+SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.33.0


