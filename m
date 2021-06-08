Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8899.1623132138766102626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JvKwQIkl;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15862IdQ023061
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 23:02:18 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 391j7b8nhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3MQn1R0yQTEpWTC6fWPcFfg/znE4L73DcwYMSHnzmt+/QDKXVldRXutrHKWjrY8cbkwSHL4KG/Pv9GsymvUmgRMHFm3pjUylO7dM7vb9FOY54ULlWV0XChCtumSalZwhyKvmou53xglUp0upI5iJ22j+wMuI9dVBrN5wH1PbPbUIlxvpCiuyRyOwcqho0Ix0StgwsB6pHMK8OovBVaFvWraeqIjsjLfMQIGPdjVySOBWBlTRl40o/DTNe+3HdSBMOzrx9yeJ50QaNhh03Ft0sQGvL+rfsyGHyt8U02w1ss5d3hn23GRQCjC1tQhAp/UuQcmzCMbtVuVeDMIhHMHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0A1fLfGNbqmJ4hAoY7Z+hn3xC5PGdmD1db/lmApC5w=;
 b=GM8d83lWk8yvB17V/y1zqDt+GVL5yZwqm1b7aCr6/9xbtxfgLft7fol8cnVoB7lPYyEY4nrFKk/0RujrNVO13nmC+JsSlpWmbAGFnhpawvImrf7sd3b9lhXHNObf10Xh/DdijJLzn2DSUTolpLf1laDY57djfbAhjqyhrvhQo3FYpkwsfntFNcMJcqIZVmnIXuJKOOmtS9RZaT+Rv6lwA3xWSCW8OJ32Q+eFJx3Uedn5965PaSdHr477o3QSvRAVPdG3RxhHEnQNpLL56C61nEXPkJwtD+/HVPzdebheu88I3p3iHVbMQrc/+uxsRSgkNLX2LGFZ84RLEFTAS7wz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0A1fLfGNbqmJ4hAoY7Z+hn3xC5PGdmD1db/lmApC5w=;
 b=JvKwQIklwJUqoJwps7Bx/obatZOmZUBseXGCy2/l1NAHwMwmR9JDEQc/N/fCAOIYt/b9mUsi751hVMu4nns3A1IsX/ze71jzl1uHHeFOBxpuIXR67YlRN7TvTr0jHlJytcnjfO4jYltSyVI95e9Qc1JBLZ72JNbMCvbF9A9OxN0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 06:02:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:02:17 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] dhcp-relay: update 4.4.2 -> 4.4.2-P1
