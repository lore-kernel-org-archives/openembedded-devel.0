Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F81C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:46:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13324.1741868232705092609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516795d8d2=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D6GBiF004945
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 05:17:12 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4sx8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 05:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAuiccmuknXytfhLQdKPHG+8xACEJyvBG7FQtKn3HCSC7YqKrqpdTKuOLV9TVVgTurDKU6udjln2955S55PDQbR/0LGNT+oK3J3acAj675F86sv5Mr4McpcKlDcWutz1eYoXnsqPDwup6xuPwyHdiUz4rY8hAIRWLfrWUplbiaVlvWbbNXOx/tpBiri8SP6l2caXKdsdoEPjGAmWNDuG7l8ChIXdwk7hRslmMeSNQGPCBT6w+JZtJcxiHyjaNWZOmUKXj0CSU6hcz23sJwYzgFi5nF7fpJf8mh78KF5Pvl2EIck02BOCp9UuR9CPBFtlJ/U1KQvNpF9wrS2ZV1SoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Kb3IKOiMJMM7Gny6K3aUmrzEchYDHBGXrh6rBq/DRY=;
 b=xhEcUDrGrzlYWxis/TLbFFYRbu/FbZqHADshOJg18+r3GCDzQju03+HUly9jafTtZsEm7wO81Mj35vV8Kpowb44krWvw8tJrila41eACgjmQhPZssldhtwm+Osnwhzp1Gt6iJEQKNXQCnAkIc7mPvEk4DjAaPPJyoDEMRLaHQ+ZjCQwain7AwlXt1vs0N07AP5x/ILj4Qt3w/U4OIpdTUapPBIICD03o4jyrkbfe5iHvEN834/GZCyJGfjR8C3s9bQZ91iJ8/1eSzYxnqdUb6+7jSYF0wpIWS+luCWmiw8RTgR/yRVIowAIb2QZ+K32gZXtVqtXUlMy+9CzD1pELkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 12:17:09 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 12:17:09 +0000
