Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26CCC61DD7
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 06:05:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2276.1787983546510409122
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 23:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gxRjOkwW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370158628d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T5sOYL2409433
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 23:05:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Kb5T8161vP9OOMJSXQruh0C3jt7b8zkO397nSkTAXig=; b=
	gxRjOkwWY4hNCfJ9VaFUwpDl/z1DyRKC8Exu5ZermccyG7MupZgk1pva2CATPPO4
	pZJy6tnFaf+YWZhyb1+s6eMPZwCzLnahX9Qvq2iqf5eD7nNGhPrIP9I63JkdLWi8
	4M/qcLwcQDw7e8Mcx0sKRICVuWR7jRAddYLrZxDO43BTU+mqjd05cyewiPAZtP38
	vCoimSkfLFpbg0pcT+MWrxnqeLyRuds4aJYglsEkvFL0N5YU5otAFuaw3VblZcpf
	8GCFs8wSmBkNYfbqa2zssr7lEQaV9nDS1y/vmFAlSuq4i4qHhSDfhJGg1Cjjrrkm
	PBh2RGo7Xt1AqQlVdh0iZg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023136.outbound.protection.outlook.com [40.93.201.136])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gaawdbkss-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 23:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9T/cibFD2vMH3L2cwkMs/O+foJZ1xZUpoTHch+T9nFVawTShZLF9T+ll1awhLyyB7gCk4k6Trsyi3/gxuK/QUfvs8zTrIuHzCWJv01MvoDuU5JZoSzX+hakMhjk49YG93vA9em4VNXc1FfVqq8A/YDLSL+i55sTbdA+k0HUbb+8o+4gHd6tv3mPQBi0yxwiDyayXg1isd39aVVUR+ZzllBxD3TCfu4t25v7n8w5YUMg/9/M1/f+8a5oXGQFlk1QJ2HdahbQ7XU3lQH9aKixYcyHcs8gu8QA72ca0tes1LGhat1rOpUvzpj0AX9dIS6m59qJW63XHNlGMp9/5o++LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb5T8161vP9OOMJSXQruh0C3jt7b8zkO397nSkTAXig=;
 b=De6TRvBcpTFXKv9eXwtzsQ+qfmYQPMT9GKaPJ4dKHoQ5iBB5In3dEVadTDAJIR+SlXW21om6x0T0RSMnxTjKOg3riTDrRAMSHBZ+T4MHEL2Wr/I83cFMMQ6/zbZU5geC4L7RIJn1USMqKuqkQBDCw7JSgiIIHTOiaWbluaQHVa3OcN20BHzPS0a72q8/gh7VlFn/fhQPWcxItqQUiBSEcvpXwoxfGHWI5sgThxEmiN1xkctGVUY6D02FzyBfez+fr0VTxyN1Cj+8AKgRxVXX/znxn5czehdrzNBDogbQ6tb0uwQ68XGPpqhaEBRpeuHzpCQGd32GiuiTp3E/5UwPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PPF0A1E7F360.namprd11.prod.outlook.com (2603:10b6:f:fc02::504) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 06:05:44 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 06:05:44 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, deepesh.varatharajan@windriver.com,
        sundeep.kokkonda@windriver.com
