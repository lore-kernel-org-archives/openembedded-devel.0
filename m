Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF4AC28B2B
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.29960.1660748967876067101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZiuyZO4n;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCusZe002027
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=n0DYwIOCgN9iVM6vO/0g3tqbFFvJSY7RhF1i0/QtoSs=;
 b=ZiuyZO4nGo6VQVIKLURe5XOCNzHHn0exie03Yol3lLpVAWRQHQNi5aBD9J8QMl2/IcLg
 K0x6jEWCWXPlixw69iKT3RfWhnR/mdVENUx2XIzZJDY5Tyq6A7T5LuKWS+D1Yr3H8h3g
 6hFcvfs4yq2GTgVTgdOtCA/m3PzliU5DUMGOvrCcR236WfjcO10ocmTlAJkUh3FXfR5+
 s+X52r3hQtB+DLYK5Rx8Z6W52yhdTSd51Pqt9psThQdBecKTvXJKUzXU/sQ5w38a0r4v
 0miMY0ABiTGaVltYVV/w0XiV7s30Y/0kE5dax8TgVLQxpJCDeZYZ9krHCUip0zK7vfkC Sw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Qag017296
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gb-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0M+BJjX+s1ShnJAFl+1eFeuK/XO51Zd0nyNP/aNCGurbstpBMe0kTUhbHlGqScjvfpKGJDyTfXvBnp+IsccUReooiu30eDRN/hQwSRJ0bwmeZeqRs5prdwz3B9+tRg143QePUdxVhdJNupCYtKmXVJ9qn5/lIekdh/ppe91/a0Z9LeO1SF70xdOtKvtGzuC0Rm6qFHrsuseQEhoZVx1PqhpsRMT0gJm670CTzEs0u+Kn1Z2sXXXVE5i5rx2PAAH1JPrNBgMnHBEAz4yPbZUgzSS/RlzRBkzT+fO44KPLFmjgJzX7feLXGrUAMBpJ6ytP2FOUyVFgJriLXRtq+3Gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0DYwIOCgN9iVM6vO/0g3tqbFFvJSY7RhF1i0/QtoSs=;
 b=brNK3z+ETCbWTz9kkkwokWg10zWx1IeQF5DqkYNLkLyBZNIciqixrqE8ESIHRWtHm8RtKm5yBkPuGldt8IdXylMOi1W42ebTt0xnZ70KAyPBNOxgWm5skntHxOr8fnn/PvmtItGwmo/4mqhM7CqUAeZ8cFFxvjNXOCUxqQ0SDmPcXvJ4dn4OxyZ+QX+YUlM7qtl2eQ7wpXJBeJ+R0FLBGcffWctWy0/exU0vtMafi774MUXYgwp6JW4F/z6cY/VD2NTyVf8cb5clmnD6J7L/IT39hCZapIuLnMN8tf9fuorPu4sccNtODWMcKhWtBZ1vbuvpoa5zMilxxS2tSOqRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:06 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:06 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 00/10] Cleanup LICENSE String in meta-perl