From: libo.chen.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-gpt-image: add recipe
Date: Thu, 13 Mar 2025 20:16:45 +0800
Message-Id: <20250313121645.233616-1-libo.chen.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TY2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:404:f6::16) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|SN7PR11MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 40eb6b3b-e013-403c-66a5-08dd6228fa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f0BRekXS2K7kXF6Jqef2ZF/7BDVyANYoxzANs55kdsrOJpUrBc62lZhx8aj8?=
 =?us-ascii?Q?gWeyVanQRdkNW6hMhptS+DBfkv38+DHcRVRrQ6VaLFbIvnc4Jj1hBDri1Hp6?=
 =?us-ascii?Q?+WLod/O7FNJzxlecIvh976zm0bs9G5EBCsumdGOKPeo0bGMH5s+ZqyiJlRlJ?=
 =?us-ascii?Q?eBZA7gzM2SXZupRAxtycwT9o0TiBdkF6J5qlV+cAl6Rt5ZYKLgOZCt6z9Sl/?=
 =?us-ascii?Q?nEBDDiS7c58cW8/OvdGBfjP0wvRu2CYanM1bVeWyQQJPz068mmzoDhdPeKPF?=
 =?us-ascii?Q?WnqqF5glqQIQQ7zAivoHF1FjOUBgu3p2ZlbWvh4pTPT/njdY2wHfFYVqXX3s?=
 =?us-ascii?Q?fIaqymWZu3cJ1oN8oEVw5aPxo6PKEIBaK4O2DmYK502WruFn2zuPTOQnQwQL?=
 =?us-ascii?Q?Xaan2I9PbMIuEZyMYv6iw9IX2InQfYB8UUa6N3RWRn5dxWa6LbTMJxWpOcfP?=
 =?us-ascii?Q?/ArWQRrFzjphuAH1mh5dB05jkj1dUGm436LHqFSbWmTvJtIwqwMr+7OnIEFg?=
 =?us-ascii?Q?hV2XmGpOfOCW2Lmupk+qvSVLfYRtg3M/0qkqXCYGF1nVaWPQTtXRyPh6qvQm?=
 =?us-ascii?Q?7/EeHy4Q94o402j2vpcmuUUA4grT0hRZKXdIHzauaJ52MOyTH5heieICCYZr?=
 =?us-ascii?Q?42PJrsaXm6jB9DCGR/vuQq4rJVQmNI0bBpDVgFIS3ENqlLe928ag+uqcouGs?=
 =?us-ascii?Q?45+uAsCyMbcvcmwyhWG4DHo+LfxM8ec5SseSu+1arX08GMzePXmAuqjQaiUr?=
 =?us-ascii?Q?qapBSabkRQAp10o6jxQLbF4sybyF8/Y5F5jn4AuNUaazhgI67rX3hO5rpPhs?=
 =?us-ascii?Q?izTE6Xe6BdRmgNV2dGL8JqTiD3z24JznBD34TNTC0/W+1ieB0+XSrugwKL7v?=
 =?us-ascii?Q?AiHqir59PyXWlX79cfimqR0JXPrZY8C6M97ogW3Z/B3dC4juSt8QnSitU7pQ?=
 =?us-ascii?Q?+aoOlohIF4ZBfF/Bl+H0fNupZ1xhUcB0T/SA9FKZBaFGEJdvYac7+Uguz+Ly?=
 =?us-ascii?Q?uuXZNQ8e4ZucPNpY8y76mppCj1nggYCdm1bDJhP/+/sESERaje22j0R5FSTT?=
 =?us-ascii?Q?HFCNlzkEPaWxA3UaPqC9Py1b4nmUqnMqMUY1g8eGdQjke6HiXVBPaiuYOG6n?=
 =?us-ascii?Q?aEs9mN164wjQalv0ZragbjNDHn0LKXBB7k1g873nPEG0JrJmjksJOdqsA9lt?=
 =?us-ascii?Q?XdQpOqxJCLDL7YpVFuvZjNKpjGcAMumkTEDvlbiM38ZHKbnQ/XT2y+IXCm/Y?=
 =?us-ascii?Q?C/tTBMJBYepM0ohJqRURqXYVS7Oris6gLSVsFSng00kZhT6zvdv3Lcp2wRMz?=
 =?us-ascii?Q?8ymVUxzhddZXkzpDoGf+4GizbKAjc7FuMJYsP4IijDaF4JhODfsANUSL4/He?=
 =?us-ascii?Q?ffwOqhYx53v9Ee1lB7+Bib/q1kq6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sFAF60vvqkud+JlsYAvR654pLAI3k7HmWpLh7DkGrpXQeimOv25Ojbo/bh01?=
 =?us-ascii?Q?flBS7BOdb2qSR96jvndmXs6XO4w89RXdOwL8+auEzNMcFzRx3Mwt61ZLhERI?=
 =?us-ascii?Q?OC3EiBj96DoMWqvIarNU35pUn4I2iBoXHh87FpId86sk5Ybu9JdDo3RsuRSL?=
 =?us-ascii?Q?qfWwOwoa41GeZwUORhv3No4ASft8iVjWSCj6zNdVT7QDGtHTjc0VxLaWovKb?=
 =?us-ascii?Q?Cm2GBaBRv45ToI39QKdeSn1K28CIyEpG1czTilKR1p5njxO1evnEBUtYRwKQ?=
 =?us-ascii?Q?Qq2qA0A6j5ZnQm+41K4mggQAI9/RG3pyItnSQejZiYpngFxWJtLHDlf24HsT?=
 =?us-ascii?Q?zaFDjyqDZRJe+a4QzPOBlGBxDDamgxgwtDkVNL+d84umUQiWDkP1WdqLusux?=
 =?us-ascii?Q?JqFYL2VdKvd9+VL1VhyvWqUePLejXSyqugwOqapge949BBf7ub4I2FjZsTPI?=
 =?us-ascii?Q?okM41GcsBw6apRtHZAtEnJhwbx7D3LQvOkxGgVSmwu4pXlsozt0NSvMfzNxb?=
 =?us-ascii?Q?ZIUme9BKFrDpq2655yJQcfbculsNV0hwlq4CSpP6UVj++vt92kll6eWKUnvA?=
 =?us-ascii?Q?hJng3yJrDMbS4FoL3/bpPYEdk8/F9cPyKn4IkqLA4sp2jnwtIyRHkyvQmeuC?=
 =?us-ascii?Q?30GWVJthy0jnxdPKIvjUS2kcsaPusNnE+eK7Sa9CoOEq/UfYCWGz+D2DhkBf?=
 =?us-ascii?Q?kj20dqKLppzh6mx1yo4JYaBopCE8upZ9CEwYS0QDSKQ7caWkm+z95pC7K7fN?=
 =?us-ascii?Q?4rf2rb3OWah8HQRmsUpZm/g5rvcgfaQ2MXavRiF8UVfSQOeldn9/u6w8y7qR?=
 =?us-ascii?Q?n1fe38JRpB37D2NYEERNB0udab12kqxzcXnFBISzGcgU+HAw1OEBwpbbW5Gh?=
 =?us-ascii?Q?3BkSkgCSKw5lAgFC02brkFFk9fi+98YiBkEDxGOUGme/0Tx8QoTODUgke3CB?=
 =?us-ascii?Q?VnRYM7Tqqr48EU10vkZro/BbqAkxamVhetOpra5080c1vksCAyp3cWao5y/+?=
 =?us-ascii?Q?do3QFY0IkxfQWCYZvqH0tvnn5013+KFTIeX5qpJL1p1zoECjv9AshpIwKgKY?=
 =?us-ascii?Q?rj7qVEoRfbfqLvthqMMCk7cnxo7dUPTOBniV44SRvFdSPYrSyit98kEudHiW?=
 =?us-ascii?Q?77lWGOj3c/h7gJFTFuSrFAubDxuIaKHvSnmlAOyoGLMi0t3Mpzm5NJLzHcFV?=
 =?us-ascii?Q?erEl8KsgijpbSiZuHgbpiZ2tXzfvqGzW0C+jzIetbEEl5DNqGnWjO8q5rgX9?=
 =?us-ascii?Q?OZZpTsFLXMhRQb/rHMETviahu9MySXrWFiUo80+GIu1EbpXJpzSrJoOnLbeE?=
 =?us-ascii?Q?XKESwEkpNLeVlRiaAV8L3Yh59UiCrc/HdOEYJ6Q3hkOiElWZ7DiB7Gp9rCrG?=
 =?us-ascii?Q?2xcEwkwnUcYMNE9t2aiIJR8CJzP+09C6MpqmW1LHaGmHXSLZ7ZrxCW0SIPvm?=
 =?us-ascii?Q?zlGotgt8Ojg96c1BPxt+G4+lsFPBk7469LN4bCr9LMAxP3dQWYdcfIoDGtrt?=
 =?us-ascii?Q?D7MlQv11no4UlnRKaFE25FE8dftW7BU5F1lLjTz+Id/M/6h+1/EvDbLYTxeZ?=
 =?us-ascii?Q?vLuDCj+tYwIY3n1b74gHD5pUhh2hDHTrxj0PCnvCpHZ0LMCrhlYcqOqP/ksh?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eb6b3b-e013-403c-66a5-08dd6228fa54
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:17:09.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mq2lkItpNcwaRg3EjBV7gHWyhNGBSBbw8A2aIgUQ2VD8UDib7YEHiB38a/yoUy64TM3z9dvKoICYnIz0cEwRlUl/KSjHHdX2+T4LUuTLQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d2ccc8 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8 a=iFF_I2s11nZhg2fwnEAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: psJ7MW_rEzvrQiMMYT4nZeJfhxMv7OPz
X-Proofpoint-GUID: psJ7MW_rEzvrQiMMYT4nZeJfhxMv7OPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130096
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 12:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115971

