Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91810CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:46:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4942.1758163608699531267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JYUmHRQ1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13564c86da=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I0xfFV3073366
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:46:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RTBABbEFxfw0TLPMtnsE9ZYb99wYbCMbWrgFKhivcqA=; b=JYUmHRQ10E8z
	FlrT6ZSKr7Etva3r0sUVfwFAjCmN5D8wCEobEKfBD/x4U4c6U45EUzRF8SzbCAiN
	m/2DPtv6YHOciWX/EwVIzFZ/lgCVBehxvbfAyWUpgL0pNiynAU+vhBs4JntQ2jjP
	ywOKlRJWIPOppGAoNOikWLPxlYEAKITHNoK/I5LlaGBv/VZ8p/F8Nw6P4vvmd8bE
	70gwDBFdQyb6rjrT0dScXQNTROS+FeWBN2+tZMIUAutGQY0duXp3aoMgNaGWkhFA
	Gg0JpByHOJeBY6BqH4wT3rJpEoFQlv7MFhtC4D/tjDzpCV785dAz3JSIX6jd5Gi+
	JgKC/fciVQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1ha5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 19:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTPn0X0m4MPop8gfObb6AdhhnXnsKXFFvQCLWA01OrfCMo4xmDYd76RkSMQNov8z6RWM48EGP1WefBxVQsMuaEuFZsZxWbR2i8ftgfNu++eaMvhtWTgfDUm8flzhP9SQPq9MOnJBRehRHHwVn5Joy2XaSc+tth9Zo8QL/8SqSotzpdHe6ucRqMY9dRcyjLpphXgGg1i9+wDHC9Spxc9MmOGdrXLt6B0caIUwbq/zyWPamC+j94pWakTT62a8ZHCG9kq5Cr16LNTjBtU26NGlgHTTx2vm1UMF1c9RumNKnkQYymLaKgYcPAFUJWKiOBioBYXb/1uzM3KXDm1xSg0aZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTBABbEFxfw0TLPMtnsE9ZYb99wYbCMbWrgFKhivcqA=;
 b=yUd36/hWk9PXED+aVB7l5u6StQJt5FFWdUndRjB3N36YgPyvQYAvaXNJhuP7EdFGQa8uKQUveKEJTno5dwPmeVAbRHGOzzbQpjCIBQIV5O6xTSCm0nxmziDgqYpesPvJ4TwzVUrcmosZnOrI8I4CZf2gEsaKx+Dmrg7QSFCv5XP5Am1H8IFCu+D5c3puK+EXmCZuQb2hasMHk8oFohpbmEmArV230yLpZLCop4lCNSqt4U2BWjdWDtBec+pVvY1tqq5cy0vuWJUBM1k3WYAE6iglK+3JLn8KJNDYB1OV6hrq5UDlwCpUbGhTHvUEVpX09LbHqfKMjT0lmiWgQrdQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Thu, 18 Sep
 2025 02:46:45 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:46:45 +0000