Subject: [meta-oe][PATCH 2/2] bcc: Fix build with LLVM 23
Date: Sat, 29 Aug 2026 11:35:20 +0530
Message-ID: <20260829060520.2905173-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829060520.2905173-1-sunilkumar.dora@windriver.com>
References: <20260829060520.2905173-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PPF0A1E7F360:EE_
X-MS-Office365-Filtering-Correlation-Id: b3419ade-34f5-4c53-69c0-08df05938fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8NirTZ71xC7QSwmqEKUpgPlG5cORCdPDNUXL0RLo9gH1LpD1diNN2Bc3CzTcCpDhKI04TQFXfJRYwNtvaIckQ1VfpklWKyuap3zn9+8vHBdrY/il4pwtzlB/I67J7BzYZhdckN/cdy+EO3CQQUFlMY6teWM6rzv0jF23iOSUzHKoqGnhw985kGAgPIhc6cUt8umSSOscecmup3YSjSM1F4VomYyeZKK3J7+wXdpsawZB0Enz0aYlux7CYc4n5zTZY5huNEWUpWGxw3xQyiTg8JOQUTIpRRYjJVyG4yCK+jkhQXO4s6L4FOnFKhT9Nyhj1g3gfvWu939i/6gQgrKPxBpLMwr2x55ArEpKph0g74k+un+OpuO1TU6soOHqwnkYpsZhzBh1pkwcUx59jX8jbXZIeTdhRZYjb6EpI8ELdJUenPhijbpnJklMgGgVjSoDwDHtsf7/HOx3zGLBFCka71Vh1qXqI9PhE5htTlBn9pOd8Do5zsLc/tIwcKE6HlEnus+IF4hG3HbVViYFDxJcU8kwL00Kcx9ZgRniEw6DA6SAG6lohl/3A6ZtWXRg0IUfCP1oq5S5Ucp+Frh2HXRXnONEMnlZBl/LWvE7IhMbmVPICv/TVcpQzO1IoJDOzK0hgprMx9abQEet8dIYUoaCTPNEg4GFWHyAbZ6dXudp6m80Hmccx22y9Rt+CaznO9Q+QBKhcYd0bJq0dXfrzQ0S5ziVgxvXi+wfNGtkYREqC5I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VacF4qjm+TKu0ptyFuAkxYQCqZk3gnG1u0KGrJXGvZ5IYufF5dS1ixNZc4i5?=
 =?us-ascii?Q?J/Z0Brlyrvue92CShNPNAax1F6WpC6nGec7FZ/sGjzPeA/GPq78PzqeSl8si?=
 =?us-ascii?Q?GJyY1YfATYLGfhbdeW866mDD+xfURPeL6i7nIMuG6KmOlSAqBEubwSrEeqht?=
 =?us-ascii?Q?Xnpr+Nk14+FFRYeOcPXw1ueXrSJHkL7CZExalnlhdTfTwjHRM2y09rWBHMlE?=
 =?us-ascii?Q?6Cfz1Ja0KhabCrcI9qYWCSyQn13XB/rEb+/St+SV+iNahm41gq6W6plL/6mn?=
 =?us-ascii?Q?kgOjvxAPi/hi9DF+BgZrfZWYz2G+Kt01NBeVYB52zLvaD9NXcbHYRzYRkdKk?=
 =?us-ascii?Q?hWFX7NOvUiwknxXYqj2ExjzAxRK3Q3dEaX8YZagIaRSYmCwwSG/3E3zM4tKe?=
 =?us-ascii?Q?W5hPp5sfq6VL11dJNBJuTjiCXvx/Sf1Nnq40HV/ttCOjiTFQulf3x87QQKmb?=
 =?us-ascii?Q?AmKwEhEXQb9/pmzcspERxe8Kl/PK9zlf84sTbyL/XdTHL5iLjrX2BL0qqQ6n?=
 =?us-ascii?Q?AjBUyPw00+30m0VLkQPg+pX3gZiPs3UrsNMRSWYDoymuMztT8SLAVVnmwaC5?=
 =?us-ascii?Q?KAWzd8Le1Swn0Z+Sitx27BvgWgAsjwZcDcBHj8izNdQ4McNY64YZ4jPILtDz?=
 =?us-ascii?Q?5m8buupv2TVoRKLnk04gFUsoj2eYjME7iXqdKh94lkBtzi5VsofK4LqqYmt+?=
 =?us-ascii?Q?CP07DC7nJwV2MJCuu1Ry/1XQ/IRiM83ro3BoakHAoQ1OqG3iThF2P9TP8Bal?=
 =?us-ascii?Q?uLYXzzaCU02GZizFHrBG1klwL+w34Nbpvm/SpLF7iVOeB2VfTBIRsBeMtMsG?=
 =?us-ascii?Q?PajjF81jkf1iT3jMqLxWwxlgSmRkQ4hROvXaYboZiYZUhYyXNeeBfZRFVWhG?=
 =?us-ascii?Q?QCMscdAluBDyB62E6uBhAPLRmBMFxG8H7w8rPpDKOUBZV22m6dcJrow9tQbh?=
 =?us-ascii?Q?zyDhbDOVt8I4uCKPAwYplrfKrTNAYBey/X2eodtGjH6UG7EQsvAGN8rYd8Yz?=
 =?us-ascii?Q?/uNenFU1gE3Sm2/A07l7fl4Uq3erZ1xpZu6OlDO8iHaNJbq179tki+vEkwNV?=
 =?us-ascii?Q?BygDI+VZSUAsKX0VL5KxAk1XoIi0qi0xV0PdEQyQN5d2n70GIk0LaYjABY12?=
 =?us-ascii?Q?OyYdj3NtId9I9oB1wGJdo0drGoAnCvBheOpyaGJVvJvQI0MRiKHzDBW515lV?=
 =?us-ascii?Q?6WLQpIoDzrxZrDczSQuphejtmhJ6u7j8tUEg3OUhnDQiiuRWETDdID2XTPOA?=
 =?us-ascii?Q?ZIrxeb2lyVLiDnf1mUvpMX33wOXxS7b3VrHF3hkVyveebeurcemOIfogFedR?=
 =?us-ascii?Q?1suk5QVcbODMBIp8wNF5Ur8I+LDAZ+NlzhWw24herdw53OUprWemqIb7VzuU?=
 =?us-ascii?Q?5MGV3Fu+uZPNxaY+0I1Hp7y/G3IQr9z9f9wVhlEl423ndrScWgeex8X9xtU5?=
 =?us-ascii?Q?Xs4bV3taTg3WYmgUvLd4O4OdUK/hCjGhoL3taVyyM2dgfJ660VMsmTZMFAxr?=
 =?us-ascii?Q?4+GKTZJ9gVCS2FZxzRNLJLFgwlFyBWe1d7fyt1Ojso87adFHS6+RgDilJebX?=
 =?us-ascii?Q?coAZQxcaO5N6DJwW1aOTDxgGjzKUs95BL1ohasr6kpgwgWmL0QGJyxVJwsqU?=
 =?us-ascii?Q?YUTuOSeZeLjwvYAu/OkDRmzi5il27qIY9ry3THMQy+NEoEqmBtP4NMca98aV?=
 =?us-ascii?Q?QwM7flwLpIsrA4s/IOJw6VKEF61BNxuyRR/LmlBwQyF4ACnwR8ausYC5NU2c?=
 =?us-ascii?Q?cvLKM0ySf2hsEH3t9oeKCtdB9Awue6A=3D?=
