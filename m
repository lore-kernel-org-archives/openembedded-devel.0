Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.877.1626460770264765642
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 11:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B6FTnQce;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GIdTol030606
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 18:39:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218qr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 18:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CL7aQLRL6EU3YNRhmFUUIIk/WtYhUcxjpqxm8Rc0US2fQGbQ3FiDPYR3Zlbvcjn0OF7q5X2IDEQ22b5lr2u/1v48Be0KmO0LAyTVV4JK6nctYML6/t6Bk8T9kRcU5Njv/QHuK27cWgB3Tcsp0kVdGSZsG0jqPNytNSF3nCpY8XTp6lRxicteETdTi+gD7jvt7iT4HasTDuLYYjD95saJ1JHC50dxIQZchrMTQQU6TPSrEHP1YLwPU87klh4zMM6p3yNXNU4luuPpRNZpdOFybQzF/G6OqWBt7/kJELN9HlPrGskaLTBcnFre0d1RJGgZPMHluXNIMBnVD5KmzIL/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o20vIsVLE03HuCoxDBt3N5bxHui2SojaUj8Fo97H3fI=;
 b=Q6BC+HXu+ERI3I55E2ntLH9tsgIcyv1wiHuAmL8zkOTwsjmR1AP8Iv9+xg78eZhMejRKlrubOI1yNrPOqfMPvPqq5JNeX0FZS+p69nUq5z7GAwWZX/mE98gPlF9Y4U3jPcq4OmskB8JgOqbX4AHZ15FaKctKXbLzKdfB9COkjbcKzFwBJ8CxU+DU8j9WWWasXWQPMPHcjvDSa9iK8SM7ERanuq9NGwGBjhRbgsGGmKnMfqjyCDgJCyZfp+3QfZg8hq/yVyNroOnLwHN6g/UxnmXXSmJGlTYxRDzHALZO3SFVCi47CO6acgS5KIN7kW1OIk/JA44bf8XAo4rJBGqniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o20vIsVLE03HuCoxDBt3N5bxHui2SojaUj8Fo97H3fI=;
 b=B6FTnQcedTTdjwzRlLTf5MQDRh9u+Xyzks5MKkO8Ef3OBm4MnDl+WkAqd17mvSo2WUho9h460wVNBdZu30l8Qjxl/YZhpAAbaUXMyLd4gVq3QKIEQ5YE0BLbdr5R6w8RbGG65XhVZqbDXMGdI3z+tA4oZ4htt09Jh+C1/5EW4c4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 18:39:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 18:39:18 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-geomet: Add missing RDEPENDS; add to packagegroup-meta-python
