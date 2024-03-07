Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA5DC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:18:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17251.1709792327251514696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 22:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UybHIQo1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796226880=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4275A3FA030509
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 22:18:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=B7Qtst4ssZZB6SsS+i
	UEaUjQxiWeWUvVdE1+THxw6wc=; b=UybHIQo1td8lC/PC/dlVdXlUmkhDhSM6Zx
	CUTXmLLbWw/jksR0JU5hwvJybJrFi2Tz5z7bE0+DvF4z+5MSOupTU2rqAZiviNdq
	F4beIT1Ra27lowFZcXz432lzLqUNWt63fWEowLEc9dF4I8s0FsbPiQRc9IDkVpHi
	rl7RcvRtm5c9JHtA1FsOKdmpZw6yj6L92c8Rk3//N1l7HoY4pKyegGTkHB3LgsFF
	Ur7HDTjtt0q5NiwS3l4AETSxYg38lWv1K+dWp/evVhdZrSzcOqEAZlR8pLqbWXjx
	RxoFRpdhmcib+yeWsPcHxJpHRWMOP+u0F1fxGHrhdd4BRMzJ8rww==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4g3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 22:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbBvwvqDUelZUTwB2eZs1jK5ICdo6Ts0nnJnyh+8r0pdLt30/2C4d8eUGz1oqN8sj/bcqWQgPjPf7pXmNgHAZExPoiMXhpkhQpw/nmslqQq8ftjMkqevEO0IyE1632qDxhdIqZpZ2ZdSuIn5J2uylcH8cLhO+e93hQarQc7kGfZ3lvGXkGOGZ8dt+d/w6IjaxFkhA9Bth75FwMN5fAA/Jhpnj2xHin3E5EK85JW0F+rHFfpFyEK610sLDpM+5vlqL6e/AC/17ombCDGlqXwgENDsGU2wsrkTTUZPqnlQMqBNxrdDRJH8+Q4YMtBNrIWyLg9TVdD7VxTxjNsXFLqm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7Qtst4ssZZB6SsS+iUEaUjQxiWeWUvVdE1+THxw6wc=;
 b=GSAJW85Vgb5XGwNt40hsAlgH1NX2JIcMvVfnDnOaeH/UPChIkEzd6BIq2IDS0S7rex104UE1RLjUIYwdh1yqJEMOJqMNFo3+Cw/el0e981hfiE3oNe5ehzyfq7v1r1B2z/etzeXwU/NtoI+igtW4vvlfvkPxFdJlzrOpYS7wCETgYFGZqzMjiMV+Y2PUB1JnozA4htz8h8RzBaPKz+w7tFoQz/Z4mdzzwYbJU1I5JLvKX7XfJ8OKiSgv3BTsUNQEEHWBYSH1/fPPMi1gY/ZkEISmR73IC13CNTiRrhwCvRISECw5Vwj9gek9KSSfJs5lcp2hLgjpp0okA0jS919DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH8PR11MB6856.namprd11.prod.outlook.com (2603:10b6:510:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 06:18:43 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 06:18:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] net-snmp: upgrade 5.9.3 -> 5.9.4
