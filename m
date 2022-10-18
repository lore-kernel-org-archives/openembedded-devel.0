Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C3AC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 08:02:59 +0000 (UTC)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web09.4327.1666080174037805224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 01:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=nJx4+tAN;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1666080174; x=1697616174;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tTcekW1Dqfnu6SUisHRSeXN+fRIZFeuVIuWUyJCBQLs=;
  b=nJx4+tANzu/de0b9sNttI9VLfvnjYHomiU47LE+FRwSoRWyyNT7d99dX
   d0/ccqspF3MvgLRzfkYHCpwcFPdIm4X+h4QZygIsjAn48XvwD/gh6NKyT
   FOXijgz91OLukNX4K7Drb1r2zhIyL2RzW21BebiF1kKzoocVfq/bO8up/
   b0PxvPOzMpPhGppy0rUR03mL7UDHbsJMqq3yPOvEGSo06apMHXDxLfqhV
   KW+MmcDtMxvbKComM3Xx1rPNAnLtGH0ohM5m+QnqZeMp7coAtmk35AIky
   JKkv7KXdP8LlugyokAQY0ifKwEcUGZ83wwcJ9LjkZw6Dc5nKqCWPnL5s8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="67757577"
X-IronPort-AV: E=Sophos;i="5.95,193,1661785200"; 
   d="scan'208";a="67757577"
Received: from mail-tycjpn01lp2172.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.172])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 17:02:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUYJtCX7VV8/RilWd67fR//27MYgenL5aZemgz76G8Xlbv6t35CmXghToP9nH7pNbTtXZMNOMFSQ/fZoeMFEnGC7qwNGq8IdvbsyZlXwUqidrG06gm5a163QuHQoev9L04AUd6l/Gj9zsTsrJ5EYhTKVBkAi0A4JecVFem3iX2jdCfJnNoR86Z1WWir4GqqOiPtrzrKdXm0xcvGSohHmkHon73yQAkcCuPI9E/jDI9TBpBK/vJs1j+m/T0ZGUBBhQWbkngc+MTm4IeLWH1D/SZfzWh9QspQQ3Jsdhg4LTTa4lYIauKCEEv6GMwTVVguoxh8DR0zBZ6o536n8chk2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTcekW1Dqfnu6SUisHRSeXN+fRIZFeuVIuWUyJCBQLs=;
 b=DUyC2b7umhA3xX8utiYV7TJycH4iLfJi7w41peSQET0wLkolSKjnVIiTP72GrS/L7zlQFeawPrO8eIOE8Ui4QyqdEKvri5KbLu0W8qly2dxgwHglZGqTvK6xTUI5Q7bZs1LFSdZgKU7nKNXgdvW0tCcUR2NvVoOYHwXvFQptfkl+cfRZlw1gH9QuJj0ISgERjqrvCB9CNT6uBgI8H17wY5QJrWZukwSD96h0JJR1umXd9EX/IfcVOwYBqmT9/CrZHl7B+VqzagQDuAMhGNx44MP3tjXZTYL8cttNJuFaiTvRyTyWqMJr1EcY/kAbuQK5mkMw0JEXM/JP14bgqAF2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com (2603:1096:604:f1::6)
 by OS0PR01MB5443.jpnprd01.prod.outlook.com (2603:1096:604:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 08:02:47 +0000
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::943:925d:ebae:86ea]) by OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::943:925d:ebae:86ea%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 08:02:47 +0000
From: "zhengrq.fnst@fujitsu.com" <zhengrq.fnst@fujitsu.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.0 ->
 4.0.1
Thread-Topic: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.0 ->
 4.0.1
Thread-Index: AQHY4r/m/JtQdBwAmE6Rqg4zZpB0Oa4TyZgw
Date: Tue, 18 Oct 2022 08:02:47 +0000
Message-ID: 
 <OS3PR01MB6241FFBAF7FD44E74DB522A78B289@OS3PR01MB6241.jpnprd01.prod.outlook.com>
