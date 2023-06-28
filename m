Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE49DEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 12:59:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15467.1687957139192331194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 05:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dlLY1tWr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=654386a0a9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35SAj2L1011133
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 05:58:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=Y1GXJxKvbqCbh+XUDZW8dME+5mgNuivUy7bkH/JEOYI=; b=
	dlLY1tWrkedMf22u+Xp5fgw6rXyyqdgIRdd2DmWAcZUuypuVmO4hyBQ7vLLMHZje
	mwYUiTIzUUJGQH9NSD9uVcKp0PrlfUenPsEVhW/+0BS3htZUiYmAwC+1q1+ERFmX
	xOpJ1q8v1u8sANv3pmH/d75hhn9MsZAaJ9SMIvVZJMB08uec8pzd2lyyyV7pfPyf
	0BZ2Fs+TFaIlbb5JqQHMf5genRoMhcqJg44hU0DwmgGhL0YsSyZitUv2fLB7rt6X
	qgq85N3y1lJ774u+bdosIUfNeOXdqlO3W/n8AbCm+n7dTRbV6a+tqKY1sbAyhAmu
	sc8WYvNnd8Gz3BpTDHrhVA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb31e2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 05:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxZ7+lOFCi4Kbkeu7dPrtFDce+8FjKjUc732763YDWnbeNxDXulMG1ESYEmJwB8hXjIAM+pftO8vueIUmLws6Ms1XPUEeMAzY4OP0FMRONMK+bOoG3sE/IIHDa5jVEWEMQCZ9yvDh9OWCc44JvMiT6qNJhIgCOXiygienYwFP95WlQPoApc/7jYO6sjFUHK7ETA5LLCVTpFBUkrq8MoFBKr8d++HwhM+73TVmQV/98D6MMiq5chW4pMHV/QCl1T5X0gYkTjsFsL05uaKBG+7TEQtFYgIyb36bCgEtR1Vo5+nc/nNLloPEIq+m8TZ6yGc4TTcUx5KvBRdg9ddPvuHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1GXJxKvbqCbh+XUDZW8dME+5mgNuivUy7bkH/JEOYI=;
 b=jlnqMj9xSntqK6oafXRWxaP34am06jIC7OarZcynJtt8I+qOkdzAp0naJ9WQZirKiBslAFzmt8Dh5nJ5jE++gCWVQC/Y6gTsesohatrgk83npZBABaqsNH8diZyNk5u5NELFZrQ2/g5Fj3jN/1YJuWgVRQT56uSkQwqN9e6o2NfeJhjNanicLtJIurU1rZUEJsWWLLYG2r1X8nmwPLxwioxNimSBpfPYOWaLxsvlSbvpWW9PwVyeI1m4yXsNKZgex6ZYmfM7x8AdR3a0Ke011IAJ0arcdywectH/k+tqiXMvX4th1d+l6bxyo77q+nHNqSIElslJbCajvTViXHbekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 12:58:57 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6544.012; Wed, 28 Jun 2023
 12:58:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2][mickledore][master] mbedtls: upgrade 2.28.2 -> 2.28.3
