Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5548D43FE3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 07:08:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35543.1731913691688527173
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 23:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10520c6e51=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI4vGg7019631
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 07:08:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0hgdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 07:08:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1iUm5qTqtBVO4kAd/PUZDhrBNymLhpk5kTNJ2yDObkiTese+ZktErZ7b0M2KvfyukQm0s/x5BzQWBo6ElWnBqED4xXKzUBIlOD4I6JSgTBxZvBDjnKjD//PdzkQTqmJxc9Ur6DY6MKwP6l6BB0WMcA8ErNjjNCHAQ+xd2Zg7UodQRknNruuoIlQvu78piL25F/Fb1zNxIefOYPXONt0J/sj8DClcb9v+e3UeN/GFMvFp1jQzktsd6kMulYEv0Q6WdoXs+f7mbiXXlDt88SkMjBgnb8iVruBPCbZeHS7R6/7kDywoowPOcb4XrZLHLgcc01o5rfrbsP9wS3Qlf1ETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG3jtv3Xp8B8UbCqv+xozNUgnijVs+VDU6NxA6oCoO8=;
 b=VzZ+ZB2SI93tP9zt1cXXXoqahwvt4eBinMn+3KRqMhtaBlxAoM+pFNe8L0C2HJV+QcKW9whc22ZvApweth+LiYmOIBnivcela4/Xp+NrVQg/iCQAvmlTl70bwSUB3VrBSWhRKuu1/gEZx88AleFV+nhdNxfWQ5vlgXXRVOwcmZ/Ygl9PIzuCzPoReyCs0dvey1EP45cklR7NYEsfjbJWUyeO/E+JEH7dnnjZuaGFcxoe6mO6A4CDZCjoMQorhELhOA2nPgP8TbVzDbOZ9jnGZC9WXC4TTlNwRw/xvnCgPQw7YCSRH+c64/uNcwMtjTS1HxzY/4uz8Z9QzTJcc+h2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 07:08:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 07:08:06 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] freeradius: upgrade 3.0.21 -> 3.0.27
Date: Mon, 18 Nov 2024 15:07:49 +0800
Message-Id: <20241118070749.2986598-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: b95c29e0-b783-4b48-d0fa-08dd079fbfe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dk3wweUvtclUOhBc0A9nHBSaVjLf6cYNEx69Kk37czZkUOa3MZoG6PHslad7?=
 =?us-ascii?Q?a+DSbiFZnon82yByn6hDiA6NovPEQASPzuw1tB8qoRpeV7KNkBgfetQ1l1Bk?=
 =?us-ascii?Q?yo1v5FkajC4w7lQQ5867+zHdjbME/9yz3+uBpjLS9sQS7lM8PpfrnK1QtERz?=
 =?us-ascii?Q?acjAsNsZ1Yu62cBn71xTRxFSMvLoungtbG3sVFIapMy/fxxVWm8ucCjlw9XR?=
 =?us-ascii?Q?6TgW/r4yFj/jRy2rl4CA2WFjiHJU2uLUR86T34dYaWgK+Kl6brhB25BkQALi?=
 =?us-ascii?Q?SB0M8P6Qps1TNT/TSdCEuWeRIKvMkKwI9ZzJID1BjjUQPzi3IzhR0ajjZT8m?=
 =?us-ascii?Q?eBiNu4pxyctom8QC+M5ORaHEzgWLDRyT/BFuXvQ+SN1R7hRdaUqV5ttW5yVM?=
 =?us-ascii?Q?nGlzVkBG6vtWess8aq+b7J91LJ4oTahEYza4Ec2JFdGMi7W62AZ743lERAj8?=
 =?us-ascii?Q?kcj184I1QuEeBr3pefnacuBTobDHQuhqX5JcXCMzk6jDxQwFqtbpKk6lD50w?=
 =?us-ascii?Q?0dZmui1ioUrIEJUC3Q1LLDyScu7X2aXPQWClHfCvIibNY0NKat0pqDrZq0XN?=
 =?us-ascii?Q?MrRXe7B609NjHvksXDNSY0trYIMpy8gBJ/GP16G+nOLSNPwDQGFMxl58FRbH?=
 =?us-ascii?Q?bSgRkE9bd30U+YX8UgiJXdjHJlAZQS5AG0EdNVxUMagb8BD0y9fvd26Ihv4F?=
 =?us-ascii?Q?4ex8/s0qzPke7o5IVvqT2bV13aUEvbj52X6QzzSfkpi15Pemp5qY35QdSkpx?=
 =?us-ascii?Q?YtJF99Ovxr45puPMotWuHWXF9skoYnWHDvXu2hMwg8Z9KCXr3Jo/kyjAKnGH?=
 =?us-ascii?Q?tE1nWbaiI7gfLA9CgnMhdss+ETjgPvi8HNglGF7EhK4VtmnfD4b8NC7GkAio?=
 =?us-ascii?Q?u7WwhPEpAyCcB/B/nLjuH6NwaP3Y02oM9blkfTeI2EHZjg6Isias40nS/xyt?=
 =?us-ascii?Q?KyywokIg2QfvYEXqJu84/Gjy+hN4oUt2hMCbcJveEv7rI5LRABqTXRe1cGkk?=
 =?us-ascii?Q?kZugvsIEgtNTh5Dy2Wlg8apcGqlcANohXwr8JRr6Mw68ZjHuW1m8ABs8c6Di?=
 =?us-ascii?Q?Kf9y/samYRQ453QhN5c0ki1uoTfXyf22jV5qLRp7YfCntRimkoG5AuaeJyxY?=
 =?us-ascii?Q?QUiN/oJ0Vn0X0ORJaLSvI5atVGRIV55c+JcPQzDavlcfm+rXveV0wXpWG/NW?=
 =?us-ascii?Q?cBu9dWwmI5Qq9cn+2PFDjKxMUniEnqEs1LGfQjKBtT9NVCG2xalYGdPkZVwx?=
 =?us-ascii?Q?0JU7oLA9GLF0iXHwjQ2r9k8A6ddcwNUyg2cFoL6s12tJmWIU75Pu69ZmMq1O?=
 =?us-ascii?Q?zyUkRdDuZgHNphEKOSxgbKcx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q6BFveBRki2WiqDvs4KMeuEn4X4g8aorMpDemGNSasLeYXZaWCzoM5huDLKw?=
 =?us-ascii?Q?2tONRvgourHBMIYPVBJRR0qsYMgKRsTXuW3H5f1be5J/y3YL8rALyMSh3BiP?=
 =?us-ascii?Q?jHJBZk8q7SPTzmiUg/d7CXVPxS9szIwaWC8BWBSbKyk08k8S7tZO4IG9P3qx?=
 =?us-ascii?Q?gtxnvGSBhdi1f+BjgX0zEtKSY0Vjkzjxv7NlZ69gbyYeurscGqFCE9M0Eza6?=
 =?us-ascii?Q?/rWlWG8kr2E3captvVDEnU6ZUqrW9z4igz7BsyWMP1Cd2bOlauEPBwyisl1i?=
 =?us-ascii?Q?Iy4rkGn7IAO17HbtOWZHRyJt8y2RYLstMz3GCm94eQOAEhMm22C1SaDP/i+8?=
 =?us-ascii?Q?e0DovIxoUZkwOy506Ehny4zbDKcc0fnL+abSub4zBbDwdNypxCHl2Wjb4MlZ?=
 =?us-ascii?Q?fTwA+MBG7rlvjqgzQfZ0CxAyfneknSfY249O3kNgkPLt1nv0D/x//zjQ97gM?=
 =?us-ascii?Q?Domz1MxGEYEmK4g7uB9rrO8NLsUxPZUxAtNilV+lgupFMkvoHCU8EMdEI4FI?=
 =?us-ascii?Q?LcQuKrsEyIZgZJvIoY3XtaC4OwNzsDe34WkmPVfEpxnT54urY0ANC95+rnx4?=
 =?us-ascii?Q?ytpmBOa2yIOfIRekuksA5HDOdbcmbzgHw3JfuOaTQovjkM3JQZ9mrpb4Fu54?=
 =?us-ascii?Q?p20qLajlFPge/Qo4ps2TApjH3SR/miHgS98l+qWq6rAMBuel4gRj8xKiYFub?=
 =?us-ascii?Q?g04Ir/iLK41D1Ywx4CKTWSoHWiUI50jt7P31ZNDb+86wtOSyFaqSIG5m/Tlw?=
 =?us-ascii?Q?Xcxhd9zutkvoymDbGsGPcovAoEWKdBb7+mQUtuTvNfZeS6hwI94sb7b+Fjh/?=
 =?us-ascii?Q?Xf6bo2CCrsTHc9QRUsCjys9tcqp+8Bn8FVP4GrVDUi0G9duCV0rgu6Z7gAM3?=
 =?us-ascii?Q?U6rHW7WxXtqzuYXksbRrbU0QyjByx6yEMaLvPFLrghiidoxPRs2n2qe65yAt?=
 =?us-ascii?Q?QOqadSfviYDfJOGXlzUA5cSl4CDW4YTSL1MvNorv6Xe5JMMF74sXJWhtQlpl?=
 =?us-ascii?Q?pApSMdFmFAV41j56jDJWvLorzScIL+AKR9BIol0cSoIg30jp3otOCg+YUJZf?=
 =?us-ascii?Q?EEt68tDNv9zeN4YMLRtX9Dd8nrLHgdR1CqzF1bNtMUnGnnFOU0TcthPL/k+T?=
 =?us-ascii?Q?yvGQ78ZQ471PJ2p5T5c0QcoG6m04CCRYIMXH6E8SNaZSo+csvFf8a73zSFC9?=
 =?us-ascii?Q?EgxgmPqC+X4LMOohNnWW1eTvYrME/2+u6MncAbK+oEmZlujl/7TD0U+fsZR5?=
 =?us-ascii?Q?r7130gxlyW3WL/lU/reDn2dE97fYEeL6I9hXdp7PyVt7Fy6EAGLka77g4LfV?=
 =?us-ascii?Q?BeiVE5JaOahQMzS53R7YvF/VokpSRX1vh46H6Vz9Z4iNXGpiYITHYWNfJEyV?=
 =?us-ascii?Q?xy3Osn2nuXsfYzJLrKAZI9xAARnVVRjDO6i/41GBBUzYVR2PFu2Riod66XO6?=
 =?us-ascii?Q?1EwmZEBL7hcQPMmCW/ZMbslMH+YFudY63Zfb1Mtc8O5ROq6OpGfGYLsKdFlo?=
 =?us-ascii?Q?E7UkHg2MioMZ7cJEuAoiUm9fTQ2PI03++/VcgFQd5FnMMIv3tqeDcXrqvQ/q?=
 =?us-ascii?Q?bAeGLFcpW5YsVcnc771Sb5mQ3qykcmpbSirHm0Z34/n5CXSBTGce0ct4e2lk?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95c29e0-b783-4b48-d0fa-08dd079fbfe9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 07:08:06.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6toJnSAkGu381OCgs3WCckd9xkqKytlOu8cF6k6lH37g4Iaioj5b0nsL2/NfNCrze3DHMksgb9wX3SNfAgcoRvoTdrlL8PVSLckUoW1rkQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-Proofpoint-ORIG-GUID: mx2ZwU1Toz8JpzLpRG7CCpvdZLfqLEI3
