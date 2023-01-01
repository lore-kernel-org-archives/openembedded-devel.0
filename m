Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136ECC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 07:28:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7055.1672558077739259423
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 23:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MRPKnGmr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017PQ2W005202
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=k/ygn2nT3RtUbmRpEK6vIHzA2jv08n1e0TR8WuV+nlw=;
 b=MRPKnGmrWZtIO5Xsho0ECNz0mOgpZ41w2AOF9CAouCF4KqCMGlXWT8K+eAev5vjPCnvR
 pXzZoTfCnljQ3zMOplyPlwJLs+iENBPH83LF5CfC+AHepm0Cb2MYMY4lMAETwaMDZK6X
 IBhvcJWfm2e8+5LOVqjizL1Db0mp8Xl74qur8zBXCtfYBJWMy232IsTmqdpTpvKY3dGp
 lSkSDWr5jufinhCJhXv8DBxkK1qAhgFWj5OXJvlrE9zlWsvuRlirJpd+XFQ0l5xcJyG4
 wtV4KjcsyokCLGTwRgKDn5nWZ6OHu8whvdN9Q+FDwPJdHoEp/LzgMqMRphnzOMWyRjWK 6Q== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87rd7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwSgO12oaxW+RIfJZYeJ9bRpVZ5eiAs8yA8M7QzFY9UdrAV7U3S0kgQT4pWeg96rhi75LrAub8ID1621hHBaLPaSzK52/B8LxnlcqrfRmct493jW3ru1MaqLHYhedt+/wgMWMJVSSiiFkhf/oSlXV+XYKoFcj5SrhwPtffrWiJfLD+KgNR0nZvYrV2GHTgYDdYmHKSD/DaT4FdsTQrA3Im0GpJsV1g1pZU6PMLB57bE8K/nE8UNLjhNrqL+2kO6qa5y4/mKc+01shSU6XD9BLdZQ2U2iLJNkXPLRMj+ckgFaFEy9fQEXcHp2vH0FB2THC6CWLrJXixViDiLgl9PWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/ygn2nT3RtUbmRpEK6vIHzA2jv08n1e0TR8WuV+nlw=;
 b=VSlJ4rymMxQfKki9+UMbQwJvcN3eRxu9ljIr0U2Odf1emCH+L1zSB+yn8jXDBfD7CeR0W7zoWofvYY8HalXoBgvuo/YBiDoqAulQU5/h04pFbu/E+9MQZ11/zWBdeyW6L39Fja9TvfPrMO0MliVYjduZEgVSLj4lCoHcvjSYNLXro+zljgHZsMwCCSlHt4KjOKLjWIzPAdj7QEefdGLhZcnJhufm1HcO8Q6s5KbSPJeBuOe3GU+ox90s1PAxRyhsh5iroR/IXkBdoBYO9D05sXh9plZYcC5QCYw/aJGPV2Xj2/+bgVI9L6rpnya26d+xKgHYrVm/lB5Qk4Of7ARP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 07:27:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 07:27:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/5] samba upgrade 4.14.14 -> 4.17.4
