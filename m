Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D59CCDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:42:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33539.1782474119703313176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A8nlL/QP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=063731df1b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9uqvH3489980
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:41:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/JIL4chlE
	eOrIUMQWhuiONXTj1OywlKCR10aPJ8f6Ps=; b=A8nlL/QPBpyjgxBtO7S+etb4e
	Y3AXX/3MNrbZRw8UctQKeregsYduZj3u22lTRZ4AA5jMWChtYuVVuxMb2dvQ2EdC
	gyqLJaBAf8+ZA+1KXLUu7zaugzu0K6jNVL+6fq2tytXRnI6fr6rAeekaqtrAakf5
	vmRRbXVdZVKKhEoVl908lQpH1CrYlBiYHuCv5BKafDCKRXELjPmFQD8rIn1a5vWr
	Pd+I47a604as51xvfD4OGCtWYySLa+ZlKEzn4XOEvLSwA1RDH7onAsW6KaaFgMVG
	m2hXcWusHcDsvXcUkfjhXZ/0ma6DJ/So00NN5Qa4WyAQkkIoGSycbFJZs6N2A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1exk8hkm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owx2WhasgpT6UhhGOMNlS2FEnrNwwF34cOkyHJXRirDhm9VD8nREkqxtkZJIRB926+RHlASGN/AdhJ9rzUlrKVBHVSPhuLnFET0ADU76IibNoQFeO2drJ73tRl/AhQlWREPrr5Qw6oSbhnqlgf2/NwwjwD5TKSJCuH3AOfsw+xJq3mWXA8m2zDKWEc5afBydTtErTCmb1IiaV1kJbgdqU9qwIPkLPW7bdN56YBO6OKGYM1yrUTQN93L9HxeR1zNyRppNe2wG5/miirQ1YIN0yUrbhmMszXCPtCZhWWULWqU1ek6h+ZlhtbgSYgbVaa0DWvwc+49uBAFqYShXvHCDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JIL4chlEeOrIUMQWhuiONXTj1OywlKCR10aPJ8f6Ps=;
 b=kq5jphUi55Fn+keek1CZM5gK1Gk287OnS1KQNBddpdxPv6PTqq6RZkemuc6rqrN0Ybb2VYGRb6gt8WHtFgJTckxAezkv9rj1nMvp+yDIT7ShLrUeIKC0djHUzdZRf+5z2trQ4nKmW12m5A9v20S+kthyo5te8NSERJTaZ4ZHe2jk9m0ETPWe0b4DoWOiB8FYjMi74WQd+DynXzUcVaFV6ohG4NLktFDYoQFqBGYsRzoF60FMtLgotZpaE6sPfmMbCdegiihqmK/TApDZY+J6QerSxz0luJFiGOYZ00bEmm6OWoFmxOUibEBiQoA/bKzwy4idxtIBpWkMovu8TOJ66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 11:41:55 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0159.018; Fri, 26 Jun 2026
 11:41:55 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [meta-networking][PATCH 1/2] lftp: backport fix for duplicate OpenSSL symbols