X-Proofpoint-GUID: mx2ZwU1Toz8JpzLpRG7CCpvdZLfqLEI3
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673ae7da cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yU_jQ1hFIRIA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=FcTRRU_JAAAA:8 a=CjCwKRb6AAAA:8 a=wxTbmSEpAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=OQZguMDTGMagWZbvO3IA:9 a=-FEs8UIgK8oA:10 a=24chkg8mTlgNITX-x-SQ:22 a=yyUDA5s9UKYzn2Z-n8u3:22 a=BUy6Hz7BFr9c6Tp_jCZq:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_04,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 07:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113863

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

ChangeLog:
https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_0_27

Configuration changes:
BlastRADIUS mitigations have been added to the "security" section. See
require_message_authenticator and also limit_proxy_state.
BlastRADIUS mitigations have been added to radclient. See man radclient,
and the -b option.

Security fixes:
CVE-2024-3596:
RADIUS Protocol under RFC 2865 is susceptible to forgery attacks by a
local attacker who can modify any valid Response (Access-Accept,
Access-Reject, or Access-Challenge) to any other response using a
chosen-prefix collision attack against MD5 Response Authenticator signature.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3596
https://www.freeradius.org/security/
https://www.blastradius.fail/
https://www.inkbridgenetworks.com/web/content/2557?unique=47be02c8aed46c53b0765db185320249ad873d95

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../files/0001-Add-autogen.sh.patch           |  47 +++++++
 ...-user-and-group-of-freeradius-serve.patch} |  12 +-
 ...onfigure.ac-allow-cross-compilation.patch} |  10 +-
 ...patch => 0004-Fix-libtool-detection.patch} |  33 ++---
 ...-configure.ac-add-option-for-libcap.patch} |  12 +-
 ...h => 0006-Avoid-searching-host-dirs.patch} |  57 ++++-----
 ...python-add-PY_INC_DIR-in-search-dir.patch} |  12 +-
 ...=> 0008-libtool-do-not-use-jlibtool.patch} |  24 ++--
 ... => 0009-Fix-quoting-for-BUILD_WITH.patch} |  13 +-
 ...-for-expansion-of-macro-in-thread.h.patch} |   6 +-
 ...cludedir-instead-of-hardcoding-usr-.patch} |  17 +--
 ...ile-fix-the-existed-certificate-err.patch} |  10 +-
 ...ile-fix-the-occasional-verification.patch} |  17 +--
 ...-Workaround-error-with-autoconf-2.7.patch} |  14 +--
 ...rap-check-commands-of-openssl-exist.patch} |  10 +-
 ...6-version.c-don-t-print-build-flags.patch} |   6 +-
 .../freeradius/files/CVE-2022-41860.patch     | 118 ------------------
 .../freeradius/files/CVE-2022-41861.patch     |  53 --------
 ...eradius_3.0.21.bb => freeradius_3.0.27.bb} |  37 +++---
 19 files changed, 192 insertions(+), 316 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-enble-user-in-conf.patch => 0002-Enable-and-change-user-and-group-of-freeradius-serve.patch} (67%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-allow-cross-compilation.patch => 0003-configure.ac-allow-cross-compilation.patch} (85%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-detection.patch => 0004-Fix-libtool-detection.patch} (73%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-configure.ac-add-option-for-libcap.patch => 0005-configure.ac-add-option-for-libcap.patch} (87%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-avoid-searching-host-dirs.patch => 0006-Avoid-searching-host-dirs.patch} (85%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-rlm_python-add-PY_INC_DIR.patch => 0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch} (81%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-libtool-do-not-use-jlibtool.patch => 0008-libtool-do-not-use-jlibtool.patch} (91%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-quoting-for-BUILT_WITH.patch => 0009-Fix-quoting-for-BUILD_WITH.patch} (87%)
 rename meta-networking/recipes-connectivity/freeradius/files/{freeradius-fix-error-for-expansion-of-macro.patch => 0010-fix-error-for-expansion-of-macro-in-thread.h.patch} (95%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch => 0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch} (59%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch => 0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch} (92%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-raddb-certs-Makefile-fix-the-occasional-verification.patch => 0013-raddb-certs-Makefile-fix-the-occasional-verification.patch} (94%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-workaround-error-with-autoconf-2.7.patch => 0014-Workaround-error-with-autoconf-2.7.patch} (77%)
 rename meta-networking/recipes-connectivity/freeradius/files/{check-openssl-cmds-in-script-bootstrap.patch => 0015-bootstrap-check-commands-of-openssl-exist.patch} (81%)
 rename meta-networking/recipes-connectivity/freeradius/files/{0001-version.c-don-t-print-build-flags.patch => 0016-version.c-don-t-print-build-flags.patch} (86%)
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.21.bb => freeradius_3.0.27.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
new file mode 100644
index 000000000000..968998ddb6c3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-Add-autogen.sh.patch
@@ -0,0 +1,47 @@
+From 3be3b9a1345942d1578ec73efa9b2e3c41bd67c5 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 21 Jan 2022 13:22:24 +0800
+Subject: [PATCH] Add autogen.sh
+
+The autogen.sh has been removed since 3.0.22[1]. But we still need it in
+do_configure. Add it back.
+
+[1] https://github.com/FreeRADIUS/freeradius-server/commit/2e9b6227efd19e2b0926541aa26874908e7b7314
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ autogen.sh | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100755 autogen.sh
+
+diff --git a/autogen.sh b/autogen.sh
+new file mode 100755
+index 0000000000..959182b39e
+--- /dev/null
++++ b/autogen.sh
+@@ -0,0 +1,19 @@
++#!/bin/sh -e
++
++parentdir=`dirname $0`
++
++cd $parentdir
++parentdir=`pwd`
++m4include="-I$parentdir -I$parentdir/m4 -Im4"
++
++autoreconf -Wcross --verbose --install --force
++
++mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
++mysubdirs=`echo $mysubdirs`
++
++for F in $mysubdirs
++do
++	echo "Configuring in $F..."
++	(cd $F && grep "^AC_CONFIG_HEADER" configure.ac > /dev/null || exit 0; autoheader $m4include)
++	(cd $F && autoconf $m4include)
++done
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
similarity index 67%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
index 4a62bf1fa2ba..c57ee93c331a 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0002-Enable-and-change-user-and-group-of-freeradius-serve.patch
@@ -1,4 +1,8 @@
-Enable and change user and group of freeradius server to radiusd
+From 2a74c10836c0d2d19248ca40d113936f4a56b039 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Sun, 8 Jan 2023 22:47:11 +0800
+Subject: [PATCH] Enable and change user and group of freeradius server to
+ radiusd
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -9,10 +13,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/radiusd.conf.in b/raddb/radiusd.conf.in
-index c62f4ff..0b4a84e 100644
+index 154b50d610..4594d6d2d2 100644
 --- a/raddb/radiusd.conf.in
 +++ b/raddb/radiusd.conf.in
