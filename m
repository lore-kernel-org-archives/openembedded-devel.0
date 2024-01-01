Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444CBC47074
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:50:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1266.1704095417175649805
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KpGyc4fg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4017naQe013571
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 07:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=rd6OVi8OeUl8IkuxajGFDlBqf29bxs0iFIUd7fkXwjM=; b=
	KpGyc4fgdqo0dw8BQxPYjQAuKy+A0W4tN0IGh8OXZ7nYstu5gReiyA2apaCSwVCd
	XV+3EAugbJB3ugQ5n7eWugIvlx00BtsrMgEoqUwkHNv2Vnut+udR6AHpdQjAK6l+
	NCHSw4ny2dTBW/kKHRilGptVtLsYmh8nXvFbZr54O77j6tOJVAdiMmnp9JBEP2I9
	pnufTy1EtG5hfKO/Q8Aw+JtUgvFWe2m/2yidBnJ3Y0F8JhwfdZNNzQbrk/ilnGZS
	qHdXRVRddCSzS39pLEWOy5gtKKmzfT3oX8RktINMGJpbj7xHRrUW5zJY4L8yxeyC
	2Dy7pjIDPSHxd0n7IqdvCg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa661pjx-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNBUz0rI3rIe3TDarXB7jx+qBhBXKa5M7KIiukT9/8vz+/WBZ8ZPVLO88dMrqeaeGjSqhAI6REzrRHm/MqhmY9+s/5eTRAbHGG30WrHfy2Kx4daw1FwFbddFwKu5r+4vit1Qv8K7F/Cip8PsRmrcGc3PkXKe6vkBS6MpZA/1Y4V7kwVND2WJzhRto4JwlKIuVib5lxVvxU6C6rOFAdqyoYc+CnUEqlAzJfwAkEXA+yuxER3n0B8K0+goKqpVCyCz8uCkwPK7oAtzWNFUqunVaCBQZhrvqW8wBd42KMC9QeaJNePQ0554B1M5yklCQmsuZSGztzCuN813Q6qOIHQcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd6OVi8OeUl8IkuxajGFDlBqf29bxs0iFIUd7fkXwjM=;
 b=EHPkImCbOAntRM8JvyWGm148uY1EToYFC9mTg7hpagmdbs2QwivE62acsDlzO89VP8eTCBM30F+jDPVC7khvbm73IpW2CVQtUTNwGFIszQpG7VXZoN53jXK7cUKGlKA9vVlX3bEs9W0tDU6+uZdPiziRvyouaeb4kta9neRdydSxM3OwdRwONXrC8pIFrxw75IuxEhZayEnZWFFJiMZ1dfDFjD9nZYrUCcGo6zia0CxMerJRkecF+C5tT0cAQs8WtDNzTNczO/MexfDH+6T8vqhZ7RnJ2qVT6dKhq0qC8iHJbGRc02dUbNSQa12oZEAbuoK0Ec1iKagGg93fOFbuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 07:50:13 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 07:50:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/5] samba: upgrade 4.18.9 -> 4.19.3
