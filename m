Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CE3105F7A6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14299.1773403884408001132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JHNT9JP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBbLEw608231
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 05:11:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7S6E6vDtpe+9onr3fc/KFCPCFvu9FtcnT1OyiXOkfxs=; b=JHNT9JP9z6Iq
	jDWutslomzgao6vMOfGNNgzC89a3kNr2jOI1/NTLiiM0CgVx9BfsNjAlIu9s9/41
	aSEp6VwCEZahbvLcWfMAWxiTss2Q0ifW+5TDnoipaGliBN16tSBKq73gZ8LRoWow
	jf95hHqwvHp0QYfvSnNSFBC0LzkH6NQ4oEk5c8ZNho/V9NNeM3jGBVjf2d7tum8X
	SBx2k7oqq4zj3f7TcQuD3DQCbpHXgYsj8E7Sey8d0oJ0TZAOdVdBDtiG8TskrHx2
	Nyr/l4Vc7r5jmn108kuJ8CMWoUu0c1QAxll9PQjEHTvtQ6IVq34Q6xNDE3kMzH2/
	/sTBifVeOg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6pt2nc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 05:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G984ugcJSrhuDI0CO2sSVG/jnU12HfPZOaWB9t3exdy25+4rTZgTOCMieFIgo9UbVnhJj/hhXgczGJwyIdUgQgNAjf8XS5D1AYtRHfayW21ajfYn8MXERMWxhMuXilD0B7iBqdwB9ZQybT/u4Atap5zj9UHjKYo3Q8urTZ9rr43pEE4T6Sjb9JvYMDw17skFm7SdGIRVEuoNeMOp/iK7vKdz0ux9vvEpcqlpSS2C6UltHL9QnUZRo6srm7wsj9U9stDQbU4Ucp41cB9vdJMkWz5mtTV1cGEm0RgQ8GR5BJ2VCQewRNTh7+sIdrFl4fUquAGZGI0cH/y3tPTDpAKgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S6E6vDtpe+9onr3fc/KFCPCFvu9FtcnT1OyiXOkfxs=;
 b=kcUkYQ0pYj9yNzARcc3BeZrGV89jwrhSLK2wgC0uycjit8lKr4RYv1TpbzGAcimiMWV9LEpM63lnmMkHrwd6ad/Q4lFDqQcsX2FLxCiRccaswaOM8Sauv2pDFy88PE5T5Zss/CQvLmQeqsOT5/MelgZULGiEyZ87yNztiCgbHU9aAPxMBK3V1l9Me/1a/8wOx3uPtD9uQGkKYexKeFRYEGFv4acuiH9SWncP1p9RgAkHri/2/ID33lLSdmqGclGJpvgzZYDT0E+tGeRYs+8PN7Z1VdIK/YMw/tgfHiM+qP+XCCJJTdheGCBwzELyWzty4ZW//hdjMQvmp/MMTqqfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.8; Fri, 13 Mar 2026 12:11:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 12:11:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] yavta: update to latest git rev