Date: Sun,  1 Jan 2023 15:27:39 +0800
Message-Id: <20230101072739.75462-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230101072739.75462-1-yi.zhao@windriver.com>
References: <20230101072739.75462-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c559526-1ffa-4f23-8d50-08daebc9b1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fnz3Y/T/AczVLmqSC/8iRGQvylwqtbUhTbpHmb+7TVEh5jOv/ZGsXWSQ5+ra6HUno0hldj5nEXisX/PQxaYOqWAd7GdUIQ2eGJ4KK4Dc7/b2N+r3Cqc0bEpfMOS2WVdNRJbZaxLtqQ1Ksbzl2idH9Cd/IR9qm0NKuMJrliGxUrtjlAVtCIiBCP4ApAOtdv2TavdRzSG66aaLD9au8vgsSCw7u0xUJaK/4GGuf+jer2aLg8khBkJ8D1XjEs3txG7jDXVD61sVbDZ9Vk8zDGnwlMiKRkUWfnAJdMJs9iYISKLERYXLE0IAUUBMweGQnj/vpU56XrBSWY/HKO2KGKjQAo76dzjkrHgALNBpB5C9IUlLYitSXwApA4bZjgPGWBPFypsMB9WGZ19yp2CFU6k3EeiEODBoh2/mkpQ7BqAGwgFddtjWFwrSOSqGczA3i9QHacbqScREP4SEvZhCbS8w7EfPOMikSXYVWTnGSNP6voSjdoNCGGwJY/kK/37BLpJyFCcHFBRX7dWrK0PNodotGCGuRLdW7yO4kmhWFaw6vSm2+Z3MlXxAJugt/FbGHqSZlm0j1A+tp/0N6j+SlqqKargH5DP+5PHtTUw1BY10+CE7UkmFfJjRsdw2rQaCme7qQHSOBzhHnLaeu+yOIeAxqM2QmOUgKIaXK3VZXeTzLr2fSQ9FB7ThcfXdEuo81aaU0v7ZWr/+jDvK2qkXq394BMaUDp2lMib8KIFrxKf+l5bate5W50QOw+z+BxE93Kva
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(6666004)(8936002)(84970400001)(53546011)(38350700002)(478600001)(6506007)(38100700002)(6916009)(52116002)(2906002)(86362001)(41300700001)(2616005)(26005)(186003)(966005)(6512007)(36756003)(44832011)(16799955002)(66556008)(30864003)(83380400001)(66476007)(5660300002)(316002)(6486002)(66946007)(1076003)(8676002)(22166003)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ofogayHG4jkUjGRZVTkliCglIDOmnJsHpvh5PBBylq4TPtDCYSDjX8HgB+MA?=
 =?us-ascii?Q?f5dVWLiNsl9orfc38qf5NGeskHDb5LmHyLbEO66ktvyNCOYpJtU89xlnsFZs?=
 =?us-ascii?Q?zezjqZV4q6WYiUHVVLDdrq4FU0N5ixe8DoSTblxftXUMCivUY2r8XH0vfjZS?=
 =?us-ascii?Q?xnH88cz81aGQ9WCD8k5Xx+Unjq3HmSwaYDKH80CMVMgkO/OLyn+GVNypYxMZ?=
 =?us-ascii?Q?CapdHqFBZnOqK2WO5f3hRAZqD3NGxZ4a1m454KEPn6zvGyHEfl72OtVbDFQG?=
 =?us-ascii?Q?e/6A1xuehCTSOo8enoWRa8TSz8u7RJkBfW7KTDGVCnIegYUmlKNf5ctlFmRA?=
 =?us-ascii?Q?HfIDX4z2rTOPvwRJ5T78OxcQDnizIliVp30RcQ2r4rUosHCQyBjzrQVXHH4s?=
 =?us-ascii?Q?3yD46JMoI9vG1yLT74yS72QwTtPiEIhtt2S7tehVfAhl4U6lmNnPgQboqX4T?=
 =?us-ascii?Q?WgzKzgJZOHBlxeYtrJimqhD9zd8WDthW8ac04Ugml5t9Iwt4DwqQJPzTcy5d?=
 =?us-ascii?Q?9JFpwp62/+Qnwj15Sj6ks4FOqH29rSJyyPrDWw9lClkDPN4lrvqjHoOTJw7w?=
 =?us-ascii?Q?8k/P6SIS52m4XusPYh7bazOKgLoyn0qeOvkqZJueWwel+2/F2OCCyv5dGRH7?=
 =?us-ascii?Q?vCvwq+3dOWxCTpvmCNsaGdb9bOmXC9uSdm5rFu806wXzUTfE/aQHFL1wIAIr?=
 =?us-ascii?Q?ItT88l7anHXguQo7/ap4+16R3o6DNDcYc36ZEB+4nma7e/Eq3SIkrK90x9HG?=
 =?us-ascii?Q?nsXMX4fT8+qWkInxoOCRUahznebnEY94kR5wckDlPEIoNFvGSRK3ohFZqbv1?=
 =?us-ascii?Q?yOGmzomN62R7EVkHFGeeqZEolSi9jgx+omUM6UE+pthv3PwhGX9giM1VIv27?=
 =?us-ascii?Q?p5M/ymIh57Sb4DmWV2QWPcoGajyUaA8Qm/KNLicJIJBKLe9c3heq45JaK2Ys?=
 =?us-ascii?Q?VgOPWieRX3sm/AyZeEOf3F86kTr+Nk0yh6NmW+uDSmVWrADoD8sca5HZmLCp?=
 =?us-ascii?Q?dd1j/yQNBfG3E0mIE4Z0iKk+OHqi0ElGNUAydal5bb56QaJYxOuPpXtHNgKF?=
 =?us-ascii?Q?Ecb2ogKVxbCxsLCRXD8jKEP0apL13HhgsRezW/GA+RuyiHJ/pVSB29ILOD5k?=
 =?us-ascii?Q?1G90OxjB/4VjlGgwlZLExQB8crpCYXUA9kTUjHXVv2DPTAbAw2BC08C/IyNC?=
 =?us-ascii?Q?gOiyFq3vx1h9w/I+GNk2VYy8G0DelFmwwVjkAghNYkbjDK7LukFtZayWcAlw?=
 =?us-ascii?Q?id6x0FoD3eDHh4L0eZfkXdIzRe8GuUdHs6CuO7epKy4zChQinwkn6aFcC6xc?=
 =?us-ascii?Q?+zt1HXKMhAsBjlY2xH31JmHRoJoYEWCMhvubXjZXnKiaQMWGDS/GOJThm8Km?=
 =?us-ascii?Q?X4fE7Ubk6ndq6gBy41X75gQGEo4DRjBNciPe+BCx6qoq+kA5o8TfE1t9k+en?=
 =?us-ascii?Q?TjQdDp0lqdDI25dokeUJ3pkJJXdblAGkT1BK1GGAiwjbaCQXj4NAkt62iam6?=
 =?us-ascii?Q?I5YDR070f18DWcd5pcN4XVYQCiKdxj9NUcbnIHe2VKTh1guZFL3T2yqr65ic?=
 =?us-ascii?Q?3pTZfsU6+2yo+0jJ8gPxynP2MIwuJSQdsqDaLieU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c559526-1ffa-4f23-8d50-08daebc9b1e2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 07:27:53.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04mvE3bBCZXAkrf/n507inmP/sA8wHOBttm7+p1f0qY5Ci2SCir+9LHkJ0p1pepRkAaJ+0GZ1hhjOdaCQseCfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-Proofpoint-ORIG-GUID: ptDAVlZQ_IGF32bVDW0PrETLZHTC2VDP
X-Proofpoint-GUID: ptDAVlZQ_IGF32bVDW0PrETLZHTC2VDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_16,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301010068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 07:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100334

The 4.14.x is EOL:
https://wiki.samba.org/index.php/Samba_Release_Planning
Upgrade to latest 4.17.x.

Release Notes:
https://www.samba.org/samba/history/samba-4.17.0.html
https://www.samba.org/samba/history/samba-4.17.4.html

