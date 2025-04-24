Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38335C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:08:32 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.109])
 by mx.groups.io with SMTP id smtpd.web10.9479.1745478501285132704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=ZON6ZV7m;
 spf=pass (domain: phytec.de, ip: 40.107.105.109, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v96KCfzONSfRBEH7W/jMvQVISCxaYXlaNPNL9XAq/fu5q3SbhESdR05dMTh3xz8d7z6KMpF8ZpO4vkyzs02Ancr0OcPWG+iIuB1fd2egusi5sobp26npPU9MEdIXNhBkKuJzaoXUX002aIDyMjyMkAPAizq+z3OJuSOiHiFjXS4tkV4dtDGnhAjiKstkl3iX5yjPtTeuhSFMRGvYXgjX1FLNqpMxHedHC9IB4q0jSYpskUj3Jb6PkyCKcJOqJ8tWKTgUflh8Kb9eYC80biKsFcH8tSrMNmg/lkhiK6vSv4a2knSnELcR0nKyM4dI5y5QYDYbyQXOvhUf7UuS/F/7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl3mBe/HQST/1XF+08g4sSyWhEqG+uBrqVYFLLAETmQ=;
 b=Sb5/kckfF+6KwPmOXKncR+2thbDie+9/aiMkonulhZeQNAnSxC9AnodWhExYqpWq1H4icVIs3f3mEVys7UgRKEsFJFYdeBf/YrueemfqbOczgEzsKBcFaPnA5/+hGsvCsnwWkeucRBkdA7N5wlTaP1Y9l5qjGbTCGzw0N6HmeDok14KVGqxZjVynZMCt2/C85ydykOCcsTIzdEwrJZZL6kcgtYpDlkp0c0J3QqHBU+kIp4SxwmTzfh8A2lP5zzxemaCEU0JWuEvauwmHLrkGZjDrmshwxQlEF0oSrW58ldIwu8Iu4iE2QrryLuQ/ySPJQixOl1whAeTSNuPClhnGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl3mBe/HQST/1XF+08g4sSyWhEqG+uBrqVYFLLAETmQ=;
 b=ZON6ZV7mqhNsrbMMoMsbp93GFG6gVh3U0lx9j9jyrRYlG/VfknZRwILJrYDoiz9PF+niuJYCY93aWiDARurMbNeD7nFdijatPce49t/Bclg6u0s3nPMNyCK1zJjYqVwHdKfdxTngMO65oJNDk+48E+UfaahPwP1FBcfw+TXd77XmH8Qn85apSICWUqhGggl+j3PZsFK8VQpGxNGEknONKNiUaxlRWvXfDgvskx7XWTr3cNV8YZzguYfFvzMmQCBH2l5V2u89/TW/a7uArQn0fEF91eMmN25mBi8p4U1rgCXp+x7USNv4z6w592o1nmueQgjbG87okpTRUdR7gKd0fw==
Received: from DU0P195MB2174.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:473::19)
 by DB4P195MB1947.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:38c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 07:08:15 +0000
