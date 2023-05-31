Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6415C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 20:46:49 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.80])
 by mx.groups.io with SMTP id smtpd.web10.27.1685566006559474417
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 13:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=NwWQSMWc;
 spf=pass (domain: advantech.cz, ip: 40.107.117.80, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMfyh9LFq7A07hju8r33eg5DXOHqucQPzZ6XRA9iF6b/EPUWx8coR+lze28Hfz2AH4UD5IQNH9G+iVCtox8lN+TB4jzJhuGFiTCxvm8BJUUg9WpgiRq6d6O4tY/kRVMdfUk6x0D4+GnUBrgWM/Ff2NwQFiD1SlboU14Qrqis0ueej98OzNXyHzLtjB6lgRsQZy7F7+qAPXCsRiSSvgFGqJ+ZZHIUmTv3Bi5/8rsZcUsbhfMkrvET/Gg/47F2WrIno72/8CadpVcErPTtfkNY6/Z5frhIg22nmXWj9M/53ju5Jvck3qkv2sG/mqW3yb8RKT0H+nwsb6eGxenb4E6Lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxU1hwovRKFF782gpmI4U78OJbfEwz9qL+PJlgWBMMY=;
 b=oDrGof0hHCdLYGWZ0bI28MqHn/Zc/OSBbRAB67na8KSlxBJFj2sQBDKx6hePxsvEe6TPE6xh/XIaAiM5j5zhZrhZBB8FsQQXbscC0DUb3nUtOM5E7kaSaOK9wqP5PVuN5G6KrKP3VmU9GhIq2o0+xdvzoKjX3Om1C7mlu4Z7ilXeTMQ4Q1ceiQUdVlrBpeQgy9yPiw2Szpbl2wrex/HcVh4IOZyRtZ0hrzcJVjonrLWHY3iLdj9ky+yFCW1FzFd0G9RpLdob6yI5BUTsMO5i/fQT2GV0I+RQS3FrLAi25+67PGNdltU/BZktqwQr03n33YNngcqpPUM7SOWArw9fMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxU1hwovRKFF782gpmI4U78OJbfEwz9qL+PJlgWBMMY=;
 b=NwWQSMWcaFyMYWMXBOPE4OVXaaTqKL+vW/ya9quTkaGyQvlM9WaL65J5FW1Jq4XGZ8BvtELVKo2TK9A/dWHJ6oOhaayQu8gutcJLVKOEwOiH75eh8GIuGwsb2lAbMy2lX+I+pV/ed5wj4Z2XOyW/6m/O+5ASnIBAmvjTM4wpwLTPPh56IHU3HVn5aO7WEThGd1prmXHxc9BAOgls9HoXHy3uZ9zoTx6waPKEJRKJSYy5YyhjRTUFwmi0nmXQUfwfnI9uqIP+Qdp1lV1eEZ/sxZWszGaxP6JDU/lyhnPVWeHQ27sdutmv9IIxmnmnusIH4YoQ1+B5xjLPSceA1XDQAA==
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com (2603:1096:100:47::18)
 by SI2PR02MB4730.apcprd02.prod.outlook.com (2603:1096:4:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 20:46:42 +0000
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e]) by SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 20:46:42 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] system-config-printer: fix
 REQUIRED_DISTRO_FEATURES gobject-introspection-data
Thread-Topic: [meta-networking][PATCH] system-config-printer: fix
 REQUIRED_DISTRO_FEATURES gobject-introspection-data
Thread-Index: AdmT/9hk9i5MZ8xnSD6jamKuh6L+zg==
Date: Wed, 31 May 2023 20:46:42 +0000
Message-ID: 
 <SL2PR02MB3676CA17069FCF4F207F021A81489@SL2PR02MB3676.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR02MB3676:EE_|SI2PR02MB4730:EE_