Date: Thu,  7 Mar 2024 14:18:33 +0800
Message-Id: <20240307061833.2848146-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH8PR11MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: a047b3ba-974b-4fcc-df28-08dc3e6e701f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PJlrzdHbn2CMgcbg6nqrqECqKL4gye8hw3MPBnvdWK78lFZCrxqOc2gQScb4dvl0koptifd0zWTFB51Z5kBTEbTwPc8cGGQJjF0eN92S1TB3KuG4VCXBFPawO/GjG8X737LVKNZWXlqJLUw1uBbypwGAXtuwO4amNmWbMjWXZLAtBVbdg6J9ylZMylydECUiZ+IH6X0B29hZskMPEPqlHSoHrDd9xnSyk9YxMzotTHB+iLyvleMe4bkRQKeKxQmwbtsReg4dx/rt1EaUKMlLxvxRLDyQLILrx2QPawqutPTcs+0Sclz1s909JbyD5aBMijD5qxSPdhgcUMz0wjyrsdervilY63Dc+GUXQ1Zsrk7ihx6Mj0zQGq4p5VgrvZPMnwA8AzAGpQ91cSgWyfQaF6xRO3/uACwUAyXuKRqgjufeowB5BP9/k4MAORshEXxzR3NYVfIAagQUmc8sw4dFY/3QejpNSYRMAzFwGpopFbO+taXvDKurYdDs/zb1Hj0jeipLM1qb/hADJbN9/WnzicY7Dnft4+gvyLFTR1YhB1tWHp5bP3PhPKppw08S4ZI/9XAii5YlGMZP7BbkYE61sAhRRgfbyjEAh7YF5hcs0RJFhyrM2LYmGPVdLWQ/ZwbF4eYj+K5Pt8vdFzxHeuwRcNTeVhUYvP5t3heyu2ogZ9L96WKyNHIQ8HxeqP2knsOp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dCK5X6ghxbVa+XF8E0+Uo52naW79uYSIAZY6MYFFkKRpVbYcTttlhNn09lXC?=
 =?us-ascii?Q?0h2rZmDB3RRA8fgjqkEW9+pl3hPgIFflN4Yzg5Belj9ix9i71ADCYAq6KVo9?=
 =?us-ascii?Q?fCycXT7K0MlMc34dqgNDWyC8mLdjLldqFE5GljSXO88MkoDiMp+84VYfiqYa?=
 =?us-ascii?Q?ol5JmrlZSCqtGRyCKqTVVsUK3jIj9ej31qg1VhZhEi4Yuhx829ri0Yx978WM?=
 =?us-ascii?Q?gkQH3EsJeeZJn4kLneW3+v1KIDc5hE/D8NwDZeWxe5rWSf+M6etDXzMGIEbA?=
 =?us-ascii?Q?s+gK0plCnk0IzKaHr+53QC1Z9JLLRI9Rp9uHJOC9ZBx6t01juEawt3Jemn7L?=
 =?us-ascii?Q?BanywacgvBb+bjOLr7V4sIsOlwf68aJLOqBiM2DzcDQW2TosNFUcOp+KQ1Kx?=
 =?us-ascii?Q?anPk34MIGDg1tJm3fnSsjID6gdSHcwGmFuzHKt/raN1CH/1N1BfsPCf+GugG?=
 =?us-ascii?Q?7bDfuOit7Kr16r7nblbgysEgFMlQ2kiuzLFqIpflBr0eGjHDaXYupoDvhNSK?=
 =?us-ascii?Q?t3INj/dGAZuGk4HPdKSi5n+5HXz9esZrMS+iiiQ0PRIbxt28IEw0njoELFtz?=
 =?us-ascii?Q?FPE0tthPpgEyRnXELE4if87kizVHDuqe8P7ZzfYkHIj+/z80wA2INsOhPH9t?=
 =?us-ascii?Q?XzMw5hmHxW7G3UNvtQBUefJe3ZOU0efs4PuvDBv4fdt8wPUdLhfy/9J0cS3T?=
 =?us-ascii?Q?lJkMHzwvB2G4+OGSpIcTzoKPOaEf0JbNt+4GIZqaXUcR9v8S2MwQQ+9PkC/Z?=
 =?us-ascii?Q?K59J9cFl/Sem4LdiqXEG2xtOzB/lGz1SRg+RqaMeO6XKhFFB7gK7cxabaIug?=
 =?us-ascii?Q?p538qr+6lTnWrvPU1HYuucyVThbZRTNHX9pnwPXmdlgH4If6DLkhoPXs3bK7?=
 =?us-ascii?Q?xzyBH0jJieo6jlYyojITd0oEFQniKicY72zagMGoSvH1qjV4UVQN9Uu4YIfk?=
 =?us-ascii?Q?z3GoTL9ALOh83lUKD6HDp/i/ZmYilkmxEu/B7tc+B9veQZdVB5Q9J9e4340w?=
 =?us-ascii?Q?c1ejunyrQAiEvoaclaGRzN2e0D6VRHe6FNi5jNO9L+ncggM22UGis3EoE9RH?=
 =?us-ascii?Q?4QKUNpmPfSzZxNM1KDScVhtRSuTXjEJx41GnY3yaLKPnAG7iDsC8LHShHW7h?=
 =?us-ascii?Q?gWZRrYVXLcGFgoT6JWP6f6WUK3povvEikIL7IxQbNIQ5EDpM+LvtbCX9OwZD?=
 =?us-ascii?Q?t5fKjTkEQPhylvbsJAYcmInllFjVnpPChfNqHSA6Vg3cqbsvOCYjz0JRccJ8?=
 =?us-ascii?Q?jw7Xzj8cS5nwhkBTb/ErOZDb8zxfYqx0vub5mmbOM4bTX+lhyH1HlpRbCsVO?=
 =?us-ascii?Q?JzOtBi0lJJFGADImw4gF23Fjd7hbSBZwM7Z6vpzFMp2EJP3cQ+Dm624m+F5B?=
 =?us-ascii?Q?+Rof+y2t1oGy0Fz3ofDWlLINsm3vyRGuubrxPfFEz0wOxS2TQWNuesM+Bw9e?=
 =?us-ascii?Q?f82Y49RoT5gQKFAFKQOSS9VhFY7aD5n8tJFRKPEIDtZb9mtcDuLRkay+SgZL?=
 =?us-ascii?Q?hdiuSdYEbSAGWMhlC+kijs1sXt3wfl55IuADHVYRrkmkgjRpwGDwe2+bbiDW?=
 =?us-ascii?Q?OxIv53Fah7n94ju1vmD9OZeyC0VbsJoPcTq0G4c8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a047b3ba-974b-4fcc-df28-08dc3e6e701f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 06:18:43.1497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TE5qkHkUD+4un/PIyJ5mvZ9wM7AsPclFzakL3crX9LWbTE7wMfQhGCK8oDiG5QXjzO5Fb4zzjvD0VkW+ifPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