Date: Fri, 13 Mar 2026 20:11:05 +0800
Message-ID: <20260313121105.2180430-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313121105.2180430-1-yi.zhao@windriver.com>
References: <20260313121105.2180430-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd93948-216b-48b9-7bbc-08de80f9a35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	229/cGLo5PhKLvtr6PXCthRfZoRvAgvKiPIvzSa9h8R0aT79OG7viPO3S5/stgGb8evn/NJrKMYWNGZ5viVtdoGuSuyogIaHduVvTfTjNNK2/EruNalBO5O31PQ4Xswa9yfohl2eSbQUQdyuFfFDMuaQ+5e+hQWK5X+Gisr6WfsM6H8SVXEWB3Tz4Nyvsc6I3yLmvG/Av3WgVIyQFpEceplOeGlav959R/+tKwX+seQpogh3UFI4Ao1dtf18+27KEesV+TRy3tgizfVAPfNrpBG6hHX51xcYIOhXrxkYIXcnNhQY/TDT1ERdjmDIydBTQkKzFpjKzJRe3pxDDzrWun+DzokoBXW24GRicG8zHDqw2Ro+L1ZmeRzmqG2LXnm55ZGFy3kVBDoGYK4CJCZORFVZby2xXkrRVtRiFYV0BsRJirpX8+pw+xunE2jRSrrtNY6CWYXQZKjgtaR2p5Fsr9pgohBAuEIpucWaytom4AIB5/OZjXGmiKk2AgiAsR7F+hZ6/zbuAXsbJ6MW4P6TMzDVVHXHfD64XTI1sEGlh/OeDz7HuIvMAjcs53T/PUjJT/mJZTUub5fq3JTttWu9P0hvoXEGJIScdIIifxIMVl0UxAX6rN3VtMdx/mpp+7blG/iCe3jM4SCvXB8PEyCrmmtUf+zdEJWaK/d9QTf26V4eA0wl84uXkktly/52Wdnik/9Dm/H5SRAARlU4A9iDbw3cZGWq9p8S7UJRNVlOsWYpqK0QyrsDa7Rc0+IIFRdUeNwkGc0wGJrI/N/rCWjkD0qlHd7Z63RhiSizNdMheb4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NyGSHVaUfurjkLGvRsSGO7FzWCFIbgCCKJagf0UlBd5BuVNAgaL0vlV7ynQX?=
 =?us-ascii?Q?+M/+dOlKugsP+fxTBBrmXPH34cbLGzCmmAmBEwXjsXQRRiC/TXgW4rin9n69?=
 =?us-ascii?Q?JZukhvbZ2HDRm8MK3Ztqen092sBktAAhchZgEx5dFwyy1oXN65oZdT+lwvfF?=
 =?us-ascii?Q?j9axxpcyHlfYGnb5w6jEaXj8Xyc/NjMrMJPDbi3r9mkmGxEOTMj8+/lzSHRR?=
 =?us-ascii?Q?ZI9jAx8obXTHjdikNhRpsgm78IOKHtLBfVbneIvhyMKyI9gu+FvaHsyu5mGF?=
 =?us-ascii?Q?wnp7oF06VbDjLwnmUB/N9kvZD+qdUIA/qTX6dlhtEAaUtJimsLU5+QWk+V/n?=
 =?us-ascii?Q?D9xKNElhJ4Vs0p6Qj2DSe48fLYzbUVC0OjxMtmEqw1QsUM/Y4YZ5INoU44Tz?=
 =?us-ascii?Q?7fOO6ROnMupJJtoZ2zeLbP2fQouLK9DbkcLSvYCSEnHKvlvTkMiJ2bpqGxue?=
 =?us-ascii?Q?2vFflm35DMDGAZe8VGWTsRjo+E1TsZwAb3cQUVRg7EurFsnJAFhVPO2CGaDd?=
 =?us-ascii?Q?Uv1va7YQzsrMt2PQai7d4FyqZePv+ykptCBhSX4v5FaUe/qBTWHZRPk/nmJM?=
 =?us-ascii?Q?K5EhH5DlhP+cnImIX7qFFk8/cPzX5xQLyDwARyQTYuaHKi2QqIapcYtaZ4bW?=
 =?us-ascii?Q?cczKCQU6d90oFN4zES59v8jISRWGkTZQvwxWFaWMfjLSCufd7TWloXSNhlok?=
 =?us-ascii?Q?DqzOYA+ojKw99Oobe0SdZ/pvj/ogbbEU/+blS11+A1MYKI97EhGXiavNDTL0?=
 =?us-ascii?Q?tOgPNyAp5ripgbPzknLUxB5EiLoDlTNlXdpGKqokuPrfPc9t5Hf2Y8hvYAwN?=
 =?us-ascii?Q?O82D6psMzuXDhk/QTma8VZBPctbaMPrJV9P7jotoVoFlDa3V4XNInKCvGgMl?=
 =?us-ascii?Q?4KX98wMolAUhmcdxKX8oMzOKd//Eo3Hy+6uv3GArmW5aNK9FZpR8Yzz/4Xcc?=
 =?us-ascii?Q?3uoFmobwusYXcGWkzGWHja1vJiqWUu1k4o9vo9Xz1d92pdpbC593JKZn6W46?=
 =?us-ascii?Q?q0HJt/4kGbvk7hlUXV9yEqJhB17iR06JGXKz0104d5daN+N9ohKCb6wXBTed?=
 =?us-ascii?Q?lu3ppVGCJLJb67feFEweI/N63Iazfk02N0lbuXwx3x/IuTmyzeNiAwoHePl0?=
 =?us-ascii?Q?NrZ74TDZqJQIUmQKFG59KNoF2jbmZev+P3mCffwk4s3gAyAs+qVjwVMG0byI?=
 =?us-ascii?Q?anJ51Ufklhlstc6xTawT8cZHT/UpqyQOYeDD+WPeZrs7sqzPjQXtc9bSjoNV?=
 =?us-ascii?Q?L8k/GA9fS1frg5+bOrx7JQhuRvQDEMqx5s5s8+LuXoRkeBnkcuKGxLo7t8kP?=
 =?us-ascii?Q?hTVDFlzOXwC4whpNtWFLNkWrNhDp1iSC2Eo0zgNNlXW34TCzqIROBOiT4nke?=
 =?us-ascii?Q?Ksc/lJO6rHFYPgUv877QiI8CwHhEabGJXt9sLExXLuKgznSzcYUBSZ1Q6KsG?=
 =?us-ascii?Q?dTNxv4hUL1XnJdy8lHosjYFGWwix3wRTjBHgcCOY+Y1XpJryqeqJoFgLhdvo?=
 =?us-ascii?Q?O1HFO6P7jy1BazW2k8DoMdf9pJs7MsWOUuPznKE9Oz0N8byMl0x5aJPKAjMT?=
 =?us-ascii?Q?2QX/UwNBNmZyuLUkK7Fy8asRDip1U3mCnVms/U3MgVc/gt9soh0ZHwiTR50V?=
 =?us-ascii?Q?DGc/qCJ4F/eG8wCu6zV9L/BMal0LTRvaQF4n/7LKRNn+b6Ra5OoAR3ym9LvI?=
 =?us-ascii?Q?tiwNTh+cIweSlxoluXWo0DgrsldksoKyTsdwm7u5EFU3/OBaU6EfVVwBpWQx?=
 =?us-ascii?Q?qrYeD9ezVg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JKPkDQd2QyN+i/reEIGqjtRaQuf68wHdVarX5xvPW93PqcMpyEcx0uGPrEn/ONDjFPlpGDYT0DpAFHC4BSxIrv78hAb0S9QZv3K2heEVMYR6zwb+bnmMsHHhrrN/DxZ8Z2uRcLu6KBZ+6xSTrad05V4xtkoxT4NWtEcI77IUSQ0uwx6QhkLGGzV0iqTbalNYBVmnXnlCsdTBw0Dads5tgpqxqJ1xKA/wMlOo39xA81Ii8/odkII0eIdiCb2V1nplXEMNLtbmJNRPCN7K7p6/Jxmdb5oHnfxT31wFNEwbAvTv2CygnKSANazf55yTuk/ZML7+Q28EfZXntYN/eBn9Rg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd93948-216b-48b9-7bbc-08de80f9a35f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:11:21.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5yRI7AhBBtUpbXGwMVPhCtHDrIeV7FUJetYgMZCvhZb5S31N5QqJ55GksieqPAiAU/qNkE+YsJ+tXoGOMKsLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3feeb cx=c_pps
 a=VZSJMqPseUw/+4g/T0Awdw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=FKcYwT7qAAAA:8 a=P4IhAqBM67oxtEz41ewA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nkxRafq24fv7TUel04h7:22
