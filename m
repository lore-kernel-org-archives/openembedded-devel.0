Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F128EFCD0AC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:11:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7395.1773810671318230725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dfLUOYls;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75375bae89=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4cFNa1239428
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=z18e2BYfI
	QzX+oD8E9xR/FIXnHI8UhJB1Ondims7vWA=; b=dfLUOYlsDdpSVNLTGF+gv9KNK
	Y04JG9hwWUkY2cvzruWvK6FXKE/ThDHZk26cb+yMAFEmnF3K/nuefJFF02cgkG2I
	r+6IySPv9kzciSWYL+Sdrlq7m5s+q7BheZhtH4vwXgBj1deKQ2w+49CMJfRwQqCL
	rNqPDoB8P+hT2ubrENLlgQ/KD/YSE5L7uxdi6Q+l08bgqYMlTvYzmRQdGknCkQXh
	UJPyQefSZHLfXcB1RWbtrRe/Z2ARF4ckvbMiv5FU262xY4ETzvvfxuPeF0QXXrxk
	1uMTW0+gep6tYdGb5L/g6af/zZ5lHTrWbuFqjx2768HY9RyBQbHXl/vew/CSQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66a8mw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:11:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBk82Wn5Mduo5Uh0iHnkeCPoZsbar72r3lzZoKVdMCbVzlR1hWbdJW4hnlFuY0t0kgXpv7CX1NLJwABMbqs+kpI+KlEZy90WYOkF+wt0pap1rDRVW4EtscWLNaBPPbbd5P7MrCGkrjCAWcJUlher/PzN3ygU6guL3G0s3eua05LeaI1COq05oxLbROjBukmsqaNaWweVIl0SJJYd+pjHpnKuKwdJYLj2kfYGofOqk8VEbI46/g9w8fHpcBwv8zfpfDEaQyMgKu20z6ayghZwsoryiBW/7Pxo5BmBjQbomOG+e/77zgz5MS/rRz+t0FoUi9iojwCePmzdcbIx4G26Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z18e2BYfIQzX+oD8E9xR/FIXnHI8UhJB1Ondims7vWA=;
 b=cC6ehl/r8LXF6xTsKv01inkPF2jmgldpCdTb+MOkA2yF8RpJbSlZOaiiTfgoHdVSZ8NMsP9egqfY3dEb5zQH/xynPuP79QWx5liEZO/ML08DZs+B8UN0/rVV+NiE9oECctuho2s/qbEqOytfWWN+Sn1ESHwa5F1ZMjdVwzTqPoeeYt+gKQS1tqJf2shGJbPOKoaRENB7cn3oJyyOC4hwLNcSsRBfbWXmEUbjLLUTd2H0C4S5ZJQtBVcVnL4d0uyl/kaj9l2jSjIlJXOj1yABlGc+nsU5vEOd2o5F7qBOT0nL7z4EH8kdzlaG9AYT2IWdhWYbHKrCqfua3lkGSQotSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 05:09:24 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9723.006; Wed, 18 Mar 2026
 05:09:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH] fd-find: update 10.3.0 -> 10.4.2
