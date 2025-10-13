Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35917CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:12:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.web10.46384.1760368320059807579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 08:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rirZbvMb;
 spf=pass (domain: siemens.com, ip: 52.101.65.64, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD6QTUClGMsg1o51TpB1NjYbiWRxykQyytSF9mQnOpcL7IM0GGp0wpowUfJMNNizZGJ23nvb7GeGMgxRKWLZ10kLhHCUoiw70anNyNccxWXMQz3x100XlBQPfIw/lB2gHhfhEwDr9CueKpccLjuTLaKv0mdMnrM4dDNWBFJ9pfNyc5vDDwrQGsYhadY88WvSXlqA2QD7hk1BjOr0zq7k8UACLcqFjzdTtLNVW8sfhheyoKvx4KvIn+UGz+aUBoEAG0tD/x7KqdVtKDVg2aOUDh6X3s4u24iOw5SosG8zYa5uMLzt62Dg7kH5jyJqaG0HbeWXvuIv9vpULqzYNMD4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWjWJz3NKKT5EuNE5+scDg5MopXRRS79jKQmlRV7Ujk=;
 b=dZwtCP7zP8uUcXZmgCLmMwQ5NMfeiH3cW0DKHbkPtCmDVW9lyvOfBRi+DJKMYimaQrSiShFL7mlZ0rIXlpgI1m7U4Z6xy0rhkdffBSMjjAfYmLasCbME2gX2YVDwG64xFDFGEqWR4okmZhN6f+zW9te1fALAkEf4EW0pZ5wKSkD9NoM0Ngkfs7wRna+jjR7DqzgaNNo4udQHsOeW46KSYAXhbRsB0q5i9Z6dxOpSQDd+Cf8h8OSlsesekmov3wp89BH0Qo3DHulZ11Twla/dEcOAThcrIHkkanaIY2vIth8k2vddGl3nwrtJ9Fqg6MhFrhmXBiEKJjOZHzRfpWUTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWjWJz3NKKT5EuNE5+scDg5MopXRRS79jKQmlRV7Ujk=;
 b=rirZbvMbQHGkmaebRV/mRDlk00IKuqouIkdtbi1I4vHAdBjLR/zGpmmaPjbwHiPUZGaZ0uAsMkx1bDYxeeqjpEghINgPkmohYjKM1zzv9NRITZ8NH+dNCfg+rQ3OvJPLl0KpXgLM1mzJ3lp+ANszfGxwTQBDvpGEM3IUTJY6CaAkO5ewILUY9XLzqBrRILdx7SWMffQyeidhKRUsqaqkwPS011nq+SNsJXQZIqwphYOxFws3HepGPswQp1wxmC8JG6AKsXeX43+QefWrBx1YtbnXZ9+v2hP9JcVITDo07ahNfyKV1cmPT+XYo5TdptJ78VzrwaETaGh+kDwNZKFZbQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:11:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:11:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>, Ross Burton
	<Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] CVE reports for meta-oe
Thread-Topic: [oe] CVE reports for meta-oe
Thread-Index: AQHcPEZHgnTWNSwKjEK36Bgf0oTqPrTAFVOAgAAB0wCAABaiEA==
Date: Mon, 13 Oct 2025 15:11:55 +0000
Message-ID: 
 <AS1PR10MB569721B4EE5BFB1631793047FDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
 <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com>
 <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
