Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F55C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 07:59:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4239.1641369579117232507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jan 2022 23:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cXXZC2Km;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80041a28b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2057mx8G012241
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Jan 2022 07:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1Q90CHqtfhKGbQOs+xZ35peOF8wr8vfDbL+AALZent0=;
 b=cXXZC2KmKaSMak9/rFyAd3X9hrUeJZyBHPpftRzLFsJH8RXBV9aH+0kCzf+CX4sHAYgx
 qSab3ZCHqusjO9IV78voCd6ZwMtWdFXtH1l9JLynBzbuOC28CsjN4p1HJosP1S4E8iZ3
 VPBa1JzuFgKyVDig9rlgOMPtuJ4ituBs3TQxhtnvuXRqCzoeio4L48DiBk3haI4zAnTP
 f45q1qHCqBOk6waDOuZqZfM4xabo34JQSGLkPZ8fzuAHTiNQR38y/fRFag4yrWSL13XM
 RUbFN4ToGrGBAI/+JBIrTKR3x/Ui1eEsz+vQoU50P+8jhks+1taC5DvMIYp3YAP8Lxfw /A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc530940u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uw4xhqeeRCJJCoQARTZeyWstMHvToBE4PFCcAJlrZL4hUdDQnrrppUHrKJAVkf1bbjlWMi5MiHDv7LbuEakx0a5hpGlmYe8k400hWSEqELX+oJCr/lp5EhoQAMLjgX0wEuHkH2C4skteRfDvebLcuEBW2G5GHBn14URECLF/z0yntofrE3RR5b74RpmSqfRb2t6ups74WEv3Z82+AUJoRQItjSzeTgqUv5RDpdZMxYONgABkT/ctX07hhRIFLZVZa+0z9awGW36OdHJsj+U429I+9bK94tKniZRZaWe/HcKuCUsYaEIAp8FQvunn9sgj1kVLIsh7CDP+NcbYhTye7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q90CHqtfhKGbQOs+xZ35peOF8wr8vfDbL+AALZent0=;
 b=CBYFNqBkdEFociiZM+ICUNcsI6g5PHE6ShkCS1nTZ/onSmQqY5Qk1P/AandZyRAXzBMZfw2hzjvvImRdvEeroQugn+13xLOtxXd7diw5V0C0OX5mRLkIYJ0JB/i9mXsEOsY5hSMjpdnYEUokMqIIUwdoq0oC7KJ+hMpdJ2krO7aqOIkbFgm579IP1IdKDJT1JhrKQf/oUFXaFKBMx62mWa1Fm1HeEGt+Q78VAloUdpjGQ+ydmXY78EvW2wWg35DgkVAmkdnwJAqKSoaKpqIU7OqCoZD3fVo+XbP2Flpr7M4xJI+TTAazrlVQh+umNigWjCidwe/6Tges+o057qLQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 07:59:34 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206%8]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 07:59:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][hardknott][PATCH] udisks2: upgrade from 2.9.2 to 2.9.4
