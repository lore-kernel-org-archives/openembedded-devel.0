Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB97FB519B
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 05:51:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74674.1775540807752046877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 22:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZOWZE8Qm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8557271aef=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6374lUYX2826288
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2026 05:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pBq+w1LsG8QST8iTJe5JSIcnROsQjtvXBbujKIVgSpA=; b=ZOWZE8QmGik/
	VCw7jnn0lPVPqg4TnHOVEMpZ1CeNmXb1KWrroolUL9bmdin5CyISa42mbs/C87rg
	kbAFyJLoqpbZBVyjsH3AJlC/I80CduFncCxTiIdFwKk2lfxZsFwSbh+mK5xl1+F7
	JzBR+bcfXC9pb7Hc9PB6VDbaM5RtoC/K6fwC4vcETxU+etg5XZZFynmtmVG7FwQQ
	vTuySkOtsSr8WrSUCmKwCr/qQyvi6t6CICT/YqHgwZM0GHrWOE0sRD1yZ6zWf7vc
	9NVGfAijg1ET5j6VUqwGvJDIoYbEDGoQ/BSOJwHRJqs7ZlKTqDFOlp9bYNlL8nRx
	Tx/cF+dEaw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqg9xc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 05:46:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0ieMJm7JqPcL14bcI8Zp4MYTYDVb74yUv6tK8SMoV7Fex/gTT0pnqQLVkuyCrXEtif3Tb0p3zMt7BAZYHvDCKFwUw0DvkpNOD4YxDnvkwHo8tRf4sWQ8V4JHoOHDyw5NPIeEHfOdm99X6+7WfMVHpA+VlTzOkv62Fhd97xVws5T+De75ZrXVLIZoEu67/wOEdpgT/v6VcP1TrCiW+x7vyfADBTmc6uZn5iXW2OsKurVJnRWiYFnD58ZqCAHyq0LmYboPDaPHUxXRkk08OSVebCCiuTFqejm5EaGyJIKW7cAt8sTnngX5IQetCvGi942ejVZFyvo75AyVrMI85Hrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBq+w1LsG8QST8iTJe5JSIcnROsQjtvXBbujKIVgSpA=;
 b=PyuwCewcnWHRGo4D6VHbSaWpoMuzrcEMXYV4mB+EfvMf7cSjiWeku+N1NXeZONNYa7sFrEAQ7N5WdSCCMEjpsnz5J/IphQnyw7eL2HZhO9tLjqDBukFlSOAzW61i4kXDDPK0/cVMQCd+Tc7wIwuFm5AclSQuhcGatKbA9PfzYPnyuAK3XLXt+rBmoglBY9OcnXDgpthOGm97fI/TEbc8QAw37K1iCPPnIPcgsaz3zuKeOe2oa0HvEBzC92ZYX0GpQN7m9tcl97cFurZH+6RMbfbZLixJMmh42OTAbo6xilCzll+0HnQSoX6KkTrAx6ZDVndnOSL7kxn+ayy1Oo6R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF6E320AF71.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::833) by DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 05:46:43 +0000
Received: from SJ5PPF6E320AF71.namprd11.prod.outlook.com
 ([fe80::bca:5703:b92:3e43]) by SJ5PPF6E320AF71.namprd11.prod.outlook.com
 ([fe80::bca:5703:b92:3e43%7]) with mapi id 15.20.9745.019; Tue, 7 Apr 2026
 05:46:43 +0000
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated pkg_resources issue
Thread-Topic: [oe] [meta-python][PATCH] python3-stopit: Fixed the deprecated
 pkg_resources issue
Thread-Index: AQHcw0b2Lupm8/T/vky+l1j1fF0wsLXTHQ5A
Date: Tue, 7 Apr 2026 05:46:42 +0000
Message-ID: 
 <SJ5PPF6E320AF710389AC91B4AD89B5D102EE5AA@SJ5PPF6E320AF71.namprd11.prod.outlook.com>
References: <20260403033841.2186031-1-haiqing.bai@windriver.com>
 <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