* Refresh patches
* Update PACKAGECONFIG
* Split a new package ctdb
* Add a patch to skip checking PYTHONHASHSEED
* Drop the following patches as these issues have been fixed upstream:
  0005-samba-build-dnsserver_common-code.patch
  netdb_defines.patch
  samba-fix-musl-lib-without-innetgr.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cross-answers-aarch64.txt                 |  1 +
 .../cross-answers-aarch64_be.txt              |  1 +
 .../waf-cross-answers/cross-answers-arm.txt   |  1 +
 .../waf-cross-answers/cross-answers-armeb.txt |  1 +
 .../waf-cross-answers/cross-answers-i586.txt  |  1 +
 .../waf-cross-answers/cross-answers-i686.txt  |  1 +
 .../waf-cross-answers/cross-answers-mips.txt  |  1 +
 .../cross-answers-mips64.txt                  |  1 +
 .../cross-answers-mips64el.txt                |  1 +
 .../cross-answers-mipsel.txt                  |  1 +
 .../cross-answers-powerpc.txt                 |  1 +
 .../cross-answers-powerpc64.txt               |  1 +
 .../cross-answers-powerpc64le.txt             |  1 +
 .../cross-answers-riscv32.txt                 |  1 +
 .../cross-answers-riscv64.txt                 |  1 +
 .../cross-answers-x86_64.txt                  |  1 +
 .../0001-Don-t-check-xsltproc-manpages.patch  | 12 +--
 ...rt-target-module-while-cross-compile.patch | 10 +--
 ...3-Add-config-option-without-valgrind.patch | 12 +--
 ...tions-to-configure-the-use-of-libbsd.patch | 14 +--
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 +--
 ...05-samba-build-dnsserver_common-code.patch | 30 -------
 ...rture-skip-test-case-tfork_cmd_send.patch} |  2 +-
 ...th-Werror-implicit-function-declara.patch} |  6 +-
 ...of-python-to-fix-the-install-confli.patch} | 49 +++++-----
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++
 .../samba/samba/cmocka-uintptr_t.patch        | 10 +--
 .../samba/samba/netdb_defines.patch           | 19 ----
 .../samba/samba-4.3.9-remove-getpwent_r.patch | 22 ++---
 .../samba-fix-musl-lib-without-innetgr.patch  | 42 ---------
 .../samba/samba/samba-pam.patch               | 12 +--
 .../{samba_4.14.14.bb => samba_4.17.4.bb}     | 89 ++++++++++---------
 32 files changed, 177 insertions(+), 208 deletions(-)
 rename meta-networking/recipes-connectivity/samba/samba/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0005-Fix-pyext_PATTERN-for-cross-compilation.patch} (90%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0005-samba-build-dnsserver_common-code.patch
 rename meta-networking/recipes-connectivity/samba/samba/{0001-smbtorture-skip-test-case-tfork_cmd_send.patch => 0006-smbtorture-skip-test-case-tfork_cmd_send.patch} (94%)
 rename meta-networking/recipes-connectivity/samba/samba/{0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch => 0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch} (91%)
 rename meta-networking/recipes-connectivity/samba/samba/{0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch => 0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch} (92%)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0009-wscript-skip-checking-PYTHONHASHSEED.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/samba-fix-musl-lib-without-innetgr.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.14.bb => samba_4.17.4.bb} (87%)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index e91df71ea..fa960ea2b 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
index e91df71ea..fa960ea2b 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index b670e4ac4..19d0b6f76 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
index b670e4ac4..19d0b6f76 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index b670e4ac4..19d0b6f76 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index b670e4ac4..19d0b6f76 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index ad52b4a9a..aa8736880 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index c799942d4..407e4154c 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
index c799942d4..407e4154c 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index ad52b4a9a..aa8736880 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index ac857d46e..e94a5a473 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index dfc48754c..a5c0d0d61 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
index dfc48754c..a5c0d0d61 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
index b670e4ac4..19d0b6f76 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
index e91df71ea..fa960ea2b 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index e91df71ea..fa960ea2b 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
 Checking for readlink breakage: NO
+Checking for gnutls fips mode support: NO
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
index f4668dc6f..9f597bee2 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
@@ -1,4 +1,4 @@
-From 3bc1ebc3d2758af4067b3aace7ddd0ea0cb0b57b Mon Sep 17 00:00:00 2001
+From f6fa33bfc2e1272198db6ea08910b4162b364b18 Mon Sep 17 00:00:00 2001
 From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Mon, 18 Apr 2016 17:00:53 -0400
 Subject: [PATCH] Don't check xsltproc manpages
@@ -16,10 +16,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/lib/ldb/wscript b/lib/ldb/wscript
-index bf6129b..c515deb 100644
+index 60bb7cf..b7b0152 100644
 --- a/lib/ldb/wscript
 +++ b/lib/ldb/wscript
-@@ -143,7 +143,7 @@ def configure(conf):
+@@ -144,7 +144,7 @@ def configure(conf):
          conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
  
      if conf.env.standalone_ldb:
@@ -29,7 +29,7 @@ index bf6129b..c515deb 100644
          # we need this for the ldap backend
          if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
 diff --git a/lib/talloc/wscript b/lib/talloc/wscript
-index a767477..f754819 100644
+index 3089663..76cd65e 100644
 --- a/lib/talloc/wscript
 +++ b/lib/talloc/wscript
 @@ -48,7 +48,7 @@ def configure(conf):
@@ -42,7 +42,7 @@ index a767477..f754819 100644
      conf.CHECK_HEADERS('sys/auxv.h')
      conf.CHECK_FUNCS('getauxval')
 diff --git a/lib/tdb/wscript b/lib/tdb/wscript
-index e56ddd0..467dd65 100644
+index 71ada31..accd474 100644
 --- a/lib/tdb/wscript
 +++ b/lib/tdb/wscript
 @@ -95,7 +95,7 @@ def configure(conf):
@@ -55,5 +55,5 @@ index e56ddd0..467dd65 100644
      conf.SAMBA_CHECK_PYTHON()
      conf.SAMBA_CHECK_PYTHON_HEADERS()
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
index 292e614eb..186ee553a 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From 9ebea97a52e4f70e831dd6402b865c77753ce1cc Mon Sep 17 00:00:00 2001
+From f7b8e2e149b06a8033e31f4242c392573fa9ab52 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -15,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 5f080dd..cdc115e 100644
+index 7d2d855..01dcb56 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -24,9 +24,9 @@ index 5f080dd..cdc115e 100644
  from wafsamba import samba_utils
 +import importlib.util, os
  
