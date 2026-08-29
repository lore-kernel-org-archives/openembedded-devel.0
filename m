Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A5FC61DDC
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 06:05:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2394.1787983545068506371
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 23:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mWJjY6SF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370158628d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T5bV092099054
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 23:05:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=A4xcHs4Y2jx0VphxhU2TouCfEri4MOXUAQmebCM84P8=; b=
	mWJjY6SFtCU/mTw964PMWbTjnxaHhHczgA1gLkuPOYWmTPqujdrQ1H723IPlpsWX
	GtdLBToBR5JHgdjUIG5COJZK69Af38KbpaHGbuQprT330zNTIMdXrAQk0IaK1bar
	mk2FFwwrmQCMv5/LqDjlrher16ocMVQMMHZTLjmMU1BKky9TneY3zr4CXYM399AM
	o+B67qwiVAYuKFT/Ei3gTkovReJYafgSNQvaopwkvjmCc3LtvYMgkxi/yzshseUu
	9IB03migXMHmdcMc3BwmvD5gId9HqaMJd4Subctt9eULcQlRj3B+okWPbXQSjA+x
	My7KI50EDXU7f+M3aLeNiQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gaay2kmka-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 23:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiiZ4CirsUy1GBMV7EwbdGTGoedqHZd5N4hu7dkEInhheA/oUcR92JE6Xm6YpPkgLHrbsKDxX6OINyvLH3bHv2qjRVM0cRTLriguJ6zS1IX2ramKsW6isEDIUB6cK9wx81mg+ldzMHMpOPOMtbq3l+UmGtlL4GF+HHqV304M96SKWhjrtRRQ+E58Wj1PX5fBJ7/V5P0zQHnZMnGRxSk64DDM9d8CV1haaKw/KddDDfGx3E6V4pRH3A5EQ8YsiYSrJ7pd+bwZ2BwiTggtn/y8ddSi4E8fcegidXyFhXg0hJFE8DwM0oC+lWhQyEp36IP56aC5IxKsKPuASOWJ4QvVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4xcHs4Y2jx0VphxhU2TouCfEri4MOXUAQmebCM84P8=;
 b=ZuCPL2aUdfVf6aO8qIOD6q6RIq1XhQzMp+crI1qO+1e4rlBqhwHolfV0oAJ6YmeN3jrkaKfTRZxl+L+DkB5tmjAyNk5jqBS7b1aKxO17wdxJnynJQLbVNBr89nkGyNMmXPiMjBbT0eKGPM8Kp6c6Z+ci4VILI4wZscsfWVE9CkEQPmGpIOksoJj6GWtI0Df4hoMTsttj1110iMim+1CBmgsz6wfW2SCsKZjuC8pl8pa8WQuATR88tkOmkAGhqeSeUbahyqIJLuT0SeiXfEBccmqAJBbtIPF1CYhzV5Z/tGmWsruTnmdCGdiIRaVYjIHIpEvNb8d4+Af/CTz9WPyAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PPF0A1E7F360.namprd11.prod.outlook.com (2603:10b6:f:fc02::504) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 06:05:42 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 06:05:42 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, deepesh.varatharajan@windriver.com,
        sundeep.kokkonda@windriver.com
