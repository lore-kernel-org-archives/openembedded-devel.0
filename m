Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF2CC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:57:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web10.50859.1680256644170574598
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CyRU9M5x;
 spf=pass (domain: arm.com, ip: 40.107.8.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwVGw6d0Ku/nHsb0OHB4D24DCyk8h3jae7cb/fEoqOE=;
 b=CyRU9M5xGbCyWF4akmoVBdya7GdzYesOYuohP90bjxGjfOoa6uqbx8mdAlDI/dIuTO3geEjxmf7vKgjfj5v2jVnbMr/F6AFvXXm1VcWqCcLqg9egyS3eNBbALTtSFTVfT1GHJbrPmexfsAYGwjRORQIncM0Y2Z3w4sWFoDUrjXc=
Received: from DU2PR04CA0354.eurprd04.prod.outlook.com (2603:10a6:10:2b4::7)
 by AS8PR08MB10172.eurprd08.prod.outlook.com (2603:10a6:20b:628::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:57:19 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::c8) by DU2PR04CA0354.outlook.office365.com
 (2603:10a6:10:2b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 09:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Fri, 31 Mar 2023 09:57:19 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Fri, 31 Mar 2023 09:57:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db394e9bb4b3c1d5
X-CR-MTA-TID: 64aa7808
Received: from fff734b29ead.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E715C809-612F-4E69-BF6B-190E415AF9E1.1;
	Fri, 31 Mar 2023 09:51:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fff734b29ead.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Mar 2023 09:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKQUw8waJ3lxSNkBgBdri49hNvQKpR2CtyRjkNmFxyHwHs3MiqI1SoyBxzDDC3Ipz/WJBvQzK8N0Rv9fowyrUUYUz0mEg1EdVvhG8X2JqZCY2L2MJf7gzqfXzQ62G5qjFChXK/ryreEj7+9D/m4nr4MSirpwDYtibWAcN/DORsJT5Pi6g3GNDwuOpsRxrZfB8+/nLI1FHleDtbLtlRpjlpCobfmcRVFH4tpVTgycd0HcQDqZReQODoSe7MT+UoP6kzg9JatuBRo568WAFjdY2mlskzpGlNnqqe+HW8ihdoIXgKaMx+Y4yQNXePw/HWhvLSOdfkFbJCbuk7D2kP/Ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwVGw6d0Ku/nHsb0OHB4D24DCyk8h3jae7cb/fEoqOE=;
 b=UumKBL5c+qEyLGf706vyIrZjlGeDhmjyPuqxmBU/Qhs/Im6Shy38pzlK/1CkyVA59QR4fZ+qp0WiIbF765gOHGeOYr8nT78zc/SoEcbOlGsJMkTvegB4Y97glVEqmgrTvBzyf/kmDD/G/X+MH0YYHfQuzVDeOROGnwcDh5AoDPXYNhfObL9ZfdDHN5mLMghYYU1ePEJSHlm/XkXVgZtrw8bqc4OqgDVzSpuamYVU04w9SsMOT4VtHV6yIHbb+efWwitwZ8h9QqXo+he4jddgaEJE9CNw3WfLu/wVkIXWSVKkYeJk5kYSFgVD+MUAgjaSgxGi6fZGaNBK0IMacJhIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwVGw6d0Ku/nHsb0OHB4D24DCyk8h3jae7cb/fEoqOE=;
 b=CyRU9M5xGbCyWF4akmoVBdya7GdzYesOYuohP90bjxGjfOoa6uqbx8mdAlDI/dIuTO3geEjxmf7vKgjfj5v2jVnbMr/F6AFvXXm1VcWqCcLqg9egyS3eNBbALTtSFTVfT1GHJbrPmexfsAYGwjRORQIncM0Y2Z3w4sWFoDUrjXc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6740.eurprd08.prod.outlook.com (2603:10a6:20b:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:51:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%5]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 09:51:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Randy MacLeod <randy.macleod@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>, "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461: Propose mv
 yasm_git.bb yasm-native_git.bb
Thread-Topic: [oe] Security Advisory - yasm - CVE-2021-33461: Propose mv
 yasm_git.bb yasm-native_git.bb
Thread-Index: AQHZY1J+54Li6vJNV06V1RdH4bXA568UphiA
Date: Fri, 31 Mar 2023 09:51:41 +0000
Message-ID: <FF2F4A07-1C8D-40DF-AA1A-B0E0CC82B8AA@arm.com>
References: 
 <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
 <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com>
 <00ad165c-cf3e-e3f5-e0c9-46c9df882757@windriver.com>
In-Reply-To: <00ad165c-cf3e-e3f5-e0c9-46c9df882757@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6740:EE_|DBAEUR03FT054:EE_|AS8PR08MB10172:EE_
X-MS-Office365-Filtering-Correlation-Id: b936aade-6770-4384-9f25-08db31ce5110
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GE/ruwlClY4yk7pMYGR1o43ewIafSqafM/UYhiqgnFqVFWaurQe7q35cU04WGDO/ZMMLY5k1lcfQKrnoILf4hT2L1MZcqiYhexSZVfyY1FEDRaPaA2iyhwRZ1NSK4SLqoZMJu2GqWLacutSOST74LlWjIHxvEvxTXFJR+FowGPcamdrGa9ZoVpcq+dm0TShkCVvhqCAL4IXVpGFWsZpIjSMLss+QAGY7I4PZx+UAtcDUXJFXZeZ99rpwSX53Jrs9+sC41r9niD+N6f08NoYGRcT/fMVveprnQ9uID2r/9wjD4GCsrFuspUBbBdV1jwQhOXMlZw7Kg53ERuxn/kAzIBXojX+cJXz6v/V43GG5GwPxmeB/U6MN0xmwr8GDNT6FXk5XoA69xU7dZvxomaED6wcOeY2tRJWFCzde5DVPnwqlSfwKzPQcW6oM6F5QRN7Pnbg9/I2OoBxUSwUSvrbtDWkEzD3dc1GAJIuyyqpVFzBC9tWEtKv+g/2kD9xBmsiUvGYcG05lPe77fX55a5MrjJaEQl5oMMlbjnfhjxf1kA5hiQvyLeyvUfxvViIr/NppCiLYuagz5ffHMKQK+Yq+4GsEGSLHub0emvr0AguOhknIaEtw4Y6RbploboApJIvO+ha1Krun9GYJ8YYZyNWyGA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(6512007)(53546011)(8676002)(6916009)(4326008)(54906003)(66556008)(966005)(76116006)(6486002)(66476007)(91956017)(66946007)(66446008)(64756008)(33656002)(36756003)(26005)(6506007)(186003)(38100700002)(122000001)(2616005)(316002)(66574015)(41300700001)(5660300002)(8936002)(71200400001)(478600001)(86362001)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFCD24EDF48F274CA6EBF61AB688A73F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6740
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2a971ad-37e6-40b5-ce50-08db31cd87c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qJISxmrfGcTbDsyXkOZMxxUzNqWftY1kA+39W/OuEZiqWzeaMqTtJ40e5hSCX+fn6SL/3nSjFc6NlwPp4y7VR6FBiNz7GnPs3NCgFaLClMlUkyRg7XJbhlietsFuKqs4Uu3nq0xIGRC92nrHumOCTj1AoweXectS0Fit2jlrl0uJxqnxSNhIcKuGz7I3+FAhIkP7U1kYeWhvZEZ7CIBu/629TTmRrDcv2+tTvDrCmvDrgA1ESs/7x/3CqXqIKB6wI7+gLle1+t5nB/nq2WAL+T/dsZl4qxaWp8V709iu0s/3yuzlxQF9a7asSTkelreyJM8bp0yLlbW26gNGdtgn4mG/wUtdSFpWncfrNOJ/kdi5noOE+nRJGMA5gLeVRYkZazjgs7gUyzAMA5iQvugNMyV6OigBT9YNkaq27mZZ27OT0SD+a7/eu8WDTzkePApf1XET/ct99XkEpRtAlnUX+IrcMJQAwwY3y6Bc9JxvGmSycM8EqgCexqz+xv7ZQtS/PFcrKvgMCHZHApIR7xz+Wbypj41WCnniy9V+Zf700xYfDZIEIDzeiTMrBftS2uTfXJkkIckHqVJcKnAjp3yu3vjw9b5aFZqLAzOWExeP/N1k8ZPi9DbZrhlpsceGWbF6SNTket171/2+Aucuc5u3jLPQax0F3e2wExDf2Qc++yJrPDY429z1gtVjPaD5zNuN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(53546011)(40480700001)(82310400005)(186003)(6512007)(26005)(47076005)(66574015)(336012)(2616005)(54906003)(478600001)(70586007)(40460700003)(70206006)(316002)(41300700001)(966005)(4326008)(8676002)(33656002)(2906002)(82740400003)(81166007)(356005)(36756003)(6486002)(86362001)(5660300002)(6506007)(6862004)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:57:19.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b936aade-6770-4384-9f25-08db31ce5110
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10172
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101852

T24gMzAgTWFyIDIwMjMsIGF0IDIyOjU2LCBSYW5keSBNYWNMZW9kIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyYW5keS5tYWNsZW9kPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IFRoZSB5YXNtIENWRXMgaGF2ZSBjb21lIHVwIGFnYWluLiBTaWdoLg0K
PiBVcHN0cmVhbSBzZWVtcyBub3QgdG8gYmUgaW50ZXJlc3RlZCBpbiBmaXhpbmcgQ1ZFczoNCj4g
aHR0cHM6Ly9naXRodWIuY29tL3lhc20veWFzbS9jb21taXRzL21hc3Rlcg0KPiANCj4gV2Ugb25s
eSBuZWVkIHlhc20tbmF0aXZlICgxKSBzbyBkb2VzIGFueW9uZSBvYmplY3QgdG8gDQo+IG1vdmlu
ZyB0aGlzIHJlY2lwZSB0byB5YXNtLW5hdGl2ZV9naXQuYmIgPyBUaGlzIHNtYWxsIGNoYW5nZQ0K
PiB3b3VsZCBtYWtlIGl0IGNsZWFyIHRoYXQgaW1hZ2VzL3RhZ2V0cy9tYWNoaW5lcyBhcmUgbm90
IF9kaXJlY3RseV8gdnVsbmVyYWJsZQ0KPiBkdWUgdG8gdGhlIGZ1enppbmcgZXJyb3JzIHBlb3Bs
ZSBhcmUgZ2VuZXJhdGluZyB3aGljaCByZXN1bHQgaW4gQ1ZFcy4NCg0KSXQgc2VlbXMgbGlrZSBh
IGJldHRlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBhc3Nl
bWJsZXJzIHRoYXQgYXJlIGVmZmVjdGl2ZWx5IHVubWFpbnRhaW5lZCBmcm9tIHR3byAobmFzbSBh
bmQgeWFzbSkgdG8gb25lIChqdXN0IG5hc20sIGFzIHRoYXTigJlzIGluIG9lLWNvcmUpLiAgQWxz
byBtYXJraW5nIGFsbCB5YXNtL25hc20gZGVwZW5kZW5jaWVzIGFzIGJlaW5nIHg4Ni1zcGVjaWZp
YyBmb3Igb2J2aW91cyByZWFzb25zLg0KDQpJ4oCZbSBhIGZpcm0gYmVsaWV2ZXIgdGhhdCB3ZSBz
aG91bGQgYmUgYWJsZSB0byByZWJ1aWxkIGFsbCBwYWNrYWdlcyBvbiB0YXJnZXQsIHNvIG5hdGl2
ZS1zcGVjaWZpYyB0b29scyBzaG91bGQgYmUgYSBzcGVjaWFsIGNhc2UuICBUaGUgbW9tZW50IHlv
dSBtYWtlIGl0IG5hdGl2ZSBvbmx5IGlzIHRoZSBtb21lbnQgeW91IGRpc2NvdmVyIHRoYXQgc29t
ZW9uZSB3YXMgdXNpbmcgbmF0aXZlc2RrLXlhc20gb3Igb24tdGFyZ2V0IHlhc20gdG8gZGV2ZWxv
cC4NCg0KTG9va2luZyBhdCB5b3VyIHNlYXJjaCwgSSB0aGluayB3ZSBtaWdodCBiZSBhYmxlIHRv
IGp1c3QgcmVtb3ZlIHlhc20gZW50aXJlbHk6DQoNCj4gbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMt
bXVsdGltZWRpYS9hb20vYW9tXzMuNC4wLmJiDQo+IDE4OkRFUEVORFMgPSAiIHlhc20tbmF0aXZl
Ig0KDQpBY2NvcmRpbmcgdG8gdGhlIEFPTSByZWFkbWU6DQoNCiJGb3IgeDg2IHRhcmdldHMsIHlh
c20sIHdoaWNoIGlzIHByZWZlcnJlZCwgb3IgYSByZWNlbnQgdmVyc2lvbiBvZiBuYXNtLuKAnQ0K
DQpTbyB0aGF0IGRlcGVuZGVuY3kgc2hvdWxkIGJlIHNwZWNpZmljIHRvIHg4NiB0YXJnZXRzLCBh
bmQgY291bGQgYmUgbmFzbS4NCg0KPiBtZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBz
L3BhY2thZ2Vncm91cC1tZXRhLW9lLmJiDQo+IDMxMDogICAgeWFzbSBcDQoNClRoaXMgaXMganVz
dCB0aGUgbWV0YSBwYWNrYWdlZ3JvdXAgdGhhdCBwdWxscyBpbiBhbGwgb2YgdGhlIHJlY2lwZXMs
IGZvciB0ZXN0aW5nLg0KDQo+IC4uL21ldGEtYnJvd3Nlci5naXQvbWV0YS1maXJlZm94L3JlY2lw
ZXMtYnJvd3Nlci9maXJlZm94L2ZpcmVmb3hfNjguOS4wZXNyLmJiDQo+IDg6ICAgICAgICAgICAg
eWFzbS1uYXRpdmUgbmFzbS1uYXRpdmUgdW56aXAtbmF0aXZlIFwNCg0KT2YgY291cnNlIGZpcmVm
b3ggd2FudHMgeWFzbSAqYW5kKiBuYXNtLiAgVGhvc2Ugc2hvdWxkIG1vc3QgbGlrZWx5IGJlIHg4
Ni1zcGVjaWZpYyB0byBzdGFydCB3aXRoLCBhbmQgSeKAmW0gZ3Vlc3NpbmcgdGhhdOKAmXMgcmVs
YXRlZCB0bzoNCg0KPiAuLi9tZXRhLWJyb3dzZXIuZ2l0L21ldGEtZmlyZWZveC9yZWNpcGVzLWJy
b3dzZXIvZmlyZWZveC9maXJlZm94L2ZpeGVzL3ByZS1nZW5lcmF0ZWQtb2xkLWNvbmZpZ3VyZS5w
YXRjaA0KPiA4MjEzOisgICAgICAgICAgICAgICAgeyBlY2hvICJjb25maWd1cmU6IGVycm9yOiBC
dWlsZGluZyBJQ1UgcmVxdWlyZXMgZWl0aGVyIHlhc20gb3IgYSBHTlUgYXNzZW1ibGVyLiBJZiB5
b3UgZG8gbm90IGhhdmUgZWl0aGVyIG9mIHRob3NlIGF2YWlsYWJsZSBmb3IgdGhpcyBwbGF0Zm9y
bSB5b3UgbXVzdCB1c2UgLS13aXRob3V0LWludGwtYXBpIiAxPiYyOyBlY2hvICJjb25maWd1cmU6
IGVycm9yOiBCdWlsZGluZyBJQ1UgcmVxdWlyZXMgZWl0aGVyIHlhc20gb3IgYSBHTlUgYXNzZW1i
bGVyLiBJZiB5b3UgZG8gbm90IGhhdmUgZWl0aGVyIG9mIHRob3NlIGF2YWlsYWJsZSBmb3IgdGhp
cyBwbGF0Zm9ybSB5b3UgbXVzdCB1c2UgLS13aXRob3V0LWludGwtYXBpIiAxPiY1OyBleGl0IDE7
IA0KDQpTbyB0aGF0IHBhdGNoIGFkZHMgYSBodWdlIGNvbmZpZ3VyZSBzY3JpcHQgd2l0aCBubyBl
eHBsYW5hdGlvbiBhbmQgaXMgYXQgbGVhc3QgZml2ZSB5ZWFycyBvbGQuDQoNCldlIGhhcHBpbHkg
YnVpbGQgSUNVIGluIGNvcmUgd2l0aG91dCB5YW1sIGFzIHdlIGhhdmUgR05VIGFzLiAgSSBleHBl
Y3QgdGhhdCBjYW4gYmUgcmVtb3ZlZC4NCg0KPiAuLi9tZXRhLWludGVsLXFhdC5naXQvcmVjaXBl
cy1leHRlbmRlZC9xYXQvcWF0MTdfNC4yMC4wLTAwMDAxLmJiDQo+IDEwOkRFUEVORFMgKz0gImJv
b3N0IHVkZXYgemxpYiBvcGVuc3NsIHlhc20tbmF0aXZlIg0KDQpJ4oCZZCBiZSBzdXJwcmlzZWQg
aWYgYSBxdWljayBzL25hc20veWFzbS8gZGlkbuKAmXQgZml4IHRoaXMuICBUaGUgbmFzbSBjb21w
aWxlciBpcyBtb3JlIGFjdGl2ZWx5IG1haW50YWluZWQgX2FuZF8gbWFpbnRhaW5lZCBieSBhbmQg
SW50ZWwgZW1wbG95ZWUgYWZ0ZXIgYWxs4oCmDQoNClJvc3M=

