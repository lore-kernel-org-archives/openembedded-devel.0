Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4C1C3DA7F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 01:32:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50150.1723080713420700463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 18:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8950a216e2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4781022d014566
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Aug 2024 01:31:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rs4hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 01:31:52 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4781VpFx026457;
	Thu, 8 Aug 2024 01:31:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rs4hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:31:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEbTw8k98hWDjToLwqCM0nZDPqDUKdPIHebSf/fIWidhcfs4FPN9YAuErCyEr/Iuy6+Y6vKBdfp5BPng0jAJx2dNJ6MUyRGdajgrf22bdv2PCJ1cd4Fioa5diq31Q7Q75F20AfM3g0/X9GNUeSfXNctzLs900JookSdsIIQg+BzEurXavqmDEBZKmGVJiPWC2OThQ6zT13kG1gxQv+Zx3NUprRPRVbAeofwevqU7Hs+PmIbdIvBnyoq6Oh5l37oJ2L9HqeLPgqDbcqodazILWF3j6fgyDeyhstxULI3AINdeYT/1wDn/3CmHNHNb9SWPmG76aWWVWetj8Yw3k39Dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2++/xx0ZW5eIWKghtv/+iXwZeNgtvhCIgGAa46XiU0A=;
 b=UloLz6lOh7oS6G2Gf8wXDZXqu/K02ZuntCMg76iVZ2CXpRmfmahDB3EVIHvEWdL7SzTE3Jz1K0391hRHCn8D1sdDxRdF2TGGZDZbdoqfGlnRZS5TjUkUVOepua9W+bPco19T2KJh1G7UQh7UNkXNyzT2AMRakvPFhND4fwQmNFwdjn/aJLO+Jx5JYGhVup+vT8aA2apuAR/Cy10Qn1UG7V+1G0pdrf1Ksc5rYXmVjDH7J8Po42UKfmFLk+BV2p2XaOAK3qC+2Pe1rT6N1sOTfoA1x3Mr7DYbU4jo7iTZ6REbrX1sD3iif5/ApMbGTolKA4kGpreIA8RnQXyltx1YNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 01:31:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 01:31:46 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH] blueman: skip buildpath error
Thread-Topic: [oe] [meta-networking][PATCH] blueman: skip buildpath error
Thread-Index: AQHa6KPKvMgXROCLn0qOf861ZUb5F7IcFvkAgAB9HrA=
Date: Thu, 8 Aug 2024 01:31:46 +0000
Message-ID: 
 <CO6PR11MB5602381CFCDD3A7548A2A59EEDB92@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240806203423.993216-1-f_l_k@t-online.de>
	<2c1328fb-9fc6-6d9b-dbc5-eef93a874037@windriver.com>
 <2U0VHS.ECO92WQ25WHG2@t-online.de>