-@@ -436,8 +436,8 @@ security {
+@@ -557,8 +557,8 @@ security {
  	#  member.  This can allow for some finer-grained access
  	#  controls.
  	#
@@ -24,5 +28,5 @@ index c62f4ff..0b4a84e 100644
  	#  Core dumps are a bad thing.  This should only be set to
  	#  'yes' if you're debugging a problem with the server.
 -- 
-1.9.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
similarity index 85%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
index 38e7c362272c..e5442360b389 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 0780b7053fb0d33d721aa70ab2ecd75299e5ba31 Mon Sep 17 00:00:00 2001
+From ba1390a80662ff2ab7bfda978cde7df9a871f6ae Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 15:03:39 +0800
 Subject: [PATCH] configure.ac: allow cross-compilation
@@ -7,7 +7,7 @@ The checking OpenSSL library and header version consistency will
 always fail in cross compiling, skip the check and give a warning
 instead for cross compiling.
 
-Upstream-Status: Inappropriate[embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
@@ -19,10 +19,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
-index efc9f29..98a97e4 100644
+index a0f510cfb3..d2f3eca03e 100644
 --- a/src/modules/rlm_krb5/configure.ac
 +++ b/src/modules/rlm_krb5/configure.ac
-@@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
+@@ -140,7 +140,8 @@ if test x$with_[]modname != xno; then
  		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
  		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
  			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
@@ -33,5 +33,5 @@ index efc9f29..98a97e4 100644
  	else
  		krb5threadsafe=""
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
similarity index 73%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
index 4265f9d0de37..479e1ba76f98 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0004-Fix-libtool-detection.patch
@@ -1,9 +1,7 @@
-From bfe4d7ed72edc9d4ae1a0f0d2dd84367d6214886 Mon Sep 17 00:00:00 2001
+From 5ba3d140842268cbbdd983266efecb1fba5bdd59 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:45:46 +0800
-Subject: [PATCH 1/2] Fix libtool detection
-
-Upstream-Status: pending
+Subject: [PATCH] Fix libtool detection
 
 Use LT_INIT instead of the deprecated AC_PROG_LIBTOOL to detect libtool, so it
 can work with our libtoolize and libtool.
@@ -12,37 +10,20 @@ Simplify the detection of ltdl. It will find the ltdl from the sysroot; the
 switch --with-system-libltdl is no longer needed. The code is copied from
 pulseaudio configure.ac, together with the comment paragraph.
 
-Also patch autogen.sh so it uses autoreconf, which handles libtoolize better.
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- autogen.sh   |  5 +----
  configure.ac | 36 ++++++++++++++++++++++++++++++++++++
- 2 files changed, 37 insertions(+), 4 deletions(-)
+ 1 file changed, 36 insertions(+)
 
-diff --git a/autogen.sh b/autogen.sh
-index a1d08a6..959182b 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -6,10 +6,7 @@ cd $parentdir
- parentdir=`pwd`
- m4include="-I$parentdir -I$parentdir/m4 -Im4"
- 
--libtoolize -f -c
--#aclocal
--autoheader
--autoconf
-+autoreconf -Wcross --verbose --install --force
- 
- mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
- mysubdirs=`echo $mysubdirs`
 diff --git a/configure.ac b/configure.ac
-index a7abf00..65db61e 100644
+index ad8bc8cdda..ef8fced680 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -220,6 +220,42 @@ dnl #  See if we have Git.
+@@ -321,6 +321,42 @@ dnl #  See if we have Git.
  dnl #
  AC_CHECK_PROG(GIT, git, yes, no)
  
@@ -86,5 +67,5 @@ index a7abf00..65db61e 100644
  dnl AC_ARG_WITH(disablemodulefoo,
  dnl [  --without-rlm_foo         Disables module compilation.  Module list:]
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
similarity index 87%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
index 47193587229c..8ef3c4bdf9ef 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0005-configure.ac-add-option-for-libcap.patch
@@ -1,7 +1,7 @@
-From 98a9eff357959d1113e33a615c2178751d5b2054 Mon Sep 17 00:00:00 2001
+From 9548dc5e1a6c835cd4f387ba384d8f3f14c3fc8b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 22 Aug 2019 10:50:21 +0800
-Subject: [PATCH 2/2] configure.ac: add option for libcap
+Subject: [PATCH] configure.ac: add option for libcap
 
 Upstream-Status: Pending
 
@@ -12,10 +12,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 27 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 65db61e..6486aac 100644
+index ef8fced680..263098f7fd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -977,6 +977,22 @@ fi
+@@ -1161,6 +1161,22 @@ fi
  dnl Set by FR_SMART_CHECKLIB
  LIBS="${old_LIBS}"
  
@@ -38,7 +38,7 @@ index 65db61e..6486aac 100644
  dnl Check for cap
  dnl extra argument: --with-cap-lib-dir=DIR
  cap_lib_dir=
-@@ -1010,15 +1026,17 @@ AC_ARG_WITH(cap-include-dir,
+@@ -1194,15 +1210,17 @@ AC_ARG_WITH(cap-include-dir,
        ;;
    esac])
  
@@ -66,5 +66,5 @@ index 65db61e..6486aac 100644
  
  dnl #
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
similarity index 85%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
index 9c997661fc8f..8fd0dca443ea 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
@@ -1,14 +1,15 @@
-From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00 2001
+From 8fe25b30b6fbb3170705f4468eb4c92eef3a968f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Mon, 4 Jan 2016 01:44:04 -0500
-Subject: [PATCH] avoid searching host dirs
+Subject: [PATCH] Avoid searching host dirs
 
 Don't search the hardcoded host dirs to avoid
 host contamination.
 
-Upstream-Status: Inappropriate [cross-compile specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  acinclude.m4                                                | 4 ++--
  src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
@@ -21,19 +22,19 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  8 files changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/acinclude.m4 b/acinclude.m4
-index da48acc..b513ae1 100644
+index a953d0e1b6..ede143d3c2 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -178,7 +178,7 @@ if test "x$smart_lib" = "x"; then
-   FR_LOCATE_DIR(smart_lib_dir,[lib$1${libltdl_cv_shlibext}])
-   FR_LOCATE_DIR(smart_lib_dir,[lib$1.a])
- 
--  for try in $smart_lib_dir /usr/local/lib /opt/lib; do
+@@ -115,7 +115,7 @@ dnl #
+ dnl #  Try to guess possible locations.
+ dnl #
+ if test "x$smart_lib" = "x"; then
+-  for try in /usr/local/lib /opt/lib; do
 +  for try in $smart_lib_dir; do
      AC_MSG_CHECKING([for $2 in -l$1 in $try])
      LIBS="-l$1 $old_LIBS"
      CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
-@@ -218,7 +218,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+@@ -155,7 +155,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
  old_CPPFLAGS="$CPPFLAGS"
  smart_include=
  dnl #  The default directories we search in (in addition to the compilers search path)
@@ -43,10 +44,10 @@ index da48acc..b513ae1 100644
  dnl #  Our local versions
  _smart_try_dir=
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-index 75c851a..a262d71 100644
+index 44f84aa27e..23a1899591 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -ldb2
@@ -64,10 +65,10 @@ index 75c851a..a262d71 100644
  	if test "x$ac_cv_header_sqlcli_h" != xyes; then
  		fail="$fail sqlcli.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-index 4da57b3..752b043 100644
+index 4c2fd7ba9e..10c864def5 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-@@ -56,14 +56,14 @@ if test x$with_[]modname != xno; then
+@@ -60,14 +60,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for isc_attach_database in -lfbclient
@@ -85,10 +86,10 @@ index 4da57b3..752b043 100644
  	if test "x$ac_cv_header_ibase_h" != xyes; then
  		fail="$fail ibase.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-index ba6304f..3393557 100644
+index d26ac9c431..6e4500e948 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -liodbc
@@ -106,10 +107,10 @@ index ba6304f..3393557 100644
  	if test "x$ac_cv_header_isql_h" != xyes; then
  		fail="$fail isql.h"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-index 1401677..2e7db44 100644
+index df36da77bf..31359041c7 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-@@ -136,7 +136,7 @@ if test x$with_[]modname != xno; then
+@@ -140,7 +140,7 @@ if test x$with_[]modname != xno; then
  
  	dnl # Check for libmysqlclient_r
  	if test "x$have_a_libmysqlclient" != "xyes"; then
@@ -118,7 +119,7 @@ index 1401677..2e7db44 100644
  	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
  	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
  			have_a_libmysqlclient='yes'
-@@ -145,7 +145,7 @@ if test x$with_[]modname != xno; then
+@@ -149,7 +149,7 @@ if test x$with_[]modname != xno; then
  
  	dnl # Check for libmysqlclient
  	if test "x$have_a_libmysqlclient" != "xyes"; then
@@ -127,7 +128,7 @@ index 1401677..2e7db44 100644
  	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
  	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
  			have_a_libmysqlclient='yes'
-@@ -189,7 +189,7 @@ if test x$with_[]modname != xno; then
+@@ -243,7 +243,7 @@ if test x$with_[]modname != xno; then
      fi
  
      if test "x$have_mysql_h" != "xyes"; then
@@ -137,10 +138,10 @@ index 1401677..2e7db44 100644
  		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
  	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-index 3178462..5cbc8c2 100644
+index 3b45da582a..03e6607d2b 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-@@ -63,7 +63,7 @@ if test x$with_[]modname != xno; then
+@@ -68,7 +68,7 @@ if test x$with_[]modname != xno; then
      dnl # Check for header files
      dnl ############################################################
  
@@ -150,10 +151,10 @@ index 3178462..5cbc8c2 100644
      if test "x$ORACLE_HOME" != "x"; then
  	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-index 4f9a890..e1cf811 100644
+index 8ac1022e89..d46c0f66bf 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-@@ -41,7 +41,7 @@ if test x$with_[]modname != xno; then
+@@ -45,7 +45,7 @@ if test x$with_[]modname != xno; then
  	  esac ]
  	)
  
@@ -162,7 +163,7 @@ index 4f9a890..e1cf811 100644
  	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
  	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
  		fail="$fail libpq-fe.h"
-@@ -76,7 +76,7 @@ if test x$with_[]modname != xno; then
+@@ -94,7 +94,7 @@ if test x$with_[]modname != xno; then
  		  ])
  	fi
  
@@ -172,10 +173,10 @@ index 4f9a890..e1cf811 100644
  	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
  		fail="$fail libpq"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-index 3545387..c543ed4 100644
+index f10279fe1f..0081a338c8 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
  		esac])
  
  	dnl Check for SQLConnect in -lodbc
