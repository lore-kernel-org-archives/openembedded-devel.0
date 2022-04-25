Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17DFC47094
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.26344.1650868256819355988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 23:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pxbDq5M6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1114d4fe13=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23P6UumZ003923
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 06:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=sISZkHXXHWJzNZVbKbJgFTpDKjlDOQUIaF9YEVmoRzo=;
 b=pxbDq5M6t3+XwdG828rv9qndovf15qNQrCwoyBXbAxx5rD/whJ4ppFoRvOVgpWYraYdo
 oVCaSm7azvtT8+6k+Xed3c9KZa5nIbwsIxa8+NINOxwPz+0PX+TodF81IsS3yV1PSzpN
 FHwjJI/uPcOJsptDP0wASr8Hlp3DM+Br5LsyjMhKu42w5mqH9NwDWSwXJrluoxAMMyJ8
 gdX6wpa8VC0I017jz8oEvGbzl9fPyWOqD9GIY70TElRxkyn3A+CqqcgS9zezTwgfofr/
 FnJbnqJb6BOkszEEFMCg5k1tPKp3B6oNeOwC4KHMtYVQ5KLE8+Qt86/wp+pa22+k1tnz qA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fm6p21a1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 06:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnGe8vMn7FhijelkF98rowZtE8lDlJvyMmPiRZjfq1iThdqzIGDR9QnaSZXn738HlNDxPab3iXB+qXr5MAb1n3WZPMJ6SwZVFSdFlGAtt3sXmyCMkD2Y7YSF2UmPRnaD85kai1xLoissJzkgPPrbMFANokNPMFKexlM9WfmgBIANagM3kpUZB0fbZrOow0IgwRo2HYELMfrfpxbKDqrUbbP/hpWWbzEKV2bDmYp7u/a7S9X3zI+aQkzqbKx07CzTo7AYkvVqYnHCAlcNXuMFFiA2V++bU+U7ISr7paa0LRZg5AlU+dqCZru4Xtk4rvxA3jeoYHY6qoUjPz1HZIdFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sISZkHXXHWJzNZVbKbJgFTpDKjlDOQUIaF9YEVmoRzo=;
 b=WylN6VNVlZ36IsTBfny03fZuZKz/kgwB+3EFyoeSILGm8o5tVgV4vnR+OWhgl5xzos/aIbSPqvzYLC/wqbuyYcdMLS1S4NaKZ08hVQ9UnTUct2ghL37gBqtllm6Ywkph2rD5ZPp/SQUAUq23/5JuF4XzE0pvHDk5lWTZTK6y+f4JhbHCGe+rcuYJVcQHCix3NUAqsW5gav0/1Ow8XRFkVNkK60mw6MtXJ3GXExqPn6MRWzqsWhXMEZIGHr2x/fnSkpHaLBjsJj4671NK2zgHjImyMp14Qc/qwDGpDIAs5VZM4t6tdS9sKzZGPQjaamKg6RbkkEYDdg9Gs1WYR2X3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB3544.namprd11.prod.outlook.com (2603:10b6:a03:b5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 06:30:54 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 06:30:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: add PACKAGECONFIG for fpm
Date: Mon, 25 Apr 2022 14:30:30 +0800
Message-Id: <20220425063030.814264-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70abfb3c-1c82-4dec-8a37-08da26852628
X-MS-TrafficTypeDiagnostic: BYAPR11MB3544:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3544D957161ED9DE147D0125F9F89@BYAPR11MB3544.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lubc4Q9xWizxMPi+i2tTqw+Q3NXH2tHWZNDw8aCAJCq3myFMIjUP85VjU68ktVH+UXAqE3qlz+/31PJG4NLMuvVPfQargtnwLdwQ25C174nxDb4O8OxQFdFX7BmjnLMmOY4xNQT87/mTaJyfZIIM9tRj8bYFwq8QyQv68fQCezdWXJqEwPPFStdJ8wFMbbXgI9z9DFvuQHMUKP/cKiFS5ab9OFS7N6vxEpRqf/GdFpTvymUqmocUSSw2s8xB9J+4hfnFuW5ibsyYpLl2AfdBp+665OS7+2TExFj6fNE/VbyKO1b6a6bFU1D5tQLduOggoBT8P1B7IMEPKsJOLU9XKjrug6aG1J+vNtIEWIgAWejbgUhWlzRhSwrNEnrt4+pSzORajkNexIChK25c9ggPXwI/XKKGlG5pIWec6vlhJBDPFkOqASbtrIMDYH9OEm2XZZyMMmk1YgbTYeIAjJ5d4fGam0nh+1JfzsXOI9MP8HW1cxUhhFLqBT1q7BfCNnLTSaWGQ8uRoxr1fVQmDwxVlBVyXOTLY2JBuoY5/M+nBw4oXT/tIT0kGix7OuBeDtkB4icbQbLVeb8/fzzhcolgGHQGpPen/lac+HTcjMkOSImVQs4vWr1a3jMdjysr+rDSUhQd2F6Q9tp3jf9fu2d49dNpfSVwpxi8fjTBjPbF/9vmOztNidhcFTBCYjk7Kgvo9M7AbCisK4cqormXlHWxqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(508600001)(38100700002)(44832011)(26005)(38350700002)(6512007)(6486002)(83380400001)(36756003)(5660300002)(86362001)(8936002)(52116002)(2616005)(1076003)(2906002)(6666004)(66556008)(66476007)(8676002)(6506007)(186003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LcDwv6GWgxyOGS10e108PmaD/hwo8852NHGK6fi8uMmSyUEt0r3GZViHnvzL?=
 =?us-ascii?Q?eFa96QbK9WUv375obnurHDVUQUjHuf/H0Gujw50obzQnhiLXGz+xsa2IkJT0?=
 =?us-ascii?Q?z6oQZ7ZQx7lvTrG5Sr27p1Vpef1MeFMJv9YSNAY+zHPXnORFLAFHvt/GiOv8?=
 =?us-ascii?Q?wuENf/zNhsk7qgWliAMkH87iCYAKitqr68VBhOezGHpqImoAZP/Nkm9Wan2I?=
 =?us-ascii?Q?xz5rKkvxgCDUOLXes/+Q8hV78Fj3xuqA3ThGR7ucrkuCJbEJaOv2Q6l2fvWW?=
 =?us-ascii?Q?Jz/Sy97vgEZh6+S3eixaiIunVp60mb+srvU0A5eLuFr65eh09FInW4KXhzhD?=
 =?us-ascii?Q?TREy/ZZp6ozMzEWqyOmSK0F4eKydl4aL0g93R2ulXlfM8jRZnOktdHIDs2fi?=
 =?us-ascii?Q?3kwBg+QVgEIGROJ7IvBA2N3WcHHGDpSqN+rT4PoxZgSI/dpqyHMrdej6lzfO?=
 =?us-ascii?Q?xJoy2gxp8rjk3UYvikW4AXi94JgpWzPYki2hvanSqxPVlW3CGgCJ1UiVJCjN?=
 =?us-ascii?Q?gxcaH/k2LscH/Lh1gcKIR7ibBVrrOAOKlcexWoraZ0GuI5f0xaeazNTs1UAl?=
 =?us-ascii?Q?oXGN7R/W4+QsCGyISh+UHQD3BlcFQlmyKOpmRJQJTN0r0YkZREqjWoWygmfB?=
 =?us-ascii?Q?F0wMkiJd5UY+zRVxe1xgSx4DBBdM2fv3nG0hqwSIGPzkIBQ+u7kn/HG4soDQ?=
 =?us-ascii?Q?RQxPUUTZ440RUPDSWtTygBU8takO26WEec7ot5dijNNIMaEJOmNQcc/VP0By?=
 =?us-ascii?Q?rhovOITSrM3cvEBS911sNG/5fE+tGRfXwGb9yaTTvp66YPZh7q9ixauXS55k?=
 =?us-ascii?Q?GOYmdAcSGOiizX0oqEwS3F1blhZvd7j15i9o5d/nlqrl9HFK26lI0aDQISvi?=
 =?us-ascii?Q?n7QHmg7ENQXAHSWSCvsYOlY8grCVSeBf50RxzJM7+EQFXFnfuCEO7lOlQHlo?=
 =?us-ascii?Q?FMYhZNwHUqQbXa4E9sY3gvMSKt1AJltipLG9YBBye8gFSKGt8+irrRVJB9SM?=
 =?us-ascii?Q?JYbD69VpLS+FUNb1xTRdBJucsdetehhdrv6kYTqxb7qT5+wvCy24jYUgnKNF?=
 =?us-ascii?Q?KYWJ+kYh20n2rqFitbi5dhIaWm8h/WNejAvept9tIIuXvqgPjCum0pUJSH5d?=
 =?us-ascii?Q?0+Fy9QeOcXe83UszApfOOtfnbxXng/7Qz8+Bk+xP914AHiy3p8nvj6IjkWnq?=
 =?us-ascii?Q?GU+wYqoMZTsqYwukPZ25RXBwXvmDn12ixdij0rxCtfNQeu6w35Sxee+N6crt?=
 =?us-ascii?Q?MrYZOyo4NLBy5C2HL/VzJdfhI1qrg+P8JC9THvYO5RqwloPVxHYMdGKnUghA?=
 =?us-ascii?Q?fAGj/MAWqSXbiwBaYwtldoMwHts6a19lHuARQS2eMFYK5/Jra+SeB8cfl+o3?=
 =?us-ascii?Q?2/QXpVy6BI1Heha7Jsq0ooziKtv9EnfoEMPCavk+heJ5omusSOfBNwOCFdQa?=
 =?us-ascii?Q?/Mmr5AwpaB3nHqoNmddni5slcp4zAcQYW9YHo0vykvXX/T26OO48udxZSSQJ?=
 =?us-ascii?Q?L1eZj8KC62fDDm0upvh8rmATNaOaC1aUWNuuLZHSgQSd2JgatOc03t9Snz/q?=
 =?us-ascii?Q?enj5DJwXsT7jkYI8FJg6i061sSoxZS1lGk4dDOF1b/pEjuUZJscFJ50Bsp8V?=
 =?us-ascii?Q?neqotm/MIwpukWXpMOF6wj1Pt+WdMFRV6bt3NB51oWBhzMQtZfnRklgsNJVG?=
 =?us-ascii?Q?IqCHzk4JeCAABLLcYT5HSa+XaYZ5m7Lt3P5udf9zSJ1dKYVMwQe3uMYmUkCO?=
 =?us-ascii?Q?nUO/Afjg6w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70abfb3c-1c82-4dec-8a37-08da26852628
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 06:30:54.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wKDvw718jTIKljwRrUDo5GOYeAGvjDmxAEkuJS/nohHyCMLz0nUMd8FeH4mflOYt5LttMe2LAVtoxkrWpRA46A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3544
X-Proofpoint-GUID: Eq0ckwNFRw9BykTKz_O7oqu06zbbSdxe
X-Proofpoint-ORIG-GUID: Eq0ckwNFRw9BykTKz_O7oqu06zbbSdxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_02,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=635 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204250028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96760

The Forwarding Plane Manager support is optional, make it as
PACKAGECONFIG.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr/frr.pam  | 2 +-
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
index 3541a975a..83c403c2b 100644
--- a/meta-networking/recipes-protocols/frr/frr/frr.pam
+++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
@@ -1,5 +1,5 @@
 #
-# The PAM configuration file for the quagga `vtysh' service
+# The PAM configuration file for the frr `vtysh' service
 #
 
 # This allows root to change user infomation without being
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 91e306f08..b6e180e2c 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -36,6 +36,7 @@ RDEPENDS:${PN}:class-target = "iproute2 python3-core bash"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG:class-native = ""
 
+PACKAGECONFIG[fpm] = "--enable-fpm,--disable-fpm"
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam"
 PACKAGECONFIG[grpc] = "--enable-grpc,--disable-grpc,grpc-native grpc"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
@@ -52,7 +53,6 @@ EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
                              --sysconfdir=${sysconfdir}/frr \
                              --localstatedir=${localstatedir}/run/frr \
                              --enable-vtysh \
-                             --enable-fpm \
                              --enable-multipath=64 \
                              --enable-user=frr \
                              --enable-group=frr \
-- 
2.25.1


