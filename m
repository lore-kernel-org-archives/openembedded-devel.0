Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448ECC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:33:07 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.54])
 by mx.groups.io with SMTP id smtpd.web10.1216.1683822776528520261
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 09:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=E9eo/YBj;
 spf=pass (domain: advantech.cz, ip: 40.107.215.54, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLk+aoZYWGmQNRw+UFRptL87JHsSZ7yvuOrjD5Xev+9eMBgB9t/uc9hOX+zxvA1hT6kA046bthnyCGf5Lny3GB2zgNrS/S1zwGLS6BBA/ORg/6sDWDBNyz7RIYP5lCgha+7Y35c2y+Q+Xlk2MhLtA6T0Uh/ddlf54EhHwTiXo0sbQ8XIALsjX6frX/VpqxM2CzfpjqgdkhlvR8qUZ0Iari96vKLM8trM1anvQR/1aME7pvAeycPYmFoX4CN5mq6vbOUL3E1qkHCXzA3Dba3Rc85cQZQaCjbFWyI+hOlYrSrxzETqTjSsAr5mzb6idn7jMB1FcdXttekKd9w7+zShsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph8l362C2dS3Z9auGJnHoU3c7OxpLE3Xt1eOZhw4pGg=;
 b=CvRZcHNgU4LsY4MzXUazGtlWjxWF0NYQRjVCWFH6d/g8d7gH4jEniOnNk3JRDuXDGtX5iQ2xa06KrCBifxo9KPWXXQFFP5BfXpAasAh2eBWp0u6joyUWhmglBm5HCbt+kBzCc3L4Pm5MaSVBn/zMFKEZ9p+QvCKwjEFGzgG8AEyvezT1hOAfaq1H/tuFnuIjRlm05ypRvoF0KANbrP3Lf+7chQpWHwGfCIQkVGXManDtAgauYCRbrWrzTHTbUX73XQGjVTY2G/SFvU43ep91KMq5e0Nd3NwqOA2FrUmY083nXOt2Qswuc8r8H+RCOZ29GqV3huybg8/XXZu47JkTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph8l362C2dS3Z9auGJnHoU3c7OxpLE3Xt1eOZhw4pGg=;
 b=E9eo/YBjAeFI52fXFpa9sNgps+LdGXQ3Z1wqO1qLAmjF+ibNR8hIghFlEKFyltkuChxACd3IPGevC/ggL29FzaW49w0t1nw3vv8eqLSfzfwUgRau5BVXMAumrdbsBCV0m/iHAPr7E7+KHjPVlVhC6WXbve/a6bcdSCaS5Z3cgdGUB3/wpsnjUXyj+ibH2dqLWRv+6nt1wPajCW8jt1pubRt8u7Yd9Jw+pqNW2rYp4OIq7NNEXXFR/vsHk/A3/GI01jbaOiLZAtciYnhlImkOP+mHIURSROgcy3tKSRVfvrzmJJKeNtvEpkBEBqaTrGqWn3xCneKe0N4qvghgx+IGgQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB4953.apcprd02.prod.outlook.com (2603:1096:4:151::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 16:32:51 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%4]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 16:32:51 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] strongswan: add PACKAGECONFIG for the
 NetworkManager module
Thread-Topic: [meta-networking][PATCH] strongswan: add PACKAGECONFIG for the
 NetworkManager module
Thread-Index: AdmEJGUM/6fzLTpVRNqxnyjAOvsA2A==
Date: Thu, 11 May 2023 16:32:51 +0000
Message-ID: 
 <TY2PR02MB367818CCB1135690DB7D395181749@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB4953:EE_
