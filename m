Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151A5C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 11:21:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20250.1709292068725272560
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 03:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TywAnm8h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4216CB4G003733
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 11:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=8buLtWy0UbalysiEzt
	wFX9MGX44yLtctCu/oo/4/K/4=; b=TywAnm8has5rMfg024AZ9ItLCV4O9negFU
	5WqkygTOFMz1pyTBMVA3fLNHI30FtPkFowDWN9jGpv6LWArAgPjmE/3zZ7FycP4t
	HkkqaFmRNyQ99Uvx2ZwhrVFHJD3Hp7N49Bn7rHt2DoB1J4FKusVU6v+LHvvGr58d
	CjazJlti4lYyFIlE8JR3KTznLPB28lga7fpXijXCQfWF92Hxpi7Qxqv4G9zApR3I
	CEyf1FzK9qcMkH8tdW3k7zbTa5GShBR+OZzTO/9wKB901xMgjcyOwBBA19gsa1AW
	PHncTi+gPaB37k7B9hXD+ywZGE9TheBQj4BcljSPpDxlXkCg6VMA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6egrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 11:21:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVQXssItm1By8eBeaaCewMH0XdjgcbcsL9mxWG3hX+yfHl8C1asEB4xmCt1s/ePUWPsBmp6/gPTlG7+lnEmYx80KJ4XAmLSSLnkes+e9tYDDufXTZZgDP1AwBQ873kPlJPmL2GB0Cdyv1a+ue3ip/rBkQG6PREBXbWpGJVfAt1kDZ1EY+qP/+T9hZ8Y/OKmE5lP5Hh5krc1QHqG67E2clctNdzXQ1LOp1ZxkAUpt69LdVECGCK1jCyq3MhMILtA+K3TviSMyp2CiZsmdv4Stzse5Luvwqx1PUPybTTiR4sFvaXvB59gstgqlTXpN8OJ/ek848J0Ej5R5wR11vWawlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8buLtWy0UbalysiEztwFX9MGX44yLtctCu/oo/4/K/4=;
 b=lvRaiythVLvzcyiT5z5QYpJ4jNxmN0HDOwdTlgH47xvzVm5fWG4Y96johRq+9z9AAlZLiT03DaC5fUqup1VTKcjgNsZJJzdMqHOS0gAEqGvOgzOVLGAC/o6VnIUeCmUTl9/zWG7s0DL8IVWJjJZUPNMl6qbrk8puORlOwxBgdWNBW3XXT/z73wpZDDn6TQUiL5VKiudpc08A8JcmVS5b90kH8XVgGmet9uG8dWGtrwvOp3j9j4vqBZggw0E5q4bb8My0L6rMchSnJdV0n4wNmLdbWIKS00YHkPGLkLkgXBgddP2H7lZXmDgn7ZnGbSfYUnjexDayNq+cWmi16CZKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 11:21:05 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 11:21:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.7.3 -> 3.8.5
