Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B75CED26E
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 06:09:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2520.1728367744089623319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 23:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001105f10e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984CiuT004524
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Oct 2024 23:09:03 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r4ajc0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 23:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTgdJz3wqp5mmYjS30YEVHv3N/9TgHsH+UBi4xHDxKh4y71LhgiZkZwQzvaitFi85ywPucQIgKshXYYPkJ8X8sFGUM9/nrTEBj11tWV0XEoiKVgB1lQDEo3BIhz5FH/d+30Vgo7MHiQ8xxqKut/KmjcUAooGtIjPg2PRTKNAWcd50mtZBkmjvZ7OXWVoaJXCZg5hjCMisy0pjNLPc3WGG+p+Bp/46/SZlqQOGzoxurO84MMHaOF/9hV1wYZv+5qzjLWf778+WG9781XAG0lDQ7hOgLeLlaBhgdRS9IqAby0G/UdfM/RqW7kzcwKDE9dcMJEFyHJx0iGsAUSQHrwoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iMwkDuQyaPBIIDy4qvVrLkAAqkrqvV0TXEm5D6+MYg=;
 b=RVeu8OJWm8wEEIk5skVdyOeZs12dER2RreVIglzmQbp5fcxHoEXM8sW0ant0rLavZq06XUJbvaeV7EfF8p1LShQnQ7k9dV8pgduSAL0dLtd8z2vRiIry6rensczEFRwYfoaESbcEyaEqTHttTBcrWFfkS6RVIaj6HYWgkBM3GyFcDvJ4qCoK95llwSMdhpaRoUQNZ84JDvhrw5hYZ9yWT1ocVQhrQMKWZL2oPRE49brrGh2IitpBeiPXDDPdyv2eMcmD/YZ75cZErFUcA0iHmECj8eRhiLulU2dIvqfYufGyzpM/Cg0QHmhf/vvCzzQyOMvpa9Mn3ayx7peXPY3DwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Tue, 8 Oct 2024 06:09:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:09:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 1.1.0 -> 1.1.1
