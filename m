Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11589.1621431799323365714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 06:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I8pcZs0i;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JDc6hP029788;
	Wed, 19 May 2021 06:43:18 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 38mctd8hsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 May 2021 06:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPFkoU2Hebjb+ihAMXUbhd6pC99kjIBYZQCDSStgvohFTOLaamrmC1tE3R65tqTp0k2zmHZLSHFPuQRdUvbzX2OxiFBFzdz+WpRVXaqyIaDIvATHAcyI4IvokKH5A32NcRGttrNczQNQri2x1dFFEwVdswXH0ZFjQo4U8XVJJWmvg+hiLe6PDBS0EOO2gPFrj8nQPtEBMrSWnC5i8Q4GPt7wmYsjEFspVqAdYgHt5/0++7WECbSeuNu6uoEhXB1qpePpM1FMxaMRzVbzijqP8cqzy3zVJjwY1HMZ77Gxj44a5mr50S6ghWIrb5HIBPfoL5edU4YNEKTpmQzZl3Jjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvy8Ab4/i0DM+lRE2SvQLA9LI7v6MAcc22cxemhF/qU=;
 b=GKlQAKZpYMpcu8h3ObYgQXDJ6M50E/T4mAiFoU0/bZioajiSig1eu1l8D0XRZlUx6NbDJXMk73+pkdrr9luhotY4Dvc6HX/7GRa301Yr3ow6aZQhZlJbPyhrPC0O3ifzMDf8TynrSbfbIbPGjoU+j0LeUeI4zqAthPVuExdbEBW6qTvFYc+gRuHPMN+Bv/WicpxF9uHlp29GT9FgsR63qAQsTQwEaMnnhHLMK4EGGsDZmiKExcE0cE1IgtjuA/jBCZ/jYF/F2qR4sEnFdtWODrrYpXKXsDJuOy0seIa5G3rnUn5p4/2TrX0fTO7UCQRHlm5rW9BhwmmS9oE0xGeEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvy8Ab4/i0DM+lRE2SvQLA9LI7v6MAcc22cxemhF/qU=;
 b=I8pcZs0iK2zGlyPXsI0lQz4ccKKTrLDfO6akz3HJGj5okm+YfjWp7HO5pxwyEy9QzvpMp/aPbWRrz6mhkgK00gQmOiu1Kz+N6H197nwERPfd6BIFdOlpG8pNKaQlwAE1sqTAtwm4pQcC5iW6bcABjS1Nu/Bj1gnZRLOx0d9r8c0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 13:43:15 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:43:15 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [PATCH 1/2] opencv: remove tbb packageconfig for powerpc