References: <1666055730-2392-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <8c5b5936-bd07-b42d-71d9-284ce47270fa@bootlin.com>
In-Reply-To: <8c5b5936-bd07-b42d-71d9-284ce47270fa@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZTcxOGVjNGUtZmRlZi00NTAwLTg5MzQtZjY3YTk0MmFl?=
 =?utf-8?B?ZGY3O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0xMC0xOFQwNzo1OToyOFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6241:EE_|OS0PR01MB5443:EE_
x-ms-office365-filtering-correlation-id: ee0bebc2-d23a-4709-bc63-08dab0df252a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fXrFaheJks90Y1foi6lxitwIyGGLi5inUpaTC19G8DrCXWE9P2Q7Krgk6XzsfTssJzoLprlLimdwSNCzKMNEauCDEgtnbH7DSWl+aUfWJtuVx5+deFdPq5tG/XkoFQwUekZ/l/ei7bQ+KZhP3qxr/4Ihb17Z4AF81uQDOlqIPh2+R1RR5XOetxTeVjiqZT2AENDDZu9WFs7fHSA6aNU5qC7LZoaUOjDRwJbyMVaAgICXGj8fyjqJHVDOavZYyYOjwMnwpYPPPIiH1bc28C4BOxOn/eZxCoM/FKOs8qfe1Blq6tSBeyYIecauA8KS0dzgT+KX7W0+OqV8ykWeG33iuIo88XKHkK2rk+xcKF9lng6XJrUjUQgufz+sE9wcB4ixPAG+w8/D6n5bedWNHqZ2nQ01lj5oBhBgZwIqNjl872hVlFcHGIIisTBJxh5uRejCHalqSlOYKhsTteOCMk3dcgeRH/lMq3ep5SciPpEQo7i/8GX9m0U6FChCPq3LYlbUb1V2OkuVWdSra6XKQD5WKqG6QDJ76MpkFq1j2w9R5uvpsNmJAhBNxfOkXFiTYT+eUsDayZ64l7dUHBlrpB/gByYauOyiXLVxymqce4PvP6TBva3d1bU3ivWQ13coYRUA7JQ71do2PttIIDC+V4V3u9BZSeu7TGWpL4mA2uppJex8Ce470H6jbi5qge9lXmp0YaBzeEmqYYQS7362ucMsGbCU8xyfi4S1TZBGEUL5sOjNbOIp073GnB7SN6ZPsqZPbeCyUyipOftUBanmZT1aDapeanJmLE6CyTH6FxcCyvCeT30vQ1+ezwWqbCuMPL2v
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6241.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(1590799012)(38070700005)(478600001)(71200400001)(1580799009)(122000001)(82960400001)(38100700002)(966005)(8676002)(186003)(33656002)(316002)(66446008)(66556008)(66946007)(66476007)(64756008)(6916009)(76116006)(86362001)(6506007)(5660300002)(7696005)(26005)(53546011)(41300700001)(85182001)(52536014)(8936002)(4326008)(55016003)(9686003)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y2FCTUpEN0R2dXhXbGl4VWxaQTRqblZoQ1pNRjFjSVVWUHpvQ2gzRm1QTmkv?=
 =?utf-8?B?eE40aUFXaVRaNXk3TnFZL2lCK3gyYXNTZ1k3UGJiZlVJUkVDSTREZUw3RmZN?=
 =?utf-8?B?NDN3eFRrWGZKSE1xb1FIOEgzdjVYVkxtZUxRZG42SWZ0ejZYdHdFNVkyUGxR?=
 =?utf-8?B?YXdvTkZhWERIWjh5bnZBYWhZU0RHK1ZBenhNWFcxalpWT3lyWUpWTjZrVkpV?=
 =?utf-8?B?ZWh6c2VSQmdhUVNHQXRWZ2VyMUpmaklhSG5xVURHODdTbFdLc3dzQmFTOWZu?=
 =?utf-8?B?S2p2M3FFbDdtdlN4NlM2SkZDQ3pick9uVzhVL3VqUDNKeWdob0Fjclh5R1JK?=
 =?utf-8?B?d1Boa3RyK01MQW5UMndLR3FNK2o3dkE1Si9uM2Rtc1Rlc3RaU015Ny96UVBT?=
 =?utf-8?B?ZjdnRVV0VmJnbWpJbzhTa2NjM1dZOHZheG5Kd1lUUU1YamVRMUlIcWdWQUor?=
 =?utf-8?B?cklmNmFZRUlyMUZiYzVvRTRnY0RkY21oeXBDTENja0ZIdDluNSt0QnpHMFhZ?=
 =?utf-8?B?N2JpcS9taUl2ZDBxaUZ1eEtBMTdMWS9qTlpaN1pleVc1Ny91SU13a2Q3K0Uv?=
 =?utf-8?B?b3pjSXE3NmlPNUo3V3NmSDl6WHBsQVpoL3B6YzZ6S21XbFNxZFZOeXY0a2tY?=
 =?utf-8?B?NGNpRk80TG40NWQrTWtLSk1henVGbFN0ZjJJOGdFVnBGbzFYTm1WTU40Z011?=
 =?utf-8?B?QjJkeEVTVk80SFFsSlNuWm9SNEhidXNHRS9rY28wa2U5VDdOWHA3ODAzSE9a?=
 =?utf-8?B?RjVaOWlaTG5Pakxua1FzUUY2MlJrSXpNNndRYUJITFZybnRESEtZVHdjN0Za?=
 =?utf-8?B?ZlZhVi93UU83U0llWXZiQmRBR3JzdnhOS3NEK0JadUxuVFNYaFRDL1JHb1BW?=
 =?utf-8?B?MVQydTZTbUpsZWRqVHNBZXRXRVo1akZLSDJTY2hpL3d3eGpvaXJLdlZUZ3ZE?=
 =?utf-8?B?MjJFQkFlbUF1bFdraUJVVkxKMmJRM09QTVhjZWtEeEE3S2Q3cFE1S0VZWEI5?=
 =?utf-8?B?V2Z5NWJVdmQ5bWk3NW94L3J2L3puTkpLS21VOXBBbk9zSklvQ2I2amdnWGJI?=
 =?utf-8?B?RUhEWXRON3BYREFvLzhrQTRoMW9xdm5wbk1zTUFNSWt4TitONXJkOFRnRHV6?=
 =?utf-8?B?YlZrbGNLSkl4ZDByZ01OMkg3R1pBdWtwTlpvS1RQQVpyWTdjdmlKZ0xNRXNk?=
 =?utf-8?B?RTg0Y09uajdCeFF4SDF4YTlsN1BjWTBzdFZGSU1FRHNaKytvU2lJNXp5a2tD?=
 =?utf-8?B?bjN3MWZsbzAyaHpnZExIeGZkMGdTU21sYU4rSnhzK0Y3SHNvODNBRUdnVnZv?=
 =?utf-8?B?azlvOUJVNGw0c3lFZFdER1d3emJOS3JVRE9YcC83RGxEU2taNTBXYUVVVUhl?=
 =?utf-8?B?UGIvMy9lbEpZSHEvdDc0Y1huWG43VFIwNjJnTm9xZTZHRmZFVk1tU1FOM3Rq?=
 =?utf-8?B?bzcvb1FUSGRwSTdwK0NuOVc2dWZqUWx0WG5rRy9mTHAzQncrOUdzL2Zza3Bn?=
 =?utf-8?B?b2t1SERUeU9lK2E1MGdRYVJ3OEdnaGFGS2lFRDVybjdqWUtrMUZjWW9nSGM4?=
 =?utf-8?B?dDJhTmNrdFlwaU15aXF0WlRDb1ZoKzFOZkxyY1pidnV1VmhRTFJjdXF6cVgy?=
 =?utf-8?B?bTEramZPQStCdEVFNUNQMGxXT3A4amllZmdXWHlYRjBER05sdGNoNlVaa1FE?=
 =?utf-8?B?WUY4Zk5EZTJOMFh1TEpyMkhFS1BvaWVobndvdzUyZWNUUjNocE1XeE5SWTdG?=
 =?utf-8?B?eVJsbm5ZOEVzemVtc0J0K3BGZGdPR1ExYmY2Rkh3WU5VQUFpV2RZOXZhaEMv?=
 =?utf-8?B?MERsdEZPRXpQVnFIS3VCcTNpa0ZzR2ZocXpnTlVWZlR1VStWei9NdmtqZWtw?=
 =?utf-8?B?SlQ0alMzczY4SFEwakM5ME9KUW43Q3c3WURWaU5QZ1pjRXdPTk5pRnAxWjZN?=
 =?utf-8?B?L1AvWlNxY1NEQVBhamFnME52OTk2bjJnVEV1U3I2b0ovN2lubkdUb2o5bHNz?=
 =?utf-8?B?L3NJcldGZ1VOL21wdW1jdDUwaUwzS0liOU91bkkxL3lJNERPeDRrUDBscmYv?=
 =?utf-8?B?NnZHcWRrTmZqYkdNbkxUSmtMZ2FkaWFTWmc0WmRVK1FhNE0rQXY4NlU5blF0?=
 =?utf-8?Q?EYwJAfoyIfp42YgY/DnbH3rbH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6241.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0bebc2-d23a-4709-bc63-08dab0df252a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 08:02:47.3944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Pk894gMD/N7Np1e/ei3iOxej6r3IeecetGjVYA7RT2VVjGcdjsLPawjCaJH2kGQbfg5i+EBPajLZFEmkQnfIwtfcdJK5tydUOXLmgHoRL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5443
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 08:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99236

