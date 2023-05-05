Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693C6C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 09:27:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23026.1683278828991843718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 02:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=448933cb74=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3458i8Nx018482
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 09:27:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qaahuc035-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 09:27:08 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3459OrlV025663
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 09:27:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qaahuc034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 09:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpzlRvNDv7TbcMPcqpijfe6G5sv8ezT+NrfDwvZyPjMnxv9pnSVQ8MFcU7rjjqxUiWYUexDKKmicMGtaXq9vjYB+Mc5mSIUHpkTWrAnHP/jFLpyKiInyL95v0+P5blL5Rv0HyCgAprrzpWpS1R9N2co4MsaY0p3pe1N0mTCy5qZLfRACbaRglfNU7x4Y7E9Q19nqHFNwcp2p1anOAOoAOGWA/ZNzOpdCSyS2u5t7bOiJ5Ra+ouewmYRgoGCEbDAsy8OOx+szsm5hjx9UBDTMmf00WsdTQKHOnjdmugJ8/KrZNqzpgtw0RwtPaaEGr9DNZNEsIG7jN+kczVCGOh14xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM6Tv6PXfpMw2w2CdR8/3yr8TSWOx+dwP9GbWGzc1/c=;
 b=SRaxamDYf2v5v9ciQtHgkty9bHpYzSEqVBvN96TYJw9ditAsw8yySEX1nNgqCzpJHYJmpH4WlbbDgRxpMv4mSklaZRJUZ5Ln0NboWV0HXdzq9FVyhOm2BIra9sKx/zme6+tlujSM+RgED8JynrMR9xZi5lQgxOt0tj2YpIB8WEI1Uwracx+uWKO9Av0slvb/Y0SpYNI0l3mJlgBR5c/LshKQNHJAn8hFeK2oSuuC7w0uZwMroH0Waq7/Z8m7sdeVdTUL2uJOD3shkXSiZcj478UDCUckpvioZMMAIFK0is4cIXM2Hm3aZ9/St4X64ow28oHmorImvTz7FgAlKRHg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 09:27:05 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6340.021; Fri, 5 May 2023
 09:27:05 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: quaresma.jose@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2] pahole: fix native package build error
