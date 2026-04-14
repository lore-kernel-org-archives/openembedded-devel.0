Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E47EED7B86
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13678.1776153346295807883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i/w0Vi4Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DNiTcN1269595
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3JD7N6B/fcj1zLOLDxhdgtgggjKVvQBQ3HyTDnE0Vac=; b=i/w0Vi4Y4WxS
	LNHOhHBWmUTOiX2wTApi8c10dztKCcKQD35j5X7a6Hl9QrM0wFUsZokzaViTasDa
	flK8OKtEk3aHd/31Q18TBagrU7SdTYm0qyZHgIMXKVSY5QOsEcXQj8cruIx0YKs6
	bXRMjlYMVNvzqbKt4oHlJvIhCM3Z/0N66ExJ2r+NYgxeuLZxwO5SUIoaE04oFHIu
	wn7y5JlF90ntWOFWsUcaJsVqqP/LvXBje3ot/KJSOJh3Dq5ac5fM1g6NQdqx8wvs
	/O/J0q5UoODl8uCUVVz5qEX49qNPJvyIdnAsNpnWEnquJlNZ1w9uSlTNE7NYcejh
	F333q2afvg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877gekv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0jIx40cHeo1OLQGmthLtxb5/juHdVVveT8Nzja0yM46GTG4jbWU9zMAIqj8z8VrC6t6g2PSaa1q5292L19/6gDE3Wv0fo3qIACQXeTEp0zY9VUxzdPxtTnFa9fnSfllnveEoWL5wDEBZaxBa9bQhPomrAmVDaG3SjfeFK0zRnKfLuR1A7Ycb0RgC395qsvBi128rBg4ZY1vnKmDnAjyPip3nkVLjybdKYmk+q4xWrQfZvKvpkF1tMYGD2ETd/avgkQQVVmukKiF/JG0VDRdunhakUN9cgD3KBQFul/uzy8pO++fBWg5eroXUbHMfk7+L2ztnPyyyy3gNjidW+sP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JD7N6B/fcj1zLOLDxhdgtgggjKVvQBQ3HyTDnE0Vac=;
 b=HNtFbHCKJ9LvVshO3i9CqU0toThfQx/Csvub8hh71ShQh8/jQ66I+wg5iksmevhK/oGDLOXbWfCxgdXH2AhLZMU9Rya13MHXEobUzkJyklJA6Zd4RBu9F8MuDI4E8wSDf8QpAABdSKyG4X8ke+onlUf8vywRyfm3o+Z+HqHNQKRfj/t9635hkXP4V3ecCQ6Mg6kK3vEKRBXLQMIlvqbHYDD2eMamhgAWJTeswTbyBaueAlsoJShvF6nVwgwMs7NEzQM99PI5j42WBnh9w+oluu6wrIq4ZFJub3rn3co5wSqbaC63o/3+y0ek53yoZI6TjqBhpdIDI6B2dHC9eEdliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:44 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:44 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 4/7] xfce4-panel: Remove x11 from REQUIRED_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 15:55:18 +0800