Date: Tue, 17 Mar 2026 22:09:09 -0700
Message-ID: <20260318050909.2523428-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS0PR11MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd82143-e123-4bff-322f-08de84ac856d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	TQWpCRsffkiW8b1px5Vf/2xe8ighanlevR5h5VRf9z3y5AQ9GeqgOTCC9XtSK6pQY2YKqamWkSHmorRRhwgl6TQmcRwrK/enQXq6FQxHzjBCzWObQuPHabOAHnKpENAvKtn7M4Ot3mbtL1vq1jRh5RCe/g8MSROhPnCNgIggPaY2ma8LE9N8sFCK4f5jmdCKFlveFD+AO8A6TPFcOuWuuTaEKyu+x9J4LBdaveocmTFg+V2nAE5IDA51axNLKUxEPQXbX6TqD70BLJPE/iQPQsx6IgWDTMxTocIuMgMp8y+4eKj+E3ZXhRmJjr26dldSqwOzGH379Eze3PQTHR2OBYVzY87WaLaGMfGOp2NQoI0SZqNDoOQ8KvpJcgsKjZL3PtQuQXwn21x88x4WVLKxkPw+tI+v4CJnxM2K/jLX436SE1m6NkImSV9yO/RrR8Hbi3cTRw04rHVTO/bt8Q9i3GyFcfDWRPEJfvX/lcUQnTJ943tw5WohtzBOEt7Dh58gqKiUAnS4gH9mG5aSVxqsLZp5W3T/CTANcQuwuAbSYe1d6AN8DCWM0KAjGxD/mdok1I7SEfsyDpxx2C8vcjgRMFEMrLEMJR2nkekYzJ/86eHxlK9us39nImr6Ad6PfXPzlUipWZorgNBkahEhWHjwAAgsBvXav1HJozrihCOy9m/cGlypl6vFSAPbaiz/yKyiLWhykFWQtE+i+qxkaTiZLe+peEgm7iAPsFgXgy+taFAl9C/7F3bn6zO2bkpYoomwJZ7jRPzUJSSj0tKEU8Kvp1PjSG+fCWxPAMy0MQMoA5oW4a2b5WP/4sxszjx5JP09
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1wxp8oTsef7PR90OW2VbpwV3PADd6WIo86goXV6ujsbWHmCd1tsPy2dvROEH?=
 =?us-ascii?Q?/vxzctJVhKNs5zfQFbQH+l+z3K8EifBy83Br0+nf4M3W0XzP1vvsgVobzz4O?=
 =?us-ascii?Q?RHMsdC3jCmq0+VG9Db90NWHsNAz3Tc2sjuIt8lJNNwVSw5rcMXUkiDANTYX2?=
 =?us-ascii?Q?jlb4gZv0vgxLIgRtw9WNXLKobzMJLoALJVjS+fd7holv9kB9wvMR5C3QLLf5?=
 =?us-ascii?Q?SlMhywFAS4mMTa2Gqo6fsTVSQ+a9js+pQ790Y/NxOagZI//+6ow0v9bvNL8C?=
 =?us-ascii?Q?90OsN1VHaWhNToLPGeX5vTKN1/3oZF2fRQxu97X3mjNFOvxRA1Y5U+FeDxhv?=
 =?us-ascii?Q?u8/2mGkjKk/LIgZY8DOQUwA73umMoauaA31RxYLxXEOAt6J0anWGWWwV01j+?=
 =?us-ascii?Q?9Pr6NRNFdhB/PaZoc3tHZ2Uc+VquuoYcrWXQ2O6oHvb2hH+ANwxW6ItRBvCR?=
 =?us-ascii?Q?qHHz/+qbqA8SSG2kycBJMKE4mbFjM85FVJ26wCppmJtcPem3v9w4sB5szOAI?=
 =?us-ascii?Q?BojFZ86GSao0+hrEab4IEqP/NkP6MonhtfoHdPWrGFS6kIehvuD3CIZNSiO/?=
 =?us-ascii?Q?UPyU1X7Ksom4OWh88HOY51wdgaNTjddZGpkOQXTdlAr0aIiyarL+w43qZhd+?=
 =?us-ascii?Q?CM5Zgs9Fd8Tq4pBSwvhZZgguXGgwVthzjQ/c8XmVOKGMGlovXvAi6Nx7o9VO?=
 =?us-ascii?Q?eluOcUy6QLCe3zWU97nZHD43E5K+gLizMQ+eIAyQ372RFl4q16CAhvwuhRc5?=
 =?us-ascii?Q?4jnHWCG/nTUJWmiVE4FZ6xUhM4Cs5ykNDsZzK2c3UBfLRyWSnmohKNmReK2O?=
 =?us-ascii?Q?4WMDaVCwKALA7a4yUJbh7RdpoVDvZk4YD4pPuhtyHH4OPuA5dJQfqA6GIZ4X?=
 =?us-ascii?Q?VwXTNqXIlMMe1axBIaSqF1WSwLoBp0I/ulMkKmyMBnpLXVGlliwiGMXfHF5d?=
 =?us-ascii?Q?6SXHEvA9LsXvL72sq/LMSaOK5tIPNyeSNzLxrpmYXaPNYFkolCvyFAy1sMcu?=
 =?us-ascii?Q?FZ9KcnrQnnE/8EKQR14ikdNFyTrwrn9dtHmx1t/hfrxqEPciCnQu3Bkp9TMy?=
 =?us-ascii?Q?ewZVGEr1YLeVubMw/Wkj2M1z2EOz3fSXj80bSkQ25zoI5m4y5npi5GxKCoEo?=
 =?us-ascii?Q?FHX45OqZDDaQ1xYHQK7pbHKVtcdFptgpAuz1hHFDwrX6sm4pmfYx9tOKZ5Xj?=
 =?us-ascii?Q?KMgV42jK4Xa6Iwf6ilAYKwMSq8pn7vkEUtdgaqM51Ios2CGfb9DuWmdnR+n6?=
 =?us-ascii?Q?6TIdkigIXqSaKTWrcy+46a6SrDnTDlu0Y8a+UVXTrVH4anNZXo5WHC2ZJ6HK?=
 =?us-ascii?Q?qhwLKr7iXfz382ydiha72cZkarGjbKt1O/QOnp/QIyOLg8nWLzF71UlVid30?=
 =?us-ascii?Q?Ob+Rtq5fsZP8pWqJTmEyZfX6XXF6beYfuIgE1T4vGDuot5Wp+qWgpoT4ZCvZ?=
 =?us-ascii?Q?c789CdG9Dtc921RLYZetElKk70DTpfNkVb4Js7HOJd7eFws3vGnI24TZBOuS?=
 =?us-ascii?Q?cqSkzQnKhPxHqAZ7TEAEQ6zeF84LPYqSoWUtGFOzpmzp3E+p/KMMam7ufp4c?=
 =?us-ascii?Q?4dTHkhMmGUjPq+VbmcX6aTVQx59CBbN34gg1ktMHNE69SpJpfdOvgn4aCBYv?=
 =?us-ascii?Q?3xJnagGl9jO+b00kUKLbmfu6GUeU72vhTbLYTAvvPd8HKVCMQomxvIKswbmq?=
 =?us-ascii?Q?3m71rj7z7vyvKeAOWafHrUEMM326yTOs7yZrHMyR94AQ9ge7CC6cnefZ4fPv?=
 =?us-ascii?Q?qIMmz+8siclwnnEEFjOx93zwveto+XWUFNaTC2/z4nDlPIC2ok9y?=