- def PRIVATE_NAME(bld, name, private_extension, private_library):
+ def PRIVATE_NAME(bld, name):
      '''possibly rename a library to include a bundled extension'''
-@@ -249,17 +250,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
+@@ -241,17 +242,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
@@ -63,5 +63,5 @@ index 5f080dd..cdc115e 100644
          Logs.error('ERROR: Python module %s of version %s not found, and bundling disabled' % (libname, minversion))
          sys.exit(1)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
index 93ca005d6..f2e25eb10 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
@@ -1,4 +1,4 @@
-From 6455448eb060d03a534539f1a424e2d3e44319e1 Mon Sep 17 00:00:00 2001
+From 556bb3cf17ccdf0b0ee0d82801c4b20cf0990ae4 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 20 Jun 2019 14:11:16 +0800
 Subject: [PATCH] Add config option without-valgrind
@@ -15,10 +15,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 2c856b6..bc726f7 100644
+index 2f17999..9ef9bd9 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -121,8 +121,9 @@ def configure(conf):
+@@ -114,8 +114,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -31,10 +31,10 @@ index 2c856b6..bc726f7 100644
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
 diff --git a/wscript b/wscript
-index 83d9421..969b07a 100644
+index 3af4207..54d7e9e 100644
 --- a/wscript
 +++ b/wscript
-@@ -123,6 +123,10 @@ def options(opt):
+@@ -116,6 +116,10 @@ def options(opt):
                    help=("Disable RELRO builds"),
                    action="store_false", dest='enable_relro')
  
@@ -46,5 +46,5 @@ index 83d9421..969b07a 100644
  
      opt.load('python') # options for disabling pyc or pyo compilation
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
index 5fd32f385..2b0fbff8e 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
@@ -1,4 +1,4 @@
-From 5abf3c2efa1cd4e16878b6b26068ff153973ebd3 Mon Sep 17 00:00:00 2001
+From 515f2455b4b69f5fcd2c61a532663280785db737 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 28 Apr 2020 02:05:33 +0200
 Subject: [PATCH] Add options to configure the use of libbsd
@@ -15,10 +15,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 29 insertions(+), 15 deletions(-)
 
 diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
-index 1aadb95..e7b47c0 100644
+index 8729b08..1c55428 100644
 --- a/buildtools/wafsamba/wscript
 +++ b/buildtools/wafsamba/wscript
-@@ -88,6 +88,13 @@ def options(opt):
+@@ -145,6 +145,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
                     help=("Disable use of gettext"),
                     action="store_true", dest='disable_gettext', default=False)
  
