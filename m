Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763A4C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 13:03:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7588.1788613393938619516
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2026 06:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XSaJNROH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3708e4d0e1=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685CjtdB3757318
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Sep 2026 06:03:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xuSrCNc8N
	k3rJi2FKGTbdvTwMjpfrHbXDwFqj0e0c4o=; b=XSaJNROH5Vw9BgvohcGQVI53A
	gezDJ4KXyem9zCwuIDt5ECX/nXNg7OSHW7BUmbedGEzi5sLoVkZ1IG2cVCGHyNoL
	Cw/fcNv/QWExA0lEVMoZCHYtktbtFdLnr7g3Pe7bao1ZeEu5LpertPoqMPqdavU4
	oE5SBpTxqVkSitzELVOoqspTe4qae4FuDF6ltJiKMy0lEm5dl3ljyOlN2Y/PbI41
	4/xJAMbViOn8Q7wCRno4vHEDEjMBP2BKOlWyy6xZSDL9T4jFZtnFJE1+vGDSTnd8
	IXFn1ODTiGj6/sSyTPduiuHaHxbjdxXPv+ZRTQZc+N/zRw4nj77Y4gMm873iA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022083.outbound.protection.outlook.com [40.107.209.83])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggjke01e3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 06:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhAF3QYbaWV/gsKx9HdaxkDnmpxZ17gJz9dN5iQ8kcUHvaVzgmT/7l998ckhDr09V+c/piMuHcZiLpj6dIxxwqZQ5FH3oaDzpGrzrICGGz59drIeahbUoXTYHh+bIySXstLfQel3B2nxVfFv9t2RXNsIrqeffiyGohvdtlheRFWv4GZTa5bilCTKjJXlnA3J1xOrRoXrfT2ZGbyYsn4H4kGOH9MlVwR96bzEzPoLRIjQy6z97Cj7cgxP0rQ7XRx/DS9K5GE9nkMnonmCCLOKNLMWIXH/mU4tAd1cepSSifFuiWyRypCnoIUz9qlqI0aFe6KgYhdA0e9VhV17N4bUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuSrCNc8Nk3rJi2FKGTbdvTwMjpfrHbXDwFqj0e0c4o=;
 b=RXoz3LJ20lr0fzmt4jOf6EaE5l+0pVRHVqfaT2oZ/9+zhTMSqs7OBn1kdTZ4SDIOK2VD+e3rTnIk8rr72glXoN+mynxTGqWAjyseg6totiEB9eEVs2XYn7jz810LhMX0dI9ile/ypohUvnAF5nY+g4tIxAqtv/2yx0nNZoqe5VKVMrl+T7F7rZr9E3YwGGoKoGQcTgQWWhdgoOHmAENs2W49tPlS8gtjJdcj9Umz8RRMv8PgTl3iG9ez/+9jwqBSxuuOBRgc1XLKLvKxM1jNfYJRr6jEu7C8Qr9vEIAr/MLM4mpRfXN6yue3S/QBLDMgROAyarvSQrckhEDSDg8+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:03:09 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 13:03:09 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, SunilKumar.Dora@windriver.com
