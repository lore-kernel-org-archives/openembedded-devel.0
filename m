Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1B3E8FDA6
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 09:47:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150145.1766733006687936434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 23:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Pw7TZIig;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: jaihindy@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPNiEgE3851070
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 06:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBPfIgVPavsDQAWKsdL/jCLipZHKM0lf30bGuwJd3jw=; b=Pw7TZIigyFPuIx5r
	twfphRBhCavunGDXz3ZCHkmqfYNb7xxW6FabDeke8Yayq6wO/W2EQxnfeD9zxJy/
	9eV59ixzCaINSUxE3+MEGahstL7Y3kSQp+9G8A/q0qEe+kuYYh3Ozs2HQPVvjGlA
	i/EsKNhgAhBGpzwIJ8u8SwPHc9aIC36rektb4ic2Il1u0lk/+R3H8BH8VM5DdEg0
	ZxULlWgwJ99EkejYjw93u2DbiVocl/ufuwd+VY+aCuv7ArnSysVlF0haj/7+vjNC
	MWbnrx9W8XB3IBF9EfRAaHBb90ptTkQIWcode/ryO9EmOfAD5jgrvrDnDqm9lbXf
	MlfUqA==
Received: from sj0pr08cu001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuu63e-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 06:37:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHVu4wDVlX4bULWlhQEjj4DmWHfRn1FN1V2vk9iprXGWeiavr+gZ6XHwQuGEgmn4Y+a2CauvI82vQYMWPxLpjfHOGob8xi8r+iqP1E6NGNA/7VT5/tBXE/gEGks7WoIl6JHGEKNypIRbFqXSXRV9COEcOQJNNISZbw89e/kepPyqX/GhZ9eYiICacXUEVP8JctG0dKMiq4+5opZRMXoAHzKVa6C9KBmlOjwyUDxutXyEmzOztEA1h4NNDVY6T+EInqMC7yyK2q+ULw/0yB53pzGQfh97GWefJ8FOdqXvzRXHK5knOn+5XE1wr90eFF28Jzs2iPxnxs+HazXPKzfsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBPfIgVPavsDQAWKsdL/jCLipZHKM0lf30bGuwJd3jw=;
 b=YXUqdwiXrSHkGS1/iHhFv8ATv5ODJLH85ozKyaYuD8Ak4KLSb1j40lJXbAE9s1/2aq+hZ3pwGVCzU8BWfkPn7jn9yZUbyYUsWsnMFPSm+vDSVLDrEkmT6bwvmCavvpEP3/mctzV3UFtklNoLcgKquTPLHz1DvijzCZF88+KedszQbpCibzKZ7oGByBMivxjlDjH795gdiVbjnX1sD7WifLdJqgXOANuv419g25I9pyb7QutXfZzqy1/8A3WpZVzM0nJJllvdaHa6RNC9dW35vBPN8UT46meDTyIFX7L5724XCrISNCozmP7xcotOGAtF40HLU5b+ZORQ0uctjh4WHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH2PR02MB6856.namprd02.prod.outlook.com (2603:10b6:610:ac::19)
 by PH0PR02MB8485.namprd02.prod.outlook.com (2603:10b6:510:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 06:37:36 +0000
Received: from CH2PR02MB6856.namprd02.prod.outlook.com
 ([fe80::8b5d:ba0e:c0cc:e07e]) by CH2PR02MB6856.namprd02.prod.outlook.com
 ([fe80::8b5d:ba0e:c0cc:e07e%4]) with mapi id 15.20.9456.008; Fri, 26 Dec 2025
 06:37:36 +0000
From: Jaihind Yadav <jaihindy@qti.qualcomm.com>
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-selinux] [PATCH 1/1] systemd: create backlight directory via tmpfiles for SELinux compliance
Thread-Topic: [oe] [meta-selinux] [PATCH 1/1] systemd: create backlight
 directory via tmpfiles for SELinux compliance