@@ -193,5 +194,5 @@ index 3545387..c543ed4 100644
  	if test "x$ac_cv_header_sql_h" != xyes; then
  		fail="$fail sql.h"
 -- 
-1.9.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
index 675940dd6c53..cb71fb13732b 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
@@ -1,14 +1,14 @@
-From a0bf65e04d2bbd3271cab94bd5ac93f8e877bfc5 Mon Sep 17 00:00:00 2001
+From e4ff7a2a9834e2589bc7bdda4b74f5bc962b15e6 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 27 Jan 2016 05:07:19 -0500
 Subject: [PATCH] rlm_python: add PY_INC_DIR in search dir
 
-Upstream-Status: Pending
-
 configure option --with-rlm-python-include-dir is used to set
 PY_INC_DIR which is never used and it fails to find Python.h,
 so add it into search dir to fix it.
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
@@ -16,10 +16,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_python/configure.ac b/src/modules/rlm_python/configure.ac
-index 831a33a..c3792d8 100644
+index 08ecb62518..d5c0944ff1 100644
 --- a/src/modules/rlm_python/configure.ac
 +++ b/src/modules/rlm_python/configure.ac
-@@ -93,7 +93,7 @@ if test x$with_[]modname != xno; then
+@@ -98,7 +98,7 @@ if test x$with_[]modname != xno; then
  
  		old_CFLAGS=$CFLAGS
  		CFLAGS="$CFLAGS $PY_CFLAGS"
