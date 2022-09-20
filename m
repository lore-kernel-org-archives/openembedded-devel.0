Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51491ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:43:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.12033.1663681418491706361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bJ5lXvm6;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663681418; x=1695217418;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=k5GWFge+oxoayHau5aZACWuo35zHeFQrpszs35JHP4Y=;
  b=bJ5lXvm6LICdF4SK3Nvv1ySoPdjbaq2DRDL1qRQISYFNloih+m8+ppV1
   t63fvBnByBqCSuza9sS4rUcpFoO6Ml7iNXAnmEL0bKnnhjU4VNris67Kd
   Qqj48Ho4F0RnZnHuTGUh6Rgf5hVO5dk0N5WKAzvUJLJxfnUQHnS5TcL0+
   Jjsvk3UTlrgpqWr1nmiGvZBkwlm5NbEh110/Me09OrunwVV8kyT/+mlnO
   S16dl0yivD7fYCvrRnYi6P6/w7Fgr5uN3mYSR9+RMvrGakNTGpLdDUl5A
   hlYkRNdVIb8jNvepGfb8LQaTwC/UcmSlFmWqUaB8HzqIdskfn06hdd732
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282724829"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200";
   d="scan'208";a="282724829"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200";
   d="scan'208";a="621266194"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2022 06:43:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 06:43:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 06:43:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 06:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFNMJcexRSj5Srzy56nDwZl32V3ZIibj8JsyYpR8vRrEzPRmLTvgEjgu5t/+PxISlxcIenEt8zoIqCHLTiRHwFkMcpo5j73+Xh/nsD5C3f4XapfAZetKVnTniKBA0MNpW2JjU/dI2Bt2vELxQlZIu2UtqvfdXZk6cVfdG47YHLmVb6h+z9FDkVCBk9H2smInUQn5Hin4fWIRN//4Fr7hWdOQKOiGB/Atq7LLgyGd8KqfBrzcjn9hBNOzvqgOHzpVCYBpjnXYpNeNX/GeRPhZ3mrQALUSns8URJjfgOVmbS+EdoZH7jA6D9Y9kFClajBJ75nWgZQTz1qJEHzF4NBOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5GWFge+oxoayHau5aZACWuo35zHeFQrpszs35JHP4Y=;
 b=lr7VsSsCcFQJgGgYSaBeKxpaBGFYnBX9VPvAJMNxyjEkMRAQSAVx+5ARVvHb5Z7jQkhWNmZljIjeR9CG4OPuNUCc+4Cv2DKCdNHITBs6aMyr/wToBaDl6CICLWVkajKqjLXY0ZmRIK6nn3Zktr29nkVOQd3rm6NunsPheZr0upp63gAvyNg1uOuKv78+jvqY/NF/a7pCXq5QWAOAfnB5DcY7eCxvyQrz7lDi/6erCgDazq1h0JqDoXD8lKIQMnAof0aFTkYABK2hxn3kxAzvdUtf5UaUcmfCdKIcPCVSRtxK4oU3eSX/bTOA4reC5BHx5gj+fVWDbn/1XmGpq0bTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 13:43:34 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::71fb:9367:d62c:aabd]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::71fb:9367:d62c:aabd%6]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 13:43:34 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH] appstream-glib: fix manpage generation