X-Exchange-RoutingPolicyChecked: 
	p/KYlELZoc4OmOU9mTOyzXby9qCCOOEcluMjT7QbbxCrRpzzzsdxyYJ8++7f5Y3Qn1dw4DEUK0O8sQbYjfitIA6VStRO5Z8J4HYjZ/yw/cLMs7Ab/wuc00AmqpkDikpnn+ydal0/GjCjWxU4Tj9nAedsfkuJsLZH8zid0WQcdHdqG2/uPhimTgRaqa1jn5x+QoyQkbH3AfkQWTqmuHbZBOFD4yoaqAAPlop8JiutpEElTW/dhWlyHGNUfTbHOEnZ0scfodQirZAB+wL0hOmpzVxM/Vts+yJ110WXnaRXS3icPd5R+iVUfIN7RIjXqJX6TwHZWuVz5QbLqhNp+XkG6A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3419ade-34f5-4c53-69c0-08df05938fc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 06:05:44.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmoXmaRmWsjp0j4OSCEN3vOMzpz4NoY63gg9KQC019Zf6dKDWxNKtaCeHH2e5BlTUGsh0rP5d+XoPUxZYSDsC+WYcJO48W+aeLzmwkM68XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF0A1E7F360
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfXw/H+wKTSI2UB
 BLy+RJV5gGxB9d4fqitJ9E93qr1Wh/KaB8ye1HiHDz3dqPFWOk4XojUkUD1eaeeM5i2bHtALRJP
 zTB9DvIGe84n1wk1x+/bUJoYm4dBY8GOeCTJoAM49Nke6HRj1sCX