Date: Fri,  1 Mar 2024 19:20:54 +0800
Message-Id: <20240301112054.2130965-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: e347a687-851c-4cae-887a-08dc39e1aeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WHA95thQMV5D8mqQg0YmtOx/YhXDTmvgy4vXkDVFfmPtmuUNF6T7tmTr676ItRcCZU5Grq34hqEpBZ8oLtE7kSMzvinWjdD5DyX85mc+RAiw+vNiZDjutPNnNfkVVPebunn0VpYwKXHvOtenP1N5OJFDL2+iAqQQH6Y7roIDpLxqlMfTeIeoFoFQOB2GYzT/Bln7ACIZdPn+bRr7E82js3WZ6oKs4mjCnTxvZYSDRAiL04iYFWgYUAk54TLREwU9oC/nq+kq8GmoDbocpEOIrUCaeehj8xi0vh/OmSer2cYU9MbyA9T9f9Aiw5b+bNxm3QwTx5+x4NIrd8mRN2AjjtDE+aYjUveJ/MOnxyVAfk0MfgTtXE6zqlOoaedc3u+nflyn4IJ7z2l9dMFhhm4NQ9tRKQyAkTT/YKP6dlq/RjiiRJjHc5dzo+mPL5IwjUL2qDA0D40eGmCd/1eDTfhJuX5OVVr9gUFVFAknTCwXzhEZG14WW2bdBRWQCIBF74uoz1YKNLCcyEPMHJmihHSxmDoKJJ6Vg4VnlXw5bA5frBZuYpAaz7Erxf4hnI2lstPP/VTBmB2PumXD8mfiNgw+Wa6SCJpxPYXQBbtpzlu5ZGXHGIOr2N0lyzBzdtOvyzePdgBIUVacmOGzx/PNo87ZRPb6ehdawK3ySfksSQWg31E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uiQf+enOcg7vsMWffUL9vwMYovXL94p8xouztJQKmISOwHySTdW9YM/Xe8tP?=
 =?us-ascii?Q?Hx9cOvacxvM8Ws1NXH2q8jZgj1T26Z3TK5BeYO/ZqmZ8SsR7hYR+Cd20IUqj?=
 =?us-ascii?Q?kKLHSVRhX4ApMqnjJa118lOToeFz9YQChX1vBOqos2Zblawa+uMx0kdUxZ9B?=
 =?us-ascii?Q?jqBsiY5UMbPNa8rSNO/SJGYThoXKZZRkUaMkpTVYaGX7DOUcGgkneXFZ/VoX?=
 =?us-ascii?Q?+5TYr8CGgGMaxk6lKMtRLjDwyHA4azCa30X1puBGADR0BlyMAtVyPkcTqyl1?=
 =?us-ascii?Q?1YhoOzkeTs+rOqVaBnRPV0xBhiCGSqhMU/Kwqe3aPr3cHRLcvdhPLGIPdapt?=
 =?us-ascii?Q?dzMUb2sTcg9cJNg53SQPQwYtf45pLLE2GspndacJvQIFIFO+P+O+9Is64X5k?=
 =?us-ascii?Q?whq5RV5i5R4KQRiy+aeM8t+l2AJ7OzzT0YtqCT3QaVTMuEMlULVIyjBXTwET?=
 =?us-ascii?Q?G9OmRg7tsZBHBskvr57XzUX7tWoLk4BiX3aLTyoDoO2IbCPtCwTReB61W/K8?=
 =?us-ascii?Q?Feh2zKuJS5QKJjRVw9qTtn2rSWVbnAXbptCfkI39LbZ3Nu8xsLNEoCmyU6F2?=
 =?us-ascii?Q?4myjaVrj91YcxQg8DXDxUWEy9pgbvuOzKYGaqd9XpiZ3NwgyjrF0IYKHbR01?=
 =?us-ascii?Q?pf6yNRKthcf1jq+fYPrjy1IiKg8z2Nz7Ac1h1hXGzJrxG/Vga+fzTaCAAFXA?=
 =?us-ascii?Q?gTFus2zz9rBJkYDgZyfKcf9/c5bTNUji3ejvINXrXoEjUNqKSdQNFgngAyCk?=
 =?us-ascii?Q?BSHvfE6QIbC6it0wadKueGTxQsiaFUsuRW5JafGqz/om0QSDVnWGmw5JmdFQ?=
 =?us-ascii?Q?H+o14xzAj5wdLSxF7zlVblL9ERuwZ5/S+93uJ1mabY35GFmfgONiJ1/OPyAm?=
 =?us-ascii?Q?6VVZNr8KBNacMF7XxbG0V9197yA+ZFahYHGokvyLZLNk/H7cdBEo253n9Fg3?=
 =?us-ascii?Q?hKw6En4+vgTYRpa6L0LqOATTYpASDCnp1kGfv/8uP8VifIQlJDHaZWKRrefp?=
 =?us-ascii?Q?kwHT8+1a54KQCCK45+FvA0FYBtTzrCiqn+/9oChYYMRnjezVVecDsCuq/NC/?=
 =?us-ascii?Q?n+MvosGp/tduLsrVX+lWqy5NlGeNTmVbvu4PPN8g7svL5+nDamuXQw8Y8WIA?=
 =?us-ascii?Q?hXe0rN8IJTK9W6YvT2uWl4d8VrF2RGuajwinMaUgKmfNH+1ndQNlfNi2PUh1?=
 =?us-ascii?Q?RTIBYaz/3bcM1JCvi6ia1zuhfXqZPNpRVaZTOsi0ZqqG5MUgJhyYLk1TeIUw?=
 =?us-ascii?Q?qlRE16hBe448RzyDLSsVAEiPrMxv1Aoz7o+cRmfoId0BKa0Y6e+0TucsKfIT?=
 =?us-ascii?Q?0qhqMkL3w6mBqxWuWicWW7Fc9we2yyZm4LMqfQJq+37Yl0dnMhUR4Dtcum40?=
 =?us-ascii?Q?Uyrf9XtcOjxiNiY+xqAB+YRoNXhafy++lUICpxczJvN6gP7HRSw29+NxeAIw?=
 =?us-ascii?Q?eqpaE6S9kz8cP9wli61xedvLKGlI2mdszBhSupzwJgvHQg28sM6yOZ/Vk1Gt?=
 =?us-ascii?Q?QR1BzNgxw6bT4C5bQwdlCxPpkYTxIEOxy7+H4TGQfc1aXpDI1ST/B6dSL+7B?=
 =?us-ascii?Q?eeqwmhvjmenlFevPzrcbboZjPfKHGrkIlT7gS5NG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e347a687-851c-4cae-887a-08dc39e1aeb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 11:21:04.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsY82HTWgYuKwCOEkQfPT9dr0D6pT8iClLN+Zibqhnl7xX0SOPvRL2I9TQrW+o+Qm+7xx0CZY58SHZtvyGZUMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-Proofpoint-GUID: TmIWG4bGuZBEuCcbZ1SkmAyjM2WhU56f
