Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BE3C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 09:30:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8980.1711099859171285195
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 02:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IFkJBOtr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38113fe0ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M6nKhT032076
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:30:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3Fg3EazuoLpammlSUyjSiZNA+UVKR0JMuAyKU/UypUY=; b=
	IFkJBOtrPHurT/rbHpNJbHSAb2UuNZUW3dYgLuhaKknVHZcMT7aBwpQT1i/pMfw4
	4lLHDyh0VmhLe8BbTok/jpo8zit05typ9VBkBnBZd6o7HPTOsN/HKvS3PEF7r5qd
	2FxKEL6batWERBOKJsRZDonkMtw4WY0M5zArDkTOHEEmyZazdDrx1MbDffwqHTkB
	3l/shlLK99vj/+H1LiIYNwz4UrCTKqCT01sk52ZbcNw0UFUr2SyOnHJAm67LOVH2
	I7ZXaA1F5M9AOwSmQ++RegBXskVAmmOtsvOa9n9m9WWnrziiFGAWhZNOf4GQCj8M
	6r5nfIJIPA+dFXoR0pYjkQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x0yuj0c2n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edtvGeyeEmDVUpVIATEhnuqR+cNYghOXgif+ipU0t35qL3gvMoY8aHgjr5nPIPj2RXsMRe/4yVCGJcT5aHidacqLD6LTppITUfS4jQNgpEkladIMYe9drkm5SeGE+CdONkzFFjimp7aeCCah+t6onzAqsU34KQA8KCWSlqi60JuEz3+D3e7YWnJXppYOMpWRXA69i232QEth9Fc8R1ARgQ9Gu9Pfcp4t6g5uxapKK4kyPjnrGPfllxFtyb+7rp2Hs46cfrqMfXWRTlmMh0tMN2kqPuMdTd00uG8nlkH/b1hDzHrFp9sLCBjJjQqzMIlXXbJ4mnOIheaAuRsc+64ufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fg3EazuoLpammlSUyjSiZNA+UVKR0JMuAyKU/UypUY=;
 b=mrsEmBfE10M5ZSqh6rlUtUTZ9+wT7l2DqFW+Tqd/TA4NpnUdTSDoaOgR/P2Xs5ZVpFbpIhSiSHptaKZf+E/gkOaJzEL/u2Sg3t7APqv/8/+Ia2auIckI3XWuXtzew9j+pXVcqsvAVVJ/VlpQ7B3rBPQrHiY7eqimKNogMNV3ri+ThxNJyoxshG4scdN+XU/6ij0I3Qen/opItQ2vBqIkA7n3gMbe8nPZhf3uf1vuji/+SNsTEDAid46PttaR6lURkmIhQQO7IpkaEljrW52Gg87jyCvFISfMCS+wM5N+iT9BkaeaGfOC6HAEaDF7pxUzwtNlSmQm+VwVbkKlTuYIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Fri, 22 Mar
 2024 09:30:57 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:30:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] netplan: add missing config directory
