Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074B3C77B73
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 06:39:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29350.1683355187901069043
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 23:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44906a2dec=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3466ZabL030769
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 23:39:47 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rne7wx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 23:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx93Jfo3282R8Sg0AzLSuFOr7K22nIDaRodM35VzCvqfvHat6dVeQY+/5zI82VuI6P6pCkQ+oyyUXFKTuZ7lWDusdPFuPcHfvlYl9frgCFgOk/9ZyiRfC6zsha8L/rnJM1hvC/g3p6Q9uevHuEZPkusDZX/6jALxXPlqKx9lnEMAs255ttkT44Y2vLpJE34X41WGHgvrAMOwXbf+X5Tdi5rl5UKgwwZpVNnV1KjYMUY0y/Zx5SWkCosbFU/V4iPNF9x6JICArWeH6Vo+87Vb32GNr0wzXDAeVB4CutbZzPi/pmAX/Q43dOnc8YVy5mY+K8vb+tWJzxFNWZXPWUJk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XqA+pUUhzNTUh58KCE3Y2ClRyWgTF8qkGgH36bwjck=;
 b=SWJyKeXP+LkGrmh6Hjux4x2hPFy1rxwhSUjCVa7/gDBo9KCH8iyOKbqOKcyzwFPzacPDAX1eXxAdlL4xndmqoyRBEB+Od+oiq4DSUMDw/Mr1F6s07BkAEuxl1LmtEXdEPCFjoD6pCDVGwJCP+WxE9O2v8CAVHaJ5YJ7wXYP5oi1XeOhSqbYbcIxxZjpIvPo75ixKqie9TG2gurlmR7aV6lw8GdOomyxAP7iPAdDRa/PUAgvvvWhN7QHtCtRX/KxOdmiTPrvw7mVonewy1/Y9ADb0Rx6TVGr350iOfVP6NB/7AIv2Z23XGE1vgromxG5zyNJf6JpC9gOgk/t7lfV17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 06:39:45 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 06:39:45 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] pahole: fix native package build error
