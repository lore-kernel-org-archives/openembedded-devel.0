Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D86C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:34:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8439.1709105642350188190
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RV0JwKb/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27881ff055=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S5g3qU004493
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 07:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=e3IIY91v0uke7CPLic
	PlMV+388J1jD0lCnUbNeDUNt0=; b=RV0JwKb/VZCZR2dA5xCY0D4CTckEjJF389
	36siPF7Mr7qjjGvqNZYZCoI1b9lvZfknQ5hSmEQkj21kjoTZZtcwQz+8urGfZ8IK
	kzL/rmA/oFcH9V3/idGLhENGUmKuY2H8+C2sAQKTHwZze+BEpZplZfgiW5/HkiPb
	J51R0NSVP6Ow1aGbWW3Rqq0GlF74670uBwUW1gpr++PK8xHSnw8joNk0Pvj/pC7d
	YpmcdS4LMQmzWQx+XRuZbO6JeFkAgAhncdET/5PBcxTtNX7I3WYuqHIdyVKLlwdL
	DDg/rmNrCysjUXbQ4n1q9KtR8Z05TOhuVUsUMK/28QxtoWwVlBIA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6c0md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 07:34:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeTn6dzn6ZDyyFndUFSBrU6vWxRFlXWLZLzzQyk3AllUPqPVoNPGHGel2DgMaW/HyexAFKY8lU+cr5PxoZrqmRlX5APnzXeFKTOOQFzFoFpvQyAUHOfVWmrEAEypMPsdK996EtV1ecypx/GACoN8zSTOs0sMdRDjGp3yAqKH2Iw2UlZ9K+rRZvnHjjOLzS+VqLWDZNq289d2QvXSw0PA89uWA23EnGFu3y8zF5NvVZXc0M64akkZPstYpK0hKRuKKqOwLzBb3CYW0vv7GJ/kecZxzBC/W89uOa7bHdSqw1zk8BFn3rZIcJRvcAiXHR/rSKn5hECGmvrTA57c+joSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3IIY91v0uke7CPLicPlMV+388J1jD0lCnUbNeDUNt0=;
 b=XGXro0ZVDC0nM6Zsf1E/GQk+8hFL6CX2jHmW6AzFhNV+JTOlNBrsskLNY2SPg4LD2avgoxFeYCN0WjZEB2VHn6R5sTBYC3Xt1dANZyTG6jtfPJt79sFAcAQMoKSu1nD6UDpYFkAh6WbW/OW5QiesIaiZGYXv2LvshoqXdzlmumIyipVDE7y1zJeY4vjP6J1aQQKO3MIn7ujaPZKC5uEjpuHBP/aCNQrDPZcIlfc5KtKMX/MLi2A18s0sBwYd0PJs/YldcN1ZDK5rPky8yxL5EqQPQ82jFKtc1dq8bzdQXQIw9tx08TJ+J6PZOtC9OPC5Bbr+jAi+SaGNtL20yFCwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 07:33:57 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 07:33:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openipmi: fix do_configure error when using dash
