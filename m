Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C70CA0FE9
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 09:53:35 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web11.60844.1756202012730986052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 02:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=ekcFkC4w;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1756202012; x=1787738012;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=8/dIs0pVwGkAaq5fZvrR0L6n39xI8BQxXyrcvh+e+3I=;
  b=ekcFkC4wDGKfVusCDG9ItskjInn8hbtRbudsUf5Dthw/K6T0DkVa984M
   3U0rqrPXieTsBn4NmHKmzr+rUBRD/WrTYzIqKWy/HOszQsPg6U+XN4A/a
   SjtAy5GviGEYMmh+h8402Y6btokUMiCK4+EqTivI/TO3unQD4J1Yeb0gw
   69blb0+snCELPXPI2UdPovni6UxBOmBMb6W0l+3Zsc4I1I9D2JYFwMbRO
   znJ26xtMNab0McoA1SnI2ObowE0CecbSgjQkMYz+fXTgOLjfSUbGwkhcb
   KJIs6c9VVQ1xT9B0gy838owoyADMPefmTNtUKJ5WfSYmkjsGB9hv2+aZY
   w==;
X-CSE-ConnectionGUID: gs42KaB5T+S98VCsGoaP8g==
X-CSE-MsgGUID: Re9Gt2mxR2yEFVBjNv9h/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="165876578"
X-IronPort-AV: E=Sophos;i="6.18,214,1751209200"; 
   d="scan'208,217";a="165876578"
