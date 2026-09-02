Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF00C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:12:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11385.1788351157774633857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pIGJ/3tu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3705188636=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NNkU104031
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 05:12:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+F6pEASSavFdjBDWfWZOm/ICGBKUTAc2gA0U+zHAaMs=; b=pIGJ/3tuqagF
	tX5BDpbjFgxmNir7xraznVhSn+IhiwQlqVJXOYNOpWc657vA8h46LVxYo0cs0JIL
	yWcQVgtb/nlDbd3cgfO0SpUSY6pXCfyCiQFM2ZBE+6UTb7eGV4uWyIQBuaP7W6fY
	F4/CBH5m0ImAOw48WWITzKhBHZlACFs8WcaAz58s9y04bT0e6/8aR5rTk6rMKsth
	cCp+kbh6pyIacItczX/g4FmJGsbwTgOdI247rk7ZEQAhMYJ8UNQ7QucI+8snMynV
	q+oe7/XJTYovel6cnRuP+BIZNhgBGa9cSdfTDSirozsuAXlNbL595i4CY6zyu5YM
	1VHj5UCiQw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxee3cv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 05:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aynhhu7ayDMVlPfJHEsZaTMnCAqKgVxgLQd1O1ryc4Hlzb7tnB2U6cR/4uYstLD6hauEuhCOV+Wwyq6u0IDTNBGwy6+SMh5hFYiEaIAdAZoSuoaYSAX0eRqhorp4RzVaAa19oXOkobGpvxwyY/fBhKrhYVFC6wUixd1TGajeZghjdpcuDebmsppJ+Gwhp/u4w6wSqmGMTcLmb7l8RAiHWdQJ7rYRGLtKpkQH2Sqx8ff6cSZ+Dk1Jb3jCkFY6llTVwYN6kCGK2Z0IFivAYG8Os1QWcmkbvPhGUXqldGrjN7IhLhZE1uUhjXXagfsx3y70vrLqMRT1H/JfqsixLum/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F6pEASSavFdjBDWfWZOm/ICGBKUTAc2gA0U+zHAaMs=;
 b=P69k3A+MPYksYDoyln/uYQCvEZjfwxDwKTM70tARNpvLFLfpx279g6/rM3LarTK9y2W2DVum7eDtoMvGxWruiZOVLNzG2gSNweBiAoFQGwKJ02+2X2B0Ig1A63XDpFm3+d/L9TxzWCxTsXhcTXtR0UMUCRIGDLPYj/alDFwpVV8BLWYfmCn7m9Ag/rnk3/222kgYSZKoqJfMh8UHpJ+uFojprjO8R/h1X+06mJA/yty3Ex/VWl8N112LrsjAdA89mFSbKm0O/QGEWVSMhUA/e6StUJ+WJ7tKMyTjM1fzNpZXgu1ZSDbcMzKFYaitkSOzZWiGLMeUc5fAzoz9zBr8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by CH3PR11MB8442.namprd11.prod.outlook.com
 (2603:10b6:610:1ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 12:12:33 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:12:33 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH][wrynose 1/2] openvpn: create an extra package for the dns-updown script