@@ -33,10 +33,10 @@ index 1aadb95..e7b47c0 100644
  
      gr.add_option('-C',
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index bc726f7..44ad0d6 100644
+index 9ef9bd9..d47de4f 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -419,20 +419,21 @@ def configure(conf):
+@@ -439,20 +439,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -73,7 +73,7 @@ index bc726f7..44ad0d6 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/lib/texpect/wscript b/lib/texpect/wscript
-index 82f6b25..33eea64 100644
+index 44f92a8..79e8d09 100644
 --- a/lib/texpect/wscript
 +++ b/lib/texpect/wscript
 @@ -1,7 +1,13 @@
@@ -92,5 +92,5 @@ index 82f6b25..33eea64 100644
  def build(bld):
      bld.SAMBA_BINARY('texpect',
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 90%
rename from meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
index d497dd32c..e1b5fac0d 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From a0547cacaddcb2fbef1fb9991c5ad522226e6817 Mon Sep 17 00:00:00 2001
+From a8b4a40b535a2c69eb408f649e7169bcc1975fc1 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -46,18 +46,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index b1c8dd0..24faa31 100644
+index a23bd01..af202e0 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
 @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
- 		env[x] = conf.environ[x] = dct[x]
--	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
+ 		env[x] = conf.environ[x] = str(dct[x])
+-	env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
 +	env.pyext_PATTERN = '%s.so'
  
  
  	# Try to get pythonX.Y-config
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0005-samba-build-dnsserver_common-code.patch b/meta-networking/recipes-connectivity/samba/samba/0005-samba-build-dnsserver_common-code.patch
deleted file mode 100644
index 2abbe563a..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0005-samba-build-dnsserver_common-code.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 10d7abc8f1aa99ae45209aeb704978d206f329c0 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Tue, 1 Jun 2021 11:09:19 +0800
-Subject: [PATCH] samba: build dnsserver_common code
-
-Just 'install' does not seem to do it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- source4/dns_server/wscript_build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source4/dns_server/wscript_build b/source4/dns_server/wscript_build
-index e97c85d..a49fbb9 100644
---- a/source4/dns_server/wscript_build
-+++ b/source4/dns_server/wscript_build
-@@ -4,7 +4,7 @@ bld.SAMBA_LIBRARY('dnsserver_common',
-         source='dnsserver_common.c',
-         deps='samba-util samba-errors ldbsamba clidns',
-         private_library=True,
--        install=bld.AD_DC_BUILD_IS_ENABLED()
-+        enabled=bld.AD_DC_BUILD_IS_ENABLED()
-         )
- 
- bld.SAMBA_MODULE('service_dns',
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
similarity index 94%
rename from meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
rename to meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
index 90ee31786..cc4c15e09 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
@@ -1,4 +1,4 @@
-From 059b517f9ef6cbdc696e0983ce255b1728042827 Mon Sep 17 00:00:00 2001
+From 950b5977ea7e72343067d0070cc35fb0dc5163d4 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Thu, 25 Aug 2022 16:46:04 +0800
 Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch b/meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
similarity index 91%
rename from meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch
rename to meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
index 4a89f7678..91eb22967 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
@@ -1,4 +1,4 @@
-From 28ec4c9323e67cd114a0465015c9f3c2e64e6829 Mon Sep 17 00:00:00 2001
+From 95946ce8b6317f68c51338d19d237ce6da61d1c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Aug 2022 13:05:26 -0700
 Subject: [PATCH] waf: Fix errors with Werror=implicit-function-declaration
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/buildtools/wafsamba/samba_waf18.py b/buildtools/wafsamba/samba_waf18.py
-index 7a0a08e..c0d2c3e 100644
+index e2a078b..e145c77 100644
 --- a/buildtools/wafsamba/samba_waf18.py
 +++ b/buildtools/wafsamba/samba_waf18.py
 @@ -209,7 +209,7 @@ def CHECK_LIBRARY_SUPPORT(conf, rpath=False, version_script=False, msg=None):
@@ -28,5 +28,5 @@ index 7a0a08e..c0d2c3e 100644
          if version_script:
              script = bld.srcnode.make_node('ldscript')
 -- 
-2.37.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch b/meta-networking/recipes-connectivity/samba/samba/0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch
similarity index 92%
rename from meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch
rename to meta-networking/recipes-connectivity/samba/samba/0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch
index 6e4cdf12d..45a7c82d8 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch
@@ -1,4 +1,4 @@
-From f8e1d71e702dfc6965ecb3109738b5d188af4267 Mon Sep 17 00:00:00 2001
+From f783bb9c87ce11e824dfefca473d0dcf6edad238 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Sun, 30 Oct 2022 11:59:31 +0900
 Subject: [PATCH] Deleted settiong of python to fix the install conflict error
@@ -35,15 +35,15 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  7 files changed, 7 deletions(-)
 
 diff --git a/source4/scripting/bin/samba-gpupdate b/source4/scripting/bin/samba-gpupdate
-index 85300e1..02f40cd 100755
+index 4b3f057..08fec2d 100755
 --- a/source4/scripting/bin/samba-gpupdate
 +++ b/source4/scripting/bin/samba-gpupdate
 @@ -25,7 +25,6 @@ applied, have changed, or is in the right container'''
  import os
  import sys
-
+ 
 -sys.path.insert(0, "bin/python")
-
+ 
  import optparse
  from samba import getopt as options
 diff --git a/source4/scripting/bin/samba-tool b/source4/scripting/bin/samba-tool
@@ -52,46 +52,46 @@ index f8a70a6..3c818de 100755
 +++ b/source4/scripting/bin/samba-tool
 @@ -22,7 +22,6 @@
  import sys
-
+ 
  # Find right direction when running from source tree
 -sys.path.insert(0, "bin/python")
-
+ 
  # make sure the script dies immediately when hitting control-C,
  # rather than raising KeyboardInterrupt. As we do all database
 diff --git a/source4/scripting/bin/samba_dnsupdate b/source4/scripting/bin/samba_dnsupdate
-index 518bb89..277f0ee 100755
+index 1ce53f5..2cdfbf8 100755
 --- a/source4/scripting/bin/samba_dnsupdate
 +++ b/source4/scripting/bin/samba_dnsupdate
 @@ -36,7 +36,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
  os.environ["TZ"] = "GMT"
-
+ 
  # Find right directory when running from source tree
 -sys.path.insert(0, "bin/python")
-
+ 
  import samba
  import optparse
 diff --git a/source4/scripting/bin/samba_downgrade_db b/source4/scripting/bin/samba_downgrade_db
-index 87a989b..93a7f8c 100755
+index b9a0909..80f581e 100755
 --- a/source4/scripting/bin/samba_downgrade_db
 +++ b/source4/scripting/bin/samba_downgrade_db
-@@ -24,7 +24,6 @@ import optparse
+@@ -23,7 +23,6 @@ import optparse
  import sys
-
+ 
  # Find right directory when running from source tree
 -sys.path.insert(0, "bin/python")
-
-
+ 
+ 
  import samba
 diff --git a/source4/scripting/bin/samba_kcc b/source4/scripting/bin/samba_kcc
-index 122a5ed..79165f3 100755
+index 67d801e..2fc0d6a 100755
 --- a/source4/scripting/bin/samba_kcc
 +++ b/source4/scripting/bin/samba_kcc
-@@ -37,7 +37,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
+@@ -36,7 +36,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
  os.environ["TZ"] = "GMT"
-
+ 
  # Find right directory when running from source tree
 -sys.path.insert(0, "bin/python")
-
+ 
  import optparse
  import time
 diff --git a/source4/scripting/bin/samba_spnupdate b/source4/scripting/bin/samba_spnupdate
@@ -100,23 +100,24 @@ index 84ff771..b6fe041 100755
 +++ b/source4/scripting/bin/samba_spnupdate
 @@ -32,7 +32,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
  os.environ["TZ"] = "GMT"
-
+ 
  # Find right directory when running from source tree
 -sys.path.insert(0, "bin/python")
-
+ 
  import samba, ldb
  import optparse
 diff --git a/source4/scripting/bin/samba_upgradedns b/source4/scripting/bin/samba_upgradedns
-index 308dbb0..d00244f 100755
+index afc5807..727a3cc 100755
 --- a/source4/scripting/bin/samba_upgradedns
 +++ b/source4/scripting/bin/samba_upgradedns
 @@ -27,7 +27,6 @@ import grp
  from base64 import b64encode
  import shlex
-
+ 
 -sys.path.insert(0, "bin/python")
-
+ 
  import ldb
  import samba
---
+-- 
 2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0009-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-connectivity/samba/samba/0009-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 000000000..af659a1e5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0009-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From 342a233eb0abb00a4d6a0c824a1337ff71d93c32 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Dec 2022 16:31:05 +0800
+Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
+
+Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ buildtools/wafsamba/wscript | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 1c55428..01b242d 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -8,10 +8,6 @@ import wafsamba
+ from samba_utils import symlink
+ from optparse import SUPPRESS_HELP
+ 
+-phs = os.environ.get("PYTHONHASHSEED", None)
+-if phs != "1":
+-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
+-
+ # this forces configure to be re-run if any of the configure
+ # sections of the build scripts change. We have to check
+ # for this in sys.argv as options have not yet been parsed when
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch b/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
index 5c299d617..e6e878433 100644
--- a/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
@@ -1,4 +1,4 @@
-From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
+From 14f8ee7cd1318567b00e52217d57f0a528fd2cf7 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 25 Jul 2018 09:55:25 +0800
 Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
@@ -22,10 +22,10 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
-index 4fd82a9..5443a08 100644
+index e6861c8..238201d 100644
 --- a/third_party/cmocka/cmocka.h
 +++ b/third_party/cmocka/cmocka.h
-@@ -110,7 +110,7 @@ typedef uintmax_t LargestIntegralType;
+@@ -111,7 +111,7 @@ typedef uintmax_t LargestIntegralType;
      ((LargestIntegralType)(value))
  
  /* Smallest integral type capable of holding a pointer. */
@@ -34,7 +34,7 @@ index 4fd82a9..5443a08 100644
  # if defined(_WIN32)
      /* WIN32 is an ILP32 platform */
      typedef unsigned int uintptr_t;
-@@ -134,9 +134,8 @@ typedef uintmax_t LargestIntegralType;
+@@ -135,9 +135,8 @@ typedef uintmax_t LargestIntegralType;
  #  endif /* __WORDSIZE */
  # endif /* _WIN32 */
  
@@ -47,5 +47,5 @@ index 4fd82a9..5443a08 100644
  /* Perform an unsigned cast to uintptr_t. */
  #define cast_to_pointer_integral_type(value) \
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch b/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
deleted file mode 100644
index eb06866f4..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Index: samba-4.6.2/nsswitch/wins.c
-===================================================================
---- samba-4.6.2.orig/nsswitch/wins.c
-+++ samba-4.6.2/nsswitch/wins.c
-@@ -39,6 +39,14 @@ static pthread_mutex_t wins_nss_mutex =
- #define INADDRSZ 4
- #endif
- 
-+#ifndef NETDB_INTERNAL
-+#define NETDB_INTERNAL (-1)
-+#endif
-+
-+#ifndef NETDB_SUCCESS
-+#define NETDB_SUCCESS  0
-+#endif
-+
- NSS_STATUS _nss_wins_gethostbyname_r(const char *hostname,
- 				     struct hostent *he,
- 				     char *buffer,
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
index a75ac2bba..22451a2d1 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
@@ -1,4 +1,4 @@
-From 02e0b14d8fa025a5db410d60a7c0dfebd536aaeb Mon Sep 17 00:00:00 2001
+From 08003ea30d86a8b983be89f6a161d3baacdaa038 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 23:40:54 -0800
 Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
@@ -8,13 +8,12 @@ Taken from gentoo
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_r.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  source4/torture/local/nss_tests.c | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
-index 2cd6122..04f13c6 100644
+index 2943122..bc185ca 100644
 --- a/source4/torture/local/nss_tests.c
 +++ b/source4/torture/local/nss_tests.c
 @@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct torture_context *tctx,
@@ -33,7 +32,7 @@ index 2cd6122..04f13c6 100644
  static bool test_enum_r_passwd(struct torture_context *tctx,
  			       struct passwd **pwd_array_p,
  			       size_t *num_pwd_p)
-@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct torture_context *tctx,
+@@ -383,6 +383,7 @@ static bool test_enum_r_passwd(struct torture_context *tctx,
  
  	return true;
  }
@@ -41,7 +40,7 @@ index 2cd6122..04f13c6 100644
  
  static bool torture_assert_passwd_equal(struct torture_context *tctx,
  					const struct passwd *p1,
-@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture_context *tctx)
+@@ -434,7 +435,7 @@ static bool test_passwd_r(struct torture_context *tctx)
  	struct passwd *pwd, pwd1, pwd2;
  	size_t num_pwd;
  
@@ -50,7 +49,7 @@ index 2cd6122..04f13c6 100644
  						"failed to enumerate passwd");
  
  	for (i=0; i < num_pwd; i++) {
-@@ -460,7 +461,7 @@ static bool test_passwd_r_cross(struct torture_context *tctx)
+@@ -462,7 +463,7 @@ static bool test_passwd_r_cross(struct torture_context *tctx)
  	struct passwd *pwd, pwd1, pwd2, pwd3, pwd4;
  	size_t num_pwd;
  
@@ -59,7 +58,7 @@ index 2cd6122..04f13c6 100644
  						"failed to enumerate passwd");
  
  	for (i=0; i < num_pwd; i++) {
-@@ -531,6 +532,7 @@ static bool test_enum_group(struct torture_context *tctx,
+@@ -533,6 +534,7 @@ static bool test_enum_group(struct torture_context *tctx,
  	return true;
  }
  
@@ -67,7 +66,7 @@ index 2cd6122..04f13c6 100644
  static bool test_enum_r_group(struct torture_context *tctx,
  			      struct group **grp_array_p,
  			      size_t *num_grp_p)
-@@ -579,6 +581,7 @@ static bool test_enum_r_group(struct torture_context *tctx,
+@@ -583,6 +585,7 @@ static bool test_enum_r_group(struct torture_context *tctx,
  
  	return true;
  }
@@ -75,7 +74,7 @@ index 2cd6122..04f13c6 100644
  
  static bool torture_assert_group_equal(struct torture_context *tctx,
  				       const struct group *g1,
-@@ -635,7 +638,7 @@ static bool test_group_r(struct torture_context *tctx)
+@@ -639,7 +642,7 @@ static bool test_group_r(struct torture_context *tctx)
  	struct group *grp, grp1, grp2;
  	size_t num_grp;
  
@@ -84,7 +83,7 @@ index 2cd6122..04f13c6 100644
  					       "failed to enumerate group");
  
  	for (i=0; i < num_grp; i++) {
-@@ -663,7 +666,7 @@ static bool test_group_r_cross(struct torture_context *tctx)
+@@ -667,7 +670,7 @@ static bool test_group_r_cross(struct torture_context *tctx)
  	struct group *grp, grp1, grp2, grp3, grp4;
  	size_t num_grp;
  
@@ -93,3 +92,6 @@ index 2cd6122..04f13c6 100644
  					       "failed to enumerate group");
  
  	for (i=0; i < num_grp; i++) {
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-fix-musl-lib-without-innetgr.patch b/meta-networking/recipes-connectivity/samba/samba/samba-fix-musl-lib-without-innetgr.patch
deleted file mode 100644
index fb12a10e2..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/samba-fix-musl-lib-without-innetgr.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fcb8ecd530b2d151e373974741601483326f7528 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 27 Jun 2019 11:09:47 +0800
-Subject: [PATCH] samba: fix musl lib without innetgr
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/util/access.c | 2 +-
- source3/auth/user_util.c | 2 +-
- 2 file changed, 2 insertion(+), 2 deletion(-)
-
-diff --git a/lib/util/access.c b/lib/util/access.c
-index 7da0573..b94949e 100644
---- a/lib/util/access.c
-+++ b/lib/util/access.c
-@@ -112,7 +112,7 @@ static bool string_match(const char *tok,const char *s)
- 			return true;
- 		}
- 	} else if (tok[0] == '@') { /* netgroup: look it up */
--#ifdef	HAVE_NETGROUP
-+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
- 		DATA_BLOB tmp;
- 		char *mydomain = NULL;
- 		char *hostname = NULL;
-diff --git a/source3/auth/user_util.c b/source3/auth/user_util.c
-index a76b5d4..30f523d 100644
---- a/source3/auth/user_util.c
-+++ b/source3/auth/user_util.c
-@@ -148,7 +148,7 @@ static void store_map_in_gencache(TALLOC_CTX *ctx, const char *from, const char
- 
- bool user_in_netgroup(TALLOC_CTX *ctx, const char *user, const char *ngname)
- {
--#ifdef HAVE_NETGROUP
-+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
- 	static char *my_yp_domain = NULL;
- 	char *lowercase_user = NULL;
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
index 27b40f215..9e4545993 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
@@ -1,4 +1,4 @@
-From 54a5279cb33abd23ef7c094d51f16078ece2da0c Mon Sep 17 00:00:00 2001
+From 6822c61ade5617c9f109e32ad4cdc115fa9e12c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 23:40:54 -0800
 Subject: [PATCH] Lifted from gentoo and ported to 4.4.5
@@ -6,16 +6,15 @@ Subject: [PATCH] Lifted from gentoo and ported to 4.4.5
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  source3/wscript | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/source3/wscript b/source3/wscript
-index 5436db2..864f614 100644
+index 22be17a..ee9ce52 100644
 --- a/source3/wscript
 +++ b/source3/wscript
-@@ -879,7 +879,7 @@ msg.msg_accrightslen = sizeof(fd);
+@@ -862,7 +862,7 @@ msg.msg_accrightslen = sizeof(fd);
          if conf.env.with_iconv:
              conf.DEFINE('HAVE_ICONV', 1)
  
@@ -24,7 +23,7 @@ index 5436db2..864f614 100644
          use_pam=True
          conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
          if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
-@@ -956,6 +956,17 @@ int i; i = PAM_RADIO_TYPE;
+@@ -939,6 +939,17 @@ int i; i = PAM_RADIO_TYPE;
                         "or headers not found. Use --without-pam to disable "
                         "PAM support.");
  
@@ -42,3 +41,6 @@ index 5436db2..864f614 100644
      seteuid = False
  
  #
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.17.4.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.17.4.bb
index 9d7259e96..b79d23c2d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.17.4.bb
@@ -19,29 +19,31 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0002-do-not-import-target-module-while-cross-compile.patch \
            file://0003-Add-config-option-without-valgrind.patch \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
-           file://0005-samba-build-dnsserver_common-code.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
-           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
-           file://0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch \
-           file://0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
+           file://0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch \
+           file://0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://0009-wscript-skip-checking-PYTHONHASHSEED.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-           file://netdb_defines.patch \
            file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
            file://cmocka-uintptr_t.patch \
-           file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[sha256sum] = "abd5e9e6aa45e55114b188ba189ebdfc8fd3d7718d43f749e477ce7f791e5519"
+SRC_URI[sha256sum] = "c0512079db4cac707ccea4c18aebbd6b2eb3acf6e90735e7f645a326be1f4537"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.17(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_IGNORE += "CVE-2011-2411" 
+# Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
+CVE_CHECK_IGNORE += "CVE-2018-1050"
+# Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.
+CVE_CHECK_IGNORE += "CVE-2018-1057"
 
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
@@ -60,10 +62,11 @@ COMPATIBLE_HOST:riscv32 = "null"
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
-SYSTEMD_PACKAGES = "${PN}-base ${PN}-ad-dc winbind"
+SYSTEMD_PACKAGES = "${PN}-base ${PN}-ad-dc winbind ctdb"
 SYSTEMD_SERVICE:${PN}-base = "nmb.service smb.service"
 SYSTEMD_SERVICE:${PN}-ad-dc = "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'samba.service', '', d)}"
 SYSTEMD_SERVICE:winbind = "winbind.service"
+SYSTEMD_SERVICE:ctdb = "ctdb.service"
 
 # There are prerequisite settings to enable ad-dc, so disable the service by default.
 # Reference:
@@ -74,14 +77,12 @@ SYSTEMD_AUTO_ENABLE:${PN}-ad-dc = "disable"
 #to cross Popen
 export WAF_NO_PREFORK="yes"
 
-# Use krb5.  Build active domain controller.
+# Use krb5. Build active domain controller.
 #
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
                    acl cups ad-dc ldap mitkrb5 \
 "
 
-RDEPENDS:${PN}-ctdb-tests += "bash util-linux-getopt"
-
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
@@ -91,12 +92,12 @@ PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
-PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
-PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
-PACKAGECONFIG[libunwind] = ", , libunwind"
-PACKAGECONFIG[gpgme] = ",--without-gpgme,,"
-PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb,"
-PACKAGECONFIG[libbsd] = "--with-libbsd, --without-libbsd, libbsd"
+PACKAGECONFIG[lttng] = "--with-lttng,--without-lttng,lttng-ust"
+PACKAGECONFIG[archive] = "--with-libarchive,--without-libarchive,libarchive"
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[gpgme] = "--with-gpgme,--without-gpgme,gpgme"
+PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb"
+PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[ad-dc] = "--with-experimental-mit-ad-dc,--without-ad-dc,python3-markdown python3-dnspython,"
 PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5 --with-system-mitkdc=/usr/sbin/krb5kdc,,krb5,"
 
@@ -131,15 +132,14 @@ EXTRA_OECONF += "--enable-fhs \
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-do_configure:append () {
+do_configure:append() {
     cd ${S}/pidl/
     perl Makefile.PL PREFIX=${prefix}
     sed -e 's,VENDORPREFIX)/lib/perl,VENDORPREFIX)/${baselib}/perl,g' \
         -e 's,PERLPREFIX)/lib/perl,PERLPREFIX)/${baselib}/perl,g' -i Makefile
-
 }
 
-do_compile:append () {
+do_compile:append() {
     oe_runmake -C ${S}/pidl
 }
 
@@ -199,7 +199,7 @@ do_install:append() {
 
     chmod 0750 ${D}${sysconfdir}/sudoers.d || true
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
-    
+
     for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc samba_dnsupdate samba_downgrade_db; do
         if [ -f "${D}${sbindir}/$f" ]; then
             sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${sbindir}/$f
@@ -217,8 +217,8 @@ do_install:append() {
 
 PACKAGES =+ "${PN}-python3 ${PN}-pidl \
              ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
-             winbind \
-             ${PN}-common ${PN}-base ${PN}-ad-dc ${PN}-ctdb-tests \
+             winbind ctdb ctdb-tests \
+             ${PN}-common ${PN}-base ${PN}-ad-dc \
              smbclient ${PN}-client ${PN}-server ${PN}-test"
 
 python samba_populate_packages() {
@@ -257,15 +257,30 @@ FILES:${PN}-ad-dc = "${sbindir}/samba \
                      ${systemd_system_unitdir}/samba.service \
                      ${libdir}/krb5/plugins/kdb/samba.so \
 "
+
 RDEPENDS:${PN}-ad-dc = "krb5-kdc"
 
-FILES:${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
-                          ${bindir}/ctdb_run_cluster_tests \
-                          ${sysconfdir}/ctdb/nodes \
-                          ${datadir}/ctdb-tests \
-                          ${datadir}/ctdb/tests \
-                          ${localstatedir}/lib/ctdb \
-                         "
+FILES:ctdb = "${bindir}/ctdb \
+              ${bindir}/ctdb_diagnostics \
+              ${bindir}/ltdbtool \
+              ${bindir}/onnode \
+              ${bindir}/ping_pong \
+              ${sbindir}/ctdbd \
+              ${datadir}/ctdb \
+              ${libexecdir}/ctdb \
+              ${localstatedir}/lib/ctdb \
+              ${sysconfdir}/ctdb \
+              ${sysconfdir}/sudoers.d/ctdb \
+              ${systemd_system_unitdir}/ctdb.service \
+"
+
+FILES:ctdb-tests = "${bindir}/ctdb_run_tests \
+                    ${bindir}/ctdb_run_cluster_tests \
+                    ${datadir}/ctdb-tests \
+                    ${datadir}/ctdb/tests \
+"
+
+RDEPENDS:ctdb-tests += "bash util-linux-getopt ctdb"
 
 FILES:${BPN}-common = "${sysconfdir}/default \
                        ${sysconfdir}/samba \
@@ -278,7 +293,6 @@ FILES:${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
                 ${libdir}/*.dat \
                 ${libdir}/auth/*.so \
-                ${datadir}/ctdb/events/* \
 "
 
 FILES:${PN}-dsdb-modules = "${libdir}/samba/ldb"
@@ -317,10 +331,10 @@ FILES:smbclient = "${bindir}/cifsdd \
                    ${bindir}/smbtree \
                    ${libdir}/samba/smbspool_krb5_wrapper"
 
-RDEPENDS:${PN}-pidl:append = " perl libparse-yapp-perl"
 FILES:${PN}-pidl = "${bindir}/pidl \
                     ${libdir}/perl5 \
                    "
+RDEPENDS:${PN}-pidl:append = " perl libparse-yapp-perl"
 
 RDEPENDS:${PN}-client = "\
     smbclient \
@@ -340,13 +354,8 @@ RDEPENDS:${PN}-server = "\
 ALLOW_EMPTY:${PN}-server = "1"
 
 RDEPENDS:${PN}-test = "\
-    ${PN}-ctdb-tests \
+    ctdb-tests \
     ${PN}-testsuite \
     "
 
 ALLOW_EMPTY:${PN}-test = "1"
-
-# Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
-# Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.
-CVE_CHECK_IGNORE += "CVE-2018-1050"
-CVE_CHECK_IGNORE += "CVE-2018-1057"
-- 
2.25.1