Date: Mon,  1 Jan 2024 15:49:58 +0800
Message-Id: <20240101074958.2782143-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240101074958.2782143-1-yi.zhao@windriver.com>
References: <20240101074958.2782143-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b52c9c-3f81-45cc-5705-08dc0a9e4988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PjhIimcm9EKw3dv4sZPuZ/Dxc7RKaJH7wGiXtBvKVxTL0KFpP0WXnmi71LZg24jAuS8uWcVHsiZ1T9lL5VTkbSqW4W9fjMLOeR9O8ohsHfKOzrDRiwaXZFto7F5OgHKp1D2F5d6onQtkplzO5mVYYyEZB0mkdL8c6Yvt4Z1wvpWkiyJtWDcwBcfobBycmisltuS6q4LEttcuO/1zoep4wzlzIK7Q+l+mRE1jGOqWCDvkfNZgASjIkyGfIQiwxI6y70FTPU8bzVEr0B7y6TGv+yItu3MR4Cp2hc9RqClFZPgsZ7s9dK2Za1Oq5gooPAcDS8F8krduoQdbmuO1gpHs+sGpKe+FTF5DA66oVH9ziWBhaJjh5o9Fu2VAXN7cZelygg1CdVEHzETsn9zwvvp/cAKJFDQrHV2xPRb+pqcTB3CtwePk9rhyVOzTYWj4pYZ3gnFh2B4vhBk6HSjvokD4sEimRQdPR36qF/YakznjYb6z9uP0RUKKJhA8l5OX6OFspFwh/J/AT4r0+5FRRcXVLWkEKR+1Wb2GxNhAfy1B1P7I/7HIkZl7o/wMEsuGalvYA4FKNFhql7LkuaT3NmD+Miy8H5UnGuEIuGhKMOCPKj4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(1076003)(26005)(83380400001)(2616005)(6666004)(6506007)(6512007)(53546011)(30864003)(5660300002)(44832011)(41300700001)(2906002)(478600001)(6486002)(966005)(316002)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(86362001)(36756003)(16799955002)(38100700002)(38350700005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mGei1g1kj8S0DROcBMlgP0e7WEC3DNtc4rA7EKsXYdDhxFydBbqqo8sROYtl?=
 =?us-ascii?Q?Hwd7sQ+5O544N8NtvnxqjNca5MAzvpAz1rBGfNzS0mjNDsIJ6p1rPiGEZlvT?=
 =?us-ascii?Q?tkiGbOMJkujzWemyl03O4O7xORAp/fdPz107dEGQaV0SdNSw3o8Zx6T7u59J?=
 =?us-ascii?Q?jB8WiSaQhttylOlo3F+cSBxXhHLiA2ofO0JmxmyxH3LyvRgAsc9DgKUbyVpB?=
 =?us-ascii?Q?eHDgyGIhbHG2iLpCam3OUW1DCFWvefXrd96WkFqj2vEMQDAxegtS0yNCZWan?=
 =?us-ascii?Q?Hr8EOZaadHxSWtyC1MQfkYtWT/y0RckuCxDP/u/y6QYuVAeyKHnJKK9PdbIL?=
 =?us-ascii?Q?gCz8eFnz+Y0dUA6UKMGuSs2myAcmbXwCAEbJY+F9W8i4+KHUFk7hJoOIvht4?=
 =?us-ascii?Q?uuf3xf8OlOskJhTcx4nh8D1FIsX1MlvrArpOmmmERADPP0Y1pZDq8qytP/c5?=
 =?us-ascii?Q?ktuWT43WspcWdn30tqClPOlr23uArpscvRYKZtiyWOGu1fvib3ESK0Pu+pQh?=
 =?us-ascii?Q?YAf4u7un8sd2GqYYxMVU+nJBicqYXxGG7qM0zXHns3pftsw6Q13tlx8ymdre?=
 =?us-ascii?Q?wbn1BfDCjbHPQxopEwOUWbS63biuneQ8j7XMsl/jCqmv/Kx8g+dnMtU2Dq7N?=
 =?us-ascii?Q?D1XYBP63DauomRii7zP/UZ7Ty0iyfULdCCShzfkrMLGU3YtXzhY7AljbH74j?=
 =?us-ascii?Q?cSZHlofNndFdUOx2uq9yFLWXzJVJ2oaC2MB+FlGD2sWGhYK+MxdG1aWIubHq?=
 =?us-ascii?Q?vQKhN8gDFMX2lDhCInx092myS8YCUMdyxZ1KUbqMZ8GFoP/fai0qihZysQdm?=
 =?us-ascii?Q?AdcJWUhhG400YNFHOmNtlNfLAcbONmpcLt64U8h6aQg1QA74sKymDhREEuzD?=
 =?us-ascii?Q?tM1pXzdFheoWYGDIbdAm44euRNohTv3ag4GWFLgDQD0cf7Km+72Zm+YDyc9z?=
 =?us-ascii?Q?B7VrLAUoY4jcZlaek8ApeNuzowbnb1NesZ8koo+72CPcaBJrSGTa+PfwF8S1?=
 =?us-ascii?Q?uj4sdckynFrB5kgIUuJX7Olfxrh6ANofEaGfs6KQWe+RTTYoeRx08teSsyWP?=
 =?us-ascii?Q?JokrP9Ub9Pa2bIu6Rie7t1BhCJezoE7DO4F9XlbcUh4CVMC1PXM1hR/k7nal?=
 =?us-ascii?Q?5KvnqeRxpNoc6ae6+DXfus9bbreyv2aE83kh1uilD0QDxrf6vwo+FufTXZB1?=
 =?us-ascii?Q?nvNWAN7FJ4oMFFuMBK/pGQwRTAvHZjX5F9n7Fhl3zeggOvjTCYU+4kbY4aBT?=
 =?us-ascii?Q?slo7qtgYABg5/st37bKAoQZmtDJfa5Bde69WHueOlaOXbOdxVcNmNIZcA6UP?=
 =?us-ascii?Q?dcezWkpQRSSCkkojXJJ/4aNjoP67v2mhK4j/JgkUKv2KwcDE6Evmor5rVMek?=
 =?us-ascii?Q?Y4s6kj66kuDGqI0cM6nz75179F6cxOJhk1KlLNlFOyCMuLMu/A92Oa39JHMF?=
 =?us-ascii?Q?/+vt6cPRZyl2S5+IeiHLFFpnBTdpoDVqVC9KAyIc+WOlYeHbQp9dZ2Nv8ka3?=
 =?us-ascii?Q?kHGGpAV2kH1/yFR+wfCDAWVtSp2SIoF9YavcKHaW6WSXLsThUSoA2wWj22Qx?=
 =?us-ascii?Q?A0WvgzuUrJjQznDL5ylwFEn+xelNWNmzKBZ9C3dz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b52c9c-3f81-45cc-5705-08dc0a9e4988
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 07:50:13.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuTLOLrOzA+2tsdxgpnqAK17hjlN8zWTMvzXT2dlTQEBQJiFtVPbtqKSLXDO6BZ7rRQVtOogHmFWIaW4dkhtBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-Proofpoint-GUID: M5fcCk6gt_xjSR0i_Tpgo3oP5-p4bnEH
X-Proofpoint-ORIG-GUID: M5fcCk6gt_xjSR0i_Tpgo3oP5-p4bnEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401010063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107982

According to samba release planning[1], 4.18 is already in maintenance
mode and will be EOL in Sep 2024. Upgrade to current stable release
4.19.

Release Notes
https://www.samba.org/samba/history/samba-4.19.0.html
https://www.samba.org/samba/history/samba-4.19.3.html

[1] https://wiki.samba.org/index.php/Samba_Release_Planning

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cross-answers-aarch64.txt                 |  2 +-
 .../cross-answers-aarch64_be.txt              |  2 +-
 .../waf-cross-answers/cross-answers-arm.txt   |  2 +-
 .../waf-cross-answers/cross-answers-armeb.txt |  2 +-
 .../waf-cross-answers/cross-answers-i586.txt  |  2 +-
 .../waf-cross-answers/cross-answers-i686.txt  |  2 +-
 .../waf-cross-answers/cross-answers-mips.txt  |  2 +-
 .../cross-answers-mips64.txt                  |  2 +-
 .../cross-answers-mips64el.txt                |  2 +-
 .../cross-answers-mipsel.txt                  |  2 +-
 .../cross-answers-powerpc.txt                 |  2 +-
 .../cross-answers-powerpc64.txt               |  2 +-
 .../cross-answers-powerpc64le.txt             |  2 +-
 .../cross-answers-riscv32.txt                 |  2 +-
 .../cross-answers-riscv64.txt                 |  2 +-
 .../cross-answers-x86_64.txt                  |  2 +-
 .../0001-Don-t-check-xsltproc-manpages.patch  |  8 ++---
 ...rt-target-module-while-cross-compile.patch | 10 +++---
 ...3-Add-config-option-without-valgrind.patch | 34 +++++++++++--------
 ...tions-to-configure-the-use-of-libbsd.patch |  9 ++---
 ...-pyext_PATTERN-for-cross-compilation.patch |  6 ++--
 ...orture-skip-test-case-tfork_cmd_send.patch |  2 +-
 ...-of-python-to-fix-the-install-confli.patch | 11 +++---
 .../samba/samba-4.3.9-remove-getpwent_r.patch |  8 ++---
 .../samba/samba/samba-pam.patch               | 12 +++----
 .../{samba_4.18.9.bb => samba_4.19.3.bb}      |  6 ++--
 26 files changed, 73 insertions(+), 65 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.9.bb => samba_4.19.3.bb} (98%)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index fa960ea2b..ea561073e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
