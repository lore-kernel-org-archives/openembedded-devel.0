Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A719D0E6D7
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 09:39:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42530.1729503566199833823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 02:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00243e086a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9Aqtu017345
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 09:39:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c2x5hv24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 09:39:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/s0eejMQRJjuO67W6fL4z6b6ZO4Iu720PmQd6wlfYt4c4td3AdWPzFBcbqNFw8U1hrMlwXAfmJuT/hPHCdXf168sAyyigjh5a+gbInjFQVOFVdGqrr37YS06u3eceRDwtxRQcJBmDGS9oKeQFOwZn3YGxaYtf1J579yA06lc9mKUngyqzNNfJ1IciCHke7qgzWgre4uXOVjtxAD2Op69bSWLQeRhKX5ljQPVxRP1dk1+mGPRzWyxgzGSbXDvCD08qLVP4EwY6yEx7BcCVVU3kXas9l9ArxKufYFjAhnjFmeKVSKfgIXfFE+AlWenc3o/FUrDbhFjSgkZM0qyc5rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKeYGihW/d9P5JGOcWOMpACvXu5ZY35wXmjTuQMP8hg=;
 b=ybkxjbLo8ZKI8+TXlb2IJoyHXqblro7O1wtQUVXcBuHPdpATEqdzDHxjuJxELH+P7DExzykyUx0tm48PnoCi5qjXnpSPscbQIc+XFVwArD4N15a5rKVZP+UFBv6UbErqEP/gweMx+5nMv2Hl5UvS3LTnJiMiPzW2NCvad3wfiqW5yRYZ0Zst0lAb98W5LNMBSl4T1HycIGy8434iqJlA8eVyB6QGFU7Evop+iK+rX+GQBHUlbHUMFeLfUFgvtwNkCdQjYMMrPhk/PoEQk9AnMS/sBRcmVHdkbzH5RO7d0yxDyqb686TkdReoa39Xbccfi9BMZULXmYxgixYO92Q4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 09:39:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:39:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.6.1 -> 3.6.2