From: Libo Chen <libo.chen.cn@windriver.com>

GPT Image is to create GUID Partition Table disk images on local disks.
Written in pure Python gpt-image allows GPT disk images to be built on a local
filesystem and exported to a destination device. This is useful for creating
a disk image on SD Cards or embedded devices.

Home page: https://pypi.org/project/gpt-image/

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../python3-gpt-image/run-ptest               |  3 ++
 .../python3-gpt-image_0.9.0.bb                | 30 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100755 meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
 create mode 100644 meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
new file mode 100755
index 0000000000..3385d68939
--- /dev/null
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
new file mode 100644
index 0000000000..01e8091f6f
--- /dev/null
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "GPT Image is used to Create GUID Partition Table disk images \
+on local disks. Written in pure Python gpt-image allows GPT disk images to \
+be built on a local filesystem and exported to a destination device."
+SUMMARY = "GPT Image (pure python)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=db5f8de88d13d0917db21293d0e82e1d"
+
+SRC_URI += "\
+           file://run-ptest \
+"
+
+DEPENDS += "python3-pip"
+
+PYPI_PACKAGE = "gpt_image"
+SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
+
+inherit pypi setuptools3 python3native ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+"
+
+do_install:append() {
+	rm -fr ${D}${libdir}/python*/site-packages/gpt-image/__pycache__
+}
-- 
2.34.1