Date: Wed,  2 Sep 2026 17:42:07 +0530
Message-Id: <20260902121208.3587748-2-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260902121208.3587748-1-OmkarAbaji.Patil@windriver.com>
References: <20260902121208.3587748-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|CH3PR11MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 473074d4-1d11-4599-8823-08df08eb77ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mI22Qxi7C71kkqzD6/nWtsTfD85W6uzwu2iNoqfxkuXzbumzseIgaCi0ZUD0HGwXsZFPbpz0ABkUDSCFY63M6AzthbdFvL/n7sd4tlnbGLyLT0S2R2rUX6cNTuQEd4Lz6K8a6DwuZaGL+n3jL1xmWc7BlwYmvvHctgdoby2To0NXjwwCvtukEJzXgCc/XTS1Gz942hU7u74OjdlQZaoJAXUx8xgX6SjHn9lpUD673R2vkgxBzJimU1ThT+XtFMlb1tITWicoqlBZ6mQ1GA0EwEiAOGAy8ihq69QUhGd4Hjf9GQi3JUBlB5WtNG82IKkaK8F+DefApDd8p0PGhR91sDmw5iv/YrO6hG3ErDp/a5UXfzGWnzzFTF8oHcxNHQXHFWNWNMNoAT0HHGZ0hW5np4+qBcNbN6tWWta73iuzgOdOX7NPkW9pcTzCpAB6f0WW68B4edVsyewlDB9mwn+I98L0R0mtg5682oKzUb4G/AMn1A801fWTe7qYYjAf0/2Mhdw/I8HKtoVqzLZZzjfuLUEn4WzH0k7GkYiQbAMnC/6hFmVih7Pt9cKWpT5iq5mg+WysGc2wN/fAbQ9GDZhXWjWRvDcMqtSINA3LmO2a8OunMw1XPYh8xRumkeo9xPj0TLb+InB7247AYUnVXevHw2uDKrTqhfU91uoZCmp5msI5ByT+IKwxI58H0vpMwDTCtuOIwb4l06v7cuY3FyB1aaGKwmOwHnIBhde83Cayf6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RzPK7jxfiZ9uYCHzpNwBHvIJAkT6YXOtPaIib/EIANt/NoMz+3Rp8TLMxrnC?=
 =?us-ascii?Q?+iJxBedI1JuJ9tSQ6Y4lroofprUSGu77+gvxyIw84BNyrRj/fCpOuXomjniD?=
 =?us-ascii?Q?WCmo9+uaxMMkzPXBPB+Jrho31Dl5ajhiLenqlQ8A4a1TPnxOMdzDXQvFtU5a?=
 =?us-ascii?Q?2VSGOKVKwUPNVesoT7hJNS5ERfjPnMnkAGSo5QSdOS0535ESClG/Ws5owwhc?=
 =?us-ascii?Q?WQqck51Ymxqx6h3PQm07A6in2O4ZvlZTYQeiOCNyxM7xd/Furq/5DfP4xPSv?=
 =?us-ascii?Q?G3mBTUMy66JG/nVGQ7co0nMGTJ2vchIAyo5qQKadutlgmw4xQHfqvA/RjPIh?=
 =?us-ascii?Q?dSyKBwXanUvvgV/3RbQJ324wo/HVWFM4b0bUmCyANci/yDvgP0cqdd8Dyxkw?=
 =?us-ascii?Q?vWwr0K71yrt0r1wXsv1KPMMl88NiS+YixeJ019Hioz2ZztdZz0YceMgI7UIQ?=
 =?us-ascii?Q?zmoRM1OHoV8irWRDt8LfX3OQG0QDLSzArbThjdfsZvxAnEC+7DcOOkSZXwFu?=
 =?us-ascii?Q?gd7iHFLQhnYfe2g9ZFil0KTNm/Jot/+1X9RWg5R8T+6aPpZLjTi9vCLJqli9?=
 =?us-ascii?Q?Z7PYARka28Vosow09W6Evm6amP8ysMNQz6EAQQqMPIlMGqYepkYtgIJlDasc?=
 =?us-ascii?Q?tNdbMIDlz2xeC0A0Ev8ihjBVuTksizexqkil6LvaTI/EIyBgZe7qkSmHp9Tk?=
 =?us-ascii?Q?YQRDgJ2vos4UvePGMr0CiN0+L3oINiw6h/tWyeApd/NllLw5Um+ULqP3DQqq?=
 =?us-ascii?Q?QlyC181gXvbeobcPE7aP4e0Nq4Dher3VUrmftewNfepYEsjPrRag51GYrQX1?=
 =?us-ascii?Q?V9m1HLJrVf8FPAj07XgpgkvpSCFYdsrNmQPCa3sk/Ubshi9p8qMYnu7FOq19?=
 =?us-ascii?Q?2rxEIV0h+VTfZth11w/P9iXqZxGNO7vF2Iwz5+kMjK7UXVh24t8WejiDXnj4?=
 =?us-ascii?Q?WZypVMnVDf1g8N64Fs+CU4ma9bwFeNTILoghnLWMta71nmCAZ7pYS/ucTAV6?=
 =?us-ascii?Q?gLcgErUxsqI4fc+oRGhh6UytXv2rSw4gkzB9XH/I9ZNEJ5F2oypGb+pdSkpB?=
 =?us-ascii?Q?IGW86V416IOeSk8vXB6lfebH7kOrJuuX1c03v8/VGvNfe96ymxeXJPeL0LqW?=
 =?us-ascii?Q?53toXyjkVUtUoiEKHj0TWG8VZ1vUgGXOXNK7OY6dM8ctyQzRplGOGTWez/Ea?=
 =?us-ascii?Q?ycvTimRtgrhZQwpJ8wF+c/PCuJfM1tv83xHWyEdiakCxRyHFDcn0RaM6Lj1L?=
 =?us-ascii?Q?g8Wvmr8WNMUd4IWOcN1BMcnFk0qvIGysulzStXGMM0cO65yAcHqr1ULsnWvF?=
 =?us-ascii?Q?fCH1DTKSzUz5ldz68NDz1+XWau4QFIN7tc+rk6o9GwelLlXhCpYwz/M6lEcC?=
 =?us-ascii?Q?F4uhs9/jL/OEO3kg0eo8D8ygr3M/dYgJ+Ld6JWjh3ly8eX/y+W+QTRVo1ky7?=
 =?us-ascii?Q?Z/7141Qvqr7sySSSdoBZXryh380Dg9143ubbx1LDojxYDfqObxLo+HK8Ex5i?=
 =?us-ascii?Q?2WoclXPW5IRvhx36ReRABIgw8GCdYookhNMAtxdFC8AXGjXVxIMjjVrzwWAN?=
 =?us-ascii?Q?rlhVfZGYkK9hkPT4617vO1lEc5lu++YrKAtY9iY+Pe3a8gCtcmbaGAwTLTDa?=
 =?us-ascii?Q?RD5jijdywu70SEmxKfkVT0O7gAa8+AwNsxoKLpGwXeB+GwdR6M4CpXiHk68I?=
 =?us-ascii?Q?cTDzoOb8noTHRKfqbf51ThVc+pPigPw7tEtCYVUkPI28vhDLowj5v4oZSwph?=
 =?us-ascii?Q?3E4iRTUREfZ1hhE7YFYTixI3F/npbLQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	e1TL4p8NS6Ax3Xi8/3etjKwujqyCU9umR9HKr6TWjv1MCZ2y9Tm8Gbdm/jTIG/0FYTHs8SjEXlzUzMgxCdu2yKsIoDL19Xl0PmxRRkUOeJ7NrPPJY2/nQqC8GyvyQTdl0gB85nCQhtfDUv6NM1bd5l4wflWzVxzeSEQnBCrRWp7kV/gnaxp6WTHQNpYQNCyYc5W7MRwwowIRqoaM2C4JplSWOfMw9Qqcn9xu0tzZNbwDKLUb3tM6/u5mNZsTpEC+jPyslKY+Gz3Bh5mymZzl/toWMOmVqPxYEq4L0/RuL7mLiST3ywWtpldYdAJgki5odfisW9QwffDae7tcuj68IA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473074d4-1d11-4599-8823-08df08eb77ec
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:12:33.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UFRQBpP3vpC8E610zM+Hc/exWA686t1UbFG+gcnHegcuyVNhApaV0ggy29JxUv7KOsj/G1V0dzUr1fXe86SG7QBOz9++eQFTNrW+HzTXeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfX5h3FVp748eS8
 EKmZDtM6Aw+LPBPT9Vp9qYUWhKyCwxBWwrq4kET4nQX2zY30f1OzuFRtFfh/UkWXKb7ebI6Lpdo
 HSxfd2kJ3qpYy2tBykG+kMlFbtAhmmNPs4lBdBFOUcAc6bUOwOvPvuA8SPc78woh1Ij6SpLc2sO
 0C5y0Cz+YcbTFNSa5fDIVgUmf7cRRG0zdLusudgWTeE6Ec0wT3T9ssNoYA7Mdt0j0oGBgGQNbNR
 BmMh/SlS94Etusk1/86a2dddsiUBpluB96bdK32SNkVhJHaCY0ArzVt9JG2zXoRtNIYxTsGQQxj
 pNrSzcV5UkTPz+ieMR+jFKn7TXdegGf3GgedLOqmFZi7c7L7mqUEcdrh0FqEXQhAxj6xJvtTum9
 Yk6o4oRNHgZ+1/lf19sU9NplhQfF3WfZJ1N4ubpaLnVuHNobLEYmqL3qjCqCg9GwJPD0SwSf36k
 ajUx+SkIuu225f2Uqqw==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a9812b5 cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=LA4-PlVrAAAA:8
 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=4-1-fA6p189Jh3Z-_lYA:9
 a=Vl2fjF2eAE7ISOjF8jEI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfXwnnAZ9lg+E4k
 EhT64cL+PwrzFUBOP8Nq375P6zeD5hi3uHKyYDxV1wwSci/Idt9ZRbkyF75TULNx4DhaAtxSQpI
 vkBynI4z5ESeCgeqw2/3MAttO1f8kqfdUr+Djluqi1qkI4G8nWrI
