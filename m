Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57692CD4846
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 02:25:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66819.1778552746681245972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 19:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jaOsXZmd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959278113e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C014ou2925284
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 02:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cZ7CtR2HDG4mmwOgoSB7
	p2TZi4aw4YsS1bOwe7tdDfs=; b=jaOsXZmdsbT1rFqOtt6H2gJZAXS2uOspa3Ha
	8TLFrxxWdzAFISqTsRl/nrMZsunmktYgU2hvXXXxBLacgtrwjBuVl8srLkvO7KoU
	8k7rdu09obTIf0Up9DzfgNqxeQceen4ykYZezdJBXO3vkzMVw8tkRsYd1+gbBLGm
	aYHw4SH/TjL75ik7VDTuYe4bPTCPxeFYcsbO6MrEFgDeJULQqJzyh+e677v+++kG
	UmvKJe20MFaSi85zlV4lL7LKEWiGeEMH/7gjjR2D4fgaW4QxTZvtaOFYF+U1QDLA
	F/wGC+3mdnyX7Vbe5oli97GFhlk1O5QT9OMQeyOpuui4z7zO2w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrarw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 02:25:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSaGu9YY3CHP1BrOH0VpHLgLJOn0kNtG2A7KbwWl5LjRUX4m4epXwxKlamUNOtkG5exFspAZx2MgBq/z2Eb5TYLHwpZF4csGz8G5BKbf8WsuD8taOdrkkZaGQkBbZMM6quPLKMbP4spELdFvo+a1Pa2rqrJKdZTnpJM4q3M5D1jfAo493e6JHgdZu0+MnZ8ISLcIcTIs8z8s1pQaSrTlPas1KiLQtp1WMr9EuDlX6A2mOCo6wM9Y/ugW7A7YiGF/kZbzECRgCOgM91NcJh/HbJ5+h371haDl1870KeKhyQdOdLAn4/EX3RgiHRjBJsUv25Y+4X3/KAG1EaYoanVo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ7CtR2HDG4mmwOgoSB7p2TZi4aw4YsS1bOwe7tdDfs=;
 b=mYhElIhPRQ+2yZLGMWC6mI2NyOyeD70TCZk230IT4ub+tM4GAd7+09zb1M/aduwvOCvZ+QTThigUa+6cZ36zjKtI3Hi6BdmenuTF++ZQ5Ym9v9qCIz3Vj63UDc32+gu+RsrPnGLvRXrGyGhlap5lIBdxls7uv0ODdIfeYQWihYdi/+CMtjB+PepXGxitxgC9Hg0QPotoEbmvkqMCPaCOZ06kiRiN8A2n6EMneKZxLyLBOQtMpn/PGxWLI9TNfgPO+wqw+n4H0S+yeb8MMjhJB2r3vXHyRPDTbKladhNqy16t342RhHhRrbpeNmnSezZcwPPxi+RLuV3ChGOr9Yg8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF20F246184.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::819) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 02:25:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 02:25:42 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH] apache2: upgrade 2.4.66 -> 2.4.67