Subject: [meta-oe][PATCH 1/2] castxml: Fix build with LLVM 23
Date: Sat, 29 Aug 2026 11:35:19 +0530
Message-ID: <20260829060520.2905173-2-sunilkumar.dora@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f267f31-a28f-4fae-ed8f-08df05938e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PQtejedcgmyYS7XtxqHo7CzJYrIBb+wTAEYxi+lWz2E7fOVBRoO/7T9mb3LSgP6Mpbf+6YD2tN4b6Iepbi/jb/y4fFUhS2K3GJR6twkqrl4pQBhsj59imutSE8uPkE/UmGawFsZA4M0hlZxf6T9zGLQ+D2iILhPCTELp3w/LLLdO8bY47uVhXb/UaMKz0Hlx/LITw0ltLuz/leiXWU62g2OUfr8e6+cbshp67f+aNOc3hLRyTecUZx2THgNWWQD1F6cS6bPZ3VK21CRmg/xGC9EjG+imri+T2M5+bqBcXqr5/gkpN3XHx2dxQteeV7Iv2C/rs1En2THX4lNTFTx/1rZCurSGQwll8A9WMsQznAPgW/K9Z/J+Yd2PHRTZkqWoQJwMk38bSAB/iPprLA+zY3op6slJmRVSTINARm38xG1iWWVfb72cRxfRLP0lPxjnEC0HsKRnp3OEm1/06x9s9DB6Pyv4OnZ70TU0tphRzjZ5jZIgplleUj4WHd5VBUN5XYar3QRKSuG+NY/oC3owk/QCHv/cH9aW1MiCgU/MFAjI0u5H0STup9TCdnj3LCMSQwy37kRTt9Zl3NfAtWsUX5UXAP6Ap+bDtpLMFujC2ys7Vg/G3KGFwi77Db1fNOGw+8n3xNZM90ClbkyuRWgz7242nTcbedHlQSWuFpzucT4awXaPOcgot/nxH+wF8NtUc1GMuSUrUORAFF5m7QTgw97UltkwiUO/3WJF7slJWyE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nvqdO4G1R9QeiNw+zgUOLsk1WnR+dyslr86lWTzTlyHx7gNJHkaO/bLk9383?=
 =?us-ascii?Q?Iy7cKTMq9sZ9EfaBezmpMUj4P0WFvYNBHSg1rj+QyB7SM7Ngi6qDdIL29Lwa?=
 =?us-ascii?Q?cdp/ukGQivztkhKH20QzdmH5NJHUJSotnGnejD1kwJE0PjMdmHsCGa5HKl85?=
 =?us-ascii?Q?wVum1gSXdwcDLgTEV7Lcq9azQQIwYBeMZDU2od1Q5wfV2YjzcDMkRq43ENop?=
 =?us-ascii?Q?MNr9a/rdm1FudOb7emT1lcaJ0sYaKwTcOI0OjuKrpItoozrRxOwblZehvD4b?=
 =?us-ascii?Q?LkLVJuffvo+X6yxCvTYz+k51lSJc7jcR9T8Gn+HLrTWEKnrnj0C1Ui0GHaFs?=
 =?us-ascii?Q?mQk4/u4Ve15L1R1QMui6CY73Lghx4IVg4KJ7sxa/8MlRLrgwCbCo+O6tB1WA?=
 =?us-ascii?Q?oyfL8/HmIXZiCKyzQ+mRV0BQzLGqwOhlf7PWZkOjTynf2qL328I7wHhWKdkg?=
 =?us-ascii?Q?KI3rsT9A80j1TKKuhLsO58QT3J2PcOmWgm9QUdSHCsNAzEmuFQkpCFeylhma?=
 =?us-ascii?Q?kHmN4vE2SYyV06ZB/a9EU+HQ7o9KK7f9y1Ylp1jlKNVtwXgMnWbEbhfa2XI2?=
 =?us-ascii?Q?VWt1o2/EYwW9f8z0LsatMncMY+CqRTRwIuszZTBlriT7Qlg0/HPem77UsX5z?=
 =?us-ascii?Q?juL4eZpaLvW0vbaY7RUKH73caFvQgoDxhWSXwBOAxgDzHBCMoE+d4hqEJdHp?=
 =?us-ascii?Q?hTdBPh3j513uE9SRlFng+EptmkE+XaQ6dNGR3ZXFw9OQsAMJ9RYh5c/BZm38?=
 =?us-ascii?Q?8mLLtA2AjG1mIxUueHcJ4ebU8GLIbL1QmUi5oK/OL31YKc0pSX1ZdrYR19nS?=
 =?us-ascii?Q?EGLic+cS7B74RtQ0avX9LglRJvjClZ0Ohz+4hBNshWDgSoXGXO1FkztpJ8C3?=
 =?us-ascii?Q?dxl2lPDCmUwUmoA2/lkWogEpck88DCHIYfWnkLFjTA+giheklWXErehXDp1r?=
 =?us-ascii?Q?6fPV/SYVBQcPkXEjt0Z6sVeEOdZJEDnRrz0Dth93IHUTGoU3Jx2SEz/UAcCX?=
 =?us-ascii?Q?6tKKkwlOoER7Qm8y/eWSy5shQratT50iuR09tN3czHPxOvY0PC77JS1POyf/?=
 =?us-ascii?Q?XpXrqhu1kFvNYikIszNsHK5wBkEtGoIqe2nDgXyRnP3Us99hHUh67rWxTWuy?=
 =?us-ascii?Q?xt2h9pA/b97tVt4ZGX/UMm2AVO55G+qDL3GbiFVf3wRuXvzZLVgmShN4j1HD?=
 =?us-ascii?Q?+xLweivzvTaxvKXISX3qMU6sCU1ZLTm8GAnGRA/k/dBZZxIpsMIFzWIptf2G?=
 =?us-ascii?Q?Wx4ziBFbvmKmtoMQlT1PgkyH+HCyGVUD7zIrgP2AHAm4EtV0SPxiPwue5sKl?=
 =?us-ascii?Q?iLm+wsVJOT74XMWSOXR4N3jlT+3xftdAfcq26SCKGcMDc/WIJoB7x8p5Hp+l?=
 =?us-ascii?Q?/rKZb2Q5eSI4HfwC0sZJBMD05wNyb87BHJidJM/HNReQxZgPUzKjYqRobFt5?=
 =?us-ascii?Q?m/slylll01aY9tUWR/PNbBKpqiRxSnhJV9VfEhxCYfZvwV+q/cSyjLUWV61U?=
 =?us-ascii?Q?tUgmrjMOUovX61GFQbhKRIBfjUPRHEhApdjCRgVnHaRYr4V0PgXfKaBkBQ5a?=
 =?us-ascii?Q?IvKMAd3Yghlr6NdcTYcT1WKKdmNhAlYhhXcX1v8JrcZ/8vcMPa05tBTP/09p?=
 =?us-ascii?Q?FvvOUfcnG2+RfjghMB1Lp0+d/LAQc85zMiX9A5t6Qgo5BE2im0moQr002I+h?=
 =?us-ascii?Q?IQiJfKEv8WJyFhlhgnSJRF6su4hzJpmluwDOzEiAinfAE0LDtBKmUyb0aMOc?=
 =?us-ascii?Q?Pqm9bnTDcmtWypFHSrSh8HPuRuI5kU0=3D?=