In-Reply-To: <2U0VHS.ECO92WQ25WHG2@t-online.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CH3PR11MB7769:EE_
x-ms-office365-filtering-correlation-id: 80171baf-033c-41e4-c995-08dcb749de0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?0mQQPfJMY489aq4cH3rfzmZUlvKAKCc/ol/87d6eqIt38oGd1O5RLDEoxFR8?=
 =?us-ascii?Q?gCEBvcuzyjqV5A6H/SFREB9ov8CC/TrVdThE5v5Z6z5Miz3CqfXtE7lEyg8S?=
 =?us-ascii?Q?xcvestDiZwN/E248MnNvgXZ9rggDzYQpLtCvaq/Uh0yFCk6UH+xtIyuhw+0P?=
 =?us-ascii?Q?uxsZOZBV0rPUoJFypPaIB4kvdvXNEbNS9WGPkXIl8rcbfZ14Q9ofhQXLup46?=
 =?us-ascii?Q?zuz4lDTInyBI4/E7EfOgPl0lzPchaGOoh9OHrxlZXR1G4H9Xhez6WXJzjE4H?=
 =?us-ascii?Q?HqKOk/H3eAvQEJEUwnb/u1CiD+KB0XOecIhdrUMgDaA2eFpvqswV/cvpR0M7?=
 =?us-ascii?Q?n8O/sJWmKx2khdSR01IdoNGNajZeYIngc2g3cFjpVJLuI1zzsBxGtB3OweGg?=
 =?us-ascii?Q?LJ02NekqdL4AXWol+EF9hPK+pOKb1dGT8fcJp4I+LH3kIRkpy0L1kwe7vF1G?=
 =?us-ascii?Q?1jjWOEp47Ut2A1lgyMdHTx1NmGVAmIrPDP4aL9SK+eDwDQGcHuiVolq7XfBB?=
 =?us-ascii?Q?ltjpiR8jQktbgfpeSGM64jUI0fMZZwU0xJvSaZPsqiVmDRQfgPpFXs6O55CT?=
 =?us-ascii?Q?g8B6McL/96e6BibAkdbpreXgpvxSVdYOrx/Xhc6JdvArdyLeqKeLKQPB+FdO?=
 =?us-ascii?Q?6cIIKKdUwrSSZ63SO0pNVbBfBtaJ/OBOtLr2TkTs7iBfWZrFn9Ht5zOIpjHD?=
 =?us-ascii?Q?A2aWm8YWOWt+/8wX4PLv7E426zCJLSjs+VLZtJg7wOgv2eO4VDR8UcEjs3OP?=
 =?us-ascii?Q?0oa6kyt/RZ1AktCI19rjPo8QGaYn+okVDBCAcC+EK1Z1Q9jeHohaGjADVCSz?=
 =?us-ascii?Q?VCD25dB2oMNWVi2EOEZec1nKQggw+UVReCXGzdXa2HWb4adT9o0CfSAH2SxA?=
 =?us-ascii?Q?R7HCbDc0RJTLdfLMacKzWSewjzBxTHto4bQUAB3RXWvOG5jBEsjGfKiSxk3h?=
 =?us-ascii?Q?HnWYNwupOrpjA0/I59xs7UAM0ayZEsCvra2Z8zE9I+W6JWEauw/cnMIpz1ES?=
 =?us-ascii?Q?D+Qz/f5VWdwZoiihhnQuxRQnQ6cUesdHlAzk0XoYwTQYrNp/SyAh5P7KgG68?=
 =?us-ascii?Q?D4IZef0q7SLJJobKdsnkZqFs14JzFdK3oQM7yVv2jbeg46PWelUCszSxM6kw?=
 =?us-ascii?Q?zQuCoq0idWfsuW6N1WHbVzlrcUyLe8YLlYCIpd6ieTH/71wQdQ67aIrkxXm2?=
 =?us-ascii?Q?JiXuodgVk/wVCrPXaiXTCfD+gnKy65jF73V+y01fI5RWNvv1ySXB1fd5DugN?=
 =?us-ascii?Q?bTmI5eaIpXuhtzesVpHk4buch/7ylNghf7YOlliJe65ndSIL4ypFROvqbpOv?=
 =?us-ascii?Q?Kv+0nbNVn1DcPEL/XiVGg6z+j6cIzAP8RaCPi1L/+Otmmjs4ggTwlY0BndsD?=
 =?us-ascii?Q?RRkC1G4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zv2U0Dv4xowGLzILfRfhq/MqpYlOC63Axy1gTFEaI/20VRoK/vi2ja9fOK6f?=
 =?us-ascii?Q?0VSqf40iz6UEwW4DPDNcx87bPAziNlCHe7k1L44LmWx/H2ZvDtPSlVDsjpgX?=
 =?us-ascii?Q?jdQTKx7jindWJMULaXv0X7TxDcapboQhBS8tFPJDSM/4oDkLfsU8voxooLLG?=
 =?us-ascii?Q?Fc9sN+g2UgVa/bE342sUJQiFXL1+7fCHIM9hPHLD0d90GzChsqd8aGtKL2RI?=
 =?us-ascii?Q?iV3zGKIEm1EYgwl0TL1DkPBl9NKpDdGKXKDt+nOZyDNFvwqnQIq3xULysoXy?=
 =?us-ascii?Q?CUsNij4M9b+4RCZ0syOn4HXmHvdn7pQYRplsb+PA3rXuuYHj/I7YVcuDjyk9?=
 =?us-ascii?Q?7aK3/wYj6rABZBSGKfUuXXj4PmXaAy4h+pAhJZ92TioEQgQcCK4dCslVAlR1?=
 =?us-ascii?Q?paiU9UZ0SMa/66ZPFpD34faM5+JqieHgzfxXdJ9jxAbDcp5afewSo6hjZwx8?=
 =?us-ascii?Q?/9QRha/hSfbalWIHu7UHbU/NrjZedIVkYv5WsJNrTeeXQwLSxdua/jwbmUgP?=
 =?us-ascii?Q?P7aJ7mo2mhLEhMieArzdDQoUxHwBg8t4IADMDRHX6Pai4xN/9d/3Wietj0ja?=
 =?us-ascii?Q?aq59/NTV3Nx52e/lCj4UJSYEVQ69mK2un53BbaVqnZkzbOqtJ8eZVaQsyJgI?=
 =?us-ascii?Q?1597w5LOoDOLtlivR6CmmQGD8Agla6UZQf6Swij8Ry+tP02YU17zCYjTu2G1?=
 =?us-ascii?Q?kZn2NBuKplFHnbPV6vygLIdFFxTqPCFbalQkU2uYodFS4ZrlURvrYFF0ZGqf?=
 =?us-ascii?Q?S4TRohGFmFR+SNb1Ny7RPsk/Of604LVhLtgJaiU2/MTE8oZmdwAGPLihCG6M?=
 =?us-ascii?Q?ssJVeGbVVfAiSPlEuOh7WuVr/Fo3Ae3mcp8iOgn7WhI6lbEHk2zkw6q7w+4n?=
 =?us-ascii?Q?SuawrKrlceUDxNjFDQvrtMkVhobi8pXG1eNWqirTTmIIU0W9VpJJDiRVfKgu?=
 =?us-ascii?Q?CFeVQshR5Her6ooiwrrw4FF1foC71Fw/T178Y0nfM/asll/gGQwWEm10ItFI?=
 =?us-ascii?Q?bz49FsqCZV5WWrhuglGlgKtHWgDuhpQ/Xsn3WRwIqZWtX/MgSw+VoC6w49l8?=
 =?us-ascii?Q?TSnpX4d/g2v3yUCb64SYwzcc3nxX6ZGm0bSrTAk7y99y71Oea7StcwUOjHxK?=
 =?us-ascii?Q?SC1GEQ64j5KSL5CrmrXeDDIUQhG3jscMfb+MS2/ZDUhxsgONbovr2CyskKr5?=
 =?us-ascii?Q?NR+cAj1Y0lfFpF2zmHMOdDzUUnpyTU1rnxRjXs/ydmevSqvVZrWzfKy2c8xA?=
 =?us-ascii?Q?7zKfJbmcq25SaJzn6wtrTpYZIB3xNNEpopX1dgHpoP/o8mcXChEZLaP/nEgr?=
 =?us-ascii?Q?rKZ+6WZ+ugmojZrR6WQEQ0sUxVXjhu9ffh1WovALaKPdp2J368W6hUVZMj1J?=
 =?us-ascii?Q?tJNO6TPUOL+BoNQTg4+0erzkSvKuMymwagkw/LYpiHOH4j49WZaODPI9GhJV?=
 =?us-ascii?Q?4JSip3dZACVA1S/Djlp+zIg00YZuStfTmwlurO47TNvfkIVHpwugSc5Cicxs?=
 =?us-ascii?Q?RfOuE1IDWq/NfIWGbXv6h4OzMEja1/uF7p6baBuItvTbcU87GtNqHHD6sQBQ?=
 =?us-ascii?Q?XfIybZUzhlC6Cv2I0c8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5602381CFCDD3A7548A2A59EEDB92CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80171baf-033c-41e4-c995-08dcb749de0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 01:31:46.5063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6nBQe/QneXAd5m/FifZYSgcUZIooLu4OrtvBFbCIkWgHJZtMP4JarLIc8kMxLUG/zNlLFuInyaVjne1jR71Tng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