index fa960ea2b..ea561073e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index 19d0b6f76..5655a6585 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
index 19d0b6f76..5655a6585 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index 19d0b6f76..5655a6585 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index 19d0b6f76..5655a6585 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index aa8736880..84816e06f 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index 407e4154c..cdf7169cb 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
index 407e4154c..cdf7169cb 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index aa8736880..84816e06f 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index e94a5a473..c563a2796 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index a5c0d0d61..31a27e246 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
index a5c0d0d61..31a27e246 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
index 19d0b6f76..5655a6585 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -43,6 +43,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
index fa960ea2b..ea561073e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index fa960ea2b..ea561073e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -42,6 +42,6 @@ Checking errno of iconv for illegal multibyte sequence: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
-Checking whether fcntl supports setting/geting hints: NO
+Checking whether fcntl supports setting/getting hints: NO
 Checking for readlink breakage: NO
 Checking for gnutls fips mode support: NO
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
index 9f597bee2..a498348c2 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltproc-manpages.patch
@@ -1,4 +1,4 @@
-From f6fa33bfc2e1272198db6ea08910b4162b364b18 Mon Sep 17 00:00:00 2001
+From 5c5418038e392cc00d3293e00ea0cd20b5e19c9a Mon Sep 17 00:00:00 2001
 From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Mon, 18 Apr 2016 17:00:53 -0400
 Subject: [PATCH] Don't check xsltproc manpages