Date: Tue,  4 Jan 2022 23:59:24 -0800
Message-Id: <20220105075924.77639-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21e5a6ee-b597-487b-eedf-08d9d0214ff5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5657384661D93245DC965333ED4B9@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YZhmQvzY91lI+hUZAXVSAlRNqr5HWtBqUpBGlIWrDyUc1UySnShmb3dVuDtRPQqaaDZ24/rLvSAkIVo+uFvcaofDHiIG5zfYnwGiUdTH6rAw8f4n7iPhMw+iXU3l0nCnJmNecQUuOJN+TeAbhM8faZ/8c22eQTJWK6zYivICnB6sffoKVgzBFO9F31KZr3K7cSfCM5MfDSbnqxZR3pY+NB64fXNbL6Qpk2GOFkq0zc0wjVYO3SYnSY0eu+yQSjhPmI1CKty9BCatXVPK8/lRUJQDMAlPrgxeGDADp6oZdnvlZ7yq9+JCBfMyKi/drBiF/bZbML8uZRs/byF7citAYZ5bFR5NYeMVHJerKnDYYxW/I6VyFGttxZUj8gOY/BWZwXEEPTYy4BYVS5oGalL0jB84AHvMo2MydPcRRI0nxKNr1GWHJWRgROLJQf5rxw5LDrfbY9PV6BUIrUOiCD3o+gzizQcOkjV5DXApbbntNerVXp3A0uJzoi842X9l2TWWdf9fMR5e/OtNzOuDHvuYPnpImNlND58w1A+0tcOIWKxoktx0xSePgwP+M6JuPzmar2f/qGOmMgWJRkfXH5zTX6z95TXY9auz/sUy1zP4vfL4LEm/buVjZdOYSwgwIucU+N+gHPa5pDjj2IR9QKWTy+e8QQjOYx9pr3fkrMV3Ibxnt9yz2yY4vs42iyQKPmFmnOWX3iury1LKVXvWGQv3NA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(8676002)(2616005)(83380400001)(316002)(26005)(5660300002)(186003)(86362001)(8936002)(38350700002)(66476007)(1076003)(38100700002)(6512007)(508600001)(52116002)(6486002)(6506007)(6916009)(66946007)(6666004)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jHXVIROZ2RHt8epyvdz0KPCLyUaLN7m9y5S+AJLeMJQHYYlTdCpAXYFvBUtv?=
 =?us-ascii?Q?SiFnOFbhqWgbNUVEPxt3J2x+8wKn96CkUDlefWzHbUab2HpO5Zpa6WBrRrab?=
 =?us-ascii?Q?80+PM96uEaDn93mi5qsGWGNzjBXDYQdg/j9o1q54jJQn3vWVZc7dWqraM9Lg?=
 =?us-ascii?Q?r0DZ0p5lGuXzzY1lE5o7bpUAil3Jftlo/XtgOpKanLAaO+Z5up2NTTExBW4S?=
 =?us-ascii?Q?IiJjxhIxfPjlByySYQzYclWS98rPFPhHoyqoGjICTfGrMdduqvC08bYfT9df?=
 =?us-ascii?Q?zeZnkpIkcASUn7FjUKYYP6/7+D5e0P6W3QiraVHwoqeOvWGJZDTgzwDJeIvS?=
 =?us-ascii?Q?40U5JmJ9AB5vzYEGSZv1nAsbtNyzazduHkkTCfw+aBUk+g51xeBJtcTty9bW?=
 =?us-ascii?Q?NKycrBPRgDq3N72FKOlHuqw53S08GWZnzdu0iVa/mTdt9Z/ujpEYIt5qVhwj?=
 =?us-ascii?Q?HcT+7ER3upfmEj7e10D0rGD1fRQaDkjrkCilHdRvqI8x4Eec+nbfQ7UoEMTZ?=
 =?us-ascii?Q?PSK73Qg9U6fCJ43+B+/6S9iG7y8ctCRRq2gb8ipP5lZBSfFi4eVz6uV/6c9A?=
 =?us-ascii?Q?QNrXoDWDMs1BSD+UTMjnUq/+610efkNlmotM3XdjNz00YtJkcq82ImIoksP0?=
 =?us-ascii?Q?hEAVcsrjJG9oKMMiIbSOxHB5hXG6w9Qx8gKr2fPLbdD4K2/hyRduZZmnfAV8?=
 =?us-ascii?Q?e+s9jgaidgxfy+YxxMU06/ys3lwq1uKERwAJU0fJHDwspz2KPoMQmPYbyyJB?=
 =?us-ascii?Q?CclQtXxVd4LRbA+6SA9Ry+po+kwLTH522Bp5jxV5Kk7N0qCB4eMMFj/kcpiR?=
 =?us-ascii?Q?+Hsfv67PaQVKvjKCa5U638IXEfnULAnO6BNwHGtseyq+TJOqdCAAbddHm5KC?=
 =?us-ascii?Q?li+nZ3mQ2nbaUHhoNr6TzowCdXWL2e7D5nQQeik4wOhZ9d7nJCaPIdnrfncn?=
 =?us-ascii?Q?MjMKfDd3mZCJLkT9OVLsSSHXQ67nfSF1opzQOYDpOi2BaiV0TcXmHY1yE2w7?=
 =?us-ascii?Q?VfiPRQR9FBJ87DPKmZh0IfAKzDW4Kty2MuW3BgDK2bj4dWdcsXjmrUYycEkf?=
 =?us-ascii?Q?NO28+BxHaEkgZqmXmensqWCd5eal9uUW1x/Z97r7qsMwfCIrsInasr1fi4vB?=
 =?us-ascii?Q?O/vatWN1qTaAqaS20rn6OYrcdbXGFkjv/yPpkndwMaeRkan6L3pwIYl+2oVC?=
 =?us-ascii?Q?k54vqY3nen6C9D6FBMRGtSkJoy/DXjID0tS3E3B/YyJtM58jBZjQpi9uyi8b?=
 =?us-ascii?Q?uVWhhSDqhu9EuFRQezm/xLPenivuVjjZljDkrei105eRcM53zZPNzl0xU9Yk?=
 =?us-ascii?Q?hALMhPdC8gCMLHyXBAQcVz0oZY8m5JH0vbrBBECoXUFs6S8LeeF+S6ZntVwB?=
 =?us-ascii?Q?L+R5Rkwyfy0UwTLieZMDIsxyWRxMPI6kwZAu0rM0Ru6xpQErHIkDbdFE3qAo?=
 =?us-ascii?Q?sJcl8ptWoqGr//Ii402/J2x+0kgrsb6+u5x294jmsSEco5GO8a7CvjGhCZ9q?=
 =?us-ascii?Q?7NG7Wkd5GWBoBEh+z1GfoT0VGnkP5LulDFILOfgV43SyMnjKpiK3yDy7TUQ8?=
 =?us-ascii?Q?05zP5del3iLQnK70d/aXTRR/Qg3iZfz+2nRu+A+24Yg7glbTOAQrobR4pq9r?=
 =?us-ascii?Q?6WOhAxSZU0T5QFNhxZL3Q0E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21e5a6ee-b597-487b-eedf-08d9d0214ff5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:59:34.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ljYiwISSf6UHuBfI8sgqZoyTf8aim5Z/4kzpPIUBwQN/u5vGTkTxeVdzPOsQrIGEOpZGvVZFkJtGDyAnZ1/QkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
X-Proofpoint-ORIG-GUID: klxiJrzWkszQPaoL0Nbu_5SgjyapaELy
X-Proofpoint-GUID: klxiJrzWkszQPaoL0Nbu_5SgjyapaELy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_02,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=894
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 07:59:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94657

Upgrade udisks2 from 2.9.2 to 2.9.4. This upgrade will solves
CVE-2021-3802.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (90%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
similarity index 90%
rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
index f9e127438..ebda86fa6 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS_${PN} = "acl"
 
-SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master"
-SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch"
+SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.33.0