In-Reply-To: <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7c9f6a5e-2084-4012-aea6-3e33f73f68cf;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-13T15:08:01Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6188:EE_
x-ms-office365-filtering-correlation-id: 314ce758-6c3a-4fb8-dddc-08de0a6ad911
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?V2IzMjhRTlpVelp6VEQwa3lmTm14clcwQmt5S0VjQU02MzM4Q3Z5Ukdnc3dQ?=
 =?utf-8?B?dlVZeWZvckxNeVJoNHcvd0NuYWsvQ0FnVmtrT0djeU5HeFJzQnlORTNlU0gz?=
 =?utf-8?B?KzlQcTNPclRJNUdLdTlCR3EybFhrUkRGS0M2UVNUd0FMQytXNW9hUkEwamFY?=
 =?utf-8?B?VUpUMk9ZRi9TK1JNeU5jZVhla0lya3FCSkc5bGNrT3kvOXV2UFNKb2RxRGRS?=
 =?utf-8?B?bjRDa0lxemp6V0dSS0Y5VTE2ZFd3QTNjQWdML3RWQUkvVS80K3JodjFlRDV3?=
 =?utf-8?B?M3JMclU5bVQ1SUw1YnpMNjlmYThPVWdJWG5SK3l5VHBNTnp0WmZaNFhaY0hT?=
 =?utf-8?B?NXVwT20xaVlTRERRRUxBOFhCNUdWV2g1cEpYeHRyNWpwamQvc08vbjNBSUtU?=
 =?utf-8?B?SVN1MkV1NjZPZEoxUnYyQTZNT1BhRXhNbVZGS2tqZ1dERDl1dld6WkRsSlRp?=
 =?utf-8?B?SnA5alhGZzBFV1BVRHZuM3FZL01OaHErYmc5b2JhbGZEbmVKVHI3RU9KWnBt?=
 =?utf-8?B?c0VRbnZyWThxcDNFaG1xcmNjMWsyUXNPRGovaHNjaXlURmYvL2Q5Ty9VMVZn?=
 =?utf-8?B?cFJNTlFmTlF0RVJ1U3k5YkRuWk41OFN1MjQ3QWprb1VjWFZnVTdsNkFOV1BN?=
 =?utf-8?B?ZHhzT1lpcVdUbDFXekwzVks3K1AyNUpCU3dLSlFTQkdSUzVJUVk4UGR3NG9P?=
 =?utf-8?B?VlRZQlA0RU55WXJMYzhqZi9pc1YzcGYyR2t4cC95ekhDSEs3V3B5NHkxRFM1?=
 =?utf-8?B?eUluVnJZUFMvS1N0N1JSTGNEQ1paUkxLR2FGV2FjTHBiOU1TSldrbXFTdWxZ?=
 =?utf-8?B?N0NpTmlieVhqSmVHTXZsTC9OM080TDNLeHhCV1Fnc1pvT1kxdmxEZkR1T2tn?=
 =?utf-8?B?QkFONS9oQ2dlRFpQaVl3VkI4VXoxSWZNMjZtdDlDUVFvWHVjQjh6YndYSFo3?=
 =?utf-8?B?K0ZtR0xLWWF3RHh5NjFKaW1nU0J6dW5qQXFWKzR3K01xZWE0RjVQcDR3cVlx?=
 =?utf-8?B?MXl0K2hpZW1iem0vemRCa3QwUUhtR2hKcFNQZ1JTcWViWktyUHh2czVIamtv?=
 =?utf-8?B?c1VFdlNIRjhNb2FiUDRXc1Jobm9lRFh0b3RENkU1ZUFpYXFLbHdEM3RmTWJU?=
 =?utf-8?B?UmtVSE1vdWd5NmFhRzlRRUZ5em1MY2Rua2ZldjlINTdVcThmdUdIR3lieFl3?=
 =?utf-8?B?OFhHOWFUUFJuWkFBSW01c09POFJCTlRnclo0WVJGT1NVaVFzU1BWaG91TG9V?=
 =?utf-8?B?MWVDdUR2TFd3Z0s4ZmljdWtjdTZBMXhpUi9aQTl3Si9IenRvNGw4bzhNNVVa?=
 =?utf-8?B?bERMd0hYbmM2ZDVhNFNnTmJyZi9rMGRJMzczYzVhOTRoWXR3UldRdmdrSURD?=
 =?utf-8?B?YnE4Y1k2QkpmVFkrc3VTTjh4ek5heHpjMWxUMmxuQTFYR2FRY00weHQ3SUdJ?=
 =?utf-8?B?eFRJdU5wNm1JY2s2RFBXSldDNEJBYm9KNmlFQlZJYVJ0ZytBRUMzY21Qa0Iz?=
 =?utf-8?B?cnVhU2REbCsxcXlHUGRHTFhKWEdBeVJHeER5UFMrN1g1bzA0UENvVUZlUlB3?=
 =?utf-8?B?NTN3bUw1TUtWazI3VVgxMkpGeGFZLytqZGUwdU4vNDdrNTRQTk1FeHFrb0tV?=
 =?utf-8?B?MkFLWElKT25ZS0RsOU9hRzdsdU5HS0pVWS9SdnJFbEpBMEpJdkZYdjM3QjdQ?=
 =?utf-8?B?cmkvcXNtWlNqOXJNY2kxaVN3OFFOTGxWSVVjek9iaTF0TXo2cDJNOFdJMDBJ?=
 =?utf-8?B?MFptRVRWMVRkRm9ZTkdYL1owWWtndzh4TlFER3hQbTBvRVBsZ3l1VDhMUzlQ?=
 =?utf-8?B?YkhxQ0ZPRFM4WlZDRGpDbEs2dllvaWNUalVKZC9iMHVVRmVQbjhYT2ZIVGU2?=
 =?utf-8?B?RmxjaTlkWnU0QnhKSkdJUlF4QkNKY3lTUDFWRW1LVEVTb2VnMkJJaWRoRVQ1?=
 =?utf-8?B?Mk5LamZxUWE3MThXWEVwTmprZ0NGbXdvMUt3TDZ5QUJOU2duY1VNWHA2Z1hM?=
 =?utf-8?B?OHpoMGZlY0FnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bFZ5UTk3bHV2VkhDTVVPcXdZdG14cWNJN21rRXlxM3pyQWhSaytVbisydnBx?=
 =?utf-8?B?WldJdUd3Yk9zU1I1Z1JHSGhMNE9VcE5TMVBJRGk1YzJ4SXV6MzMrdWdVLzhj?=
 =?utf-8?B?Tk8zOXd4OWtQWTFyMSt3eWlEZDl2bW1QRDZITFFtOG1FVkxib0ZRQTFXK3Nm?=
 =?utf-8?B?MVg1Y1htTmJxNmFXeW9HWnhiU2JBYWhJUTRrM1ZhbDJHMjJsSnlpajlLN24y?=
 =?utf-8?B?Vms0TW4wSDVMMkRYUkVINjlQOW5lOXI3WFZOc3ZVTjhLbXlTVnNwSTVXZTZy?=
 =?utf-8?B?OXJ1M05Rd3lQYktpckxPM3U2dzZRV3VkWjZRcHNTWnRja240MEUrblFnb2hB?=
 =?utf-8?B?MVd4UTBFNjdtcENsam5DTTlWbHNBMFdOcUIvbU1Ga3JJejhoWEtLWHhKQUkw?=
 =?utf-8?B?bk10QXNSVzlhRFZDWGwzelNRbzY2NkVJcFdhNTNEd2J5dHIwMmNEOHhEVUJu?=
 =?utf-8?B?Q1pNeGtxQUU0cG1aR2RSbmVPTGtYYVVVS2wvejF3NXZucko5ZDlTZG1mNm43?=
 =?utf-8?B?RVJkcE55SUVvZXRLSFF5dWdXY3hhUE4yN0VCaWU2cDFxNFlmVXArd3E2TXg3?=
 =?utf-8?B?ZkQxMzZ3aHFnTm4vK2JBemtSQzZDYWV3K3JUenlkRUJ3Y1VtZDN5dXQzdXFX?=
 =?utf-8?B?ek1UQjg3ZWdmZXBRVFluZzhkbEVFRnFVcmt2NUJjWWJVZEpPQWNvM2lKTDBJ?=
 =?utf-8?B?R3BUY0NWRnFwRE1iR25OTnpjVzBPcGpjQjJZOHkvSnZFb0MxYW1GK2tQakJZ?=
 =?utf-8?B?L044aFh1QUxqb1BzYXBrRHFDNCtieGg1Rm5qTjlxQUkxaS9OYm9uMy8vSndV?=
 =?utf-8?B?aHZmRUlrampXaWlqWUNIcGVkZ3owUVdDcU43RHowZGVucWRpZi91Q0YwRm01?=
 =?utf-8?B?V0UrcHh0ZzlyRytoOEJVWnJwTEh4S29STDBka3VOMStEcWNnTkZMZjJNZUdr?=
 =?utf-8?B?MnZWUW5TdmJRdGhFRFVpbFUvbmVjVnV2SjF5aUxPaXZrV3c3bWZyQTJqTUlL?=
 =?utf-8?B?cHFPakozTGZDVjhhaWQzYUpVZHpNeDNJZUY4ckhlRjh4V3NxbFZPMVZvRkFy?=
 =?utf-8?B?WGhaaEFoMk9pdCtPTDR4ays4cXJVOURVd216eEJaajNLKzNHb0p3YzY5YXRS?=
 =?utf-8?B?NFpxK0VxbDRMdGdMeHdNb3lWaWZYMHd6QmdLQm5KNVB2QlUwMVF3Sk9sTDlu?=
 =?utf-8?B?d29jN0dlbW5lNmgxU01WamZ0SmNBM2lSUTdzWHNNODBGVVZ6eEJhdDYreHFs?=
 =?utf-8?B?RUZGY2FhaUM1NmEvL0hZcTRFZXh3bnRCNklGWTQvbDlUbEQ5ZU8zbmNCdmZP?=
 =?utf-8?B?Z2xFcTE4ZFkxYnhoSWtWR0syTWpIdzk1SENJMEwrUzFiUUxNOENORjJBcjRn?=
 =?utf-8?B?UkY4RTdPbVhHOHNuaStOQlhFeTF2amtBQmkwNmIzb05kZGpCUTgvVmo0ZDZH?=
 =?utf-8?B?TU4rUjA0SHduQVBKYUIzRlowK0FnZHY0b1FtOVJBUHpTNTlRNmhQOEprY0sv?=
 =?utf-8?B?SGxzQXdBTzh2alRURGx0Q3JvZyt3Z25BaGxMUWJBcWNIRTN3NTJJcmlVVnh5?=
 =?utf-8?B?dnJreVpJUEdWOUJvUGdNd0g4MERzaSs4bG9NQlF3NzlFRmpDZElDNkp0eE1q?=
 =?utf-8?B?RlZUVG1UTHdJazJlWG03R2c2S0VVUmFGUHNXZEN6Zi93SUtXcXYzUXJsQUFY?=
 =?utf-8?B?SDAxajgweDlpS1NEVW4vVi9EcjhCblFHRVlmSEVaQUZtbGRMN1V3MFE0Z3V1?=
 =?utf-8?B?KytzRWlUSGFVdWlCM2hNMUdNUDlsSzMwU3ROOW9qWnc0aE4wdU1ON0RnaEJs?=
 =?utf-8?B?YzN5ZW1aTWc4Y0JVd3p0MTAwbnVPK1d4dFUzMjNRQytWcitLcElna0hyS2Mv?=
 =?utf-8?B?ZUxOT1lOa0kzMHBXK2Z1MDhpZGhsdkFvd0lITWVTMnMvbG5UQkR6UnVaaGIx?=
 =?utf-8?B?MnRwTFE4Q2xQZkVraGFmVHlha1kweVJQWkNpN2RsbEdiMFo1MHdyMWd4Qkth?=
 =?utf-8?B?QU1WQWF0aldza1RsUU5BV3dZRzF0eHlueWhVYXVnSDlYT0dqTnZ6c1dySlp3?=
 =?utf-8?B?WUwvWFlMYTl1TTdMSUZaK2VXR0pvZDgvMlQ1eGVPblJGc2p1K2RmdzU0ajNN?=
 =?utf-8?Q?NwoXc779PfotGEyUfwglvVyqu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 314ce758-6c3a-4fb8-dddc-08de0a6ad911
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 15:11:55.7541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vFKs50rmK5Cf+Bx3Tb6IIgNIOWWLgSj6kNUc96FzBOtSl58Y8ZLcUpfAOvAQrV3ZidTWL32/bRiCRxO93WpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 15:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120540

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEd5b3JneSBTYXJ2YXJpIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMywgMjAyNSAxNTo0
Nw0KPiBUbzogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+DQo+IENjOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBD
VkUgcmVwb3J0cyBmb3IgbWV0YS1vZQ0KPiANCj4gT24gMTAvMTMvMjUgMTU6NDAsIFJvc3MgQnVy
dG9uIHdyb3RlOg0KPiA+IEhpIEd5b3JneSwNCj4gPg0KPiA+IE9uIDEzIE9jdCAyMDI1LCBhdCAx
NDozNSwgR3lvcmd5IFNhcnZhcmkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHNrYW5k
aWdyYXVuPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPj4gRm9y
IG5vdyB0aGlzIGlzIGtpbmRhIGV4cGVyaW1lbnRhbCB0byBzZWUgaWYgaXQgaXMgdXNlZnVsIC0g
SSBmaW5kIGl0DQo+ID4+IHVzZWZ1bCBmb3Igb2UtY29yZSwgYW5kIGhvcGUgaXQgd2lsbCBtYWtl
IHNlbnNlIGZvciBtZXRhLW9lIGxheWVycyB0b28uDQo+ID4+IEkgcGxhbiB0byBzZW5kIHRoZW0g
d2Vla2x5IHVudGlsIGF0IGxlYXN0IHRoZSBlbmQgb2YgTm92ZW1iZXIgZm9yIGFsbA0KPiA+PiBu
b24tRU9MIGJyYW5jaGVzLCBhbmQgaWYgaXQgcHJvdmVzIHRvIGJlIG5vdCBzcGFtLCB0aGVuIHdp
bGwgZmluZCBhIHdheQ0KPiA+PiB0byBtYWtlIGl0IGhhcHBlbiBpbmRlZmluaXRlbHkgaW4gYW4g
YXV0b21hdGVkIHdheS4NCj4gPiBBcmUgdGhlc2UgZ2VuZXJhdGVkIHdpdGggdGhlIGN2ZS1jaGVj
ayB0b29saW5nPyAgSXTigJlzIGludGVyZXN0aW5nIGhvdyB0aGV5DQo+IGRpZmZlcmVudCBzbGln
aHRseSBmcm9tIHRoZSBhdXRvYnVpbGRlci1nZW5lcmF0ZWQgbWV0cmljczoNCj4gPg0KPiA+IGh0
dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlL3BhdGNobWV0cmljcy1tZXRh
LW9lLw0KPiA+DQo+ID4gKHlvdSBjYW4gY2xpY2sgb24g4oCcbWFzdGVy4oCdIGF0IHRoZSB0b3Ag
dG8gc2VlIHRoZSBicmVha2Rvd24pDQo+ID4NCj4gPiBSb3NzDQo+IFllcywgaXQgY29tZXMgZnJv
bSB0aGUgc3RhbmRhcmQgY3ZlLWNoZWNrZXIsIHdpdGggb2UtY29yZSByZWNpcGVzDQo+IGZpbHRl
cmVkIG91dCBmcm9tIHRoZSBmaW5hbCByZXN1bHQgLSBhbHNvLCBkaWRuJ3Qga25vdyB0aGF0IHN1
Y2ggYQ0KPiByZXBvcnQgZXhpc3RzIGZvciBtZXRhLW9lLg0KPiBJbmRlZWQsIGl0IGlzIGludGVy
ZXN0aW5nLi4uIGUuZy4gSSB3b25kZXIgd2h5IGF1ZGlvZmlsZSBDVkVzIGFyZSBub3QNCj4gc2hv
d2luZyB1cCB0aGVyZS4NCg0KQXV0b2J1aWxkZXIgbWV0cmljcyBhcmUgbm90IHdvcmtpbmcgZm9y
IG92ZXIgNCBtb250aHMuDQpDVkUtREIgaGFzIHN0YWxlIGRhdGEgYWxtb3N0IGltbWVkaWF0ZWx5
IGFmdGVyIERCIGlzIGRlbGV0ZWQgYW5kIHJlY3JlYXRlZC4NClNvbWUgdWdseSBuZnMgQUIgc3R1
ZmYsIGFzIGl0IHdvcmtzIG5pY2VseSBpbiBsb2NhbCBidWlsZHMuDQpJIGVuYWJsZWQgc29tZSBs
b2dnaW5nIGluIG9lLWNvcmUgZmV0Y2hlcnMsIGJ1dCBwYXRjaCB0byBleHBvc2UgdGhvc2UgbG9n
cyBpbiBhdXRvYnVpbGRlciB3YXMgcmVqZWN0ZWQuDQpOZXh0IHN0ZXAgaXMgSSBhIHJld3JpdGUg
b2YgaG93IHRpbWVzdGFtcHMgaW4gdGhlIGZldGNoZXIgd29yaywgYnV0IHdpdGhvdXQgbG9ncyBp
dCdzIGp1c3QgZ3Vlc3NpbmcuLi4NCg0KUGV0ZXINCg==

