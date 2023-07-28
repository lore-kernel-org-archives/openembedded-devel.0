Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E18C00528
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 09:03:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28653.1690534991639762074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 02:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VyeX/arZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=657345a965=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36S6Sn04013527
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=QWb2kOED6JBJxwLLbjSbCRgqAN96VeISHzkCmNcItzA=; b=
	VyeX/arZBtucvjO+mWMwBUI7XEFAy60BZm3csB3SRcCIQsY2OfqAki1cpdbd8zJP
	9MxEvASapacjEXWgQPJVk5OoU6i464I46wQglq31934KefbR4a7W3j3cBxy1yoEd
	CUSpNdhDqM+rqkCsZPjAgniCsBhLvRpYnQvhMDxcG8j8yeRRWI04iKG8ARepg4a4
	xlPymggnY+S6fGKTITPhtoremCIVggwvpGSquUrGHMkcJvSYIt0nxMHQjA4HzypT
	SyMaU1PVL1klK9h7RYGtJStA5ZMAOlLHqF7pKpxgON67fdTqFbD8eEvlaaLwkMQa
	ZLlAqDlIn3+n//S9XxMl8g==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s3beasgbv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWGHzJoKk358Xs9lJ7Hs6Kku2WQjBKoF6aSxnyXmUXwAp7NHBsPQQznI2ck6uXZgiQ8AHhAP4xo/oPsZTu7SLHrouk7BOa+w9TRoG6Vb/zQ1oQE5xjySY2V3HJiynV2o5E3fFHzeEw12tCmQX7Qo1fAf9qgIETLxjUy8BcEeB5NsRlRxadJrb7eFSDOUfGLqRsGD7FKpf/WkcZ1g3ny/3wAialY4bVmpvTLiXHIpIwfCua0tm22AmZZcn0hPMxFlySraeJcW5oCaCoCr3a55NJDawIZ9+V3Fc3UyWiYQgnRK0nZRegHZKfW42kbX19ZhCDG2LH8mC9E5GcTAc1ItPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWb2kOED6JBJxwLLbjSbCRgqAN96VeISHzkCmNcItzA=;
 b=Da9LaAC7xP7xT/yHtm0D0KjRr9L4br8bieWx4bZuH5GoigrtsYgd2XL5nf726VeFJQPpm4KJcMnXxKiKvHA88TEr8qsTJTVaNESuFcbwpB8wdcScUnPeNARBb4oZkMf3lThKiSH45rkptwqEF5HpfhmEJbqJH6mCaX4UP/ItqWJZmAMk1ULE54SLGdUYlgxY3cEfNYkz4HoAG7Z/kISFdFZcSG+pClXpFdDp88CEw0o9fgh5ZTGrv6dC8FIaZN7M2LY9SiCPtKrCNUq8D4sdFe7BZn7JaiKXMITjo9yG5OEHowJJh+oPUv8wcQSZ6/fmmFV7Tr+Td9GwMpRLa8f4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.34; Fri, 28 Jul
 2023 09:03:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 09:03:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] libnetfilter-queue: enable native build