X-Proofpoint-ORIG-GUID: RyagGygdVfl112MUQkFZaM-yjM0Wo5uk
X-Proofpoint-GUID: RyagGygdVfl112MUQkFZaM-yjM0Wo5uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 06:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109191

ChangeLog:
https://github.com/net-snmp/net-snmp/blob/V5-9-patches/CHANGES

* Refresh patches
* Drop backport CVE patch
* Drop 0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch as the
  issue has been fixed upstream.
* Add a patch to fix build on musl

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/net-snmp/files/init     |   0
 ...eturn-attribute-to-netsnmp_pci_error.patch |  32 -----
 ...dd-knob-whether-nlist.h-are-checked.patch} |   8 +-
 ...=> 0002-net-snmp-fix-libtool-finish.patch} |  10 +-
 ...ing-add-the-output-format-for-ptest.patch} |   6 +-
 ...=> 0004-config_os_headers-Error-Fix.patch} |   8 +-
 ...c-Don-t-check-for-return-from-EVP_M.patch} |  13 +-
 ...-get_pid_from_inode-Include-limit.h.patch} |   6 +-
 ...07-configure-fix-incorrect-variable.patch} |   8 +-
 ...nmp-fix-engineBoots-value-on-SIGHUP.patch} |  12 +-
 ...> 0009-net-snmp-fix-for-disable-des.patch} |  10 +-
 ...cibility-Don-t-check-build-host-for.patch} |  10 +-
 ...h.m4-keep-consistent-between-32bit-.patch} |   6 +-
 ...onfiguration-of-NETSNMP_FD_MASK_TYPE.patch |  43 +++++++
 .../CVE-2022-44792-CVE-2022-44793.patch       | 121 ------------------
 .../net-snmp/net-snmp/run-ptest               |   0
 .../{net-snmp_5.9.3.bb => net-snmp_5.9.4.bb}  |  31 ++---
 17 files changed, 118 insertions(+), 206 deletions(-)
 mode change 100755 => 100644 meta-networking/recipes-protocols/net-snmp/files/init
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{net-snmp-add-knob-whether-nlist.h-are-checked.patch => 0001-net-snmp-add-knob-whether-nlist.h-are-checked.patch} (90%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{fix-libtool-finish.patch => 0002-net-snmp-fix-libtool-finish.patch} (89%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{net-snmp-testing-add-the-output-format-for-ptest.patch => 0003-testing-add-the-output-format-for-ptest.patch} (92%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0001-config_os_headers-Error-Fix.patch => 0004-config_os_headers-Error-Fix.patch} (91%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch => 0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch} (90%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0001-get_pid_from_inode-Include-limit.h.patch => 0006-get_pid_from_inode-Include-limit.h.patch} (90%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0004-configure-fix-incorrect-variable.patch => 0007-configure-fix-incorrect-variable.patch} (90%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch => 0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch} (87%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{net-snmp-fix-for-disable-des.patch => 0009-net-snmp-fix-for-disable-des.patch} (80%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{reproducibility-have-printcap.patch => 0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch} (90%)
 rename meta-networking/recipes-protocols/net-snmp/net-snmp/{0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch => 0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch} (94%)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
 mode change 100755 => 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.3.bb => net-snmp_5.9.4.bb} (92%)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/init b/meta-networking/recipes-protocols/net-snmp/files/init
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
deleted file mode 100644
index 6fbace75a..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5719f40db65a72624a0b0f08e546d12bf823bd1e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Jan 2023 14:38:44 -0800
-Subject: [PATCH] Add noreturn attribute to netsnmp_pci_error()
-
-Fixes build with clang16
-| mibgroup/if-mib/data_access/interface_linux.c:152:23: error: incompatible function pointer types assigning to 'void (*)(char *, ...) __attribute__((noreturn))' from 'void (char *, ...)' [-Wincompatible-function-pointer-types]
-|     pci_access->error = netsnmp_pci_error;
-|                       ^ ~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- agent/mibgroup/if-mib/data_access/interface_linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/agent/mibgroup/if-mib/data_access/interface_linux.c b/agent/mibgroup/if-mib/data_access/interface_linux.c
-index c6cc54e..12eb865 100644
---- a/agent/mibgroup/if-mib/data_access/interface_linux.c
-+++ b/agent/mibgroup/if-mib/data_access/interface_linux.c
-@@ -31,7 +31,7 @@ static struct pci_access *pci_access;
- /* Avoid letting libpci call exit(1) when no PCI bus is available. */
- static int do_longjmp =0;
- static jmp_buf err_buf;
--static void
-+__attribute__((noreturn))  static void
- netsnmp_pci_error(char *msg, ...)
- {
-     va_list args;
--- 
-2.39.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-add-knob-whether-nlist.h-are-checked.patch
similarity index 90%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-add-knob-whether-nlist.h-are-checked.patch
index 3152ce288..ea9dccac2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -1,4 +1,4 @@
-From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 2001
+From 787269b337e70f073e194c3b361eaf4d5f2291ce Mon Sep 17 00:00:00 2001
 From: Chong Lu <Chong.Lu@windriver.com>
 Date: Thu, 28 May 2020 09:46:34 -0500
 Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
@@ -9,13 +9,12 @@ Add knob to decide whether nlist.h are checked or not.
 Upstream-Status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-
 ---
  configure.d/config_os_headers | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index b9c8c31..01c3376 100644
+index 584064e..c0688f8 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
 @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
@@ -34,3 +33,6 @@ index b9c8c31..01c3376 100644
  
  #  Library:
  AC_CHECK_HEADERS([crt_externs.h                        ] dnl
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-net-snmp-fix-libtool-finish.patch
similarity index 89%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0002-net-snmp-fix-libtool-finish.patch
index 409c1e03c..e951537b0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-net-snmp-fix-libtool-finish.patch
@@ -1,4 +1,4 @@
-From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 2001
+From 5f002c3cc46ecf4d4a29571309f2cc0d3d34330f Mon Sep 17 00:00:00 2001
 From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Fri, 16 Jan 2015 14:14:01 +0800
 Subject: [PATCH] net-snmp: fix "libtool --finish"
@@ -14,16 +14,15 @@ rpm-postinst for each recipe while do_package, in package.bbclass.
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
 ---
  Makefile.top | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.top b/Makefile.top
-index a962c54..1ba5607 100644
+index d1b3923..53e0392 100644
 --- a/Makefile.top
 +++ b/Makefile.top
-@@ -89,7 +89,7 @@ LIBREVISION = 0
+@@ -89,7 +89,7 @@ LIBREVISION = 1
  LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o
  LIB_EXTENSION   = la
  LIB_VERSION     =
@@ -32,3 +31,6 @@ index a962c54..1ba5607 100644
  LINK		= $(LIBTOOL) --mode=link $(LINKCC)
  # RANLIB 	= @RANLIB@
  RANLIB		= :
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-testing-add-the-output-format-for-ptest.patch
similarity index 92%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0003-testing-add-the-output-format-for-ptest.patch
index 09ca532a7..ab5449293 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-testing-add-the-output-format-for-ptest.patch
@@ -1,4 +1,4 @@
-From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 2001
+From 2a1a2b58af09c6c03026474f1fd0db7d36e977c7 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 14 Jan 2015 15:10:06 +0800
 Subject: [PATCH] testing: add the output format for ptest
@@ -6,7 +6,6 @@ Subject: [PATCH] testing: add the output format for ptest
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  testing/RUNTESTS | 4 ++++
  1 file changed, 4 insertions(+)
@@ -33,3 +32,6 @@ index 6715831..a2b6fb8 100755
  done
  
  if [ -f failed_tests ]; then
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-config_os_headers-Error-Fix.patch
similarity index 91%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0004-config_os_headers-Error-Fix.patch
index 5aea52788..e2269bc3e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-config_os_headers-Error-Fix.patch
@@ -1,4 +1,4 @@
-From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 2001
+From b1c941c20577578aa5ff3450d9d8d7a23c55d14a Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 18:23:13 +0900
 Subject: [PATCH] config_os_headers: Error Fix
@@ -13,13 +13,12 @@ conftest.c:168:17: fatal error: pkg.h: No such file or directory
 Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
-
 ---
  configure.d/config_os_headers | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index 01c3376..6edd85f 100644
+index c0688f8..f68713c 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
 @@ -395,8 +395,8 @@ then
@@ -33,3 +32,6 @@ index 01c3376..6edd85f 100644
      AC_CHECK_HEADERS(pkg.h,
          NETSNMP_SEARCH_LIBS(pkg_init, pkg,
  	    AC_DEFINE(HAVE_LIBPKG, 1, [define if you have BSD pkg-ng])))
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
similarity index 90%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
index 6450c1cc9..7a6b35460 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -1,25 +1,23 @@
-From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 2001
+From c790411f9aa82064fea9bbf23b499fb6b7f22c4f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 18 Sep 2015 00:28:45 -0400
 Subject: [PATCH] snmplib/keytools.c: Don't check for return from
-
  EVP_MD_CTX_init()
 
 EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
 
 snmplib/keytools.c: In function 'generate_Ku': error: invalid use of void expression
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-
 ---
-Upstream-Status: Pending
-
  snmplib/keytools.c | 5 +----
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/snmplib/keytools.c b/snmplib/keytools.c
-index 14a452a..fb1694b 100644
+index 388e655..5a66898 100644
 --- a/snmplib/keytools.c
 +++ b/snmplib/keytools.c
 @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
@@ -34,3 +32,6 @@ index 14a452a..fb1694b 100644
  #endif
      if (!EVP_DigestInit(ctx, hashfn)) {
          rval = SNMPERR_GENERR;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0006-get_pid_from_inode-Include-limit.h.patch
similarity index 90%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0006-get_pid_from_inode-Include-limit.h.patch
index a7881a871..6a0161ae2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0006-get_pid_from_inode-Include-limit.h.patch
@@ -1,4 +1,4 @@
-From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 2001
+From 95868615a04b4a6f0dd5997c9726422828426116 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 22 Jul 2016 18:34:39 +0000
 Subject: [PATCH] get_pid_from_inode: Include limit.h
@@ -8,7 +8,6 @@ PATH_MAX and NAME_MAX are required by this file
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  agent/mibgroup/util_funcs/get_pid_from_inode.c | 1 +
  1 file changed, 1 insertion(+)
@@ -25,3 +24,6 @@ index 5788e1d..ea380a6 100644
  #include <stdio.h>
  #ifdef HAVE_STDLIB_H
  #include <stdlib.h>
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0007-configure-fix-incorrect-variable.patch
similarity index 90%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0007-configure-fix-incorrect-variable.patch
index 6e224188a..5d394eec1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0007-configure-fix-incorrect-variable.patch
@@ -1,4 +1,4 @@
-From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 2001
+From 385fa343cf178ccfe2c9a9fd7795d0db3c959fdd Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 17:10:20 +0800
 Subject: [PATCH] configure: fix incorrect variable
@@ -8,13 +8,12 @@ For cross compile platform, this variable will not be correct, so fix it.
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-
 ---
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index f1cbbf5..1545be3 100644
+index 1c1182e..f947b8c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -173,7 +173,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
@@ -26,3 +25,6 @@ index f1cbbf5..1545be3 100644
          if test $$? != 0 ; then \
             exit 1 ; \
          fi
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
similarity index 87%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
index 35e93d636..a57c4c8f1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,4 +1,4 @@
-From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 2001
+From b5cbe0953a7e7a3c77c7ec69dfe81254475f08c0 Mon Sep 17 00:00:00 2001
 From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
 Date: Wed, 9 Jun 2021 15:47:30 +0900
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
@@ -8,14 +8,13 @@ Upstream-Status: Pending
 Signed-off-by: Marian Florea <marian.florea@windriver.com>
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-
 ---
  agent/snmpd.c    | 1 +
  snmplib/snmpv3.c | 4 ++--
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index 90de12d..1ccc4db 100644
+index fe31c87..d9f68dd 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
 @@ -1169,6 +1169,7 @@ snmpd_reconfig(void)
@@ -27,10 +26,10 @@ index 90de12d..1ccc4db 100644
  #ifdef HAVE_SIGPROCMASK
      ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
-index 7b1746b..4a17e0d 100644
+index be9256f..d17d2e3 100644
 --- a/snmplib/snmpv3.c
 +++ b/snmplib/snmpv3.c
-@@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
+@@ -1071,9 +1071,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
      /*
       * if our engineID has changed at all, the boots record must be set to 1 
       */
@@ -42,3 +41,6 @@ index 7b1746b..4a17e0d 100644
          engineBoots = 1;
      }
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0009-net-snmp-fix-for-disable-des.patch
similarity index 80%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0009-net-snmp-fix-for-disable-des.patch
index c382c02d8..36a676fb0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0009-net-snmp-fix-for-disable-des.patch
@@ -1,4 +1,4 @@
-From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 2001
+From aa1f157c675da248ed186e020d17cb2528d0be12 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 22 Jun 2017 10:25:08 +0800
 Subject: [PATCH] net-snmp: fix for --disable-des
@@ -9,16 +9,15 @@ the --disable-des works correctly.
 Upstream-Status: Submitted [net-snmp-coders@lists.sourceforge.net]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  snmplib/scapi.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 54fdd5c..0f7e931 100644
+index ac77004..7545bfa 100644
 --- a/snmplib/scapi.c
 +++ b/snmplib/scapi.c
-@@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
+@@ -86,7 +86,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
  #include <openssl/hmac.h>
  #include <openssl/evp.h>
  #include <openssl/rand.h>
@@ -28,3 +27,6 @@ index 54fdd5c..0f7e931 100644
  #ifdef HAVE_AES
  #include <openssl/aes.h>
  #endif
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch
similarity index 90%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch
index 5fbb411a5..246ce2b8d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch
@@ -1,4 +1,4 @@
-From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 2001
+From a96140995d10660046146d9fa75faa5f7faabab0 Mon Sep 17 00:00:00 2001
 From: "douglas.royds" <douglas.royds@taitradio.com>
 Date: Wed, 21 Nov 2018 13:52:18 +1300
 Subject: [PATCH] net-snmp: Reproducibility: Don't check build host for
@@ -8,14 +8,13 @@ cross-compiling. Use AC_CHECK_FILE to set the cached variable
 ac_cv_file__etc_printcap instead. When cross-compiling, this variable should be
 set in the environment to "yes" or "no" as appropriate for the target platform.
 
----
 Upstream-Status: Pending
-
+---
  configure.d/config_os_misc4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_misc4 b/configure.d/config_os_misc4
-index b6864d9..07ca922 100644
+index 4c445d6..099257f 100644
 --- a/configure.d/config_os_misc4
 +++ b/configure.d/config_os_misc4
 @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH != x; then
@@ -30,3 +29,6 @@ index b6864d9..07ca922 100644
  
  
  #       Check ps args
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch
similarity index 94%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
rename to meta-networking/recipes-protocols/net-snmp/net-snmp/0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch
index 0eeddf752..1e845c4e6 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch
@@ -1,4 +1,4 @@
-From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 2001
+From 85a6c5017a2cd18a5a66afcb3f6a02276c101ad0 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 29 Jan 2021 08:49:15 +0000
 Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and
@@ -16,7 +16,6 @@ So add the patch to fix the gap between 32bit and 64bit system.
 Upstream-Status: Inappropriate [configuration specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  m4/ac_add_search_path.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -36,3 +35,6 @@ index 8e0a819..e9585bc 100644
       fi
       if test -d $1/include; then
  	CPPFLAGS="-I$1/include $CPPFLAGS"
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
new file mode 100644
index 000000000..9d4b76993
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
@@ -0,0 +1,43 @@
+From 21ea0b9ce5cc9445f7ffd7a9020b816681e16284 Mon Sep 17 00:00:00 2001
+From: Adam Gajda <adgajda@users.noreply.github.com>
+Date: Mon, 2 Oct 2023 16:40:31 +0200
+Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
+
+Upstream-Status: Backport
+[https://github.com/net-snmp/net-snmp/commit/af1b7f77975bbb2fcbdb3f005f8cb010d1d33cd3]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure                        | 2 +-
+ configure.d/config_project_types | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 907d441..f4468c6 100755
+--- a/configure
++++ b/configure
+@@ -31638,7 +31638,7 @@ CFLAGS="$CFLAGS -Werror"
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
+ printf %s "checking for the type of fd_set::fds_bits... " >&6; }
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff --git a/configure.d/config_project_types b/configure.d/config_project_types
+index 1b4c66b..a78e8eb 100644
+--- a/configure.d/config_project_types
++++ b/configure.d/config_project_types
+@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
+ CFLAGS="$CFLAGS -Werror"
+ 
+ AC_MSG_CHECKING([for the type of fd_set::fds_bits])
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <sys/select.h>
+ #include <stddef.h>
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
deleted file mode 100644
index b18d4dc29..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From d13302656d9ff0807c5defe18623adc947f43a2b Mon Sep 17 00:00:00 2001
-From: Narpat Mali <narpat.mali@windriver.com>
-Date: Wed, 8 Feb 2023 13:15:39 +0000
-Subject: [PATCH] agent: Disallow SET requests with any NULL varbind Merge pull
- request #490 from fenner/set-null
-
-fixes: #474 and #475
-
-CVE: CVE-2022-44792, CVE-2022-44793
-
-Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57]
-
-Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
----
- agent/snmp_agent.c                            | 32 +++++++++++++++++++
- apps/snmpset.c                                |  1 +
- .../default/T0142snmpv2csetnull_simple        | 31 ++++++++++++++++++
- 3 files changed, 64 insertions(+)
- create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple
-
-diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
-index 867d0c1..3f678fe 100644
---- a/agent/snmp_agent.c
-+++ b/agent/snmp_agent.c
-@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
-     return 1;
- }
- 
-+static int
-+check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
-+{
-+    int i;
-+    netsnmp_variable_list *v = NULL;
-+
-+    for (i = 1, v = asp->pdu->variables; v != NULL; i++, v = v->next_variable) {
-+	if (v->type == ASN_NULL) {
-+	    /*
-+	     * Protect SET implementations that do not protect themselves
-+	     * against wrong type.
-+	     */
-+	    DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for varbind %d\n", i));
-+	    asp->index = i;
-+	    return SNMP_ERR_WRONGTYPE;
-+	}
-+    }
-+    return SNMP_ERR_NOERROR;
-+}
-+
- int
- handle_pdu(netsnmp_agent_session *asp)
- {
-     int             status, inclusives = 0;
-     netsnmp_variable_list *v = NULL;
- 
-+#ifndef NETSNMP_NO_WRITE_SUPPORT
-+    /*
-+     * Check for ASN_NULL in SET request
-+     */
-+    if (asp->pdu->command == SNMP_MSG_SET) {
-+	status = check_set_pdu_for_null_varbind(asp);
-+	if (status != SNMP_ERR_NOERROR) {
-+	    return status;
-+	}
-+    }
-+#endif /* NETSNMP_NO_WRITE_SUPPORT */
-+
-     /*
-      * for illegal requests, mark all nodes as ASN_NULL 
-      */
-diff --git a/apps/snmpset.c b/apps/snmpset.c
-index 48e14bd..d542713 100644
---- a/apps/snmpset.c
-+++ b/apps/snmpset.c
-@@ -182,6 +182,7 @@ main(int argc, char *argv[])
-             case 'x':
-             case 'd':
-             case 'b':
-+            case 'n': /* undocumented */
- #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
-             case 'I':
-             case 'U':
-diff --git a/testing/fulltests/default/T0142snmpv2csetnull_simple b/testing/fulltests/default/T0142snmpv2csetnull_simple
-new file mode 100644
-index 0000000..0f1b8f3
---- /dev/null
-+++ b/testing/fulltests/default/T0142snmpv2csetnull_simple
-@@ -0,0 +1,31 @@
-+#!/bin/sh
-+
-+. ../support/simple_eval_tools.sh
-+
-+HEADER SNMPv2c set of system.sysContact.0 with NULL varbind
-+
-+SKIPIF NETSNMP_DISABLE_SET_SUPPORT
-+SKIPIF NETSNMP_NO_WRITE_SUPPORT
-+SKIPIF NETSNMP_DISABLE_SNMPV2C
-+SKIPIFNOT USING_MIBII_SYSTEM_MIB_MODULE
-+
-+#
-+# Begin test
-+#
-+
-+# standard V2C configuration: testcomunnity
-+snmp_write_access='all'
-+. ./Sv2cconfig
-+STARTAGENT
-+
-+CAPTURE "snmpget -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0"
-+
-+CHECK ".1.3.6.1.2.1.1.4.0 = STRING:"
-+
-+CAPTURE "snmpset -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0 n x"
-+
-+CHECK "Reason: wrongType"
-+
-+STOPAGENT
-+
-+FINISHED
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest b/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
similarity index 92%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 6f1c11417..5da06bb6d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -14,22 +14,21 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://snmptrapd.conf \
            file://snmpd.service \
            file://snmptrapd.service \
-           file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
-           file://fix-libtool-finish.patch \
-           file://net-snmp-testing-add-the-output-format-for-ptest.patch \
            file://run-ptest \
-           file://0001-config_os_headers-Error-Fix.patch \
-           file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
-           file://0001-get_pid_from_inode-Include-limit.h.patch \
-           file://0004-configure-fix-incorrect-variable.patch \
-           file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
-           file://net-snmp-fix-for-disable-des.patch \
-           file://reproducibility-have-printcap.patch \
-           file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
-           file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch \
-           file://CVE-2022-44792-CVE-2022-44793.patch \
-           "
-SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
+           file://0001-net-snmp-add-knob-whether-nlist.h-are-checked.patch \
+           file://0002-net-snmp-fix-libtool-finish.patch \
+           file://0003-testing-add-the-output-format-for-ptest.patch \
+           file://0004-config_os_headers-Error-Fix.patch \
+           file://0005-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
+           file://0006-get_pid_from_inode-Include-limit.h.patch \
+           file://0007-configure-fix-incorrect-variable.patch \
+           file://0008-net-snmp-fix-engineBoots-value-on-SIGHUP.patch \
+           file://0009-net-snmp-fix-for-disable-des.patch \
+           file://0010-net-snmp-Reproducibility-Don-t-check-build-host-for.patch \
+           file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
+           file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
+          "
+SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
@@ -152,6 +151,8 @@ do_install:append() {
         -e "s@^NSC_LDFLAGS=\"-L.* @NSC_LDFLAGS=\"-L\$\{libdir\} @g" \
         -i ${D}${bindir}/net-snmp-config
 
+    sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${bindir}/net-snmp-create-v3-user
+
     oe_multilib_header net-snmp/net-snmp-config.h
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.25.1