@@ -16,7 +16,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/lib/ldb/wscript b/lib/ldb/wscript
-index 60bb7cf..b7b0152 100644
+index ed5d45f..de3c648 100644
 --- a/lib/ldb/wscript
 +++ b/lib/ldb/wscript
 @@ -144,7 +144,7 @@ def configure(conf):
@@ -29,7 +29,7 @@ index 60bb7cf..b7b0152 100644
          # we need this for the ldap backend
          if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', 'lber ldap', headers='lber.h ldap.h'):
 diff --git a/lib/talloc/wscript b/lib/talloc/wscript
-index 3089663..76cd65e 100644
+index 075f1ec..9bd9f73 100644
 --- a/lib/talloc/wscript
 +++ b/lib/talloc/wscript
 @@ -48,7 +48,7 @@ def configure(conf):
@@ -42,7 +42,7 @@ index 3089663..76cd65e 100644
      conf.CHECK_HEADERS('sys/auxv.h')
      conf.CHECK_FUNCS('getauxval')
 diff --git a/lib/tdb/wscript b/lib/tdb/wscript
-index 71ada31..accd474 100644
+index 5e6a928..f13cf2a 100644
 --- a/lib/tdb/wscript
 +++ b/lib/tdb/wscript
 @@ -95,7 +95,7 @@ def configure(conf):
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
index 3b0269092..b0ad5c414 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
@@ -1,4 +1,4 @@
-From f7b8e2e149b06a8033e31f4242c392573fa9ab52 Mon Sep 17 00:00:00 2001
+From ba492aead265edfd1da2a6c45dd7661c248309cb Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 25 Jun 2019 14:25:08 +0800
 Subject: [PATCH] do not import target module while cross compile
@@ -6,18 +6,18 @@ Subject: [PATCH] do not import target module while cross compile
 Some modules such as dynamic library maybe cann't be imported
 while cross compile, we just check whether does the module exist.
 
+Upstream-Status: Pending
+
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
 update to version 4.10.5, and switch to python3
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
-Upstream-Status: Pending
-
  buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
  1 file changed, 19 insertions(+), 8 deletions(-)
 
 diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba/samba_bundled.py
-index 7d2d855..01dcb56 100644
+index 2300565..26d9e8c 100644
 --- a/buildtools/wafsamba/samba_bundled.py
 +++ b/buildtools/wafsamba/samba_bundled.py
 @@ -4,6 +4,7 @@ import sys
@@ -28,7 +28,7 @@ index 7d2d855..01dcb56 100644
  
  def PRIVATE_NAME(bld, name):
      '''possibly rename a library to include a bundled extension'''
-@@ -241,17 +242,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
+@@ -245,17 +246,27 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, libname, modulename, minversion='0.0.0'):
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
index f2e25eb10..2c9d29c9f 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
@@ -1,4 +1,4 @@
-From 556bb3cf17ccdf0b0ee0d82801c4b20cf0990ae4 Mon Sep 17 00:00:00 2001
+From cceee20e91af751469872b71155b23f0dec290a7 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 20 Jun 2019 14:11:16 +0800
 Subject: [PATCH] Add config option without-valgrind
