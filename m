Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88FEC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 08:27:25 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web10.10103.1717576039045997031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 01:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Xs7jvfmT;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1717576039; x=1749112039;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=H9eTrpVqginZvlcjIPGezFaASuiInJ+6jHeyMaaRVK0=;
  b=Xs7jvfmTGvVz7hmxwcocO5S2x/h+9ZCK/jrQ5oLPkSVo6L9/XoCqLuqM
   okchtoSjFUtGGis7BhAo6xbuILCSCyzjoBTqW1FLqco2wqWeViUpmNMoA
   MW3TfcSZS6N3JBWKtICpheX18nBqA9vNBhK5b3rdxHY007UI05yhKNEq0
   S5Qv2L8ijxK2UsHHcaFUReP5UMNLtywimWWxbRnoS0xu/kiJ64UMJpSeQ
   FEfJLw4QBwlqKY64jd/BB5O0BXA+Z0nMBQKufnh9b6pApshxQKg6yYu5X
   L2fQqbxnFjOJByEj7m3WuGBliNOuR300s3CODphxWA/EyGCfuN33npB2c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="32490661"
X-IronPort-AV: E=Sophos;i="6.08,216,1712588400"; 
   d="scan'208";a="32490661"
Received: from mail-japanwestazlp17011006.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.6])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 17:27:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERKsqik3lIRwJiS9VfnSWBI6lox18frEIVIaUBQVjUmR5jwqE9jTHaYnuyA25j9lOgK7FI6TTA7miwHea/+kL0PIEpNh8lYTUU1+JtShtmZ1o1rQe7DNVWlqRsy49h5L2mHW5bFpxdIaDSA2OU18TfkTXz1BSiEvJ77RMcHXJ52RElLobSw/jDv7fSQZE49FYS+uDfpcUB46FTeihdWZfbe6UMtrWHFRhRB887RFXjtX3KLuteo7nTboAim4iZCX7nP7XXo9PVsWOjCIcTYzDct0/2V5FF8SOiEz0V8mSt36MrPdiFkgI6A/Z4p+MpFf/9G6mj5iDFrBTw5CbMpE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9eTrpVqginZvlcjIPGezFaASuiInJ+6jHeyMaaRVK0=;
 b=LuvC8IESmWSvu3yHHL+uZ2nmeGE0NrgsntjH0FiTpsfGmONZR+h5xChUcw19eAmsC+RctObvQM1JhsvrkDLUWXXJpSj5852eETbNvfWTp3tpPg6C7AyB83QGBdyKR3oL0yLu39ixwYfJmLuC9k2Th/i0r64b6MiAUSbmSWgDQgERYjP+9NmBsireZMEfQNHlY+pVzs7oe32SCT0vYlkcsNXZPhrZNuLPmrpzcRvluX64WFZwpO20kDBSfmYNNust3j56vZZTTLdFBZvaII8IAbvjcVm7xjf//r8gb6ui4P4tngWQJumwc5XkJS6LH73qFPqIU11WuaDIt3PytgKMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS7PR01MB12065.jpnprd01.prod.outlook.com
 (2603:1096:604:266::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 08:27:13 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 08:27:13 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 1/2] cmpi-bindings: ignore incompatible-pointer-types
 errors for now.
Thread-Topic: [oe] [PATCH 1/2] cmpi-bindings: ignore
 incompatible-pointer-types errors for now.
Thread-Index: AQHatxM7Ycx4eKVc6Eadyx2KovdxsbG41MTg
Date: Wed, 5 Jun 2024 08:27:12 +0000
Message-ID: 
 <TY3PR01MB11056F365C91CEB2A21ECDC85A0F92@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <17D60871905D8062.18873@lists.openembedded.org>