X-Exchange-RoutingPolicyChecked: 
	c0X9ms0EApygt8NKQJ75IMytCc9FOATBOO9n2hPWPFlXt9di0eGx9KqIq0GxIJj/mL/0ctFSC51XM/QzLN6lE+SdA4nE6XohQoMlUSCKiKBhtvsRSmKd792yWevJR5v/84sNu/GJLHjssmAe3V1s7NDRoRqjWT0AQhxFRo/wgrdxpf03RG1RqjH6FFVes99VDicSmcFjgf80koSdOcZkQ7dOoDe6wCg6mfemGUTGCZwc39YJ9qtZ4gll5nZ5nln68IeFK0v87HccuZSpLe93BckbVpGBh2/lKasqPyEnYQs+36QRk5NbbYaP38bl2mndOjtubPpmFaLFWOg/Q6QP7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f267f31-a28f-4fae-ed8f-08df05938e9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 06:05:42.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSC47JZt5LvFTdd36+UYuPysG7+L1P1Yupu82ymk4Nbr8wcevzZlf3Tw0rG1Oqe4HQeRiz1RiOwzUy3Mcuvq2APB61tFXWZDzLxP1+8Ygh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF0A1E7F360
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EKU2FVZC c=1 sm=1 tr=0 ts=6a9276b8 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Ud-fGmwBAAAA:8 a=8GuZ-LXxMotbrM9KSk4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=H0_BfbLtyfsadj6IJfz3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfX3TlrV/2QJGf7
 z2rNok4+qXjUMbABxrcEgp4KXlfWDkMZX+gri2O2igccowOtXmdmPUpoZFY7wtSs9NYZjeC9dYv
 I0JzZE/YZgXec5inmUOfbc1nox5TXVgsx6ylVW+rhzpgKNGAaeqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfX2naVb36WbvbG
 YRrsxlQN95y3oP2bb5gCbIgpNNeisqukv9RJkeVlERxymfYPIWtnm1E67KBzlT/xoQrWp9VSo0V
 rIhYW0Sc08neQ0P/NnRKZHj/U4muiW9c9dbsjxsWXrVGXfzUFXW2OD2bhEnpFe7BBJgTL81ylnb
 kTBykUQiVFQZFJXtQi/exgLGRx8qshncL6IL+D6Tqivsbli31QEliD7tKEp5zbyFTZC3tETnj6x
 WASW72mv1qgpDIfEwY+X1FVIAvJbwQCuMWxyOkVE4i+xh8DK2fkNd4ieJ4yFITc/DGHTdpLok/c
 F9eTDxYZ25vK/ZwLPXGg84T/1UBoxT6kptB6hXhFgaOobtmz+jveDZgsTEgJgTaZr3tQi6rWWyY
 6/fWQHOH+pgXEiDrhhyUl0U+EWL/2ue4qkAvso8fVFgpTydeExuBq4iLsof7J81kxuD+w4ENDVk
 a1oWY7NlCSy5gKFttcA==