Date: Tue,  8 Jun 2021 14:02:03 +0800
Message-Id: <20210608060204.38115-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608060204.38115-1-yi.zhao@windriver.com>
References: <20210608060204.38115-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:02:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19afbf24-9721-4396-c066-08d92a42f80c
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4698A80B83824594C93CB9FFF9379@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTB5GCginZWzlO9CkjohK7IUpnEMMCS3by7FHBs/mjx2k5k/9X1yugFW+rMzzzrdi/ScBJxD2O34fhwqmgFcHiul084hJyC/jy70QLWPiLNRCk9pfPTWo6lolqjDRqf8wYuRqiKn7vTOhjZyP9gO+cfjv7oUGMFRp12YwAjg5wBfoYTPOO7znE4i8ttUl4lpJcmvfqNbmLD/kuMD6bP9knZiLLbQKM/Vz+yrFvS/0a0vJBsCOfpg1dPCBjvq0hyr8toP6B62crof9KuTXocs5Bry/gTFDd0oBzWrP0GdmW0yJWP1IZpvWvKnftiisUfnOP9qmc6SrkuxbA5QG9HyV4TlFWCdM3Uf+3Og13FlzCyHwEfHQJko2K/7n7Ng9KPbIacdrhsxp++UTCUVwVwlwa7ypPYvnYKD6VH4jXTlY+yt9f0SROWm2e+F3Vg0dY2bGpYKC3JaAx5eVZXg+khmr/5PfUdLxDaIUjdUgoKaPJJHGTm5WXM9PSrh1I4EmceKj9HfO92naDzN4hf00f4QATCi/2Fuy923L6BlFhivKlvH729kTF4k27TTXybMwLKezkA6iYIE6y5ys3G/HjlYa4AR1klD38ctbKsLFpbZbxpvBH3GqRXFDuVrF2cwvUIAPwJQEVyPKy991Z2ohfB03c1y0XONV/ofBXY3PNW+Wr44xxvgv9WTfzrYmf6GYlaWkaIeFGYD4K6owPv6+D9WK/jBZ2zaGfKgsqQNLao6PRvFQpNmffMrlPqB7b3KphYSwcpqkaa4Gm4oDFf3QnVMAGDgsWkDhb0TfhbyymM1flBOpHlG//iRy8+3xKtj/J5P
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(83380400001)(6666004)(6512007)(316002)(38350700002)(186003)(1076003)(16526019)(86362001)(38100700002)(5660300002)(66556008)(66946007)(2616005)(956004)(36756003)(8936002)(52116002)(6916009)(44832011)(8676002)(6506007)(6486002)(2906002)(26005)(966005)(478600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cOXykxadtEBa2dHKhFShCwL4wy23nXcv9feuGdE+geo2hN2cFeF6cLexjW7X?=
 =?us-ascii?Q?vdPzzro93+2t2hthyaQvVAoxSPCDtt4uvIg3XLwuJIQY+luJT2oRjWXIQdar?=
 =?us-ascii?Q?TCXei25dfKtYu/05nfmyJfVwTngjVffq2579H2r0qRbExnqE1fxy4CT3Ua++?=
 =?us-ascii?Q?asmkN6nIPI2IStn7l5H0aQtG/ouRxz6e70VfHrG+uf0oZrbmcxOVPvK5y+XJ?=
 =?us-ascii?Q?CDDDev7DTWxjRfjit5z414krJAixDlpKaRUZtSi94mJY3OoKKNbPdKI6nfgW?=
 =?us-ascii?Q?LIJHCIQOBmdFWcutSSoYqRrndx93Te9singJ7KQltIuRNmsX5EqV59Nk5u6u?=
 =?us-ascii?Q?9qC2w2dOcUq8Bo/PTqHx1JARk598m3x16d/Sfyy2oD2IyauOhvxrBIPVImO3?=
 =?us-ascii?Q?69U9EfMjwDNSJyONmfJxBiY1Jwe92GrJNT6R2dPndCQibr0lABeKdftD4I9z?=
 =?us-ascii?Q?ATUAEOQ425KGET5teH1SfdmQEBfstFkkiN1e6fjOoDd79D5k4fDbexr8N76A?=
 =?us-ascii?Q?evKFyyuMFo6Zc7a5+plBHlTAWkEK0NWJQDCXGbBPUhqGBmRDNz59t0y8dRLv?=
 =?us-ascii?Q?QXiz9Ae7lGxycZ3q4HtS7G4DjckYHAb23EGxrMLiRMD0X0iZp0QzEdHIXiiR?=
 =?us-ascii?Q?lcPoLy5KyQhXo5Sf4hYLLqCi02FsKhnrvjO17Kuf2R8CkN2hqywO9AGTjZ3V?=
 =?us-ascii?Q?PsrqziCWqILY+9iTDjg5lII+KGSmuiW+bRXQi7PmdB5bShZKxMNw1caNBu6j?=
 =?us-ascii?Q?h6C6JI8c+Iczv6eyH41HsGPFXlgsa6GqpcnapKlDNi/fF22SGyU2j9rlk7tH?=
 =?us-ascii?Q?SXHSt37LOE9mcyotk3BauTFgHjbFvIYja6WBgNESDsuObY3K7u/UHlFGpKEG?=
 =?us-ascii?Q?eVi5ewILBqIevM0GaSIGd4ZLsU9wE37uYXUztHA8B32i6lnd9/5lkgmKSCKY?=
 =?us-ascii?Q?/MdhC5GSr9Hsi+DbkPzHRzvY3mQLJFixl92tN8vVdwkeVSKd2hTGS+WP6F+m?=
 =?us-ascii?Q?BO7m8Ry1hm/5hWHav1TZYWYSSmlxAni+nEhX/PCsDSGv3XV8kwGaPIK3qYzW?=
 =?us-ascii?Q?M+dOGDl1PlwkQd2nxhyZ1fd0NSuk9Hs+WpST6orrS9CeMyI7wKpaT+g4jTZ2?=
 =?us-ascii?Q?O8gkZb5/URkiXEJJHPbnkvOQ6+1yUtDB3Gs00IooBxM0WHtsUpegrdqurq/g?=
 =?us-ascii?Q?NcpL6/sX0Dlql+W7LtoHAbXPtai1i2rxyu+SrC24LXRmxMvOee+JlGEb/gbq?=
 =?us-ascii?Q?AJ/jXghAfDrvHAQGSPNU7ZFh86/2iN4m9E8jPxbhTUesK1d8PXi05Cwv0X9C?=
 =?us-ascii?Q?sFT9Us2DgafDSqNFc/wfWwpQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19afbf24-9721-4396-c066-08d92a42f80c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:02:17.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHtzuqPyr+O/3P+BX8+snQFO9VPmSRkd9PmY6LkB/gJSpVEi2JczbuTY8t0WXHYvPihc++FUizXULL+WfKR4Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: yL2zxTRkRTVYqlAlWIt5rSiMYVpENDIV
X-Proofpoint-ORIG-GUID: yL2zxTRkRTVYqlAlWIt5rSiMYVpENDIV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_05:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080041
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes since 4.4.2 (Bug Fixes)
Corrected a buffer overwrite possible when parsing hexadecimal
literals with more than 1024 octets. Reported by Jon Franklin from Dell,
and also by Pawel Wieczorkiewicz from Amazon Web Services.
[Gitlab #182]
CVE: CVE-2021-25217

See: https://downloads.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1-RELNOTES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/{dhcp-relay_4.4.2.bb => dhcp-relay_4.4.2p1.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/dhcp/{dhcp-relay_4.4.2.bb => dhcp-relay_4.4.2p1.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
rename to meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
index 563a6180c..6ea5b4b27 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747
 
 DEPENDS = "openssl libcap zlib"
 
-SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
            https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;name=bind;downloadfilename=bind.tar.gz;unpack=0 \
            file://default-relay \
            file://init-relay \
@@ -20,15 +20,15 @@ SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://0003-bind-Makefile.in-disable-backtrace.patch \
            "
 
-SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
+SRC_URI[md5sum] = "3089a1ebd20a802ec0870ae337d43907"
+SRC_URI[sha256sum] = "b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a"
 SRC_URI[bind.md5sum] = "0d029dd06ca60c6739c3189c999ef757"
 SRC_URI[bind.sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
 
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
-S = "${WORKDIR}/dhcp-${PV}"
+S = "${WORKDIR}/dhcp-4.4.2-P1"
 
 inherit autotools-brokensep systemd
 
-- 
2.25.1