X-Proofpoint-ORIG-GUID: eu6GIQkWts_C18_jrLZwyqC1d-bFMJlP
X-Authority-Analysis: v=2.4 cv=CcQ4Irrl c=1 sm=1 tr=0 ts=6a9276b9 cx=c_pps
 a=ppJUfaEfP5EjbsERzBeGhw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=qgMCvENN3b3JsWF2-coA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LDbRCKHhKMELs6IWb4iWXjgMOUfZM4nA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfX6oOMmq1XoTGz
 BepCP4kF2TDLosZx09wCeKDi0oFqfsd+gY29TsD5m+Ua0f4vFqxKMF6syWmlO7SiN0JRNakzaZ8
 DwyOxUspjv9QrDe7pWr4NBP0saADybLVLGEfcSf2e0nSBgYMi36CUarPiidcmWSB2nnpxzvtByi
 ZXdQ+zF3jX1yD2Red5ES71JIz3V+8XAo1V8G2YEAmLX3x4JvXS+il4+CTVu0ddreq2OyGOnxjqm
 l00/mGqCgWCBWy3x1l4xq6YMTdXH79ePf2Owdd7bnKuvcb3OLSmhYQJJDYuXWFgC3/fgSEzR8mP
 I3tgU9113+Zbs56euSnucNZYKWuC2rzgM+iyHQjBnEoAvO1Lb0cenJ2zDFdS9SxMNtHv9I4MK9z
 C7jymgQdfxfK+2Nbp3Jwxq6F1UrJMfXe8vNuEe7Bw0UWguARS4Ni9TKM4yGtOLgvu1okqCHi8MG
 kHfyc+k46RBF9x4YUlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 06:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129578

From: Sunil Dora <sunilkumar.dora@windriver.com>

LLVM 23 changed the MCContext constructor to take MCAsmInfo,
MCRegisterInfo and MCSubtargetInfo by reference rather than by pointer,
so bcc no longer builds:

  src/cc/bcc_debug.cc:151:68: error: no matching function for call to
  'llvm::MCContext::MCContext(...)'

Backport the upstream fix. It is guarded on LLVM_VERSION_MAJOR so older
Clang keeps working. There is no release carrying it yet; v0.37.0 is
still the newest tag.

Co-authored-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ix-MCContext-constructor-for-LLVM-23.patch | 36 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.37.0.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
new file mode 100644
index 0000000000..b29e85ee64
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
@@ -0,0 +1,36 @@
+From dad0db93fd0f443b2a4f43bc2f23c621c9202516 Mon Sep 17 00:00:00 2001
+From: Viktor Malik <viktor.malik@gmail.com>
+Date: Thu, 13 Aug 2026 08:22:00 +0200
+Subject: [PATCH] src/cc: Fix MCContext constructor for LLVM 23
+
+Two LLVM 23 patches [1,2] changed the MCContext constructor to take
+MCAsmInfo, MCRegisterInfo, and MCSubtargetInfo by a reference rather
+than by a pointer. Reflect the change in call of the constructor.
+
+[1] https://github.com/llvm/llvm-project/commit/13e98d834101efd1794cdd026377c508293ee21b
+[2] https://github.com/llvm/llvm-project/commit/d50631faad3003e73589528c83d3bbbad7ba72f1
+
+Upstream-Status: Backport [https://github.com/iovisor/bcc/commit/dad0db93fd0f]
+
+Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ src/cc/bcc_debug.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cc/bcc_debug.cc b/src/cc/bcc_debug.cc
+index 2e53c44d4778..0812c4abc788 100644
+--- a/src/cc/bcc_debug.cc
++++ b/src/cc/bcc_debug.cc
+@@ -148,7 +148,11 @@ void SourceDebugger::dump() {
+       T->createMCSubtargetInfo(TripleArg, "", ""));
+   MCObjectFileInfo MOFI;
+ #if LLVM_VERSION_MAJOR >= 13
++#if LLVM_VERSION_MAJOR >= 23
++  MCContext Ctx(TheTriple, *MAI, *MRI, *STI, nullptr);
++#else
+   MCContext Ctx(TheTriple, MAI.get(), MRI.get(), STI.get(), nullptr);
++#endif
+   Ctx.setObjectFileInfo(&MOFI);
+   MOFI.initMCObjectFileInfo(Ctx, false, false);
+ #else
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 9315a6e603..2d44abebb4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;lfs=0;tag
            file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
            file://0001-tests-cc-Allow-overriding-the-runtime-location-of-te.patch \
+           file://0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            "
-- 
2.43.0