In-Reply-To: <95c162a8-3a87-4d61-ad23-9d2548cfdb84@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=24e7bb4c-c1a0-47a9-a3eb-53cca0c7b2b7;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-07T05:45:57Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF6E320AF71:EE_|DM4PR11MB6550:EE_
x-ms-office365-filtering-correlation-id: 356df7a6-2333-4037-d52f-08de94690c33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 jk7phdTizuV1acxLYEiPNNuHmuf77BEUsos2JyEaU5ED2yXPSQY8JA25hCa4Fqj+lzbcKeknUlhdYprrFwbRqWq8oWeQf6NspKfBg+4ZjtlMAaBkvshb9gNpJvtzGoNhVLxcxDnfu/Ql4yGAf3ZWJZ8is38MBli7DduImhayACZvO081RYW6wxt+EH9hQJI4lbQuKr9038g4a9yWO4Teld1l1JLJ/ZLVhzMCwYl5eWbFWr2J2r9zO81n1niK7htQkarNPrPI6eNdz+RKMV9Yhxdh0aKP4mAOD4kjyT+cs5bmYq5YH0AOrEYPT9MaEjxwP0tYx+sv6+aq3mUe+mBPmPH42EVphecN2u+L7o5IickESpddiIOTlg17fmlKvsEw2j52OJsCL/i5F/uSqxDrHlOhgPJ+g17XHod0tXOcL0A4oiQ9jOXaI/VJxLiNvALfNYOSoJrdsvUkluHdV0qzCw23csON5Dz9SC3p8sRLlGyzhmfNNNVySxlQxWHTuz2eykYlCeEshU5vg+/nVNtp4kPA4fTOe64+V/J5RLWLU8bBxn//WMDqz+TDaJlk4J3FcgJiK2eZYgWF3hNRZybheFBgiwJf54UWwshP5uhTseKxIHEKxJcDwAiXoC+uFDcWDJ23xhWL2dRoiO2xCf3GRtoeweGkOV9ODmXaRSHgfG0vU/PoNEqQw5bcU90644PWKt3LgkI7dTMYzvom2vhFHAa3/ePfXFWVCAFcg/9SD5k1wIcxSF5Yb7JZguFQVh7D7zzdawP3oBeOs1BigxP+TMMRVaGhH4bp1kW8qX6KuWo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF6E320AF71.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?enRURWtHSmxUc0ZycmhIR3c0N0wwNktKTEd0cjhhRE1zRE43SXlBelJqVncw?=
 =?utf-8?B?U0dXRlEwZ0N6aGdvb2Jad1FseS9qbzJxUVlZeThtVHcxUmpBRkhkL1NiYzEv?=
 =?utf-8?B?UmxCNi9zcVZ3N2FzZitOQXYwR1FEeVhUM2tVV2dYdzZRWktvRlkvekNKS1R6?=
 =?utf-8?B?d2lwUU9hUE9DQ29BNXljUWREekVjYjkzajgrQWY4RFc3ZkNiaFBZRVNsbllH?=
 =?utf-8?B?bFB3UVFzVTNoUzZtcStXMElUTytuamlRdDdTaTBSN252VlZoZjVXVDBwcXI0?=
 =?utf-8?B?cHBBeHdLQ2FuSURZemY3eUFuZUVsY0hKMi92SEFxb3BEaUdDWDFuZ29ZY2Fp?=
 =?utf-8?B?NFJmckNTYnZ6KzlaV09nNFdVMHZXNVg1RUpWR0NaMGtxeHhZemh1dTAwYVpH?=
 =?utf-8?B?Q0hEaHJRMXdaekhlWUFySFZEazJjU1MrM09tSjFoVHRYa2VoMTJQbS9IbXBq?=
 =?utf-8?B?QWV0UTVibHBhYVdjeHVsaEFEUDZLc1FGalNiY1BOVUZhYk1jcURCdDM3UWZP?=
 =?utf-8?B?VTlpYmo2MzlPWnBqU2hnNmhLVFgzUHpoQmYxRi9DRFFrV0paVW1yYkVwNGMx?=
 =?utf-8?B?Yi85TmpITysyY0dBaTA1bGE2VHFQcGY5S3I3dGhmd3ZlVTRtckErK0pQK0di?=
 =?utf-8?B?Z3EyakU2ZVloUHFHRTJ6V2tuVlc5YUIxZXJFY0U3eUZZWHN6Y25DTnprbUpx?=
 =?utf-8?B?QnYwWVpLejRUbDNBV1RTellTMm8vamxibzBtVERWd0YxR2JyUmUrVVVSaVNT?=
 =?utf-8?B?aUJsbUJobmNWL24zVFZOSjNzOW1mSFZwV3lib3dUSWtpb3FWUitpL0NtbU54?=
 =?utf-8?B?cXNvcmlnN1BYZExyN1IzQ1Z3RjBXOUFnTGU1NzBmMnpqR0w4emdrcEFVcE12?=
 =?utf-8?B?TkFyUkxZalUxQWZXQVVjVk1OVDlFQ1VVQ3U0UTIxUzVGMjZvbVBOMjRpL2lZ?=
 =?utf-8?B?NVFXT2lFbHV3Vjg0YVErbVpad0dDbmo5Y2VkN2Y4bHh2dG5GbTV3VUVOdlh2?=
 =?utf-8?B?enl2eVRGMmNZZk1PSFV3Mzd2SXJKMUdqUmlzYW4vcUNFZjJwdCtVL2ZFbE80?=
 =?utf-8?B?bXlRdUNzdFQwNE9ETzVwUzExQjBKdzl6NXR2MFAvVHNMaVVOZURDWk0vczQ3?=
 =?utf-8?B?YTdXa25sK0NvVVlIaG1Zb0FSQ2FXUWpzdHhIajFYbUMzNWx5eHdJM1NWTVZ3?=
 =?utf-8?B?V0NSZnVXTTNDVUw4d0FKQWEvbE9md2IvQnlzSWtTcFZ4YkhXc2pjMGV5ZWty?=
 =?utf-8?B?Y3h0Znd4RkwraGh6S2JSc24wM2lseURxTlZFT0x0S01JN2p3dVVPTVRpVFNj?=
 =?utf-8?B?MmM1eEwyR0dWVWExQ2RhbDM1cnVGd1N1dGlmVG1qNzlLRFpYb0Y3eVlhV1Yy?=
 =?utf-8?B?MXRKMU8xNnpMT0MyaGUrajc1Vmp2MktCMnBhdDdrZU8yQ0h4WDUwV1d0VVFl?=
 =?utf-8?B?dk16cHBZYllqbzhWUTBQelJjbFBBbnAwNDNPa3JqaFV4ZG1pSXpWN3FZRm1h?=
 =?utf-8?B?YThnZ1JheE5rNVhXZ3kxbDdaMVcwK2R4MlpkSTdITjJOQUxvVVNmWmlFRHRZ?=
 =?utf-8?B?Vy8zN2NMM3NsVVFneXFuelc3eStzK2tWcEJUSlc2OFNvcDJ2bnVSaTRSNlhj?=
 =?utf-8?B?WGpkc091RDFvckVZdWtPZlpPdTZIY3dyTkxCcFE1czVPOHlMOEhUeTNuZ1FE?=
 =?utf-8?B?M2k3Z2xqZmt0dFUwdjdSUHBDUXIycFlVcTVMVmRBQ3IxYm13M1h5L2JGdnJG?=
 =?utf-8?B?cEhTMkJqRTFZRkY2SUVnZVBjQjh2UUNpdGk0YmJqRndZR01ENExCRU9NeG9B?=
 =?utf-8?B?UlBjNnJ3RTN1Yjcvam1UN1FQY0luZXljWkdVSGRjbSt2Vmg5WkpmSWg0aHQ3?=
 =?utf-8?B?ZCt1TW1GMGtYbjZDV1JtMnRQWVhVLzlEdUZiL2pmS1hxVDZKbTFPQndqelBm?=
 =?utf-8?B?cDV2QzR2cmhLWTRMQnNlVFJPUWk0Tmludyt4RmpQaE5CbGp2OThKYVF2M2hN?=
 =?utf-8?B?cDZsNnE1bHRpaEZZRGtuK3RvOHVTMC95eWF4QjZSWFEvOU5ybWpaZkxtbWJ1?=
 =?utf-8?B?SStlcGc2MC81YnhHYlJFRFdFRllFZG92dFRJdnZhYWU2M0ZtYmZvRzM5V2l1?=
 =?utf-8?B?NkYxZFpzMXp3Z0ttSnl2NFR1eGxzTFpxZzkrUXlSQW5HNVAveDBDdElucW41?=
 =?utf-8?B?MHRCeVdSakhvZ1ZwSVNBcFZlTTVkSWtnMzZnSnM1c2JTZWZabW5VZE5KNlpk?=
 =?utf-8?B?d0I4ZWZvcmRLVlBKN3JQTVppZmd1SmJRZDJiTlBGTVZaQkI3bFlITkZ3WFNH?=
 =?utf-8?B?eHBTRmZ5NnRDVXhmNHZwT2xiNG1xTWx3NkQwakVjaHB1Rm9XRk4wZz09?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	mEPp+vSYHdS9W+zzCdbj4rg4rxbCtgqC8Nxmyk5aTOm11MHH8Hnx2KDws2npBhIP3A1fykBaJ5yUF6iYZt17/VZziUUgsg+KwF6QmWgJjNQdabufLg982aCyZgmskXXzy6YDwRg6zmmozLWGHjYsykIBJaJ+bldReDwU4Bur+u8PVrUagh4RTzpdWvHFjVToQtqcvHBoQ5AtEfTDgunjvW2Zy66jMjVc4ThWSd6kfWl1/HLeCQRTqaLJdRFBhfcsvq4K2cSOTcbVUDA0F6Is/57SnMljeTMKv2L40GK58mQrOl52ZX/nf+XXL8OeLPI/3Hlw2gWwPz4gURcLIdu2EQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF6E320AF71.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356df7a6-2333-4037-d52f-08de94690c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 05:46:42.9756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0b1D0AYEWtAunn3cgqabILZVIFMd+ICXHwoiLoUEV/kGuIgboeG9Wcl+HH4aI2MYL6D1UT+HhyXRv6Kg52t/FhZn17dCj923aRK/ndYD1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d49a46 cx=c_pps
 a=yOesU4ZViNrJhpLvMmxu0A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=CckQENj0AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 2kO5sP5USNKbvC9STE62qN86uTZ21pB8