Date: Mon, 21 Oct 2024 17:39:00 +0800
Message-Id: <20241021093900.3891154-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4e8a4f-f7b5-4bce-2910-08dcf1b43d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?REM7kT9Y0hDXn2hRaOAK0IXdRX5YQfrizlVsHqShocYgJZ+LmEIBu52dkqsF?=
 =?us-ascii?Q?szpeVEkrFyfc3m3Dza5kA/doxIB7BCBqd1ZKPb5qcJOyX6nKlsxkhKam3ERR?=
 =?us-ascii?Q?m2h3yZOyFVSekQelCIzoDj1F+CTu9gVcfUyG+WeFui82pVGku6j8tOoDKTU9?=
 =?us-ascii?Q?44dNeOgcvgA43/vZrRPbq6w6VDVHr79tcLLazvL2onBqIsmosn/9v8jWekCO?=
 =?us-ascii?Q?lwKIP/1PJIWN2OjMIF3tlXIIhmWcIRc7NfbdVZNQI0osHHfi/L9JADM1KUT4?=
 =?us-ascii?Q?mRzJH1tcUayug0bHnOkCmp1RfOtjpWTmQ+xq0ruwjZgFwUlRZF1O+5szPKVb?=
 =?us-ascii?Q?hrV7wluUaoouZ1hQn7WMjU54Gil7lWAAo9ypHlHzAadXmYPcqMPEFxNZ4sDX?=
 =?us-ascii?Q?urEN1Xdy+DVSkiGhHtJywrNRRcXXyCqQYP6a2lEsnGRe6znS/B/9uwb8G+3A?=
 =?us-ascii?Q?bZ78i4propUjRnOtVFyyCxkWm8CuXF0RQZLwma7kp3TR9i8vScQ/a1fDkez7?=
 =?us-ascii?Q?G0VkdOqxGtDeWvklfTGf9jGg/4HJYT2evNlwIPDTJPq25XvE+K/w6zzCqTZw?=
 =?us-ascii?Q?gQwHmFIdh7eCPfId7ZmDwprGOvm/02zMcdUN17XXXgM4vYGbAit5xB5tzgqz?=
 =?us-ascii?Q?UaVrBXJR1IHr8PDcfBXLaP+w1lMNQ6zeeyFsxSPaCVaylEx2KjZVdbKRul58?=
 =?us-ascii?Q?mUqWUUPzfmWujHUh7hgv/z2I+DbbXdzYD04Fj4/2eXtqHF4B0Va9vDP6s9bb?=
 =?us-ascii?Q?3wXbQgp5vJ22/jART5sBGIODp49Im7O9EKo6s7TP8RiXhCkn97WSw1CEOltq?=
 =?us-ascii?Q?9lQ+N7COqF+5eOxt1GFUWBprRVy3Kl2VAb7wtLaaT+t9olZ2ikkpvKf9yiC8?=
 =?us-ascii?Q?NQuISLo548owqROKo5Kn/t85KnlrWvQyKSK/SsK6SWZ1rrYuGC/bApNfEcIT?=
 =?us-ascii?Q?PpZOI94o9BPb/0wEL52idTN1Viq+UjfOWI5Cn9SkZjJs5qwMjg6fABtmtjF7?=
 =?us-ascii?Q?SF5RHlSaDm3Iv3tmcUkxwD5IgI2WyAgH4ZF8x6GtAHBiIcSaNbocMekMpD1H?=
 =?us-ascii?Q?FUURDqYSAcwFVh88AWE8nAHzeADSsnYLZ2RpjvH1r38cFh+SCdKpjWbyiU1W?=
 =?us-ascii?Q?HGnXBwZtAZrr/gmHrasCmKrUfsIdsS7wOtYJLDmOUTMw/5lNarKF5izEp9BY?=
 =?us-ascii?Q?xdbXCk2gjw8SSsOxYPeT99rRrlJZsaCC0WCYWCOOou4ivbg7i9ALh7uZMZoJ?=
 =?us-ascii?Q?NU8mtp0yQ6/frjv1pfPgZwzASlyxHEIDqF32p88o7GYGqfKjcs80otQ6TwDy?=
 =?us-ascii?Q?sJ6xKLiKIhglZDE+GyTSamY2Q/BOqgXIfabL+8kTqW4jY8IcznP4cXFnCh8l?=
 =?us-ascii?Q?fg/jycUpzaxVBALB4XIRzaPauMs9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lf2BgXwJONsJcbWE7fEXADFtovoykaUnJtjKrVu0s/wZJWFHwQb/NbWHKHgV?=
 =?us-ascii?Q?uHbGqEAPQ1x9KGCX7NyQ2CHenBf9o86T1TLSSt6ANcbI7nFFWUgxrGdX8EpN?=
 =?us-ascii?Q?s5cQlZsWb0DLyBUCV4WpIHYLXX4DS8bDV8LESswO5hIeSzCMjLuR9D7eFSKM?=
 =?us-ascii?Q?ulDl0QdQ258zBq1P1cMpNsawtgiJjZjDz7Yx8RW0ZaXwyNBWHr0nt9gYguli?=
 =?us-ascii?Q?bCLxFQb5zl/OCqSBb4jYfOcf9DNqYalAzcbM6x/wOFMpLLjeNxIS8BR9kQhE?=
 =?us-ascii?Q?Zlbmlv1DQX1Il1pA0o/itLjYKnwWX/jODFtuWHWW+u1MOLUK6qaO9gVxcimt?=
 =?us-ascii?Q?JcmEDKjkexJWucq7Cec8IEWtqsQSI4LUwf8cwzXCYEjCoCB7WUa6SVPvXPhP?=
 =?us-ascii?Q?igdajEB01iIXOb/MLNlwOFE2ZHx3m3ncHnaAlUtinaQN9+W0VYWt5EVhIPA5?=
 =?us-ascii?Q?gttT30cczmfrKFXOHvOA+15LDWw4hulcEzqPGCgGn0412tivhrhAPLX09KQR?=
 =?us-ascii?Q?M6esZpMKLibtEJ1vZQpNLIXEeP+HSUZMVDyr6nAU+MFEMwvn9iftzc4YiCLR?=
 =?us-ascii?Q?ySgic7K4tQ2Unhnw3hHo/0V1W7hnEW4auVa9sPVvt94wzVP9V7+cWXpAp1/I?=
 =?us-ascii?Q?bfAI61Pr8mUV+gDmALYANoOxtRhWVQdhO+Wyos+TFobbTFp4g0PGOh1lsjg/?=
 =?us-ascii?Q?qtrOqheT9ggujXT9DKXJ2xIrAsUVZc7RT6wxG+pw5ELn8D0VY6c5veAAchH4?=
 =?us-ascii?Q?aa8CwEcztFeHkF9VgEemzJYAHu8KSNi/XZn7Rsf7LnfB2QN5T1N+jC/bEZfl?=
 =?us-ascii?Q?DohV1F7+mU5H/53WyobwZ1Tdzd/SuXdtQm4MZqpBuFi1GovNSM4NTkEUQkSP?=
 =?us-ascii?Q?eLIXGXg0tUReVlV9Tve5hVKfMw3qwqw05x/o+uNBY+EEzldMqIaM36vC7P9D?=
 =?us-ascii?Q?INu1XVp8Kldi3dS5L/QpDoU5wM2sbo4chU5skzX3USh5z1QBl7ZXVIyo0SfF?=
 =?us-ascii?Q?q08S3UlcZWbi19uqcslnFGndErdcJNnXnK5lrdeVzr90Ap4KShnyOzaHLEOi?=
 =?us-ascii?Q?uFQ40rD9m+rmJWha5+fARzwAxUBTWSyu7zLezTqmT2UnPc01rK/AabhFMY7N?=
 =?us-ascii?Q?rbDRFM1OMCGZoBsMUEBmYyKDQbeVJzAej353R0fePJmycbpAryy2Ue3xkXt4?=
 =?us-ascii?Q?Qg7sY9U9LG0MQnPSr9TTwDZeLF+DVk8lHIAYImZvkVJ81KUCe4ke1CWiArtJ?=
 =?us-ascii?Q?pp6lssrQdA2Al7iGvH/Xv0Ht+b591rySSUlFZj9IbC3YivRVDc0rg2OXOM6G?=
 =?us-ascii?Q?mtqxhMa1Hej+G4+aaVF7CfXM2gHIEkkQBo5ZReuimwb+sFWWCY/BqvFlYnE/?=
 =?us-ascii?Q?VMpKUyuKHsPwWAMYAPg9IHSthmZGwcWSBHQst+va6VE97SfOVvE4nzAWLw55?=
 =?us-ascii?Q?o7poNjw0ZCuIC3Y5EiyU7Oaq9NkuZI8KPTKfxTUI8w190jvRBNKOzduk75Ti?=
 =?us-ascii?Q?TALdj1Qynuymlsw8n2fcyz7VEM8z6zFK/7aq2E/bI0v+vYgC1u6+4uXAU1aQ?=
 =?us-ascii?Q?Bj+m8r3zVBssXMs1s/6hwWH9WO7HclaDh3it/DoW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4e8a4f-f7b5-4bce-2910-08dcf1b43d52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:39:20.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYtsBFPVs3dGGe0ApBQeh9n1B7uLbJgXNLP6AOLUjfP8G8rb7+uDJq+yD98QE3kfx/9SPnjnsyaZtT337HjJfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
X-Authority-Analysis: v=2.4 cv=etaNzZpX c=1 sm=1 tr=0 ts=6716214d cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dwsXLWY68qBxEHdWnWAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: k4IBZzf5-PjKNl-ijqeKL_RRqy6kPwju
X-Proofpoint-ORIG-GUID: k4IBZzf5-PjKNl-ijqeKL_RRqy6kPwju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_06,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410210069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 09:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113073

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.2

Security Fix:
CVE-2024-49195

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
index 62c3add2a..168ee1b5d 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3
 	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
 
-SRCREV = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV = "107ea89daaefb9867ea9121002fbbdf926780e98"
 SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
 SRCREV_FORMAT .= "_framework"
 
-- 
2.25.1