X-Proofpoint-ORIG-GUID: ZrUWZEsPQufw61IzMvJj8oHkj2wrGI4L
X-Proofpoint-GUID: ftGjs7gPT5Lei9qfEMBrWGOE02Zh_PKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 06:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129577

From: Sunil Dora <sunilkumar.dora@windriver.com>

Clang 23 renamed ASTContext::getRawCommentForDeclNoCache to
getRawCommentNoCache, so castxml no longer builds:

  src/Output.cxx:1976:47: error: 'const class clang::ASTContext' has no
  member named 'getRawCommentForDeclNoCache'; did you mean
  'getRawCommentNoCache'?

Backport the upstream fix. It is guarded on LLVM_VERSION_MAJOR so older
Clang keeps working. There is no release carrying it yet; v0.7.0 is
still the newest tag.

Co-authored-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../castxml/0001-Port-to-LLVM-Clang-23.patch  | 36 +++++++++++++++++++
 .../recipes-devtools/castxml/castxml_0.7.0.bb |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch

diff --git a/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch b/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch
new file mode 100644
index 0000000000..9caabdcf2a
--- /dev/null
+++ b/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch
@@ -0,0 +1,36 @@
+From 315fbacc4e4b9c7ea21d25ad489a90b73a526326 Mon Sep 17 00:00:00 2001
+From: Brad King <brad.king@kitware.com>
+Date: Wed, 10 Jun 2026 10:55:10 -0400
+Subject: [PATCH] Port to LLVM/Clang Git main as of 2026-10-10 (6f47b6de08)
+
+Upstream-Status: Backport [https://github.com/CastXML/CastXML/commit/315fbacc4e4b]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ src/Output.cxx | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/Output.cxx b/src/Output.cxx
+index bb986d4b..9f722efd 100644
+--- a/src/Output.cxx
++++ b/src/Output.cxx
+@@ -119,6 +119,10 @@ clang::NestedNameSpecifier const& deref(NestedNameSpecifier const& nns)
+ #  define isPureVirtual isPure
+ #endif
+ 
++#if LLVM_VERSION_MAJOR < 23
++#  define getRawCommentNoCache getRawCommentForDeclNoCache
++#endif
++
+ class ASTVisitorBase
+ {
+ protected:
+@@ -1973,7 +1977,7 @@ void ASTVisitor::PrintCommentAttribute(clang::Decl const* d,
+   if (!this->Opts.CastXml) {
+     return;
+   }
+-  if (clang::RawComment const* rc = this->CTX.getRawCommentForDeclNoCache(d)) {
++  if (clang::RawComment const* rc = this->CTX.getRawCommentNoCache(d)) {
+     unsigned int index = ++this->CommentCount;
+     CommentEntry e = { index, rc, dn };
+     this->CommentQueue.push(e);
diff --git a/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb b/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
index 43eeeeace7..d052f56320 100644
--- a/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
+++ b/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
@@ -3,7 +3,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "2d52b47cfd88b703d3247f77bb7c3ad7372bc9cb"
-SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV} \
+           file://0001-Port-to-LLVM-Clang-23.patch \
+           "
 
 DEPENDS = "clang"
 
-- 
2.43.0


