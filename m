Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4B5C3DA49
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 08:19:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31697.1722154760935086102
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jul 2024 01:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7939a7040d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46S805CC025626
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 08:19:20 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mqv60tam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 08:19:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2wzr7h2dGtxbaquSUTFwvzONYXLP8c7EzALCKqVjMfOASRabzicKHHBeFgMy4fBgBGaizmPCRVVuNwPefngbOgZVEMEHbQ3ttx7iT7t9W8Wm3RdhvvdleruOhLdcszTCbQqUaJqp78TE2/K0eHP9oYXC3C1MKZqohnW8t/75Bp2zQHz/00D6ZjZwQfAe66LDFhkpCpeo1e4CieV3RZInful85jZn/SZKyuX+9zJgxnWA6+HD9Ip0w4S7O5qRuBQziPEb9IwA5C7RNYXeUPYdSll4Pw+2qpUJXayBaUhnZ/Ot2JXKOFiAo6NoLuQfQWLfJJdMu023lApnYzq2ImFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH5aOXgpRQSVZWza3avAsbHzOHGwNhVc915dGohCTmQ=;
 b=oUxEZI48eQDURXtNptH0lA+bJz6QenOrjmd8ZjMMzkOHkm/0FoApJX4J/q08ubEnJn40iUQdTRi8z4EI8i0xKTUX1U+g4kGEfhI8hntHBB8FuVhGKwqamEs1iQ5iwEkkVB9CfsXre2zfFz6jnHxYOkQSCdKVR1MgyihFVJctIKLPwMgD07PMc/vPj17Ik6Hq6O6qfMuy5HcL0g8UkLtL1BZzeuqlqEkQOB/ffuLa3N5DqYCT1ZvistUIVrIVps9Lk4OMPpdxX9IRy+CxSQd2VTTsa1HJc1tiCDvnehSpvcaJTieZnTcJiKZV0pfioSLUx9VQA6NJrQOUaEx7hgACvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.19; Sun, 28 Jul 2024 08:19:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7807.026; Sun, 28 Jul 2024
 08:19:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] snort3: upgrade 3.1.84.0 -> 3.3.1.0