@@ -29,5 +29,5 @@ index 831a33a..c3792d8 100644
  		CFLAGS=$old_CFLAGS
  
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
similarity index 91%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
index 1954586b2bfd..559b857b637a 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0008-libtool-do-not-use-jlibtool.patch
@@ -1,4 +1,4 @@
-From 16bf899447fc1524ffc3c79e1d35380e5285a552 Mon Sep 17 00:00:00 2001
+From d0fa5b259c2dc942d0a43a9cf1bfc32f40c184f9 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 7 Jan 2016 22:37:30 -0800
 Subject: [PATCH] libtool: do not use jlibtool
@@ -7,7 +7,7 @@ jlibtool is hardcoded to be used but we need to use
 our libtool, so fix the makfiles to make it compatible
 with our libtool.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
@@ -19,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  4 files changed, 27 insertions(+), 15 deletions(-)
 
 diff --git a/Make.inc.in b/Make.inc.in
-index 7a77625..fd8aa3e 100644
+index 05f82776ff..e78f3fe9dc 100644
 --- a/Make.inc.in
 +++ b/Make.inc.in
 @@ -57,7 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
@@ -31,7 +31,7 @@ index 7a77625..fd8aa3e 100644
  ACLOCAL		= @ACLOCAL@
  AUTOCONF	= @AUTOCONF@
  AUTOHEADER	= @AUTOHEADER@
-@@ -163,7 +163,7 @@ ANALYZE.c       := @clang_path@
+@@ -168,7 +168,7 @@ ANALYZE.c       := @clang_path@
  #
  ifeq "$(USE_SHARED_LIBS)" "yes"
  	TESTBINDIR = ./$(BUILD_DIR)/bin/local
@@ -41,10 +41,10 @@ index 7a77625..fd8aa3e 100644
  	TESTBINDIR = ./$(BUILD_DIR)/bin
  	TESTBIN    = ./$(BUILD_DIR)/bin
 diff --git a/scripts/boiler.mk b/scripts/boiler.mk
-index bccec5e..926a13e 100644
+index 2ce0c18f34..567cc0f22f 100644
 --- a/scripts/boiler.mk
 +++ b/scripts/boiler.mk