Date: Wed, 19 May 2021 06:42:59 -0700
Message-Id: <20210519134301.4175937-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:300:c0::14) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR08CA0040.namprd08.prod.outlook.com (2603:10b6:300:c0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:43:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dd95b4d-903c-4735-94f9-08d91acc0d7f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4883:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4883EA3D630E5775CF3DADDEEE2B9@CO1PR11MB4883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XHI4pubVmylDcrNfhn5UCmS5/bBlGXz7fGObeNfsaoqNU+r1Y+VyP0A7sQGSX88tjHNNqFV9SW1DmeptJAs1MWBOcoTM1tklzvL8qVPV1NljAxBM7p7HVgri63Rk8JK3ASQWL9OKkGi4B+4DBQzZLJMCprLH74A7G7Q/E1x5k73L8yETiyTULv+oVY/Jynou+O1bFDvzgJaR9AwD2AVkqVIUca0DrJkjchNDuDdzHmexb3CF/3nlz+4biOIEs0TpEgCudCYkx70L5jKeHOYWjwam4n61T8V4hM6Wt64e5uoWNVvRWKd7YsBK6kzhZjVy+guwbSMwjUu4ycJito3DFd2rzS2O+8OPiaidf/ERb9p7bWH2ATrGQxK5FFN5HCVy7kXRSveuCHRKNcFK+mhoGtWMAYlN+uvfHH91lv8dg8f3XUifytTGkaaj/s1PyrFnTk3sOlz2V35+x2iRjVDVDWr6Nk2C/sLvYJ1C/RzbYTLSwPtu69y+x47Gl/ECJ5tsnDY4DIdOgdq0gphNGNR7p+k65fbK7LRimkmNLghtIxRyGXk7j/aSeTVPHkPGXLp3sZ4gRdxzFs8PWASTS9W29BbeEXPo0gDvlIF5cPLU1iST3OvQWR6CHlx4tGGOxWnAzTmuyA6hzgZp1H5V91t38g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(66946007)(66556008)(66476007)(38350700002)(38100700002)(1076003)(6486002)(6512007)(2906002)(44832011)(6666004)(2616005)(8936002)(26005)(186003)(956004)(6506007)(16526019)(52116002)(478600001)(8676002)(86362001)(316002)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JNWCVEWydShmlSBQ5Xg9e46TgWfqaCw8aDMiQAsrRenP7LetXuS4nG/R3jCe?=
 =?us-ascii?Q?mqCkRQMadEERN1dgwGlFipABxpb4BAo0bCwzAAZ5qmiKL5hReLdFndADh0Ol?=
 =?us-ascii?Q?ZzIO5kAnJIhgAT5vNR/73Ij97dZmZqePcG9BsoLRftVRlKX/a2ugdRKWuTbe?=
 =?us-ascii?Q?ssrw3hv5lAvVfRx3eAP5GTWJTT+crCnv8XGFEgwzAZfq3/tH7Lmvez1Gb7Kg?=
 =?us-ascii?Q?RL5CAyEEmca6kJJaVFioaS7YcL2/Uv9T0tBUyxT4ziAFUFfzf0ZS1CkM/jls?=
 =?us-ascii?Q?4nlvBbXqkyt9MmwdRsxAHuObEq6SZ8sm+M4G4T/mG+uQqgFtjBi6sXLWVDz/?=
 =?us-ascii?Q?qtcpWuNKukC8JXcavr1LSeR517WaIc4mjqdUSauffUtNpj+b2j6PxVyELNy3?=
 =?us-ascii?Q?vVe3g8x1eLqlfBmamhkEIj9XGGijY8JNFMZGjke/gANjkkA7XzVPQ2H6wMmT?=
 =?us-ascii?Q?qk+UcnpRvjD/3IBvWYo7DEryivrg+YUDIwEHei21tWqBiErtk2Z0zF6Ks1sh?=
 =?us-ascii?Q?LYik7Otl9fEI58Kfb80aNVdt1YreIN0uDKqKyClHLOpGUi4UEcIuDvLd44/H?=
 =?us-ascii?Q?4KDVD0neb4bh/E4i8R+CYLqyBQI8GpOPayd6LmozZfpZiG/SgdCLFAwcg9a+?=
 =?us-ascii?Q?ZnPzmfOqjl9cLLF1PiiZy5+a28GEeguCc5lQ2iZO7pgGEBMbSHIV2yv0qH1Q?=
 =?us-ascii?Q?6Tk11JG3hgpqWU/HbzrAputjvpz/YYpmoAC4PtG7kwTJsII3rgoNeDBuRhVm?=
 =?us-ascii?Q?T8xLMcCDxJYYe5xzI0zC7WULw/34ORzWLjqgNEUwo2EwT5QVXMj21bMdrboK?=
 =?us-ascii?Q?Hea7L2IaBOuBNE9BOi0hTEyzHUFOVQufLYoH1TsLRwjBcPON/lr4QCKADVPx?=
 =?us-ascii?Q?+/j2u+onO2e3bCVPtb+dV0ThgZxqD9n9fgLTO7J+WbMYYyMhQplYoClPl3vN?=
 =?us-ascii?Q?YHz8XJrc1u4IPS/cKHySDOyFx0E+LXdvDj2tNYCU7IqGsWlLUn8Yi4FByoru?=
 =?us-ascii?Q?8yTPhI4z94g0P2Zh6VMa22fINHBAOWUFFaxzV7SX7leT7GfaKnVQ8QkFUzED?=
 =?us-ascii?Q?9W1osCQM7iNUBAV65NYwaalUChCVpctB9BER8MIWBioTNk3xBIk0eRm906DS?=
 =?us-ascii?Q?BA3OlT1VPnIigPKKGGz56XI5JODEmPsj5pNnYyOpjxo9jsCuY+xmEmItjw2v?=
 =?us-ascii?Q?tJyDiOSwYg6+ZheI/VZraipbdDlI9kFf0/lbung2oBIY6wzaLjDrb5xKU71M?=
 =?us-ascii?Q?iUCTHcAMMXdDbC1uBpO13yS2x1X/XaUVv6YPfsST/sZJ1aeWwCSK72HpWQjz?=
 =?us-ascii?Q?ypA0YDi8G/tNj+3dhT8unraz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd95b4d-903c-4735-94f9-08d91acc0d7f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:43:15.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9kaQFLhrz0MVel7bkyftrT8ICG+JkZNzyHIIkLvQrGhJ8guoFrfAiPbEsZupvF8/4AUqpn/m7gscr0RJZPmgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
X-Proofpoint-GUID: mxI1ZivxGESw2j79LZ3sTjN8f4C5Ym2s
X-Proofpoint-ORIG-GUID: mxI1ZivxGESw2j79LZ3sTjN8f4C5Ym2s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_05:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190085
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since tbb does not build for powerpc remove it from the enabled list

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 311355bd7..1dcd8586c 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -106,6 +106,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+# TBB does not build for powerpc so disable that package config
+PACKAGECONFIG_remove_powerpc = "tbb"
+
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-- 
2.25.1