Message-Id: <20260414075521.91846-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414075521.91846-1-changqing.li@windriver.com>
References: <20260414075521.91846-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: d533719b-47ac-4312-480c-08de99fb3af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	T6nZpWH3XYwdG5rc/OtzRSQqGdIAcXJRAGoK2iSEdVGxG3ImU8G296sb+VQJEMa6oorw2LsqKm2WEzQjP1rh727HvEVL7wDMeMEZ0nBfYN414sqSqS0n6SmXjHKtuHBD/egQWc2juoclIegntuc3QJvLN8ChTIbmLNrlqjpeAHdEySnzAGJRaoKmF/lDLa2CxyjL1XVL8G/4ZJiWufPGyz4zRusRAeopjO5VoGHm2/uSOAs0Z4OBQpzjAmfbJ1EpRGKrQJxAQ/toQkwZUIHJlqoAe1aDhLcGAIM5XtEy3HwLqS2hkb3OECguUjIBhJt9at8PcVsM/HvNN2ahRC3fTO4iqhR7zpelia3J0dZO3A1zFzocGKYWJXmSxLzsSj9GJlGbTlDAgSXocQGuFqj25hRvPJHBaEn7wWVqDa1fGjrSaSZfphwr8FJEElPTXPO/wXfqYiUGpT/Femsj6rHDdDqozHLvHXJS5dHe9UlnsB+dQ+mU9XVjp6lsr3gCdCLNuyty6ZtVuCX/kgAjmCSkpZQhz6p8ety4UN4Q2/MyvX59JY36odvwNaeMuIa+3kpOT1aqzjOg5C7gPXTGl5xI8m7JScLgjPamTs0jEiKP0WYuDKd3a/v5QVLfExoSIdTIl7j0GnBcYEAWJ0JdYHTzycXRN6xtbH6+HwRAyN9uSxer4BrQonloHH0EoR02H2LybZ+Af4fPuYJ9dxgbESXYwlDm1efWY7j2KVtPVaEnBdXPhLoFFhbZitV8ptI6EfBUc5esxtSe0Us9OZ4e3+YB2RS8xRTm6W/9FhTdMCQN9OA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1DGQd2tTzvfyJFv1Zpmqd99VmyPfz+oZSrjDXfve9pBLAWVzop9gUimv+fkA?=
 =?us-ascii?Q?ks1wcrnxGH1QG/SaJP1wTmRLeeT9NXXPiNSICcY9EByOPuZVw36vtuwspeok?=
 =?us-ascii?Q?h1vckU4LxNoOCeqbEF5D85apXIYZLXkXZq5L023zBPiDQvX5kRQUXenzJQDH?=
 =?us-ascii?Q?3Q1RxDTAmWslmnlpAOaFBely/0X2h+lT9TZmSWg6ZTJq7Cxfy6rEizNWqXbK?=
 =?us-ascii?Q?4XGpsaTYjaaMS9DXrAhc1+dnQUTDopLCC7leBdAc0gJRlpjdemjVNfiHlSA3?=
 =?us-ascii?Q?dxzFtmgvH4Sd+o6jzaQgsGQAt721degcYNT2yNE0d86VhSziGn8mL2kp4pBL?=
 =?us-ascii?Q?I6yX1Uo1yPoeNh/AaRoe1jRNw3w/PjoFfrmAJMW+sBsLPJtQkzHFp/OqivwP?=
 =?us-ascii?Q?hKG4q1T0wzhzK+b2p8puIazCDxjnLNqSkua7d0hPTb6vPEURDXbpIamkc//P?=
 =?us-ascii?Q?aBoXc6gfDTb47f/DKHOAmTytEFHKUyqfTNEkMAjob94ReIxUrhfFDhIFe0xM?=
 =?us-ascii?Q?oQ5nvKIDAK/qEGJT1N5wpicYC33M8zy/uumyFDpAniFaUmvx/J8jaCiPqd8V?=
 =?us-ascii?Q?5TlOQLk8RIAj53AqQjOZQj5tx0RZ6GIg4om6IpNn4/wRhbeF6RqJn6vNgp6G?=
 =?us-ascii?Q?zQMV0tnl/oRM6qhOi20ymRMVu1oepcJ5YHh4qMC88m635wm2rC0RpJF5HpdE?=
 =?us-ascii?Q?SFbjzQGZsvm5WhJSs343fuaIuXniRrAFxOl4hAFHqnjJH2FPOARef2ne9VXN?=
 =?us-ascii?Q?VpibsvN5qd5wHrPZk/AgMU9DGeMGaJtBxoXcesaeBf2gAmJ8KSr3vSCX5X2J?=
 =?us-ascii?Q?pCzyp8RrllG+1VuqMiUaFWmUSSfQ/7Af0jZxG0bJNC2W3imJEvAoaqDARtjG?=
 =?us-ascii?Q?miZwUiSRjV/1Za4ypJZyfA6c+2oUdflH69KLAU7jgZWLz9xmjOhaKdbZDeST?=
 =?us-ascii?Q?i2+ZHNkD2Mndk911MW67fD5UbfgHuovmDq2wlSL4NnVvmWVkPgmaM1Esof23?=
 =?us-ascii?Q?DzJ+Z7WzHxpb39cG/22T8KhfkBVaWnKnWXAmtG0/grAGnfXi4Xd+utYfs2DG?=
 =?us-ascii?Q?IAackt/694iX066rjhRgiD9AB05KgEOxBE2NrTEN1V/CAzim6u+TE0z7TI7v?=
 =?us-ascii?Q?H1Fobiz6SXYRg2TBfWT0g2ZksvRA83k7qK0Zn0OnaT8qq4W8BNaE2hSgBk+a?=
 =?us-ascii?Q?ipSjVgnM+YUFidoTfbMoSi+yieB2N67Bl+EVQJdLETz8xvq6l97oismFUFsB?=
 =?us-ascii?Q?Z7ikWu5D3bmjnqZVW6OkOVOCxLo1F+m6dYPfEJ3zluTzLxIm0gGlA9VGU+FP?=
 =?us-ascii?Q?++3W+2ttLlrHRsssK0PeUj04G77/X8P9+OGcMzMUFJ2KQngLM6GnBmFZgEhZ?=
 =?us-ascii?Q?7S6xUEwtuzAx7HUDVGw/U3DerZNtw9BV7OB/VA40tfrHADpp5uCNIn9WAMrN?=
 =?us-ascii?Q?vzD/vF9UBWdXujlb4sOOPXiRBXtCtFcu5fK8WTGOKbBsnumRPYVfqjCajWR6?=
 =?us-ascii?Q?G1rZK0HSdd6QvfIvhqt6P2Hl+DFJY85vTtmAY/AhOR44rbzGATo0+73uoi6W?=
 =?us-ascii?Q?cpAGPMPrTI5EJsRlHh2j+GIyR07lIQymDhlHhAqFmPuv4D5mZVZZQHCrhPRE?=
 =?us-ascii?Q?o5vgTP8aqOqv4wVL9jGT3QjGc/+6AxtFYp2NtlJollYC+JQ9NoPtRCfVKaso?=
 =?us-ascii?Q?h1NkuC6d5sW09vChj4cv2BlR4e94hmwsb+WjMryB2Vu8SanHT0BYWIBYIFZw?=
 =?us-ascii?Q?+4PftQSwXuGXhAZbDnDB+h3y5PbXclc=3D?=