X-Exchange-RoutingPolicyChecked: 
	Ahsux7VJPCxJCzGLwGf1rwS1Jlse08MCowe+5yX0TWYy/QaSjR4slOw1ZY1bupX0z9XmiwgwGJc6HukGV++itGY2FU0r2mSDtVMQeemwzEfl5ZYJYgbvWs9KZF0Ui6QSH51R4pnvV5Q3dSpoIFCw0ezDO4yL2t+tM+zOaFFycp8dyDsMuTCV1sneb7IrV9jYzjVHjhnZplnlnL/Wz5JVwE9GSNcsocM6Ij4p9uQf4BLt9mEWfVRrwSi2r5vSz6rC2Ov6JIPSI2uGcMadXv9JLQQRiHIyrCV52jEqQx5E1wN5SbQfg2ubB3732Bd9aPjsHDa+nsSk0GLaf791GM9MkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd82143-e123-4bff-322f-08de84ac856d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 05:09:24.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf1HFDefDnDMimWUnn+Be/1WTw+2wURzHntmuAjWm8GJZ1PeFxe0EBtEWR+urs1h0MeX/HVxdRpUewDRXvTPz1Uwa+OwFpGSh0tmWMfVpc+ehT58wzom++y6kQ+ToKGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7958
X-Proofpoint-ORIG-GUID: O4LVATohhJUlqPShpJGW49nll95dGbla
X-Proofpoint-GUID: O4LVATohhJUlqPShpJGW49nll95dGbla
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69ba33ee cx=c_pps
 a=8AG4s+rqopmfoFde1j+oJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=76aGpFCMpAzxYl0O8jYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0MSBTYWx0ZWRfX28t1LHwUuZln
 dNWyf8IB6Y4YAKSRTjn0OT1b5by6R9LiTLedNbXx1ySkV9lGktMIp2PYT3Tqlebc1eLxWtim5bB
 X07rnScFFWEjv8kE7lNEb9DxNy1QQRDNb6hyL0rL4Y2LOpSLYYs1Kyu9/5YRAbVcJENw6Rkvn6A
 WfRzTjRA4DleRc+IyPD5mbMs17kdZnO864306gTJ0zOank+mnX/ejhLtw435qZOvMgyrJBvOHHw
 Exmo4WyEZOGsX3LXAAnRgboJs+G7oMC27LZFQgtgCugYWQJuuDWM6H5o1ghnrWmZTs7Ot/HlohH
 S5zOStr7MZ8p6fHPsR3/r1oI1yy+3Af0wW9ysLdSZACBdlMRWpyYzn/P62uMzIGqmIiPKn3OZEc
 GiZd9lRC6XAEo7nEFtZU/BblFLm7TFbu+QVNFybKBzK8oFrU6AL5D55Duh0Ta2ctmaGwSecfWB3
 EQj6jQuwS2X5O2KEWSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125343

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Changes are here:
https://github.com/sharkdp/fd/compare/v10.3.0...v10.4.2

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../fd-find/fd-find-crates.inc                | 350 ++++++++++--------
 ...fine-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch |   6 +-
 .../{fd-find_10.3.0.bb => fd-find_10.4.2.bb}  |   4 +-
 3 files changed, 199 insertions(+), 161 deletions(-)
 rename meta-oe/recipes-extended/fd-find/{fd-find_10.3.0.bb => fd-find_10.4.2.bb} (89%)

diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
index ae70f2182f..3ee3a3eb44 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
+++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
@@ -2,217 +2,255 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/anstream/0.6.19 \
-    crate://crates.io/anstyle/1.0.11 \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.13 \
     crate://crates.io/anstyle-parse/0.2.7 \
-    crate://crates.io/anstyle-query/1.1.3 \
-    crate://crates.io/anstyle-wincon/3.0.9 \
-    crate://crates.io/anyhow/1.0.98 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/argmax/0.4.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.9.1 \
-    crate://crates.io/bstr/1.12.0 \
-    crate://crates.io/cc/1.2.29 \
-    crate://crates.io/cfg-if/1.0.1 \
+    crate://crates.io/bitflags/2.11.0 \
+    crate://crates.io/block2/0.6.2 \
+    crate://crates.io/bstr/1.12.1 \
+    crate://crates.io/cc/1.2.56 \
+    crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/clap/4.5.42 \
-    crate://crates.io/clap_builder/4.5.42 \
-    crate://crates.io/clap_complete/4.5.55 \
-    crate://crates.io/clap_derive/4.5.41 \
-    crate://crates.io/clap_lex/0.7.5 \
+    crate://crates.io/clap/4.5.60 \
+    crate://crates.io/clap_builder/4.5.60 \
+    crate://crates.io/clap_complete/4.5.66 \
+    crate://crates.io/clap_derive/4.5.55 \
+    crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/crossbeam-channel/0.5.15 \
     crate://crates.io/crossbeam-deque/0.8.6 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
     crate://crates.io/crossbeam-utils/0.8.21 \
-    crate://crates.io/ctrlc/3.4.7 \
+    crate://crates.io/ctrlc/3.5.2 \
     crate://crates.io/diff/0.1.13 \
