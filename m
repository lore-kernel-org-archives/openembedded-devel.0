Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EFEC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 02:55:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.4713.1690426548859292747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 19:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VIAmqtT9;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690426548; x=1721962548;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=uHwc5PAlJjn2WEjfzbQvN6z9Crc5VKz434Gj5aqOnj4=;
  b=VIAmqtT9U9UXCllEOxeAL2TXOlMcfPDjp8CdpnBG+Qr7t/bGQpUSW6j4
   aq762du9ySSYaATZTNu7MCSbLvKuFgHet1lMWgRxP9+DC9lEPSA+mBmp+
   MidtDUiRvxkWYEPTnVezyqwdak3GQu9sqiomXeBWehLr18vbMbyYwI/FG
   z9wzCFlsJRdvu41pUt365sIyP5netL6Tq6JhlcvoYYRgNPxqJdD/q2+Qp
   WUVWBb/a4ye/Ojrue0tlpTKfexjuNBTTV6A7Q7u9RFUGKBv2KEPse4l6D
   gVPOHK83JBFz/+Au/zC9UNY4doiTkvUhBXblFsRy0aU61nMI9XtVzbUOF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365646491"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="365646491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 19:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900689881"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="900689881"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 19:55:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:55:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 19:55:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 19:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMq2ftVLblaM602p8gcHP2CO/LEgPZS9byqzHx2+SGMvfyKX3u2roQCzsQKnL3OHDNCUNKpkb1A9oSfdEJnA1m/8hoFD2i/Zb0rPecZnC1M1I5ARUjAQNB8oeS6xJqKAhMiO3W5gRLaBPu8aOUHJ3Nj748ufwwmOlyeA84+TcV5lKN12+rYFvjvYh36pMbJb7X2jMW0JJa3dl+o8RNZ/0PToPKjMD+gSt4YT/gO13Sq+JKpwSrj/7thd+RUMRqKF5BWKdHjxyz7IkgSunMekcYpsbek/TBCjSb6NnRU9pfidaWW2WQkcnQJlhG9T4cZT4rDaY+2Rcjum1gWv3OllqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHwc5PAlJjn2WEjfzbQvN6z9Crc5VKz434Gj5aqOnj4=;
 b=YgoppsTfD8lfeEbgcvoXezqQ2dHBHsPsSe3qX+ozT8fy0YOjhDZLGAfuVMMGE7HjEcCnMv//OcgCgOVD3tfef/yACQT2qjBb8gzxwnbQqzBiQ03MHrjAcfEy8Ndu8r2cpajvzyqBJTjy0ppHXMO082SsLXEaSls4/wzbryjdS3eRC6y4S7S4Xm2ivLsK+pFSk2N/Svfj9Kd2XzZgMVK937OMW/cDl8hlIR5JdkfNYaPNlG1Rxz++TTZum7SYTOWDVeCCKMdIP53Xewx0FkVp9jGiQWrI+uHW8JBqngZDry2qWjNpL+aU5YhfrKB6U9bO067lR4659yOoImpubpy9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:55:46 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6609.025; Thu, 27 Jul 2023
 02:55:45 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "yi.zhao@eng.windriver.com"
	<yi.zhao@eng.windriver.com>