Date: Tue,  8 Oct 2024 14:08:44 +0800
Message-Id: <20241008060844.1057216-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241008060844.1057216-1-yi.zhao@windriver.com>
References: <20241008060844.1057216-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9e1c20-e923-4189-449d-08dce75fb397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?shU4ke+ajohvQKLaMJRQ4c5bMNZKA2Xbw6SHqY+oXcWVSBGX8ITQePEVTQvO?=
 =?us-ascii?Q?YqglE1LdZPOnmZW0OBvLvRP+55zYu7xEqvykbH8mjo1vIrkVQmaU+RisZHLZ?=
 =?us-ascii?Q?RS/jdlY//Ur0570xv+wxNAavqAqQar0b6w3Amg70a65L26qcTT9auD0BCKIn?=
 =?us-ascii?Q?lsJvTnCxOKdFWuRMBCqv0twD7R6xeAhjohnPl3Y6FDQpJZQGFAuzHSIPl88z?=
 =?us-ascii?Q?Q1n5/gwhVjvnZVitmM95JtGXYsuR+8Ws9CeWnCCLsQUWGcb40X8JSzxHVJ1a?=
 =?us-ascii?Q?ZF9fj2v66s77EfAQNRZ8YG6xmVEM9m7fhg/SBNAvlIBT4CoRvTOji4SEcTZd?=
 =?us-ascii?Q?3Aqj+RYitbO68kYsNRoAsolC3+SwcstXpuQgUPmQXAWusZQkItXwle28289o?=
 =?us-ascii?Q?1YWyQOtsST5IInATtjBtbxjgDx7pEnLsXcJQHvvfDpHK4E4qNIAK8CjjoY5W?=
 =?us-ascii?Q?wgBcvPpuAbEVSRHn0acggxiyaplzIzv0/MuGL6NK1xpEzRiawxZpVJtagHh/?=
 =?us-ascii?Q?7WUcx/08IfQl8LEFjgPUh2sj4iRGy0WfmlnjN8RGt3jsA6iZYcDBESJDtVXv?=
 =?us-ascii?Q?I0U86PnWyfHX9mhlQAAUML7TO4TvIjXjOQMYHyN0h3wgjWYPacZjwL0mwyd0?=
 =?us-ascii?Q?JGYNSr4aX9uc5CehhPCGfZD8mf/M7srqYLeyJnMIiksoHFR62yHK2+BKhpoX?=
 =?us-ascii?Q?U+WOfq2Rc1DcWDEiNQfezkU61CbIDp+sa5uVMD4F9RP9U811GBzkldUh6Wqc?=
 =?us-ascii?Q?1YDsfk6m1h+iOzhLqTv6F4mn9hqeCXMbWVmMb4auBbGEKNsk90UZUTpxPedr?=
 =?us-ascii?Q?txST3yV9VoevDD0IJvsGvBByW4Xu38kC0oGoxDwPAj9ZuZTRDVX0JM8soomk?=
 =?us-ascii?Q?BHkiRHNac4VeyK4Kw/0o1sMGsXaUrLyv4BYYa+8AE9yuKmNq+szvGgAcUbco?=
 =?us-ascii?Q?kDV7sdFZJix4E5YgVp33k5tDcE2DYcW6gUPdtekj+Cr9PunEDs7WklDOHXh8?=
 =?us-ascii?Q?lrcTNIMf5vedFVUyFPq6q7tGQcZ8dsxrWp9Oj3z88ijLDbwnhF4cr+CppLhp?=
 =?us-ascii?Q?X2bDzRVCyJ8MTJHB+Iui/2pwoHYTe/2m03rVIu5En/gvlxUS9QMf0WlAmKii?=
 =?us-ascii?Q?5KZYBQN/LIzyIN6Blz8kBbf3Q40uaRzU+OuqufBR3mbqrvGvQeHmW0kvlTur?=
 =?us-ascii?Q?sPm2n4NOYh0IMtQ6fWE8vD7l3y9nw4ERbta3DwPqQYoSkMKTCWonPkZfYdpH?=
 =?us-ascii?Q?jHldLkqqQD/TDJeuiQcHttxQSHjdLuQAQhoHcCuqJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dficHDqLU5ESNkL11Hn9Tl4dRvL5flanPiBsgRDNKvjx6AKo3g/LkOZ1HRuk?=
 =?us-ascii?Q?/xFCP19c4aiTBNxKmiZrE0A8mx+FbWs23SBE0RBmCBeLkYZjzMx4OAra1rrH?=
 =?us-ascii?Q?7KLNaq9WbDKIHcvdHZZNhavhTCH5Pj/ruZvks80a7GT/rzJ9RhTyfF09Cuys?=
 =?us-ascii?Q?1wo75yCdvrktaiPTQQtzN998xH+cKxiEarP+Rd+uEKquz3cev/CphxFRUzzT?=
 =?us-ascii?Q?FMjhJw12Ufs+3pL2Ts4ZFUTVuxH6Lr0vlwZ+5HAZlJ5sBEST+MF8b+07hxs0?=
 =?us-ascii?Q?JB2GgM+VsbFCf8hFsLY30RsiSG/fjKLB16I+ICSKvNH2s2CSfpvsuiNDhu4Y?=
 =?us-ascii?Q?vf4023ld8I5tWsapUQ5aFSATZQp4+jN8McXADik8Jc4NsbxaOXNNBijbhDd1?=
 =?us-ascii?Q?eLzb8Bft+Srr3UQbnawqCzTIXvZOJA0ZS9fFqp/QW8pWlpPKpJ0orU4sQtzW?=
 =?us-ascii?Q?sh76nLlpMfEhs2dx4h9Qgquqydr8k/gkvTwVtgEOdrR+JsNbRo1G62gXMZjM?=
 =?us-ascii?Q?aTef/FE82IYITfTw3KGPNqBINeaYTd5JP198olgT0Ndp1P6LAGlkSZzgomDt?=
 =?us-ascii?Q?mjkrSHC0QP0w5ybFQUsAOXtdIDM1BrerCMD9Zpwx2iCaGxLw8W10IKvVwYpM?=
 =?us-ascii?Q?6C/ZuntbuX2zkhn+io1i2lp/p47ivtVjuBluRwCj6vS34aZ3OX+0zDRsMzPQ?=
 =?us-ascii?Q?JNrlBNKcY2T6XGdbSBzxRaAq1Hh0N9I9iSEr5D9wFIWfxbmCWOxEtuhxTE+2?=
 =?us-ascii?Q?DMhcXkXaLfapxG37AcmtXFFyRm3PGcrXWfIY8bMSiVIkoJMhUAZTcYxLJ05l?=
 =?us-ascii?Q?F4/cGLzPL20VxwbsuG3xJYb/538L//foro8LbN7mpjnQuhw25l7gDbZ1mtxf?=
 =?us-ascii?Q?tm3/hcFIkG+dy3TefQVVJsmdkr8msw4V9EkL1eM3uNlEd1hETyAkOczyDIZf?=
 =?us-ascii?Q?vOz8W1go88yw5fz2wAFp3mQwvqQuiDywhrejhSTjDRHwvSIbAAkGqkvbgZfF?=
 =?us-ascii?Q?OpcGLJ7D/fdTmexre2m/8xyrDunNQL1PiQIysvtG/oDOVipAogV2t1pQftBz?=
 =?us-ascii?Q?ynReMk4In29XWdBy0Jx5Aav6UEhmlvTgOimSM9onbl2c4Jty1/KbXwlUfP8e?=
 =?us-ascii?Q?2BoONJXyVASpb5sqcPs9O+LY/hrBXztgfDu3FCNzKQVCRj/Z/OfDpwdaF/Mn?=
 =?us-ascii?Q?g3jLLEhxlZ15BGYS1PdthS5r3Qv/p1ekyMdwxAuw3ZCn1+NV58Zhp1jKTNfw?=
 =?us-ascii?Q?8FS9a7nlLLE4zcS0fRRZn7HJJetykR4dglhV0akVevORt4dPfBlqnJSJIwfi?=
 =?us-ascii?Q?FpLmGhs+3HU7EnKgXLzo6ek2mZEk173t65Th2fm0NI8KANk1oPVs1bjkvFyU?=
 =?us-ascii?Q?2Ru7zlNvOj3/ys+tOtx/HNWJ8Q5NLqBrkMhzlyIGJhIbJXj8GOo7Ws59hppy?=
 =?us-ascii?Q?ery4WZSex4bbp+sBmMAHhnqlben6sW+P9Kp1SkWcbLJXGFBhY2Jk6D7LyWsl?=
 =?us-ascii?Q?srm+oNmPM8VJangC3Y5N5xbq3zotaPFwB9F9aOopbM/yxzrI/7nHS2Gtcphy?=
 =?us-ascii?Q?hJu4bSfzDrjOj3ZFhT+JaI2Xh8mnEZA+pl4w2Ghy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9e1c20-e923-4189-449d-08dce75fb397
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:09:00.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ncmx+QEdgNc1taF3kg/e1MsMkSrhZnBGLAcSCVSn21fe9CwpsrJX2WU5vsuEMswfyaBGNvzJPkabZ8bJWJHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
X-Proofpoint-ORIG-GUID: WYR_apYu28gC6_VviTwVfdXfuC1GANA1
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=6704cc7f cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=3HDBlxybAAAA:8 a=t7CeM3EgAAAA:8 a=DjWbhzI2FnpKf90_BEIA:9
 a=laEoCiVfU_Unz3mSdgXN:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WYR_apYu28gC6_VviTwVfdXfuC1GANA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_04,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410080038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 06:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112705

ChangeLog:
https://www.netfilter.org/projects/nftables/files/changes-nftables-1.1.1.txt

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nftables/{nftables_1.1.0.bb => nftables_1.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.0.bb => nftables_1.1.1.bb} (97%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
similarity index 97%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
index 98e7a85a4..17709016b 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24"
+SRC_URI[sha256sum] = "6358830f3a64f31e39b0ad421d7dadcd240b72343ded48d8ef13b8faf204865a"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.25.1


