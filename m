Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084A8C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 07:47:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3383.1740469641725056011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 23:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7jfxx019121
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2kbux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1kUGO1BhRU7dhy0GO5Hc/8gHm+FGpt3gjJMaaq49xcF8MreFt7JNR8SmFisgq6rG6l04b+M4rdxE9l7bdzjg47MnesiMtbhONBh7X9rVy37/OzgzbOYTYTnJ9lgeWKedk/zfkkw3rv6U+tlPREZi7kAPsx/ZhGAEZWc3w/04VTohdOUXFrC9m3OSOBkWDiez6GTwjINYLuF03eqa8mXdnMSPEgt9xIEUMjg9kqyLnUS4tTCtm8g0sTwmQNT3pn7jHARiaFftowo7N+quV7LuCgJ1ms0hN9j64MnLhXOPY9zVMPcIjnu3IekdDAiHOe00GbSx8ZvLoJIGZOCGBRTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP/CPWOV/uCIX2gwM+pVmR5Y4kH+fRjJLGbhAZNaWsY=;
 b=f+4l/W7Ul4BKfy7fCV5eh4Yi4dT1mrL28RzzGXS+36JIH2HVCAgdyedldqmA1LrMTo+y4E661PmQOtMz9i1qSiqKaNLN6lN/fqMCD0HE5ZnAH/usYk2Nf9LH/o5NFFFDk43jMwaBwSJEqX7K5D9xD5SG05/tNBRjgwGKGOYvZ07bw6/nz5EYx6KDT43GmUToxAUgC1axqzzLSxcwJ1piWdjHbWNcoeNOa2+46TJoQSaE6SxMgOgnMwIVsCdRikh1Tw2DHYwMRKJyXYE84gM9TO07XFFrMPiQRnQR53UrRnmL9LWRS1w786CosXa42y5bMvP5ng6eMv9QCkaGIAg3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 07:47:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:47:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] postfix: upgrade 3.8.6 -> 3.8.9