Date: Fri, 28 Jul 2023 17:02:54 +0800
Message-Id: <20230728090255.2577891-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728090255.2577891-1-yi.zhao@windriver.com>
References: <20230728090255.2577891-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de661e4-cae7-444b-48e2-08db8f4976a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mft/ZP74okFsBiEIuCrTPNGbcOF+4cZz5xIQbeG6P8Hc4B6iqWLGg5hv4Sa3ysVdFKwpEBz0Uu2fpWdhuoy6IQWD2nQ29/cfoOZqtyC2cgDUoYdPdSMNpV7TJ88ULWXXBWW2svuyK82ZO5hUOzlqqVBz2jTGb+xZ3L9U6SR5t5QBI7oGoo9awwOMLmvfp4+IE6lF6sNoPpi1kfCxB5NOh1eFvyNXxuBK+MNalWDdo1nKLcueNXuF6Ml/BzNydoXSnm4+uqjuWRBEISILxRU87xn55258zACep1j77XoF8ds1JMyUFA1IVcBGz7HqlZNBvbTqugbzQlHsb8ptn6DFuTKttcvajSEVb6oGncqhoDbiKsiw+qGUhAsKcIraL+iuPq4dJBBdkjbrySO3wYpoc5o4AjBD2xrGGYZxuPHfkxElIN6BZ+AKNlsrbot+FP5YbNqZ9OmkPuegkbYMclXj6Pp5QfLH7f227KoeqiRx+XmFd63VeBStaPzj4BQ19IzgUSyWvvUH6kzeBfgKZHyFCH9nVBjwnRl2MKz2IZiQlT9o0aiGY7s/JQx0ZnaLNifp6gI8IIigBZLyunRgf3Ww+zcLxYLehhzTKmZoFF0WE4OH230Q4BJ5OK9I20XlxL7F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199021)(36756003)(2906002)(86362001)(4744005)(2616005)(38350700002)(38100700002)(41300700001)(316002)(6916009)(6512007)(26005)(1076003)(8676002)(8936002)(52116002)(6486002)(478600001)(66946007)(66476007)(66556008)(6666004)(44832011)(186003)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vgfQYJVXCu3n42/PfY9OWOrowd6N5GjyPTkP4JGY3QUa3lMoHsKYNQd4rEh+?=
 =?us-ascii?Q?SUXfZzPOG092/SQf86+ejHdstGCGM+DMKui+lAtoKThrY2M+k01BKb6gqFZa?=
 =?us-ascii?Q?7TJ007wTrTSMNbANfKxPJ02rE9SvdsSbTYqVgUhI+hBVz+JtfkQg3o68qdGo?=
 =?us-ascii?Q?kh3FNTGc2og47wc4qX1SysJTE3TM5IkryTEaIfI37X3+GfwKq1+myHMPL/cS?=
 =?us-ascii?Q?VxYl/nZISjA0HwiJ/gFWpNZJs5T1a4uCJ734Dj3Lv/VaxxdGQ4kh7mUVqT0M?=
 =?us-ascii?Q?rGOYGu8nK7JIFkcWLOC7yMJWTJD6tWnWwpQW+l0QoavU2ySByBOucetza0pt?=
 =?us-ascii?Q?k9e8RKjolWzMMAB0Fh5nqhpvpGX5XtbGlBoq0u6Szj+ObPgcc+GuB3e2v/EU?=
 =?us-ascii?Q?7tdzZBf+70N0RMouKAs83jm3vjJd39Zgt552fnUivvcf5lx43B1iB7w7bhU2?=
 =?us-ascii?Q?YRc4QF1gAzxYwXVRdjR8jjwXgVA5te5tFZsJrENLimU0bpVUCoOaOte1Ids7?=
 =?us-ascii?Q?5MRBv76dM9nY+S2T47gxfdX7CpvimIiSxLuUinAySAsVh4tgjnpm9FrUVdMR?=
 =?us-ascii?Q?aJUnSZZpsRvDrcXg2B0t2m4zO/a867Lp+6SvN0u29fpyVj6bT3b4mMpjl6pG?=
 =?us-ascii?Q?cuApNLFBK3WtekfIEAERVHUaflDlzM4jkKFssTwF1ZKTdS+F7YCtjoswIs4C?=
 =?us-ascii?Q?AeCKzmI+xY03z1Jh2S/VPNM5TqeQ7Vpq97SPhNw1FRFS6YjFWYeyQZMcJloP?=
 =?us-ascii?Q?TGZ5BQSHCCuZiJu8uNyD8DNodMsHI3T93u3m3LettA7x6mfHtfoO20WJv9O+?=
 =?us-ascii?Q?eXqXQhOrUrSjeFIMIO6pdnYnF76+cPidCByjT9olniH3buUK96M3XD+wJcBW?=
 =?us-ascii?Q?6sN5S+9MwAYw5A4mmeZ310bkBakp7GTZc528KfonFWZ4rHs4OiO6Tp4A34LR?=
 =?us-ascii?Q?CIYsI+C33rhQIjXTY5uUTf+1yz/nX8IZ71C24ersWmUsDY3ddOXnWt8Tf3GI?=
 =?us-ascii?Q?TEm6leEmj/Ffi0yzuVoVGj4CRz8baf9UNw89zhAiVOk4cPjf2JP9e0oRcDBS?=
 =?us-ascii?Q?nw9vuu8ncCsnaTthu4b5R3mHcja0mqbalSEKF3bwieWYcv+G9HPULkMFxfbb?=
 =?us-ascii?Q?3PIkRtKrpj3zKseK4oG6OnRHLY9TfCi+THVwNri5srrbZFv8KhyEv+ffFIIo?=
 =?us-ascii?Q?hKGdBMB3FWXV7YKzPHbfBCesd+6IzHRRbtYS/JcEqVzeLEeXk/Y1ICvjwCJH?=
 =?us-ascii?Q?X3nB6UOemN3dmvPt6VJMP1kSKj4swbZmQKJjRpe3wDuPDdxWdVYSLISYrVj/?=
 =?us-ascii?Q?zG0OFw22ed5MWgrFOdgcjD+2f/LN4ReE1tHTdRwWbaOFgGbaBtNvvsLhg7FM?=
 =?us-ascii?Q?3/Hf1CpFH1pVx/3+CXJl3+oEAAJQluiwHQfYPDJaqK6UQbW1vtWUaOUlWGRX?=
 =?us-ascii?Q?VEVboVaIF7NiJm4z1KIL0SnCJepBxgaCJpHp3BTAIQOH7lfMF0Lgg6MZDm+J?=
 =?us-ascii?Q?8lpUg7uxurCfVDOSGMokImekVDy9zHOo0M/1gyw7oh63cZVEggpXequbbao2?=
 =?us-ascii?Q?btkGQNuI9UaEYXIdCg/qIKYuKV25afr3KDfvkbF5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de661e4-cae7-444b-48e2-08db8f4976a6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 09:03:09.2274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWpw5QRvfdz04jwf5JDndPccPPydphCsTiodEjfw5vMwsd37r19kKEboNtmgpDYSC9pUEToPEBaHTnkCQ88zEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
X-Proofpoint-ORIG-GUID: RYnZ9hgD_gCUOTkC6PRRuljh_yThAjND
X-Proofpoint-GUID: RYnZ9hgD_gCUOTkC6PRRuljh_yThAjND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=821 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307280082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104066

Required by daq native build.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
index 580c29e1a..301dd86cf 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
@@ -14,3 +14,5 @@ SRC_URI = "git://git.netfilter.org/libnetfilter_queue;branch=master \
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