Received: from mail-japaneastazon11011068.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([52.101.125.68])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 18:53:29 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPwOc159CQpKBQznNxVI59zITmsqk/ZKkW2ljJddPA46C4pd5Sgx/vzERAeirQlPE854HfZklMghBe5BsqKsgI7i+EUq2fsq0DZc6qiElZf/Op4IBOQhfyoGpmKbrNcMuO08A70dyQW7R+BpPHWQ7twzVUPdddEPE/2ScKXfgXKU/fPjgxVaMFyjBzoN1se+ps+4bl9eyn6OEJ0dO946gz+h/2g5GI37akmRRJFjrEEPwnMBDkaryfUfiIhi73wZUDLWT1Z2c7eWotP4e7gDjdySyAtfTI8KDv/KHcEo3pVIwNbWE8p9JglwxGlsjLSryzYhB64O1SfE5djZKNDxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ0uR/RXAbZWgZF1nlJ5a15tBzAtKCdvY8FbsLITJ/o=;
 b=RZkPzwBRBrCRs/8c8oQRJi4YoOLjMHhWFnJ4yKrf+jTnvGi3JHsDKpcFMT8PpmKYMShsNW8nOX+IsdM/np6vyVwFcixZY8UtSgTXWxOjazN3y8+4rTxKb2w4MhQnrGMPeoeL6N3S9+q2Xs8cQw+tMQacWyqXT6zv+/rez98z9gsKtoIkUOj9yWD/fvWSooNMNPaO89bzY/o71CoglOVQnWqrujfa2RFaMQHaWAVO12AUevrSWseWsCDRxDjbaJWzvtCW4mZr4lBzTzTkcvi+ie/Dr/6vX8dw8Xmikk9dhB8uEfaHeCqJN6iXgjZLYHYe6Axf0jtfZxfAdq3LlBQHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYWPR01MB8591.jpnprd01.prod.outlook.com
 (2603:1096:400:13c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 09:53:27 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:53:26 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, Yi Zhao <yi.zhao@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: smbclient hangs in interactive mode after readline: 8.2.13 -> 8.3
Thread-Topic: smbclient hangs in interactive mode after readline: 8.2.13 ->
 8.3
Thread-Index: AdwWbYA14NbON2qRT9KFHwT4be7Emw==
Date: Tue, 26 Aug 2025 09:53:26 +0000
Message-ID: 
 <OSRPR01MB11597E2995D5DD5B55A24F5769B39A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=dcc27dd8-f8dd-4d27-8355-86e3fe5be8fb;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-08-26T09:53:15Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYWPR01MB8591:EE_
x-ms-office365-filtering-correlation-id: 842e61d2-3893-4b72-46a6-08dde4866778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?YXdNcFJiL3hud2JJUGM0SUJXMTFLcnRGK1h4OFNnZmNKcTlob0dlOStQNXkv?=
 =?gb2312?B?RERzK04yQytwOWRUa3R4VGsyL1dtZ1drdWhFSjF1UENWTmhlME1sejNibjEv?=
 =?gb2312?B?dmFTZDdveHpYS2lQNE5Ka1pBMlgvbXExK3BUeEZOT1RCUzBUQ3NDVExmbUdt?=
 =?gb2312?B?T2JwUndTQTdsZ2xDS2ZwYXQzcUlOR3ZMZkNmRHlOQkdHdGdVQm1ZMVRGWkhk?=
 =?gb2312?B?VVNEejcxeDRFYU9rcGxXUDJxUmJMQm4xM21WWkNhQmNOZUlYRWxsNzFlcWp2?=
 =?gb2312?B?cllEK0kzQ3U3eGhXRTZyRXMrUHJsVC9IUUwySFRXRTMyNzBtdmtlQ2lGRkRQ?=
 =?gb2312?B?NFZUdWthUklicExWbGFMM1JxRjlGaGtDcTRKRWZFeTRUV3NxVjN0MmhxN0RQ?=
 =?gb2312?B?L29CUDdUTGJ6VWl2MXJoQ3htNzhwTm5wTjBUdUcwVWxDTytiME1DVDVDa1JF?=
 =?gb2312?B?MHROYmlSYmVXNm80MHdWSGNwQmlxc3p3d010aW8yczJ6RzAyOERtR3VQWWVK?=
 =?gb2312?B?alZSSE52MEFHOE9BWW0vWXZyMjNNNEhuTXBqUkQwc25VNDhSOGpUYWtEYWxo?=
 =?gb2312?B?UVRsTGtZenVxV1c2aUlvbkl3clRIL3NtZzR6WEwvZEswSU5KWWVIZDNwM0Vk?=
 =?gb2312?B?QklnbWhhN1FTWTkzOGR4UG9aNDVkcGg5RDMrNGpmT29wR0UrN1ZkOVo0dHpF?=
 =?gb2312?B?ajNaRUJoUzJyODBpdUJudXYza0JuTlFpUDlNeUJiVU5iQnBnK3BCaGs4RnZP?=
 =?gb2312?B?S2V1NU8yVEtMZVA0QlVicnBkdDAyK2dRcjYvTnRuYmlTWUQxeEZtUkhIZUFZ?=
 =?gb2312?B?YU5vL252NzZKSEtscUMwajFUa3FZYnBiUXNlNEdFVHE4bHlNdGF5TFdLMmI3?=
 =?gb2312?B?cWVxak5Wck5yTDcrNVBiajRYMzNBVUwwVE9NdDdOakpPOUlBSHRPVmI4djZp?=
 =?gb2312?B?V3lEQVRhMGxsZ1RyaG1ndFhtVzlKaG1iajVlRmlERDNha2x0WE5qMTkrLzV5?=
 =?gb2312?B?R0dwTytzWTExQllUQ2N0WDVZMmhiSDBMeU5id2d6ZEFQVnh2bjVkZW1qVC9N?=
 =?gb2312?B?bmlkbVBHTU1YZDl4ZmU0Q2llUG9DZ24ydHJwZS9yazFydnFqNEd1RGIrdE00?=
 =?gb2312?B?YXYvMURneUZzQmE1T0xkWXN0M0VkYXZlZDBHbWpRUEM2dElXTTlhSVFLQklK?=
 =?gb2312?B?SFU1R3ZCOCtHd3FTSEhUWEFDOFl0SWxJVjlySm02SkxpSEZpMXdjNnJ1WUhB?=
 =?gb2312?B?ZEpBamZCRW9iaHdyWUlpVlo3Ri9ZRm1WdktLbTgvT1RJTU5lc1pqZzJMZ3Fa?=
 =?gb2312?B?NHdHUitjOTE4cjFtOVlpVDZEYzdRR3VQZVAzaENhazl0UVBFK3pieDRkQkN1?=
 =?gb2312?B?R1YyRU16cVMwOXhWbzkwTjlZRkpJaVJBTDZsZGNNaG53OVpGWWRYUVRscmN2?=
 =?gb2312?B?NnJxdkFnekhNVGMrMS9JT2pTMitPSVRib2pmdmpjcVFwOHhQRWo3V0h5TXkz?=
 =?gb2312?B?Q1Z6Y1JoQ3d5MEFpeTFWN2Y1L0lNSWFpc1lENmluRUowVUdNM0NpbGkzeVJQ?=
 =?gb2312?B?R0lNR09melRrSXFBcGZPYmp1NjBhcUVMS29DY1RSdlZ4cHJXcTYxaStUYkpt?=
 =?gb2312?B?RGpPeEN3SDZpYy9xRWJaMk1VMGNtcFRoUzFiN21pdzhxQktpUmk3UDBzblJs?=
 =?gb2312?B?bTN5UU9WSFdjM05IMERkMmVFSzM3ZUUveDZuMGtjcWNEVXE2ZGwvcTZUZFh1?=
 =?gb2312?B?K2I5Sm00RmE5bjg5cXFBWnIvbUxrQm1TcWRQeUNKVFFHaXhSeWJoSE5qMFlG?=
 =?gb2312?B?ejdkZ2tObm5xOUgybWlHQmJtaFNoYkwrK1BmUnRCNlY3Nkt0dzFsa3VRNWYv?=
 =?gb2312?B?ODM0bDRselZJR3RyR2ZkWmxkc3pML3owSEFPaFRjWVJUZlJVSCtVUGZxdFVJ?=
 =?gb2312?B?MWtXNXdNcmVUa1Y3M0Ixb21UT1hvZm5Zd3lIdE5SditXV2Z0OEsySmljUzhx?=
 =?gb2312?B?Y2hMZkh0dHdnUStHTVZJcFRKSGdlVW85bjRYQ1lHRE5lOUFhV3pXQUZ3MWNZ?=
 =?gb2312?Q?22tCtF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Yk1ZREFyaEIvS2liRTd4b0haTXNHUVJncnFCSG0xZ1E4MExFNzFUbXVJN1B3?=
 =?gb2312?B?VDJqWEY2b2JIMU0rU1dPU0Q3Y0ZwL05kSUEwZ2FISVZXRUJIVHd3VThGVExS?=
 =?gb2312?B?MkdWcUR3YjljNVhpamRQUTNocjcxbzQrbFNPb3IrbGhPNFJSeHRGS1AydjJ1?=
 =?gb2312?B?ays1emZKeW8rSXNHajVjMGcvd0hSTTNhdkZuZWNCaFp5UGpJVzFickZTMTE1?=
 =?gb2312?B?SWZJSkxyYndVbHZ1VmlOdC9aNzJKTU5vaXpXVHQ0TnU5TDk4M1hsTC9zZ1Vi?=
 =?gb2312?B?a3V6eTJhTXZOOXhIQ3d1RkdSaHNWRjdHdy9BRmwwczJsWXNCYlZVTUE1M2ov?=
 =?gb2312?B?MGhvN1MzZllsUlRXYjNESjM1akx2ZlFMaVMvWEdhQkY2dW5maEhsT2NiYkRp?=
 =?gb2312?B?bnk2OGgvd1kzbGQ3ckhEejhUd2wzNlZGbzQwZ3lWYkcrWCt2U05WZUR0dGlp?=
 =?gb2312?B?d053eEdmQ1IveGYyOFM5MWRJc2hCUnpjVGI3emh2eFVJcU5xalJzMkxqSGdW?=
 =?gb2312?B?ajAwMjZVYmNZc2pXV09XWGxJb25hOVhkeUJIVUpqeExlUkxUZVY5UzBMamZ2?=
 =?gb2312?B?WDI4UWc1UXk2RkVpQ0Rob2NZaWIxQkdjV3N6V1podUhuaUNXaXFrZzNvZWRY?=
 =?gb2312?B?SUdRSGdheGVLSVZrVUxnV1lJTWFGOHJZNDBSV2VmU0JKTjJhMU5xVWdZc1cr?=
 =?gb2312?B?enhCVFJWZlRhZThEbjVjZ2s2aVdZVUkvaGcvVVlSM0Jya1VWTGF4UEVlaEdq?=
 =?gb2312?B?S2ZGTDU0RUEzQmZYV2NnWnJ4RGN3YkQyVC93aGVTbE1wY2JKMkM4S0NoeHNU?=
 =?gb2312?B?SGZGSDNIb0ZpK3hPckl3OG5mU21tclo0Nk5mMXlESHQ3TXcyRFJWeWFFanpM?=
 =?gb2312?B?Z2NTNHRXV1h3MWNwalFvTlpOSmx2N3Nkbm9jNXF5V1dMMkNscmFvejdxQTNN?=
 =?gb2312?B?V011bThodmpKZ01STCsvS09CdGJmTWJ0U21Wdnl6WW9VZ0toNWpsd2VaWFBo?=
 =?gb2312?B?SlBHV2lyWkhRMXZ0WnNhY29iR2V2ZEFPaGpXeHNhQTRhcFMrQlFnTmdPR095?=
 =?gb2312?B?Ni9NQ1JidWZuS1QwdXVicC8zQXZ6S0ZjZGhraG1oMW1VV1pjajBGcjJNaFhK?=
 =?gb2312?B?MEJFcTgvSS92Y0FUOUNrMjZTVHhqWlpINHFENmtqM1dnZ28zaW50UDZZWGFx?=
 =?gb2312?B?a2kybGlvVEdoM1U5L25XQTJKMzI1ZU5UT2RkbWY5YnR2bEJzbHJ5R1ZFNXpt?=
 =?gb2312?B?OFB3YmY4OUFpUFl1dWpGamc1QVNMVFUzTnhlR0UvTnpZdXcwNnpvc3BoejZL?=
 =?gb2312?B?Z25LK3kydnR4ZWsya1FLQTduRkpQb2gxd3c2ZisyZ0krVTZSK3dLUVBQbnpk?=
 =?gb2312?B?NUdvSE81SWNkL2FWUzFidDVnbTljRndVcU95YXZwcEY1M2YyeDFwR1FEd2NM?=
 =?gb2312?B?ZmFMbVM2TEJ2UTZVQVFPNVdteE9YUzhaNHVyZUZqclBFM0hvcWg3cEVlRXBk?=
 =?gb2312?B?VDBxa1FTRmp0NW1vY0FpWERxS0Vha2tvMGRHcGxlT1BCcDFtVmowUEJNWXgw?=
 =?gb2312?B?NU1jUGpJZUt6cnpZVDVSZFVobjBibzJEVFFBc3lSTE12Q29qQVNEeFNqTnhU?=
 =?gb2312?B?RU4vSmFQWi9xWjFsSWxMaWlQcnYyaXhpeFVFV3ROWlZmWkgvQTROMG0vMFZU?=
 =?gb2312?B?cVZGcit6QWg5TGNTekxVQ1lmYkxxZk5vb3lGcmZsQzllL244dEdUd0VSOGR0?=
 =?gb2312?B?WExpSXd3YXNjOFJEMnpISTJsdjQ3WWVEVzNYZjZGZURUNzNTK09zRVd4QXA1?=
 =?gb2312?B?MlBnTlpLRFJKUHorYzF0UVVRTnh3a0tCSVBDMTcrNzY0dVE5dm5FMzJqbkxU?=
 =?gb2312?B?aGp3OEpHTGJpZFExblVVblllSUxZcG9kTDcrTlNheG9ZUTRXS1JwUWNKZFJk?=
 =?gb2312?B?azBPRWtwdkY4TWtVTGlIaVpsM08vQVdsakF1QUEwUThwSEhkK1pkcVJ0WEt4?=
 =?gb2312?B?NDJXOFJPR2VjY0hOeFR1YzZoVm9mbG9mS2g3NFN6UXdvUDdNOHJWeWtoZEYv?=
 =?gb2312?B?ZE9TbXBNWm10UlpZRnVlSFI1aVFMbW5keXg5ZUNWc1V5V2RrZVJBcFdlRlFG?=
 =?gb2312?Q?dDl6cQBtXBF/Xn5RrVq6OL0IL?=
Content-Type: multipart/alternative;
	boundary="_000_OSRPR01MB11597E2995D5DD5B55A24F5769B39AOSRPR01MB11597jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Nc2WxnmxFR5lLkO7CwtFgZNbjTZyxolEyz+6U5o0C0uRR2Bx5DdOvhQp3oEzU12CJ3YwZeiw4V32V4PU2c46ScUxhbsAPnUfqd3LvH0FzEWZSxQDDskdeRRAt/gyKb1cywrwAEXvv83qhibeMm4HhgAIa56zW4ZI0/6V/m0sip2TzYHsBw4Op5wy9QX5OvYHJVQV83BbKEAPHnm6lMCPs+ssdVxuYkI21mbo2AqUnf7FBMWqBIG+QBIs8LjvFo9SWw8j4Y+eIMROmUbEGPtBHy56g0Sge06uAL07jrs6iqjtjL5Y667AkUCKj+SpFg2V+QwDfj2uE3Mmz+9PWYUk/KpZHofpwWmQ2+kPLPOAVJtz/yBiKtrrQuiyhMVGgfuPvnINdU3XGAB0MHjXVz7JRRRLGcJt+x6wFApADnWsoQt1bUVJoecDEslCriTv5U4t3Fkv00K3+hfj64nSJjp0m9Z68lvWJleffrZ/yOdKRTYl3liDijd7e/dRU6ZukZRm2HJSkan4XDugt4HIwwY5ObIR+fP491pQHiGBavhwjLcfRXV1O+ob3ahJsEPRJqSQmdd4SuAqhZv4o1jMmv++JwcX03cp9nI62zcIo30pmX8VjKEMilKxa/RgJaF/FtKI
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842e61d2-3893-4b72-46a6-08dde4866778
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 09:53:26.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+5sG06Kc1EbS5Yh2uCHIkJukRbySNAAU9xAzp+W9uOc1OF6NgO7Hkhk0a+vbx8QqSa87eYYPH9LEVkhu0zRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8591
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 09:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119114

--_000_OSRPR01MB11597E2995D5DD5B55A24F5769B39AOSRPR01MB11597jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQpPdXIgdGVhbSBmb3VuZCBzbWJjbGllbnQgaGFuZ3MgaW4gaW50ZXJhY3RpdmUg
bW9kZSBhZnRlciByZWFkbGluZTogOC4yLjEzIC0+IDguMw0KDQpXaGVuIGRvd25ncmFkZSByZWFk
bGluZSB0byBvbGRlciA6IDguMi4xMywgZXZlcnl0aGluZyB3b3JrcyBmaW5lLg0KDQpIZXJlIKGw
aGFuZ6GxIG1lYW5zIKGwdGVybWluYWwgYWNjZXB0cyBubyBpbnB1dCBhZnRlciBsb2dpbqGxDQoN
ClJlcHJvZHVjZSBzdGVwczoNCg0KICAxLiAgQWRkIHNhbWJhIHRvIGNvcmUtaW1hZ2UtbWluaW1h
bA0KDQoNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2ltYWdlcy9jb3JlLWltYWdl
LW1pbmltYWwuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29yZS1pbWFnZS1taW5pbWFs
LmJiDQoNCmluZGV4IDg0MzQzYWRjZDguLjY2MWQ2Y2E5MDQgMTAwNjQ0DQoNCi0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2ltYWdlcy9jb3JlLWltYWdlLW1pbmltYWwuYmINCg0KKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtbWluaW1hbC5iYg0KDQpAQCAtMSw2ICsxLDcg
QEANCg0KU1VNTUFSWSA9ICJBIHNtYWxsIGltYWdlIGp1c3QgY2FwYWJsZSBvZiBhbGxvd2luZyBh
IGRldmljZSB0byBib290LiINCg0KDQoNCi1JTUFHRV9JTlNUQUxMID0gInBhY2thZ2Vncm91cC1j
b3JlLWJvb3QgJHtDT1JFX0lNQUdFX0VYVFJBX0lOU1RBTEx9Ig0KDQorSU1BR0VfSU5TVEFMTCA9
ICJwYWNrYWdlZ3JvdXAtY29yZS1ib290ICR7Q09SRV9JTUFHRV9FWFRSQV9JTlNUQUxMfSBzYW1i
YaGwDQoNCg0KDQogIDEuICAkIHJ1bnFlbXUgY29yZS1pbWFnZS1taW5pbWFsIHNuYXBzaG90IG5v
Z3JhcGhpYw0KICAyLiAgJCBjYXQgL2V0Yy9zYW1iYS9zbWIuY29uZg0KDQpbZ2xvYmFsXQ0KDQog
ICB3b3JrZ3JvdXAgPSBNWUdST1VQDQoNCiAgIHNlcnZlciBzdHJpbmcgPSBTYW1iYSBTZXJ2ZXIN
Cg0KICAgc2VjdXJpdHkgPSB1c2VyDQoNCiAgIGhvc3RzIGFsbG93ID0gMTkyLjE2OC4yLjE2DQoN
CiAgIGxvYWQgcHJpbnRlcnMgPSB5ZXMNCg0KICAgbG9nIGZpbGUgPSAvdmFyL2xvZy9zYW1iYS9s
b2cuJW0NCg0KICAgbWF4IGxvZyBzaXplID0gNTANCg0KICAgaW50ZXJmYWNlcyA9IGxvY2FsaG9z
dA0KDQogICBkbnMgcHJveHkgPSBubw0KDQoNCg0KW3Rlc3RdDQoNCiAgIGNvbW1lbnQgPSBzYW1i
YSBzZXJ2ZXINCg0KICAgcGF0aCA9IC9ob21lL3Rlc3Qvc2FtYmENCg0KICAgd3JpdGFibGUgPSB5
ZXMNCg0KICAgYnJvd3NlYWJsZSA9IHllcw0KDQogICBndWVzdCBvayA9IHllcw0KDQogICBwdWJs
aWMgPSB5ZXMNCg0KICAxLiAgc3lzdGVtY3RsIHJlc3RhcnQgc21iDQogIDIuICByb290ICMgc21i
Y2xpZW50IC8vMTkyLjE2OC4yLjE2L3Rlc3QgLU4NCiAgICAgICBUcnkgImhlbHAiIHRvIGdldCBh
IGxpc3Qgb2YgcG9zc2libGUgY29tbWFuZHMuDQogICAgICBzbWI6IFw+DQoNClRoZSBjdXJyZW50
IFNhbWJhIHZlcnNpb24gYXBwZWFycyB0byBoYXZlIGNvbXBhdGliaWxpdHkgaXNzdWVzIHdpdGgg
dGhlIG5ld2VyIHJlYWRsaW5lIGxpYnJhcnkuDQpIb3dldmVyLCB1cGdyYWRpbmcgdG8gdGhlIGxh
dGVzdCBzdGFibGUgcmVsZWFzZSAoNC4yMi40KSBpbnRyb2R1Y2VkIG11bHRpcGxlIGJ1aWxkIGVy
cm9ycyB0aGF0IGFyZSBiZXlvbmQgbXkgY3VycmVudCB0cm91Ymxlc2hvb3Rpbmcgc2NvcGUuDQoN
CkknbSByZWFjaGluZyBvdXQgdG8gdGhlIGNvbW11bml0eSBmb3IgYXNzaXN0YW5jZS4gRG9lcyBh
bnlvbmUgaGF2ZSBwcm92ZW4gc29sdXRpb25zIG9yIHdvcmthcm91bmRzIGZvciB0aGlzIGlzc3Vl
Pw0KDQoNCkxpdSBZaWRpbmcNCg0KDQoNCg0K

--_000_OSRPR01MB11597E2995D5DD5B55A24F5769B39AOSRPR01MB11597jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:=B5=C8=CF=DF;
	mso-ligatures:standardcontextual;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:=B5=C8=CF=DF;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1185556874;
	mso-list-type:hybrid;
	mso-list-template-ids:-1173713328 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our team found smbclient hangs in interactive mode a=
fter readline: 8.2.13 -&gt; 8.3<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When downgrade readline to older : 8.2.13, everythin=
g works fine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here =A1=B0hang=A1=B1 means =A1=B0terminal accepts n=
o input after login=A1=B1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Reproduce steps:<o:p></o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">Add samba to core-image-minimal<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph">diff --git a/meta/recipes-core/images/core-im=
age-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb<o:p></o:p><=
/p>
<p class=3D"MsoListParagraph">index 84343adcd8..661d6ca904 100644<o:p></o:p=
></p>
<p class=3D"MsoListParagraph">--- a/meta/recipes-core/images/core-image-min=
imal.bb<o:p></o:p></p>
<p class=3D"MsoListParagraph">+++ b/meta/recipes-core/images/core-image-min=
imal.bb<o:p></o:p></p>
<p class=3D"MsoListParagraph">@@ -1,6 +1,7 @@<o:p></o:p></p>
<p class=3D"MsoListParagraph">SUMMARY =3D &quot;A small image just capable =
of allowing a device to boot.&quot;<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph">-IMAGE_INSTALL =3D &quot;packagegroup-core-bo=
ot ${CORE_IMAGE_EXTRA_INSTALL}&quot;<o:p></o:p></p>
<p class=3D"MsoListParagraph">+IMAGE_INSTALL =3D &quot;packagegroup-core-bo=
ot ${CORE_IMAGE_EXTRA_INSTALL} samba=A1=B0<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">$ runqemu core-image-minimal snapshot nographic<o:p></o:p></li><li cl=
ass=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1">=
$ cat /etc/samba/smb.conf<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">[global]<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; workgroup =3D MYGROUP<o:p></o:p>=
</p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; server string =3D Samba Server<o=
:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; security =3D user<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; hosts allow =3D 192.168.2.16<o:p=
></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; load printers =3D yes<o:p></o:p>=
</p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; log file =3D /var/log/samba/log.=
%m<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; max log size =3D 50<o:p></o:p></=
p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; interfaces =3D localhost<o:p></o=
:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; dns proxy =3D no<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph">[test]<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; comment =3D samba server<o:p></o=
:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; path =3D /home/test/samba<o:p></=
o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; writable =3D yes<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; browseable =3D yes<o:p></o:p></p=
>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; guest ok =3D yes<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp; public =3D yes<o:p></o:p></p>
<ol style=3D"margin-top:0cm" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">systemctl restart smb<o:p></o:p></li><li class=3D"MsoListParagraph" s=
tyle=3D"margin-left:0cm;mso-list:l0 level1 lfo1">root # smbclient //192.168=
.2.16/test -N<o:p></o:p></li></ol>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Try &quot;help&=
quot; to get a list of possible commands.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb: \&gt;<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt">The current Samba versi=
on appears to have compatibility issues with the newer readline library.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt">However, upgrading to t=
he latest stable release (4.22.4) introduced multiple build errors that are=
 beyond my current troubleshooting scope.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt">I'm reaching out to the=
 community for assistance. Does anyone have proven solutions or workarounds=
 for this issue?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt">Liu Yiding<o:p></o:p></=
p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_OSRPR01MB11597E2995D5DD5B55A24F5769B39AOSRPR01MB11597jp_--