@@ -9,38 +9,44 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Update patch to version 4.10.5
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 4.19.3
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  lib/replace/wscript | 5 +++--
- wscript             | 4 ++++
- 2 files changed, 7 insertions(+), 2 deletions(-)
+ wscript             | 7 +++++++
+ 2 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 2f17999..9ef9bd9 100644
+index 37d7759..9dd9b48 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -114,8 +114,9 @@ def configure(conf):
+@@ -113,8 +113,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
--    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
-+    if not Options.options.disable_valgrind:
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
++    if Options.options.enable_valgrind:
 +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
-+        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
 diff --git a/wscript b/wscript
-index 3af4207..54d7e9e 100644
+index 95ddd9e..6d9577a 100644
 --- a/wscript
 +++ b/wscript
-@@ -116,6 +116,10 @@ def options(opt):
-                   help=("Disable RELRO builds"),
-                   action="store_false", dest='enable_relro')
+@@ -123,6 +123,13 @@ def options(opt):
+                   help=('Disable kernely keyring support for credential storage'),
+                   action='store_false', dest='enable_keyring')
  
++    opt.add_option('--with-valgrind',
++                   help=("Enable use of valgrind"),
++                   action="store_true", dest='enable_valgrind')
 +    opt.add_option('--without-valgrind',
-+                   help=("Disable use of the valgrind headers"),
-+                   action="store_true", dest='disable_valgrind', default=False)
++                   help=("Disable use of valgrind"),
++                   action="store_false", dest='enable_valgrind', default=False)
 +
      gr = opt.option_group('developer options')
  
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
index 2b0fbff8e..c72bd133e 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
@@ -1,9 +1,10 @@
-From 515f2455b4b69f5fcd2c61a532663280785db737 Mon Sep 17 00:00:00 2001
+From d302d9a4ac6eb2bbafd248064a878ba287d636b8 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 28 Apr 2020 02:05:33 +0200
 Subject: [PATCH] Add options to configure the use of libbsd
 
 Upstream-Status: Inappropriate [oe deterministic build specific]
+
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 
 Rebase to 4.14.4
@@ -15,7 +16,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 29 insertions(+), 15 deletions(-)
 
 diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
-index 8729b08..1c55428 100644
+index 30cb366..d167551 100644
 --- a/buildtools/wafsamba/wscript
 +++ b/buildtools/wafsamba/wscript
 @@ -145,6 +145,13 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