-    crate://crates.io/errno/0.3.13 \
-    crate://crates.io/etcetera/0.10.0 \
+    crate://crates.io/dispatch2/0.3.1 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/etcetera/0.11.0 \
     crate://crates.io/faccess/0.2.4 \
     crate://crates.io/fastrand/2.3.0 \
-    crate://crates.io/filetime/0.2.25 \
-    crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/globset/0.4.16 \
+    crate://crates.io/filetime/0.2.27 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/getrandom/0.4.2 \
+    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/home/0.5.9 \
-    crate://crates.io/ignore/0.4.23 \
-    crate://crates.io/is_terminal_polyfill/1.70.1 \
-    crate://crates.io/jiff/0.2.15 \
-    crate://crates.io/jiff-static/0.2.15 \
-    crate://crates.io/jiff-tzdb/0.1.4 \
+    crate://crates.io/id-arena/2.3.0 \
+    crate://crates.io/ignore/0.4.25 \
+    crate://crates.io/indexmap/2.13.0 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itoa/1.0.17 \
+    crate://crates.io/jiff/0.2.23 \
+    crate://crates.io/jiff-static/0.2.23 \
+    crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/libc/0.2.174 \
-    crate://crates.io/libredox/0.1.4 \
-    crate://crates.io/linux-raw-sys/0.9.4 \
-    crate://crates.io/log/0.4.27 \
-    crate://crates.io/lscolors/0.20.0 \
-    crate://crates.io/memchr/2.7.5 \
+    crate://crates.io/leb128fmt/0.1.0 \
+    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/libredox/0.1.14 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/log/0.4.29 \
+    crate://crates.io/lscolors/0.21.0 \
+    crate://crates.io/memchr/2.8.0 \
     crate://crates.io/nix/0.30.1 \
-    crate://crates.io/normpath/1.3.0 \
-    crate://crates.io/nu-ansi-term/0.50.1 \
+    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/normpath/1.5.0 \
+    crate://crates.io/nu-ansi-term/0.50.3 \
+    crate://crates.io/objc2/0.6.4 \
+    crate://crates.io/objc2-encode/4.1.0 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/once_cell_polyfill/1.70.1 \
-    crate://crates.io/portable-atomic/1.11.1 \
-    crate://crates.io/portable-atomic-util/0.2.4 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/redox_syscall/0.5.13 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rustix/1.0.7 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/plain/0.2.3 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/portable-atomic-util/0.2.5 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/redox_syscall/0.7.3 \
+    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/rustix/1.1.4 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/serde/1.0.219 \
-    crate://crates.io/serde_derive/1.0.219 \
+    crate://crates.io/semver/1.0.27 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.104 \
-    crate://crates.io/tempfile/3.20.0 \
-    crate://crates.io/terminal_size/0.4.2 \
+    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/tempfile/3.26.0 \
+    crate://crates.io/terminal_size/0.4.3 \
     crate://crates.io/test-case/3.3.1 \
     crate://crates.io/test-case-core/3.3.1 \
     crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
-    crate://crates.io/tikv-jemallocator/0.6.0 \
-    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
+    crate://crates.io/tikv-jemallocator/0.6.1 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/version_check/0.9.5 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
+    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
+    crate://crates.io/wasm-encoder/0.244.0 \
+    crate://crates.io/wasm-metadata/0.244.0 \
+    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.9 \
+    crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.60.2 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows-targets/0.53.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.53.0 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.53.0 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.53.0 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.53.0 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.53.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.53.0 \
-    crate://crates.io/wit-bindgen-rt/0.39.0 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
+    crate://crates.io/wit-bindgen/0.51.0 \
+    crate://crates.io/wit-bindgen-core/0.51.0 \
+    crate://crates.io/wit-bindgen-rust/0.51.0 \
+    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
+    crate://crates.io/wit-component/0.244.0 \
+    crate://crates.io/wit-parser/0.244.0 \
+    crate://crates.io/zmij/1.0.21 \
 "
 
-SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[anstream-0.6.19.sha256sum] = "301af1932e46185686725e0fad2f8f2aa7da69dd70bf6ecc44d6b703844a3933"
-SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
+SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
 SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
-SRC_URI[anstyle-query-1.1.3.sha256sum] = "6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9"
-SRC_URI[anstyle-wincon-3.0.9.sha256sum] = "403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882"
-SRC_URI[anyhow-1.0.98.sha256sum] = "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
+SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
+SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[argmax-0.4.0.sha256sum] = "0144c58b55af0133ec3963ce5e4d07aad866e3bbcfdcddbf4590dbd7ad6ff557"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
-SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
-SRC_URI[cc-1.2.29.sha256sum] = "5c1599538de2394445747c8cf7935946e3cc27e9625f889d979bfb2aaf569362"
-SRC_URI[cfg-if-1.0.1.sha256sum] = "9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268"
+SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
+SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
+SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
+SRC_URI[cc-1.2.56.sha256sum] = "aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[clap-4.5.42.sha256sum] = "ed87a9d530bb41a67537289bafcac159cb3ee28460e0a4571123d2a778a6a882"
-SRC_URI[clap_builder-4.5.42.sha256sum] = "64f4f3f3c77c94aff3c7e9aac9a2ca1974a5adf392a8bb751e827d6d127ab966"
-SRC_URI[clap_complete-4.5.55.sha256sum] = "a5abde44486daf70c5be8b8f8f1b66c49f86236edf6fa2abadb4d961c4c6229a"
-SRC_URI[clap_derive-4.5.41.sha256sum] = "ef4f52386a59ca4c860f7393bcf8abd8dfd91ecccc0f774635ff68e92eeef491"
-SRC_URI[clap_lex-0.7.5.sha256sum] = "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
+SRC_URI[clap-4.5.60.sha256sum] = "2797f34da339ce31042b27d23607e051786132987f595b02ba4f6a6dffb7030a"
+SRC_URI[clap_builder-4.5.60.sha256sum] = "24a241312cea5059b13574bb9b3861cabf758b879c15190b37b6d6fd63ab6876"
+SRC_URI[clap_complete-4.5.66.sha256sum] = "c757a3b7e39161a4e56f9365141ada2a6c915a8622c408ab6bb4b5d047371031"
+SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
+SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
-SRC_URI[ctrlc-3.4.7.sha256sum] = "46f93780a459b7d656ef7f071fe699c4d3d2cb201c4b24d085b6ddc505276e73"
+SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
-SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
-SRC_URI[etcetera-0.10.0.sha256sum] = "26c7b13d0780cb82722fd59f6f57f925e143427e4a75313a6c77243bf5326ae6"
+SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[etcetera-0.11.0.sha256sum] = "de48cc4d1c1d97a20fd819def54b890cadde72ed3ad0c614822a0a433361be96"
 SRC_URI[faccess-0.2.4.sha256sum] = "59ae66425802d6a903e268ae1a08b8c38ba143520f227a205edf4e9c7e3e26d5"
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
-SRC_URI[filetime-0.2.25.sha256sum] = "35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586"
-SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[globset-0.4.16.sha256sum] = "54a1028dfc5f5df5da8a56a73e6c153c9a9708ec57232470703592a3f18e49f5"
+SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
+SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
+SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
+SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
-SRC_URI[ignore-0.4.23.sha256sum] = "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
-SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
-SRC_URI[jiff-0.2.15.sha256sum] = "be1f93b8b1eb69c77f24bbb0afdf66f54b632ee39af40ca21c4365a1d7347e49"
-SRC_URI[jiff-static-0.2.15.sha256sum] = "03343451ff899767262ec32146f6d559dd759fdadf42ff0e227c7c48f72594b4"
-SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
+SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
+SRC_URI[ignore-0.4.25.sha256sum] = "d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a"
+SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
+SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
+SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
+SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[libc-0.2.174.sha256sum] = "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
-SRC_URI[libredox-0.1.4.sha256sum] = "1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638"
-SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
-SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
-SRC_URI[lscolors-0.20.0.sha256sum] = "61183da5de8ba09a58e330d55e5ea796539d8443bd00fdeb863eac39724aa4ab"
-SRC_URI[memchr-2.7.5.sha256sum] = "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
+SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
+SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[libredox-0.1.14.sha256sum] = "1744e39d1d6a9948f4f388969627434e31128196de472883b39f148769bfe30a"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
+SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
+SRC_URI[lscolors-0.21.0.sha256sum] = "d60e266dfb1426eb2d24792602e041131fdc0236bb7007abc0e589acafd60929"
+SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
-SRC_URI[normpath-1.3.0.sha256sum] = "c8911957c4b1549ac0dc74e30db9c8b0e66ddcd6d7acc33098f4c63a64a6d7ed"
-SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
+SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
+SRC_URI[normpath-1.5.0.sha256sum] = "bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b"
+SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
+SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
+SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
-SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
-SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[redox_syscall-0.5.13.sha256sum] = "0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[rustix-1.0.7.sha256sum] = "c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[portable-atomic-util-0.2.5.sha256sum] = "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
+SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[redox_syscall-0.7.3.sha256sum] = "6ce70a74e890531977d37e532c34d45e9055d2409ed08ddba14529471ed0be16"
+SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
-SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
+SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.104.sha256sum] = "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
-SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
-SRC_URI[terminal_size-0.4.2.sha256sum] = "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[tempfile-3.26.0.sha256sum] = "82a72c767771b47409d2345987fda8628641887d5466101319899796367354a0"
+SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
 SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d"