x-ms-office365-filtering-correlation-id: 47f18288-64f8-4be9-b0f8-08db523d5d38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8HHIG+yfXmfO0tXnXP3THiQgEBByb2UfGy6zQoEZCctMt+mmIzGXuH8FLVPZx9AUNc3J6CgVytktCTVWAJEe9k423/Jp4MAjkgdNFVNYiiW7GrR2MTRxypuZZDajEbNIyd7SaVsAbomsZj0dez0/2qp/Cxqgb8AqJ2y5gL5+SZmeR1rzES2Vh5oZtPcpafpFAgJpz/9i266BevbtA5wFF0xYPbyHQ0STFt8AeHCx5UJ6ZalCFdWAqx3y9zullNOX7PwRwXwUFGtMVl3j7gxjBk+H2ga3n4p8S4JLMlaf49Xh8Fq9Mpi7h9fmmHFpWSFFB32wppoIzc7F/gphS9o48jdttlJJTI+4SH8pASC8QsNKUEYEL6FytdrxfE0fjWWlMPM+a51I4glMeZ0gF0HyMplU7iZL6uSTXdyVSGe7BCYndOcW53HGEkBmk2831PYSAiUHrlGrBQ4BzWB9bNqzzxm5l1UoxVrLSK4f9KuxfAsKCkAgfhRPCUXkFxBNM1qSI0UqfaQblAtNH/IPYsinm/N3+u4gcRANbM7GVKJRudQXwxeQOytgiLvQuHeU1S58gP7+C8ZJZiKJcpRKNFkSbUOqFHoV4j1cqpj5j9oFHCWsNi3IFWO1AKlZ8P27De3h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(86362001)(33656002)(66476007)(316002)(6916009)(66446008)(71200400001)(478600001)(66556008)(76116006)(66946007)(7696005)(64756008)(41300700001)(52536014)(8676002)(55016003)(5660300002)(8936002)(44832011)(2906002)(38070700005)(38100700002)(122000001)(6506007)(26005)(186003)(83380400001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHF3RjFkUTRoYStoeUV5N25qQldUQWcvT1RwZzNGWjFFZ093VDFQMDlRSHhp?=
 =?utf-8?B?RkZ6eWNMem0rNTZwZjh0ZXp6bEFvaWlIV3V0VXhHVGlWU09ZMisrVUthZmR1?=
 =?utf-8?B?TWhKTGZCNHhlbWNZOU8rQ1JORjM0R2w2S0YyVDVVb3V3M2JYVkEwbDRZZVZE?=
 =?utf-8?B?MnR2YVYvR285Z1l0WVE4UmVXdThJZ3p3US9aNk5NYUVXdTUwNWJIVUw2aFdN?=
 =?utf-8?B?OFNHVzU5RWhvdFdXejhCMnBiakcyejlqekZzZ2JEVjVwMWgrVUdPd1BYWXhZ?=
 =?utf-8?B?MjAxVTNRZENmcE1kbmxtOS92dWYxSUoycysvTkQwMFE3dW1rczFWZm41U1l2?=
 =?utf-8?B?bHBzK2RRbE9uRGZ6UHR5UVBxR056ZjU1V0RENHA2NUttVG85by9XZlBUTXJi?=
 =?utf-8?B?Ymo0NEhGdG9uS2ZobUJiK1l2TXYvOE9RK1Q1Q3JEUzkrS0lJZHRvWlJCMk1N?=
 =?utf-8?B?d0pMcTRONldxbkJFVFUwNWpCZXlDNDVJMkFuZkpKZ0xqemJ6K01mUXcwWktl?=
 =?utf-8?B?U2FEQlg3b3dWemFZdXZsWjZLemRMb2pTSWxZMU5TSkpjcnhiZVh2QmFKc2Ux?=
 =?utf-8?B?Tk1jR1ZURmZRTG1mK3RBZkp3ejM2WTdWbjhyYUdreEJzK1ovZGw3V0d2dnQx?=
 =?utf-8?B?VVVYamJYMkcwS2dWaFduczI1M0tmNUlSandoMGE2L3U2SlJNbVliSW1qTVY2?=
 =?utf-8?B?R3NwaUVGdWMwY2Vwc1VCWEcyVkVTd0tCQ3Aycy9hM2Yxb3hyNDNKS1p0MUlG?=
 =?utf-8?B?M1VWZUZmSjZYWktkaDIyUGttRlZ2NmxZbzBLKzI3czZDTE85ams5TUFiZDlp?=
 =?utf-8?B?RWM3WXJPck9QbkVPVHB2S0ZKWnAxZGxYSlpGK0VzQVpBYzh1d3FyY05QcVJK?=
 =?utf-8?B?a1NCeThMeGlxRHgzeUtPblY0NjF3eFlhUjBQSUpzUk5XNnNPWkhwUHZicUxU?=
 =?utf-8?B?RGVaSTRYMUprSFI3emZmR2RhK0lEbnB1c2xJbVRqQmtHTi9WYnp4clZkaEFo?=
 =?utf-8?B?VWRSTFcrWDVheE1ZNGx0bmNzOW8rOCtrYmFoZUUra25HcStjT0FnK1FxZlVI?=
 =?utf-8?B?Z0w2YktCUE1vcVpUejFWZkRXemRodThZVGRlZm9wV0J5cm1wc056V29EemJL?=
 =?utf-8?B?UHRyazRuM0xFWFYwTGMwQkNYNVN6cmpEWUh3dzRCUTR0cmJCRXd5akh4a0U4?=
 =?utf-8?B?TjlhR2FOK25WTENLdG5QelNpSUxxYzRISWZZWUp6eDhsMC9SY1JPT2pJMG9L?=
 =?utf-8?B?UUJEUlRONE1NUzNVTXpaZitxbDd6MWhlVVp5cnoyelh0aTJHWW82QUdWUlVP?=
 =?utf-8?B?RHhzcklRM3dHQnJSWW1OekFUVGVpcmtwTm5FSE05YUZvcldMdVFsRDJUbXZC?=
 =?utf-8?B?WnFaSkdKQS9XeVE4YkFZUVhVR1QweDZrSElPUWZ3MjlnaW1qY1JpZ0V6bzBv?=
 =?utf-8?B?VjZaU1c2eC9rS1YxZE9IREMzUmZINjhCMmhuNWdMM0NDY0N3bzg0a0s5b3B0?=
 =?utf-8?B?SC9GRko1bEgrWHdlWkd0aHBRRVBaSTZ6T2JmY0VaS2dsdGtMcGx1TFdLSGpX?=
 =?utf-8?B?ZzJYRSs0TVlLVkdVWW53U2JTVWlTa1RGcC9RdVN2TldWTWd0clZjUWRyTk5l?=
 =?utf-8?B?K3dVdEpqWmsxUjdBNGV5c0ttaHN0MUxDdFZualRYT0xjdXhEVkJhUjBSY3JN?=
 =?utf-8?B?Q0NLcnVaWHVldlNVcXRMN3BYdE5HMjVRRzdRbWRXeEpsbFpnYmV6eFFnMEdI?=
 =?utf-8?B?Y09OdzJIQVlueGJFVm5BOFJZNy9IdWkyV1BTVDNHclozNUpZdWdNdmwwWnU1?=
 =?utf-8?B?ZVhjdEg5U1cvVkZzT0JudFlHVzlQbS9wQ2Nlc3crTno3QUcySHFpOTB5L0dB?=
 =?utf-8?B?VWpUeVV3WWMwS29VdDBlLzhjaVFJZnhkSU9CanRSOVRvaGdlcm9SQzNLelBq?=
 =?utf-8?B?Q3h5S0FpYlJNZzFvZHJuU1JrT2Qzb08zK1YzeE5aQzh2dllSL1lUWkFiVTJC?=
 =?utf-8?B?Qkc5T3NwTXlHZVlsbmQwbG5xdWNhZyt1MEZsK1luU0lKdXpkeWdkMVlQZ2hj?=
 =?utf-8?B?S1ZNQTN5aDc5TDFMclNvNDYydUNGSUZBb2hSZjhyRmNwalhib3NHNXZlM0t2?=
 =?utf-8?B?UDUxbk1YN1RxQ2tLOWhZRjc4azk5a1pyekIwQ3lMZm52QVg3Z3pPWlE0VjhK?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f18288-64f8-4be9-b0f8-08db523d5d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 16:32:51.3500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlyBabfiD25T6zn9hzZjPwfhKXTJmRxk+4+Qr7bALuGqt7KfRfmOX+6kHjn3T5U1lI0SaxJ3EeWyt4B6UNm4r/xy+EJp8XhmXR5lfJewC3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4953
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102545

RGlzYWJsZWQgYnkgZGVmYXVsdC4gV2hlbiBlbmFibGVkLCBhIHBhY2thZ2UgJ3N0cm9uZ3N3YW4t
bm0nIGdldHMgY3JlYXRlZC4NClRoZSBwYWNrYWdlIG5hbWluZyBmb2xsb3dzIERlYmlhbi9VYnVu
dHUuDQoNClNpZ25lZC1vZmYtYnk6IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50
ZWNoLmN6Pg0KLS0tDQogLi4uL3JlY2lwZXMtc3VwcG9ydC9zdHJvbmdzd2FuL3N0cm9uZ3N3YW5f
NS45LjEwLmJiICAgICAgICAgIHwgNSArKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvc3Ry
b25nc3dhbi9zdHJvbmdzd2FuXzUuOS4xMC5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1
cHBvcnQvc3Ryb25nc3dhbi9zdHJvbmdzd2FuXzUuOS4xMC5iYg0KaW5kZXggOWNhYTI0OGZiMi4u
YWVjZDMyMTM5OCAxMDA2NDQNCi0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQv
c3Ryb25nc3dhbi9zdHJvbmdzd2FuXzUuOS4xMC5iYg0KKysrIGIvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC9zdHJvbmdzd2FuL3N0cm9uZ3N3YW5fNS45LjEwLmJiDQpAQCAtMzgsNiAr
MzgsNyBAQCBQQUNLQUdFQ09ORklHW2VhcC1tc2NoYXB2Ml0gPSAiLS1lbmFibGUtZWFwLW1zY2hh
cHYyLC0tZGlzYWJsZS1lYXAtbXNjaGFwdjIsLCR7UA0KIFBBQ0tBR0VDT05GSUdbZ21wXSA9ICIt
LWVuYWJsZS1nbXAsLS1kaXNhYmxlLWdtcCxnbXAsJHtQTn0tcGx1Z2luLWdtcCINCiBQQUNLQUdF
Q09ORklHW2xkYXBdID0gIi0tZW5hYmxlLWxkYXAsLS1kaXNhYmxlLWxkYXAsb3BlbmxkYXAsJHtQ
Tn0tcGx1Z2luLWxkYXAiDQogUEFDS0FHRUNPTkZJR1tteXNxbF0gPSAiLS1lbmFibGUtbXlzcWws
LS1kaXNhYmxlLW15c3FsLG15c3FsNSwke1BOfS1wbHVnaW4tbXlzcWwiDQorUEFDS0FHRUNPTkZJ
R1tubV0gPSAiLS1lbmFibGUtbm0sLS1kaXNhYmxlLW5tLG5ldHdvcmttYW5hZ2VyLCR7UE59LW5t
Ig0KIFBBQ0tBR0VDT05GSUdbb3BlbnNzbF0gPSAiLS1lbmFibGUtb3BlbnNzbCwtLWRpc2FibGUt
b3BlbnNzbCxvcGVuc3NsLCR7UE59LXBsdWdpbi1vcGVuc3NsIg0KIFBBQ0tBR0VDT05GSUdbc291
cF0gPSAiLS1lbmFibGUtc291cCwtLWRpc2FibGUtc291cCxsaWJzb3VwLTIuNCwke1BOfS1wbHVn
aW4tc291cCINCiBQQUNLQUdFQ09ORklHW3NxbGl0ZTNdID0gIi0tZW5hYmxlLXNxbGl0ZSwtLWRp
c2FibGUtc3FsaXRlLHNxbGl0ZTMsJHtQTn0tcGx1Z2luLXNxbGl0ZSINCkBAIC0xMDEsNiArMTAy
LDEwIEBAIEFMTE9XX0VNUFRZOiR7UE59LWltY3ZzID0gIjEiDQogRklMRVM6JHtQTn0taW1jdnMg
PSAiJHtsaWJkaXJ9L2lwc2VjL2ltY3ZzLyouc28iDQogRklMRVM6JHtQTn0taW1jdnMtZGJnICs9
ICIke2xpYmRpcn0vaXBzZWMvaW1jdnMvLmRlYnVnIg0KIA0KK1BBQ0tBR0VTID0rICIke1BOfS1u
bSAke1BOfS1ubS1kYmciDQorRklMRVM6JHtQTn0tbm0gPSAiJHtsaWJleGVjZGlyfS9pcHNlYy9j
aGFyb24tbm0gJHtkYXRhZGlyfS9kYnVzLTEvc3lzdGVtLmQvbm0tc3Ryb25nc3dhbi1zZXJ2aWNl
LmNvbmYiDQorRklMRVM6JHtQTn0tbm0tZGJnID0gIiR7bGliZXhlY2Rpcn0vaXBzZWMvLmRlYnVn
L2NoYXJvbi1ubSINCisNCiBQQUNLQUdFU19EWU5BTUlDICs9ICJeJHtQTn0tcGx1Z2luLS4qJCIN
CiBOT0FVVE9QQUNLQUdFREVCVUcgPSAiMSINCiANCi0tIA0KMi4zNC4xDQoNCg==