Date: Sun, 28 Jul 2024 16:19:07 +0800
Message-Id: <20240728081907.3985861-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 40537ea9-7fca-4d98-a717-08dcaeddf98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j8jpmFGoCeLNMX/9Dkl+o2w59Rfc4ltN6YITBF+NAMkzjPNJUK/NPMjQPMS8?=
 =?us-ascii?Q?4x4C5xSiKIJ2VEdbCpiJ6gLF271RF8GKI/Fl4pWBA1k3kGh3YYeU7j5UxPSR?=
 =?us-ascii?Q?totH+gGtQBKXC2Z/8YHrsTgIxHmOSU8+bUmNikOYrjd9GtGvNdddTWbSRokQ?=
 =?us-ascii?Q?sFTTzpWCglKD9NeimsUmrnruifJB5KdTQsIEPzw+t3sDucyB9AzvXpbna/Va?=
 =?us-ascii?Q?pBhGtxiIEHWiYSydqiSiC6M7Y9l55dkcSNeoF3GWVa1Jiyg2np1j0wfvu/ue?=
 =?us-ascii?Q?AB1YMtXfnBGnNnZ5sBNf+EFNEFjK/f/yqQVNnipnZ8eHh6J1YocOKHqK5v+D?=
 =?us-ascii?Q?fjWmQdNJHfp1rcmNYX/12Wl46ZjsaKNMn0pF03djMgqnFHO0O7FSj35ck/xe?=
 =?us-ascii?Q?A7qYHhbeHmXovJPG6MKw05FNItiSVKAUKbhJ99xF+oCKwqsJw/uWs+iYielM?=
 =?us-ascii?Q?9jHpgMocdwZqRbkj65+DLYNyIVbOggoz2PzvJZsDMlb9+5QHrWY/vb74oFZm?=
 =?us-ascii?Q?S3LcckGPrLzFaDf34VauQJKeHRKvNuywz1hMOVUUTyB4xp+ggSzaWRFUTBxo?=
 =?us-ascii?Q?cG6sJ+t0KUni4oCVQBweGKwLKapEeKpvLbZthSwC1uZm38+i7wXn/Vs0pTbh?=
 =?us-ascii?Q?BxEA6rAD1yZ1Xx0wjh6Mxi4Dx4uIKs0QcZvPQidu8Cw2MV6UpOU0i2dvZS09?=
 =?us-ascii?Q?6CZ17fVWuTu7SY6HJrt+KzRQyFhMVjkJG8QA9/eH/q6uws0Ok8ezwQrZW2/L?=
 =?us-ascii?Q?aZNhxqHh9ZkFiqx0xGO6xyF8xU3PSbC+cdVeCDF59gSyg4LSdLwl3v56SZpX?=
 =?us-ascii?Q?Ov5eR+bWyyL+6CVatNmEEpjSwYDEEyeM2mBu2fbDUBxhChqXi1NcSaoIhq90?=
 =?us-ascii?Q?plfYl4v+Ne0oTzLPY4RJOtk62Nbs7X3JW9WVclKfiCm5lMLUv6wZkwZrVQJC?=
 =?us-ascii?Q?qhApRmR/iWEMXHbRMt1qmatDOcHXQUr1alElG2y0cOQMaX7uLtXor9vCFRzU?=
 =?us-ascii?Q?5mwhzGGFMHT2tb2jRusnzVuT+d7jLKgKQbx50mdRBhO4siN8mFg/r45nTGvv?=
 =?us-ascii?Q?J0OctuxNDTZQGrm9wl6f9phUqNwbPNkMt6c00lIkiScx+rp+8KfCkvjhQFh8?=
 =?us-ascii?Q?iGeeP5sI7WoVtw5dswHlmbn77E6OoWOzxfT5bC0Xvs+duUpgNN0VqV7rmurY?=
 =?us-ascii?Q?o83uG6l8BUKu7y9g9XAJjaeBIhYHrHOTH5bfWhrgXDGKWFmg/zjIblKwQCo5?=
 =?us-ascii?Q?oGqL9CcBC3eFA9JQT+taY3tEeyUbjRhWeIgrOdyGz8PuMLzUIXry78Gdvvbz?=
 =?us-ascii?Q?0nkQSacY8b60OW5XdsB2S2Hb5kiqd4mn/S4c/f7QsV/3LgeZsPVm6CPdznf6?=
 =?us-ascii?Q?cyGTbKM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4t2vw+Vv0/hk5lsPptb6uFVmWWTYrJ1BMJ4Mo2RZwFsEZeEDTaPcfHvPzUwD?=
 =?us-ascii?Q?eXk+6NLBlA6TGcpFoVOXCmfO4m/cJATn5e2y8X4c+DHwGhMgHu9FVZ/JvCG4?=
 =?us-ascii?Q?B4gW4+8YEnzV6EXYJuqJn1JjFpLV4Pvt7M8WDf4u0MC0MZkWdn9C5vqy2kYv?=
 =?us-ascii?Q?76OoN42rbcUUdNY+IMpqhG7kuNcDcMcnXAoPAk7MKSIDy+BdP++1VIzsyt+N?=
 =?us-ascii?Q?fxK+SlscH6Oc6HDJ1sM5NLPSWzmlt1oTVVZiU6dQY0dRbEkuOwygQpcli7yp?=
 =?us-ascii?Q?tlxV2h9uvs9/9Rtuysnvtru1a/w0pFeN3QGfIh1JMlRvxj8Df0nJ2W3i7sxo?=
 =?us-ascii?Q?N4EezOYAKYtrxW9RJYKs+/p+0CIt47/wa+waFhZ0pMlxAWXVybZcFR+cwXnP?=
 =?us-ascii?Q?dI2gCHbD9mDNhWSaoLvn6MlUzyWJFkAKtE0w0Prql8dKqbmtVSZHN5g2/oRC?=
 =?us-ascii?Q?vSjLhnduT9+sYfROCgQ6cxq04V5MaGipiz+y1NLKZgpJgxgS3Kl64367Jklq?=
 =?us-ascii?Q?tnMVvCDczsvNIeO51WJ2NVGk04mtcD9Dnpe/p+ZrOfSthOLDJfziI9wjnjys?=
 =?us-ascii?Q?xo/mF8X7w2osV/7QW75M2U/7UPJraIghzhY0pBmevd3fhp0nJDl0hc/2J1Xz?=
 =?us-ascii?Q?Nba34Xc1DHd/OMJzq/gsmLkNqO2TUy5v2RWMSAisr2qWBGI5NSKt8iIqaU6w?=
 =?us-ascii?Q?0Ms8aS+omTC8pfGLj3xIKXzIGfzwJkmD6VFkmRcxR33EAIRgrQ68hb5AQzDl?=
 =?us-ascii?Q?kFKnpku7SicPa3d3dHCGbKFWI7FEaLSSuLu9UyOyauC71pyextAhfivOfzbe?=
 =?us-ascii?Q?8oCCShSgtsFbGFyaDgCqF25bk6inCFv6iOQspYaFHe0pJV4trkVWIhRhzoSH?=
 =?us-ascii?Q?hDX7cikIhf0a+KgbLWJFPgkKUqZUhDKJWw7dy2Xawk2VTsZi5soSDKF+cmlT?=
 =?us-ascii?Q?+ZGuTK3GoWJtnvD1E/RXsCWjURF4vPE/WfLXkdMpkZ7M/By7aW8Gd18RHe4d?=
 =?us-ascii?Q?lBEDc6KmT8Wz0bcrWCpJ+qtdoSIS4gxYdyM+b+/kR7ODg1tqu+wocS+1LVKK?=
 =?us-ascii?Q?6b/OHol7HiSeN/jmuy8YM/kjFT/bv3rQAQmFKJTZu3TLz4kbx/OxCrZFqugh?=
 =?us-ascii?Q?pFTKVZ8742RfjEIvD2Thmxl/OAewTuHGWLv92zmMq1GzUgbeu3mM5Rpx2J8A?=
 =?us-ascii?Q?wmd9wXx8zCi6ZZX+v9eIXy8GUHwhp+h0zL0jVwFxockZqkllpV3JsmbIy1mY?=
 =?us-ascii?Q?nCl00vt7YQd7OhG/jqg4UYP9jKKgnGv0MvReMUvi3ohZbfSC5sy6sFUCowgg?=
 =?us-ascii?Q?bqGEQKjoyakp3q5Z6YjybpH/KAAf9t84OII5kh1lfTTNWTD3U5Vjy1kWM3An?=
 =?us-ascii?Q?Q2Gfg7zuLuKqMqmcYuoO6OmfzmnSRXdEzUjJquxoqKlFg4Uft7uL3A2T50Qw?=
 =?us-ascii?Q?7Z5zDikYK2hkbslVeKog5UZagYv/TXU89KEc0S0gtrCCjZrCW2TrKrXcrdsz?=
 =?us-ascii?Q?0vBWrcLZBbvmZWbjQtmFUXiGVf7E6aOoUaQW3ec1gBpLk5MIcJjZ6bFQpivw?=
 =?us-ascii?Q?jSMomC9o8JrGGj6H7bK1tiw+7dFr8PLzeIVf9D5/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40537ea9-7fca-4d98-a717-08dcaeddf98c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 08:19:17.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFq/KCw36VIHe1ZnGSWGuYaSa00vZ0qlNVITla2Ii6gPphvPMGDO8ZJiQQCm4SZqWDUvE7wHsogeTwaDaGQMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
