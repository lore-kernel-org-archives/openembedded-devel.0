Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B4C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:33:03 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web11.1297.1713976381229330997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 09:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EhGHKR3X;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EhGHKR3X;
 spf=pass (domain: arm.com, ip: 40.107.14.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aEhVy6SYQ8SGwBAy8rmex5/0LKll0IAeTjGWLglOIVJZXwT47BTekAIvqQ/1Okp/dlcIoK3syd+dQfeg70I3thHiNcu37enDg8+8vjjJ1b2j4h7+XdKkFSXx7xu0BKB5OzczzW4ZEVSUm+NNj4a2O3b8TzD/wbBghiG07Tj4WGHzaRyxfEjCQ2bvHYNdlPaYBzc1c9iekOFEu03g03JdPucmdhyFQlorXQ9kojmMwALYxRkJBaUgvn9rqOuIbG2eb/AeNcg3x/r8PEWICZQOOYF5CkfwBRHFOImPaYsvFnujY1UHtacihmGbu3vX1vVWL++jOl6bcQKBS/3N0scfXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyqMmp37/PLkvicKekxo1puaUpfI9J+JTcWQKeBUveY=;
 b=V0kg9z5+7PjdJ/ikOFl93lr/kzNPI9QxVeSLnsi6SGCSbTjKpgDxcBADDuD4Ll6EQyrWy6A2QH1NUKKqH8DHI9NmY/e1R+oG1PK7liefTcTgsplrm2QHJqFGrzpZ58AD+qNk1mRqW30s7I7D4X5HQYcz3dOcK7acjt1uXDJ/a5+n/C9EJXPNSdNkoggJhsJlrriDiNRuDAzO6jeAU8BF2+5a+zlatphElMETi15DhNn9IBxiEfhatr+OAYPGFgZTyZ6qC/PrtJu4EhYeTT6SP7UekVc2z9wBbWgi77ywvhAoJUVfsj1yJlE7f2qOxkGWiVe+n4Im4hxrudMxB0HoTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyqMmp37/PLkvicKekxo1puaUpfI9J+JTcWQKeBUveY=;
 b=EhGHKR3XYWJjycW09YzHQQLlzpJDU+Qm1kZd2MR69bRQZe80l5r15C9NIzxgT8iceYKa6SrBcaWiYJq/Bu9dxIxeXvvNPPxvnYvn4G7tS4lsS0QeaAyfVuPgFco/OUIyB+kCAq2wcVm4IftOwWn6jM0q77Rd5qXom5CahKKzgx0=
Received: from DU2PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:10:232::7)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 16:32:56 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com (2603:10a6:10:232::4)
 by DU2PR04CA0062.outlook.office365.com (2603:10a6:10:232::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7495.33 via Frontend Transport; Wed, 24 Apr 2024 16:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Wed, 24 Apr 2024 16:32:56 +0000
Received: ("Tessian outbound daa456608199:v315"); Wed, 24 Apr 2024 16:32:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32f0a300aed47522
X-CR-MTA-TID: 64aa7808
Received: from f9838d272c6e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BBB02B0E-3244-477B-BF1B-DE4AABA8BA44.1;
	Wed, 24 Apr 2024 16:32:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9838d272c6e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Apr 2024 16:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5lV0GvuekBH7BbvNBIJ+LN0DyIWGb/m3qWMDZ3VE4rNGnVDh97bqs3nTSZida1g2RcwyiLGk5l8/t56w6c6Me8hm7A122HLX5V8SBGZxHlcRxxf8FcxWfu+T9scbcWVwAjXoEJdOFP4cJteJTiBX5Zy1sQTvLxBzzRuOPhLPuUJCR6lXlh421YFdqn3YpDV0iPKhvyjMk7tfENRzVRv2zK7AjCnlVEaQeoWsG4nkaN++q3ToNrWlIsaXaDwddpkINntT6A1El8ZnVa5PciBVRx8nD7s2EThzKn+cX5dh+62T4xw/L+gCOuXdLD1/h4KfrOPD29A2FAYHtrqQTLPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyqMmp37/PLkvicKekxo1puaUpfI9J+JTcWQKeBUveY=;
 b=NvKlH1lOP9iIwOgZcmZ48Yfk3x7zGO9Avyzm125o84GruuAZGXQPkKOt+OqKOHpvc0O9UbIpoXSPXQYSFYp/p9112Z8dVeqy03jbMi1accnZaqmiDok00QNv62DB6kVhGu1eVVBoVQNvTMKzP1j5v330sYebwece8VZRkbCMhbIjzzCJLiCTAV+zS3k3RWC6SLhjS9IvL1E7cxUz9XuCf+f37phJAoAhoh+8RqKX/h38GylCr6HmuRmR6w5SMDwdfth0Mu16L0QqCTAbmgIZrXT4LAmFjfWIXwmmhle+MFYA6UWRciqlOxO1fne5x6SYCDXydadkIs63Slewy5kivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyqMmp37/PLkvicKekxo1puaUpfI9J+JTcWQKeBUveY=;
 b=EhGHKR3XYWJjycW09YzHQQLlzpJDU+Qm1kZd2MR69bRQZe80l5r15C9NIzxgT8iceYKa6SrBcaWiYJq/Bu9dxIxeXvvNPPxvnYvn4G7tS4lsS0QeaAyfVuPgFco/OUIyB+kCAq2wcVm4IftOwWn6jM0q77Rd5qXom5CahKKzgx0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9379.eurprd08.prod.outlook.com (2603:10a6:102:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 16:32:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 16:32:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
Thread-Topic: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
Thread-Index: AQHalkqimHfS5RwrFkGjNTJJ4qxR77F3fhWAgAAJbACAAAf4AIAADb0ngAAAPYA=
Date: Wed, 24 Apr 2024 16:32:47 +0000
Message-ID: <63CBC322-7A52-43D5-9831-7D2D9D84C9FC@arm.com>
References: <20240424132329.2706-1-f_l_k@t-online.de>
 <CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
 <GZCGCS.7L0JATLUHBTN3@t-online.de>
 <CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
 <17C942CD035C6224.31749@lists.openembedded.org>
 <3LGGCS.ZNNW2XQJHNC8@t-online.de>
In-Reply-To: <3LGGCS.ZNNW2XQJHNC8@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9379:EE_|DU6PEPF0000B61F:EE_|AM7PR08MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fad3e2d-7b61-4e8a-6c3f-08dc647c3245
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dGFUOVBMV2RRdzdub3hBUmpBaWdyT0FlaE5wNGJ2KzNZSDd2Nm5jK1NuRXBr?=
 =?utf-8?B?TFpjbVNPY1MxNGl0Y2ptVk1YOGd0TlFITWxSdXdodGZnTFozYWdKRkRZaGZr?=
 =?utf-8?B?QlRrWmE3a2tYbkk4WVJWMEVrVHVGVGVQZmNPQ2hGbEpIK3I5WFYySG9TLzI0?=
 =?utf-8?B?T29yM29wTzZtYXF1WXgwZzVYRHErTE41L2Z0NXlaQVdvZTVsaUozLzZZUGpt?=
 =?utf-8?B?TXRLVFZOTFJYZ0JpQjE1MHVtcUN2cmJSamY5Z29sNGQvYzJaVmpZM1kxbi9H?=
 =?utf-8?B?WWpIYkt2eE0vek5ONTZ2R2I1bnpsdmh0WXBGT1lkS3NxN1Zwbk9DaGhRRGJk?=
 =?utf-8?B?eDNRTEFPSjNpYXlPSDk5YjRhdmtCeTJIbDF6cEduY1U3NkpDc21oSzdoZGRl?=
 =?utf-8?B?VE8vanVEdTh3NGpuKzNtdS94NTZjeFhLR3VYWm5LdjdoOTFlNnVvOTVqNlVJ?=
 =?utf-8?B?OVl3amxvYlorS3BiSDhuZHlQMEg5QnIydjFTK0t3OHBFa3ZEeGFibzBhOG9G?=
 =?utf-8?B?YzBKRU5PVzVsTFlFQ2YwTTZabEVJNlFxK0wraExuai94Wkl3KzFtYTNqVXZJ?=
 =?utf-8?B?K3pRbWlnandsZU15b1VzczF2WmFROXhsTXpQWE56bU9NNnBQbkhOV0tjUUc3?=
 =?utf-8?B?c3ZIOEhTN2FQR2lrdkdZS1pFTjNQK2FkMGlVK1piRG9URjdWaDZreXFaUTFP?=
 =?utf-8?B?dzJ0K0JhNXUwYVBPMi9DcEk2TisxWHRYWEZQY29RWStyM21IaVIxQkQyZmNN?=
 =?utf-8?B?R3p1NVVIQUhocytCQ0xVSjBJY0ljbWx3bjJqM1lxZFo4SHlMZ0ZzREVzdDdD?=
 =?utf-8?B?NlREekhKTXJPK09tSGRUYTZZSElqY0Z5OVJNQnFaU0JPVnJKeVVGczVtSjdv?=
 =?utf-8?B?b2g1bTdFNzlJREh4Tkdpd0tWWS9oeWxoM0tJY2ZrOWhUM1plcWV0MDVrNndE?=
 =?utf-8?B?L0xPTVJiUnNsUEorN0hsUStnRWpxeWwycGlWRXpuczUzbHI5OXFVQmNyd1JL?=
 =?utf-8?B?aEZwTmE3anQ3bkx3YlYza0I5azZrd1crYjhjQTRoZzZ4bVJ2OGgzUzZPOUY0?=
 =?utf-8?B?VHRuTXNjTGV2cFU4YmgvQkZ1ZnQyRjdZNWZkdzhNWG5nWCtWV3VvU2FBeTRY?=
 =?utf-8?B?YWM2cnhkemlKc3hsaXlhU1IxWEdjZ2graWMrQ3I1VXpVM1VUV2h4VHpzUTcv?=
 =?utf-8?B?aXZUM3o0d3E2SUM0Zm9vOERGUUpWd2JPaStBcUJxV0lrWVpOWjdrZVJ0cTJZ?=
 =?utf-8?B?Vk5DNmFUQjdVbGJFK2xYVVhuNmtrRmVQcnBqQzFzVWxQazY0NmlVOE9WVkZZ?=
 =?utf-8?B?N0JIM0pvQTlvTjd6NFdPMjJLTDBmSlhRVXhqdnA4Y3lhZHhtY1cybmJLczdw?=
 =?utf-8?B?cFYzMVhCaDZtRE9sQ3I0ZUp2ZUM5b08vbHJmQWVMM1M4d3hNQmo1QUZTaWRD?=
 =?utf-8?B?V1FxSXA4VTE5aU8yK0YxSlNJalNGR3pRT1hibVNtTDFOUmJpaGVtZ29aNmoz?=
 =?utf-8?B?SmxYMXdzSWVkZmV5ek5EY3JnYmhLUzdwNzd2dGJtMDgzbytFN202dVhrQnNI?=
 =?utf-8?B?QkFTQldoanVHTFIxZGdqaWlUOFZNOThtbzdNcTBsWlR4T25VZS9VdVV3ZG94?=
 =?utf-8?B?WHlTSmNYci9yM0dCOEgyL0JTQnlsK0I5TythK2puYzdoYlpJRmJUVDE1RWFr?=
 =?utf-8?B?dFR6QTdYcWxLM3RTZTVITXh6NkpTdlgxRkxzWWRIUkFqZUNkL0NQcHJYeWhU?=
 =?utf-8?B?N1o2SFN5VHZKRnE5cTRVZzB1S3hWbldSSlg0R3RSMmJMSjBoMXc0T1BkY0Z3?=
 =?utf-8?B?dVRlQnJKcStUamdUV2didz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECE85C4C39AB534EA5B851E968522945@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9379
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f6d06cc4-355b-40b5-74c0-08dc647c2d66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTJXWkpoUFc5M3U0czM3L3Y1RnVOTDBuZFhGMFNJV2dDb0pycXhWbzcxWGN1?=
 =?utf-8?B?Skl0NW5DUkM4ZldmV0Q4YVJ4RUY0bk1jd0ZpWDZUeFdud29OZ3FzTnQ5MlBW?=
 =?utf-8?B?a28rb3R5ajRPeTRKQzFIT1p5dFdjYTFHb2xhVGZodjdWbXNkYWFEMmdpZjVJ?=
 =?utf-8?B?bEExYVZuRVRKWkMvdExtVkZ6OVl2YkNlZXhJYjZPb1FtQUtVbFdnSndQT0xm?=
 =?utf-8?B?cVFvZVFGZTVCdEdMTVVBMjFGYTJZbnlOYmJESklMeTgyWUhJYVVPc2llK0xH?=
 =?utf-8?B?SDZTMUg5MEFZNHJYUFBxUkV5M29KcnA4MGcvZmZnQ0tkbWl0R0dLRjlXVXVh?=
 =?utf-8?B?WFVZNE1sZG9nelFQY1c5S0hKbGd5MVRqd0d1MjFQKzNlbEQxQklsSnBaMzBt?=
 =?utf-8?B?WjBPY1VGU0JnRUtrTFQ1WWZOeTFoVXU1Y2k1ZTl0Yk5SRmUrb1FveVkvOWcx?=
 =?utf-8?B?L3pMcWIwbTZPVGlDbjFmTW9IMzJxMVFRb2pvUjRnOTJIcFpTa2VIbkNUbCtr?=
 =?utf-8?B?UndYeERUUy9vVGVTT2RiRVhkalVRcGJwekFRcGRTRkt6M0NWTyt6YnFpd2pu?=
 =?utf-8?B?SDJJTkZhTTZUNUZRVjJWSExKK1BmYmFXcXVjWDRTbWY5dVhTTzhQNmczWVdz?=
 =?utf-8?B?alZaajd1VndrTVByQ09tbkE1MDJqMDZ4dXVnYmZhQ295alRYYmZMVXdBbVRu?=
 =?utf-8?B?MFcyanFXNUFyWmNOaUxpWnYyRjB4em9BNGhiTHp2c3RScUdCRHROTnkyWG0x?=
 =?utf-8?B?YVQxYjJVWEhtYUllOUdzVTExM25NTTM1TVRKOWtLUlVnTzZCM2lnRXpxWmpW?=
 =?utf-8?B?d0t5ZzJSSlluZHgrS1JZRE9vcXcxMThid21nTWQ1ZUpHQkZjcnU0bW5qV2Qx?=
 =?utf-8?B?R3duTlhpUTIvcjFQTGMyR1NQMEFIV2U0N1FpbXVWdk1NdE83TzdWUVg5VXRj?=
 =?utf-8?B?b1ZRdHNXMEhURU5OMEVnaG1vZjJ5WWF3dXBhSTQ2a1JINnJ1dnBuaHRyZUFI?=
 =?utf-8?B?WjVzR3Jya3F1WGVZTSt2V2cvNGdlMlZLM2VrZStVWDcyWFJWM2hwcjNOWTU5?=
 =?utf-8?B?Ni9OVGc5NGVpbkcwL2lwQ2VTT29TcUIwOEZQM0h2N1Bod3dpcVk1dk1jY3V6?=
 =?utf-8?B?NUIwblJobmxBZ2M4RGZ6dWhVVnV6cmcwZG9RWm5lTDVJUWxDSGJJY0hzMzBG?=
 =?utf-8?B?NU5RTFo5M1RHWWlnN1VtQVorUXZsY3V1ZGFWaG0xeFFVQm5UVU0rcXloTWNN?=
 =?utf-8?B?VFE0UmFXUU5KNkN0Q0RlRStxZjlleS83Mzh0dGJzNDlMdW1Eb003Y3ZtMEFs?=
 =?utf-8?B?SzJ5dTg2TVJxVTN6YW5RNmZZNFRuUjBpLzVxR0laazUrYnJZay9MM2lCU3lK?=
 =?utf-8?B?ekpWTjV1RzlQaE8xQ1pLQU1OOE1lcVhNZnRkMk01YXQ2RE4vUmFnN1U2NVdJ?=
 =?utf-8?B?TmxoWDk2ODBWT2pWcUdzMG9DSFlmKzBYbnVLTExDYVVNenZBbmFSRXRIS28r?=
 =?utf-8?B?b3ROWTI1S09VMFZRL3ZkRGltZW1iaE1YVkl4NE9TYXFZbjRTZkkxY2NSQ3Zq?=
 =?utf-8?B?R2l6TmE2VEVWMUNOV2VVWWZ1Rm1GVE5jNzZPWTJlemc4SnRlVXlkSTBVRVBs?=
 =?utf-8?B?bWJaWTc0ZWlFQ1dwQTZ3QjQrck8xR0NIL3YzRklRUGNZaFdBNk9lazNSbnpZ?=
 =?utf-8?B?UmErd3plSXRtbXpkalBLcitjRG9ucm5qdkpGN05IU3VWMGFQM3Y3VndUTDNZ?=
 =?utf-8?B?dllLTG1NS3Z4Y2VRZllqTStUWmU1dmhoMjJBbGd4TzNmV1c5YmRXYlNzR1Bi?=
 =?utf-8?Q?cfkn+mahOjPsLhL0HkUbXe2KPi2rzZVtrDN48=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:32:56.1588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fad3e2d-7b61-4e8a-6c3f-08dc647c3245
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 16:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110136

T24gMjQgQXByIDIwMjQsIGF0IDE3OjMxLCBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+
IHdyb3RlOg0KPiANCj4gT24gV2VkLCBBcHIgMjQgMjAyNCBhdCAwNjowMzoxOCBQTSArMDI6MDA6
MDAsIE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4gd3JvdGU6DQo+PiBJIGd1ZXNzIGJ1
aWxkIHdpbGwgYnJlYWsNCj4gDQo+IA0KPiBObyBpdCBkb2Vzbid0LCB1c2luZyBAYmFzZW5hbWVA
IGZpeGVzIHRoZSBpc3N1ZS4NCj4gDQo+IE5vdyBpdCBsb29rcyBsaWtlOg0KPiAvKiBlbnVtZXJh
dGlvbnMgZnJvbSAiZ3VwbnAtZXJyb3IuaCIgKi8NCj4gI2luY2x1ZGUgImd1cG5wLWVycm9yLmgi
DQo+IA0KPiBJJ2xsIHNlbmQgdGhpcyB0byB1cHN0cmVhbSBmaXJzdC4gTGV0cyBzZWUgaWYgdGhp
cyB3b3VsZCB3b3JrIGZvciBhbGwNCg0KWWVhaCB0aGF04oCZcyB0aGUgY29ycmVjdCBmaXguDQoN
ClJvc3Mg

