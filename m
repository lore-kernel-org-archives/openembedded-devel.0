Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7FAC54E49
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 01:25:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.51849.1710120335317073791
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 18:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oPBpYVJ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3800741b93=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B0vSS2025600
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=0n0LbxmeARl8+J2N0O9UIBWCIlf+Rf1ujJlEcuNPgg8=; b=
	oPBpYVJ5WktG0VMTnKakmtsgxHeB7wTaUJMxmSpTdGe+jOjUt2xv1zy3NxipTcTe
	Wuq+U0bvttQazUYm2qPOwWO8VeUyp3U50hghkPfnvGXqWCz+hH0XsGDahlwjzKfx
	1g+dxlH7j+ac9gfgvnUGFt8KNGD6UplTvjMdt6tmXVf2BkQo9oygueXIQeDDnJAI
	cHKfWFUaorVHNMGaKRDGdiQg5qQkiK78B/16cPjwvi7+31cloiX+p6+cs221e8VB
	MRSxkiG83rm+gNkP7QqE0F1rcY6qTJdVuOF30/aEF92k/nyUyRUidcVh9yCbeeNQ
	QgUHPH790B8GTHSrm2Y7ow==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6976t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKUytq8+YYJ5Be2hzhl39FYekg6f0AUY6fkiO1iIllT+L/QqvWAcvLGUtlh/SbZgBxIh8/TgKxr8Hmmo1ZASndIGveDjnsymrS/EoZu0hVkpC57dzF0ydUGvB+Ve/VqtCi5aHUS9L+9CJySyhH0Z10zCkfK8kXtpjqtifbB0dtU6pYWFrohCLIFt7luwCWCtcE91n+LNpMyHStVpsK+8G9Dm0JbNRdwXCz9RXnO6B9r7zX4RNqm06BHS+/LM8hSexXYPLDIQjo0oQihlNxnFNtoZ+oicc+JdEnH/lCumGu5cbI7X5BIYOGOUEtpN3uft6zN6JoCLkqDH+FI7X/rrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n0LbxmeARl8+J2N0O9UIBWCIlf+Rf1ujJlEcuNPgg8=;
 b=Hcy/jt1VImZtneidadj39y3JHMeAIGjNrUl3xgzZD+EEnUSewjlMIqikwuCtHqhhGAb5yQ1puftECOH36mIVEhT13+0vdMb/K5esPiMvbCESPe0AX7Kf8eRUx+D7sLybTtmNoPZ0gfSQKx2N+SsI7DLfbHnHTlkKnoTakj7hBGr+r/uSgVQl4DgEhNr9yL9A+60OlvNik8OlwVEQ0bL9vRIZRaF57GFBbf6axNECqQ4jk+AIf8dpaf5c5kXvioIZbbgf4JYhlbrvhEK/Ihxr2xRczNJQvtBj84LypTDmrzc8qK5Aj8neC+8eB3un9xp4TqgxoyuJpGw0jSvxUh8C1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 01:25:33 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 01:25:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.19.4 -> 4.19.5