Date: Wed, 17 Aug 2022 08:08:43 -0700
Message-Id: <20220817150853.2823101-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34b342f4-4cc2-45dd-47b6-08da80626da1
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d/MsMuhf8VbPcyqtcfz6Mcdpx+A/1bZgFL6VUSrsn0Ewl6LE32snhqFmBXG8psRRS4wWW+P7395I4Bxpz9YKfpbvnlG8GOhGXK5buRcuEB8OptmDyRMmSiSlILjdhLDxbHNa+ztwhu1IB16kKPvF7fyKzV/kMjEzujVMIIMK4gA4uOQVP6PDAZ0iBZhgD6v2NORYyKVSiOEkGlBk/I/2KJ6BH7IXdKQJRdrGuhH07+y5Sx8ESy4ZbYlkCrMbmsMo9osmfzxVMO5XtqBZJ+hfU1tA6iudV29xRwZ5/kVTniJS11jFpyhvfyuahsm0WXd8VbcEPCln2bcXmjUJXPJbe1ZKmYdWAKS55BYeheH3i8n1DwKiBfwAGu/PJoVVQ+hwA4/smTVV+cR0/PL1CPKQ764uINxPP4lo4TbMS5OEwHlBAS3XbIxG/HeqX0wo6oIXTAxYpWUVftZSA8T8tG1LEsIUDZVIBkfWAm6J4z0H/mMHPrnyUAhCGZYb5mTrrJu8Fmm/8evWTvAt+2wufFESdqUz3rng/m2Y5NSA1KiZB9yGACiCsvtfxq1VljCS46GEVSow8aVcLvTtu5d0uieN1P40c17iJ9ikQhhaUUJIZmZznMnqNk36/BGbzFe5hxPJrLH+I/edcVMo5QwpfCht6frT8H+y9sZwMbyuvRBfg+0NaPcyT+hWDS21qgWEWzLJs+PC32fhUiqighbndTS/6wK34AuQgJickDJTAYxFEik4VOBJE5rYDaW9TXMDeMTktAL/RuwouUIuku1C1AnXCYGgJRkJZeXH2OKFe0e/trI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nh2WzZRWBzU8NqT0jhEIgfUaPArqq1CSZOXAQGf5JzYmmyInwyMuBe1ov3hg?=
 =?us-ascii?Q?kYzEzsbxZ52XLT+M5A6EFkx7Eftu0xkVrsrW2yjlX6aoDQ8wuSsa0vcfOvk9?=
 =?us-ascii?Q?ND8JgNA0AzcV/QZTjYQy37v4eCV0/U4k124iALydrv5KWYsri/GeHHLHLsWy?=
 =?us-ascii?Q?DwmboGq42LAxf0j6ebNmnrD+a9i9j2KtOA025/sZ/j4moKZMjYfoVileU4jr?=
 =?us-ascii?Q?nepElV7eejDYGPAKZxV7RNraWKottxdSeGzDzfBzfe8jtiawcef+4CHZBPwn?=
 =?us-ascii?Q?STOtKvFuPIxroTok7iiVVG7SpppHME7kB2LzblD3i9yGCBMe6L5yb7nNJ+JT?=
 =?us-ascii?Q?bWSwQytY7+fW2to46d6Ld9itdhKIR/rXnzi46uiSHLo9qEe1afFZzy0FdMjS?=
 =?us-ascii?Q?8WV72iBrLvqL35yGJBNnFZAC0O0I/YJG/dsVORDHuZeyrwc64QoSlax45oDp?=
 =?us-ascii?Q?mDdzMPJQxOpPOSEetQQiObSBbYHVO3Ru3TFsFmlzYoK5EfSFvLsBHAinltFo?=
 =?us-ascii?Q?Pf71D8RINotdP6f5+ehHZo9NuQlX+meXHUeeEZktWZie7jMIWs9SS4BMbhNX?=
 =?us-ascii?Q?qzq9tc8sWUeSm8VAK0EijI8bb41W/Uy4ZdQOQSZyoCZiU+427QWsvb5RbA2r?=
 =?us-ascii?Q?uuKJGK8+tHbWL6zUKk46lPIkNJRQUiSkXXirzm0j6oQAlGjUcQeKU20R3rwd?=
 =?us-ascii?Q?thsTnQnLPKm328s702zcrt+L+YyJ92q1A5zEiTNWUClnDf2SOZ03XD4utGOO?=
 =?us-ascii?Q?2T1M7474JZIRDLf2Q4W4D8oYpQQCjfohidCEPGA0A4gH9z1ee2vUNQ8PKGvg?=
 =?us-ascii?Q?bDK1yfAfDaOv9I0MxF6IbD3cp6T4rwZje/UL4KDoCH39CQzhi6G2VCedMUUS?=
 =?us-ascii?Q?VnFerF9cXI4eP3FD9h333U3rmJvqoAGNIpzneg/qKAFa8m5GB0splu4bz+m3?=
 =?us-ascii?Q?mr5oZ6fmTTLeiEHjvfMjf/Zz6+YqMZ2I8lCvpr0UdaU0KneGad8lFMrU0alM?=
 =?us-ascii?Q?rMc/3yMdPJewRdCj8CLfMiXp4L/6DA7ZRNwKXk9PP5vyjiDxUDVRYEwq3OKb?=
 =?us-ascii?Q?AcKweZBTGIx6cCv7UYt5/Uj48FQiGMVzv1HkZAsTiBUYaYQhCROHEiw0Kgor?=
 =?us-ascii?Q?81QvzxaqUqXL48zQyX4Nc6BZZ/Z+/nQ78aXtsxlFn1/HALS0GaDSDF2FqsCJ?=
 =?us-ascii?Q?NSZ2z0E0SDa/HQR8mG9vhwM+XdpKSPbt+s84CZQJ0v80g3GDwzLLHQfy/pvc?=
 =?us-ascii?Q?Eqf0ujWILviebo1Ex/tTVY4IGWuWau1W75BGQPSYH5x3GXqOxHO225F0brKY?=
 =?us-ascii?Q?ewjVOHV8cYEsZpZPWorhp6scQDb16ztsIiQl6LpuwoDrGCs8irrYxEG7A8L8?=
 =?us-ascii?Q?kGkiZYWYjoH1lMeMlNxMVPhH2SeXYUn9vd9FvzEz0+ib4kGie069F2PKQHzf?=
 =?us-ascii?Q?pDuVPoafmFk84tqMgU4izj0RpE6ey7xKFxLRy5z+XT8+MJOBNpVBj7LwFWPt?=
 =?us-ascii?Q?i7+a4r6oM8kohnT8iA/hhocCsRCdNUSbvIoYbxjcSVEm1kZUVG4NHE+ysjhs?=
 =?us-ascii?Q?+7Foj1IQ+9FH/vwzOtbleVTynqM3/ZkkEg86iGOeSXNOd2pyMw5v0ZFvTMk1?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34b342f4-4cc2-45dd-47b6-08da80626da1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:06.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IoluJ9wNS7d4ddMljB9BDhASuR4UF2EZ7uXunmR+OFuBgLXXR6Med9gKCE/mb9X5f1Q3hYVElaw9+9f6exs5Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-GUID: C1Tf26T9T_XnmyPS-9ARvyOCHsFYn3Fw