Date: Fri,  5 May 2023 17:26:43 +0800
Message-Id: <20230505092643.793967-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: c74ad4c3-6a82-48b3-1042-08db4d4ae3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ruhXORbIp+JvbdNIgY1TJnPSK567GoByzg9HDC9mL430zwVjFbcrd22LS5MPoIuLOuVPD7ZoV9QoYO8RZDNyAVqH+1eZo/j1PeUwY6ugJjbwq9n9x7M3NcRYj+xwimC19gYVUCxu0IhXoDbhpS80y0998O4tIR0tQTAtWxZS+8kZITGnfkTQ2LzPlDwyYCEucCX3ciSjPbzcVZenSJDVzYvIGSteITADUQv/fAEVnU92XEjuiTgJVzBrEDNksJglddTlAA0RPpH6DVscrbMY0bcaDbzTs8TdagpiSuP8KNKuiylm/NhHaY1S5IzdqSJft6PnH3SEnZDjlxX30pH+ORkAbkGtffBoL0JvVXVy+/279FAkmrFRXgUCgtON3v2OLnOfgXWD4y1L/vGWoOZ7Lbn1RN0euQwu8PpyN1bySwkPrwQOEEpzw9GYsEs4LXRqymsDkpQSCKdP/USeAoce4beiFtkCPxSXRaq875jYE6/afgWK3TXOK36ngbAVoWV8Uqut++OeWDchW7cuyT1o7QAzjykwJ8EmtGK5Bd7CEpSGFF+bW4k+piI7RGk0iy4WORaFaAIhspLQEIHMekkFa9CVKj4LRDTTkXmw7PmTPmVyX2ysRGnRBGwTJYFQpKuW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(451199021)(83170400001)(2906002)(44832011)(6486002)(8936002)(8676002)(478600001)(5660300002)(66476007)(66946007)(66556008)(52116002)(6666004)(41300700001)(316002)(38350700002)(26005)(186003)(38100700002)(2616005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXhkb1IyY1ppdHc1MmZ2TXhCMk4zT0lNYTg2NU5kUG1OMFhaY3ZVTHAwdHNT?=
 =?utf-8?B?OStPaHNEVnVLazR1MTk5bzBlZHZCb2JzazI0a21rZG1rWm43MzRZU1hmZWNF?=
 =?utf-8?B?UnFpdlJDUjVSVW5JWWhKYnR6NmhxcjhCRXVLV1E0UXJHN0VxT3NVakxPcDJa?=
 =?utf-8?B?SmVmc0U3TjBib052OGNuUzNwSmRzazNERzg4ZVBmQ2dJbWxESm1Gd0RFZnVS?=
 =?utf-8?B?VWpPRVIzU0lKVC9xeDUxK2c0SXg3M1FEblFJYXhXVjdPdkJwczYxcXBJZHh1?=
 =?utf-8?B?ZG9EM3lYWFlUeG91OFpKYXJHWUZQUTRGcy9xcTIzNHlhckhXb09lbjdxNi9U?=
 =?utf-8?B?eHIreVJldkIzNFFoT2I0cG43UkVQU3A1dDBrZ1preGFINWtrNzdQaUJJMm5I?=
 =?utf-8?B?WWNJckk4VHVacDMvMXBoYlQzNkNrNEtuUUlIV0NCQm9zejNUODh3S1lHc2o5?=
 =?utf-8?B?M2lFd25meXlYTXhPNXB5YW96eUdzZWl6M0ZNdUJzbExralFLVlhJL2laUXhM?=
 =?utf-8?B?em53L2JXazJncVpjT1pCaWtidUY3NCtYaVFkK0diTzdRVHF0V3d3eTZ5Rklt?=
 =?utf-8?B?Y3dJeDVmZG52ZUc1M3Y4aDJmSkxEVHBRd05JZUtkWXMwbWtWRHdNbmJMMUkz?=
 =?utf-8?B?SXZQa0FuUkFEa21RaFgydDJmdVpKMDNWaytDZHpJQlhzblhLWGlxck1kZTZH?=
 =?utf-8?B?Y0pGTFBSbk9mZjMrSmZlSHdUVEEybG1MV2hSVTlwdkR0Ui92ZEkwWmE5d2NR?=
 =?utf-8?B?Y1ZBVUxGd2wxcVltQVVQNk5SVjV2cGMwcjNCS2ZVTVlDcVZhSC9nbEhRZTBm?=
 =?utf-8?B?TUdSOCtIZis2eG91cC9ad2hnL2FTY3N4dk9IVXhOWnRJUFhmN3pORGFoWFRl?=
 =?utf-8?B?cnVmZXN3MVhVYWt0c0tIT08wcHZMa0NiSDh1NC8wN0ZCWlNXck9xUStOR2JP?=
 =?utf-8?B?WEplRmltZmJHbFRXc2F4TkNTZTdralYweHNsRTRNRzNUQXQyUGM2c3J2Ukt2?=
 =?utf-8?B?UUNWTk54WjZvSVhXekdiVVk0YlY2NjBPNldjOUlXdTJUNWVmZDE0TWZwWUd4?=
 =?utf-8?B?cWNnOUNxakVicXA3Z2VXR1NUWHoxWWpnZ01ycktLZGFDUlJnMDFUYzdMaWIr?=
 =?utf-8?B?QmFPbDN0SVpobmxhbjBYRkt6V3BaM29pNjlBclRwOTE2VHFjaHQxRGNpUnpC?=
 =?utf-8?B?ay9XQ0REcHl5djhEamcrUHUzSHF1QW1pc1lJWEEvMlJnL3REOFRJY2VBaytH?=
 =?utf-8?B?NVg2MzN5RDFvNmIxTGdPam9lOG0zOFdOK0hjK3RlZHFXZkFkMzcyd09Zczc2?=
 =?utf-8?B?cWc5bThVWHh1cmE4RmFzNFJpaWg1S0h1eVh5ZjJpN0Rsbk1RemVxRU1JbnEr?=
 =?utf-8?B?L3MrRzdXZzJmU1kwMytFRTl0SkhpVDVram04QWo3QWxldW5EOEpET05NdEpN?=
 =?utf-8?B?QitDbDlkN0RxVnMvL3dzZDNnRzJUTGFVU21aL1NRNHM4TGFDcU53Wi9ZTXpY?=
 =?utf-8?B?emY5TnNjblk1d0pCSXdlQUJidGlDRFprMm9oWEZMdGF1ZHQ3K09DWGhSaEJq?=
 =?utf-8?B?c01IUmJOZGtCOXVZbk0rWWd2SVBSZkdLV2NqbEw1ckswVUJ6Njc5cEVqaU8v?=
 =?utf-8?B?aS8xZFBIdlhFRjBxOTVEWms3cFNDeXhzTFI0UitjTENWMDBJb2lTNjR5Nloy?=
 =?utf-8?B?RUxTQkJDMDkwaElmWWRBTENlSVVUSCtXMlVXTVFCb2V3OFZLS3FvclY1N0RO?=
 =?utf-8?B?RnIxVkJiUU9oUzRvVGpFQUI1Z0pocXRaSTZrRWpSWlI4V1FhTUpkNmtxd081?=
 =?utf-8?B?YkhMOG05M25yNHRDVEU3bzhDUy9INXJrclFnUHVtMjg0S2FJcG5YNlFyMDlO?=
 =?utf-8?B?K0x0bXJqN0dzQ3BwSjlVS3cvaUt2VnkwbzRPWnJGSXYyRSszZlN6aXkwMDBD?=
 =?utf-8?B?WTJxYWtNU3YrV2JrWXpBeXZ6bTVPOGppbXBheldZSGRRUlU2ZityakFnWGdl?=
 =?utf-8?B?NEF1eGdaK1ZaKzFYRFlua0N1aU5zTjlXNG1UMWpNaC9xTXFjNVA1VDRGMjRW?=
 =?utf-8?B?OGtDNmFEa3FUaDlkNUFpZVhmc1BjdFo3eWpoQ094bzBpZVd4cVduaEQ0cUtB?=
 =?utf-8?B?bFhHSVNFWjhUdURiUmVuTElGY2xxemVLQXFIVW9ZME8zVm5oODFJS1J0cXBG?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74ad4c3-6a82-48b3-1042-08db4d4ae3fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 09:27:05.3650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xP4hVXwjldE7aHHvwxRMRWrqXqRTVxaJSBuogqfSz1j0SnafLSJch4FTj/HCjflxXyeGIIob/zTyrQ9ifTSjn3cptLGdS9b4CX91pl6X5Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-Proofpoint-ORIG-GUID: lGyaYtzXVuZp5QJTY7pd13QB1l9GW6Jf
X-Proofpoint-GUID: V-skkbvkcV56O7CFe6qGtSVfEXtJK1Q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=916 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3458i8Nx018482
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 09:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102319

From: Xiangyu Chen <xiangyu.chen@windriver.com>

pahole-native package needs some uapi headers such like linux/btf.h,
otherwise it would report error as below:

btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98struct=
 btf_enum64=E2=80=99

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
changes:
v1->v2
Since this issue happens on native package only, so using DEPENDS:append:=
class-native instead of DEPENDS
---
 meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.24.bb
index 2bb73c3eb..f44b0cef0 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
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