Date: Wed, 28 Feb 2024 15:33:45 +0800
Message-Id: <20240228073345.1503738-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: f0544bad-0229-444c-baa5-08dc382f9fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ND8lFhqb05ax0HorMaHFTNqnd8d7jQt7gBohltZVDFLeAq/RXaUNzgFRm9p/EQpZTH/6MnexkXtxUznHF9YcK7FXFeudH3t1iHIyU4ecDVU7/X9gCmE7KE0SUka9CEAe/A5HCMx5Z02s0SxEYSU21kaoz8qUIKvwqRYDIQT5Ftn0Xq3xJxY4DJdo6d8aPA1WcCQECgtzC0mzOY+hO2Xb85LYoL1AzyD1AtAtzoJj+bf/wZlg1kLlcQ6VQNZzsdk0Mcgk9hLUsiCmzjhRSBROBi/O6VwFwe52Nz0GvECBN4AtuXZ/clHOm8IgRtjoZ7hZJIXA2acjZcU50ZtfmgRTrI13XrpdDBmnhW18IdAhBkBcoklIxt/RcsvaltOIlYaxJgLGhX7sv7LzsiZSurd/5ONSaj7aIUvBQZ/nivHMk1mfz5KI33B5sggnlrSya8mFORoTBbJfWYaSw60Mf2UOdpq5DcIXyGmVPseD9DgtYYibZ6xrL+k7Kn4mr8aKCHbfagom/NWsj13ZcV94Vys4NFzPGXe54F8sjmncXdOaQteZ2ffpU1DMnlOEfdZ5nKnvp+fFbEhS2HvTjzCRn7V7wab/9sjarzPDwOqajWHwM+VcV1n6tDeXhCqks3RQ1efwJ4XaTiRaxLcZDc/A+BERBI4+jaHodfTJkA9QP3+dNAdsq+X0PIR3klDqnp1KfduxtRPOhp2CFcq9cwp0YtjHozoCWU4MR8E02OB4/jbFGk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LDFWF+A3Ia9oGgjAat73UY69OXRB00bVG3jjxYVGPeTTrDKPy2eUHJqpHclf?=
 =?us-ascii?Q?7Sa9Kae8k7qVxq9mRj54zng5OpP7aWtWpLofVsTRJ3oCX7ZTv00CtcGVD3wf?=
 =?us-ascii?Q?woSUHNvTuTZMXZhSIG6aiJztAyabbjt6I8d3IvuZIE1egWN/MaWoenGrdt9P?=
 =?us-ascii?Q?/1Hrk9QMNZEhg7C1jK2A30xaEq3rfa3/Xv/0uro6aOfL+rHWpA4M1fLDHSVA?=
 =?us-ascii?Q?gQrQpM7v0SHrHU3mWDdsP9DtHcljWEKMacwtothxANFmkWF/35mTlr68YwAy?=
 =?us-ascii?Q?H918sVx1y9dtxdcDq5qy1TXwtcHlCGT+guM6j8QFN4VRAwOE3DqylXsiBMLp?=
 =?us-ascii?Q?duR4OTaiTpL18UEGk44iJp80uvjGkhrgYSbPg9s9ezhhRXLLqkOVZ3GBbLXV?=
 =?us-ascii?Q?MUUQx8od1fI+NOuD1nset0DwPrvWrcS/MvWwGev/msiVp/VF2LK6ek8d3EBp?=
 =?us-ascii?Q?NI56oxyRvpgqH7MT4qHCpDOs3rw8VilN2bBt4GpOmUT5Aw1/GhVAl79s37+B?=
 =?us-ascii?Q?DWK3Jo25GuA3bStBp4yxBsLtntm2bUGjd8OURPP108gPDyoWn33a8U64hzLc?=
 =?us-ascii?Q?MCgv3OIcjuFtkaat2OfQFaQnWvT/2WJ6H7vJqgmlwK7+YfW3sExBlrWtqwo8?=
 =?us-ascii?Q?7NqYofTo+jZHfiffMMvgkSVFRxMzUsGKdS1Qz7P+rQlIO8ObGDPcsWkpQyam?=
 =?us-ascii?Q?wb7p2amrjSDwTUkHPBQgAzpJ6l8gfZAJzY8m50a4CbESxJ9vZxPYB4s9amVN?=
 =?us-ascii?Q?SkiyKGdf8Ls1gsiY2/fq5eyEiCWNWO0kDgX3EcLqo9al6jnpog/vdRMxDcJ4?=
 =?us-ascii?Q?Dbp7M14/M8yvSdY/4uzsV5yetztcXFma/L3V/ubt5lwUpOyxQk9eSMEOsF9r?=
 =?us-ascii?Q?ODEJjzEF0DhQaIOZftagK1TbUcsKJ1PVNGhNaFJmUbeYgRDn+lic6+ww3AWS?=
 =?us-ascii?Q?ahK8PTxj9McisxVJlVI+N2R3t5kUDFjhiE8HRsC5eGdJWYnG/kbYOTBE/oIR?=
 =?us-ascii?Q?HuTjWzmbnaQOqdl8XB+84WAqf5d1DrN7wX0avfgsv7yvVHSKhUh91ww8CMmb?=
 =?us-ascii?Q?D/X98GSYfdAMOCHaJ8Km+CrGouwZeeN0NOmIZ9lNPMhDSxA8DlCTDOqstIvc?=
 =?us-ascii?Q?hsZcw6Dna28MNh09X2YFYE+TOQNmE9w43MnMCmoxWnxV3qkfytW8FO5p2imN?=
 =?us-ascii?Q?YVaXurdU5XKUUj3yhdYsarHai3rBCX57u7p6pgZfip+b5mfj8ZivfEdG0OWR?=
 =?us-ascii?Q?g2KbFPEWjQpT4BN2Stb9ck30zkc4bvpplY9Fx1PzZgtZiE4xIoozGCXTsV6l?=
 =?us-ascii?Q?Y+A8Vj2sDaOGuF8iNQcCp3u63EMUy6nV2Dz5HL7rfD6QW5kAO041cqKpPvXE?=
 =?us-ascii?Q?ZTRjvLO7VzOkaS1ahVW70Dc/Jnw+8lfqV3wiqxkWYw5nXyykqM3fzowYR5hS?=
 =?us-ascii?Q?moGT1/nKKx4opfqvspUC8/d/C8uhS1OSBUgIFxXeAby8iYx/bM3RgGE4Cdw2?=
 =?us-ascii?Q?mYw5+hgEvnReG71cuzq9OuyZjDlSPRIm9KfQHZdtgD3kY6HEPAcfIjJeCcCE?=
 =?us-ascii?Q?pxruRX+WL/nF/TBdUZpe0fVs1bAgolrxG85tNxGq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0544bad-0229-444c-baa5-08dc382f9fbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 07:33:57.6141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0m/PSBC7u6BOmY9LlOE2gDTdjRinEhS2sudAHwFZmt+gqMkLWu051CzLHVRAHNGiiAw1OuDWJcMo/xNekFaAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
X-Proofpoint-GUID: knFJhi6LLFwDHe52sKgiKXJ2CZwNcdK0
X-Proofpoint-ORIG-GUID: knFJhi6LLFwDHe52sKgiKXJ2CZwNcdK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402280057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 07:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109048

We encountered a do_configure error when using dash on Ubuntu 20.04:
conftest.c:31:26: fatal error: Python.h: No such file or directory
   31 |                 #include <Python.h>
      |                          ^~~~~~~~~~

It seems that PYTHON_CPPFLAGS is not passed to configure command
correctly. Use configuration option --with-pythoncflags instead of
passing it in cmdline.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
index 470ce1e25..eacbe5ce9 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
@@ -42,7 +42,9 @@ CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-                --with-glibver=2.0"
+                --with-glibver=2.0 \
+                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+               "
 
 PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
@@ -64,7 +66,7 @@ FILES:${PN}-dbg += " \
 
 do_configure () {
     # Let's perform regular configuration first then handle perl issues.
-    PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} autotools_do_configure
+    autotools_do_configure
 
     perl_ver=`perl -V:version | cut -d\' -f 2`
     
-- 
2.25.1