Received: from DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
 ([fe80::4d14:78aa:6a04:d38c]) by DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
 ([fe80::4d14:78aa:6a04:d38c%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 07:08:15 +0000
From: Leonard Anderweit <L.Anderweit@phytec.de>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
	"Haixiao.Yan.CN@windriver.com" <Haixiao.Yan.CN@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] lmsensors: Clean stale files for sensord to
 avoid incorrect GCC header dependencies
Thread-Topic: [oe] [meta-oe][PATCH] lmsensors: Clean stale files for sensord
 to avoid incorrect GCC header dependencies
Thread-Index: AQHbqfiOW1e3VNC7XkmKSgz3D7nWPbOxRyuAgAAz1QCAAQBZAA==
Date: Thu, 24 Apr 2025 07:08:15 +0000
Message-ID: <485f226ed8200d8b23d82511afd1f6a0c3852003.camel@phytec.de>
References: <20250410091111.82723-1-haixiao.yan.cn@eng.windriver.com>
	 <cb93a647c71cec139811b2d87d69782b9900309a.camel@phytec.de>
	 <CAMKF1spfzi+gf=X31UUeMN8cCJOtQLsX1mibfXZ8HAX2CsMNTA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spfzi+gf=X31UUeMN8cCJOtQLsX1mibfXZ8HAX2CsMNTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2174:EE_|DB4P195MB1947:EE_
x-ms-office365-filtering-correlation-id: 1885a358-ec09-4204-fd1e-08dd82fec89e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?R2tJZG9DMTFjOWVTcGIxaG1WN3lVWDk2SDZRdmJjN2tsL3dXeHpZYnAzZ3I4?=
 =?utf-8?B?SlF0N1l0bHZCZ01nSytML2NBOTlzRkd1VHp2R1JFKzh0djRWWW1lY2JFNzFR?=
 =?utf-8?B?bFduMUVzWlNFOWxESUdPbE9zcThLK1VnTHdreXZJV2x1SVJMMU1sWk12Y3dS?=
 =?utf-8?B?S0R4WGpGYTA5Rk4yd2V1SzlLM0tFTTdsRnZrQ3BFa1pkUzlWYm5URExRYUY2?=
 =?utf-8?B?R05VbmpKR3BGcnlGWCtOVWJVaXNRMU96SHYvck85aVZqM2hYMDBkSzE1KzJa?=
 =?utf-8?B?R3p5K0pOR1ZXZzU1UnpOSCsxQloreGpDZ081b2U4b1pjYWIwc3dXdzZJWEMv?=
 =?utf-8?B?MUk3L1NVQkFMdndlZFJaeGpNLzErdW81TnQyekFIZFVORWxRYkdTWHloU0FT?=
 =?utf-8?B?OFRkcHJ4d1BkcjB4TGFpeUNlblpKdVVVQ3ZUdmxGcWJVQjBKY1lZV3FDejZ4?=
 =?utf-8?B?dDg4SjE3dXVhbVNqZ3VjME0rMU5DNkZVcFlScG5CandzK3lFbTE5NDBMZ1ps?=
 =?utf-8?B?WmR5Qks0a2NBWHVVS1MyaXd4bkxsOEtOUFUwOEtFWDcvdWV1NzVwZlhYTFVN?=
 =?utf-8?B?Zm5hdUxVd0svZlNkMUpMRG0rSFFhUm9VMEp6QjdBVFVjYWZON3RROThiV0NY?=
 =?utf-8?B?Mkg3RWtWTHBLVWFBVGttUDRPclhncGpiM2tDRVR3d2tXTkhpenpoU2M0YVRD?=
 =?utf-8?B?Mjh6d0psZjhwTXBHcTk1U0pzeHVrNEEwMzJQQitEZERnREl6THozNHFEUzQz?=
 =?utf-8?B?d09PVkU0QnpEVkRIWXBKQTBveUd1cXE5eE1tdHFRbmJia0xPcjV0MVVLZCtF?=
 =?utf-8?B?UWE1YU5VTjN6QzgzVUNYV0hrZDExa2hUeFJhdThzUHRGYjlJL3p5dDd5YzVW?=
 =?utf-8?B?OE54U2k5NUwxTkZuSEQwQmRxQkcrS3o5clIzV2Y5WEFheGZtNHYySmc2MnF5?=
 =?utf-8?B?V1MyOTluVkZHRHUyVkVjOHJmMGlsSnFqWUNsOVRNN28vSXJwZURUZURKRnVL?=
 =?utf-8?B?bUdKNG5MbTcwKzVhTkV6K3d1NDN0Rm4wZ2NyZnl0OTRUQURIVi9NQjVaWG5D?=
 =?utf-8?B?UnQ4ai9OTnZzK0pjKzdEZzJoOG13RDNmZXROOXhJYnVzbVdUc2ZNNi9XbEZQ?=
 =?utf-8?B?U2xiSXowZWkvenZzMkRtZHdzYTBvdFQzL1hJRVdxTElIdmJTMzY1c0JNbmJr?=
 =?utf-8?B?bXlGTDU5SzIwcEZvbUoyKzZnQ2dDVk1oRG52S3RRTS9TcnVxSElPNTI3SVVH?=
 =?utf-8?B?MVdkMGdYVStPcGI4NHhCZE1oclZNMmNpOHFDTmZuTzQ1ZmpHSXhVcC9oMWxl?=
 =?utf-8?B?MWZkdUJweGpWOUphcGh5Y3d6ZGdmWExrbDExRHhVeUpmM0RlSXFxejRQY1Z6?=
 =?utf-8?B?Sk45R04yaWVxKytMY1Z5cCtnQUVqR2R0bEtvTHZFTnlJU1puODJ3WFZPQkMx?=
 =?utf-8?B?RCsxeU13K25kcFJTa01ydktKc2lJQ0xjK0orQjlRUUVVTDZKVW9mZkQzMzJC?=
 =?utf-8?B?QkRyRmd5WlpaSU42c0gzd3BnYWV3OWZrREJBc2YvTzQ4TU9mR0xWZXpKWTUz?=
 =?utf-8?B?cWhUVGxWUm96b2xpRG5zbVRCTHVHWDlnYVZ1OTBuU2t5eWNiaTBFK3Z2OS9Q?=
 =?utf-8?B?VUFDT0tFMk5peU5BMnd3STRyU0g2WS9DTzVSSHhLSnFYNE1yTHk5SFBBb1V1?=
 =?utf-8?B?Z2gveVB3ZW02TkhlQXFnRnJrUG5xank2QlFLNkYzYlBSKzBUcmNtZWFYREJ3?=
 =?utf-8?B?UWY3ajhONlJabGhnSnV1OC84MGlMZWNCWXRVRVI2VlJyaEJRTXlaMC9VTTZM?=
 =?utf-8?B?NnJZUmVPS0cwbElGQTlZUTBsWmJJcHFKa3Y0NElmNWVsc2tLLzI1SXBvNmZ5?=
 =?utf-8?B?TUY5aWQ1TGhPamlVak9mS1dycktxc0xEaTd6S0N4K1lYSlI4U0ZCQnpzV1Zy?=
 =?utf-8?Q?7W77K8nkCfQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2174.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Uk44b1ZEaG5HdDFidCtUNWV2aTVTU1BVQnFvbGlkNTdNb1ZSNVcwbUlBUEpu?=
 =?utf-8?B?OEJteHNpTTFCVEhiOE1Meml1dE5GSXZuaVdyZ082NmtEa2hkYnRLOTZWTVE1?=
 =?utf-8?B?UFJKZHIyLzhVdXRQdzNvaGtSaFluUXJ3VVFNN08vOW51bCtmYk9SdXExOTZF?=
 =?utf-8?B?RjZUTERJVDdkSkg1WkY5V3J4YVoyTGZEdjBSbDZSZ2U2REgyMWpHWmFOWnpn?=
 =?utf-8?B?UkRmNnF2Mk5VL1dhdlFyTUFIZDUzUEdJTUx5R1A3SDh0NzFvQjRqQjgrcmRh?=
 =?utf-8?B?MXRhUVc4UURJaXVXR0oweDhyVCtQOVR6YzhtZFB4RlZ6WStxMk02REI1UTRS?=
 =?utf-8?B?Z2VXNWt5Wll2ZUQ2ajZxTXNWeFV6cjVHdHZJQ3Q4OHowTGFmK0RjUVE3bjg5?=
 =?utf-8?B?WGpTT01IemRlcmVEZFRDUUtwWWdiV0NFaTFnZm9jeEFFNy84TDZtcjlTTEg3?=
 =?utf-8?B?RjdzakREQzNRMlAyQjhzZElqYnlwWXRFYXlLbmRBVHBNejVmY0tCM1VkWFNj?=
 =?utf-8?B?WnpEUFhmcGgvK0IyQjk1dXNvSkFYWmRlYUlUZ3QxdFJOWVl6OWROWGFCZHFJ?=
 =?utf-8?B?UkhpYUU1aTFySGZScStSUXJPL0dNcXlHb3dmcUJydzZHZDZBSjdiU2V5R1NE?=
 =?utf-8?B?UkRLdFZVUG1ScExWaDBFQTNxVklieTNESWFIOFVmZVNlbXdPU1NGb0x4NnBD?=
 =?utf-8?B?R3RhV3lJdk9NdkdRTUFrOEVXVFlEMVJNNGVOaVp1Ukk5d0pwNXZBci9oSTRz?=
 =?utf-8?B?TCtkalBqNDFFNDB4NU5qNjcrT3pnN3l0bzl5MVhFbmR5WEhxQUwyNjRRT3hO?=
 =?utf-8?B?RlBqWlpCUm5pVmFqK1g0OWxyZWo4dXczN3plMzNueC9iYWgrdDhyVFpJS0dJ?=
 =?utf-8?B?Wk10YTRLR3JyK2x5bUVOalEvYlBiZGFnU2xkTWNZZVhRbXgwNXBBN25uWDRw?=
 =?utf-8?B?NVk0SDBBUFZ4MmU3NHU3Sm9ZcVplcUNGNGswN0hlYlE5Y0VjSzdUYUdXS29Z?=
 =?utf-8?B?TDVQVGVhVUZkN3NiRk53d1Z0SDQ0d0h6cWNUV0F0MmJ6NCtOREJFQ1NGWVlT?=
 =?utf-8?B?N2dTYmFoVHJIWVR5WFo4d01URWMrVWJ4UEtXamliblpmYUNRWnpkcnRUNU9X?=
 =?utf-8?B?aXBUYzNPamtreWZyRkNtV21mb29WVDhDY3NKT1VQWWRBd1d1MXpLUDRrdVp5?=
 =?utf-8?B?SVcwY3VmQTRGbGQxWXRJU04wTEhtaWh3dFQvOEtpOE0rSXlaMEZIblczT0Zh?=
 =?utf-8?B?SDZELzB1UE9tVm1pR1FWb1BlcXgwTXdYNEczT0lyMG5OT2hGK1lYR3NQand0?=
 =?utf-8?B?MXRmL1hGekFzT2FGWmQ4VFJwcFBYb09WaUcydWtMU1kzS0ZQYVMrcG1SeTMv?=
 =?utf-8?B?N1pMK0lYMmRVQXJNRkU1YStrR2QvMGNFQy9mVVVZWmlLVG91Y2RkckMxVXNz?=
 =?utf-8?B?S0NHVWlBTjBOdkJCcklpS1kxdWdSdDNvbzJmK1lIRW5nWGdwM2ZCMU9TVEdJ?=
 =?utf-8?B?NWdEWGtCZ0RvS0pYTjUrSzFuSy9YSkd3Y0ZjTjJpVkNIYS9QRVovT0FmU1hK?=
 =?utf-8?B?b2hNd1lNY3ZESlJXdyttOXlrVUJGYUdidmx6SnhnRGR4VWx4dnVxOHVGaVNt?=
 =?utf-8?B?MjBja0NWaDV1OGwzNGIvU0FxQWpNU2Q3cnNBczZ1T29PTTE3cTZCRVFLNFBr?=
 =?utf-8?B?TVAxYzlkSHM1Ukw2amFPZFdJVVZJR0hXYWdueGFuQlRZTm00ZHdWeUliMmFp?=
 =?utf-8?B?TUh6RVUwNGROZzAwNjQ3bWpjejhHbysrV0hvc2VqZ0FiUXZpNDFLNnRvZkx4?=
 =?utf-8?B?eWFnZWpkVTdsQzcwcTBoU0Z1aXdCbkU1VEFQV29JRnp6UlZiVG5PRk1lWGgr?=
 =?utf-8?B?SXdTZGZPYlBsbi9mU1FOK3ZzNG5iT2ZsSG85d3QvOCsrVjMyOEQ1dWZZUWtj?=
 =?utf-8?B?SktVRk5rNGpkQzA5aFBoa3NJU1VBTzY2a1hzOS8xdko2MTlMMFBoOE14VDZR?=
 =?utf-8?B?VVduY0hwQlNpUlVmTU80dU1PbVpOckh3S2lvdm5KU3NqNFZKNjRkUHNuVUZ0?=
 =?utf-8?B?NVpMU2tWbVNDS2t3SFlQejgyNFBLT0VJYU5XM2Zud2RRdGx0N0kyTDdYdXN2?=
 =?utf-8?B?emlyekIvUENicDBBTnYyaGl1S1NmS2dncEE0MXpDL1NKb1hJZGJCa3Ava3Jr?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FE57A171E82134B86A2CA486DD319BE@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1885a358-ec09-4204-fd1e-08dd82fec89e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 07:08:15.5596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jS2rx/NZfte7TL7NiAHmWoVRvqzxxoka2MHeCW6nOULN/dU53typU+64AnrBN6eigPKglTLWiSWCKU7k4kXPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1947
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 07:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117087

QW0gTWl0dHdvY2gsIGRlbSAyMy4wNC4yMDI1IHVtIDA4OjUwIC0wNzAwIHNjaHJpZWIgS2hlbSBS
YWo6DQo+IE9uIFdlZCwgQXByIDIzLCAyMDI1IGF0IDU6NDXigK9BTSBMZW9uYXJkIEFuZGVyd2Vp
dCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8TC5BbmRlcndlaXQ9cGh5dGVjLmRlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IEhpLA0KPiA+IA0KPiA+
IHRoZSBidWlsZCBvZiBsbXNlbnNvcnMgZmFpbHMgdGhpcyBwYXRjaCBhcHBsaWVkIGFuZCBQQUNL
QUdFQ09ORklHID0NCj4gPiAiIi4NCj4gPiBJJ3ZlIGF0dGFjaGVkIHRoZSBkb19pbnN0YWxsIGxv
ZyB3aXRoIHRoZSBlcnJvci4NCj4gPiBUaGUgcHJvYmxlbSBvY2N1cnMgb24gbWFzdGVyIGFuZCBz
Y2FydGhnYXAuDQo+ID4gDQo+ID4gQSBwb3NzaWJsZSBzb2x1dGlvbiBpczoNCj4gPiANCj4gPiBk
b19pbnN0YWxsKCkgew0KPiA+IC3CoMKgwqAgb2VfcnVubWFrZSB1c2VyX2luc3RhbGwgREVTVERJ
Uj0ke0R9DQo+ID4gK8KgwqDCoCBvZV9ydW5tYWtlIHVzZXJfaW5zdGFsbCBERVNURElSPSR7RH0g
UFJPR19FWFRSQT0ic2Vuc29ycw0KPiA+ICR7UEFDS0FHRUNPTkZJR19DT05GQVJHU30iDQo+ID4g
DQo+IA0KPiBzaW5jZSB3ZSBhcmUgZG9pbmcgc2FtZSBjbWQgaW4gZG9fY29tcGlsZSBhcyB3ZWxs
IHBlcmhhcHMgaXQgbWlnaHQgYmUNCj4gYmV0dGVyIHRvIGFkZCBpdCB2aWENCj4gRVhUUkFfT0VN
QUtFIHNvIGl0IGNhbiBiZSB0aGVuIHVzZWQgaW4gYm90aCBwbGFjZXMgYXV0b21hdGljYWxseQ0K
DQpJJ2xsIHRyeSB0aGF0IGFuZCBzZW5kIGEgcGF0Y2guDQo+IA0KPiA+IExlb25hcmQNCj4gPiAN
Cj4gPiBBbSBEb25uZXJzdGFnLCBkZW0gMTAuMDQuMjAyNSB1bSAxNzoxMSArMDgwMCBzY2hyaWVi
IFlhbiwgSGFpeGlhbw0KPiA+IChDTikNCj4gPiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZzoN
Cj4gPiA+IEZyb206IEhhaXhpYW8gWWFuIDxoYWl4aWFvLnlhbi5jbkB3aW5kcml2ZXIuY29tPg0K
PiA+ID4gDQo+ID4gPiBBZnRlciB1cGdyYWRpbmcgR0ND4oCUZm9yIGV4YW1wbGUsIGZyb20gMTQu
MS4wIHRvIDE0LjIuMOKAlGJ1aWxkaW5nDQo+ID4gPiBsbXNlbnNvcnMgdGhhdA0KPiA+ID4gd2Fz
IHByZXZpb3VzbHkgY29tcGlsZWQgd2l0aCBHQ0MgMTQuMS4wIG1heSBmYWlsIHdpdGggYW4gZXJy
b3INCj4gPiA+IGxpa2U6DQo+ID4gPiBsbXNlbnNvcnMvMy42LjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3Vzci9saWIveDg2XzY0LXdycy0NCj4gPiA+IGxpbnV4L2djYy94ODZfNjQtd3JzLWxpbnV4
Lw0KPiA+ID4gMTQuMS4wL2luY2x1ZGUvc3RkZGVmLmggY2FuJ3QgZmluZCwgd2hpY2ggaXMgbmVl
ZGVkIGJ5DQo+ID4gPiAncHJvZy9zZW5zb3JkL2FyZ3MucmQnLg0KPiA+ID4gDQo+ID4gPiBUaGlz
IG9jY3VycyBiZWNhdXNlIHByb2cvc2Vuc29yZC9hcmdzLnJkIHN0aWxsIHJlZmVyZW5jZXMgc3Rh
bGUNCj4gPiA+IGhlYWRlcnMgZnJvbSB0aGUNCj4gPiA+IG9sZGVyIEdDQyB2ZXJzaW9uLg0KPiA+
ID4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBzdGFsZSAqLnJkIGFuZCAqLnJvIGZpbGVzIHVuZGVy
DQo+ID4gPiBwcm9nL3NlbnNvcmQNCj4gPiA+IGFyZSBub3QNCj4gPiA+IHByb3Blcmx5IGNsZWFu
ZWQgZHVyaW5nIGRvX2NvbmZpZ3VyZS4gVGhpcyBwYXRjaCBlbnN1cmVzIHRob3NlDQo+ID4gPiBm
aWxlcw0KPiA+ID4gYXJlIHJlbW92ZWQNCj4gPiA+IHRvIHByZXZlbnQgYnJva2VuIGRlcGVuZGVu
Y2llcyB3aGVuIEdDQyBpcyB1cGdyYWRlZC4NCj4gPiA+IEFsc28gcmVtb3ZlIHRoZSBzYW1lIHN0
YXRlbWVudCBpbiBkb19jb21waWxlLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYWl4
aWFvIFlhbiA8aGFpeGlhby55YW4uY25Ad2luZHJpdmVyLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4g
wqBtZXRhLW9lL3JlY2lwZXMtYnNwL2xtX3NlbnNvcnMvbG1zZW5zb3JzXzMuNi4wLmJiIHwgNSAr
KysrLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtYnNwL2xtX3Nl
bnNvcnMvbG1zZW5zb3JzXzMuNi4wLmJiDQo+ID4gPiBiL21ldGEtb2UvcmVjaXBlcy1ic3AvbG1f
c2Vuc29ycy9sbXNlbnNvcnNfMy42LjAuYmINCj4gPiA+IGluZGV4IDA3MDI3MjI1YzU4Yi4uOWIw
NzJkNzBiMjBlIDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWJzcC9sbV9zZW5z
b3JzL2xtc2Vuc29yc18zLjYuMC5iYg0KPiA+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWJzcC9s
bV9zZW5zb3JzL2xtc2Vuc29yc18zLjYuMC5iYg0KPiA+ID4gQEAgLTUxLDggKzUxLDExIEBAIEVY
VFJBX09FTUFLRSA9ICdFWExERkxBR1M9IiR7TERGTEFHU30iIFwNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgTElCRElSPSR7bGliZGlyfSBcDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIENDPSIke0ND
fSIgQVI9IiR7QVJ9IicNCj4gPiA+IA0KPiA+ID4gK2RvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgew0K
PiA+ID4gK8KgwqDCoCBzZWQgLWkgLWUgJ3M6XiNcKFBST0dfRVhUUkFcKTpcMTonICR7U30vTWFr
ZWZpbGUNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiDCoGRvX2NvbXBpbGUoKSB7DQo+ID4gPiAt
wqDCoMKgIHNlZCAtaSAtZSAnczpeIyBcKFBST0dfRVhUUkFcKTpcMTonICR7U30vTWFrZWZpbGUN
Cj4gPiA+IMKgwqDCoMKgICMgUmVzcGVjdCBMREZMQUdTDQo+ID4gPiDCoMKgwqDCoCBzZWQgLWkg
LWUgJ3MvXCQoTElCRElSKSQvXCQoTElCRElSKSBcJChMREZMQUdTKS9nJw0KPiA+ID4gJHtTfS9N
YWtlZmlsZQ0KPiA+ID4gwqDCoMKgwqAgc2VkIC1pIC1lICdzL1wkKExJQlNIU09OQU1FKSAtby8k
KExJQlNIU09OQU1FKSBcJChMREZMQUdTKSAtDQo+ID4gPiBvL2cnDQo+ID4gPiBcDQo+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gDQo+ID4gDQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
Cj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExNzA3Nyk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE3MDc3DQo+ID4gTXV0
ZSBUaGlzIFRvcGljOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTIx
ODgwMDMvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiA+IHJh
ai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IA0KDQo=