X-Proofpoint-ORIG-GUID: WjbTQ4InjG9adDUuR4vw1FTtb32Ka9fU
X-Proofpoint-GUID: WjbTQ4InjG9adDUuR4vw1FTtb32Ka9fU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 12:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129696

From: Louis Rannou <louis.rannou@non.se.com>

The dns-updown script is written in bash which is under the GPLv3
license. As this script is optional, it is preferred to have it in an extra
package.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 4d7258bfe8..5cf7735eea 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
-RDEPENDS:${PN}:append = " bash"
+RDEPENDS:${PN}-dns-updown:append = " bash"
 RDEPENDS:${PN}-ptest:append = " bash"
 
 do_install:append() {
@@ -116,7 +116,7 @@ do_install_ptest() {
     cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
 }
 
-PACKAGES =+ " ${PN}-sample "
+PACKAGES =+ " ${PN}-dns-updown ${PN}-sample "
 
 RRECOMMENDS:${PN} = "kernel-module-tun"
 
@@ -126,5 +126,6 @@ FILES:${PN} += "${systemd_system_unitdir}/openvpn-server@.service \
                 ${systemd_system_unitdir}/openvpn-client@.service \
                 ${nonarch_libdir}/tmpfiles.d \
                "
+FILES:${PN}-dns-updown = "${libexecdir}/openvpn/dns-updown"
 FILES:${PN}-sample = "${sysconfdir}/openvpn/sample/ \
                      "
-- 
2.40.0