Message-ID: <adee757c-6593-4537-b50e-9cca827b63a1@windriver.com>
Date: Thu, 18 Sep 2025 10:46:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][scarthgap][PATCH] python3-posix-ipc: fix
 runtime error
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250915132952.1092546-1-haixiao.yan.cn@windriver.com>
 <b94de38809cb28b6cee39ae0f5f9ad980244a2b8.camel@intel.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <b94de38809cb28b6cee39ae0f5f9ad980244a2b8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 7046f430-402c-4c38-0280-08ddf65d9b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFRGMkpPdlZLVUNCMzJkTXI5cCszWlRiaDRuN3pLN09odkhuODZucXNMVXUv?=
 =?utf-8?B?S2RQdC9YRHZGUXJXN3FvT1Z5SGpzdEFyNDJBV2RsNElWdjluQmZvQmlxVVpG?=
 =?utf-8?B?ZUpvbzEvM09rL2x2RGE5V2VLVGhwcmVINHRVVE0wTFdVOERpV0d2V09sd3lx?=
 =?utf-8?B?N21GZ0FSRTArSG5TU0w4OWZlVVNzaWY5L1lLL1ovV1ZmcWoralJMQUZMN1N0?=
 =?utf-8?B?bUZ5bDA0SVVtZnhrK05zUXp5OUdQdmtFeHYzWDlQcHhkUjU5Tm16N0pjU3Fh?=
 =?utf-8?B?cDI2cHlxSmZHN2tvbThxNTNxbUpWQVI3N3J6alBVMXdrbXVERTdJakVKenp0?=
 =?utf-8?B?VEJYUVJNKysxMUhxNmFBL09PSjQyczJmU1lzM254cDk3bWt2M2V5VkxtTk9C?=
 =?utf-8?B?bEpEdjVHcHBpMnZZdEUyZnBKM0M3OG5mdFRVcmRHcmRicEFkVDJpRDB3YUtW?=
 =?utf-8?B?ZUJacTZORFdlQmhtVUN3WFlKc2dXSURJUTZEbkVjVTZFZGNlaXYzMEFNcFh5?=
 =?utf-8?B?WDAyQjZsbm9XZGd4VEVJUHBkVklpaGZFeXp2eHY5eEQ5OStqakJXaDBPeFdT?=
 =?utf-8?B?NDlhK3VEcXlFVjNuZUtSMXZzeTBwTmZBVG1iZDJoUG9DV3ZQWFN6YVArZHhh?=
 =?utf-8?B?SW8yaTFHVk1xNGRiWjdqa0hPS0p2RG4xbTNWOHJrUlRQVWV2VFhydDkzVHBK?=
 =?utf-8?B?MUlscU5FUllKUDB6RE9MMWtGdGQ5bWxQOXJoOExpeWl2eGhaSVJIREpONTcr?=
 =?utf-8?B?MHdTSWpPUk1hQ1VoKyszQmhLQjZYdTVHTGNHRHFYS0pxUmlxSENZb05kaUhW?=
 =?utf-8?B?Nkl3anA3dkV6ZFdoTXprazBna2Izcm1UcEkxWm02WnNlL3g5Y2c5ZzNSUm9j?=
 =?utf-8?B?VDl5Tml6WUtJYjI5a2xyS2ZEd05zNjY5MnBHQ2NhNFRXY2VMRTFCOGNtNzdF?=
 =?utf-8?B?TnhXd0YySWtlYUZpaHJzMHNqQnJGQ21MTjRsREg2Q3o2aSthckFpcnVpaUl3?=
 =?utf-8?B?QVlDcHJVZkFkamw2NWYwQWJ5ZXVRNkt2cXlZY2lxNmt5ZFNodzRQTlRwTnEy?=
 =?utf-8?B?L1crSFhEaGxVcHI1NFBET0pZU0szdmVvNUhCc0RxejFzSThIaFpwS0lzNTlQ?=
 =?utf-8?B?eVJwcGx3QWZjMnI0d0FrQXh5VVVIcXNPWU1IL0gwVVhWY1pHREo1Y1BaZk9O?=
 =?utf-8?B?Qnc5WnlDNEZYU0ZaWWxPeXlGSFJKKzNLRFpoVll5YTdxZzFZeVRLNXpnc255?=
 =?utf-8?B?bHBEY1VjYWVHZ25UbGZKQjVKMUFwN2x1MnFqeHRpclFoSnlVendIcHhGMUZq?=
 =?utf-8?B?MjhkMUhkYVIrTjNFaHB0UlZBTm9rQ2I4NzIxd2JNSVNxcVZmYUwrMDB5U09C?=
 =?utf-8?B?alk5akpuQzNqaStOZ2R5Y2lDTkVzS1NsRG9IUlBRaEVQeGtLeml5amVHMmZC?=
 =?utf-8?B?UTJSZHNpOU80N2c1cUxzOEZhVFlXWEpaRjdxclN5VVdYSmF2RXJyV0hEano2?=
 =?utf-8?B?QzdFa1dKT3ZDeUNaaitHc0U5MEZFcElHSHArNEp2ZkZHUUhaU3hkZFNPM3VI?=
 =?utf-8?B?OEtNZXZsbkpXaU1tNGV5dllqTGxNZllPN3R0eEx4ZHM4K1c1QkJ0WXNxUFlp?=
 =?utf-8?B?bkljMitBbWFXOWFuek1JVVF6RXRwdFpZRlhvMlljb2JVMkRySUREdUNpU1FW?=
 =?utf-8?B?ejdSOGw3ZEJSUWtSTjM4eHNyOWFYdE0wbC9IRldYMWhIUlJ1T0ovSXlpeW5y?=
 =?utf-8?B?SEcyMFZJZ0J4Q3VleUxjNUVsOGdqc0hkaDdYUlF4OExQV3lwbjZMcTdBTEVR?=
 =?utf-8?B?dTMrNTl1Szd6NmJ2N0lvRjJGdjh1STA2TFMxVjJtc0ExdExLd0YxaTJzRnVH?=
 =?utf-8?Q?3/uhfbHOxOHLB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y29raEpKK0hYV1RqVjE0NHY2ZGtsRk5XYU9McWVwUHdaaitoSE1QOC84ZkNW?=
 =?utf-8?B?SXlxVjhzVldwaDNCUlVhbU1hRE4yVCtrK1Bjbzd3c1BwaXBLSkJLbmE0UHFs?=
 =?utf-8?B?Lzl1MEhPZ2kxS0ZDNXBEV3NxL290dEo1Uk9JNk5tMWNLODRuVEFJK2pyS1hj?=
 =?utf-8?B?dDVQRENHMWkzeDdiQjdENTl4SG9qWWJPeXUybzBNOGd5bklNRW9ONFpSNzdW?=
 =?utf-8?B?eGpCUWE1L280ZnZiWFpuaGI5bUFYMTVVb0NZdkNsR0pDVWhQUjNKR0J3TWp2?=
 =?utf-8?B?R29aZGF1YzFGcExsSlBoUVprdXpoczF4QkVzT0dhbms0ejJpbEZXeDAzTkFN?=
 =?utf-8?B?SjV3ZWM5QjZINEwrekU1ckIzUjE2dzEwWXdKSjhwTExEOUpMT3hzc3I3SzI2?=
 =?utf-8?B?cW8rKytJTkZPM1N2dUVpTVFRMEUvZEZORnNOTlRDNml4Rnp2UFhZYmV1ZkU5?=
 =?utf-8?B?UzRyaGZsRENWLyt0MExZRUFpY0RFSUJ3WHhibUdITlR0bThGVGRkUC9NNytn?=
 =?utf-8?B?R2twSGRRZUpvWWJuU2RMaFR4UHpnaHUzMG90dzhkR29oQWpQems0YjJ6aGo1?=
 =?utf-8?B?cFZEV2hPNHVKT1RTV2pxcWZHMmd5RDZLVTJQaVN2NWRGMkIxS2pIWHI0LzBZ?=
 =?utf-8?B?Y3krR1piSWwwOXZnRlJsdDZkSTJ1TWVWN3BxclpxUUgzTkpTNHBMVzdBRlNw?=
 =?utf-8?B?V1NhaXlNTlpFcWNRcGhRNzM1c05hVitIRGIzMUJDbis5YVl5RXVnOVJ4QzZF?=
 =?utf-8?B?MlhNYjc3WWlwRUI2cFliWVJGUm9wcnFDYjlJeWNBMWVpTnE2eVg5eVcweERG?=
 =?utf-8?B?OXJWeTkwamQ5VGJkb0RPdUZkRUhhc1JSNlZ6eTJ5TE96NzZOajVsTFh5TmZO?=
 =?utf-8?B?ZUtPOG5MVm1VUFA2K0c1WXNZaEhucEpuVjA0ZTUzREpOUUc5RGpMc3dRMHFs?=
 =?utf-8?B?bmVRQ0lOenpwQmZDSUlFU0NyTmhxOU9pREU1V1F2amZINVdaaXZJOHArNlNS?=
 =?utf-8?B?VDRYN2ZxVEdLWnhFOGp1aHA3OWVTczJwYm5qWmRoNVFUV3A5UGtFVy9HMTBW?=
 =?utf-8?B?anBwLy9MSUd1TVBYQVIyQjVuc2VadjEvMnFnM0F1ZEdlYllScXNmTUJzSlRR?=
 =?utf-8?B?WWtTV255d3kzWjB0Y0Zaa2RoQXg2NzZLdFBqVUxXUmZmS0xOcDJSVExKN1NP?=
 =?utf-8?B?SlJIeUtuSVBnV09yd1pYSW1pYUUwb3dLeERuOEJsZ1hMOHkrYXlZUEZ3UUFy?=
 =?utf-8?B?VXRNNWRNVmJnOTVtYThuWlh4YWZnUVhBWjNPZ1ZTL0Fpb0JsZHk4dWt2aWU3?=
 =?utf-8?B?WUpMS2xCT1NLeVVTeFFIMVB1TGplS1dyVHMwbzBJbkY5cElFV05nY0tLcmtG?=
 =?utf-8?B?dnRnUk0wdllYMkJ1SS9LY1o3YzVWK0tkU2V5SVpjVExsYk95dFhSc1RJNGR3?=
 =?utf-8?B?QWdaMno0OThyOERVakdpQkhMbXFZVDA1WkxITlQ5S1RpTE03V0szVDFtZ1lR?=
 =?utf-8?B?R3p5SHpVdktlWnB1a3YxK1JwSkNNSW5PcHNTS2U1SFlkclphVDhaVGlmTGg1?=
 =?utf-8?B?R1hIU1FiUnZhOXZLRTk5bmJGa1RYN3N0bEhnQ0lRb3RkL3Z1TjlZUGdHSlln?=
 =?utf-8?B?dS91M3BxVFEwdEE1akVPdHg1ZGg1a3JkOXptbHNFWlJLMlhBa1VUdGJOc3hK?=
 =?utf-8?B?bVFUR1BJZnc2QS9na2Y2MStoMms1TW9TUXlsclJQTUNabjRSeS8yVEduZFBT?=
 =?utf-8?B?b1d4RTl4cXNYV3lDL0Q0VGlBMFhyNHZaK2kvaDZDNXV0cjRXTzQvV0FrUDN3?=
 =?utf-8?B?SGFlR3NFZW52ZWk3TFhOcGhsTDBrdVc0L3lRNVM3NmdnR1puNldVZC9OWHgv?=
 =?utf-8?B?SnlzTnJpOXluaDdiWDhtV1ExaGFrSElBMjBKeUVGeXZvMmpjb084TlY2NXRF?=
 =?utf-8?B?RmJGTW16a0dHc1BLOE9Za2VDZ3NTUU9FQjFWOWJra2EvWmd4RFYxaXFPUlM0?=
 =?utf-8?B?T0JOY1hBYXBPVGU5QlN0NWU4enV5OTYrbWNCcU9qZDM4SmVpdlZnVElpSjQ2?=
 =?utf-8?B?NkFVWTB1bWNmTmtQUkV2SmVxeDUvT2xKYmo5MXZTNGNidnVXcElPWUdLajZK?=
 =?utf-8?B?RHIvQWFLcW9qSDF0cDlxVUZNdVlSNHUzenZscXRvMWk3bTdlSThmVCtQMWpr?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7046f430-402c-4c38-0280-08ddf65d9b22
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:46:45.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2+kYlDOdNMkrTV+YfAlBO8j/Cosl1KAmrjH6c5BQlim+p5icPVQSmzo2J6jbVJQTeMBz/fXFBCBISRToIBVwRd5am0ERJSKp/PGz2rRIgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: nK6kJ6umeO2ZCFBTvalaEMDEX6yIMgHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDAyMiBTYWx0ZWRfX2qQ/CDjhMAxf
 MgycMIvjBTivXUCZdnliuckEFM02fRxu50wm/A/wgqG4drzb02ZZmKq45T11K53PTqfqQnXOv0J
 tRP2kKliE/qNLf2wpNTe3hAp7qUJZKp8I2Mg5MenYKOesBhUm/aFNYVTQFlCFh6rvr7HAfGSHWG
 nvYFzQcSFsCNqaBTtkuuKDeiaQc1+nyVYOXj9+lDbypPy4PSCLiOjYJpCYm43JBw/nXLTqwS469
 YPEQBIJVCD+R0tKNJPEzL0gqFjrgwb8LccWmCQTCalnIVUBecJIdPT7Q+GFmViJusVHlZPSoAua
 MrfIrc41oEmlIwXDFbY7gjDY5p73Z4AhRBCkypDo1PUbWDwn/5FEwk1vF1AXFE=