x-ms-office365-filtering-correlation-id: b2fbcbff-7e55-4533-44a7-08db621823ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aAC6KwxTpP4o4L175uHIbmBdUobOadGn2f5L53eAr5JYjgqNZ8sSOAVXeyMFIYO6ADRM6gIwvxWa8jy7dhy4dUSwkyX6kUyrRv9dlk/0TnCyEoXS4otjfCRu7QsqITGs9VvdyQ4JV7PpCE1eDAmOmYjiXq2w++/PES3BvmomK0q4QG/NisaNkgwg3iBxA5D/1OayJfqlHEkTSRBGPYoETeElQD8Jtb/4kHNuf64NlDUccEAxkX5onIoOb/ELrmXzLFIPhQ0aWIGn8h4IYAxBlnZphk8OtL61qm0GplYDsfzMNV7i2O77LwNxmW+sbvFCpM7LeVqZ8vfJydKJu9klHA0Hg/gKh7cKWcoBvG8OUtWdF76VvOnylF+j0+2LpvzEjeQB79ZRapYdROTU9WzuL1wssOMwPDkPQVITsTaNc8bHotHmrLCRZSpchv9ECfDwvdjyayfq0vLcTl6Z/wVyJmMlbtW/jVCHc/pjdcR86+SUJPJGIIXCNw0zoeYXCPNe5xchCfoDcp+tGuY3+TzIunELatHAKVDGCVkDcO6oOCsBV+ZmP7Keq32S1WVMeNXiXoHyAVjM8Tbg6uyisfehhqisoDj38uYALl+Is9Y6CAjx1NWt3r+g4X5uXclsjdf2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR02MB3676.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(186003)(55016003)(83380400001)(38070700005)(122000001)(38100700002)(41300700001)(316002)(7696005)(71200400001)(5660300002)(86362001)(8936002)(8676002)(478600001)(33656002)(52536014)(66556008)(76116006)(66476007)(66446008)(64756008)(44832011)(6506007)(26005)(9686003)(6916009)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?anFXS05Gdy9FcmFGTjRyenJKLzNGSFlOYW9EbFRRRENLK0FqUHhnb3lQVmdu?=
 =?utf-8?B?R2ZYMTUwZ1lhd0plMmlOeEo1WkdtZmhWV3htVjUydVNDclN2YU0rN3piY2JX?=
 =?utf-8?B?KzFYKzBjdHNCRloxK2hUSERFY1QwL1h5OUxvbnFMYmZLUmZxS3BUdlhnVHJP?=
 =?utf-8?B?ZEUwemUwcG5zZW1XUWdwSkoreDJEaGR0Yi9FbUFTQzM2UlhROUxmNExIcFJ2?=
 =?utf-8?B?d2NCQnhPZVY1TGJBT1ZwcWN0cWgyQVM5T3Z2NUt6cllySVFYSndDWWd5d2ZP?=
 =?utf-8?B?NHFVd0V2TGNBT0Mxb29EZXFVS2dNODN1TW5mZGpVT2xjQUZrczByT3ByMTlk?=
 =?utf-8?B?MVhnaCtMV05MdHN1djdQVUUrK2pmbnN1cFc0dkorbG5RMHdiYko2WWhGVitU?=
 =?utf-8?B?MjVSaFVKRGtQYUduOHBBaXBZTDJzWVNMc0V3NUF3WTFUU2h5MldVOFFaZU0w?=
 =?utf-8?B?REY0NDN3UU9aN2dQdXZzSUdDWFpXMnlKcU1La1M2MkpScklRUXdsSGhiamNv?=
 =?utf-8?B?b2NXZ3ViSndOTFpRVWlLQmNIMzNvUjMyRzZGYUtMQVJ4Vzk5OGl1MStxRzIx?=
 =?utf-8?B?ckNYS1pnaXJoMksrUHljZTVRcVBRWUxpVTRNMnB2M0c0T2lCMUUramZnaith?=
 =?utf-8?B?WmJMODVKOENXK2xaYysyZERDbUlkSzJqTW15V3BMTlR1N3UxdVhnKzI5Nkd0?=
 =?utf-8?B?b2JzWHlLaldHZzJ5dGJIZ1E2SG0xL2hvbVZZT2U2ckNPblZSRG5NQVdSRXdD?=
 =?utf-8?B?bTNNUjI5eGVRdk8zU0ZrbzNhNFNWWGhTczJpUUJ4cG93N1hSYmtDQ2c4OTRY?=
 =?utf-8?B?NUxBTFowSXo4ZzdiM2hhU3o2Tm4xTUF1dTdtMlcxS25Mclg0LzQyTUxaaFFa?=
 =?utf-8?B?Rlh5TlpnYUlQajhDVkRwOURyd2VyU3NLQ1p4VGVBZUp3anZJcW1zTCs4dmlH?=
 =?utf-8?B?elRoSE9wYzZmenJhNDljV0lTQVB0YjM2c0s2akQ1UEJpQURxZ2NUcTc1UERE?=
 =?utf-8?B?NEJLRjFZTTdyZSt3YXBNaVFZME15KzRDTkovNDdlUUk4YUlXOUZGbm04bDR0?=
 =?utf-8?B?enBSQlRudk9KR3BuY2RqWUhCc0U1eHk3VnpGSmJtb2VuNFF1dXRpM2RTZnMx?=
 =?utf-8?B?SlFQU1pkeWpkOVFYdnUvOFZkVGd1Uy9lVHhZSEwvV1NnYVpxankrdXNUUi9V?=
 =?utf-8?B?MkQ2c0lwTkQyT0IwK1hNa1dZSnJENVRFN04rQnFmbDBEZDRkL0ppM05GbXVj?=
 =?utf-8?B?b29tZFQ4MlBwUHFxcCtucS83UXZhWWx6TTdaOG5NemEwMy9TZXhINUhUcXRz?=
 =?utf-8?B?VzVCM2duU2lyTlc3bFNEMVAyU1lmeEVsU1RQblRnZUZqaFJMUGdPb1FCZUcr?=
 =?utf-8?B?YTNUMmJFK3dwVTc3cU1OVTlidlJZRGxUemF0Tzh5Q1lRdWI2TitOTjhWL0g0?=
 =?utf-8?B?UDdic2hMOVdmVk5oMmdOa2RiL0JjamVqTW53dFBOU3dXRXBXeENuNjVjZlBy?=
 =?utf-8?B?a0UwMmRaMllaNno5Qkd1WDdDL0VlSUlWWEE4MjhwakZ0Y1RVRkk3RUo2OXZl?=
 =?utf-8?B?ejQ4NWhQZ3UzRUlPUENTaVlpbUlRVzVhV25CWThubXBDUjVtdGxvdGJJaXdx?=
 =?utf-8?B?K1lOb3QwdmtKTFMvR3dyMm1nK3piWEhGTTlJSmtWTENoV0VNcTdZZWVHRWhl?=
 =?utf-8?B?dU9SeHlBM3FkRnpPbVJwMERZMUhwbUxESysvR2RwQnArN0cwTkxGc0phZ3k3?=
 =?utf-8?B?d2RRWjQvNTRxSnRJUDRleGlocUNmVWhmNVEzelRWMkNudkUzNVRWUnkrVXhs?=
 =?utf-8?B?bWhYMlJrbm5oYmhISDhqeFViZ1pjK0pyL0tOZklqWlYydmNUOURzUjVyNWEz?=
 =?utf-8?B?ZDgybUlaYUtWKzlMQWdndGhvVHR4dDAwWEJreHVOV1U1SHRaQzJmSEJaQ3RC?=
 =?utf-8?B?N2ZGbFdRTldCamxGNXVLaUdnM0d6TGlPbXpRUmJtbkZMTXVMTkZMQ3k5NTdE?=
 =?utf-8?B?eGc4NXluNUhhMmJkQWlSYzFQUUlWMW93V2RwVkkrNXlzWTdDc3UxVUdTblJ0?=
 =?utf-8?B?eTBvVisxckR0MzBMWitZMVVyZzQvZmFURmo2TG5FQnp3RmFXTS9zWWlkSnUw?=
 =?utf-8?B?d0JMaE85eUtBTmpJQnlFR3lYOHJnbnZvV0xvNWJxSUsxQkMzeDd0VE1Ba1FD?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR02MB3676.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fbcbff-7e55-4533-44a7-08db621823ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 20:46:42.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCdZ/PejSKF0iPAvWv7ber5S1fCNt6svJlvkxpYumV9S4YrVopYhBqRXu6qJMNe7AP3TdlPwhcJ1toEeKa8Z3pcnTHc/gdifdN+E3A165fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4730
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 20:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103074