In-Reply-To: <17D60871905D8062.18873@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=ce573674-b95c-421e-bfc9-9373e6835304;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-06-05T08:26:26Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS7PR01MB12065:EE_
x-ms-office365-filtering-correlation-id: 35c98e44-dce9-4ced-ff9e-08dc85394cec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?shift_jis?B?TktXM3dTL3Q2UUdwb2MySFlRbGRjNERTVlpGdW5iUVlXQ0FwcE9WNS9l?=
 =?shift_jis?B?bnBzTkJpRDkyaHhrSStYMEVTbXNZdCtzT2krWmVRMlpBQ3JNSmU5Tjho?=
 =?shift_jis?B?bmVDQkk2YXhlR2tEYUlvV0EwVHRPOXBDT2pRYkJCbVFYc0J4NHZKY2JM?=
 =?shift_jis?B?NGllUmZDV2p2bnp3ajhzdW5IVVFFNE1ORm51cWkvNUU2TnlzeXBlWVo3?=
 =?shift_jis?B?eTVnNFU1MXMveTh2VE9tSFJSK0tvYmEvZFRMaWZxeG1WUzRVNGxhQ3px?=
 =?shift_jis?B?RDliL205NUhabEZjS3VxTDM2MElUdjB4bGhyQUd2ODNRZVZ5N1ZnaHpS?=
 =?shift_jis?B?UlZJeU9sN2lTYndPczQyNnBlQUVDcVEyV3FDSUdIbzlwV1kvSjVhc0tF?=
 =?shift_jis?B?U2E0c1NGYzA5cUc0eDFnM1Z3V2ZyUnFiWEF2dlQyckg0TWNPWmdsaGZK?=
 =?shift_jis?B?V2czbUVOUTZzcEp6c0VhVGdnbjlONnZOTkM4Z2FHR1Q0VXU3MWFWZ3hC?=
 =?shift_jis?B?dHhpUndUa09JWnFXdmFBZ3RmekpKRS94ZEdLOEpyWFFZcTFsa3AwSTVT?=
 =?shift_jis?B?bmcvVDBENzRDUTJxMHZPYVd5dnhWdmdHSGxCQmZaVDlCbjEyVDdjblEw?=
 =?shift_jis?B?MzlkM01lUVY4VjIzYkZjY3NyVzVzK0ZZQzVCa0ZpMGlkaEtQNE95UmdC?=
 =?shift_jis?B?TWlnazcxNndKUTFMR2daOFkzcmM1R1l2VUhPaFl6TVhNVHNQMUtZeXpI?=
 =?shift_jis?B?dTdSK1NrYTA4dXJPeFNFaDZ2ekhsNU5sQXVvemswUGN6UGl5aVp3dzBw?=
 =?shift_jis?B?eTFEU2V5OXJ3Um1WNlM1UWExckhqNGhVeVJ6ekIva2dlcWJjQ0M2RHRL?=
 =?shift_jis?B?dlFHOFJzaWhWM1hKalpBOXhvYUl0NjQ0ZGZINlZoYUgwUXN0R2VVQnNU?=
 =?shift_jis?B?MzkrWEVwSHUyaHhIMFVvZkZqeXRaNHVkQlNJOUhJN2E5Y2ZLSFFEOVhz?=
 =?shift_jis?B?WG5zNUl1dHBuWFBmVy9nc21HYXFzTDZTLzV2SUpTemhmUmMrd2RlK25Q?=
 =?shift_jis?B?VFUyQnRhbTNWdXhiYXMzUm0xNjUzTzdrQ3A5QUtucmVWUTBJSXQxY0Yz?=
 =?shift_jis?B?Nks2cFEvTk94OWliZ0c0UmR6cWloZGtaT2FrR1YwWW1OUXdzM0RsY0dF?=
 =?shift_jis?B?UzFtMVd4SUEwM1Z4bUNFcWZ6NUdqU29SbVR3dmtCZDdDbzV0b0IrVUh3?=
 =?shift_jis?B?L1I5SE1yZVliMG5ESzR2SENwNDk5bllZcEFLZW8vblZINDh4cUlvdlY4?=
 =?shift_jis?B?T1RNQU9TQ3NqTHM1YW55b0JBMDlXbWZWb3hSZGQwUUpZRDNiNFJSWEZU?=
 =?shift_jis?B?RVB3c1MvRG0xcWJ0QnBhVTFFTmxtSXg3T3ZiTFJQa3JUeUVOanhHZ1Rk?=
 =?shift_jis?B?YWFLME5oS2YxUEthaloxUm9zN1BpU1FlMjJKQVFONnk2S0JmdERGWWNE?=
 =?shift_jis?B?dC9mQmlSTHkyRGlDUzJCR2dIU1lUNzYrYW9GaE9hMFllQUxDS0xXc1Qr?=
 =?shift_jis?B?c3kwS3JOWE9IWWFVUHZmN2xPMk83alkwM2EvZDhPRk5LUTRoOXBhMzZm?=
 =?shift_jis?B?VVpTY0E3VVVyRGx5cUs5MVBxeEEwMS9ybnN1TXpUWWpwZFB2M3ZwQ0RJ?=
 =?shift_jis?B?V29jWVd5QnBXZk9ZTmppVjl5YWtSQW91QnVMYzFLSzVnZEZkOWduelBL?=
 =?shift_jis?B?bEFVK3l4ODhmU296ODQrKzFHTU1sakZ6aTVwZTRtS2YyMjZPajd0WmJW?=
 =?shift_jis?B?NjRydjhETG8yeFRqMzRvQXAxTTQ3UTJEZjNFZElQNnpYTTlWWmpXa0dI?=
 =?shift_jis?B?V0dFN08wMlVmYTdaOS9jTTJ0SXluR3pHOHFrOVdVbmhzSFJlbmJMZWdO?=
 =?shift_jis?B?ZFI1Lys2d05jNlZmbGxBVW5ib3krTEVQN29LN1BuWVYwWE85bUcrQ1Z6?=
 =?shift_jis?Q?4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?VjBqMlR4RVdLeiszVktNcFlvalF2Sm53NHdqVEFXOW8rajZNbno0TUhh?=
 =?shift_jis?B?WXdVb1JMRWxyaGFmbWtuYXJqOUxxVVh6dlFsbEUxVVdvcHFiTG1CVmJW?=
 =?shift_jis?B?MGlXaXg5N0FZV21EbitFd3lBSW41TEREd2wvYU0zdmpaTldjam9iQXd1?=
 =?shift_jis?B?dEh0a3FXc3h2MnhsYVg1Q01OSkFrcDJBMkUrUFRBZVU4eFA0RG5OYjcx?=
 =?shift_jis?B?cHRFRHJKQnowZG1OL25qN05vNFM2TTVFVXI1bUJOOSt5VkpqUEVTTlVC?=
 =?shift_jis?B?c1ZnaE4zOWFwbk1NQlN5TWt0bzk3TGtqaXAwd042amgxSkFjQmZ6Rzlj?=
 =?shift_jis?B?dmxYWHg2eThya2R3azRJQVBPNzFQTVVCbkFrbTZVQmJFQ2JtbE4zZUlS?=
 =?shift_jis?B?cUFvTVJ2ZGtERlFTaS8wem1DMGVjN0U4eGtlTXBlRjdVaVJYQ253OFVB?=
 =?shift_jis?B?UnN1aDlHbmt2enhoVXlIVlQxdWsxblIycGRCTmF4RlhqUW56QTErV1Bp?=
 =?shift_jis?B?Q1pJN2JJQ0g0bEQvc2dBTVhKMTlla0JudjBLdk1BSitZWkF2d2YrN1Jj?=
 =?shift_jis?B?akNhK3Z5aE9nSmZWNzZyR3RWaUdUK015M1c4S3hQeDEyelZUc2I3NThL?=
 =?shift_jis?B?STJFOStxMFRTNUZpN0g0ZjVXc25NZE1oNmFpWGo5di9vMU9jOTQ5ay9N?=
 =?shift_jis?B?LzIyWjd3V3ZkTFA5UUJuR2FLNWNsekx0QjNhLzVWWGhTd204d2hSc0xP?=
 =?shift_jis?B?cGN1YXFsWVk0NU9IcHhudzdPd2VncWl0N0JadERGSDZKcllwZHdtc205?=
 =?shift_jis?B?Yk9KNjhlb0xNQy9MUFBxaG00RVRwYitwRVVCZW9WZTJTU1hZNGhvWDdv?=
 =?shift_jis?B?dThYRjd3dGlnS3B4ekI5K2JSUDNWdHZaRHdiY3gyU1c0WTYwakgvUXVu?=
 =?shift_jis?B?ZDhMaUdGVWl4d1Y5Z3RaUVUvTjcxSlpIdWlKQTJhRko5MXc1b1Z1RjJ6?=
 =?shift_jis?B?Q0lVcEFYL2VnZjRWUUgvN1Zpc2pBSlJGSithckY0N3lEeEU0cXZMVUdj?=
 =?shift_jis?B?eVJQdDMzZUpFTXg3aUFOM1BuYUZyaDd6UHFGYjdCeG1TemxFNHNqcjIy?=
 =?shift_jis?B?bjFaNldvbW5Hemw2QjcrK3RTVTBHc0QwMGsxZmwwczUrVHM2NmFZVmdm?=
 =?shift_jis?B?b0JkNUgwR2U4RWw3aFAwMFgyazVCbkxEWnNaUU5rd0pHakF3Q01JVGd5?=
 =?shift_jis?B?aGV3WWt3aDNBUHQyemFQNmF3N3dvaFg0SldtQW9xUy9hL3lQZzhhaUQz?=
 =?shift_jis?B?cWprRTAzWmViZkJPdFk1cUw4YUo5cHVuS1RESWJWSHUyd2F3ZGk4eWpn?=
 =?shift_jis?B?QmprOTMya1ozWkxTVkY1VjIwY1hwSUI4NmR5WTEzYmN0WnpXVm9GK01R?=
 =?shift_jis?B?bE84dzE2emtjK3RIT0FGOHh5ejNaT285NnhhdFJoTlFuVzFmbmcrUzFN?=
 =?shift_jis?B?VkhlUEh1MStmOUNobk1VWUt3cG1nVENsNnJKODNGYm9mcit5cUc5aW1S?=
 =?shift_jis?B?S3ptNzQ4WEdIbUlHWXRIazVCeGw1V0hPMVBKNmpNZVpJQ3BMYTR0TTR4?=
 =?shift_jis?B?N0Q0K0E2cDlYQTBGN1YwcVU2V0FZcDBJKzVMRklZSkFmNzQzR3JTR3Yy?=
 =?shift_jis?B?L05VekxiWXN2blBJamxqWUd4eTJLQUYxWFJaYlRvUHFwcVFINWJiNFdt?=
 =?shift_jis?B?Ujc1WnEvQUQxSUhOWGZDaDR2SVdBSXJxaW5LTmI0eGZ6RXFGeHJUUDNs?=
 =?shift_jis?B?QnE1dkdrVXI0bWZLTUlUdXZYeVlyNU0wWlprQkIxZkFSd0hjbzgyVmVT?=
 =?shift_jis?B?V1MvY0dFVlRsMWtLNUV5K0VFeVdQS2ZSZDNSblVZaVZBdHZySDNURUdz?=
 =?shift_jis?B?MmJBSUdIaW95SHVrUlo3cHZyR2RvQ0NCMmtwSU1CeGthSStBSXRGQkhH?=
 =?shift_jis?B?dUh5QnRYRXJsb2N2VUt5WG1ra3V0bVJyL25ubjY4Z3oycW8rRk5FakpO?=
 =?shift_jis?B?S1BZOC9DcWVsbmc4NWdvNGpML0E3and4WjBzaUZld3JVK0Z3N1pTSDZ2?=
 =?shift_jis?B?NnBkY1BLRHhHTTZXaThwSXVqaWQyNmtiLzFnalhQQWV0bHoyRlI5bWU5?=
 =?shift_jis?B?OUNla1lseGRaM2NWOFRuN3hLQmhmU09QdlRBV2w1elBTeXUrSGZxWlJL?=
 =?shift_jis?B?K0R4alN1eXdMTlF2RHNGUjVkaTRmYmxFOU84R0FuTzBwelViNVNiTkVW?=
 =?shift_jis?Q?I2mF?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	A+sGHRmWLt45+pSDh2oznJS4h5hpU0twKev698o0ufhdYlHIjBbRLRQJHtKtJ8q6i+VuhZGNXy8rNTbrsa+bXGAKlACcZU4zxx772MaQpO1NLVBmbqWMX4M2707pQXh2V2sHgsrT7XOvr71N6fJTYqr3VkiAns+/lHn8Z3n7absNKdeKHdTaCK7O0hUh573bVpQBvGbpwtWOd2hhnrNvJ7BCHRjxAo20yO86JuCSOZnNxTOWdeysXnJcbzhOmxYqqAE1u4u8ueKscgX5OoR1f5jhQHKp0fsBJepyxiRLFMkhTd50/TG6gGN+qLfbtuDhUubAHKkseW1ZWeYMYCM/jJxVTdwWRtvIVEAOfy86mnWqYBDKPJu8+hqd/M+pRAviyzfjH4FX5Q8Z9DBTW19Zu4xn6Ddq2SVNWBi7/OJIRHeVVGFACiIy+qp5e8TjgeEWWDpPO0dted7XacY7h819MgUDh55vooIc3MKEszdX49GqyJlCYmMbjvFcfAvsgG9p0NGd42VH5rKpxRKNvmdO0zLH2U+Zf7AatwCKDWmspS+il4Zzo9MnE0ga9+deStn7+mpwtojflzl4LH93tm/UCZniec6HdabEwtF5WDjfMmUMgJsukNpI9jMFtIP7hv3I
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c98e44-dce9-4ced-ff9e-08dc85394cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 08:27:12.9618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZyysT87gr4XV4DHFDhK1eRdnKp7Icc5Z8VpBYEc7/Gb1D4Brspsiu9hqMwdTKgqCagHoQy1TH//BV29cGFlFXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 08:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110701

