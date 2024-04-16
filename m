Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80C6C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 10:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17093.1713264322525552740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 03:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NqazfjF6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=483622ef1f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G9e2vZ032759
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 03:45:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=QvrNw9iDb4HHunW/wr
	284ER974eYN0CJnErBU84E9Js=; b=NqazfjF6WcgaeGR7bPLD6KOaLjTMiZ0TbF
	8MT60m8mm94537A07BcAy4Qbd/vvtP3W+bZ0P8xV1mD1s0K2cI97NvWp6TNVSwW3
	QwVeHt2cr968+FEsZ8gIodhGwaeS3ppxO1tDBkYn384cEAWdI8fmQF6J1PtvSSjp
	GiGXX3kC7OJuYr0TrUWphrtpN+9uUQaGhdqsXHlUgnaF+rLuKJeIkIqGbW8qzJRI
	fy4vRM6tM6dy1e0C6UPCoLqSEWd/Iocg4UQZshRG1pzS6hom+7nedolNBGtufHMA
	FjLvyv856oqC7c5Zj4vPDnyAWKK903gBqguYi1X4Ld4AEfVIGbLA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb12hqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 03:45:19 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43GAjJqk023346
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 03:45:19 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb12hqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 03:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSOOQ376Zc8plgO0u/dEo8xveOUG6OE+i3JALB6x7dtDdAtv+PNNoGWQPFFABHJd3+Y8TXw07DUw/t94ZzJ4tkOD0LO6vMHWLl9YBT4iO27cYBoIvAbO2BvxzjVHBv1IpcXJd9f9dSiXEuhKZzC7G4dklBFLLlftTT1obaCfP0IXcZG97hmRCS4aHhunKryDTxZiaEFGZaTo8FJqaN8KKSsudccNuYC3rdDUjQUp4hWEc36fnPhF5xnUzir3Ezqr485hLCdWw7qbyJmI8hymQYZ9KsdBtYWKAHzsr2QspFor3pdw1ox54Bmn8tS9MdYuDUOWqTuPN68jn7QYzvsZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvrNw9iDb4HHunW/wr284ER974eYN0CJnErBU84E9Js=;
 b=QDScfqqbgjfFclfB8lQWQ34JJn6LHQeStT1ONbgT1HZ1i8k3NavVfcd9eFHgBBGuVRdKVdwy6rccCvL1GKPySglLRqd9DDyv4iU0sdeUtTazx/6zTk6CAtMuieaCW02sZeqcvxJc9eVJbafPUfOjHdZknpRHZ4ki2HLP8xzuqnfhCKyUig4c1tXTUnkFH5fVuaYahC4dIjmSfwY5W0Hb6dghq6GxxO/Rl0Nt61Dv/12xaDnML8APfKv0UJyUS4dm4Boxk80kDpBEPiKuOG5Jzll70XgsHITs3Ph13ryINqG58ZMAU9Qf+tY0R0u5HuCt22VTIbmKjNNIvPcYcgo2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by LV8PR11MB8560.namprd11.prod.outlook.com (2603:10b6:408:1e7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 10:45:13 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 10:45:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: behzadshaheryar@gmail.com
Subject: [meta-networking][PATCH 1/2] libdaq: update to latest stable version 3.0.14
Date: Tue, 16 Apr 2024 18:45:01 +0800
Message-Id: <20240416104502.2401209-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|LV8PR11MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2796c691-1280-4e23-8787-08dc5e024ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S371QkOnxqEXReZipi0XlV3Aw/g7FgXxXKIVoxwmqsqL9V5V2NGsgnSqdJpcAkPMMoNK9Yl80z5CUYwo0IdwsybTYfzh+vOoZ+DyXVwKu/CExOysG6QO/wbhbRjiOg0zpbZwz2zjSGJcnGH15frlu7MDe1Ct7IwmGEXX2qHXMrgEvEKQxr0rotxRXkxs0pIatxG+cg0XoXlcX8lsuNA1meD8PBxGBcTJ4qxp4EGLy5fycFOf0vaSJsDs+R73hREM/J6BAo1RdYRqDoLsWE1p7EGkpTn+sOPDnKXsiqH2D9tCUrdfuTul/UvqlDqejnfS9jbQ0tB7eEIQu+6rV+DMmg1gnHMKC5jtjjyxy38BjQ5yuVwDs5RVsmyObCvMjwT/snC7Pcs3pzNDVed0VJKLoIe1hbfeQ8zSKjti47b9pl5TirD7lxUvcRuyQBi3VGZae6VMnHxscOzrwKPlD8DN1tOXSGukT77gF0yAl9txQBKLZGQdgNMMDD0BRGNu0Ab7pOzR3Lg33VuKIlPLK8p1zpfJk0gL4CF2dLtRZIgPiYRR5jUfKDHtbdvXUL1CjhbCofPzk903hqDsoYIqYksmzQQAo70DsdKfGtPd5Cgq9J93L+gx9YGuEjWeYnFzWxtx4EqJdv3MbM1WnjYurm81HIG5fkZ1/au6XBnbQBFYbKgDztholAeabgNibKs69Vzm578yf4akKo+pYUY3YIUjNrZ4izZNNDRL3q1DjDIHgwY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eBSuo+ruy74UoABWCeAb+RrCas/D7VHv7l250wul64vW0R2M+GxomK33tsJC?=
 =?us-ascii?Q?lqMVZo7QF9UxKcaLMdKKmSzqA1LQEBX7C5Otw6OPTE6+6R1WcqZY2Ve35CTr?=
 =?us-ascii?Q?pOvQN23fzz2H46E+n01yQAn2fZICm2NvKfJu+rcmQ1HjhhasKQIbskYjaBNA?=
 =?us-ascii?Q?H0WB5DxMoaz0vjppGUI2f0wOrABudBhsPUiBFAENpaQYnUpHjjvesqdGZiRC?=
 =?us-ascii?Q?Ex9vZy72E/I7tE5lii2GkN6uefmAnIAW6SQQ+APH1pCa70DdduV7mb+/TkUa?=
 =?us-ascii?Q?bNJMp0AU/l+OxGa5N5ULwCtYYglMuvbe4pV6Hl5jEWbFa1Y3L+bVQQSvwCys?=
 =?us-ascii?Q?RJFzgWFE7Y/eNgH006jyo3pUblQ8Tfbn/+85V9KYTUsNo8/3B3uPxtpeYBhk?=
 =?us-ascii?Q?zKFG0/+pfLYcRs9eQUZLmPpK0Ywa9Kd4k+M2Lk9dO4a4JY28BQQ++qYgRGRa?=
 =?us-ascii?Q?Lhk8lEjMMr+HHnUt58dkZZtQ8RSM0dLqBb8o4prJJhEunPb88w/GBWF05t1Y?=
 =?us-ascii?Q?APLxgGdnCA2PNdKZUAszvqoFLDvD6LnKkuBxGlI7KO6PGctpiWI99HIjCStA?=
 =?us-ascii?Q?AwfpwHWI7HurEIY+/dWrOJ+/nRwmTaYySUZFqR7gvrRR+HJaeL/CnKf2xjVI?=
 =?us-ascii?Q?zjedVD5/zFOBpO8ohcrFv12tkr/UEXDkZy/xoLUKFvFzeLdxvw4Q2OZd+Xi1?=
 =?us-ascii?Q?wuXTvN76lLHKjFN4eqiu1tpYVQbGSEKegIx0J0Yv+1OmcNRw8bdUkD7ZqPp8?=
 =?us-ascii?Q?rXjUB6eU1d18IHv6D/ngKYejnBs1d4BCV0V7grGiG0f0r6L4JnMrC1mRchJu?=
 =?us-ascii?Q?m4CuRRtIdzmWCawzAQ3aLETOnYd1m708+9Nx+KU3vZqczxPHt76WKXS3S08e?=
 =?us-ascii?Q?hDtnAKlMs8kJu3wGDVaXJxj+GWBMCNC63Tq9K9m/CK6RUsGg6oG+nVDqC92l?=
 =?us-ascii?Q?O7DFu5npNgk56hA7Ox3uZgAZFJgWCYz6u+Aegheoq7oiLkwhTYNxGiR5qigJ?=
 =?us-ascii?Q?WVDyun3SgUNh7UNd1fxCpTh9+7WHGE6QbadtT0L2mozMQa4MR+/vuGGCpvnF?=
 =?us-ascii?Q?lCsIlDh6T7w2MEfzzanFoSzcbACN1lT6tnavL1dlU3EXG+Ven8Y1haq9xe5b?=
 =?us-ascii?Q?i+6DTUeUOOX5RjAbBiSgpzTSdwUbG5KNLMHgZQty/dK9SeVacREA3LJoyYpQ?=
 =?us-ascii?Q?juQ9ZZ2YnePS/274FfziIvpNpY2QY7U3DuqquL+lrWKFjMAQaW7OPHeJAnWp?=
 =?us-ascii?Q?VtA8KIw9jxCn2COtyRFfa8T0jhKzsdmDcRgKzizatNpnrP2ZzTpB6aYIEg+U?=
 =?us-ascii?Q?K/D8hkAhonlzukaAWw4JJE9ysE6xLmCpA5AR8dafytzucVBu3c9Wh7TeqFSM?=
 =?us-ascii?Q?8lAmXuofYkFpBwAi9GHWAeciyXB+wpYYrLafcfztgwSWFLqClSOj2F4L4PB+?=
 =?us-ascii?Q?1/2ggDER+//anz0w4xeabXZa95q95Zl1pE+S/2hQA3K3CWZfDNreLLy11NNQ?=
 =?us-ascii?Q?IXfrWhVIYBTKTfQeMLR5GpTAfUA78NQfMwhLxmelM1sji9rFL4g8PU3I7yGp?=
 =?us-ascii?Q?kiHCVVFibJCaKl3Lo6ug69wOprWnJ+tZDKwLscby?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2796c691-1280-4e23-8787-08dc5e024ba7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 10:45:13.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z75zLG+R/xAUVihGX1svDJu3T/98k+3lRxjNZ/4YfKM3n36X+4JoAKw60oe2B3jsoVUscJbeKk6nuexEvFRyUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8560
X-Proofpoint-ORIG-GUID: aLTIkZPcta4ByKKe-TJqFdUOvbJvUVoz
X-Proofpoint-GUID: mbOy5QpJcwuNsggKjiP6qwhWrDZPRv_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109973

ChangeLog:
https://github.com/snort3/libdaq/releases/tag/v3.0.14

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../daq/{libdaq_git.bb => libdaq_3.0.14.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_git.bb => libdaq_3.0.14.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_git.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_git.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb
index 19346124b..74964e074 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_git.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.14.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
-SRCREV = "c757aaae5a70d5bbb3239c5a16bca217a5aca651"
+SRCREV = "4e68d7ba6940df9a1503599d7b177029112d6b6a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