X-Proofpoint-ORIG-GUID: TmIWG4bGuZBEuCcbZ1SkmAyjM2WhU56f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_08,2024-03-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403010094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 11:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109076

ChangeLog:
https://www.postfix.org/announcements/postfix-3.8.0.html
https://www.postfix.org/announcements/postfix-3.8.1.html
https://www.postfix.org/announcements/postfix-3.8.2.html
https://www.postfix.org/announcements/postfix-3.8.3.html
https://www.postfix.org/announcements/postfix-3.8.4.html
https://www.postfix.org/announcements/postfix-3.8.5.html

* Drop 0006-makedefs-Account-for-linux-6.x-version.patch as the issue
  has been fixed upstream.
* Merge inc file into single recipe

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...kedefs-Account-for-linux-6.x-version.patch | 35 -------------------
 .../recipes-daemons/postfix/postfix_3.7.3.bb  | 18 ----------
 .../postfix/{postfix.inc => postfix_3.8.5.bb} | 18 ++++++++++
 3 files changed, 18 insertions(+), 53 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb
 rename meta-networking/recipes-daemons/postfix/{postfix.inc => postfix_3.8.5.bb} (92%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
deleted file mode 100644
index ad1704520..000000000
--- a/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e5ddcf9575437bacd64c2b68501b413014186a6a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2022 10:15:01 -0700
-Subject: [PATCH] makedefs: Account for linux 6.x version
-
-Major version has bumped to 6 and script needs to know that
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- makedefs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/makedefs
-+++ b/makedefs
-@@ -613,7 +613,7 @@ EOF
- 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
- 		: ${PLUGIN_LD="${CC-gcc} -shared"}
- 		;;
-- Linux.[345].*)	SYSTYPE=LINUX$RELEASE_MAJOR
-+ Linux.[3-6]*)	SYSTYPE=LINUX$RELEASE_MAJOR
- 		case "$CCARGS" in
- 		 *-DNO_DB*) ;;
- 		 *-DHAS_DB*) ;;
---- a/src/util/sys_defs.h
-+++ b/src/util/sys_defs.h
-@@ -751,7 +751,7 @@ extern int initgroups(const char *, int)
-  /*
-   * LINUX.
-   */
--#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5)
-+#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) || defined(LINUX6)
- #define SUPPORTED
- #define UINT32_TYPE	unsigned int
- #define UINT16_TYPE	unsigned short
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb
deleted file mode 100644
index b54a97aea..000000000
--- a/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require postfix.inc
-
-SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
-           file://main.cf \
-           file://postfix \
-           file://internal_recipient \
-           file://postfix.service \
-           file://aliasesdb \
-           file://check_hostname.sh \
-           file://0001-Fix-makedefs.patch \
-           file://0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch \
-           file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
-           file://0004-Fix-icu-config.patch \
-           file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0006-makedefs-Account-for-linux-6.x-version.patch \
-           "
-SRC_URI[sha256sum] = "d22f3d37ef75613d5d573b56fc51ef097f2c0d0b0e407923711f71c1fb72911b"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb
similarity index 92%
rename from meta-networking/recipes-daemons/postfix/postfix.inc
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb
index 5133caaa4..1c92c07a3 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb
@@ -14,6 +14,24 @@ DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
 LICENSE = "IPL-1.0 | EPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b181651ad99a7dc4cc8c4ce2f491ed1a"
 
+SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+           file://main.cf \
+           file://postfix \
+           file://internal_recipient \
+           file://postfix.service \
+           file://aliasesdb \
+           file://check_hostname.sh \
+           file://0001-Fix-makedefs.patch \
+           file://0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch \
+           file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+           file://0004-Fix-icu-config.patch \
+           file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           "
+
+SRC_URI[sha256sum] = "f3e827a2b2e410359ad25d31341970434ab07e36139f9a2ef93981b0ec564c85"
+
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
+
 S = "${WORKDIR}/postfix-${PV}"
 
 CLEANBROKEN = "1"
-- 
2.25.1