Subject: [meta-networking][PATCH v2] dovecot: Work around clang 23 hang
Date: Sat,  5 Sep 2026 18:32:22 +0530
Message-ID: <20260905130222.941722-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e9502e-0abc-4a23-8588-08df0b4e08ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|13003099007|38350700014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QDNojGFxgGUWgGFBWuXENbbIU5sdMX9xXF7Dia5UECgbsT8+kAiLJ4O0P4g1D6bOCrawEdnOYm3/G6HwXenXZS97xV6j8vEZy9ieId4A8SKzkNLo47PaiBscizpXoz9Ui75BUlWCz4/2U3W7NtLLtndFcfRx4lbK1L9clvkc7sVmMdp2h2jkSNXVrXi+lIaAR7s0ysLySH1SnWKzNgzARerwYA2FIRLrZmCQQHZ1gYrRo9fUe8s0qYTYu5Q246mOX3dwxlypnLIirBwSMJXPs/4Jg07pa0sjsB+pMqEd0UJn63NuffLpqaTnJkNmoWFwGUFrVzbJyCUiygoNL3HM68rhUgm9vk8sJ4OrKnPIGY5ZxX2K0Jyk3sre9q7hJzV/VWg3dbxsV7wbCEdD2Ad+uVpqQ/dVWqsy51NcXEsDPe1MK8xLlpbhcgfvu264d6enrRCX5gs9l7eMKyyvGSjEd4bLpC748QzY/38APRj3yYyxAx57AzJOLZC38u2PmVfHjTJ2T1DxyQyC9oPI3aus9lyNIsLt7OtfdtrXfI8js08mqbg6CS7tfeAmMRwNt7aAskIxaxXWAyb5sVrLY8eQR6V1SMK4iXHQVBv9l+IhD/qHHYRZ65xviZ7NF0zVImOYtbnDI6DGX3gXs2QQ0BlujaNujsj2r8deuj3WAfAgeacuH98Z8TXuPeEWvhOzoVr33lHTV0oEfRPXbQqXFdyoqLKrR95MXmLnVuwE+UpL9E0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(13003099007)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Vba058BabMi6P4+b6rYyOo+NQTmcajZROKg9GKQOpdb0e4lRqZ+jET/9USh?=
 =?us-ascii?Q?bNRFlvn9mKEdJ4KQckHWynETx50WdT93jQKKgIY1NsRqFtKAyx+DvVXCu2cw?=
 =?us-ascii?Q?u+JyhC6oxC2lhByojrzP3eYBufPHnV0UJtNTvMo+oeIhph2lE5UOdPS8xOdQ?=
 =?us-ascii?Q?SHvEAhGJUfi/d9C/XeJoQ5COc9VVdIZMkhJEoWmQiaeT24WaEFcMQzKGgWou?=
 =?us-ascii?Q?Wiwa5I8JsGxIpZ517lrrInXfk2AKMaIkzqvMusZMwkZB86DeC4b4Bacs+BDh?=
 =?us-ascii?Q?MNSjqN/NunstEp+M/k45LKZOaoejbTsP8J8jq8YVgMFSf18ikL/EaGML9L0u?=
 =?us-ascii?Q?RAw7SrioWICyAyvsb9Sfa57SZBZXMVB9e1MG1lL6Cf3WNS4GDX741PbPTuY1?=
 =?us-ascii?Q?ZLaGS42CWKJiwHMI/fiz0IvvCSqHN9VYNovSqs2EguL+c/JM1arSjD77/pyK?=
 =?us-ascii?Q?ojwfBoOQfyZGr1sbalTlOMv47xriefAR6fwPKlLo07JFUkTYqy2Yv5tBe8zb?=
 =?us-ascii?Q?jKI938K0UU5keW/0puAW9CQJzsWKxK5i08Ds+DaO/G+2SB7pHPEuIVj+1En2?=
 =?us-ascii?Q?buLgcvz4xajgoWoUXI+TNgqQBqdt5GsJXqoHPlA/Cs7UexYfJsNcsDHqmmBF?=
 =?us-ascii?Q?hgDWZd8OJ3XdDOyJ8BYASJl3YP8aOOCQ9HjVtCn/KN0Pqe1QyBs+jN9csiIr?=
 =?us-ascii?Q?/SBBgsL2z0tgyzXiUt1TD3o4gOyYxMzic5jqPpGg/ypYPyBDzOlW/Vj+oO5E?=
 =?us-ascii?Q?0WzJWPoMRfA/lgS/mMLxTjvVTdSGS5CbT8puxEW1YHbbFCQ9OBaeagqvV5CB?=
 =?us-ascii?Q?JYua488iwGp2wisNUh5zcxqvDqjH6GB4HkQpMXlqoNBUXF5j63HQvdnuh95J?=
 =?us-ascii?Q?syTVOdfZw3syALto9Eg6fn2WDWLlZxvECt1HNBtKdwnt5PTnfLv4oT9v/7jw?=
 =?us-ascii?Q?8HBMfxhRzXn4Fln/LyZ37uFhi4tvyT/vPJJyboHbAs5abKpwbMhWZG97AgP9?=
 =?us-ascii?Q?A+uTBDaZ0/cBqM22199ZO7X9H46YJQjMeMtt9geiV+Tb6miReWS9dnZ+Q7wu?=
 =?us-ascii?Q?lUNd+dS6reXPUCKzfaNUG/mtVUyMjLzLv9q6Yd6SYRDMg2gFBdX60EUNggEt?=
 =?us-ascii?Q?/c+po9O6AlcglgnPDxYCCCZaHjD6H59wrcSGcw7mjvsZbcTV2XCT4j0a/7Ms?=
 =?us-ascii?Q?Oi5KXAWzbsSJYnhWo19Ax2U6qwzpyVQoP54pBE3TPCwxaVN3KWk0I9l0bS+h?=
 =?us-ascii?Q?iE9xjJBoASnpnSbdvuFjSX9miEOWi1D8O7qRGnAko/hGFhUbr/xJfeDhhPGQ?=
 =?us-ascii?Q?LwpBAcAO2NZyGnn+/1Ovs8GGd2aPdY8Yfzpd4ljkzY6012hZqiX6f8h5qqC8?=
 =?us-ascii?Q?MDJaWw6uLFYqw9wKPlY3saW561STBNDdT8O/ImISuoq52jqUBo12pgmYtxOL?=
 =?us-ascii?Q?5wxGCGiBNwRjk3tVSLnBJ4CaAyl14PjbvtIQ6owEPOFlKwfqu7+KsF5h+7v/?=
 =?us-ascii?Q?uFGqeuyjxfr4Q7wqmqdR/fMimEl+3O8wAWCi5SCWv07OFp8USzShjPw4Y5HV?=
 =?us-ascii?Q?1XZVhOlZU7ecV3jTpMxOqvVOAH5AG2MgmLgvOdy7EQwxp9BaIMOE6sOC0Zfe?=
 =?us-ascii?Q?WxRSrRb1l83kY96j6yS/tAvcC3Cf/GoBt5Hl8Mf0FG2ZTn0rJo0TcCbvmufZ?=
 =?us-ascii?Q?boQNKUHNNbxp75sN3cWXSSv0QG51gRWN3o57PAtg5IiJKPyDQOPmTjN5OZtG?=
 =?us-ascii?Q?/xMezZCFxjv32kscCJlp8EfWaWSIGME=3D?=
