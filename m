Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA86EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:36:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.62])
 by mx.groups.io with SMTP id smtpd.web12.10000.1638956180942002495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=JxdA8JJR;
 spf=pass (domain: outlook.com, ip: 40.92.90.62,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax0+KBRBhfkKUtr1GCvE8iu1RSZN7MkgGRrCC2C7PuSrqBo+MB3UhIpxJzj/THU8MMbQGxjZAi+bXBuDzoSatfyYgIhK5wTxXlu/GuwuyXv+1V2FNIfeJv1JnNUG/jOPNhVCEIHwa7bfagpCe7tXrSOPBt7z/Ui7Wzw81nvf8AyolGjgauEDXvO32O8WkeYvudec17A36BepiEl3jWsx2/qroARQa2wqc5UrwggzzBNUd46vsvnrSy9ZWnhSpp1hE16TnxBo17VBn1WU4GPRlJ4ryBOwFLPNBaIr5wn2EKoLnOM6dMP6F0F8kkMpLXb247A2KxPttA5W9RkOpkWAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN+6qADBRsXOmj3a2aUWrC+Q9OAkT11hskk2b6d0g0Y=;
 b=F480BECMipxspVquobUIKM/3EnRcSHwnYVJqMcEBacqszbgSZIiG5PAISuSRfGSJIYPUq2oQ5wqf8M3HAjuBMv/DtS67PPY8jSJ77Qw+PVm8FTdSSvWRf6RXWEG5eg06uKQCU0x9rRjE6pgHC5IQrpKooABUrObRRJB0FKvUyKShgFEHC/iA2ByWTNMgx+l3kxfdROQjS9qsXseIapkrRKbsGlZ0xWdQXxxE07s4Q6Omm8dPenaB6c1Hj31+q8hqjIlE1wPbN0ReFAuymru2pMioEGpu51MBXELADs76KxVHBQSgzEXJur2QCOTVMQ2qP8j3JQcwz99Njq92pFsG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN+6qADBRsXOmj3a2aUWrC+Q9OAkT11hskk2b6d0g0Y=;
 b=JxdA8JJRwxG+gDJv9PEP3lONYCBxjG15Gb0ixNHYlF2KbRq5GLk//dJE5tNWXiWP8TlQhf1yf0C/eKeSDKhTwKNsnwjg63161bITw3Dg6MXIzGSHEQD/PyNJOWoOqBdVnhOBCcevpdAmsJl5RdX1tSW5sCcXn9N8hs6F1d7wNVUViDEPgiGjyf5SaIWQxC6vbTtJBe+qMiH62+dwQpU4VCrJvkoUojE7cuxgYHmWacR/bzinhmNS9vIlNDfltmwmVXyii44N878p5COn3I+8h2bdM4Bf1Kxf9E0qYRYzW3csj8+Q2k+J9hbgyBOUW2N4eF/MuzvQMtkFMKcJ6Jmrsg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3891.eurprd09.prod.outlook.com (2603:10a6:208:19c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 09:36:17 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 09:36:17 +0000
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
 <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
 <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464246BBC0427BA3BCD348B1A86F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 8 Dec 2021 10:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [ezKwkjslnV0J0AinN022UEP1iR1TQixWAoO1ogSC+TSdeR6n03MoMFpb3ds0VQsS]
X-ClientProxiedBy: AM0PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f720db91-0528-2f32-aaf4-a9abba769d1b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4514bd6-f105-4361-c405-08d9ba2e2f5f
X-MS-TrafficTypeDiagnostic: AM0PR09MB3891:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EOuhqGtyl8aHG1w0s5FgH9IRrHrPTdmxpbBGDmHHUp3/Azc8kTaGS2mAvBd8Zm1Mtt6MkghPY5Ubr1iDZcwS+W0C7+rYimLabKT2L9raT1kpUFF+Z6r6gwmlWpFfohCblevlkbouVgu/tafd0u+YC+FqV4404OoHHUPnrDFlFmNYIcHhZyHxfrmzVD60tVyxQANwz4puE+Ie+j6R8XTHlgqCEflCkc4JUCaKfPBdG/BH2QCJUcPsqKSOyJUdB6L03kfDH9Aw6nGRM/mC21GSQxo83x5Ppf7GvpYOwzSHU8Fue/NGrShgBnnHZTCaTRwnHuxLWmxfm2cnuYL24BuYlSZH+4hGs5f2Exy1h16U7sOdVuigxCfI4MrmJvY/FCTAOiEnFGLJneNIsU6lf2VE8JCS2WF0AoI8m6vZShW8kULOtJPYOBIKvnPXjukQZek7KpwhJFyaXmoLU2SlDuE1hspKQRtszUarncw5RoYUBsbZSAzsc99ogNJq4PpNBkUYkmtxcp+gSE1ID+qx+r+gtH9xb7o6CHgYfbwEvGCDcIAVD8NlCVb93pFBXQCXXe3S1PjellAFZC3MtDUOQ4kb4Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0VsQkduQWZCUDJndndQejZxMGNsblJWelpXUW1iOSt5bFhWZHpxY0ZYaGdQ?=
 =?utf-8?B?RWw2L2hqNjJBajBoRlZmMEh0VjVnODB1Y3o5OUwwRnNCb0FKeWNkRk01UXVs?=
 =?utf-8?B?cUlhcks0R2hDc2pHbUs1ckJ5cDYwbGRXSkNndHNvN1d0SEdMZEZzMEp3Z25C?=
 =?utf-8?B?dmhzSTZKQ1FFOVdsTG5UM0RwVUoydkhFbkNLYk15WWJHMTJMc3d3cHg0dzNX?=
 =?utf-8?B?TGxGRTc4dlh0N3lmVzIrSldEQmE1TUhDcEJxckpnYTFIV0gwUkszZGtlNTRM?=
 =?utf-8?B?Y2wvTlZuR0NBMDlRdGdzaTlFODRSTmZqNmI3Q3JwWUlvK1d4ZTVwaFNQYm81?=
 =?utf-8?B?MzE0VGZLK3duM2hNYjBlRGp5T3hOTlhwZlFISjZEdk9oSUp3RFcyL0hjS2lI?=
 =?utf-8?B?WDNNb3J0bnpaZ2MwN2NnMXBGTFMwSHlWYWQyZnpPdmpPcDFBbUNFL0x5eFVV?=
 =?utf-8?B?KytTU3M2ejhGbVNkeDNjbFZuQkpnSmZzd2t6QkN0RlU2OEJIckcyUVdJNzky?=
 =?utf-8?B?Tm1iMGtQN3dGdHdXOWw4aFhFbTRiZjZZY1hZcVpMYWJUaUV1ZUNaWGUrTG9J?=
 =?utf-8?B?UU1mZFFMSTltRWxHZmZNSGxLZHBPZCsxSlBJZkZaWk03Sm1IUEFQNGFRNHB1?=
 =?utf-8?B?VUpGeFlSRkFHb09kWlh4bGt6MFdJTFJXYlNaSzJTU1paak4wUndpWGJYOXN4?=
 =?utf-8?B?dER3YXZjb0dXK25lNjl0TlA1SnJoUFE0OWtyNEdPRjVGQlRabWxIc0FLT2xx?=
 =?utf-8?B?WUpoUjhEaHBLWHZZTzJvMHdjMm14M2tNR3lEemZXMUpMOHpVemlWQlhtNU4r?=
 =?utf-8?B?dm10Y2RrQXFLSHg2VEN1a2xsZjg3c0hLR0owSHlGRHNUQUM2WUVRQm1PYmxP?=
 =?utf-8?B?RlZBUmErdks5b1daMXNYVWM5RGE2NjJOdkYySlp6LzJOeStXR2ZHMkt4bWdH?=
 =?utf-8?B?UjhIY2dWbXZ4blVNRlhzWTVCa0RoYUtYajR6U3JlcHc2dlhnRFlDbXVJL0Nz?=
 =?utf-8?B?MnhtSVB1TFgxdW5pZkZHR1BaY1B6ZXJSUUNZMDNtY1p4MVE2UHRDcnJzVjJ1?=
 =?utf-8?B?c3RoQ0N1ZVF6L09aTjNOV1I5RWZERjFjb3JKaG5iVlRRS2JWelRBQUZ3Wkor?=
 =?utf-8?B?QVRObjNrTkl2aDBYTFo3S1cyem4xREIzZjIra21lb0pFMmlyZ042ZHhPOWZk?=
 =?utf-8?B?bXJYQjhaREgvQXMwbEtVbkFWck5JcXpqaFMxSXh3YnBkVE92UHJycHVqenB1?=
 =?utf-8?B?NVBwY3l6YWlsZFVlSnFpejlGLzlXVW9HdVl4cUNEa29wMlpacmllWjJBbHZu?=
 =?utf-8?B?SmR2NEk2cGNFSlU5QlhsNDJkV2NJd1A5S05hUnRxTG9zSjhZKzVRQU9tRkdS?=
 =?utf-8?B?RGsrUWZoYzhBMVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4514bd6-f105-4361-c405-08d9ba2e2f5f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 09:36:17.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3891
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 09:36:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94250

After it seems like we reached an agreement on the oe-arch ML, I just 
released a new version of the linter that doesn't mark this issue anymore.

On 07.12.21 14:35, Marek Vasut wrote:
> On 12/7/21 14:33, Alexander Kanavin wrote:
>> On Tue, 7 Dec 2021 at 14:27, Marek Vasut <marex@denx.de> wrote:
>>
>>>>> And as far as I can tell, bitbake can stick something into DEPENDS
>>>>> before it parses this recipe, so the :append is valid.
>>>>>
>>>>> Furthermore, git grep through oe-core already indicates a few recipes
>>>>> which use DEPENDS:append.
>>>
>>> I believe the warning is valid, see above ?
>>>
>>
>> The linter is an obsessive pedant, and is not actually always right, 
>> that's
>> why I want its author to comment :)
>> 'DEPENDS = ... ' is used throughout all layers, and doesn't seem to cause
>> much grief, so why fix it here specifically, is there an actual issue?
> 
> I believe it would be a good idea to start fixing it all over the place. 
> So yes, let's wait for Konrad.