VGhpcyByZXZlcnRzIHRoZSBjb21taXQgZGY0N2Q4NzFjN2YzYmJlM2ZkZDhiMGVkNzIzMGQzYmZi
OGRhZjZmZC4NCg0KVGhlIGNvcnJlY3QgRElTVFJPX0ZFQVRVUkUgaXMgZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uLWRhdGEsDQp3aGljaCBzaGFsbCBhbHNvIGJlIHVzZWQgYnkgZmlyZXdhbGxkLg0KDQpT
aWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRoYXJkIDxwZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4N
Ci0tLQ0KIC4uLi9zeXN0ZW0tY29uZmlnLXByaW50ZXIvc3lzdGVtLWNvbmZpZy1wcmludGVyXzEu
NS4xOC5iYiAgICAgICB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxheWVy
cy9tZXRhLXB5dGhvbi9yZWNpcGVzLXByaW50aW5nL3N5c3RlbS1jb25maWctcHJpbnRlci9zeXN0
ZW0tY29uZmlnLXByaW50ZXJfMS41LjE4LmJiIGIvbWV0YS1uZXR3b3JraW5nL2R5bmFtaWMtbGF5
ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtcHJpbnRpbmcvc3lzdGVtLWNvbmZpZy1wcmludGVyL3N5
c3RlbS1jb25maWctcHJpbnRlcl8xLjUuMTguYmINCmluZGV4IGI2MzZhZDA3OWEuLmYwZmYyNGYz
NzYgMTAwNjQ0DQotLS0gYS9tZXRhLW5ldHdvcmtpbmcvZHluYW1pYy1sYXllcnMvbWV0YS1weXRo
b24vcmVjaXBlcy1wcmludGluZy9zeXN0ZW0tY29uZmlnLXByaW50ZXIvc3lzdGVtLWNvbmZpZy1w
cmludGVyXzEuNS4xOC5iYg0KKysrIGIvbWV0YS1uZXR3b3JraW5nL2R5bmFtaWMtbGF5ZXJzL21l
dGEtcHl0aG9uL3JlY2lwZXMtcHJpbnRpbmcvc3lzdGVtLWNvbmZpZy1wcmludGVyL3N5c3RlbS1j
b25maWctcHJpbnRlcl8xLjUuMTguYmINCkBAIC05LDcgKzksNyBAQCBTID0gIiR7V09SS0RJUn0v
Z2l0Ig0KIA0KIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcGtnY29uZmlnIHB5dGhvbjNuYXRp
dmUgZmVhdHVyZXNfY2hlY2sNCiANCi1SRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAiZ29iamVj
dC1pbnRyb3NwZWN0aW9uLWRhdGEgZ29iamVjdC1pbnRyb3NwZWN0aW9uIg0KK1JFUVVJUkVEX0RJ
U1RST19GRUFUVVJFUyA9ICJnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YSINCiANCiBERVBFTkRT
ID0gImN1cHMgZ2xpYi0yLjAgbGlidXNiIHhtbHRvLW5hdGl2ZSBkZXNrdG9wLWZpbGUtdXRpbHMt
bmF0aXZlIGF1dG9jb25mLWFyY2hpdmUtbmF0aXZlIg0KIA0KLS0gDQoyLjM0LjENCg0K