SGkgTWljaGFlbA0KDQpJIGhhdmUgdHJpZWQgcnVubmluZyBnaXQgY29uZmlnIC0tZ2xvYmFsIHNl
bmRlbWFpbC5mcm9tIGFuZCBzZW5kIHlvdSBhIG5ldyBtYWlsLg0KDQpDb3VsZCBoZWxwIG1lIHRv
IGNoZWNrIGl0Pw0KDQpUaGFua3MgDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9xaW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBT
b2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBT
b2Z0d2FyZSBBdmVudWUsDQogICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6IHpo
ZW5ncnEuZm5zdEBmdWppc3R1LmNvbQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxpbi5j
b20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTgsIDIwMjIgMzowNSBQTQ0KPiBUbzogWmhl
bmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAZnVqaXRzdS5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W29lXSBbbWV0YS1weXRob25dIFtQQVRDSF0gcHl0aG9uMy1zdGV2ZWRvcmU6IHVwZ3JhZGUgNC4w
LjAgLT4NCj4gNC4wLjENCj4gDQo+IEhpIFpoZW5nDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaCENCj4gDQo+IE9uIDEwLzE4LzIyIDAzOjE1LCB6aGVuZ3J1b3FpbiB3cm90ZToNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4NCj4g
PiAtLS0NCj4gPiAgIC4uLi97cHl0aG9uMy1zdGV2ZWRvcmVfNC4wLjAuYmIgPT4gcHl0aG9uMy1z
dGV2ZWRvcmVfNC4wLjEuYmJ9ICB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICAgcmVuYW1lDQo+ID4gbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3RldmVkb3JlXzQuMC4wLmJiID0+DQo+ID4g
cHl0aG9uMy1zdGV2ZWRvcmVfNC4wLjEuYmJ9ICg4MCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+
ID4gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0ZXZlZG9y
ZV80LjAuMC5iYg0KPiA+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zdGV2ZWRvcmVfNC4wLjEuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDgwJQ0KPiA+IHJl
bmFtZSBmcm9tDQo+ID4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zdGV2ZWRvcmVfNC4wLjAuYmINCj4gPiByZW5hbWUgdG8NCj4gPiBtZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0ZXZlZG9yZV80LjAuMS5iYg0KPiA+IGluZGV4
IDQ2YzZkODMxYWEuLjcwYzQzZjNhY2UgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdGV2ZWRvcmVfNC4wLjAuYmINCj4gPiArKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN0ZXZlZG9yZV80
LjAuMS5iYg0KPiA+IEBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9DQo+ICJodHRwczovL2RvY3Mu
b3BlbnN0YWNrLm9yZy9zdGV2ZWRvcmUvbGF0ZXN0LyINCj4gPiAgIExJQ0VOU0UgPSAiQXBhY2hl
LTIuMCINCj4gPiAgIExJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNi
ODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3Ig0KPiA+DQo+ID4gLVNSQ19VUklbc2hhMjU2
c3VtXSA9DQo+ICJmODJjYzk5YTFmZjU1MjMxMGQxOWMzNzk4MjdjMmM2NGRkOWY4NWEzOGJjZDU1
NTlkYjI0NzAxNjE4NjdiNzg2Ig0KPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiOWEyMzEx
MWE2ZTYxMjI3MGM1OTFmZDMxZmYzMzIxYzZiNWYzZDVmM2RhYmIxNDI3MzE3YTVhYjYwOGZjMjYx
YSINCj4gPg0KPiA+ICAgREVQRU5EUyArPSAiJHtQWVRIT05fUE59LXBici1uYXRpdmUiDQo+ID4N
Cj4gVGhlcmUncyBhIHByb2JsZW0gd2l0aCB0aGUgd2F5IHlvdSBzZW5kIHlvdXIgcGF0Y2hlcyB0
aG91Z2guDQo+IA0KPiBJZiBJIGFwcGx5IHlvdXIgcGF0Y2ggdGhyb3VnaCAiZ2l0IGFtIiwgdGhl
IGF1dGhvciBvZiB0aGUgY29tbWl0IGlzOg0KPiANCj4gemhlbmdycS5mbnN0QGZ1aml0c3UuY29t
DQo+IA0KPiBpbnN0ZWFkIG9mDQo+IA0KPiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBmdWpp
dHN1LmNvbT4NCj4gDQo+IA0KPiBCZWNhdXNlIG9mIHRoaXMgaXNzdWUsIHRoZSBtYWludGFpbmVy
IGhhcyB0byBtYW51YWxseSBmaXggdGhpcyBmaWVsZCB3aGVuDQo+IGFjY2VwdGluZyB5b3VyIHBh
dGNoLiBXb3JzZSwgaWYgaGUgZG9lc24ndCBjYXRjaCB0aGlzLCB0aGF0J3MgaGFyZGVyIHRvIGZp
eA0KPiBhZnRlcndhcmRzLg0KPiANCj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIGZpeCB0aGlzIGJ5
IHJ1bm5pbmc6DQo+IA0KPiBnaXQgY29uZmlnIC0tZ2xvYmFsIHNlbmRlbWFpbC5mcm9tICJ6aGVu
Z3JxLmZuc3RAZnVqaXRzdS5jb20iDQo+IFRoaXMgc2hvdWxkIGFkZCBhICJGcm9tIiBmaWVsZCB0
byB0aGUgc2VudCBwYXRjaCB3aGljaCAiZ2l0IGFtIiBzaG91bGQgYmUgYWJsZQ0KPiB0byBtYXRj
aCB3aXRoIHlvdXIgbmFtZS4NCj4gDQo+IFNlZQ0KPiBodHRwczovL3d3dy5vcGVuZW1iZWRkZWQu
b3JnL3dpa2kvSG93X3RvX3N1Ym1pdF9hX3BhdGNoX3RvX09wZW5FbWJlDQo+IGRkZWQjU2VuZGlu
Z191c2luZ19naXQtc2VuZC1lbWFpbA0KPiANCj4gQ291bGQgeW91IHRyeSB0byBzZW5kIGFuIHVw
ZGF0ZT8gWW91IGNvdWxkIHNlbmQgaXQgdG8gbWUgYWdhaW4gdGhyb3VnaA0KPiBwcml2YXRlLWVt
YWlsIGZpcnN0Lg0KPiANCj4gVGhhbmtzIGluIGFkdmFuY2UNCj4gTWljaGFlbC4NCj4gDQo+IC0t
DQo+IE1pY2hhZWwgT3BkZW5hY2tlciwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