Date: Wed, 28 Jun 2023 20:58:45 +0800
Message-Id: <20230628125845.3702881-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230628125845.3702881-1-yi.zhao@windriver.com>
References: <20230628125845.3702881-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 462066eb-a517-46e0-8e71-08db77d76f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	roj0z/H2Nm4Gc4VWRirttTI+HWRAP0X+xaAm0p/l4cmlQAxxufTbLZAQbLn6QyBWrzj+iAYRI3eSBOeBTxCViy3XMKS55wtvHuKCfUtlLKbJ1N4tWb3XW8XFKR1UqmuSYR9CsZskJWkPGmke60VwMwg0xPD2sCYoJ8MgYpZLde2EN/MHYm/5f8pkEkH/6/IFISWgAFrQG9ycECdbPdjqnvFkAqn34DpK2LKE2FPlqrqb/Tfqn7dGLMYbhoJKpXt+X9GLu4uy1PQVaadfdYdxoL1oNB82hGW9pf1BdByBEmAM8Es0FLEWsTbfIgr/Lc1bYjFrJZ5UaEQtAvSDTcAK2n1Qld8xQLaEx9IiCIKdjpxZjVwq8MF4cdGgxiGgppxbI5ERGXLwTMkPIcbARMc1qgp4R3bO0FnaZpeXqLRR/jTzQ6ePQOpNKX6LwdKXFvgbHhfRUTGzEY6s1avFRek/yanuiF9fzTH6a53g0NDgBc3wM2TQ46YElXquZT0GEMpI4iAWUXHJNXSJcOFowOrUmrrv5YrajVOZE1KF+c4wautIt8OABxf+rj0mQNqESSYO3LYRv8fh/PXE1iqb+cC0+7qCQcwvae7db1ptM0WxQSdRGsu9Sn8X/Ph4UDI3V3GEAGOWBP7P73AM9hOrZgHWOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(451199021)(41300700001)(6486002)(316002)(52116002)(2616005)(5660300002)(36756003)(6506007)(26005)(44832011)(6512007)(1076003)(186003)(2906002)(83380400001)(8676002)(966005)(86362001)(8936002)(38100700002)(38350700002)(478600001)(66946007)(6916009)(6666004)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q1+1diQtjIwcVVpHDoF3h5P1lW88wj89nekYcU5Jpa7mZ6YT2QH7c+EIO4w+?=
 =?us-ascii?Q?TzEVPVjvsQNItM+IQKSWadielFXbhYsqZ2vQy7b5LaiXg3IpQqsjgiznDhhi?=
 =?us-ascii?Q?3oNJSh5lFudO0SsR9AxuVt7bvqJNkJpuu4292I3WmAIsyyrJ+5uLLSNC+7qy?=
 =?us-ascii?Q?8Bsdcfy9FPyXK4PPBuME7zO5gcB+/IMLV6uTZKXG+DGF9K4NLnvWqGzq0Omz?=
 =?us-ascii?Q?OMWk5Poga8nXsGHhitEBSoIP0Y9bXkAeH4bVDMOtt8RCzfsEhce2ut+ACodx?=
 =?us-ascii?Q?2c3rkKp0exWXR9TlabjjWEzjvxOv0nTnx2//oHw1Pu/2X3DnpPfJ1JlvLouK?=
 =?us-ascii?Q?xzikLACJsQ3/q12YJwFqx6QRwz+aoza/KuThcWEKluyAN9iEtE3y8CFMTHrp?=
 =?us-ascii?Q?8rJ/0miHcrbBVPmuM4B/nUtsmPf5N1UOTTvCt/6QfMioYX71ZY51Cdoqw8C6?=
 =?us-ascii?Q?Yd0nFqR2M9uubA+SPKkD03/DkFB25ziz3Y6z0iZp1Q6vkmm5jo2uK2aYTUbm?=
 =?us-ascii?Q?/LQxrOBcQc4VnOy5+PWES4gL9Wpbe9X9M1E4uIe8x4vtAg7zZRKhFNNlHvXZ?=
 =?us-ascii?Q?BgN1Bac2v5sDCQ4HmQl23rQ8bbYU9FjyEHb8w4jkSuwPiEFha6ZEnhfy1N34?=
 =?us-ascii?Q?6KXImXDhSH0f0bva0dotEAUg0F2adofqSKwxHHyn4mMnIkP6ygXsYfiWyK23?=
 =?us-ascii?Q?nasllPpCwn22fbNCDFTlT8wfl7vaX6CVQ22ukuQbEItBD3ShewMgwCyBylzV?=
 =?us-ascii?Q?BDm6qSjr8Ky3RGYNJO7SlkZ45RNHzuxmnAcCp4qKLsDSTjv+ge2fsAlmMZiC?=
 =?us-ascii?Q?P8j0vHjcfxPzKKC9AhSPr68DVuACqhBVq9FHgbWaovo7datrN8P2mwZkRLqK?=
 =?us-ascii?Q?lipY3tB1VCOmU656AcROxXrLrLDgCfm2o3jEr87yDDO1RofMkhrHG9FeZMw8?=
 =?us-ascii?Q?d56TYWBMMcQCflI0GEm02EdvM79cZiMgsc8JzF9cDrSxLpPdKKRKVgQQU9aJ?=
 =?us-ascii?Q?XxQ4+QAO/n5WIE9oUSbwkR+xNP2uWEll4n4oK4pwrFn2/hgnrOTNYdWgcTyQ?=
 =?us-ascii?Q?PuVYO6J/zzjDE4y+g+siKOvs/nItUenG3rt3mJUZn3gOwkp70gxxTuVQu/iP?=
 =?us-ascii?Q?Snvw8OrPhzFujM4NfwIFLZVaxOMj5ZeA8B612zl6Pw6oGZj0/Y8Of+s2KMKc?=
 =?us-ascii?Q?mno+n7kClylonBJ2GknuqhRm/K8IDPv+cLLmKPqZGbhm5YEWqk6VgvJdzoKJ?=
 =?us-ascii?Q?/3gN2GWGHC4+H8lA+WItwX3Nf4WIUDFRhB+anLbn++QHA1rztYzIeR7FXLty?=
 =?us-ascii?Q?L+DDVyZpWPUIlBkF6cm0+t+A2L2vwe9CabHtnVCFE2x+6aZH5vcnpDj7w/1t?=
 =?us-ascii?Q?cZt+QGlTBpIggPTJsetgXskyHL+ZlssjRd7PQwdlb58EbF3KHB9LhHC6Pak7?=
 =?us-ascii?Q?9ii7QHvgSWTgOaEllM+Lo1FmqV0eJ1J50kCx2onwSIG2i3FS+3rSz4B2paOR?=
 =?us-ascii?Q?QPr4trkIvOMkc9ZSCC3rtlcgPHdIDe1Xv7cZdWUfjXouzZ1Pb76jeLykY1Ot?=
 =?us-ascii?Q?W7omnVuEcou3RDoLbhaUggKRCERapp9fdeys6LfB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462066eb-a517-46e0-8e71-08db77d76f42
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 12:58:57.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMgsCxtahl6r7Xo+uOgQcIRgiHql2NHVfhfjg9unRFuZ79+l6wpZ9rRgseyT3f2AQsz/uG5fBHfDLilmfQqkqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
X-Proofpoint-GUID: pFK1gyimSuCCuq3eOwi0Bh7en7A1KUSS
X-Proofpoint-ORIG-GUID: pFK1gyimSuCCuq3eOwi0Bh7en7A1KUSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_08,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 12:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103628

Mbed TLS 2.28 is a long-time support branch. It will be supported with
bug-fixes and security fixes until end of 2024.

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.3.bb}      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.3.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
index 242495e94..ce094d5af 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
+SRCREV = "981743de6fcdbe672e482b6fd724d31d0a0d2476"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
@@ -62,6 +62,12 @@ CVE_CHECK_IGNORE += "CVE-2021-43666"
 # Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
 CVE_CHECK_IGNORE += "CVE-2021-45451"
 
+# Strip host paths from autogenerated test files
+do_compile:append() {
+	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
+	sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
+}
+
 # Export source files/headers needed by Arm Trusted Firmware
 sysroot_stage_all:append() {
 	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
-- 
2.25.1