X-Proofpoint-ORIG-GUID: yT21FUXEYzDxCI6R_BS825XnWqTYXI6d
X-Proofpoint-GUID: yT21FUXEYzDxCI6R_BS825XnWqTYXI6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX0vYl/o5/L/er
 t66cfp2zpnM5JkpY6zSu2q242E0tJ0B3jXXBBI/7J6zBVBrlhSemIrgLvLyQurqvaqQ9jcNfnQB
 Jlveb6r/IPhtiezneG+pJB+G28aJMUCXVQqeCvQk5/3n+NJeQhknmdvGWG6q65RRhaB+A3JNWAp
 zhe+Qi6ogg1WitXZwx9FBtijBY8nLgyXuAYib+FjUknMowtpXc/eaf41v8Tr2zi+9l5tms7cvm3
 pjZ9ymJhVJ5e1toXzzllhIpXOzti7vXd0Tlwqj3B3/6d8yVoS1QTzPrtnx8BFmf/n5E6Ts2wXWq
 /32eKwUzEvPyyRiAhUZq5UmH4J97xsx4ILQBxYFhzBioO97bdvWq4kHoi2dMQyHFBQ4I9hWyFIX
 Rq4LSi+q36FRUjmeMBvuMCGGOxLicEFjiXuWJZ45XKFFsFI/ZCw7bXRSIczR/pQann6jswil3VX
 M9ECZq7eCmiC6OXOEBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125190

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index 87dc7a7be6..03d3303bc9 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master;protocol=https \
           "
-SRCREV = "52c975e5542504ac10bed8b1d68df5c75951d202"
+SRCREV = "3bf1c3bfc25a780dda8333653b80932cb1e422a8"
 
 PV = "0.0"
 
-- 
2.43.0