X-Proofpoint-GUID: tnixpYusu8HSMDWMCkfVKimAEeH254rA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA1MiBTYWx0ZWRfX3/4foySEBEdp
 qMNKaKtJwoYiTqzez8wQceVTcmDIlpH3hGJKb7LxrTK1ESBcsNN1fQ+W0YnoBKxe1eEqSEP1rUS
 pNy5WUIphjNG2cbqJVQQ/fBz3YdzHbSDZYEZWB/mTVRzgMUMlFBxdiPfBE3SIrg1Pq8u9EG1XN6
 trNbTT3xGSbn3BcoQBBegkZ9nnokK1d1/J7OVF8Z9cxrgMQtEq4SEPe50yjUTwMsgDX3Y/MPJZo
 PBtI+12I1vyW+hqPXdL+jKMMR3itVunrZPBv83qlWHk4Y+GTKkfmqO1ANlu/AnKHyKJ3p84AY2R
 T/7sljwTiBJcH2zt4JFeG4FAjB7qepcdkir9KX6g3HtgQCeBTLV6kj3pYq7tahu5uKuqHgJ+gkm
 GlV0VqGsS+xIvTneh67nln2qb5cSjSfer58YeyxAhoA8rw4SThKvI1Wkonohpa0zPPUQTPJefOg
 9SLoJ5qoF7ZPhteS7kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070052
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 05:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126075