Subject: Re: [oe] [meta-networking][PATCH V2] vsomeip: add recipe
Thread-Topic: [oe] [meta-networking][PATCH V2] vsomeip: add recipe
Thread-Index: AQHZwDPLdXVvj6NOsk6DI8pRCHnkY6/M60OA
Date: Thu, 27 Jul 2023 02:55:45 +0000
Message-ID: <5325926049a47cf61b6fe57040b9f98189f0e968.camel@intel.com>
References: <20230727023924.1121571-1-yi.zhao@windriver.com>
In-Reply-To: <20230727023924.1121571-1-yi.zhao@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA0PR11MB7864:EE_
x-ms-office365-filtering-correlation-id: b511e5cf-8a9f-4948-c763-08db8e4cf921
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VTSzBbUrv4iptv8RjJ4Ed2+Gxp1BbE80lm8NaAXIXaDtfHHU4xsyEcHG0QI0Z37H9b5ANIPCNUAybyZSPaHKCRmgQq84Pk+9eh+ZmS4JNbVefq2Dso73r+8BPDgRsVQT63d9Z9sRBeHDSCGGW6ds72RowcuZm79abXLhGiXavd46Mdj/ZrpqZ6nSZIbmNt1GQCTZMNC2MT9yaO6VDsq3X4gKWTaWZyR80zag9XIAMawndFWUeOxRO00c4oCzkbouLcLZuhXLV4XnhIN1gbph/V82Lgcfi/q08MAu8neShyp9HKIIZZSW1jTjyGPE8HVvqE5lfnwUO2k7TODuJbbZfiuL4U/SFJzBM018DLsknQSaOG1uCrWP/k6GLnNnAUZ54GKRRAIdG8OzQKJfigbw5nSm++2xg6K6AMv8ZaED6niPMuk/DuBJ3LwrF4+a0N+tBl6zY4hfd1h/vgAt30boKW6emiprImFzy62h0YLD1mOlJnuZh3zzAkKRdTx3O1kS9AF+fBaybRPO09X1VElq1uEt+guiEoLoI+BaMLeIl0WELld0FiaT16aH1HSjDcOBaNJ550D8YG4DdeOF3CuCTwD8b+uj0kZDMbRaAjyORaQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(6512007)(110136005)(6486002)(966005)(478600001)(83380400001)(86362001)(36756003)(38070700005)(66446008)(2906002)(66556008)(71200400001)(2616005)(66476007)(186003)(6506007)(26005)(82960400001)(64756008)(122000001)(38100700002)(76116006)(66946007)(91956017)(316002)(41300700001)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akNKZ2FrSzVjOUsxRTlrdW9tS0sxNnlDb3FnVm1laUVYUDB4alFseVIxWkRY?=
 =?utf-8?B?RDVocFROekVDWnZWNFNFb1pQU3BVZXUyRzVQLzVxWndNNTBVR3QzK3VqSmhx?=
 =?utf-8?B?V0Y5c29xTUMyOHVCOHpNQmJPNTNBNzQ0VHRrc2FuNlNCck5rcGRTejEvdUNj?=
 =?utf-8?B?U1pxdnh1bHA5Y0Q1RDlJWVpmLzh2NlA3RFlkdzk1Nlc1ZGMwbjhHZWh0NFJj?=
 =?utf-8?B?QzdkTmZXdDIrcXZGL2FJMlMvRlU5WjNqQlJaTVFlWVlwcXVNbytzUHp6Vkkw?=
 =?utf-8?B?TXJ0TUJxWmZ3OGN2ckJTUEx5Q2NHOGdYcWZKQzNBVGN6SldFUUw5ODNNSDZ1?=
 =?utf-8?B?bHRXWnFJRUtHU3EzaENMZmZreThuSVowYjNWMGE4NEMvN0VXenE3blBjVU9U?=
 =?utf-8?B?alpxK3RqYWdrSE1zV2JIeEpiTHIvOHc3cUcrWGRHUG1acUVmLy9aVHE2Tk44?=
 =?utf-8?B?ZlpjbFVwNm5sSmY1bTJCVTZrbkcrSzFTRG56UkZYekJxbUFrU0RNYk84WGVZ?=
 =?utf-8?B?aWFFRG5TTTFZT2ZLSXJOSXlibDl4RWJkS1dwNnZ3MjJFK0tPNFBtbjBtZDBU?=
 =?utf-8?B?OEVMUnJ0QUx6Z0Jpa0o0YW5nNkdLMW1PRUx4eU51SXNQY0t3MGwxdzVyVEcz?=
 =?utf-8?B?QmhYdzQ3aXM1K1A3OGhUcmh5TzV3U2hvRHIrOWV5anN5MDVOSE9YVStLRkFm?=
 =?utf-8?B?ZXc1RUxaMVpkVzJaci91dlc4MTRiRDU1c0NOMUhhalcrdXRJRGRMbGJxSWNQ?=
 =?utf-8?B?U0gvZjZuMkNTVDZmWU5STVg5OGJTMUJuUmI3Skt4enlFYnlEWEdCOTRJbmRX?=
 =?utf-8?B?VmJZTlFPRC9HbXRZa2JyVXpjZzJoN052b0xkN1BscTd2T0xiK3VoSDZSdnQ2?=
 =?utf-8?B?b0xOeW9JKzMzcEZoN1pGcStnREtrdytrcFNQQmZUcXJTVVNxV1FQemtMWU5N?=
 =?utf-8?B?ZXgzMlU4b2RJaktxKzJmUkdXN3F2Q25rYzlkVlpWMWdNcVB3OStkV3MrTG45?=
 =?utf-8?B?QW5nVjlMaDVheXpublp4NVB2UDhKNXpBR1pEdlFUNHhDeHdIOXNOY0hLTG5X?=
 =?utf-8?B?dUxEaHdHQ0I5d0tUanZrNHdFWTk1WFlJZGZCVjZRdUs4aWJmS0lQSTlvVkt4?=
 =?utf-8?B?aUU4UHJZVDZjdW5pclcwMVlPWVBINlJ4cXBxd2RyWWl2Q2I5ZC9TY1VnT3ZZ?=
 =?utf-8?B?b0l6Y1Z4elMvOUFCN1hVT3NFTUVDYUh5WnFnNE5nY1BqbUs2aGVxQW9Nc2Jq?=
 =?utf-8?B?ckpwcnArMjExVlRyMzlxUkJwMlJlbHhtWVlRdHlqWmVyZGdNMUFHc1NmL2xS?=
 =?utf-8?B?N2dkZ0paV0lsc0VwQ3Q3Z09WaXZSSW1ZK0d4ajZqdkpNcjhONngzZFlkYldQ?=
 =?utf-8?B?aDVic1Y1WUtyUVgxWm4wRW5wdjBIZ3Rka2Mrd091M0thOU1ibjNhMGlZaXhm?=
 =?utf-8?B?S1RKQ3BScitaeTBEMkRkQWpqQm15dUNOTVBnQzc1K3FoU3NWYW5IVjUzcFJZ?=
 =?utf-8?B?YmNxd3JTNXlLS05NSVJBbExCZWd6TG9UMlowdlF5aG9MS1cwMndIK0d5MFls?=
 =?utf-8?B?N1VKaWRjWUF3OEM5NU9IMEZJM3VUT1BQeWtNU04zYUE3c2FVR2xXVGgycWM3?=
 =?utf-8?B?MzVKeU4wQURISkRuY25JSk1Ua1F6bWtHU1lreUFhT2k2UVROS1hTUy94aC9K?=
 =?utf-8?B?M2N3aUpQRGIwUHBMWk9ENVdCZDZoWG5yd2dwS2U4VUV1TjV1S09JVGt5ZXcy?=
 =?utf-8?B?SUJkQ2dseDVwOFFKRmNCcENqSm1iUDFhOWNMVDdOWnB2VTdicSs5OU1wSkJM?=
 =?utf-8?B?Nm9keXd5c2FPVXFqKzUrZUxIQzVRNS9XenFJR3ZlNFozcG1ldDE4MkdGcllZ?=
 =?utf-8?B?cjJpanJkSEk2cDNFMHJydnFsV3liZDdqaEJoclpsNFRGamJLOGRpK3FSTTR5?=
 =?utf-8?B?M0NXejNtQ3pPbWZrQlZBVTFCRDBZL1NDZm1Sd2xRb3l3eHN2MnJuNjV6WHF5?=
 =?utf-8?B?ZmV0N0hYcFpvOW1pR1o4TVJzcDhNUmxYdExXZjYrQ0pmallNOVViS1Z6T1Er?=
 =?utf-8?B?bWpRbHVWd2JUczZtbnZqQkZlTHF5RDRwdTNtMW45eEZsTHY0bzVwNzhuVmJH?=
 =?utf-8?B?TEZwWFo2aEc4WVE1d05UeWNYbzRQRDVHRjUyYjZCVWk3ckNHT2V0Z0lITE9u?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35CC3DDEB27B5540A5A7429412A7C661@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b511e5cf-8a9f-4948-c763-08db8e4cf921
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 02:55:45.0925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GSZqXFxTh+oBzBt/opYA6UvZCdOKbGYI565k4Xxy9Nq8MTiNsp+UTRoe/bcG0HSr2uFQjgjCsSQis2+9CO3Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 02:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104044

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDEwOjM5ICswODAwLCBZaSBaaGFvIHdyb3RlOg0KPiBUaGUg
dnNvbWVpcCBzdGFjayBpbXBsZW1lbnRzIHRoZSBodHRwOi8vc29tZS1pcC5jb20vwqAoU2NhbGFi
bGUNCj4gc2VydmljZS1PcmllbnRlZCBNaWRkbGV3YXJFIG92ZXIgSVAgKFNPTUUvSVApKSBwcm90
b2NvbC4NCj4gVGhlIHN0YWNrIGNvbnNpc3RzIG91dCBvZjoNCj4gwqAgYSBzaGFyZWQgbGlicmFy
eSBmb3IgU09NRS9JUCAobGlidnNvbWVpcDMuc28pDQo+IMKgIGEgc2hhcmVkIGxpYnJhcnkgZm9y
IFNPTUUvSVAncyBjb25maWd1cmF0aW9uIG1vZHVsZQ0KPiDCoCAobGlidnNvbWVpcDMtY2ZnLnNv
KQ0KPiDCoCBhIHNoYXJlZCBsaWJyYXJ5IGZvciBTT01FL0lQJ3Mgc2VydmljZSBkaXNjb3ZlcnkN
Cj4gwqAgKGxpYnZzb21laXAzLXNkLnNvKQ0KPiDCoCBhIHNoYXJlZCBsaWJyYXJ5IGZvciBTT01F
L0lQJ3MgRTJFIHByb3RlY3Rpb24gbW9kdWxlDQo+IMKgIChsaWJ2c29tZWlwMy1lMmUuc28pDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBZaSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5jb20+DQo+IC0t
LQ0KPiBWMiBDaGFuZ2U6IGZpeCBidWlsZCB3aXRoIG5vZGlzdHJvDQo+IMKgLi4uLzAwMDEtRml4
LXBrZ2NvbmZpZy1kaXItZm9yLW11bHRpbGliLnBhdGNoIHzCoMKgwqAgMjggKw0KPiDCoC4uLmUt
Y29uZmlndXJhdGlvbi1maWxlcy10by1ldGMtdnNvbWVpcC5wYXRjaCB8wqDCoMKgIDI4ICsNCj4g
wqAuLi4vMDAwMy1Eby1ub3QtYnVpbGQtZXh0ZXJuYWwtZ3Rlc3QucGF0Y2jCoMKgwqAgfMKgwqDC
oCA2OCArDQo+IMKgLi4uL3Zzb21laXAvMDAwNC1TdXBwb3J0LWJvb3N0LTEuNzYucGF0Y2jCoMKg
wqDCoCB8IDE0MjIwDQo+ICsrKysrKysrKysrKysrKysNCj4gwqAuLi51cHBvcnQtc28tdGhhdC12
c29tZWlwMy13aWxsLWNvbXBpbGUucGF0Y2ggfCAxNDIxNg0KPiArKysrKysrKysrKysrKysNCj4g
wqAuLi4vdnNvbWVpcC8wMDA2LVN1cHBvcnQtYm9vc3QtMS44Mi5wYXRjaMKgwqDCoMKgIHzCoMKg
wqAgMzIgKw0KPiDCoC4uLnVwLW9mLXdhcm5pbmdzLXRoYXQtZ2NjLTEyLjEuMS1maXJlZC5wYXRj
aCB8wqDCoCAyOTggKw0KPiDCoC4uLjgtRG8tbm90LXNwZWNpZnktUElFLWZsYWctZXhwbGljaXRs
eS5wYXRjaCB8wqDCoMKgIDQxICsNCj4gwqAuLi4vdnNvbWVpcC92c29tZWlwXzMuMS4yMC4zLmJi
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDcyICsNCg0KSXMgdGhlcmUgc29t
ZSByZWFzb24gd2h5IHlvdSBhcmUgYWRkaW5nIHRoaXMgcmVjaXBlIGZvciBhbiBvbGRlcg0KdmVy
c2lvbiBhbmQgdGhlbiBhZGRpbmcgYmlnIGJhY2twb3J0IHBhdGNoZXMgaW5zdGVhZCBvZiBqdXN0
IHRha2luZyBhDQpuZXdlciB2ZXJzaW9uPw0KDQpUaGFua3MsDQoNCkFudWoNCg==