X-Proofpoint-GUID: FRcZ8BkpJPVJhRaEq3RBkzSzeucswdZB
X-Proofpoint-ORIG-GUID: Vj5pssXWQDIEYRzsI9e8aTLB09KIvDHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 01:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111641

--_000_CO6PR11MB5602381CFCDD3A7548A2A59EEDB92CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it. Thanks for your further explanation.

Regards,
Qi

From: Markus Volk <f_l_k@t-online.de>
Sent: Thursday, August 8, 2024 2:04 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: Markus Volk <f_l_k@t-online.de>; openembedded-devel@lists.openembedded.=
org
Subject: Re: [oe] [meta-networking][PATCH] blueman: skip buildpath error

I'm not absolutely sure either. But what happens is what is described here:
https://github.com/cython/cython/issues/5949<https://urldefense.com/v3/__ht=
tps:/github.com/cython/cython/issues/5949__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_W=
VNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkT6VAm78$>

cython creates a variable in _blueman.c that stores the path where the blue=
man module was built:
static const char __pyx_k_home_flk_poky_build_hypr_tmp_wo[] =3D "/home/flk/=
poky/build-hypr/tmp/work/corei7-64-poky-linux/blueman/2.4.3/git/module/_blu=
eman.pyx";

So to me it looked like quite a similar issue. Infirit from blueman team al=
so has no idea, why this is happening
https://github.com/blueman-project/blueman/pull/2435<https://urldefense.com=
/v3/__https:/github.com/blueman-project/blueman/pull/2435__;!!AjveYdw8EvQ!a=
ik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCk=
6UxYxgE$>