R29vZCBjYXRjaCwgdGhhbmtzLiBJJ3ZlIHNlbnQgYSByZXZlcnQgcGF0Y2ggZm9yIHRoaXMuDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRp
Z3JhdW5AZ21haWwuY29tPiANClNlbnQ6IDIwMjblubQ05pyIM+aXpSAxNjo1MQ0KVG86IEJhaSwg
SGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1weXRob25dW1BB
VENIXSBweXRob24zLXN0b3BpdDogRml4ZWQgdGhlIGRlcHJlY2F0ZWQgcGtnX3Jlc291cmNlcyBp
c3N1ZQ0KDQpDQVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBl
bWFpbCBhY2NvdW50IQ0KRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KDQpPbiA0LzMvMjYgMDU6MzgsIGhhaXFpbmcuYmFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiBGcm9tOiAiQmFpLCBIYWlxaW5nIiA8SGFpcWluZy5CYWlAd2luZHJpdmVy
LmNvbT4NCj4NCj4gcGtnX3Jlc291cmNlcyBpcyBkZXByZWNhdGVkIGFzIGFuIEFQSS4gVGhlIHBr
Z19yZXNvdXJjZXMgcGFja2FnZSBoYXMgDQo+IGJlZW4gcmVtb3ZlZCBmcm9tIHNldHVwdG9vbHMs
IHNvIHRoZSB3YXkgb2Ygb2J0YWluaW5nIHRoZSB2ZXJzaW9uIA0KPiBuZWVkcyB0byBiZSByZXBs
YWNlZCB3aXRoIGltcG9ydGxpYi5tZXRhZGF0YSBtb2R1bGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEJhaSwgSGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICAuLi4w
MS1Ecm9wLXRoZS1kZXByZWNhdGVkLXBrZ19yZXNvdXJjZXMucGF0Y2ggfCAzOCArKysrKysrKysr
KysrKysrKysrDQo+ICAuLi4vcHl0aG9uL3B5dGhvbjMtc3RvcGl0XzEuMS4yLmJiICAgICAgICAg
ICAgfCAgNiArKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlLWRlcHJlDQo+IGNhdGVkLXBr
Z19yZXNvdXJjZXMucGF0Y2gNCj4NCj4gZGlmZiAtLWdpdCANCj4gYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlLWRlcA0KPiBy
ZWNhdGVkLXBrZ19yZXNvdXJjZXMucGF0Y2ggDQo+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zdG9waXQvMDAwMS1Ecm9wLXRoZS1kZXANCj4gcmVjYXRlZC1w
a2dfcmVzb3VyY2VzLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAuLjQyNTIzODYzODQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0b3BpdC8wMDAxLURyb3AtdGhlDQo+ICsr
KyAtZGVwcmVjYXRlZC1wa2dfcmVzb3VyY2VzLnBhdGNoDQo+IEBAIC0wLDAgKzEsMzggQEANCj4g
K0Zyb20gYjcyODI1Yzg5NzI0YzJjM2I0YzljNjBkOTBjOWQ0YWQ1OTdlZWFkMCBNb24gU2VwIDE3
IDAwOjAwOjAwIA0KPiArMjAwMQ0KPiArRnJvbTogIkJhaSwgSGFpcWluZyIgPEhhaXFpbmcuQmFp
QHdpbmRyaXZlci5jb20+DQo+ICtEYXRlOiBUaHUsIDIgQXByIDIwMjYgMDg6NDA6MjYgKzAwMDAN
Cj4gK1N1YmplY3Q6IFtQQVRDSF0gRHJvcCB0aGUgZGVwcmVjYXRlZCBwa2dfcmVzb3VyY2VzDQo+
ICsNCj4gK3BrZ19yZXNvdXJjZXMgaXMgZGVwcmVjYXRlZCBhcyBhbiBBUEkuIFRoZSBwa2dfcmVz
b3VyY2VzIHBhY2thZ2UgaXMgDQo+ICtzbGF0ZWQgZm9yIHJlbW92YWwsIHNvIHRoZSB3YXkgb2Yg
b2J0YWluaW5nIHRoZSB2ZXJzaW9uIG5lZWRzIHRvIGJlIA0KPiArdXBkYXRlZC4NCj4gKw0KPiAr
VXBzdHJlYW0tU3RhdHVzOiBJbmFjdGl2ZS1VcHN0cmVhbSBbbGFzdGNvbW1pdDogSmFuLzIwMjQg
bGFzdHJlbGVhc2U6IA0KPiArRmViLzIwMThdDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEJhaSwg
SGFpcWluZyA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiArIHNyYy9zdG9w
aXQvX19pbml0X18ucHkgfCA0ICsrLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvc3JjL3N0b3BpdC9fX2lu
aXRfXy5weSBiL3NyYy9zdG9waXQvX19pbml0X18ucHkgaW5kZXggDQo+ICs2Y2EwMTgwLi41ZGRm
YTRhIDEwMDY0NA0KPiArLS0tIGEvc3JjL3N0b3BpdC9fX2luaXRfXy5weQ0KPiArKysrIGIvc3Jj
L3N0b3BpdC9fX2luaXRfXy5weQ0KPiArQEAgLTcsNyArNyw3IEBAIHN0b3BpdA0KPiArIFB1Ymxp
YyByZXNvdXJjZXMgZnJvbSBgYHN0b3BpdGBgDQo+ICsgIiIiDQo+ICsNCj4gKy1pbXBvcnQgcGtn
X3Jlc291cmNlcw0KPiArK2Zyb20gaW1wb3J0bGliLm1ldGFkYXRhIGltcG9ydCB2ZXJzaW9uDQo+
ICsNCj4gKyBmcm9tIC51dGlscyBpbXBvcnQgTE9HLCBUaW1lb3V0RXhjZXB0aW9uICBmcm9tIC50
aHJlYWRzdG9wIGltcG9ydCANCj4gK1RocmVhZGluZ1RpbWVvdXQsIGFzeW5jX3JhaXNlLCB0aHJl
YWRpbmdfdGltZW91dGFibGUgQEAgLTE1LDcgKzE1LDcgDQo+ICtAQCBmcm9tIC5zaWduYWxzdG9w
IGltcG9ydCBTaWduYWxUaW1lb3V0LCBzaWduYWxfdGltZW91dGFibGUNCj4gKw0KPiArICMgUEVQ
IDM5NiBzdHlsZSB2ZXJzaW9uIG1hcmtlcg0KPiArIHRyeToNCj4gKy0gICAgX192ZXJzaW9uX18g
PSBwa2dfcmVzb3VyY2VzLmdldF9kaXN0cmlidXRpb24oX19uYW1lX18pLnZlcnNpb24NCj4gKysg
ICAgX192ZXJzaW9uX18gPSB2ZXJzaW9uKF9fbmFtZV9fKQ0KPiArIGV4Y2VwdDoNCj4gKyAgICAg
TE9HLndhcm5pbmcoIkNvdWxkIG5vdCBnZXQgdGhlIHBhY2thZ2UgdmVyc2lvbiBmcm9tIHBrZ19y
ZXNvdXJjZXMiKQ0KPiArICAgICBfX3ZlcnNpb25fXyA9ICd1bmtub3duJw0KPiBkaWZmIC0tZ2l0
IA0KPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3RvcGl0
XzEuMS4yLmJiIA0KPiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3RvcGl0XzEuMS4yLmJiDQo+IGluZGV4IGE5NTI3MjI2MTkuLmE4M2FkZmZjZDIgMTAwNjQ0
DQo+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Rv
cGl0XzEuMS4yLmJiDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3RvcGl0XzEuMS4yLmJiDQo+IEBAIC0yLDcgKzIsNiBAQCBTVU1NQVJZID0gIlJh
aXNlIGFzeW5jaHJvbm91cyBleGNlcHRpb25zIGluIG90aGVyIA0KPiB0aHJlYWRzLCBjb250cm9s
IHRoZSB0aW1lb3V0IG8gIEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9zdG9w
aXQvIg0KPiAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iDQo+DQo+IC1TUkNfVVJJICs9ICIgZmls
ZTovL0xJQ0VOU0UgIg0KPiAgTElDRU5TRSA9ICJNSVQiDQo+ICBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly8ke1VOUEFDS0RJUn0vTElDRU5TRTttZDU9NDk3YzU1NmY0MmIxMzU1YjY0MTkwZGEy
ZjNkODhmOTMiDQo+DQo+IEBAIC0xMCw2ICs5LDExIEBAIFNSQ19VUklbc2hhMjU2c3VtXSA9IA0K
PiAiZjdmMzljNTgzZmQ5MjAyN2JkOWQwNjEyN2IyNTlhZWU3YTViNzk0NWMxZjFmYTU2MjYzODEx
ZTFlNw0KPg0KPiAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzDQo+DQo+ICtTUkNfVVJJICs9ICJc
DQo+ICsgICAgZmlsZTovL0xJQ0VOU0UgXA0KPiArICAgIGZpbGU6Ly8wMDAxLURyb3AtdGhlLWRl
cHJlY2F0ZWQtcGtnX3Jlc291cmNlcy5wYXRjaCBcICINCj4gKw0KPiAgUkRFUEVORFM6JHtQTn0g
Kz0gIlwNCj4gICAgICBweXRob24zLXNldHVwdG9vbHMgXA0KPiAgICAgICINCg0KDQpBZnRlciB0
aGlzIHBhdGNoLCBkb2VzIGl0IHN0aWxsIGhhdmUgYSBydW50aW1lIGRlcGVuZGVuY3kgb24gc2V0
dXB0b29scz8NCkkgdGhpbmsgbWF5YmUgdGhhdCB3YXMgdGhlIG9ubHkgcmVhc29uIGZvciBwdWxs
aW5nIHRoaXMgaW4NCg==