Date: Tue, 25 Feb 2025 15:47:07 +0800
Message-Id: <20250225074708.1646493-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8782c0-dee6-4f19-2311-08dd5570a125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HlrpdkzYTCM1XQiM6EftP2vHccWLBIGdq7NzX4e1APF7onaKlu+lPbEXAGCt?=
 =?us-ascii?Q?HXgUwN3M3mqSovsRatCkJfByOAqZIoG4DVspyGcZO4k144cVFrFw0bHos7b3?=
 =?us-ascii?Q?F28ZidsHwxKKWwgfjRhW8cEcf4H3GTJXPxxAcmM8KWqjjxzCJ6b4ZBOpIqBW?=
 =?us-ascii?Q?wSiVEITiSqfhIJpuy+ZW5QqhCI88z/KZ/TsJ47d9fH2EprhMzoEqDRGphcld?=
 =?us-ascii?Q?7Bo/6SfhhQ1qvhqyoltmbZHU5j1Hy8qgGOAHDkKZW5XzsVN5x4e2tSVJC7a+?=
 =?us-ascii?Q?C5/ApPnPMLlXAYh4n8DnE9biGPOhEslyw8q//70xvPJ3NvPdK1Z2j2qSOON8?=
 =?us-ascii?Q?i3qklqpGXJHNwXLXZoIoB8WhpUO6A3GDr5rV8HbgzANwK8T6uu4MWoJjGCV7?=
 =?us-ascii?Q?+au2Elyy8yeF2TNoZz2gmmqoOiZf4H2ljxOr1fZpYuNwgYI/ajDYgCJU3hg5?=
 =?us-ascii?Q?sSR3OkyJSfCurmysIVChl89rvNcAIqIr8JYpqAcUtEi5FvgIscgiTH7F1n98?=
 =?us-ascii?Q?mosv81etC7iwvxwIvIE9i9Gry9cpGZ2AuRVSOeJQNzVrDCcVlTTcGwvf6zN5?=
 =?us-ascii?Q?UmbM4HFIw+t6z0bIM1wNtNBOTP5HC0uHgQgrHMS9gctlSgDz3rrt/zo534vP?=
 =?us-ascii?Q?lZVXSbX2pxhaHgaZqNpS4+YQkLNF6A5PQwcDDFbM0r6X6QnNOdPLOX2XA1Iv?=
 =?us-ascii?Q?Mqz0WlDgDKKel2Z/EKwHOC1tRMsa37VKE+sjFwfEaG4c/9MNysWBvFAPFJEI?=
 =?us-ascii?Q?MOt7d/CMnoIGcSCM+tEj3pFzaiGpjNQF+CWzXpCg5cY8pVaqVqDxnbzaNYcZ?=
 =?us-ascii?Q?/6x3clVhbNN1Pzg1qacdR5yowgMb/+Mq8aoE7jdCftDKbAdXmGdafVxrcQNJ?=
 =?us-ascii?Q?1eRhin8mJrD9WZdcbuRbVbL9R/6064Iuz/a1IWRJ8iWh1d6jmjH3O+FHAHb/?=
 =?us-ascii?Q?sGAqVCcgqYejp3s7LNruChVbUuZVLldWzGsGqdbHmKSzW2+nbCBV69Rpste+?=
 =?us-ascii?Q?zQh124Q6IN/R5dxO87P+1+xpzNubPPsdsN/hCEhjQ0ykRo9yD/Ku9aguXB62?=
 =?us-ascii?Q?SJpj3a7A0QCOxORW7giM7x7X3zcMMcDaWVcqAI7bHdgv0JpOP8wGCDmSd+sP?=
 =?us-ascii?Q?kC8XcNZyEF5yJLxjWcsJP4CJIMCjSf7g9x7ymtdqseggvy+wogDtUtTO/LAf?=
 =?us-ascii?Q?FUf7psC0MltB+3CBfuwiVZevSUannXBec33ETG9MXLf/SK506+td2NGVxOmT?=
 =?us-ascii?Q?GXUlW/aPUka9qgM4hiCGkKQ49UfRgJixezyz4HCKLThRYAZNbJZyuRP7Mzl0?=
 =?us-ascii?Q?LBYNbowobx/BbxTvxu+48eSZK4MXiMJhC8A9r50gNrp3/Euziubg33qJU1JF?=
 =?us-ascii?Q?btlHGY4FrvYZot2OspoKCwh66jGRugDnUxT2IoxG/su/m/NpSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dm/c0LAPNJBzAEHDMhL+tTuDCgIxi9U91Hw3rM49c31er+CvVdhmZsa6hKeH?=
 =?us-ascii?Q?0eWbFFMHvCQ3TFWe4yXmpSPCYbwRNDWAqf/r/NIgNMEq1bzKVUlOwf3j+9lW?=
 =?us-ascii?Q?tnC9bKPWw32ZUa0S75enL4RlCUkyK4Tja4IYhV7hq1CFtQV7sN5pZdB901tK?=
 =?us-ascii?Q?g/m6LFkqkkAAC2pnhzpNKLctnNuOQw6G1B3Kc+axctvf7qtBLVxSR+W7cVZm?=
 =?us-ascii?Q?VpMXF1BSSnN+D4u32CkAVlyz/ZtSWmUgFTwZbOwueb5rHCVVvDHl46ubtjUY?=
 =?us-ascii?Q?0P4SlsqfrQ6fQIZPu1EaPWGH22DoBM/Yhb6oc8qwfMwhx5aMG7qGG/k1Imug?=
 =?us-ascii?Q?Vpa3JiUAnBrfC2ELOjy67iRHh8zwMsmS+HrOPCEHX6xZSmgYM8nfoXaLXFyp?=
 =?us-ascii?Q?QEJ9H+M/Zgg6EmWekVqn9BcwQe1Caz53kZIpu+dLaq4wU/Ka+YpeKKLErliQ?=
 =?us-ascii?Q?zI9ToQFFK1oPPKc3Ib6rQC1sttXxz6Ja6mimXbTlsykA3frIdBJlSMS7NGuy?=
 =?us-ascii?Q?Vx3ryvhPMqLOUHSUU+Xy5KRV7ekSm1qoCxAb/38fyxeOFocWvwc09vX+uVUd?=
 =?us-ascii?Q?6Qff6w3XpLwTL/aydbfJghZ8j2b9VDOs/6/gHv/hMAip5/uk9IOFA2+2Rn38?=
 =?us-ascii?Q?8ocfWGxZcxekS5k9jWjtZKFutksfwQxrvHi9lfz9tVfuwRIz76C55/1OO0Oc?=
 =?us-ascii?Q?O91HFeUq3tMtUXVqc0P5J6lfrNeUep/qXrJl9iOsBqSWuAl9nawHRn1Pt9ev?=
 =?us-ascii?Q?xT0BnjDKnSFHDofuDzynCd5+63nvIPPrDiWUPGtS1SaAIl5oqLD4k66ToxiD?=
 =?us-ascii?Q?QdZCUVvekkL2dvB69WcURGqIrLF3pSMv0Cv9nKdvE9shdUujz9bRdzUOP/IF?=
 =?us-ascii?Q?IBiDzTLuWh8uEXQ7KsiSAGxlLj5qj3zQAicoJ7HrtbvPkwamj6j90lNpW7cx?=
 =?us-ascii?Q?jLEG8tKiS/qZScOr33NYo6++lIqMs75L5t1qdXCFIPUElw1rJLDkrf8Yaa9l?=
 =?us-ascii?Q?6M7KYORGbI2p8WAlE8V4LwtrDHn9hNkW7jcbBnEOhNEH9bN1OgSWu9KtSnIf?=
 =?us-ascii?Q?VF8iRw+sd1fzVCLP8fpqXROa0OdJ1KEDZ9OvCx97GHDDPbaw3D8c1BhBjGTe?=
 =?us-ascii?Q?bwDUNEYZlStMbDpwH1jSqFDjHW3q7WPBMy2RN91Dy4XGCxc60DStpJq7BQpY?=
 =?us-ascii?Q?SqkLemM216PMRbwXjfopE9t4ytfvH3Iy3g5QmYXz5wwi5ICJUsGAuxXPJ/sv?=
 =?us-ascii?Q?yGpekJo6Vaf1VwrJuUQ5YPOUWY8yMroBYYWGO6m61cahHwhA3FqgmbG6jJ7u?=
 =?us-ascii?Q?N02xMG3sbh75lh9s2rC3G5e6wxJoMYuTVi3AtmiaXKZpNu0YLRbFFLssH3TF?=
 =?us-ascii?Q?MaOqKFPt1sTLU1frX3Wf4qRDHP4bX1GAONoLpzASuSgnw57mfNoJlKbHiPGc?=
 =?us-ascii?Q?4AHgD/dEDhBsaZ7nOjw9AMPAhudBM+gRLPpqOuIUFn9s+zm/F+0uAnDCOEAi?=
 =?us-ascii?Q?t7DYviZRi16dbp0epMsbw5Xz5Qg/eZX1r/CBK6nZt9fMxifDz5PCkm56G8W4?=
 =?us-ascii?Q?Gy6MG7B11oH4sZHJFkygdzoa3OGYE/Q93Po/XKAM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8782c0-dee6-4f19-2311-08dd5570a125
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:47:18.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNCZ0Y735pG5ArFaONvzf3swyj7hcEh4K77SSGglRbdN5umc/+lrby5Vrb5lstjdE2w3vq97YvYb8Oynw92p+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bd7588 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8
 a=tIc39ZWbIceBgKkxg64A:9 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FQ_DeEkaupy8p7sZUaaLC-dJjUVsJBHk
X-Proofpoint-ORIG-GUID: FQ_DeEkaupy8p7sZUaaLC-dJjUVsJBHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 07:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115562

ChangeLog:
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.8.9.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.8.6.bb => postfix_3.8.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.6.bb => postfix_3.8.9.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
index d48e9145f8..2c474e4d04 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "4b6e17c826cc438cc3016a9c0a55ea7e77c6cbafba7dd57241d81b690b0e9774"
+SRC_URI[sha256sum] = "d0205a11e36d57b640daaa17a7e7166b8abc730d93b1db7e92e32dfb24bbfde1"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 
-- 
2.25.1