Date: Fri, 16 Jul 2021 14:39:08 -0400
Message-Id: <20210716183908.408896-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BLAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:32b::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by BLAPR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:32b::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend Transport; Fri, 16 Jul 2021 18:39:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7efb2086-fcf4-4d4a-f1bf-08d948890544
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398716B2C935F83872CE50F9F119@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RuzAYCCzY2qXLG2L5gAgjR0zaFq0hta+weOqGiWFSMGlhGVOhzjY9e5tE17C/bUwzlsY7G3Vk3l8VK8j4m1bC8vucwRBsAP9nom+eZQ1nBf/P2DMuzqWlAeYZq2tUpgOgiGbGDa/BaA9UNRkKGdylCbtvQO7JL6nfwt9Eio/z4iSrz4QT87CKSHh0L3pMKLZNpn7gHiYhPDdJhARSrmtPgFOFjV14uk5ddAmCzdNyj45SvVJdbi4jvbxi1KN2rN0fW8u9A0YSaAm05Efut/Z6Ed0sK/5KaVQrPy30c2L8qrQzRoN+i4DHQqny9v1Q1XeSvTKewJDvQiJFhLDNh79ZFosrPi1jXRDYKxWwgc19vMT+NNwKqGVQIv2tYi5Qgdu8jruZeNw6nKW/MTjZG8BkWLFHW50CBmy83LOwtzOy/UPA+n2QS9w5c6EUl5ytqNuo4jgyoL8Os30wILAjh5ggTOJnn1468plfXknwrcxX3bx2BhKiaVaPWh/9Pkt87QJwTwfXnZbnYHPyrcRVtTuA0jyBVrEz7A5bdj75uzHNHrtX9myaOt4zZmcrLdZ9NlpcIHi9OzhLPaOYo6LiwNzN18pyeQhehVdbGiDZ2a8c27wXLcYFq3JNtOGPGjRWvVTRLV9UZ00462OnsdmBp4f0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(8676002)(66946007)(6512007)(186003)(1076003)(52116002)(6666004)(2906002)(66476007)(5660300002)(66556008)(6486002)(36756003)(8936002)(6916009)(478600001)(6506007)(316002)(2616005)(86362001)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?756qpEqRBAYXMEPvo3PCmy0+Fqq/7vBrIDz3K0dERHhzuvQjiVyYDSDx2Etn?=
 =?us-ascii?Q?OL+fGJX5QvCXqgcioW2mEVkJP5m+wds3SEhWv2vdl0MNrNnTiUJZkKUsUylN?=
 =?us-ascii?Q?PiBmDM08z9m3IkoXlh54BMyK16JNmvKQd/EykqWfUxBCZqqqU5QS1+d5L9r1?=
 =?us-ascii?Q?XKppB79EWxyl56KHtLSVJ4+KQ60sHIDyQTh0QXoA0ZN+0R6UeSS85A2K1uMX?=
 =?us-ascii?Q?6OkYB/p+165SXIQqkKL1FAQlqHaHPUFPPWcCQVLGkr54ucW5GMvDIMaScS9f?=
 =?us-ascii?Q?BlLxH2YQjcOCR/o5ZZIkaq4BW4TUFigAT3Yg8Gm81a7DOze4p1WnlexPSCq0?=
 =?us-ascii?Q?XqbsXbgvp+1/cIIprWTShmdoDvDXLAOD/L2KGn6604e2QZ4x+FHcGX9IrJ2d?=
 =?us-ascii?Q?cy19NJJaYhSTJjiWF+N0vs+oyciq8GyqLg6ay3lTqEmlPbzUIwoxAJ1zOJ85?=
 =?us-ascii?Q?hvx8U68r+lbxz9QOrPrz+rztMN3oGTXK566cbPSnnJFFS9HVXKSCZtj8GfHn?=
 =?us-ascii?Q?VzUkISux/DOQVIZ5QOjg8E1euAtmcVWNineKdgpOCWHRpjndpkr8hbKY5Yq+?=
 =?us-ascii?Q?9RUn7LN3ugGFGswSigF2/lRSLsuy/GoKnwqDwVu5bxbaUVzP3sx/HDGaizP2?=
 =?us-ascii?Q?lxUWma3WqFt1CH7LTUktpP53zFF3BGhGQ7+6+6BDq4RZzHoOPzznQTnd19C8?=
 =?us-ascii?Q?XjRNp5XpD18dxbk3sjfCg1QwOhG8488t1u1bQBaRvu2rTiMRitt1WcDntG2L?=
 =?us-ascii?Q?hFwwze358EqpOwiIajtkE2aSRXX6HWH9UqrOnVMJ5tWae5O0DsR5jdq0Qvkg?=
 =?us-ascii?Q?eII2V30jk4HNmg2ZMIWDW9GnQn30trEIR+o3oNW0PTay4KfnOraaMrXLDQe5?=
 =?us-ascii?Q?nBn9mnm4r4t1+dm4pjOHi66WM+sgBK+sEOpFKBJONxpRNHWx4rwje7DfR4qC?=
 =?us-ascii?Q?kki3Bn5hWmVOBO1pcs8MW+UkFkTa/XJph+CVBvkYjJEvKJrsAmz+MYTAUauT?=
 =?us-ascii?Q?U2HWra+7nkn9zTwM+Zpmw+p3CMaRY6xqcMmTu63ZVzv1p93Utc1i0yPTbJPw?=
 =?us-ascii?Q?wPGHW926b2ZbJeGtXoRYk2jufnxwXn877WkHF2h3sjjQsVzprTT5kt2LjJ5b?=
 =?us-ascii?Q?lMT+VgABMCcSdx3lNEEYUNMmtTZKbqot6AnfE+j2rzu3LShdnRA4bR6FT1ur?=
 =?us-ascii?Q?xl4vOser2iLj5xBwLiSMcADKNCv63EtER4mG1jmEf3HTTBtsq9Wu0mcFCbaI?=
 =?us-ascii?Q?zGAOKmUE/vw+hqd1234sCchPka2NQZSRkI/BojHihZ+qoHMP4N1u2n5AM5lU?=
 =?us-ascii?Q?Gupfkt1Dy6lRH7iMzAUAOcO3/4Gj2xCyVkEmYY5vmuYUtu+j2Ow0eFb9B1Td?=
 =?us-ascii?Q?vgYff3U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb2086-fcf4-4d4a-f1bf-08d948890544
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 18:39:18.8088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwYUHvSB31hbbAujy97CLDtpv7K0gNfJXhmUu4liWiCzvJcC4wMkjobIm94YFdtr90KE/oNS5Yc5rt06d4nXBU8HtTuT4IBfdFNWLzkb7DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
X-Proofpoint-GUID: njz7cPPp6O5Gt5hR7WxTZCPN6JMGeEPy
X-Proofpoint-ORIG-GUID: njz7cPPp6O5Gt5hR7WxTZCPN6JMGeEPy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_06:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160114
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
 meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 72ca86b04..063b6e4f2 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -145,6 +145,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-future \
     python3-gast \
     python3-geojson \
+    python3-geomet \
     python3-gevent \
     python3-gmpy2 \
     python3-gmqtt \
diff --git a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
index bf2db495c..de05534b1 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
@@ -17,5 +17,9 @@ inherit setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-click \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-six \
 "
-- 
2.31.1