Thread-Index: AQHcczRKhlsPZQsBPUSN34k5b8I9oLUuaGaAgAUEJoA=
Date: Fri, 26 Dec 2025 06:37:36 +0000
Message-ID: 
 <CH2PR02MB6856F4D32FD4A1DB3FBEFC91E2B0A@CH2PR02MB6856.namprd02.prod.outlook.com>
References: <20251222111523.2837748-1-jaihindy@qti.qualcomm.com>
 <CA+s=J=wz4rcwL-+VgvWG_iYS0yYF7A38khe=4dC5pJisN0DWOw@mail.gmail.com>
In-Reply-To: 
 <CA+s=J=wz4rcwL-+VgvWG_iYS0yYF7A38khe=4dC5pJisN0DWOw@mail.gmail.com>
Accept-Language: en-US
X-Mentions: anuj.mittal@oss.qualcomm.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR02MB6856:EE_|PH0PR02MB8485:EE_
x-ms-office365-filtering-correlation-id: 8b4b7194-3e7c-4aa2-4d9d-08de4449422c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WUhoVHVVU01NK3BlbWdySmE3dk01MDh2WG1pUklIWkpiY1BFZnduWE1aZE1V?=
 =?utf-8?B?dlo5Qm56NjR6SkFmUkpUQkRWY3ZneFhKeFIzanlrTnlNWFJFcy8vY1FQcU95?=
 =?utf-8?B?bzVlRjhVZktKUmtHT1BkRHRaVUJsNkkwSzkrdTJCMmxHS1lNMlRrU1Y1MHpO?=
 =?utf-8?B?N3RlL0JMdGdlU25LeU5uZXJhVmF1UHgrVVE3d3NhWXlMMVFjcHplZWNFOGtK?=
 =?utf-8?B?ZWtoUkZIZWpnQTJvUGNBVTE0QldPd200V0FEVmRKcW1mb3N0RExINDlEYlVW?=
 =?utf-8?B?Y2NwU3dPNjFjSWZYd0d0N0twU0ZmUzkvWWJnT3JPcWtlcjRDc1hVa25EaHhw?=
 =?utf-8?B?TlhJMVNhVkxQYUVGUnptdWxkLytXc1pYSTRtODJBV3cyWXFFdnlaaE5PSDZK?=
 =?utf-8?B?blNCZVc5MVNHelNLMzVvMG1ZaitmZHFIaE1jVDRMRENKT2V4WnM5bldLQk5I?=
 =?utf-8?B?K01RbnE4SEw0Z2FibEV1WllPR1dkWm8vV3lTd2ZVQjNhOHp6bkI3N3R0ODA1?=
 =?utf-8?B?OVAxL0hqL0lURVF6WldJNHRONi9WOER2ZDU1R0lpZWRMRktHL2xzd0ZxTGVM?=
 =?utf-8?B?VUxQSW83OEtmZ05jWWdsaTY3N1lBcU13TkdHNk1WMGhCR3ZsL014ck9TK1Ux?=
 =?utf-8?B?anR2Q1I0clU4WEtUNWZyR3Mxc2NlSk0rUEZndmZzMnkvYmpIT29ZRmk3TmM3?=
 =?utf-8?B?ZExVUU5XL2V2RHNMNmV2TmdLbzhDY29KT25kbHpaN0k0aDdLNDRUbUdCVXM3?=
 =?utf-8?B?eFhlZllLcUo0elp4MmQwWXNrMGpaNFViYkNzam1qcjVOdTVEQTJ1LzQ0N3RP?=
 =?utf-8?B?WGhyaEdKRnUzZmVSQUNwOUlRa0xURjVVRllhU3B6N1pCZEJyTitOcGllVXFB?=
 =?utf-8?B?NG5iZWNlVFRhRExwdUkvN2xxbnBDTWhzN0g5MnVxMkp4bGxlelh3UnRyeWxa?=
 =?utf-8?B?VThBOXNaOUZDaVFWZ3piODZhdHRnb09sTDAzcFFPanFIUjVzYTM2RkRZaGRL?=
 =?utf-8?B?aWdHQWdSZ01rUThYcnlhZDJYOERTZEpXdmZ1NXNkUFRmN25Tb0FXSUFlNWxY?=
 =?utf-8?B?SFBlWkNBUkwySk04ZEdGMXhSdnNsQWx3c2FPd0FubmZmN1BXSEVBalV2UDl4?=
 =?utf-8?B?Q1lnRGhDWnd3UDdSeThPNzhINXNGczFoK1dvNW5SbUdvb1NUYjRpMExEZXMv?=
 =?utf-8?B?dGd5cU1wZVVreU1RMEhXSXNHUTltdWxOc0ZVNVV3RXVQc3dKTnJDVlVSZHZR?=
 =?utf-8?B?TVBnZjBuaE9NOXk4SWdQTkhiUmJJUlV6TGdYTWdoRDlSMnprNFNPc2V0MUNN?=
 =?utf-8?B?djEvWm1ndEFSRGZ3dmMxZEZsM2h3eUtERzRSZW40RjcvNklzM2pPVThqYmtL?=
 =?utf-8?B?a2xDVC9FSmVEV2lsVndINFNDZ3pLSFVRMDY4OVJMNGFscTdtbU9wM2hIa0wz?=
 =?utf-8?B?RFNSY0toVXVFSTk1TkxiRjlXZ0s0MVF6dGZPMzJ1QkthWllNUDlCU1lBWWJ3?=
 =?utf-8?B?eWNoY2VoT0VxbVhvd2dDWm1RcHhQNjdzYkptMVMrcE9YREZuRjRZRnFRV050?=
 =?utf-8?B?MzhIUTZqRHlrNGRtbERUWmY4K3VJTVNGS0pmcUdlMkVOWXgyT1Y4YkpiSTlD?=
 =?utf-8?B?by8wOEsyaFhNYWUzVFJjY0tac2p4YmV6NE0wZklBUG91c0NZSWdHZGdYclV2?=
 =?utf-8?B?N1lTZmkybHVXUlVBSHdXMldWZkRwUjdza2JTdTMwRFREV0lFSEhUR1BmUzNl?=
 =?utf-8?B?MlgvWkxYRHJ3bjVFN3B2TXd5SmI2UlM1SFVhZ09OdEdRZFJML2FEa2xCK0pu?=
 =?utf-8?B?K09VMlBhU2F4d21mTU50aFJJTmVuM25IaE5OSHJyVlVtdnBDOTRIWWlGaWp6?=
 =?utf-8?B?V0RzRUtRRDhBMmhLTDV4dlJDeXRJcjFuVitKN2pXeUhDbGM2d0duSGhNZ1Vj?=
 =?utf-8?B?Kzd1ZGcrY05BdlRsdXBxZGp3eFYzVUFzSGZBTU80a2tIYmk4WHZmZmdMdXpq?=
 =?utf-8?B?UlRIaWVxS3pMQVBwR1dLVVlaUWxmazkrQkpDRnRHY3U4SXlkUmdXU2c2NXVz?=
 =?utf-8?Q?0ALcHf?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR02MB6856.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VGxhZlJBSVFYcTJtRkFnVnVnY3hZaVJMZnRKTW5SbVRpQW90Y2VmT0V2cjNJ?=
 =?utf-8?B?S056YWpIajVuVE9sOEVTSnpPTXhPUXFrWVQvZlZqRXd0Nk05QmV0TVBmT0Jv?=
 =?utf-8?B?MGY1aHlBcDFXenZlTkZXeWliSTV5RHRaWkpqZ2hyMkwreXIvekJHbXZZNVJq?=
 =?utf-8?B?WVdEREdpaW8zREE0bjFUd0xzSlE2b1dKVXVNWFFGNzVVQzFKaDBaRFRuNmhS?=
 =?utf-8?B?Z1gyYWFCVGVvbXY5a3lkK1ZHNERFRHJ2YVhTaVR4QXB5dVJnbW1ldGNTaU1k?=
 =?utf-8?B?cE85WHJ5SzNNaVIzakJ5RUI0MUdCRDFsMlA1amNMbEk3ZmQ5VWpneTZHcVcv?=
 =?utf-8?B?QURJdGpJREMwdHBvTUdHbTNDejBxU0dnaklZRXVZUTVEVEp5WEl5eGJZMVRx?=
 =?utf-8?B?Tk40RGZ0VWVjL0w4VkxiUktlMEs5T1E4N1RvWDJvSXRXWGc2THp6V0ZKZXh5?=
 =?utf-8?B?MFdUZFphalZSWWZKbHNGUDUrTGM0QXNhZTdQQ282WjVuVzQveDlGbWFIcjRo?=
 =?utf-8?B?RjA2M2RGN05Ocis1WE50NDZuVitVbnM4dnZHMVZzSVFlNUYrTVBuaGs1L2t0?=
 =?utf-8?B?dGJyRzdCdzZ1bDQ1ajJRU2hZQTVJNXhIcTZNUzl0SjNoSXovK0xrR2ppN01z?=
 =?utf-8?B?QzNOT2MwWGtlRU4vUlE0NDFDdDYxS0lYbjFGd2RBb1pBRlM5Q200QmdZdzJX?=
 =?utf-8?B?SDY4MXBtbDdkc1lSYi9UYTJ3aFVyK2ZMZ256S3FvOXY5WXJPODg5NXp4ckc5?=
 =?utf-8?B?SFhCT2hKc1cwcFBnalkvUlcxK1o4WXBvMFBtVHl0VFZBM1N3MDdWd2ZnVHU3?=
 =?utf-8?B?RG8zTHRHQS9CTWJ1cTBOVkxid2RKelZtMXRMTm90MjBacDVwYlJJa3A2eGpT?=
 =?utf-8?B?TmwwOStnSkNSajBDM2pXNm13TWh4cDczakNkaHBTVTYwWFZveHp3UFRCdUQv?=
 =?utf-8?B?bEczNzJ6MkhhTjRkdlVwSXZSNHgrbktQWm9kQWI5Y0hraFNGMkh6VTE0VzV5?=
 =?utf-8?B?c3E5dkRwMGNSL3B1VUg0VzlFS2VaelllbjZraG9mdjV6ZHpZcnZMdllSTWR0?=
 =?utf-8?B?MC9US3lYUDY3aG9YVEtvY2Zsd09BM004ZEJRWmJLRkVGaHJQeUZxdlRWcWZI?=
 =?utf-8?B?bEV5citzOERhTkc0elBSWWF5VFdlRkJOeDBOL2plV0ZqNTFmd25KN2g3R2hW?=
 =?utf-8?B?OUZQcmtNWVhQUy9KQnA5Nmt0dVgvLzZOL0pKUE4ySmxRVWV1ZU1TdDk4NHNV?=
 =?utf-8?B?ZFZOWDhaUFA0cmNKMk9PVE5TWnZiTmNVS0pVOVhWelBHbEJmWndpc0tsaEpO?=
 =?utf-8?B?U2dsSVFpcSs3QkVhWEtQUFYxM0Z6ZC9YQzkvdnVxVTRWemVHUG04Sy9DdWZq?=
 =?utf-8?B?SUprOThKelJTeXlzNDBXc1NGMkFtWEZ0ODhxWXFGY2lPWVdNWU9sMmRaSGQ1?=
 =?utf-8?B?a1k0QWNrYS90TGhwZVd5Z29rcUpRNy91aVkyeC9QVWNvQ1p0MS9nUXNPNHlp?=
 =?utf-8?B?VTVncnRFeFc3TnFQTCtMOHdNRHNwbUxDTmIwWm9zS2lPajdTR2VDc1l2U3VH?=
 =?utf-8?B?cDEvOW56cVlNNld5SGo2ZVEvbnZkVjlLMTIyTGc2NUI1Z3ZXSXRpdXBPNzlo?=
 =?utf-8?B?SjMzOGQxOVpzNFlQSEdlc2puRk9vOWl4cnFnNk1iZlpQTEpoa0UzNlJvd3h2?=
 =?utf-8?B?MVJ3bWZnK1dwenV3cHY2OWlpQzJvbVJwWE9qd3VBckpoLy9OQVVUK2ZLUWdY?=
 =?utf-8?B?VEJjY3hWZ3l2S1FUOTRvUHllMjlsbEFWQklZK1c0LzNNbkx5bFdpNTFyVG1Q?=
 =?utf-8?B?MFVncmYvMmszQ2ZVdkxxZlZGZEZGRHFNUHRVckNkV0s0bEJPc0xSWmovWjlW?=
 =?utf-8?B?U1VQSnV2MGZNSWR3YVcwSnI3S2dBbjZyN0EyeStKelM1NHNJQXlQTnU3S0tX?=
 =?utf-8?B?OUhabnRqL3N6QXB2TWRKS0U2Y3dNdjQzb0E0RWNvYXp2S00wajR6WWVhdmdU?=
 =?utf-8?B?UHZ2MElPUExnMTlnSEZtS1F0N3VBS0puVFE2bmJPSm9MUVlUSWZQQzZVMDdO?=
 =?utf-8?B?UURhQmY4aXpsR2JBL2JTWW41bFlIUUM5ZStnQXhSNWU2NUUzOHorWStmb1Qr?=
 =?utf-8?B?SXZQeVQ2T3hEaW9FbzlPVzFJbW85Rnp4TGp4ZWtjaStmWWt5TUM5T0lxVi9T?=
 =?utf-8?B?Uk1iMG5sTFJoR3pRbUNmcjFKZmN4MmdoekF4SHcwRUl4QkdXK3JlVVBrWWR1?=
 =?utf-8?B?dnN0dUF3RmVNNkhnaWlKN0xkVlVITWF1TmsrTWR1RThyK2Frbi9ldmRjVW5S?=
 =?utf-8?B?UFFFanN0VVQ0dlZTa0c1ZjBVSkZXVkd1RFBaWUlSaUZnZ2JaVG84QT09?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	H/cuRijj4irg/F++98gqxYMts5lXy3L592SOgKLTm/JpX5Fkhbzl8hR0Dv3WOrU7vaeGtp6ODp5WC3jqt2JEyZHd+NqPCz7xuK/ct84JufIQwH4s6DxNHw7iDP0KnqDTWpQbDgt4sefwhRZSSZ9lXcph80QQdDOK20RiafI3FSuhfAKcJiNo0It9vyakEPv6j86JWbd2gpGlGFKlz21+sCCWf5fXUBIDMMySF4KULoqZx4wthw000Vo2m4s14p3qN458Fp4BZMFq0hoWQmdiZsSWn1tZPbnIZ8RxPIsqF/hYaWOpO3LHWwGVX1mt0YpHJ6KV+hWKOiJNOTXDJse5AG6sootbt6Ug6ur4coF5WpiC2/VszHfHSAnYO2ayqIjBZCN8eFNqE4kNakxjT3pOWzGKyQJQ9ZtBgvNd5PJh6xuUz/6zZaTHs7iLOWLG0n2c7CJoWgz8O3/Z6u6hu+B4Mo3aAEPLBOvcNi+uC+Oq8FT0MpxLycNTbGh/BbY06+KjOi1h3yXHksW0hmjg3CmyKzZehXMQ9T+Vf6hpRuYovXthzidwjQ+t3nHVU2qsjoeLOJ3It9uW72/e+2nce9vR4MR4iP8sAkjc7dxIH1O/PP3PiTrbmSepNitDdPShJ1/5
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6856.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4b7194-3e7c-4aa2-4d9d-08de4449422c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2025 06:37:36.6388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9okHatYM+LIOizelNtv/jWFHHnr8cc7UrAsjxUxpDFZuLtU3+VPt4mFISi1jAtW5YEykBcnGa8zQlsWKFKVRb/oS8GXcpF0Ymfupr4Siu6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8485
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA1OSBTYWx0ZWRfX5ZJFTJe3FT1g
 TJp60/6BY/CIIDF2TyhxQuc846pH6KafxVFjfyeSdAM05xsMfCIFstxEw4tkjXsu3BwFqtjXPxA
 VL5feLugLHimh7EcFxGkC8PUlr/kYySM3sOYMjyWhOurJYaEF+uV6QhfNjHdqKytk4m31pOnx5J
 ke+ZzFu0ZjaUDxqnlcRHjQzCBW7dsoW5oxQOwq6T6SYtLdNvgY77CTNmT/dND69FxgsH23nT3QQ
 7LqPb8QpCWIR+gmXtDNHKoQNqRqDVsaca02ic2yzx3BHZPmKnM2stWiQiE5B9cA8yglT/HrgF4I
 EbdLRrZtp79IYqWlvqOnA0EU4Mft12fOxczwLXoTTWq/yyJsYsUZ/nkg0X+w72E45snQ5I4InYW
 ueTPxsyyg0zoztGxVkq4OP+vwv2JNL0csDHwflHuIPqedlGyNYykJlBCR/nTQTDD9NcsEu5K5Ao
 +CeCqDcTDB/qvyyA9IQ==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694e2d36 cx=c_pps
 a=1Ha7URm6ceckcZ/uwdfrUQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=nCSlnpCClMRvZojnHZsA:9 a=QEXdDO2ut3YA:10 a=tOIqXpxfQm4A:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 95FUyMshwuC7pLPEKNeZnOMTOTmLvvts