Date: Sat,  6 May 2023 14:39:26 +0800
Message-Id: <20230506063926.2042225-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506063926.2042225-1-xiangyu.chen@eng.windriver.com>
References: <20230506063926.2042225-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|MW3PR11MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e9e8c-8eef-4d1d-ac78-08db4dfcae51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vDwuBOnRHCpE5ko++P4Gb9IlSrJUbPFp7eZVyBuqKirdcGUfK1Ydnzjb88A+cptQ8IP95uqmYKMyIl5gkeZEyrTgATzGtSD2nlRgpHWciT6UbPemZ042iUoItr+1LuKkVnrN503hD6UrUCszH3i/poKPYsudTGKrzc7J9chzMd+o12evl2GlOSj8J+wgP+3uLAulDLXeCIbqtGTXNEOY6MbbkuMbbZYBzxtlyO8VlJJ+jF0Zw706pJM8Mt2XhuRz+A+kJyYB32Vd1cwJlW/Guh/VC2bAzVo2Eeqtbj1VwTMQAyyY04AoQfdNvLfUTpE3itWCKaHiW8+iFTFQlcPqkpsMaJ0OIttsRA0TlxxFug2SZxG0TvcqE5D7kqyJ7HVxvNoeGEsMkdltLQNH53LRUxWzeKRjACw0swvUG/aIstcx+ClKE26Sx9qHNFhVhFa2BnSNdoEf0SXvqIGBgbQLV5EJC6GmOhnGZjFRbxo/SA0HDNpmK1Nd7kl4adO4FZFffP7V7m0nLcOyUuQXQy/CCqLtvrcrPgZ8nCX0LbxP+0cfEavc5jjjLn3JZwhZ0ExU0QkTKACx4HblgaUKG2ngBMjkCizkREbJLO7Ak0pgMQqu4EN0bfZYVvw8E4dH3nLN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(451199021)(6666004)(52116002)(6486002)(2616005)(186003)(38100700002)(38350700002)(83170400001)(26005)(6506007)(6512007)(1076003)(4744005)(2906002)(66946007)(66556008)(66476007)(6916009)(44832011)(41300700001)(5660300002)(8676002)(8936002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzlGNnpqSkM0OHVyT04vamNBYTFFQTFIVHBjNmhTbXdFTmxRRDhSaTJpVFhm?=
 =?utf-8?B?enZyYjRIdmYxTjlvM0ZVYnZMZGZPRWRmMVVFYVY1TzZDeXNTd0R4c055Q0FR?=
 =?utf-8?B?KzlwY3U5WUFSZTFXMUN1R0hNNlhkdG03OWt0OU1CcUpTRmVnQUJ2amNmQXhm?=
 =?utf-8?B?ZEtGYTBzc0tCd05XVGt6Y2E5cC9pU2tEUDRTcWZRaHVBdXNmZ2plUjg5aFRj?=
 =?utf-8?B?OEtNWUJFcmt4djlVR3RYSk5COFZPejUvSVllR202dTFTTnZldGszYUcrMktW?=
 =?utf-8?B?eHJ1WGllcm1paXNLazJQOWFpS1p4NzdpRWw3L3o2WXN5bnJiZUtVS3RYYzVP?=
 =?utf-8?B?dU42bks0OHdQUmEvNU9paDNqcnBGblFJMTc0bFBiaGtOMDFEZGZFeC9BckQz?=
 =?utf-8?B?VHJ2TVhkQk5tYTJORXF1emkvcVRMbEZjQjg4cjJLLzUrU2VoTzBJWGNjRmVh?=
 =?utf-8?B?MC9QVEdEeUJ4RVd1MzJlYkx1aFdjdk14YUs0aGQ5MGlYWlByWEhLblkyQlRM?=
 =?utf-8?B?VmxMeTQxUXNGZWl0TnN0OTdtZnVBZ0FOR2xJZHV6YXFORk43UFY0NWViMWxH?=
 =?utf-8?B?MEtJR0RMZTRXSG5ORjQ0K1RqTTFiT01UenpzOHJOajJxYkpEbVh0Qlp3QTVS?=
 =?utf-8?B?N1lNNkxIOHNsb0p3OXh5LzdmZkdObjFuWkt4bkRjaEFXOUVJbEV4RW1nTzl6?=
 =?utf-8?B?SFFOczVtUGs2YzFQSXZ6NkxkOXVkVmlnWWJycU4vQWlxY253VDUrQkF3SzJl?=
 =?utf-8?B?ZUtTbTRKYytnN0djRHBUdkVLcXBmOW4rQXdobDZkcmpqZ3FBOHI5VUNJVElK?=
 =?utf-8?B?V1hYazdsODU4aWNZT25EVUdTNzAzek12YzdFSThoNzlTSzIyUHljQVFMcHM1?=
 =?utf-8?B?aGpXajcyZ3htSm9tdnFQejlsVFcxbS9zdXhoc1dXVDZ1MWUrd24xSEtjanRU?=
 =?utf-8?B?RTZHdlJuWEk2cjJtVEhLZVFGM2FJWTZIbmptdzZKb0c0NER0Qy9ieCtYY3pJ?=
 =?utf-8?B?SFFFQXgzSkZCVDlSSWMzYlVrdkpEWHdYMlJyd2VzTGNBbkhnUm8wL2dUVUhm?=
 =?utf-8?B?bStvRlJ3YWpEZWE1RGs4MDhWVzVkajBtWUxmZCtSTEFuUHJaa0V0blRSZEZC?=
 =?utf-8?B?djJEcnhnbGdKcllqRnZ5QnVsUlRWcjM0bFpBTFIzUXQ1Zk1KSEtQK0JmZlVp?=
 =?utf-8?B?NHhOUlNOTU1Yb2RDTXd2SzNRWi9NVlhWME5CRGtQZloreG8yUVJDV01lNGo5?=
 =?utf-8?B?aVBDaWtydXV6c1NVRE5uMWcxdjJLYzEvcnpOQndXeFlKM3J6TVJ2VWE4REJZ?=
 =?utf-8?B?MkFuS2Q4L1ltcUtaVzI3WmNHdkx3YlJzbEMxTEgweEMzRW9uSkowaTdEU0Ur?=
 =?utf-8?B?MTBtSnJtZUt2TjFSeXBTbE4xSlJ2RlJNV2gwWk9TanRHcitzQnQ2M29MblRY?=
 =?utf-8?B?Ukp1SFpSQ01CZDZNdU1tQWI1MTRjOEFjNkh4VzFJRG9DUkR0SHNaUTVOVXUy?=
 =?utf-8?B?QjB6aGMvNi9iRVRmWEJQN2lsMys2SENZSk1ZRGxHSkdrWEpzcHY3L0N3TkV6?=
 =?utf-8?B?d0Z6aXpwK0lwL2gxUDhqa1hRUGxFNnlzVGJoL25PVDJGcGdJbUFyWU11VXYz?=
 =?utf-8?B?V1luMnNmTmgvdFFZYUVKbzNZeEFuK1doTVBsZG5IUHJ5cU1jaFRpRkNVaGQ4?=
 =?utf-8?B?ajhUcExiTjU4d1NraklyQmVpT1JKbHVhMERvWDU0aGs1MVlhM1hOenpnZUJK?=
 =?utf-8?B?Y1RDcnNyRUcxeWxCMjRleVZpMGZwNGo1c000OFNsdlJ2YTh3ZDAxT01jWU1M?=
 =?utf-8?B?TEQzMm94Uy90c3R5QjN5QjhURElNUmJad0ZGZ3dGUVU1WmFJN0RCbkpWa1F5?=
 =?utf-8?B?YUcxdm5UdG9ZNkhyUWlWanUvODFJcWVkWFJUcFcvSGZVZk03SXhGVDdSU1U2?=
 =?utf-8?B?cDZIOVh2ai9PR3dYemx4NStuT3ltVlpwSy9BT0JSMERiQjNZQ3k2MFU2RWVr?=
 =?utf-8?B?NWZsSXhmQjJ1NEtwY3VrWVo5dkx1TkhEVW9Id3FBVkF0c25IVGkyR3dpZHFo?=
 =?utf-8?B?TlNURU53NkgxdllxakQraDBRN09UeVRSVnR1U0Q0SVJNeDJDWk9rTTlYWDJ4?=
 =?utf-8?B?b3oyZjk2TVk4QzYxWFI1YmdhVGEzTDJ4UVAwTDRJTHFtbXdhNWo3MlhXcEQ3?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e9e8c-8eef-4d1d-ac78-08db4dfcae51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 06:39:45.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWsf1A4ppQvUtpQgNvjGGjumuqnBhTlmmVR9/WCfJ8SqY+yAJ3jr383FDw4n8tx044AkioZhEJKMABHZKu9/G25dUWnyx6RgtMzhjNHmYV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
X-Proofpoint-ORIG-GUID: a25Up1tU7D-FHSFUFf4QIr1ZIIad2zcw
X-Proofpoint-GUID: a25Up1tU7D-FHSFUFf4QIr1ZIIad2zcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-06_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxlogscore=830 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305060050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3466ZabL030769
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 May 2023 06:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102324

From: Xiangyu Chen <xiangyu.chen@windriver.com>

pahole-native package needs some uapi headers such like linux/btf.h,
otherwise it would report error as below:

btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98struct=
 btf_enum64=E2=80=99

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.22.bb
index ec642ec3b..b790f5237 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -4,6 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
 DEPENDS =3D "elfutils zlib libbpf"
+DEPENDS:append:class-native =3D " linux-libc-headers"
=20
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.34.1