@@ -33,10 +34,10 @@ index 8729b08..1c55428 100644
  
      gr.add_option('-C',
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 9ef9bd9..d47de4f 100644
+index 9dd9b48..a22ae59 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -439,20 +439,21 @@ def configure(conf):
+@@ -444,20 +444,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
diff --git a/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
index e1b5fac0d..53ef21948 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0005-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From a8b4a40b535a2c69eb408f649e7169bcc1975fc1 Mon Sep 17 00:00:00 2001
+From d2a2d0f82a37d0bf21123671774b0b03ffa976cf Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -46,10 +46,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index a23bd01..af202e0 100644
+index b2dd1a9..2bd3545 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
-@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
  		env[x] = conf.environ[x] = str(dct[x])
diff --git a/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
index cc4c15e09..13fbd3595 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0006-smbtorture-skip-test-case-tfork_cmd_send.patch
@@ -1,4 +1,4 @@
-From 950b5977ea7e72343067d0070cc35fb0dc5163d4 Mon Sep 17 00:00:00 2001
+From 4fd04fc7c94d6981f3409d088ab8d32c48460010 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Thu, 25 Aug 2022 16:46:04 +0800
 Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
diff --git a/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch b/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
index 45a7c82d8..e3506adfb 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
@@ -1,4 +1,4 @@
-From f783bb9c87ce11e824dfefca473d0dcf6edad238 Mon Sep 17 00:00:00 2001
+From bf5552f937c745940081e29ef32d52ae26bfd8c1 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Sun, 30 Oct 2022 11:59:31 +0900
 Subject: [PATCH] Deleted settiong of python to fix the install conflict error
@@ -22,7 +22,8 @@ sys.path.insert(0, "/usr/lib/python3.10/site-packages")
 But this setting is for environment when running from source tree. There
 is no necessary on target.
 
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  source4/scripting/bin/samba-gpupdate     | 1 -
@@ -47,7 +48,7 @@ index 4b3f057..08fec2d 100755
  import optparse
  from samba import getopt as options
 diff --git a/source4/scripting/bin/samba-tool b/source4/scripting/bin/samba-tool
-index f8a70a6..3c818de 100755
+index b02ad4d..f69ae10 100755
 --- a/source4/scripting/bin/samba-tool
 +++ b/source4/scripting/bin/samba-tool
 @@ -22,7 +22,6 @@
@@ -59,7 +60,7 @@ index f8a70a6..3c818de 100755
  # make sure the script dies immediately when hitting control-C,
  # rather than raising KeyboardInterrupt. As we do all database
 diff --git a/source4/scripting/bin/samba_dnsupdate b/source4/scripting/bin/samba_dnsupdate
-index 1ce53f5..2cdfbf8 100755
+index 69821e2..4037870 100755
 --- a/source4/scripting/bin/samba_dnsupdate
 +++ b/source4/scripting/bin/samba_dnsupdate
 @@ -36,7 +36,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
@@ -95,7 +96,7 @@ index 67d801e..2fc0d6a 100755
  import optparse
  import time
 diff --git a/source4/scripting/bin/samba_spnupdate b/source4/scripting/bin/samba_spnupdate
-index 84ff771..b6fe041 100755
+index b421886..5e18ad9 100755
 --- a/source4/scripting/bin/samba_spnupdate
 +++ b/source4/scripting/bin/samba_spnupdate
 @@ -32,7 +32,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
index 9a83574e6..0c967be62 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
@@ -1,4 +1,4 @@
-From 08003ea30d86a8b983be89f6a161d3baacdaa038 Mon Sep 17 00:00:00 2001
+From e5d9527e6b3b386229747f799c725fcd68bc5228 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 23:40:54 -0800
 Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
@@ -7,15 +7,15 @@ Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
 Taken from gentoo
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_r.patch
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  source4/torture/local/nss_tests.c | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
-index 2943122..bc185ca 100644
+index e911aa2..2b39b74 100644
 --- a/source4/torture/local/nss_tests.c
 +++ b/source4/torture/local/nss_tests.c
 @@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct torture_context *tctx,
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
index 9bf1f9757..4fcbb4757 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
@@ -1,22 +1,22 @@
-From 6822c61ade5617c9f109e32ad4cdc115fa9e12c8 Mon Sep 17 00:00:00 2001
+From c533bdced677e2104565fc06602e7e63d9c79ac0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 23:40:54 -0800
 Subject: [PATCH] Lifted from gentoo and ported to 4.4.5
 
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  source3/wscript | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/source3/wscript b/source3/wscript
-index 22be17a..ee9ce52 100644
+index b7f96f3..ed12b1e 100644
 --- a/source3/wscript
 +++ b/source3/wscript
-@@ -862,7 +862,7 @@ msg.msg_accrightslen = sizeof(fd);
+@@ -863,7 +863,7 @@ msg.msg_accrightslen = sizeof(fd);
          if conf.env.with_iconv:
              conf.DEFINE('HAVE_ICONV', 1)
  
@@ -25,7 +25,7 @@ index 22be17a..ee9ce52 100644
          use_pam=True
          conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
          if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
-@@ -939,6 +939,17 @@ int i; i = PAM_RADIO_TYPE;
+@@ -940,6 +940,17 @@ int i; i = PAM_RADIO_TYPE;
                         "or headers not found. Use --without-pam to disable "
                         "PAM support.");
  
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
index 73ceb7b75..4828526ed 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.3.bb
@@ -31,9 +31,9 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "f455c1d6351ed3a36fc2cb6e8ab1bfd0effe54a56686ffd495d64ab52d50f245"
+SRC_URI[sha256sum] = "280553b90f131b1940580df293653c9e9bd8906201f5def6e5e8c160f0bfac96"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
@@ -85,7 +85,7 @@ PACKAGECONFIG[sasl] = ",,cyrus-sasl"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
-PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 PACKAGECONFIG[lttng] = "--with-lttng,--without-lttng,lttng-ust"
 PACKAGECONFIG[archive] = "--with-libarchive,--without-libarchive,libarchive"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-- 
2.25.1