X-Proofpoint-ORIG-GUID: ZQ0So8b-u16aprGZ9CrfKU7bjGQBITwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=850 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98298

This set of fixes does a small cleanup to the LICENSE string
to add a space around the 'op' (|). This is needed for the
current create_spdx bbclass parser which does not correctly
handle the lack of spaces around the op.  This problem will
be fixed in the future, but for expedencies, I am proposing
this set of fixups.

The error was:
ERROR: libproc-waitstat-perl-1.00-r0 do_create_spdx: Cannot find any text for license Artistic-1.0|GPL-1.0-or-later

This should also be backported to kirkstone, which I will do
a second pull request once this merges unless Khem handles it
directly.

Sau!

Saul Wold (10):
  libauthen-sasl-perl: Fix LICENSE string
  libdigest-hmac-perl: Fix LICENSE string
  libdigest-sha1-perl: Fix LICENSE string
  libio-socket-ssl-perl: Fix LICENSE string
  libipc-signal-perl: Fix LICENSE string
  libmime-types-perl: Fix LICENSE string
  libnet-ldap-perl: Fix LICENSE string
  libnet-telnet-perl: Fix LICENSE string
  libproc-waitstat-perl: Fix LICENSE string
  libxml-libxml-perl: Fix LICENSE string

 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb  | 2 +-
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb     | 2 +-
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb    | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb       | 2 +-
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb     | 2 +-
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb   | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.25.1