On Wed, Aug 7 2024 at 04:28:34 PM +08:00:00, ChenQi <Qi.Chen@windriver.com<=
mailto:Qi.Chen@windriver.com>> wrote:

INSANE_SKIP is usually set on a per-package basis. e.g., meta/recipes-suppo=
rt/vim/vim.inc<https://urldefense.com/v3/__http:/vim.inc__;!!AjveYdw8EvQ!ai=
k2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkN=
yf0PUI$>:INSANE_SKIP:${PN}-tools =3D "file-rdeps" And following the link yo=
u provide, it does look like a blueman issue, because otherwise all project=
s using cython will have the same problem. I'm not sure about it though. Re=
gards, Qi On 8/7/24 04:34, Markus Volk wrote:
Blueman has compiled the buildpath into _blueman.so<https://urldefense.com/=
v3/__http:/_blueman.so__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0=
yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkL3X3zeA$>. The underlying issue is =
related to the cython compiler, so theres nothing that can be done from the=
 blueman side. [https://github.com/cython/cython/issues/5949<https://urldef=
ense.com/v3/__https:/github.com/cython/cython/issues/5949__;!!AjveYdw8EvQ!a=
ik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCk=
T6VAm78$>] Disable the buildpath error to keep blueman usable until the pro=
blem is fixed. --- meta-networking/recipes-connectivity/blueman/blueman_2.3=
.5.bb<https://urldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!ai=
k2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkc=
DhfGU8$> | 2 ++ 1 file changed, 2 insertions(+) diff --git a/meta-networkin=
g/recipes-connectivity/blueman/blueman_2.3.5.bb<https://urldefense.com/v3/_=
_http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU=
0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$> b/meta-networking/recipe=
s-connectivity/blueman/blueman_2.3.5.bb<https://urldefense.com/v3/__http:/b=
lueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOv=
shFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$> index 0374d23f0..afb97ee28 10064=
4 --- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb<https=
://urldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoV=
cD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$> ++=
+ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb<https://u=
rldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_W=
VNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$> @@ -86=
,3 +86,5 @@ do_install:append() { chmod 700 ${D}/${datadir}/polkit-1/rules.=
d chown polkitd:root ${D}/${datadir}/polkit-1/rules.d } + +INSANE_SKIP =3D =
"buildpaths" -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You recei=
ve all messages sent to this group. View/Reply Online (#111598): https://li=
sts.openembedded.org/g/openembedded-devel/message/111598<https://urldefense=
.com/v3/__https:/lists.openembedded.org/g/openembedded-devel/message/111598=
__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJ=
IuzNVrKS_QE94ZJGCkyE2gGuM$> Mute This Topic: https://lists.openembedded.org=
/mt/107758090/7304865<https://urldefense.com/v3/__https:/lists.openembedded=
.org/mt/107758090/7304865__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoK=
pU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkEsN0Bqo$> Group Owner: openembed=
ded-devel+owner@lists.openembedded.org<mailto:openembedded-devel+owner@list=
s.openembedded.org> Unsubscribe: https://lists.openembedded.org/g/openembed=
ded-devel/unsub<https://urldefense.com/v3/__https:/lists.openembedded.org/g=
/openembedded-devel/unsub__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoK=
pU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkuSguAag$> [Qi.Chen@eng.windriver=
.com<mailto:Qi.Chen@eng.windriver.com>] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

--_000_CO6PR11MB5602381CFCDD3A7548A2A59EEDB92CO6PR11MB5602namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Got it. Thanks for =
your further explanation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Qi<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Markus Volk &lt;f_l_k@t-online=
.de&gt;
<br>
<b>Sent:</b> Thursday, August 8, 2024 2:04 AM<br>
<b>To:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;<br>
<b>Cc:</b> Markus Volk &lt;f_l_k@t-online.de&gt;; openembedded-devel@lists.=
openembedded.org<br>
<b>Subject:</b> Re: [oe] [meta-networking][PATCH] blueman: skip buildpath e=
rror<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"geary-body">
<div>
<div>
<p class=3D"MsoNormal">I'm not absolutely sure either. But what happens is =
what is described here:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://urldefense.com/v3/__https:/github=
.com/cython/cython/issues/5949__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GP=
oXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkT6VAm78$">https://github.co=
m/cython/cython/issues/5949</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">cython creates a variable in _blueman.c that stores =
the path where the blueman module was built:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">static const char __pyx_k_home_flk_poky_build_hypr_t=
mp_wo[] =3D &quot;/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/b=
lueman/2.4.3/git/module/_blueman.pyx&quot;;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">So to me it looked like quite a similar issue. Infir=
it from blueman team also has no idea, why this is happening<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://urldefense.com/v3/__https:/github=
.com/blueman-project/blueman/pull/2435__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNn=
a8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCk6UxYxgE$">https://g=
ithub.com/blueman-project/blueman/pull/2435</a><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div id=3D"geary-quote">
<p class=3D"MsoNormal"><br>
On Wed, Aug 7 2024 at 04:28:34 PM +08:00:00, ChenQi &lt;<a href=3D"mailto:Q=
i.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">INSANE_SKIP is usually set on a per-package basis. e=
.g., meta/recipes-support/vim/<a href=3D"https://urldefense.com/v3/__http:/=
vim.inc__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_=
TIySGwJIuzNVrKS_QE94ZJGCkNyf0PUI$">vim.inc</a>:INSANE_SKIP:${PN}-tools
 =3D &quot;file-rdeps&quot; And following the link you provide, it does loo=
k like a blueman issue, because otherwise all projects using cython will ha=
ve the same problem. I'm not sure about it though. Regards, Qi On 8/7/24 04=
:34, Markus Volk wrote:
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Blueman has compiled the buildpath into <a href=3D"h=
ttps://urldefense.com/v3/__http:/_blueman.so__;!!AjveYdw8EvQ!aik2_AyIe3IoVc=
D_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkL3X3zeA$">
_blueman.so</a>. The underlying issue is related to the cython compiler, so=
 theres nothing that can be done from the blueman side. [<a href=3D"https:/=
/urldefense.com/v3/__https:/github.com/cython/cython/issues/5949__;!!AjveYd=
w8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE=
94ZJGCkT6VAm78$">https://github.com/cython/cython/issues/5949</a>]
 Disable the buildpath error to keep blueman usable until the problem is fi=
xed. --- meta-networking/recipes-connectivity/blueman/<a href=3D"https://ur=
ldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WV=
Nna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$">blueman=
_2.3.5.bb</a>
 | 2 ++ 1 file changed, 2 insertions(+) diff --git a/meta-networking/recipe=
s-connectivity/blueman/<a href=3D"https://urldefense.com/v3/__http:/blueman=
_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0t=
s_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$">blueman_2.3.5.bb</a>
 b/meta-networking/recipes-connectivity/blueman/<a href=3D"https://urldefen=
se.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zj=
q_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$">blueman_2.3.5=
.bb</a> index 0374d23f0..afb97ee28
 100644 --- a/meta-networking/recipes-connectivity/blueman/<a href=3D"https=
://urldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!aik2_AyIe3IoV=
cD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkcDhfGU8$">bl=
ueman_2.3.5.bb</a> +++ b/meta-networking/recipes-connectivity/blueman/<a hr=
ef=3D"https://urldefense.com/v3/__http:/blueman_2.3.5.bb__;!!AjveYdw8EvQ!ai=
k2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkc=
DhfGU8$">blueman_2.3.5.bb</a>
 @@ -86,3 +86,5 @@ do_install:append() { chmod 700 ${D}/${datadir}/polkit-1=
/rules.d chown polkitd:root ${D}/${datadir}/polkit-1/rules.d } + +INSANE_SK=
IP =3D &quot;buildpaths&quot; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
 Links: You receive all messages sent to this group. View/Reply Online
 (#111598): <a href=3D"https://urldefense.com/v3/__https:/lists.openembedde=
d.org/g/openembedded-devel/message/111598__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_W=
VNna8Zjq_GPoXpoKpU0yWxiuOvshFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkyE2gGuM$">
https://lists.openembedded.org/g/openembedded-devel/message/111598</a> Mute=
 This Topic:
<a href=3D"https://urldefense.com/v3/__https:/lists.openembedded.org/mt/107=
758090/7304865__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvs=
hFr0ts_TIySGwJIuzNVrKS_QE94ZJGCkEsN0Bqo$">
https://lists.openembedded.org/mt/107758090/7304865</a> Group Owner: <a hre=
f=3D"mailto:openembedded-devel+owner@lists.openembedded.org">
openembedded-devel+owner@lists.openembedded.org</a> Unsubscribe: <a href=3D=
"https://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded-d=
evel/unsub__;!!AjveYdw8EvQ!aik2_AyIe3IoVcD_WVNna8Zjq_GPoXpoKpU0yWxiuOvshFr0=
ts_TIySGwJIuzNVrKS_QE94ZJGCkuSguAag$">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>] -=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
<o:p></o:p></p>
</blockquote>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_CO6PR11MB5602381CFCDD3A7548A2A59EEDB92CO6PR11MB5602namp_--