X-Proofpoint-GUID: jPNqPx2V_zl4LzWTxsHURJeHBN6e04b9
X-Proofpoint-ORIG-GUID: jPNqPx2V_zl4LzWTxsHURJeHBN6e04b9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_05,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407280061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 08:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111449

ChangeLog:
https://github.com/snort3/snort3/releases/tag/3.2.1.0
https://github.com/snort3/snort3/releases/tag/3.2.2.0
https://github.com/snort3/snort3/releases/tag/3.3.0.0
https://github.com/snort3/snort3/releases/tag/3.3.1.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch     | 1 +
 .../snort/{snort3_3.1.84.0.bb => snort3_3.3.1.0.bb}            | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_3.1.84.0.bb => snort3_3.3.1.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch
index ec7b90cfb..626f41273 100644
--- a/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch
@@ -8,6 +8,7 @@ could be absolute build paths, since these files end up in dbg packages
 this can be flagged as a build/packaging warning.
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  cmake/configure_options.cmake | 2 +-
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb
index ee84aa17e..a3de086b4 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.3.1.0.bb
@@ -10,7 +10,8 @@ DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind l
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
-SRCREV = "e7312efd840d66a52a2019abe1db7cc89ca0f39a"
+
+SRCREV = "9533e17796220b599145a0e2eba555af3f31e773"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


