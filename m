Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE06AC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 15:55:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14132.1677167712293131543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 07:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f9QvPar9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1418c18a24=dragos.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NBsd4C028143
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 07:55:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4XDERP3wP5rf8YGqSHnO+ki3ioG/TZXqyLPq3eHNbbY=;
 b=f9QvPar9sJZk9i904t50Dq0JCbTH9La668yHhaU84n+meCQxk085gyckNiD/xaAgikba
 OHSg/PsMkr7f6b+lOLXWSfaiezwIzMonAerrGC7yBpY5NWPJKupBz9HxIoIkeWxm55wb
 pV2P0zp5CnAadIiSdaraBs+otEN26rA+qj+daCcVLqRdevM8eUK9ZSvscOxOKurShBos
 Hs7rZc8qEN6JesM72K3CAFfesZUi3uZQm6yeyWBcuj3wfT3bMTjB6+3xoh+VWEdNOFkh
 YCvTDZvH2cuuRmhAh6ozQNosedNsKNOwT0FhASbsstty+ISx4jWfxtX786sobKwyOXRg vg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pvn2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 07:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBEA8GGQRA6LfAqIl3oiqBZJP+Vbn6s36lA8Cd4tFYFOP290mZFbHlkdfOTNuXMDjyorgiDOWMFbloupZ2OdHAj8EL4UuZn+LSol34+eGyX8k1rtiNDF3QVKwLZmEU6sBOz1yTBBPzr5bzlq94y6OTQDO3keCkuLYqlgMgD9JuAh3s+5//CGo56WjyKfgN0OPtTtg+JlmrY54HYBVPKnsJy/wYT0TIXHOycX+RkWWe4bMLpj6mJky6Niu7aH2zwlZLEJzQC7+p5KfiUmSmHsBJwG9jxIwHMRtXTeBFtoNEUrfU+0F7D9x+79EAry7S2oo1YbIMda5+iKX07gKyf/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XDERP3wP5rf8YGqSHnO+ki3ioG/TZXqyLPq3eHNbbY=;
 b=SNM9Xx4E/d19ZeSF6cmuAgeRgtad0I5gC+oZzRWPxogaRrCu2ILUN0qSUX+lFpMV+gld/fZcgii9ECihd9j2Z/LASzqSmegFGU+TvRb2E/KtDmZ64ynr0xMKRirLpm15zsFBzjAGjE/SSLWi+b74Gt/x+0j6/FUFugnVshO4JA+t75MHthXoy5reHcW0ExhCKNRbW0NwOmH5KO+oh8J/7aZKIduqdsymXi6IUTE6lQ6JrXHBNgVcvCKR3bvTuws7fE/O1+Ht51+yHjeilERT13hD4oZMQD26oY6DNO4kVWFkG3PPjXM3ktyXJZacdiu3hMyZ+OOvn5HkAvo6jE/3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:55:07 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::b26d:bb28:dab0:cdb7]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::b26d:bb28:dab0:cdb7%5]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:55:06 +0000
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] plocate: add recipe
Date: Thu, 23 Feb 2023 17:54:35 +0200
Message-Id: <20230223155435.3361790-1-dragos.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0070.eurprd09.prod.outlook.com
 (2603:10a6:802:29::14) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d57fa15-00f7-418b-3b8b-08db15b65575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NfSTBtfudkm3fdN/CzRvc3SQ1NAe74nNcOQAfo4AbHPog7CrIl4+/5gedmLjvACahYgpN0Z3aux2+ImRU3bqi+m5u1Ak1EFLg177og0ZACnw7azNcuidtfsCJeOIaGW2k+FLnfi9XwERcI5KKT+qZDTjnaV8O3vdNi7O3Cvj/VgKjEgkfRLjTu9Lhk0nu+rDOqM0u7GM/w52WiiSsIGzyMjKb5i/lbD+jbb4w0rjiLiUDiMYM1RAY/Ghb3CuYDP4grSwOdqkbyuVSPSRwbYa+8SmlM9Ce8v5UXL4bNKxGaU3J4RL9RzqOytThZKwwGkun4AL2yDOSrk6v9qJ6mOfIYM2MIG089i89+W8XacqBB2Cf4z04jhjbf7352s7n5KCmsUSh+onpU9wEO/73VWWcZFoYT3AwwsLEMrCgjjbzJ4r1LZw9IoEVjJfoLhdhIcw68Mc9VubJwXtyOWE5MFOlFu9pnf1UHN06y4pNsEORYKG0XkMkGKJRKePShf8k3sAEWYbhsfDK0tPAZbqrkQtgVT5/9+ldcT6cUjy4OF7DQffEr6T27PVcJ+vTMIuuDnINWCC5ApfdVst5y0/LesJ+K9VZ9xFULyxRMxh/aIQ6WynIgmBO4IiQN5Rrsso74RHEjgDvmvkkZDWVt2SJaouxB2PiXCn4k7UJSkA9JoJ7Og05TkvrN5qUqxZGsanPiA7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39850400004)(346002)(366004)(451199018)(52116002)(6486002)(2906002)(41300700001)(186003)(66946007)(6666004)(26005)(36756003)(1076003)(6506007)(6512007)(86362001)(316002)(5660300002)(6916009)(66476007)(8676002)(66556008)(38350700002)(38100700002)(478600001)(8936002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0KrFtd0X5aDbD261B5dVhrqw5vLLUjVB0gNSqo/El42k3KTf+fRmDsft7OyL?=
 =?us-ascii?Q?CYa/DNxsvjdibyk49Fyw4rjbkGs56eKOl1DD5nb8m+k8FJ9HWcRSiSUFbtqv?=
 =?us-ascii?Q?tJvSHes9oVwaMqppJr25qw9aLi8p1bre2h2qt3Y5YIk8Ft5KoMw42DtEz7LY?=
 =?us-ascii?Q?kEsEZQpKabEXrg4yAdKikac7CtzKYTnD2MKWGzDEtdWvZ6EI1BO9vIpELZKP?=
 =?us-ascii?Q?Aknw4KS8BKAhUF2yXxUmaoU+0Axz0KVzg3i6VBnfEM3NbegdaaO32sPZRq3M?=
 =?us-ascii?Q?vRihYYODz8jx8sRPW2eO41cn47v510FvQw4PnUFKIgf0Y9c5s8JU4kR+UdIr?=
 =?us-ascii?Q?1Ch6bRyziK85JXoUOIcSZqmGb07RaWDcl0PyCyBtGwi6KwEeIEUV+HHO/Qk6?=
 =?us-ascii?Q?QOfTLmK/91nEOCftSI/AVuprngKXFa0DZikmtaeI4Ns7oWWZKKH8QYwaw3cG?=
 =?us-ascii?Q?AtB70f0OebP7RpU/XZwqzye+MtpV1EfT1Dw6WD/woSkoQFHzoFn1gkIL2m9x?=
 =?us-ascii?Q?oMdzP2NQ/ddXN0lKIO1v9dBnoNOpcEwWMjpN/HUOIFZW94DW/vDiUkrt1aZE?=
 =?us-ascii?Q?BYKoX/opLemftHBp2L7hwJuFM8hw+CVrxrRToinRyRFZlVrfdJpiynnXvbiA?=
 =?us-ascii?Q?sWHtDUBQwLGsmN9o2HAEYjDobvChb+rOAw1+JUgXdIifP5DO7A3F6qlHijMs?=
 =?us-ascii?Q?/G2MVxRTDyMGWm4IAGnydWvtAT253Q05Url/G48bzbStjfSxM5GKuaqBhMIt?=
 =?us-ascii?Q?9Uu5y/krltmcGQAGPV7fu9/I/2VZaz8Zczzqw4KPfgxymNCgOfCJogHAirhU?=
 =?us-ascii?Q?Fj1Q4CKF0W+93siFZbYqdx2a+Se1RrnDZEkIM1Ya5aEeFXaj0yMfpbr7AbIN?=
 =?us-ascii?Q?XPlS8b+Fq6FesdwLU0BZRxFOUHD4nmKMwDT17qEHj54mYODWoEI08xd+SVVp?=
 =?us-ascii?Q?EIE6HWWzrALkXyQkrjqXc8PpZNW7DIP8I4vp+swyuPIDLYmgPM10OKYbzJZT?=
 =?us-ascii?Q?iiA2mF/dYgT3pu6Od5FZlxbYIaSxNP3QeHMSsHgsmZ1wLg5mP5h9tcycMtf9?=
 =?us-ascii?Q?JhWHfqiq8sjGc5cmO7+T0skb0duE8j3v1ZCOmCiqGPBZ9VNc0TrdcXpt0yvg?=
 =?us-ascii?Q?vXT2PeQds00mjSCt+ZIni9arDB1yYXgVovOoeu35/1914HRAL2XaXh/ukra0?=
 =?us-ascii?Q?EDbWBoEpHlMOMSlI4TuIG0+kM9GbXvdDt7nW3UA3/aWA9YiBCqq1wuA/OrMZ?=
 =?us-ascii?Q?6zCFFV8iesLzxpuuDO7gD31QMojknBJXHnv4PK0oMIK0iSfdDmNkUpBmuRYO?=
 =?us-ascii?Q?gfJGLSn6dTlrY2IsmCkNz1JJCsibFqEAsY+aI53N8N7y3bDrqs+Z7qelnMMa?=
 =?us-ascii?Q?sbxET8qCsJe6dv5V7KuNGPgB4OJFJVlwvpbogjaJKUuSeaczalgkGg3qFFB5?=
 =?us-ascii?Q?9jtci4pzP56xD/ZojOP7JlvHqxr0coB9M0yWS1DQWdR/h2o90xIEV/rO+LOi?=
 =?us-ascii?Q?SpWPjbzD2fNMeJ5jSvDfG2/Pueks2ts6QoBhHhmMTzdDutX/GD7G35vPdVz9?=
 =?us-ascii?Q?Ud9L9LCTY2hJ/5WuxI7XmrIpcobq3qJdkVSU567vd0XUx2BNPApuVTeXVQ7Z?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d57fa15-00f7-418b-3b8b-08db15b65575
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:55:06.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PDvNmNVcmfXBPdjpAe93SZzCxfjm8Y1NJOLA8HDZqPkXHlvsAvZjrasJiII58fpKpG/rvW90ypJWCzYWor1ax0wYsV1cKcdofz7YZonQGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-Proofpoint-ORIG-GUID: P28GsExVGe0jDql3-eE_X5zKGpPi6sW3
X-Proofpoint-GUID: P28GsExVGe0jDql3-eE_X5zKGpPi6sW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_10,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=847 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230130
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 15:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101235

From: Catalin Enache <catalin.enache@windriver.com>

plocate, a much faster locate

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 meta-oe/recipes-extended/plocate/plocate.inc       | 9 +++++++++
 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb | 9 +++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/plocate/plocate.inc
 create mode 100644 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb

diff --git a/meta-oe/recipes-extended/plocate/plocate.inc b/meta-oe/recipes-extended/plocate/plocate.inc
new file mode 100644
index 000000000..166fc2d56
--- /dev/null
+++ b/meta-oe/recipes-extended/plocate/plocate.inc
@@ -0,0 +1,9 @@
+SUMMARY = "plocate, a much faster locate"
+HOMEPAGE = "https://plocate.sesse.net/"
+DESCRIPTION = "plocate is a locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index. It is suitable as a default locate on your system."
+SECTION = "base"
+LICENSE = "GPL-2.0-only"
+
+inherit meson pkgconfig
+
+DEPENDS = "zstd liburing"
diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
new file mode 100644
index 000000000..ef36754ba
--- /dev/null
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
@@ -0,0 +1,9 @@
+require plocate.inc
+# GPL-2.0-only
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://git.sesse.net/plocate;protocol=https;branch=master"
+
+SRCREV = "7e5defd4e7e075cb9226e7d2d9a80f943c482d11"
+S = "${WORKDIR}/git"
-- 
2.34.1