Date: Mon, 11 Mar 2024 09:25:20 +0800
Message-Id: <20240311012520.1516794-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311012520.1516794-1-yi.zhao@windriver.com>
References: <20240311012520.1516794-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::13) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: be387f0e-8f1b-4c69-be3d-08dc416a2542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	67D/wCq2tsDMnoCHBRLo3RwADqBihdbceof3ugKg4eIjqcf3XbbpZZIyaa/1gcEevH0HrKGIm50JpkJ9USDuQhWxPhE/LZhfCuESpSRUVh7fgN5OZrZE58JqoV+Qd9dCmepxVenrnnZyjdt1vf/Qqt3BvSjnGMcDflC9CsPg5spRvUPvwXogzbJuopwYyg8ogZ+bNpKZJWG5M2XVWlJHQfNRMtkIKIxlMVEgz6PVzed7tuSUsoCaMG0K9ILLQw4M2Wa+IbuSz+B5eF57eiEOvkMIAivTV9QvB42yFFnWdfILi7w9OLizSSVMXHCHn3LewXVTA9H+AfHntmoB5ao8RIVybfi4LmG3fCfBqQZVFYsPnp5bo1HAZCsKY/k3jA5sjlWeDLTxPzmnvlnOZyl5HRYii8RhX2IVAgox0F7dpJ19fPuh4ex5Mm+PIGS34DqJcQv3gSaP0vO7Id122FxVMCGcyykssyR4IFLgnkcu1UC7mU5U8bIziYfXh7FhHo57vUqB8JH29Aqk2PqWaABhNaFdT2LN5RfArr4FOZpN0a3GI2hA0oy8e5rID4sTQbkYa4g8cRMYmfDqj6BFIb9Jg+6YJn19P+Ke7EW41y5uXeffqvquVgj3N4Bf7p3wgPUdCpU/6KTyXouqo7kg2pmOX7wF5bYs81BUIKZlruBce/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SkmNyeQBtjVY4aTHWdfdN7v2g04g+IXTSxJITQEeA1SaGTRnETO8PbC+Az8y?=
 =?us-ascii?Q?BKNhOT2xDothHeOJE+8vX4vKI6k2oXEsZKLzkjqq7p79TpLf7UurcMMiH9t2?=
 =?us-ascii?Q?ZJloNuV0XyghWUR20XCYjszBtHcdBHXlvyD3lkaU7U1rgv5CvVE6Vk2aSSRO?=
 =?us-ascii?Q?csA4Lti4sovlUFYylbqbCEedzvW8775JYtNcRSJyFIw+asFd80SDt70beYrO?=
 =?us-ascii?Q?mCnlhDNuj/BzqmaZacjYVRLG5gHwaUSD5/icXpt0bpcNfJWLANT+E5iD6QJ6?=
 =?us-ascii?Q?F5rS96cIhGlpgfkCPSA2ivnnex3hvsFqiyi7xrAVPv+zP59Qt7BV+FVPSAiy?=
 =?us-ascii?Q?DfHDlVPtGaoh0CZlIfiEyMYgwnVy8wL94QbnWJb8anrBQWrAmMxPCPEKzRVW?=
 =?us-ascii?Q?AxnMX/J1G5VFpavqP4gxAQ9hR3wC3Z1HuEA7N1USluPApRcC4tQoZGhMOvv+?=
 =?us-ascii?Q?OVXysQI9eZWNawW9PXt6Uweqw1YJdVsDdiKG+1/HyxFU4SjkR1QEqgoiQjII?=
 =?us-ascii?Q?3VktTMnVX3rRuEPrIInoK2bzRUMw5s6d+fgeVe0a3mnb12zne0QdVx9SO9tV?=
 =?us-ascii?Q?euWJRUhf17GW9Yk6oSo4OUk54gOpIrFP/VHmo5GvTt5zJBqxjiSIM/Tt3ti0?=
 =?us-ascii?Q?y02ARrM+/Hvh78SYYCzjcWsXu2osGrdmtroMVpzP0yRAGcrD9biYlmcinxkz?=
 =?us-ascii?Q?XLutEtBc62yNx7R8cDSuLr4OKYjhYSrarLFWBc5glvZtPTZg4Pl7FuXmVDq3?=
 =?us-ascii?Q?+IonJI7E62OMxzavKCT35pXGKN1/4si2aNbafQF/anYHRbQsIz4U7gEhhJTM?=
 =?us-ascii?Q?tpYYde81024Vm0XAo25j0gPM5IfLZLV+8jsenlIcgGDRtBxx7wSRR80GyNpU?=
 =?us-ascii?Q?Tn9IPeJMlv7896kyg/BkgumPfaGNplH8DAVL8Knw9s0ASBDL3QTJjXTT8UMH?=
 =?us-ascii?Q?DOVaMk2f5ETA7DEozPBHpvJ7b9GGbDWgd8motdv9WjqWYZa+PhI/vBZA/aZV?=
 =?us-ascii?Q?jsl8ts+Sia7Hq2i2P3L9+FoJasL8/cb7ni8Uje6ZWbKJC2N/5tGORHiJbq4F?=
 =?us-ascii?Q?gIhUZGspCTJ4OQX4M+e/DvsdukolD9BFe9N/ckmkycgZth+vK04N/JngAFsg?=
 =?us-ascii?Q?aKvnJ8JbKAqYJYJxPRetZrf3OTteaUKjw39zmJBfFQFwXiD91qmkhLaE7+7O?=
 =?us-ascii?Q?ozo4Y6DyoF2mGsJcOgVdBHk85Q/bcXMG8uwKOlDGMTCG+g2lnHJJw6H4fKi9?=
 =?us-ascii?Q?XUk0Wy4JqyJhNFVi0XE1t79v0ZECKpUaS6Vu3Cic3R3IxpaEmIqh/MIn30o8?=
 =?us-ascii?Q?Jod3E32WFpkjGiy/FMwHk3CsYKcsEltgc0Pam4CnvQN31bmNVpmgPTtjKQZq?=
 =?us-ascii?Q?aQwPBuZeiG7JofQUcDQjl/d2e4WCpWHi5dBlGOX4YYTxk9hzhH2bP7h+Lueg?=
 =?us-ascii?Q?uyVhVd2EKkmr5R9s6T7uSr0CDv6bOqravQUd3I5M+f+YtjGsPKADKN2htGwk?=
 =?us-ascii?Q?04Omhcb7M35M8ywUqXfjSv4p0W2e/gCnxczA5g2LV2dxVoBpaXoTWIHZKdIu?=
 =?us-ascii?Q?DDJjOwWnXqti5vMAuWM6Bf14VuhDcerDSOatXfpt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be387f0e-8f1b-4c69-be3d-08dc416a2542
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 01:25:32.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMuhAd4gvMtcgMIoNgZnK1gOtOtRJ9XBJ1WOHImg0+8Nua9S+5cOBh5K2t8d4hDIKoGhWCpcfV29w11vAJjjdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-Proofpoint-ORIG-GUID: -ou649DKQME-X3Ff-G0PMt1wq96nvyNN
X-Proofpoint-GUID: -ou649DKQME-X3Ff-G0PMt1wq96nvyNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-10_16,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109261

Release Notes:
https://www.samba.org/samba/history/samba-4.19.5.html

Specify --pythondir to fix do_package_qa QA Issue:
WARNING: samba-4.19.5-r0 do_package_qa: QA Issue: File
/usr/lib/libsamba-util.so.0.0.1 in package libsamba-util contains
reference to TMPDIR [buildpaths]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.19.4.bb => samba_4.19.5.bb}                 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.4.bb => samba_4.19.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.5.bb
index 9e02afd0f..f5ef86dd4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.5.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "4026d93b866db198c8ca1685b0f5d52793f65c6e63cb364163af661fdff0968c"
+SRC_URI[sha256sum] = "0e2405b4cec29d0459621f4340a1a74af771ec7cffedff43250cad7f1f87605e"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
@@ -122,6 +122,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-profiling-data \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
                  --with-pam --with-pammodulesdir=${base_libdir}/security \
+                 --pythondir=${PYTHON_SITEPACKAGES_DIR} \
                 "
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.25.1