X-Exchange-RoutingPolicyChecked: 
	SuQZCTjki/DMx6F2Ulr6J3Vy4aldqdEf6OgQKrqxWu1Rxt5WF2jBM/RFo0Ev8zti6YeMtZSXkHH/i9iQyAEvxkFPDJMQXXVX5iQAMMJRNhVpmaW3TrlwrKcXzX3hFiiKWR2wlx8a6EWsYqCueZqHfk7dAs9g9sxa4+qUGIhmpCNK3r20vSnuf7Fr0sc2bIQW0/w8WDzvc9qLLxmBhT4TdVHpgsZKNJrGLFCasvAfITSLSz7rELAymov2HSzfjKV66usXBQe3o24bV0lLSPHfhuPs8KPDK1rq1A3T6I7ZtqFYwePRehaEozsDRrqjChpmS4hHySuNQUXg+mP69Fer7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d533719b-47ac-4312-480c-08de99fb3af5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:44.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5aHoB7+WsGhPpB9HLy3Sgrjgxy3CRY9u+z8b03aXsa4smpL0i3GpPSQCGTY/GwWdogjRCtWlqitv1CsepdSoWwekPiUdVsgUpg+QixF8bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-ORIG-GUID: YHi06Jt0yWrbSuA5M2W5XjnMj1cTpxiv
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69ddf301 cx=c_pps
 a=NVT6GquIkcOJbfF4gP4t1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=eTPjgBTUEJ_W3BBz-y0A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YHi06Jt0yWrbSuA5M2W5XjnMj1cTpxiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX+FSkoBrflvi8
 EqYSr1pUgDRwqdVf9DpeQLfmedqk0UlZWADd9fBpG7taKWBEii2ZuoKHGU/I/WuJRS++EgkCWAg
 CbdvIJ0jnddDHzVL8V3bKipEttiL7pdUHByRFg5x409UgzV8Qz4kloU9VSXGv+AWg+okhv3qxJC
 LsClLNQ+xLF70dd84P7YOdWFHnL90GRVUOAi51sL4vCE+jeKUPP4uEp64UE+2mIw3VcD2ekkXaW
 NPJpbIcZHMtDkEND4Bd/34PYynsKgQ3veLSeCkZgLBx7Z7BZa6S1SPaIdQeYjrnfhYc4uvSsglA
 NSiOPpDSkTc8MW6mLxk1S0uIOHbYJaO4guxmeGjSNpo9ZBsoIgaxZhL8lmKQ1CxtPEbAgMS1urq
 Z/ugfpkWCi3NysjBqSh2EEeXebothqLAmznsO5jCBjPfcszmxVAL2emQr1HUCKZX6BGzCm0WgoI
 hEPDyb5uRV5sEIckaDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126300

Dependency on libwnck3 is moved into PACKAGECONFIG, so we can remove x11
from REQUIRED_DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb   | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
index b3cf4b2559..00c9352dec 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-panel/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
-DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxfce4windowing libxml2 \
-           libwnck3 vala-native \
-           "
+DEPENDS = "garcon exo cairo libxml2 vala-native gtk+3 libxfce4windowing"
 
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
@@ -13,8 +11,6 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gtk-doc gobject-introspection features_check mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
@@ -24,6 +20,12 @@ SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb
 
 EXTRA_OEMESON += "-Dvala=disabled"
 
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[x11] = "-Dx11=enabled, -Dx11=disabled, virtual/libx11 libwnck3 libxext"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, wayland wayland-native wayland-protocols"
+
 python populate_packages:prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
-- 
2.34.1