-@@ -266,6 +266,7 @@ define COMPILE_C_CMDS
+@@ -272,6 +272,7 @@ define COMPILE_C_CMDS
  	$(Q)$(ECHO) CC $<
  	$(Q)$(strip ${COMPILE.c} -o $@ -c -MD ${CPPFLAGS} ${CFLAGS} ${SRC_CFLAGS} ${INCDIRS} \
  	    $(addprefix -I, ${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} $<)
@@ -52,7 +52,7 @@ index bccec5e..926a13e 100644
  endef
  else
  #
-@@ -281,6 +282,7 @@ define COMPILE_C_CMDS
+@@ -287,6 +288,7 @@ define COMPILE_C_CMDS
  	$(Q)cppcheck --enable=style -q ${CHECKFLAGS} $(filter -isystem%,${SRC_CFLAGS}) \
  	     $(filter -I%,${SRC_CFLAGS}) $(filter -D%,${SRC_CFLAGS}) ${INCDIRS} \
  	     $(addprefix -I,${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} --suppress=variableScope --suppress=invalidscanf $<
@@ -61,7 +61,7 @@ index bccec5e..926a13e 100644
  endif
  
 diff --git a/scripts/install.mk b/scripts/install.mk
-index 9164115..e38c1ed 100644
+index 916411563b..e38c1ed697 100644
 --- a/scripts/install.mk
 +++ b/scripts/install.mk
 @@ -46,7 +46,7 @@ define ADD_INSTALL_RULE.exe
@@ -116,10 +116,10 @@ index 9164115..e38c1ed 100644
  
  
 diff --git a/scripts/libtool.mk b/scripts/libtool.mk
-index 57915e1..2cb2f7d 100644
+index 381127ec2d..e83d7e6ad7 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -55,7 +55,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+@@ -60,7 +60,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
      # Tell GNU Make to use this value, rather than anything specified
      # on the command line.
      override LIBTOOL := ${JLIBTOOL}
@@ -130,7 +130,7 @@ index 57915e1..2cb2f7d 100644
  
  # When using libtool, it produces a '.libs' directory.  Ensure that it
  # is removed on "make clean", too.
-@@ -69,11 +71,19 @@ clean: .libs_clean
+@@ -74,11 +76,19 @@ clean: .libs_clean
  # Re-define compilers and linkers
  #
  OBJ_EXT = lo
@@ -156,5 +156,5 @@ index 57915e1..2cb2f7d 100644
  
  # LIBTOOL_ENDINGS - Given a library ending in ".a" or ".so", replace that
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
similarity index 87%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
index b0929c4b076e..9386675e46b2 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0009-Fix-quoting-for-BUILD_WITH.patch
@@ -1,4 +1,7 @@
-Fix quoting for BUILD_WITH
+From 3e701d6274924adaed568e22af2362aa5af1f055 Mon Sep 17 00:00:00 2001
+From: Peter Seebach <peter.seebach@windriver.com>
+Date: Sun, 8 Jan 2023 23:01:28 +0800
+Subject: [PATCH] Fix quoting for BUILD_WITH
 
 The escaped quotes are to make the -D values produce strings which
 can be used to display these values. However, if the values are more
@@ -16,7 +19,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/main/libfreeradius-server.mk b/src/main/libfreeradius-server.mk
-index 4495f72..07c28f1 100644
+index 4495f72481..07c28f1968 100644
 --- a/src/main/libfreeradius-server.mk
 +++ b/src/main/libfreeradius-server.mk
 @@ -18,5 +18,5 @@ SOURCES	:=	conffile.c \
@@ -27,7 +30,7 @@ index 4495f72..07c28f1 100644
 +SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
  endif
 diff --git a/src/main/unittest.mk b/src/main/unittest.mk
-index 09f3938..ed33952 100644
+index edd4f133a7..b5b44d5e11 100644
 --- a/src/main/unittest.mk
 +++ b/src/main/unittest.mk
 @@ -21,5 +21,5 @@ TGT_PREREQS	+= libfreeradius-eap.a
@@ -38,7 +41,7 @@ index 09f3938..ed33952 100644
 +SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
  endif
 diff --git a/src/modules/rlm_eap/radeapclient.mk b/src/modules/rlm_eap/radeapclient.mk
-index 6068f54..7d3c556 100644
+index 6068f54813..7d3c55625b 100644
 --- a/src/modules/rlm_eap/radeapclient.mk
 +++ b/src/modules/rlm_eap/radeapclient.mk
 @@ -23,7 +23,7 @@ SRC_CFLAGS += -DWITH_EAPCLIENT
@@ -51,5 +54,5 @@ index 6068f54..7d3c556 100644
  
  endif
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
similarity index 95%
rename from meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
index af1bff051fde..051b66af8fb4 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
@@ -1,4 +1,4 @@
-From 5b6d8b14f2696fcf1dca119212f9d0a0fa04defd Mon Sep 17 00:00:00 2001
+From 30ce5ccd62446349d432ff65d3fe8d46872423c8 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 18 Jan 2017 14:59:39 +0800
 Subject: [PATCH] fix error for expansion of macro in thread.h
@@ -22,7 +22,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/include/threads.h b/src/include/threads.h
-index e36d81d..2bcb6aa 100644
+index e36d81dac0..2bcb6aadcb 100644
 --- a/src/include/threads.h
 +++ b/src/include/threads.h
 @@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
@@ -57,5 +57,5 @@ index e36d81d..2bcb6aa 100644
  #endif
  #endif
 -- 
-2.10.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
similarity index 59%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
index db8caab12e83..69125eb3cb69 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
@@ -1,4 +1,4 @@
-From 66e8bcdcca8971b5c43c31755d56d7f675d8b5ff Mon Sep 17 00:00:00 2001
+From f0e764826e3a85488047f7f4e94ebf91460d2c12 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Jun 2017 20:10:49 -0700
 Subject: [PATCH] rlm_mschap: Use includedir instead of hardcoding /usr/include
@@ -13,12 +13,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/modules/rlm_mschap/configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
-===================================================================
---- freeradius-server-3.0.14.orig/src/modules/rlm_mschap/configure.ac
-+++ freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
-@@ -72,7 +72,7 @@ if test x$with_[]modname != xno; then
-         mod_ldflags="-framework DirectoryService"
+diff --git a/src/modules/rlm_mschap/configure.ac b/src/modules/rlm_mschap/configure.ac
+index 0fd105d7e6..6ab15509e5 100644
+--- a/src/modules/rlm_mschap/configure.ac
++++ b/src/modules/rlm_mschap/configure.ac
+@@ -75,7 +75,7 @@ if test x$with_[]modname != xno; then
+         mod_ldflags="-F /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks -framework DirectoryService"
      fi
  
 -    smart_try_dir="$winbind_include_dir /usr/include/samba-4.0"
@@ -26,3 +26,6 @@ Index: freeradius-server-3.0.14/src/modules/rlm_mschap/configure.ac
      FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
  					#include <stdbool.h>])
      if test "x$ac_cv_header_wbclient_h" != "xyes"; then
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
similarity index 92%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
index 669f363e7274..cbac98928498 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
@@ -1,4 +1,4 @@
-From 084f5467672f2ae37003b77e8f8706772f3da3ec Mon Sep 17 00:00:00 2001
+From 0f9f18fc330fe88080be13e43f300fbf7ba4a85a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 13 Jul 2020 07:01:45 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the existed certificate error
@@ -29,13 +29,13 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index 5cbfd467ce..77eec9baa1 100644
+index c9fbc9e864..d064fe252d 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -92,7 +92,7 @@ server.csr server.key: server.cnf
  	chmod g+r server.key
  
- server.crt: server.csr ca.key ca.pem
+ server.crt: ca.key ca.pem server.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
 +	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
  
@@ -44,12 +44,12 @@ index 5cbfd467ce..77eec9baa1 100644
 @@ -117,7 +117,7 @@ client.csr client.key: client.cnf
  	chmod g+r client.key
  
- client.crt: client.csr ca.pem ca.key
+ client.crt: ca.key ca.pem client.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
 +	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
  
  client.p12: client.crt
  	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
similarity index 94%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
index dce0427e1a72..287e47adccaf 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0013-raddb-certs-Makefile-fix-the-occasional-verification.patch
@@ -1,4 +1,4 @@
-From 3eda5d35fbaf66ed6bdc86ada4320a0a18681b7e Mon Sep 17 00:00:00 2001
+From bb1cb2ffc7a31c0a2bb2de51ef82d304b0a107c3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 5 Aug 2020 07:23:11 +0000
 Subject: [PATCH] raddb/certs/Makefile: fix the occasional verification failure
@@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 15 insertions(+), 15 deletions(-)
 
 diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
-index 77eec9baa1..3dcb63fe71 100644
+index d064fe252d..86f4547804 100644
 --- a/raddb/certs/Makefile
 +++ b/raddb/certs/Makefile
 @@ -59,7 +59,7 @@ passwords.mk: server.cnf ca.cnf client.cnf inner-server.cnf
@@ -71,7 +71,7 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f server.csr ] || $(OPENSSL) req -new  -out server.csr -keyout server.key -config ./server.cnf
  	chmod g+r server.key
  
- server.crt: server.csr ca.key ca.pem
+ server.crt: ca.key ca.pem server.csr
  	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
  
  server.p12: server.crt
@@ -85,7 +85,7 @@ index 77eec9baa1..3dcb63fe71 100644
  	chmod g+r server.pem
  
  .PHONY: server.vrfy
-@@ -113,18 +113,18 @@ server.vrfy: ca.pem
+@@ -113,19 +113,19 @@ server.vrfy: ca.pem
  #
  ######################################################################
  client.csr client.key: client.cnf
@@ -93,13 +93,14 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f client.csr ] || $(OPENSSL) req -new  -out client.csr -keyout client.key -config ./client.cnf
  	chmod g+r client.key
  