Date: Tue, 12 May 2026 10:25:24 +0800
Message-Id: <20260512022524.1591093-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF20F246184:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab7cce3-33e0-484e-4546-08deafcdc3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|11063799003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Eu8m06Fu5eJYMR2yEgnsgJw3kJTrr4aJTwYp5mBTPIakt+JwaNdYZXdh121o5+7Y1Jxfrw67VM8DbFoDYc+dfUfTDIqP4HqhsFaslZOrj+Wbj+w57kFVr19aXkf0lPEtwnUFozRgqdUwCI46SiTbx+a6np3BikHAwPU0EVvVN+URPdGA9MpYi8hx0VAAGrF4iTfrZgDrnI3qEDLEnkbRSy3TWKYwjnssJn6RnGaxHDEHFkSGYjkYf52uU2Xv7/NGWoCbsTeAupTG4gKgdL9IIXRkz/yA77nnFmV8aRc9x3yYrgB795DN2mNmn27Y9PghzRTryCM8W2AINM3fj6vQYFST9c4gqmW6MfOZ6DUSrDtNzKMdKAkTqsMzELlG+QTgLMnog9qi3o2tCEEx1YjcNL9ehOuFpdhlDpB8zS6FmBwDE9DdLay18HmaDG+00E6uPVnzf7ZNSkyyE3aaRMpeJ2mAFN5XwpZqXgjOiXbW00esA2pfqrtJDu0PBhxucov21BXASdcRlXMPNGgq3KGX7Fcsq5WTZdkGGb24zOay1Re/Z2Jtk2jjxF6KibDG1OQ1VWK2sdUFi8wL7/2iJBMSnSfnIpwIvzkv9Sciw963JHBKZwlF4KAG3KXB9U4WDYklhM5M/htZqLXaZOmrwDBHaf7txwIktSKYsF3f2g2ieUrf6RYv2NVPIZL66ZnrOdVGH1ojsnUIPlCEkG5OyAzN9mMcZtiJ6Fym3GBA+OQWV91aMRg0LDRidVbv80INIiNN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(11063799003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XPhCT4PUXszKQ4jk2SNMbGLHP5WKo4u4Xh98JMbX38sj6H/lzf6L5kY3eeE8?=
 =?us-ascii?Q?tn22g2XvWcGA1MlKp6sDzMi/G8UwaSBS4b9AlfyhTB/4gVycctHt9Gd8Yb3j?=
 =?us-ascii?Q?9BqoUxbPwO9QWGCQsnG5gGAxfGmwPHF606xQScvJLO+e3lW+E9sJ+riTy0F/?=
 =?us-ascii?Q?GIYTZDMRAKrB6nB2m62NIcogIuxSvyGC88Ryzq8gCZh+E23dqDc9NHTTUGRa?=
 =?us-ascii?Q?w8ARWORKsm55vQd+nvqeWg9luOaWDnanp8ixLpXJtFitS8UekIt2NBIJi3l4?=
 =?us-ascii?Q?MuM9jg+nhcGQNnYJV0UMVjZ1CgMeHdVkuEBt022aMiQ6AiLFxjqvasonKBXk?=
 =?us-ascii?Q?viEaBKbdzJFVSwt6Fgb3+E9LkKAKM89O9G5uR5oWwE+MsV0WpOIvampFYZBP?=
 =?us-ascii?Q?lm+JmdC3P5NWtXGHNnqzb38gzK3ca8wCenW4kbiCcy6b4f0iAAxHQcvs2anD?=
 =?us-ascii?Q?tRfPVZqUf7asRoaDdAt67vk4kSbp0bbVYsGr1wRfWNRm/3Yj0oq7DmtjzMQD?=
 =?us-ascii?Q?O/xNfJNXsb1Rrc6pMbO2VUgZrKmJtPvf+7/5w3t+RgzqBIvhs1ut7MMTgUQc?=
 =?us-ascii?Q?KeubnYAGkpRPOVTiB0S5s8PFASWnPjgGTN5EMTNuLbroT4oQHm2HLwIqw7VH?=
 =?us-ascii?Q?VcLfnh3NibxRAG0Bev33KykWy+gPkLYOTZcyIV8OubpVlHY8aRFf7Kd1eoWU?=
 =?us-ascii?Q?TeGPlkPq+Zry0+WpODuA46tW4A/F8wncCnk25gj5Mg/7boqCfQ1eNF5fvBHK?=
 =?us-ascii?Q?ON7Sce3pc3J+HBW3ZI7Axec//CM78sDIUePhLovgSX2zU2zn1QQNbWn7cl7F?=
 =?us-ascii?Q?sd0cZ5tcen3BY5GLGg0aHwe8HipnFsax6kgD6YHhEfiq1X7qb8Qwgn03g3Y1?=
 =?us-ascii?Q?p/Wtmd+Cp7FRELK+v6Htoc3HqNULnVgzJR4RzZdEy4XT1yRbuBVo5EK7A+qi?=
 =?us-ascii?Q?TRKQI/gFitMhUmRrvyCEwJ5UEm8mgtY4ywmE8Kfmn+RFINEfKE1DonHUchEM?=
 =?us-ascii?Q?F8k8lfKdd5pmbkyHsoI2WfaBIXBfNwKG4Wbzg2c3eeAOQoso5gsFSqmRJUCo?=
 =?us-ascii?Q?5byQEBjIEiZIjpsO9Pn8387ym/bpaXhvTOFCXCo/xxgkDODAwvBTv9D3yGxF?=
 =?us-ascii?Q?OaxkHa4VeBlTyyb1T94d/eUm0nuGn511L5ZEVfOBLqjnSKVwYZcCcCPWTOxC?=
 =?us-ascii?Q?qh4oXx9bRrkMcY3vMq3fYxy5bfWPWl4krVzvaKfvrjgvp2iWeKeWez/uQm5w?=
 =?us-ascii?Q?HkLXFV5pMNSpmvWilUG1piA4JkPDdfpGkBDsrBbJ//TASnlVQs7bVPNKtJtb?=
 =?us-ascii?Q?Qw6ZMdiL4aOMxQkX2Uqn/H0fr7O7CtlYYWQZuFckjWQ3XBe9UAvemWpiaZhD?=
 =?us-ascii?Q?BmKO/BHAfH0zsFJb78hpPejXO0UymQNcwzsZs4WReOMsfLr7sho2kwiVarGC?=
 =?us-ascii?Q?gIQLd4hZmeGQYUaKoA6BmJcnRVlLNRPzLjGY8wX5WYX22EwxCiLGSfarrQvI?=
 =?us-ascii?Q?+4G5Peq9Ei+U1wa9inj1klFw/BfrWxo2IDmlaIXuGDUUPWpfyQcBWSlBnK+h?=
 =?us-ascii?Q?Gp2x0FL0+Mm9WGDVDqHsioxz6ad4Jg0uU6h1qpDLvas4+3i3XyP9YTWo5mHY?=
 =?us-ascii?Q?y4dKrz9mHD7wjBw6vSqZRpRpyyNjbmx/OgN+CTzMoy0kYt1yuCB42ThvSmuX?=
 =?us-ascii?Q?0hatMeK23aXWsw3s3XgwO3luRyJQEN0n9NUXWr3DTgzlq2z6wgk9MaiUP+1B?=
 =?us-ascii?Q?MWlBNJ94smbEdUJsleyGHG/Le3RGpag=3D?=
X-Exchange-RoutingPolicyChecked: 
	Bs8W/JVwUz/Q7loKeT8Qg5c5eKLkwDOdd7cTqGWAGXFuImxDqeOmJXTBzqEVOG5FhZVjeAORZKnSLB6uB+vCZi1cpEuY/0X9zv1SSkhzWt6HR+CJXfVUlOWJKteMT/Glm619K4M2nkKS2tn1VPH8aztjmSGNDXkYEZSVxE8B5Odci/dLn5UCBUv6jqKRY4ZF+cXza8AdEmU7f2wnHgqfIJcH3MyCqDSonvtuzGGbpufLWbZDCdmwJY8S21ErHjbCcxeru9XNVt3A5s0SYgtpybDy8I8yrFN2P7C/7UkQkEyK4yIR1wgRsEA5osMQHX7lyStybN+JETZOzBTnCnuwcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab7cce3-33e0-484e-4546-08deafcdc3ff
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 02:25:42.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyFG58nYvJll9cE9/d1Lx47yaZ0BsGpBlI2O8387TgQSlbwqUf/uWTu9SRanTKCXmsYVrFpoFLUAn0j5AkLjuisusrOLE4jjvq4W+dE328s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF20F246184
X-Proofpoint-GUID: -lTJCZ3JW9R1OzHHHt73V6MfXIzaEex6
X-Proofpoint-ORIG-GUID: -lTJCZ3JW9R1OzHHHt73V6MfXIzaEex6
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a028fa9 cx=c_pps
 a=2WNp8eytYxiGqAsAszTi1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mV9VRH-2AAAA:8
 a=t7CeM3EgAAAA:8 a=6PmuYHjm9Mjsl3llDxUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyMCBTYWx0ZWRfX6jv/I8s2szpD
 3o2cumAyDhXIE4NCnq4zftLuqR4U++3X3SCothCWCyS77Edk+hE1ylcikZZ7SScjnCgz0oz20dg
 xb+uc4dZ1wGcOt/fPPDvVyS+eilcWeIuYY3KLH724TSz0hNglKkEoWlNysjVRSQ829+lJ7wCc1v
 P4pstAP6bDI9dTPvjJZLyEoOZpWcld8A9qq3YPnb/z7GA8/L3LyyAiHHyJae+R75PVHkktYpSM8
 Mf0SjTVKdcxuu+yiK08DdebC/WFJGM+fdcz2wA3wQux5DiNf4agj/Y8JOyrDeZHGlFXvWYJzDgu
 Hi4r436sFAD+RBdMfbcv9rh+Q+vsIhtWpgh2FJixfEJjyGfrGLyhduNTSnoWnuKYoQlbHTSJIdN
 3XmlJgAVZyYgIN9ErQ2iArekAQwT1wskJ1N9RpvLaMsNSpWYRKdLnFEGKlgjyr1xvDjJu4ea9G0
 keHbY9MP+i/R6nrjurg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 02:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126855

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Security fixes:
- CVE-2026-34059
- CVE-2026-34032
- CVE-2026-33857
- CVE-2026-33523
- CVE-2026-33007
- CVE-2026-33006
- CVE-2026-29169
- CVE-2026-29168
- CVE-2026-28780
- CVE-2026-24072
- CVE-2026-23918

See: https://archive.apache.org/dist/httpd/CHANGES_2.4.67

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
index 630c6f3b1b..082f533c85 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
+SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
-- 
2.34.1