X-Authority-Analysis: v=2.4 cv=WvsrMcfv c=1 sm=1 tr=0 ts=68cb7298 cx=c_pps
 a=bGC7MwCPNpf+Sn14ocfQJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=QyXUC8HyAAAA:8 a=ZAckWmGYdoeD1V9NdC0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: J-f1KATvVzBVhG5EdRXJRdeVRs974FE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58I0xfFV3073366
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119501


On 2025/9/18 09:58, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2025-09-15 at 06:29 -0700, Yan, Haixiao (CN) via
> lists.openembedded.org wrote:
>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>
>> Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
>> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found
>> (required by
>> ./build_support/src/sniff_mq_prio_max)
>>
>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> ---
>>   ...ndle-runtime-errors-and-return-None-.patch | 47
>> +++++++++++++++++++
>>   .../python/python3-posix-ipc_1.2.0.bb         |=C2=A0 1 +
>>   2 files changed, 48 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-
>> posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-
>> .patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-posix-
>> ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
>> b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-
>> build_support-handle-runtime-errors-and-return-None-.patch
>> new file mode 100644
>> index 000000000000..e84345a39737
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-
>> build_support-handle-runtime-errors-and-return-None-.patch
>> @@ -0,0 +1,47 @@
>> +From b079074048bc33b206b21f73fecb8173cf8adaf0 Mon Sep 17 00:00:00
>> 2001
>> +From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> +Date: Mon, 15 Sep 2025 21:15:45 +0800
>> +Subject: [PATCH] build_support: handle runtime errors and return
>> None for
>> + invalid max_priority
>> +
>> +When cross-compiling, test binaries may fail to execute on the host
>> system if
>> +the target toolchain was built against a newer glibc version than
>> what is
>> +available on the host.
>> +
>> +For example, on Ubuntu 20.04 the following error occurs:
>> +
>> +./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-
>> gnu/libc.so.6: version
>> +`GLIBC_2.34' not found (required by
>> ./build_support/src/sniff_mq_prio_max)
>> +
>> +This change ensures that such runtime errors are gracefully handled,
>> and
>> +max_priority is set to None when the test binary cannot be executed.
>> +
>> +Upstream-Status: Pending
> Can you please submit this upstream and propose this patch for
> walnascar as well? If this is not applicable to other branches, please
> include in commit message why.
>
> Thanks,
>
> Anuj

It's under review,

https://patchwork.yoctoproject.org/project/oe-core/patch/20250917075613.4=
03604-1-haixiao.yan.cn@windriver.com/

//Haixiao

>
>> +
>> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> +---
>> + build_support/discover_system_info.py | 8 ++++++--
>> + 1 file changed, 6 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/build_support/discover_system_info.py
>> b/build_support/discover_system_info.py
>> +index f6e6c8cbe6ba..4fec48b5529d 100644
>> +--- a/build_support/discover_system_info.py
>> ++++ b/build_support/discover_system_info.py
>> +@@ -75,8 +75,12 @@ def compile_and_run(filename, linker_options=3D"")=
:
>> +     if does_build_succeed(filename, linker_options=3D""):
>> +         try:
>> +             s =3D subprocess.Popen(["./build_support/src/%s" %
>> filename[:-2]],
>> +-
>> stdout=3Dsubprocess.PIPE).communicate()[0]
>> +-            return s.strip().decode()
>> ++                                 stdout=3Dsubprocess.PIPE,
>> stderr=3Dsubprocess.PIPE)
>> ++            stdout, stderr =3D s.communicate()
>> ++            if s.returncode !=3D 0:
>> ++                # runtime error
>> ++                return None
>> ++            return stdout.strip().decode()
>> +         except Exception:
>> +             # execution resulted in an error
>> +             return None
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-posix-
>> ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-
>> ipc_1.2.0.bb
>> index 8147e4108b72..cad140381344 100644
>> --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
>> @@ -12,5 +12,6 @@ SRC_URI +=3D " \
>>
>> file://0001-build_support-use-source-filename-instead-of-foo-for.patch
>>   \
>>
>> file://0002-build_support-handle-empty-max_priority-value-as-Non.patch
>>   \
>>
>> file://0003-build_support-use-does_build_succeed-in-compile_and_.patch
>>   \
>> +
>> file://0004-build_support-handle-runtime-errors-and-return-None-.patch
>>   \
>>   "
>>   inherit pypi python_setuptools_build_meta
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119409):
>> https://lists.openembedded.org/g/openembedded-devel/message/119409
>> Mute This Topic: https://lists.openembedded.org/mt/115253607/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