SGkNCg0KSXQgc2VlbXMgdGhlcmUgYXJlIG1hbnkgcmVjaXBlcyBoYXZlIHRoZSBzYW1lIGlzc3Vl
LiBJIGZvdW5kIHRoZXJlIGFyZSB0d28gbWV0aG9kcyB0aGF0IGZpeCB0aGlzIGlzc3VlIGZyb20g
Z2l0IGxvZyBvZiBwb2t5Lg0KT25lIGlzIGlnbm9yZSBpbmNvbXBhdGlibGUtcG9pbnRlci10eXBl
cywgdGhlIG90aGVyIGlzIHN1Ym1pdHRpbmcgYSBwYXRjaCBvZiBzb3VyY2UgY29kZS4NCkknbSBu
b3Qgc3VyZSB3aGljaCBtZXRob2QgaXMgbW9yZSBwb3B1bGFyLi4uDQoNCg0KQmVzdCByZWdhcmRz
DQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aSB2aWENCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAyNCAyOjQw
IFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBD
YzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gU3ViamVjdDogW29lXSBb
UEFUQ0ggMS8yXSBjbXBpLWJpbmRpbmdzOiBpZ25vcmUgaW5jb21wYXRpYmxlLXBvaW50ZXItdHlw
ZXMNCj4gZXJyb3JzIGZvciBub3cuDQo+IA0KPiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlA
ZnVqaXRzdS5jb20+DQo+IA0KPiBHQ0MgMTQgaW1wbGljaXRseSB0dXJucyBhIHdhcm5pbmcgaW50
byBhIGNvbXBpbGVyIGVycm9yOg0KPiANCj4gfA0KPiAvYnVpbGQtdWJpbnV4LWRhaWx5L3RtcC93
b3JrL2FhcmNoNjQtdWJpbnV4LWxpbnV4L2NtcGktYmluZGluZ3MvMS4wLjQvZ2l0Lw0KPiBzd2ln
L3B5dGhvbi8uLi8uLi9zcmMvdGFyZ2V0X3B5dGhvbi5jOjE2ODoyMTogZXJyb3I6IHBhc3Npbmcg
YXJndW1lbnQgMSBvZg0KPiAnUHlfU2V0UHJvZ3JhbU5hbWUnIGZyb20gaW5jb21wYXRpYmxlIHBv
aW50ZXIgdHlwZQ0KPiBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10NCj4gfCAgIDE2OCB8
ICAgUHlfU2V0UHJvZ3JhbU5hbWUoImNtcGlfc3dpZyIpOw0KPiB8ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fg0KPiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICB8
DQo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIGNoYXIgKg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3NfMS4wLjQuYmIg
fCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvY21waS1iaW5kaW5n
cy9jbXBpLWJpbmRpbmdzXzEuMC40LmJiDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Nt
cGktYmluZGluZ3MvY21waS1iaW5kaW5nc18xLjAuNC5iYg0KPiBpbmRleCA3ODFkYzgzZGE5Li5k
MDYyZTQ2YmI5IDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvY21waS1i
aW5kaW5ncy9jbXBpLWJpbmRpbmdzXzEuMC40LmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3NfMS4wLjQuYmINCj4gQEAgLTI3LDcg
KzI3LDcgQEAgRVhUUkFfT0VDTUFLRSA9ICItRExJQj0nJHtiYXNlbGlifScgXCAgIyBXaXRoIE5p
bmphDQo+IGl0IGZhaWxzIHdpdGg6DQo+ICAjIG5pbmphOiBlcnJvcjogYnVpbGQubmluamE6Mjgy
OiBiYWQgJC1lc2NhcGUgKGxpdGVyYWwgJCBtdXN0IGJlIHdyaXR0ZW4gYXMgJCQpDQo+IE9FQ01B
S0VfR0VORVJBVE9SID0gIlVuaXggTWFrZWZpbGVzIg0KPiAtDQo+ICtDRkxBR1MgKz0gIi1Xbm8t
ZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMiDQo+ICBGSUxFUzoke1BOfSA9KyIke2xp
YmRpcn0vY21waS9saWJweTNDbXBpUHJvdmlkZXIuc28NCj4gJHtQWVRIT05fU0lURVBBQ0tBR0VT
X0RJUn0vKiINCj4gIEZJTEVTOiR7UE59LWRiZyA9KyAiJHtsaWJkaXJ9L2NtcGkvLmRlYnVnL2xp
YnB5Q21waVByb3ZpZGVyLnNvIg0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==