Date: Fri, 22 Mar 2024 17:30:45 +0800
Message-Id: <20240322093045.3382031-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240322093045.3382031-1-yi.zhao@windriver.com>
References: <20240322093045.3382031-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0197.apcprd04.prod.outlook.com
 (2603:1096:4:14::35) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f8cde6-3567-48f1-5a78-08dc4a52c759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OvJEBHbKko2xVBMw+fB/X7i+sJqJVClLq3//m+96uVLgObp/92FvENtXV6+hUyu02AtlEKatUFuMhQDim81+Am/bze0at48oWjOudknjGyCzZIYNqY0/6uNBzxSTIIKzHOVjMnONsLRosK6ahQqexlDmEXOZZYR+tdE5kJvlety397TBQBBdwdJQC0MFOYtmeI/RBlph660ukzzNdIvz0zEVKsP0zxKn1Wt2tB4wxfeTsmGcGxGqJyJEhobsghWXZUF4WFyjSOaU/TqPWgADd24jZK2O1t1q0T5R/HRFDhixCKbwWXjjsQcn/ezOcbdD3euGk2JL1iAYo+RJqRxeIHcoi6ZjQ4xqeoS2V0QiwEZ7omj08qprWDbUL+C33At3PDlC1/FIshM2anZOCl811M8TFu3Kl2l3rdtB1S/CA5khN5nlNBP9J/MnR2pDMOZVqyG9h/FiOCjWpABwAwSXwfNFcBildLdH3o5ggYfSBpv03QlwcC4deg43TtD8dZp0q9o9/QFb4m7EhYhiHQ561dL1Eg0bPY89kKhNR05W0zT8xebcul7/7JCBhE3GDWmcl0PrHNQDKgW4nbCe9StWyJ9ktffRykBVWzlUxIe+g9e1dW4Y9aO0spV4FJgyZLcV7TLhoa/2sdi3DZgN4NZDITGTKPjV0pkZc6s0CD9Q7Y/21PLnGtS6gmhEB7wr1yRO2Y03e2SxYHM9T/QHI+oKelLMuNELrkj6x20ZNST8wk8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?raa8PxWIbb0jmZ04tDUD4NcOWofLQI2jSLs/vA8D6l0YwUv5TI5QHJk5N2xR?=
 =?us-ascii?Q?jgq9nNJ69U5VqXEIjPvl929HBDTV3YaS8JJ6mWpnqh+u01alm7OOKN5RVPHN?=
 =?us-ascii?Q?fbuIdixbRZumVHuvBMfmOGSp7/TfFVDFFQm6Hr6P5pZcQE0L7kN310L3Z+q2?=
 =?us-ascii?Q?ormV8++aIlW5RlC5deKBkxKCjmu+aYN8vD7xTsEXpaByqZIIEp7gW1WN8eB4?=
 =?us-ascii?Q?Qu2LZB5svgGuFpU6mSWVDbra/Y/zxGIZCur4dxGfSrPir2pNqSMThLz0PnU0?=
 =?us-ascii?Q?vWh2UoP9Z0Cwtc7ovDjqso/ibvN/uv7i/YriOyagUwWlzR1IGhl1H7H5vr0c?=
 =?us-ascii?Q?bncJd6J7450Nu/tEKvYlkQlYOSlOeUTycWiUm68df/gSYHKdh8qE5k0uj9oz?=
 =?us-ascii?Q?hb11/ejov1l2FqG1fMTrqdrS2fNt5W5cDGKvplltAyf6rUqIgU97XdlGMPGD?=
 =?us-ascii?Q?eW8GYJm5+ktIhRF4xSC3W+T39B6uuZK4NrFLmVaW2J0eGCD39MU4Yfo2PS50?=
 =?us-ascii?Q?4TH+zlHfPquWGmqlbFSnEKYA108QSrYVIzua7r/m5+CbS1RntJOE7o9kHCbj?=
 =?us-ascii?Q?JhMdbIc2UbJd7uSTuDKQEqJdBBrg6a3xTVpYR+axVXHlS6DeWiUuJySkWbWW?=
 =?us-ascii?Q?+r5LaaUR/kdnNkmzDbK8R90u8ZqICUyf3ySBh5HkToPnwR3f69fFieNU7KeZ?=
 =?us-ascii?Q?HIXFdFvCJdR00fQ5McMpnLDYc8QiU1HSkqBNJwFbts17kpipS0Nm+6zpAXUu?=
 =?us-ascii?Q?/SCIOwBK6i/HY4CQ5UY7ws83lQCwi1rYRNCQu+YyrzDTsZQex9vtfPAuCnLE?=
 =?us-ascii?Q?2xHZVAngXNK8HbzrM2ptWdG/SR+VJ2Pdd0KkaiJ60Q9UPdreDxRGRexCZ93e?=
 =?us-ascii?Q?gnehPijFADv06Vs/LZLfYTjj5HMdjInJnMBMwAqN5hUGmYZPWUTMGwRIVT0y?=
 =?us-ascii?Q?wwnLoPv8+z15QWsnz2s2qnBiSvUpEYUIY2IG0jOw4XJgMoUBj+nr94d67MZx?=
 =?us-ascii?Q?XhjHwD5ohbagajlYSHQbnXHdCMqi+IyWJeRIK3iO3F+5NFmChZwlRjSAKy7J?=
 =?us-ascii?Q?mnor3dZvcYC+lyjvf/tkpt9DqjGMONn86MyybLwVylL6hI2U4lMu1yGQ/n1p?=
 =?us-ascii?Q?mOjy039QXCuBDbjsxxey4YCjmj/StXb2hpWN03rVHl0++urQGdp7lYHGp68H?=
 =?us-ascii?Q?PYY1ea917Cwgdd6JhWWdAf5jaOAALCGv9nC3QOhY1h/BRXzTiX/x2ib0ek9R?=
 =?us-ascii?Q?EMldNl4ai4Aqq1fo0puMBO3kbblWZrWkmm/JXNnj2T2NPouQr3jfjwyjmV8x?=
 =?us-ascii?Q?0iFMH3ER/cTBEBlkAFW8Ikwv0oWJqMWyl3VCZ4uXxqNeynpxvHxZjQcXt6IX?=
 =?us-ascii?Q?ROM3GX9T090ksF9oIMCPLHGdqbHt3dVfRYQnvxIJaaW7nPLDPMw9zkg+8E9+?=
 =?us-ascii?Q?/YJ1ghVk8ZftpHel364Ri1nipxbXCFvj7HCg9qJmql62Y9Hu5DEi/TzDEbM7?=
 =?us-ascii?Q?r7FC5LS9WPUBShKZZ8waNayRBPrSL93r+PZt2B/aE1iB5ThNjsvyy4ZTFki1?=
 =?us-ascii?Q?hrf3hd6IDcMoAbjTLBH+H0sFbIu7luTSbtuJFmDf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f8cde6-3567-48f1-5a78-08dc4a52c759
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 09:30:57.5440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23byJQGiv6dP9nyUPXzyGDeYW2HqK60n20BWTvzVIatn2FAktSkBdfCUM/Y/s9Ay8GYN19k6WWSEErAYYNWgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-Proofpoint-ORIG-GUID: sue7kYsGVKhAP7lm_lgI_94WpAEZukKG
X-Proofpoint-GUID: sue7kYsGVKhAP7lm_lgI_94WpAEZukKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 09:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109516

Create /etc/netplan to store configuration files.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
index 71efd2cc3..229414718 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
@@ -37,11 +37,16 @@ RDEPENDS:${PN} = "python3-core python3-netifaces python3-pyyaml \
                   util-linux-libuuid libnetplan \
                  "
 
+do_install:append() {
+    install -d -m 755 ${D}${sysconfdir}/netplan
+}
+
 PACKAGES += "${PN}-dbus libnetplan"
 
 FILES:libnetplan = "${libdir}/libnetplan.so.*"
 FILES:${PN} = "${sbindir} ${libexecdir}/netplan/generate \
                ${datadir}/netplan ${datadir}/bash-completion \
                ${systemd_unitdir} ${PYTHON_SITEPACKAGES_DIR} \
+               ${sysconfdir}/netplan \
               "
 FILES:${PN}-dbus = "${libexecdir}/netplan/netplan-dbus ${datadir}/dbus-1"
-- 
2.25.1