X-Exchange-RoutingPolicyChecked: 
	RErysYKvWub/GtmljcO+5S++TC/bZgA6MM6NYOU4EOy/EndK9N2SwU+6jVZWejTok28TJUp37rzcENyCumpw+1oIMDZiRkWVwq5EVx+4S9gwrkdl39qTISOiN+dJQgNHhtWcIUVFwKlJcyy399BsT9gnoKdETofbFECjeeLX5plSpznT6WiCb5aTlyVaoEoGAtk+jsXBjJ5yBAHu98I484wpTBS0xnOz9tYV/HRL9k5qhEZBabMPbZ0mcPnBLQ9UIdd6vWgKLBo7WAzskRsx+X0tMTrS/4V/B9hEh3HJcyuo6KWxIKur71nbTfBKMhwZEODEDcknwAhDYPGGt+3pjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e9502e-0abc-4a23-8588-08df0b4e08ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:03:09.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbIF4cC0GhugLd3XlhT/WsouapPjzPLYvlbj2RF+f8yHdtS0+pbJvgmpXcsMAi+iZGcX9ZFWZopNuYPeRrNLApxMcwi5LBdGL7ud4KWailM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Bw3pdB0f1tONIwan_9YxY3xCEzPIrG-I
X-Authority-Analysis: v=2.4 cv=BrStB4X5 c=1 sm=1 tr=0 ts=6a9c1311 cx=c_pps
 a=9FtWz6uTepfq9RxXq+Llww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=0ZDDGdkDORLqsiviipoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: B7L19uAPtzHxht7LGMVP02z275dAcklV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0MSBTYWx0ZWRfXxGf7yj0geWNV
 aFZbi9EJOETjB64GcYV76GHsFwBC0m/ZLNaqb/whNpj7pOy/x4sYXsdhI0CYHMFQ7CZhktsfmrL
 331VktPSKsIQswjs4mYbIPfXEyNoJxjteMy+cNN6uEZs1+8vUjeER+PMZlvH++fXo4zLUbiOa/M
 8Yk/m+ZiMJAAwfcIcqAFprhmD+84ENR3PvzxqJJRmo8m6C4Rwr48hCz7B+ojg6lTc2Q4Jsuug+d
 ppRfuRO8ct73WZ9Kz7h1dVlsL2HpLHRE7keLhfEB0Iz/15PSNzJubrrIrGvho8bCy8wxpXzixDP
 WKBhYREr/6MXoucCQhUtt8TGAbO435QrLo3M9RcYiCR5akbD9YclHAplHkaPjRBpiOwv153cmLP
 RGEuzl/tEThBAW8QMLjvIypXCG9tr4vutr4yWKD76WJ3P1QQetb0lQoxp5VVs+ZfOcL1n/1s/cf
 eWE7zxlmc/wbG5uGxnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0MSBTYWx0ZWRfX4sb8Yb4CAC04
 dtyVk2MYqU8mK1ZnXgdqlhRZuniBnzCnvFiDnEoRgAHfRRt0F3lH/ousyWlrie1fLdE2A4Wu7CG
 dddlbLXCQNaio6nVinu781OoDhvxKpXaKPPBgur15L0OF4OHDhPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050141
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 13:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129776

From: Khem Raj <raj.khem@gmail.com>

clang 23 enables DFAJumpThreading by default and takes over 90
minutes on the switch based state machine loops in the lib-json
tests, where clang 22 needs under a second. Reported upstream with a
bisect and reduced testcase:
https://github.com/llvm/llvm-project/issues/221391

Disable just that pass for clang builds until the fix lands. gcc
builds are not affected.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
  v2: disable DFAJumpThreading instead of LSR (bisected root cause,
  keeps LSR enabled); https://github.com/llvm/llvm-project/issues/221391

 meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
index 2f4981bee1..993453eaa3 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
@@ -20,6 +20,9 @@ SRC_URI[sha256sum] = "868c2686a61b5f8e00a3e4721789b1ab46e6528fd773a5fbed07a6ecba
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+# clang 23 takes hours to compile the lib-json tests, drop when
+# https://github.com/llvm/llvm-project/issues/221391 is fixed
+CFLAGS:append:toolchain-clang = " -mllvm -enable-dfa-jump-thread=false"
 LDFLAGS += "-ltirpc"
 
 inherit autotools pkgconfig systemd useradd gettext multilib_header
-- 
2.43.0