- client.crt: client.csr ca.pem ca.key
+ client.crt: ca.key ca.pem client.csr
  	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
  
  client.p12: client.crt
 -	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
 +	@[ -f client.p12 ] || $(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
  	chmod g+r client.p12
+ 	cp client.p12 $(USER_NAME).p12
  
  client.pem: client.p12
 -	$(OPENSSL) pkcs12 -in client.p12 -out client.pem -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
@@ -107,7 +108,7 @@ index 77eec9baa1..3dcb63fe71 100644
  	chmod g+r client.pem
  	cp client.pem $(USER_NAME).pem
  
-@@ -139,18 +139,18 @@ client.vrfy: ca.pem client.pem
+@@ -140,18 +140,18 @@ client.vrfy: ca.pem client.pem
  #
  ######################################################################
  inner-server.csr inner-server.key: inner-server.cnf
@@ -115,7 +116,7 @@ index 77eec9baa1..3dcb63fe71 100644
 +	@[ -f inner-server.csr] || $(OPENSSL) req -new  -out inner-server.csr -keyout inner-server.key -config ./inner-server.cnf
  	chmod g+r inner-server.key
  
- inner-server.crt: inner-server.csr ca.key ca.pem
+ inner-server.crt: ca.key ca.pem inner-server.csr
 -	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
 +	@[ -f inner-server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
  
@@ -131,5 +132,5 @@ index 77eec9baa1..3dcb63fe71 100644
  
  .PHONY: inner-server.vrfy
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
similarity index 77%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
index 80c571df98f6..17eadc7e5991 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0014-Workaround-error-with-autoconf-2.7.patch
@@ -1,7 +1,7 @@
-From 3b4ba29c7c5800df87eecd65214244619e01162b Mon Sep 17 00:00:00 2001
+From c591da4a361496eec93625cf8c4f89bddfedaca7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 7 Feb 2021 16:02:36 +0800
-Subject: [PATCH] workaround error with autoconf 2.7
+Subject: [PATCH] Workaround error with autoconf 2.7
 
 While using autoconf 2.7, the AM_MISSING_PROG caused unexpected error:
 ...
@@ -11,7 +11,7 @@ configure.ac: error: required file 'missing' not found
 Since these tools were explicitly added by autotools bbclass,
 remove the testing to workaround the error with autoconf 2.7
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 609efb104b..2d761cf62c 100644
+index 263098f7fd..fc296832d8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -693,14 +693,6 @@ fi
+@@ -878,14 +878,6 @@ fi
  
  AC_PATH_PROG(RUSERS, rusers, /usr/bin/rusers)
  
@@ -34,9 +34,9 @@ index 609efb104b..2d761cf62c 100644
 -AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
 -AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
 -
- AC_PATH_PROG(LOCATE,locate)
  AC_PATH_PROG(DIRNAME,dirname)
  AC_PATH_PROG(GREP,grep)
+ 
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
index fcadae93a0b1..d1d011160793 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0015-bootstrap-check-commands-of-openssl-exist.patch
@@ -1,4 +1,7 @@
-bootstrap: check commands of openssl exist
+From 78494ea005bd38324953b05176d6eb2c3f55af2c Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sun, 8 Jan 2023 23:21:24 +0800
+Subject: [PATCH] bootstrap: check commands of openssl exist
 
 It calls openssl commands dhparam and pkcs12 in script bootstrap. These
 commands are configurable based on configure options 'no-dh' and
@@ -18,7 +21,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/raddb/certs/bootstrap b/raddb/certs/bootstrap
-index 0f719aafd4..17feddbeeb 100755
+index 57de8cf0d7..4641c71700 100755
 --- a/raddb/certs/bootstrap
 +++ b/raddb/certs/bootstrap
 @@ -13,6 +13,14 @@
@@ -36,3 +39,6 @@ index 0f719aafd4..17feddbeeb 100755
  make -h > /dev/null 2>&1
  
  #
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
similarity index 86%
rename from meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
rename to meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
index 697205efe0b1..2d67fdef05ab 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
@@ -1,11 +1,11 @@
-From cbc64dcf6aa2a1be63f45ea6dd7d2c49b70a0bee Mon Sep 17 00:00:00 2001
+From cbbb62ddda5c189c225f96bf6b599b3b3e8c8252 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 3 Aug 2022 16:44:29 +0800
 Subject: [PATCH] version.c: don't print build flags
 
 Don't print the build flags to avoid collecting the build environment info.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
@@ -13,7 +13,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/src/main/version.c b/src/main/version.c
-index 62972d9f53..cf81de72c9 100644
+index f1f1e87810..3ffcbb25a0 100644
 --- a/src/main/version.c
 +++ b/src/main/version.c
 @@ -589,19 +589,6 @@ void version_print(void)
diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
deleted file mode 100644
index 4ea519c75227..000000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From f1cdbb33ec61c4a64a32e107d4d02f936051c708 Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Mon, 7 Feb 2022 22:26:05 -0500
-Subject: [PATCH] it's probably wrong to be completely retarded.  Let's fix
- that.
-
-CVE: CVE-2022-41860
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/f1cdbb33ec61c4a64a32e107d4d02f936051c708]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/modules/rlm_eap/libeap/eapsimlib.c | 69 +++++++++++++++++++-------
- 1 file changed, 52 insertions(+), 17 deletions(-)
-
-diff --git a/src/modules/rlm_eap/libeap/eapsimlib.c b/src/modules/rlm_eap/libeap/eapsimlib.c
-index cf1e8a7dd9..e438a844ea 100644
---- a/src/modules/rlm_eap/libeap/eapsimlib.c
-+++ b/src/modules/rlm_eap/libeap/eapsimlib.c
-@@ -307,42 +307,77 @@ int unmap_eapsim_basictypes(RADIUS_PACKET *r,
- 	newvp->vp_length = 1;
- 	fr_pair_add(&(r->vps), newvp);
- 
-+	/*
-+	 *	EAP-SIM has a 1 octet of subtype, and 2 octets
-+	 *	reserved.
-+	 */
- 	attr     += 3;
- 	attrlen  -= 3;
- 
--	/* now, loop processing each attribute that we find */
--	while(attrlen > 0) {
-+	/*
-+	 *	Loop over each attribute.  The format is:
-+	 *
-+	 *	1 octet of type
-+	 *	1 octet of length (value 1..255)
-+	 *	((4 * length) - 2) octets of data.
-+	 */
-+	while (attrlen > 0) {
- 		uint8_t *p;
- 
--		if(attrlen < 2) {
-+		if (attrlen < 2) {
- 			fr_strerror_printf("EAP-Sim attribute %d too short: %d < 2", es_attribute_count, attrlen);
- 			return 0;
- 		}
- 
-+		if (!attr[1]) {
-+			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has no data", eapsim_attribute,
-+					   es_attribute_count);
-+			return 0;
-+		}
-+
- 		eapsim_attribute = attr[0];
- 		eapsim_len = attr[1] * 4;
- 
-+		/*
-+		 *	The length includes the 2-byte header.
-+		 */
- 		if (eapsim_len > attrlen) {
- 			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length longer than data (%d > %d)",
- 					   eapsim_attribute, es_attribute_count, eapsim_len, attrlen);
- 			return 0;
- 		}
- 
--		if(eapsim_len > MAX_STRING_LEN) {
--			eapsim_len = MAX_STRING_LEN;
--		}
--		if (eapsim_len < 2) {
--			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length too small", eapsim_attribute,
--					   es_attribute_count);
--			return 0;
--		}
-+		newvp = fr_pair_afrom_num(r, eapsim_attribute + PW_EAP_SIM_BASE, 0);
-+		if (!newvp) {
-+			/*
-+			 *	RFC 4186 Section 8.1 says 0..127 are
-+			 *	"non-skippable".  If one such
-+			 *	attribute is found and we don't
-+			 *	understand it, the server has to send:
-+			 *
-+			 *	EAP-Request/SIM/Notification packet with an
-+			 *	(AT_NOTIFICATION code, which implies general failure ("General
-+			 *	failure after authentication" (0), or "General failure" (16384),
-+			 *	depending on the phase of the exchange), which terminates the
-+			 *	authentication exchange.
-+			 */
-+			if (eapsim_attribute <= 127) {
-+				fr_strerror_printf("Unknown mandatory attribute %d, failing",
-+						   eapsim_attribute);
-+				return 0;
-+			}
- 
--		newvp = fr_pair_afrom_num(r, eapsim_attribute+PW_EAP_SIM_BASE, 0);
--		newvp->vp_length = eapsim_len-2;
--		newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
--		memcpy(p, &attr[2], eapsim_len-2);
--		fr_pair_add(&(r->vps), newvp);
--		newvp = NULL;
-+		} else {
-+			/*
-+			 *	It's known, ccount for header, and
-+			 *	copy the value over.
-+			 */
-+			newvp->vp_length = eapsim_len - 2;
-+
-+			newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
-+			memcpy(p, &attr[2], newvp->vp_length);
-+			fr_pair_add(&(r->vps), newvp);
-+		}
- 
- 		/* advance pointers, decrement length */
- 		attr += eapsim_len;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
deleted file mode 100644
index 352c02137ad5..000000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0ec2b39d260e08e4c3464f6b95005821dc559c62 Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Mon, 28 Feb 2022 10:34:15 -0500
-Subject: [PATCH] manual port of commit 5906bfa1
-
-CVE: CVE-2022-41861
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/0ec2b39d260e08e4c3464f6b95005821dc559c62]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/lib/filters.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/filters.c b/src/lib/filters.c
-index 4868cd385d..3f3b63daee 100644
---- a/src/lib/filters.c
-+++ b/src/lib/filters.c
-@@ -1205,13 +1205,19 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
- 			}
- 		}
- 	} else if (filter->type == RAD_FILTER_GENERIC) {
--		int count;
-+		size_t count, masklen;
-+
-+		masklen = ntohs(filter->u.generic.len);
-+		if (masklen >= sizeof(filter->u.generic.mask)) {
-+			*p = '\0';
-+			return;
-+		}
- 
- 		i = snprintf(p, outlen, " %u ", (unsigned int) ntohs(filter->u.generic.offset));
- 		p += i;
- 
- 		/* show the mask */
--		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
-+		for (count = 0; count < masklen; count++) {
- 			i = snprintf(p, outlen, "%02x", filter->u.generic.mask[count]);
- 			p += i;
- 			outlen -= i;
-@@ -1222,7 +1228,7 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
- 		outlen--;
- 
- 		/* show the value */
--		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
-+		for (count = 0; count < masklen; count++) {
- 			i = snprintf(p, outlen, "%02x", filter->u.generic.value[count]);
- 			p += i;
- 			outlen -= i;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.27.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.27.bb
index db37f65918f3..27cc12c34735 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.27.bb
@@ -16,30 +16,31 @@ DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0;;protocol=https \
     file://freeradius \
     file://volatiles.58_radiusd \
-    file://freeradius-enble-user-in-conf.patch \
-    file://freeradius-configure.ac-allow-cross-compilation.patch \
-    file://freeradius-libtool-detection.patch \
-    file://freeradius-configure.ac-add-option-for-libcap.patch \
-    file://freeradius-avoid-searching-host-dirs.patch \
-    file://freeradius-rlm_python-add-PY_INC_DIR.patch \
-    file://freeradius-libtool-do-not-use-jlibtool.patch \
-    file://freeradius-fix-quoting-for-BUILT_WITH.patch \
-    file://freeradius-fix-error-for-expansion-of-macro.patch \
-    file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
-    file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
-    file://0001-raddb-certs-Makefile-fix-the-occasional-verification.patch \
-    file://0001-workaround-error-with-autoconf-2.7.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
-    file://check-openssl-cmds-in-script-bootstrap.patch \
-    file://0001-version.c-don-t-print-build-flags.patch \
-    file://CVE-2022-41860.patch \
-    file://CVE-2022-41861.patch \
+    file://0001-Add-autogen.sh.patch \
+    file://0002-Enable-and-change-user-and-group-of-freeradius-serve.patch \
+    file://0003-configure.ac-allow-cross-compilation.patch \
+    file://0004-Fix-libtool-detection.patch \
+    file://0005-configure.ac-add-option-for-libcap.patch \
+    file://0006-Avoid-searching-host-dirs.patch \
+    file://0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch \
+    file://0008-libtool-do-not-use-jlibtool.patch \
+    file://0009-Fix-quoting-for-BUILD_WITH.patch \
+    file://0010-fix-error-for-expansion-of-macro-in-thread.h.patch \
+    file://0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
+    file://0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
+    file://0013-raddb-certs-Makefile-fix-the-occasional-verification.patch \
+    file://0014-Workaround-error-with-autoconf-2.7.patch \
+    file://0015-bootstrap-check-commands-of-openssl-exist.patch \
+    file://0016-version.c-don-t-print-build-flags.patch \
 "
 
 raddbdir="${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
+SRCREV = "f317c5b2668a4de7065df46b31267cd6ff32ddf1"
+
+UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
 CVE_CHECK_IGNORE = "\
     CVE-2002-0318 \
-- 
2.34.1