Thread-Topic: [oe] [meta-gnome][PATCH] appstream-glib: fix manpage generation
Thread-Index: AQHYzMuFahkpy4oM2E6n+T5suu3S2K3oVFyA
Date: Tue, 20 Sep 2022 13:43:34 +0000
Message-ID: <c09422655df69cb886d0f0c8be483697181f3d16.camel@intel.com>
References: <20220920083157.660480-1-f_l_k@t-online.de>
In-Reply-To: <20220920083157.660480-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA1PR11MB5922:EE_
x-ms-office365-filtering-correlation-id: c4927e9a-50b7-44ce-7de2-08da9b0e1cec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FJBsh3VWARLIBwrhdpLuJmb2oNJZPHSiUModofLfo1Dc1d6efACRzedtKAzSS58ZH3jYme3O1xCj5PQYuFbtod72YyiHtSi3yTenEdgFfQ/0b0Qyf9tmJLIgDDVbr572kb7iEmqPi+TGVGTPi9YNO7SMWOpHIIi78axiWIAV419wu6bQGevpnyswtox2Gx06Jijwdwg226JRKlaTwLBgUoKCQkPFpW3oNTO7lc6LSFS6o8mHmNXd8JqVmi3GagKzVDNFvJL3XV9mmSlIE+kHNlDqeBHJxaiNvWW8AqPFlTp01DU2Cc+4w3Ea/5Vzc/VMOw2UBAelLBonepjszXlCPckfV5HHScPtLzbViDIwt0t/eghI7frXCFtXH60xzdIZ61DdT1Rqaz63w73uELNgs90up4cifXUsrq9oH32UnCoaa6Ib8zZV953OTe8nUE5SihiXlx1cbblxZ3UAnxZO5S6TZof2psxDCx06N7MRLqyshFtfXvJY6ST7WzSys+7DuNQTMmfmYoz1CD9SiIt0RKrKdqbr/9bPkBQVhou1VbSUJ2WgxDSmqFnYLF1AZt45Ie/4kcc+bu4lYVXoBD4+f/4+KoGqbfhBNQssW/Tc8TbzW5dGoEaUIsy2ofqq7Rc8fijf1QIP+YHzZZtMHDDGn9C70ONaIRWRiGKLOVfny8pjcYHW5/dnRY9ssAo26FelgqQB825autYIN/+0Ztu9dOFg0S5OV1s+GzdWEZROh5D+bwemkA/3/vWEbIYGQc9W2/J2pPSc224qHx9yTVmVo5uSg+YjP7uLf+g7iAI9dpLpkoGfKtFCMNi6wAleZ22oMEtwonNUm7aN1AK/FYOS2fz30WUjIru/p03NtWyZ/ZI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(110136005)(8936002)(91956017)(316002)(66556008)(66946007)(8676002)(66446008)(64756008)(86362001)(122000001)(19273905006)(82960400001)(5660300002)(38100700002)(66476007)(186003)(6506007)(41300700001)(71200400001)(6486002)(26005)(76116006)(2616005)(6512007)(478600001)(966005)(83380400001)(38070700005)(36756003)(2906002)(563064011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkN3cmN5cjcwQUNHZHE5MnFxMTRYMklBdnpDbHgvRGJwZkVCM1UyNGVjOU5n?=
 =?utf-8?B?dkhSTFVZTGczWkI2dmpyWjhHNmxDZmZqaGVmNXpjaWRoNTN0MzZZWEJIMWJF?=
 =?utf-8?B?OENwYzZzQ0dQeFpQNFRDdVVra0ZlK3VwL0FnbXQ1ZStkaTRVVHYxbmVwT3VH?=
 =?utf-8?B?Tm56ZkhyWjA0R0hVRlRJTzQ3ZC9hNUVnZ2F4VlVBYk5vODNwQU9PSmU2UFhI?=
 =?utf-8?B?a0RHYjR5VVljMEJiUWhpbU5xanpoMHhIOUxSWlV4ZlVMeHE0YnRseW85aCta?=
 =?utf-8?B?bnI4UERCR1pVOU95a1VWajJxUE0rUk5lK3J0eXA3eHQ4SXA0R2I5eGEreDh2?=
 =?utf-8?B?QmlLTkJpbDZDMHdzb0xnZWs2c01Vcmo1U3Nab0lKNHFjVjN1aXF0S25QS0VU?=
 =?utf-8?B?SHNqWTdWVmlMQlZROWtSMytBVUNuOXpvMlU0NmZkZGhReC9hRGwzQnlMVVp2?=
 =?utf-8?B?UU0vZlJRaDIvSXBCWTBSTTZueXAzVm5LQXc5ajJKM1dSd0dLTDVGQ1hBRnQ4?=
 =?utf-8?B?ZW8rc0hOSUZodHRpcDArWVRZdjVIZEVmajVwNGsyWU83Wk4vd3k1a2ZkS1My?=
 =?utf-8?B?ZjF3QVlGRFp4NDZsNlIxb0NUUENnTVRLRXdtMW85NEhuSGtpazd1SDlQUXRY?=
 =?utf-8?B?Z1NwcVhVaXRYVG5OQThsR2RzTHN0NkRWbFB0SDBJQ1dVZUU4Q3hPL3lJWGUx?=
 =?utf-8?B?OVQ2d1d3TmJDWVlZbnBXTGd0RFhzT0s3NzVmV2YvN0pON1JJWnlUc05aS0FS?=
 =?utf-8?B?OHRiYVZuNHV3RDF5Uy9IVkVYZTB0VmxNM1AyV2lhSGczYjMxQ2x3anNXUzhv?=
 =?utf-8?B?SzlCa1Mrc05qTEcrdTl3OHV6MVNmN0tNTDlWVCt4azA4bW12YlNrdWpRc2xR?=
 =?utf-8?B?dEJ0NnN3MDFmY0JCSmE0MVR5VGU4ZTB2UEFsUjQ1b1RUK3pFcVh4eDIzVXdR?=
 =?utf-8?B?NUhGWkFsZlZpSkRCeWlMeWxUWnM5SnBTZjVxT1Y0cmU3UUNFeEUxZjlhMk5i?=
 =?utf-8?B?anVMQjJiVTVwYWZpQ3kvVC9OS0RKN1FWSVFIZWltU0ZDZ0ltdDh4Nkc5dVFi?=
 =?utf-8?B?SzdvOVNodlh6R254aGx4S1dleWZnNGNZRG12RXV5b3AyaDhjbGFiMW9VZWN4?=
 =?utf-8?B?RXhINnE0ekd4TDJZSFNiQU1qcWg1VkViSmxIWm9Ja1VzYkxmMjVxU3hNeVZS?=
 =?utf-8?B?YWd5M0tlSHBhTS95YVh3aHNnVUw0enFGdUF1V3IyRlVjdVFhY1JreVMzdTZQ?=
 =?utf-8?B?RlBIcWxpY0JtYmFMZGVMMkQyT0kzRVhjbXpyYW5GRzhEOVFmQzZGTnRpclZM?=
 =?utf-8?B?Y0dyUFVaTUgyeVlRYTYvWDE2ZUNKOFFXS3gwYVphd2U0R24yaUJGbjMvZU5n?=
 =?utf-8?B?dWQ3N0oxSkhBZXFJWVJnVWRwbWw0UmZsNVlwK3k0SzhwSUJMNVdCYWZ3SkFR?=
 =?utf-8?B?cWlrK3N0eDE5TE02cUk4QnZpc29uWDc5U0tVaGpXNUhla3BLL1VlSjQwNndW?=
 =?utf-8?B?TGhyR2N1VmptT0dqc0JueW5zSzFhZCt0OFc5V2xFbzEzNFdiZVBEc3EwYWpm?=
 =?utf-8?B?Rm1HRytiUzVxemNCaFFwSVdrOGE0akppalZFYVprdkVkK1lLdUM4N2lWSUNS?=
 =?utf-8?B?S0UzMXJVNlFISDdjOFlhdFQxS3p2ZFNqZ0txWXJaKzhOaGF0REZKMDZQaVA2?=
 =?utf-8?B?YTFmQUJadjNHNE05SUlwZ1hVWTRDeW9rN1RXQXEzelNTQWJVYUhwUFpvamdV?=
 =?utf-8?B?Q3FBUXN5a1RUSVlJaTQ0bFRsWm5sb1Y1aXU1cDJPSEhiZGFsdk56UTdpTkpR?=
 =?utf-8?B?cFZxUkN3cjhDbXZkT20xUGRyb0g1cDduN3BFZXdrUUtLNVZKa3hmV1B4NmRO?=
 =?utf-8?B?b0RGZFRiVmtoeXpHQmowOEwzOWpFcE5na0ZvUUptQXJHS2RXcDJJTnZOSXFB?=
 =?utf-8?B?aGt4Z3RDd3ZZQ21RQjdmMFJaNHVTVklzSzQyOUUxNTRGSUVQaVN5azV2Skgw?=
 =?utf-8?B?OFpkRGNQQmFMR0trVkFLam1aTVZnakcxelhJazk1Vlg2S3V4S1drTU5kOEM5?=
 =?utf-8?B?UzY2eVdCWktNL0JIaGdqcGV3ZERHOWU0VnZwTlQ1T1dhUXN2WEw0cUJqZUlr?=
 =?utf-8?B?Z0pwMTU3TnJqTXBDS1dNQ1FBMDMwOUMvOEo0NkJLb1pPT3NnRnFSNFMzRXhU?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22F84AEE4309F7489EA4C8E917327708@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4927e9a-50b7-44ce-7de2-08da9b0e1cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 13:43:34.2986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bLNjm9Bs26r5IO00idBtUyUBIMLs5icSnshFsfC4Xp0erXwYe2Ah2afCGHWrL5SzKt7GKOr7479CTVqxhpN/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 13:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98907

T24gVHVlLCAyMDIyLTA5LTIwIGF0IDEwOjMxICswMjAwLCBNYXJrdXMgVm9sayB3cm90ZToNCj4g
Q3JlYXRpbmcgbWFucGFnZXMgaXMgc2V0IGJ5IGRlZmF1bHQgYnV0IGZhaWxzIHdpdGg6DQo+IA0K
PiA+IEkvTyBlcnJvciA6IEF0dGVtcHQgdG8gbG9hZCBuZXR3b3JrIGVudGl0eQ0KPiA+IGh0dHA6
Ly9kb2Nib29rLnNvdXJjZWZvcmdlLm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21hbnBhZ2VzL2Rv
Y2Jvb2sueHNsDQo+ID4gd2FybmluZzogZmFpbGVkIHRvIGxvYWQgZXh0ZXJuYWwgZW50aXR5DQo+
ID4gImh0dHA6Ly9kb2Nib29rLnNvdXJjZWZvcmdlLm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21h
bnBhZ2VzL2RvY2Jvbw0KPiA+IGsueHNsIg0KPiA+IGNhbm5vdCBwYXJzZQ0KPiA+IGh0dHA6Ly9k
b2Nib29rLnNvdXJjZWZvcmdlLm5ldC9yZWxlYXNlL3hzbC9jdXJyZW50L21hbnBhZ2VzL2RvY2Jv
b2sueHNsDQo+IA0KPiBEaXNhYmxlIG1hbnBhZ2UgZ2VuZXJhdGlvbiBieSBkZWZhdWx0IGJ1dCBm
aXggdGhlIGRlcGVuZGVuY2llcywgc28gaXQNCj4gd291bGRuJ3QgZmFpbA0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPg0KPiAtLS0NCj4gwqAuLi4v
cmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS1nbGliL2FwcHN0cmVhbS1nbGliXzAuNy4xOC5iYsKg
wqDCoCB8IDMNCj4gKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS1nbGli
L2FwcHN0cmVhbS0NCj4gZ2xpYl8wLjcuMTguYmIgYi9tZXRhLWdub21lL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0tZ2xpYi9hcHBzdHJlYW0tDQo+IGdsaWJfMC43LjE4LmJiDQo+IGluZGV4IDQ1
YTI4ZWQ5Ni4uYjVkNjBiMTNhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLWdub21lL3JlY2lwZXMtc3Vw
cG9ydC9hcHBzdHJlYW0tZ2xpYi9hcHBzdHJlYW0tDQo+IGdsaWJfMC43LjE4LmJiDQo+ICsrKyBi
L21ldGEtZ25vbWUvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS1nbGliL2FwcHN0cmVhbS0NCj4g
Z2xpYl8wLjcuMTguYmINCj4gQEAgLTI2LDYgKzI2LDkgQEAgRVhUUkFfT0VNRVNPTiA9ICIgXA0K
PiDCoMKgwqDCoCAtRHJwbT1mYWxzZSBcDQo+IMKgIg0KPiDCoA0KPiArUEFDS0FHRUNPTkZJRyA/
PSAiIg0KPiArUEFDS0FHRUNPTkZJR1ttYW5dID0gIi1EbWFuPXRydWUsLURtYW49ZmFsc2UsZG9j
Ym9vay14bWwtZHRkNC1uYXRpdmUNCj4gZG9jYm9vay14c2wtc3R5bGVzaGVldHMtbmF0aXZlIGxp
YnhzbHQtbmF0aXZlIg0KDQpJIHRoaW5rIHRoaXMgc2hvdWxkIGFsc28gaW5oZXJpdCBtYW5wYWdl
cyBiYmNsYXNzIGZvciBpdCB0byBiZSBlbmFibGVkDQpjb3JyZWN0bHkuIFRoZSBQQUNLQUdFQ09O
RklHIHdpbGwgYWxzbyBoYXZlIHRvIGJlIGNoYW5nZWQgdG8gbWFucGFnZXMNCnRoZW4uDQoNClRo
YW5rcywNCg0KQW51ag0KDQo+ICsNCj4gwqBGSUxFUzoke1BOfSArPSAiJHtsaWJkaXJ9L2FzYi1w
bHVnaW5zLTUiDQo+IMKgDQo+IMKgRklMRVM6JHtQTn0tZGV2ICs9ICIgXA0KPiANCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjOTg5MDApOg0KPiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS85ODkw
MA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85
Mzc5OTIxNy8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFudWoubWl0
dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