X-Proofpoint-GUID: 95FUyMshwuC7pLPEKNeZnOMTOTmLvvts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260059
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 09:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122936

SGkgQEFudWogTWl0dGFsLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4gTGV0IG1lIGNs
YXJpZnkgdGhlIHJlYXNvbmluZyBiZWhpbmQgdGhpcyBjaGFuZ2U6DQpPU1RyZWUgdHJlYXRzIC91
c3IgYXMgaW1tdXRhYmxlIGFuZCBleHBlY3RzIC92YXIgdG8gYmUgaW5pdGlhbGl6ZWQgYXQgcnVu
dGltZS4gQXMgeW91IG1lbnRpb25lZCwgT1NUcmVlIGRvZXNu4oCZdCB3YW50IHByZS1jcmVhdGVk
IGNvbnRlbnQgaW4gL3Zhci4gQ3JlYXRpbmcgL3Zhci9saWIvc3lzdGVtZC9iYWNrbGlnaHQgZHVy
aW5nIGltYWdlIGJ1aWxkIGlzIHdoYXQgY2F1c2VzIHRoZSBpc3N1ZS4NCldoaWxlIFN0YXRlRGly
ZWN0b3J5PSBjYW4gY3JlYXRlIHRoZSBkaXJlY3RvcnksIGl0IGRvZXNu4oCZdCBndWFyYW50ZWUg
U0VMaW51eCByZWxhYmVsIGJlZm9yZSB0aGUgc2VydmljZSBydW5zLiBVc2luZyB0bXBmaWxlcyB3
aXRoIGQgKyB6IGVuc3VyZXMgY29ycmVjdCBjcmVhdGlvbiBhbmQgbGFiZWxpbmcgZWFybHkgaW4g
Ym9vdCwgYXZvaWRpbmcgcmFjZSBjb25kaXRpb25zLg0Kc3lzdGVtZC1iYWNrbGlnaHQuc2Vydmlj
ZSBydW5zIHZlcnkgZWFybHkgYW5kIHdyaXRlcyB0byB0aGlzIGRpcmVjdG9yeS4gSWYgU0VMaW51
eCBkZW5pZXMgYWNjZXNzIGR1ZSB0byBpbmNvcnJlY3QgbGFiZWxpbmcsIGJyaWdodG5lc3MgcmVz
dG9yYXRpb24gZmFpbHMuIFRoaXMgY2hhbmdlIG1ha2VzIHRoZSBwcm9jZXNzIG1vcmUgcm9idXN0
Lg0KDQoNClRoYW5rcywNCkphaWhpbmQgWWFkYXYNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBvc3MucXVhbGNvbW0uY29tPiANClNl
bnQ6IFR1ZXNkYXksIERlY2VtYmVyIDIzLCAyMDI1IDY6MzAgQU0NClRvOiBKYWloaW5kIFlhZGF2
IDxqYWloaW5keUBxdGkucXVhbGNvbW0uY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1zZWxpbnV4XSBbUEFU
Q0ggMS8xXSBzeXN0ZW1kOiBjcmVhdGUgYmFja2xpZ2h0IGRpcmVjdG9yeSB2aWEgdG1wZmlsZXMg
Zm9yIFNFTGludXggY29tcGxpYW5jZQ0KDQpPbiBNb24sIERlYyAyMiwgMjAyNSBhdCA5OjA14oCv
UE0gSmFpaGluZCBZYWRhdiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8amFpaGluZHk9cXRp
LnF1YWxjb21tLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4NCj4gSWRlYWxs
eSwgL3Zhci9saWIvc3lzdGVtZC9iYWNrbGlnaHQgc2hvdWxkIGJlIGNyZWF0ZWQgYW5kIGxhYmVs
ZWQgYXQgDQo+IHJ1bnRpbWUsIG5vdCBhdCBidWlsZCB0aW1lLiBUaGUgcHJldmlvdXMgYXBwcm9h
Y2ggaW5zdGFsbGVkIHRoaXMgDQo+IGRpcmVjdG9yeSBkdXJpbmcgaW1hZ2UgYnVpbGQsIHdoaWNo
IGNhbiBjYXVzZSBpc3N1ZXMgd2l0aCBmZWF0dXJlcyANCj4gbGlrZSBPU1RyZWUgd2hlbiBTRUxp
bnV4IGlzIGVuYWJsZWQuDQoNCkl0IHNlZW1zIHlvdSBhcmUgdGFsa2luZyBhYm91dCBPU1RyZWUg
YW5kIHJlbGFiZWxpbmcgaW50ZXJjaGFuZ2VhYmx5Lg0KSXMgdGhlIGlzc3VlIHRoYXQgT1NUcmVl
IGRvZXNuJ3Qgd2FudCB0aGluZ3MgdG8gYmUgcHJlc2VudCBpbiAvdmFyPw0KSG93IGlzIHJlbGFi
ZWxpbmcgYSBwcm9ibGVtIGlmIGl0J3MgYWxyZWFkeSBwcmVzZW50IGF0IGJ1aWxkIHRpbWU/DQoN
Cj4NCj4gVGhpcyBjaGFuZ2Ugc2hpcHMgYSB0bXBmaWxlcyBjb25maWd1cmF0aW9uIHRvIGVuc3Vy
ZSB0aGUgZGlyZWN0b3J5IGlzIA0KPiBjcmVhdGVkIGFuZCBsYWJlbGVkIGNvcnJlY3RseSBkdXJp
bmcgZmlyc3QgYm9vdCwgYWxsb3dpbmcgU0VMaW51eCANCj4gcmVsYWJlbGluZyB0byB3b3JrIGFz
IGludGVuZGVkLg0KDQpJdCBsb29rcyBsaWtlIHRoaXMgaXMgd2hhdCB0aGUgb3JpZ2luYWwgY29k
ZSBkaWQgYXMgd2VsbCBieSBsZXR0aW5nIFN0YXRlRGlyZWN0b3J5PSBpbiB0aGUgdW5pdCBjcmVh
dGUgYmFja2xpZ2h0IGRpcmVjdG9yeSBiZWZvcmUgaXQgc3dpdGNoZWQgdG8gY3JlYXRpbmcgdGhp
cyBhdCBidWlsZCB0aW1lIGluIGxpbmsgbWVudGlvbmVkIGJlbG93Lg0KDQpXaHkgaXMgdGhpcyBh
IHByb2JsZW0gc3BlY2lmaWNhbGx5IG9ubHkgZm9yIGJhY2tsaWdodD8NCg0KPg0KPiBSZWZlcmVu
Y2U6DQo+IFByZXZpb3VzIGRpc2N1c3Npb24gYW5kIGluaXRpYWwgZml4Og0KPiBodHRwczovL2Rv
Y3MueW9jdG9wcm9qZWN0Lm9yZy9waXBlcm1haWwveW9jdG8vMjAxOC1BcHJpbC8wNDA4NTQuaHRt
bA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWloaW5kIFlhZGF2IDxqYWloaW5keUBxdGkucXVhbGNv
bW0uY29tPg0KPiAtLS0NCj4gIHJlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfc2VsaW51eC5p
bmMgfCAxMiArKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kX3NlbGludXguaW5jIA0KPiBiL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfc2Vs
aW51eC5pbmMNCj4gaW5kZXggN2Q0NjZlZS4uZjM2NTE5YyAxMDA2NDQNCj4gLS0tIGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZF9zZWxpbnV4LmluYw0KPiArKysgYi9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kX3NlbGludXguaW5jDQo+IEBAIC0xLDcgKzEsMTMgQEANCj4gIGluaGVy
aXQgZW5hYmxlLXNlbGludXggZW5hYmxlLWF1ZGl0DQo+DQo+ICsjIFNoaXAgdG1wZmlsZXMgY29u
ZmlnIGZvciBiYWNrbGlnaHQNCj4gK1NZU1RFTURfVE1QRklMRVMgKz0gInN5c3RlbWQtYmFja2xp
Z2h0LmNvbmYiDQoNCldoYXQgaXMgU1lTVEVNRF9UTVBGSUxFUz8NCg0KPiAgZG9faW5zdGFsbDph
cHBlbmQoKSB7DQo+IC0gICAgICAgaWYgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05G
SUcnLCAnYmFja2xpZ2h0JywgJ3RydWUnLCAnZmFsc2UnLCBkKX07IHRoZW4NCj4gLSAgICAgICAg
ICAgICAgIGluc3RhbGwgLWQgJHtEfSR7bG9jYWxzdGF0ZWRpcn0vbGliL3N5c3RlbWQvYmFja2xp
Z2h0DQo+IC0gICAgICAgZmkNCj4gKyAgICBpZiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FH
RUNPTkZJRycsICdiYWNrbGlnaHQnLCAndHJ1ZScsICdmYWxzZScsIGQpfTsgdGhlbg0KPiArICAg
ICAgICAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0vdG1wZmlsZXMuZA0KPiAr
ICAgICAgIGNhdCA+ICR7RH0ke3N5c2NvbmZkaXJ9L3RtcGZpbGVzLmQvc3lzdGVtZC1iYWNrbGln
aHQuY29uZiA8PCdFT0YnDQo+ICtkIC92YXIvbGliL3N5c3RlbWQvYmFja2xpZ2h0IDA3NTUgcm9v
dCByb290IC0geiANCj4gKy92YXIvbGliL3N5c3RlbWQvYmFja2xpZ2h0IC0gLSAtIC0gRU9GDQo+
ICsgICAgZmkNCj4gIH0NCj4gLS0NCj4gMi40My4wDQo+DQo+DQo+IA0KPg0K