-SRC_URI[tikv-jemallocator-0.6.0.sha256sum] = "4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
+SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
+SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
+SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
+SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
+SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
+SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows-targets-0.53.2.sha256sum] = "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnu-0.53.0.sha256sum] = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_i686_msvc-0.53.0.sha256sum] = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
-SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
+SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
+SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
+SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
+SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
+SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
+SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
+SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch b/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
index 82eac5e1a5..db191d8250 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
+++ b/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Define ALIGNOF_MAX_ALIGN_T for riscv32
 
 Long double is 16byte aligned on both rv32 and rv64
 
-Upstream-Status: Submitted [https://github.com/tikv/jemallocator/pull/153]
+Upstream-Status: Backport [https://github.com/tikv/jemallocator/commit/f4fde3f8f572b804adf15cf4c68b826109f8c36b]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -16,8 +16,8 @@ diff --git a/src/lib.rs b/src/lib.rs
 index 165660e..5f6a2a0 100644
 --- a/src/lib.rs
 +++ b/src/lib.rs
-@@ -57,6 +57,7 @@ const ALIGNOF_MAX_ALIGN_T: usize = 8;
-     target_arch = "powerpc64le",
+@@ -51,6 +51,7 @@ const ALIGNOF_MAX_ALIGN_T: usize = 8;
+     target_arch = "powerpc64",
      target_arch = "loongarch64",
      target_arch = "mips64",
 +    target_arch = "riscv32",
diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb b/meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb
similarity index 89%
rename from meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
rename to meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb
index 3a28009471..408f97f490 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
+++ b/meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/fd-find/${PV};name=fd-find"
-SRC_URI += "file://0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch;patchdir=../tikv-jemallocator-0.6.0"
-SRC_URI[fd-find.sha256sum] = "2fbf004b5bbdefab92e76237e2022c77842cdef5d3213fe09fd804e0474785db"
+SRC_URI += "file://0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch;patchdir=../tikv-jemallocator-0.6.1"
+SRC_URI[fd-find.sha256sum] = "b95ed7d1f53e0446a7d47715801f6bee95f816c4aa33e25b5d89a2734ab00436"
 S = "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"
 
 inherit cargo cargo-update-recipe-crates
-- 
2.49.0