Date: Fri, 26 Jun 2026 04:41:32 -0700
Message-ID: <20260626114133.3486742-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 743ea346-d973-4ce6-0764-08ded377ec20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|56012099006|11063799006|18002099003|3023799007|6133799003|38350700014|12006099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lFnUcT1XLPVi8a/6xIQ14tFSt3dlf6c9F/oI49LUeS3y2JEbtny2hPWpoFamOUMeGr71r2R5eP8tCi4u6UFSBOy0AcPQj9uhzYt1jSQ+KceC8U7m/1THYXIuKNXFgfI6d3gyQCaBSYVopcug5kRyxpnvJ0ppZlsOJWba7JgwkdkOfj7+Sb7+l1EuVkldEZ5oQR995x324rsbFctv/e4Y6yO1LsnvHTsUlPLo+Rltrpy9bZi7rG2EItuQpJm6Q9ugBfktU2s/gV5Do67MFYPrm89mATuG3LduP06FmdDO/7BSar69sfIvnC1Dugt2FsUcmZgH9LTiIVHc/XaHrg6otyyii29HeJ0GXfUYqcagBx15NS7Q/OCPl6q9ZqXwRKZqPydFw/XmRLUKibIRnkSmlerZoUaPlaO7O5nButWH53nudhr8Izi5Qrb+k/XLwF42lRy+MfRK8jDvgJB6WKafIiigRP9FFWwd4wULnSsEJBHSQ/mADRkjTaNnuRDnn5QVBj/qHYc5XMQ2b9iql/SfwE8RsAftAZZzSGEKC8j2sZ2R7scZEGwCABZhDo13T89V6UBeUSaretcyTKvxT4p5i88AMuDPu2dF8wnWt2xa7wCTGvtBgnrRMZmlPrpPJ/hR7KD9Glx7hc5gp2c4I3zfUu036c8T5vSyfRHWrz9yQcV9EWZspZrCzC5Kl6LbYwsfqNL0Te3cfaMzj/6lrZAaep9I90f1cTAotiP7hibp5O0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(56012099006)(11063799006)(18002099003)(3023799007)(6133799003)(38350700014)(12006099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cajpcPoqW09FAulfJ8TtTeKNG0gm5DIMUZH2iRLhuG7iS67zXhGeJE0NIN/g?=
 =?us-ascii?Q?iWG3B/AIpokROF0nB72fqq40Z8fBz6MxNbKsKY4EX81NurQ+Sxfd5bx27aJO?=
 =?us-ascii?Q?lu2+I06MLJsmi2blnrp/pWmgOYE5av5fsSpY5gJ2YEEmz3V5BM79DQCTb9/u?=
 =?us-ascii?Q?Z5BiYpUr1ijsEWIj8Oex2zM2LFGsoUCYzXqLprJLiV6z9AZQvA76rRKnu7IN?=
 =?us-ascii?Q?xUk7bSbG4VgR/IbdShue4UZ/UKR/lr2KanhfwfVRAD84B/uW09k/NplYvIlx?=
 =?us-ascii?Q?ur9odNvjrjS0hTNdGfnH4NI/LXKliFEe83icWuuioWASHyh0z4f3+tMyn3DI?=
 =?us-ascii?Q?pjDUP7FNmOoEiM04BLZSnnV3J90/Y8Pt7EuzQbleBwfojtMkKKC2GzDgmxnq?=
 =?us-ascii?Q?jA2w0P6Uf2XNfDxPBYjlceRxOaI9Z2EpMqMPUI/D+8IXQEG2zEsfuPdnAemL?=
 =?us-ascii?Q?Me+dmjTJPxRyzjA6c8J2I7biS88OtonvmTEB202BFAJh7m1HyBpf60q5fqHf?=
 =?us-ascii?Q?KOfvEoQ2r1UCMxELrpD1+2d9s6Wdtuu/nrMVrLsQMLimoikxqt4rONH6wxBk?=
 =?us-ascii?Q?PuAf8fo1mTtNzX/Vk39USOtf5iZfmvqBYjJCbJePx4YdZinnd3NmK+JG5r8z?=
 =?us-ascii?Q?aL/bhOBAxKwRbpqBhkxgWIWbElx1fc6ZVvVMykSsL5KQPXbrjHd8t7M4hX9i?=
 =?us-ascii?Q?q5U6bZA0st7kt2e5wNapMTUoROamqSZzI21i+XVaX1lWKyp0HUYl1cbYiWai?=
 =?us-ascii?Q?0My6LHHOB2dZs+oGk2DULoVVsULILA10p6L6e136H/tMltoM1yy8+haQmG58?=
 =?us-ascii?Q?HWLJU1oy/E5GyS3WIS5RkIVt6Rdu0G5kqgu8HHD2Jnc8bmyV/22b9f4uSRtn?=
 =?us-ascii?Q?m+L+h6JvfloSWj45acSEv7HB/qUI37zFXWE4Rgq39G7DPnmGwZ+jEiHtkwL+?=
 =?us-ascii?Q?mk0lEdff1YTxlDS0nwE2UrYYI5005WRgdXkhLzD72LSS0y1hqx8Dfk52A6Cd?=
 =?us-ascii?Q?SE0+8kQrn6xYFphYWMaUARn3UnZU9Ag/h+tGS14IjkqXI6UEtgibgDMtVu/d?=
 =?us-ascii?Q?ykRkVkKrfpOdQjVwWSgycq7/ELSz//zytLCx5KiFAin3EKupDKupg4jHHxf8?=
 =?us-ascii?Q?+wuczy1OQ5iarNxuEiGbFhLgtC2PXlb4C1ITw5qml87zCgO4fftzLzvxScFJ?=
 =?us-ascii?Q?n6Ao/o3X0qJ1Y38LJVh3LzsCA5CvamXHm+EOCMqbI/uDbwYWCrOJVVWQX3Y/?=
 =?us-ascii?Q?YhSrcvguNxou7KBKrzH4GpwmxGZUxbic9V+cO0hbzWD5Z4mLNqZ8PpUAe0TA?=
 =?us-ascii?Q?cg5PfeMjQoPCOENEwrZ0ayFuTpCfBDhL0DgOc6hfWN4jm0WxZonETSuolfPS?=
 =?us-ascii?Q?uSxY36YVI3JRg4gzNpK8E7FfITGL3HiCEbnl6wBp3gCS6Bq+onfTTLNyGiFx?=
 =?us-ascii?Q?g/CuV5be/Z0Z7SWwCT9a5h4RoYgJ5NzKPcSCknI0WaqM4up0CgkKNbRCxnfk?=
 =?us-ascii?Q?063i+cD2FAjheZ40jsff5cDlB85FdOc5U1XDWo6Jw5+eh1M6vg3eEXKqBHrT?=
 =?us-ascii?Q?7kF+By3Re5kovQBSWKJolFs39y6Syfsn4ydMLfsQMCWUGBBrIBir3UXdnqbg?=
 =?us-ascii?Q?H/mbsyMfB/O6y5ZxYNsFsUoGdCnIG+X/UHw1ejE5FhAQuZYRgL30spB81mus?=
 =?us-ascii?Q?JZy/ESvM3SU37tbiTsJ8Da9VOsFRWs3xwJAFNwWO8qfshHm2U9ja83JcRUZo?=
 =?us-ascii?Q?1x8V+Uhz9ZW0VP0Xt946COPV+OlG+GU=3D?=
X-Exchange-RoutingPolicyChecked: 
	dwGcSLSvLxPTWEE29MNqW4lAU/gfc2NZGKf1q+h1x3eEof0XBuc9EI0vBlK/guvnWu2yIR+ULiay+4bav9Ey2Z9BtmSUQkfSkKnJGySwIuIAZ8REYUYUwoBSqdPQaWJp7diK5espMXm615E2lbNb0GMTYzKehV5JEF36uYCPd1hR3gYzTnUHJRadZX4/uQFp2EHOQnZKXeskeBgSR4iVd9au3Be3fqp783mPZOboA8wj9uqIT/ebwqLsB/cmZOQEJB94+DwgEp6sUVvRTCFvEgmEPEP4Mk2+IsJEgHiUnM54/B2J4sD9MXzBAWXD4/N7pi2R3ciH9vSr+fH+9zIcag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ea346-d973-4ce6-0764-08ded377ec20
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 11:41:55.1843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMVSI1yHtaGVI5pG/NyO8co2xcF3U4hA4io8w0HIZXgaVKxl3gqykFdVOeGhJmVWix8+/g10tpiYWQIVNLhDs8QTi/iDWefH41AtEJ0Uw+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
X-Proofpoint-ORIG-GUID: rHsg6vITSgJFnYmLAPVbfMDPPIz0Ez2w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5NSBTYWx0ZWRfX6qve7nD6qK0y
 ObpaaOha0lFdBGaOluMpKhycCy/xHM6/N0J2IQtEOdKNOMJTBc59IoUuArAYJk1FA01ke/+yV/5
 Rw/cu0yezSvL/VnFwq/0L3pWhUlGKxMq9UkZclhTVZRdNZNE4EGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5NSBTYWx0ZWRfX2ndfIyuAHAm7
 zO8rnLDb0qFXB4/l6CRjNHoY7IVLzfU+8PzVqHwpTw3v0u5xmdwgvKP7noyMHw1gH/JJPwIxy++
 hzwvUvKe9nehXE8LhuwsWreoxyD/00i1qx5Ize0psxzswzK7yuV5+AVNv+kWtrAJCHzXinFFrvY
 eOnmrDEl4cTWsI9UA/4JuxXBfcR6HnwbQLx480E3W36tdBQlFmyOY2wx1RMFf5LfNYszCRTScMS
 X6bqVkgXKBiWJtLG/QlKwLvFe37cptZyDMiasdiU7Qiqm97H2suMr3zXEAfirGvOOJyUDoKIRnl
 431zd3c4Duh90GKDx1egGiKSxlE9ujA8rgAsDaZn6NmMFD3/izcnkk7ivFtUdOm86UaquNWJF+Y
 HhfU4ZeBpaUiXD14hpE2GVqlQPAvfPJ/BkgdZLy/TUnXaNVRhUnnbopAQA4HjRvai0TTE9jasrO
 2pZMx14Y+K9gwGBEZaw==
X-Proofpoint-GUID: rHsg6vITSgJFnYmLAPVbfMDPPIz0Ez2w
X-Authority-Analysis: v=2.4 cv=NLLlPU6g c=1 sm=1 tr=0 ts=6a3e6587 cx=c_pps
 a=MXKEcm+r4KK8PT7sjGsI9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=Vt2AcnKqAAAA:8 a=mDV3o1hIAAAA:8 a=yXCh-KuFAAAA:8 a=t7CeM3EgAAAA:8
 a=ZLGELXoPAAAA:8 a=rJkQAz42GobnWIEDU4IA:9 a=v10HlyRyNeVhbzM4Lqgd:22
 a=mv0-59us6CzTypg-u3f_:22 a=FdTzh2GWekK77mhwV6Dw:22 a=CFiPc5v16LZhaT-MVE1c:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127790

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Backport an upstream gnulib fix to avoid duplicate md5_* and sha1_*
symbol definitions when building with OpenSSL enabled.

Without this fix, lftp fails to link with errors such as:

  multiple definition of `md5_init_ctx'
  multiple definition of `sha1_init_ctx'

Link: https://github.com/lavv17/lftp/issues/743
Link: https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.html

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../lftp/files/gnulib-duplicate-symbols.patch | 40 +++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.9.3.bb   |  5 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbols.patch

diff --git a/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbols.patch b/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbols.patch
new file mode 100644
index 0000000000..220a095ff8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/lftp/files/gnulib-duplicate-symbols.patch
@@ -0,0 +1,40 @@
+From: Jan Palus <jpalus@fastmail.com>
+Date: Sun, 17 Nov 2024 06:52:48 -0800
+Subject: [PATCH] {md5,sha1}-stream: avoid duplicate symbols
+
+When building with OpenSSL, *_init_ctx and other inline symbols are
+supposed to be provided by non *-stream compilation units. Drop the
+GL_OPENSSL_INLINE _GL_EXTERN_INLINE override from *-stream.c files so
+they don't re-emit those symbols as extern, causing duplicate symbol
+errors at link time when --whole-archive is used (as lftp does).
+
+Link: https://www.mail-archive.com/bug-gnulib@gnu.org/msg48445.html
+Upstream-Status: Backport [https://github.com/coreutils/gnulib/commit/353a3236d9328349c18ce2e4e984755cb4a76ea7]
+
+Signed-off-by: Jan Palus <jpalus@fastmail.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+--- a/lib/md5-stream.c
++++ b/lib/md5-stream.c
+@@ -22,9 +22,6 @@
+ #include <config.h>
+ 
+ /* Specification.  */
+-#if HAVE_OPENSSL_MD5
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
+-#endif
+ #include "md5.h"
+ 
+ #include <stdlib.h>
+--- a/lib/sha1-stream.c
++++ b/lib/sha1-stream.c
+@@ -24,9 +24,6 @@
+ #include <config.h>
+ 
+ /* Specification.  */
+-#if HAVE_OPENSSL_SHA1
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
+-#endif
+ #include "sha1.h"
+ 
+ #include <stdlib.h>
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
index 38bfa86751..3d838e6c42 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
@@ -6,7 +6,10 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
+           file://gnulib-duplicate-symbols.patch \
+"
+
 SRC_URI[md5sum] = "c32e15b96c08f7f0b2d17efbceb00db8"
 SRC_URI[sha256sum] = "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd23239fa9a41ae17b6e"
 
-- 
2.49.0


