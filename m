Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23773C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 02:29:19 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.338.1686104950851654056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 19:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=ilJQ2HeG;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1754; q=dns/txt; s=iport;
  t=1686104950; x=1687314550;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6y5DPBgwA/GuDApMxz10hIJt6skCAVCjkqjt3cfC024=;
  b=ilJQ2HeGx1+YWQBbmfalQmbsWQbMtLMxS9OqvbeqqA6+tJrNrtvYOV0d
   F0rv9UZk3cw9WbdbfTuGbYGB/yF+zsa/TSS4gMJEABLFX9iYqJm28wiFi
   HxjwOMlRUzjzwlJY+ZEV9N0WPrg9vhw73XyWo1tlDYh0+57N41ABejX/8
   A=;
X-IPAS-Result: =?us-ascii?q?A0BAAAB06n9kmIwNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEXBgEBCwGBXFJzAlkqEkeEUYNMA4UtiFWdaYElA1YPAQEBDQEBLgsLBAEBh?=
 =?us-ascii?q?QYCFoVTAiU1CA4BAgICAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBA?=
 =?us-ascii?q?QEBHhkFDhAnhWgNhgQBAQEBAwEREREMAQE3AQsEAgEIEQQBAQECAhkNAgICJ?=
 =?us-ascii?q?goVCAgCBAENBQgaglwBglwDARChNQGBPwKKJHqBMoEBgggBAQYEBZ8mAwaBF?=
 =?us-ascii?q?S0BiTmIJicbQIFNgViCMDg+gQWBXQKBYoNZOYIughiMG45lgSlvgR6BIn8CC?=
 =?us-ascii?q?QIRQSaBCghfgXNAAg1UCwtjgR1SPR6BKAICETwPBVJ7HQMHBAKBBRAvBwQyC?=
 =?us-ascii?q?RUJBgkYMCcGUwctJAkTFUIEg1oKgRFAFQ4RgkQ3A0QdQAMLcD01Bg4fBQQkH?=
 =?us-ascii?q?i2BVzBAgRECIiSdTgOEPgWBEwOXea1nCieDYYt7jRqIIBeEAaVTC5gIIIIvi?=
 =?us-ascii?q?wuaMQIEAgQFAg4BAQaBZQE3gVtwFYMiUhkPjiAZg1uCZI0VdTsCBwEKAQEDC?=
 =?us-ascii?q?YtGAQE?=
IronPort-PHdr: A9a23:p40ZyRFq/9JIH5f4gxq+yp1Gfu4Y04WdBeZdwpMjj7QLdbys4NG4e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HToeVNNFpPGbkbJ6ma38SZUHxz+MQRvIeGgAYXSjtit0Oya8JzIaAIOjz24Mvt+K
 RysplDJv9INyct6f78swwHApGdJfekeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:YrEbxKPkAQYwO+zvrR25l8FynXyQoLVcMsEvi/4bfWQNrUon1mRTn
 WVLXWjVPviNNjH9f4siOt+09koAu5TdydIwTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl510o48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjiIu4rxhKdY8VUAJliiDgYhSl
 oscs5PlHG/FPoWU8AgcexBcFyc7Nqpc9fqYZ3O+qseUiUbBdhMAwd03UxpwZtNeo70xWD0Wn
 RAbAGhlghSrnOm2wa6hTeVEjcU4J86tN4Qa0p1l5W+JVqx5Gc2aK0nMzeVx2W4Rv5pWIenbQ
 coyTR1IYBn6SDQabz/7D7pnzLv32RETaQZwr0qYo6cy6WXfwAF9lbTgLtfRUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rubLmSW+U4UIGfjnsPVrm1aUgGcUDXX6SGdXv9G3ln6kAc9zC
 3ATpDczp7Zq1xL1H9/yCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMcADDBnJJqLQHGx
 mNljPuyX2wy7OH9pWa1s+bK8GLjYUD5OEdfPUc5oR05D84PSW3Zpj3GVNJqFqLdYjbdRmyon
 2viQMTTe9wuYSMj3qG/+xXMhCih48ePRQ8u7QKRVWWghu+YWGJHT9HxgbQ4xa8fRGp8crVnl
 CNU8yR5xLtQZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggdBkxbZheImeyP
 RC7VeZtCHl7YSrCgUhfPtLZNijW5fOI+SnND6qNNYMePvCdiifepXAxDaJv44wduBF8zf5gU
 XtqWc2tFn0dQb921ya7Qvx17FPY7n5W+I8nfriil07P+ePHPBa9EO5ZWHPQNbpRxP3f/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcqu9JEILrXSfVYO9aNII6a5/I7NsrdNxsx9vuzJ5
 Xq6HERfzTLCabfvcm1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:0ihVAKEUNr2vfDsgpLqFR5HXdLJyesId70hD6qkvc31om52j+f
 xGws516fatskduZJhBo7q90KnpewK6yXcH2/hhAV7EZniohILIFvAv0WKG+V3d8kLFh5VgPS
 kLSdkFNDSdNykesS++2njGLz9C+qjIzEnLv5ai854Fd2gDAM0QjHYaNu/YKDwLeOAsP+teKH
 Po3Ls+m9PWQwVvUi3UPAhgYwHEnbD2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx9b6xOiGpmHbI+usMkZ
 6iGwmixsBq5dSqplWn2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZKIMvW0vFvLA
 BVNrCV2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMMIYDaxfzOmzGu/HQ1skiPg==
X-Talos-CUID: =?us-ascii?q?9a23=3AcLzykWrKUwyU5BYxmdBTasrmUc45QmeH0VvwH0j?=
 =?us-ascii?q?mFHtjVuW2FwHB/qwxxg=3D=3D?=
X-Talos-MUID: 9a23:UpYr7Asl7+JBYtQSas2nvhhnbeZRubySF0Urkb4inO6IOBZbEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Jun 2023 02:29:09 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 3572T9P3005411
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jun 2023 02:29:09 GMT
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,222,1681171200"; 
   d="scan'208";a="2607466"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
  by alln-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 02:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuCniNfSvQC065o8rjVQItkECuPJPhhHK9B9KAS0nO68NofEs0HBYr7g72qAR6ezFi+mb4et0iYbfYGYu0HEWKTU3a5wttKRfuSaUD7qATEzftJrcerEBwmGyqLZa4IOZ+Li68oABXnanGQiuCEEIh6rZT7WBh1311X2YR88cXkOGX5sHt4lFYYym8/NGwAwzYaVPhXhm0nAhi2X7Aaa0/n5lq+xRXWhOJw6krjPIpLzunCy8KLAtHhRFdrmV6BI/sriYumYPcftg3tasblHnl32xZKMs7iNNqaQWBv58Js+mdWGq0JZMGtB2TdYiQlwhP4ZQiOTtiXFNZeYCRdccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y5DPBgwA/GuDApMxz10hIJt6skCAVCjkqjt3cfC024=;
 b=bv4RVNcklgVN3xgthTBPRveslQqVGrd2KrPxhZPP2+ZrBjj3Gvk4Ijz7ybmVYX/W9pGGJM5JnAz+ENBZek45jEliB3tjQtBLZg4zhq2Jl0J/bmRMpad80d5k2dS8Yd0y2xIQsYPISOgFhiJWSGCDr4UTgVJr4zZ926cxL4c/b4GOW2WR9kFUSfJrCrkOAc30vWOBkQAP7vDW0YmwNAkENIjiVGBeAtQ+xpA8xsl4q0PNjgNKDR2A92/45b1bLJ1R9HJFyN90f35n94N3TH4R+v6pbR0o/lqvUhlcaGMozs12IOLyfqsBGeekt3IOrO1ce+3DjvtLjudmpSu1dF36TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y5DPBgwA/GuDApMxz10hIJt6skCAVCjkqjt3cfC024=;
 b=WAeXVuCwQefwFld+pzA+VTRgU4L5Bb16WjhSfXJkbnIRUFUgMZspmr07fyVJxegMESTODbgqfixczyRHJtXgUWwu7hk6rvXM14WToWinM67I0GLzoWBt7509+OhW4K6SbFykutrOrbl/ue0seSREaG4zrD111BCfHm3BVCtV6MI=
Received: from PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 by CH0PR11MB5708.namprd11.prod.outlook.com (2603:10b6:610:111::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 02:29:07 +0000
Received: from PH7PR11MB6697.namprd11.prod.outlook.com
 ([fe80::c316:7ceb:a3e5:8b81]) by PH7PR11MB6697.namprd11.prod.outlook.com
 ([fe80::c316:7ceb:a3e5:8b81%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 02:29:07 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yogita.Urade@windriver.com" <Yogita.Urade@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>
Subject: RE: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix
 CVE-2022-42867
Thread-Topic: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix
 CVE-2022-42867
Thread-Index: AQHZmDamFij7Oqn3zECTMhTDi6OzrK99reOAgAAau3CAAAfZgIAAyOQQ
Date: Wed, 7 Jun 2023 02:28:39 +0000
Deferred-Delivery: Wed, 7 Jun 2023 02:27:41 +0000
Message-ID: 
 <PH7PR11MB66970474CC2A87BE3CB6467EDC53A@PH7PR11MB6697.namprd11.prod.outlook.com>
References: <20230606052015.314199-1-yogita.urade@windriver.com>
	 <BL0PR11MB34105C7AAA71C1792213DDCE9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
	 <SJ0PR11MB67179F9E3E4E35904C1AD27DDC52A@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <0bb48a02c4a6cb40054efd4d987afc3aed6f756a.camel@linuxfoundation.org>
In-Reply-To: 
 <0bb48a02c4a6cb40054efd4d987afc3aed6f756a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6697:EE_|CH0PR11MB5708:EE_
x-ms-office365-filtering-correlation-id: 28ea77d2-74d4-446b-f1f8-08db66fef858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TcQAOBYsxk5ZQmD3sICF+XnMjp/lADTTezhsbU3wNFyOrlgOGO2MpaGwx1k+CXn+S81cgWvjrPINnqesFG3fl/mRiV1eKUBYdzlkTQqC4hlakbMsIfI4PHYRTNa6kLtVKNv/SAHRYoiVF/KOCdofo3KI7N3hk+IeiwxsDg5jvlNabQMfdXNX3ARz40m2y7aiTrobLXTZJAIjrzQxGqc/0HQ1lVf1ihkOQYQ1CcxOqh/PDvIPGmAVwHLBdYzfAVk7y0m7xfGM993+FyXwat5WWUvMKQ5oCx0UVDO/FCA3e5R8PzPxhJZSoFq7NFbwyxhAO15pSfytROnWsNdHoskA9UEfFqvzCXJ0KuiWJeuRt7levETFqs4vIuVSWeM65EfHcahR0xdkLO7fUyq6eFxAwkfdgw4Fr5RrXdzOQ/QnW0uB6ToVxr4pGiwMKQ3v9iGGOKxmDX8CnkmFUtE9eodN1tq1fCGDLI7KTlxwa22BRq2sF8f7iiGq1c26DmUWap51E3K3AaseukSHMM7yr/+Wao4vLxAtJxL22U4U6EI7h9bG56Pcsc143uzv7Cu5kXDfAkAFAI41H3f644Qgk9f2l3+VTBPY0KoQoGVDmwwfQ1g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6697.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(53546011)(86362001)(186003)(9686003)(55016003)(6506007)(33656002)(966005)(7696005)(83380400001)(6666004)(71200400001)(8936002)(8676002)(478600001)(5660300002)(110136005)(38070700005)(52536014)(38100700002)(2906002)(316002)(41300700001)(66946007)(122000001)(66446008)(4326008)(76116006)(66476007)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUtNN3UrbEIzOWQ2ejkreEExb3RTYXZKdWtiVlJFNVlrMENMbTVtQS9GMTNv?=
 =?utf-8?B?Z01sdU9Za3ZRbnJscmM0OEgyWWNzTDN6ZVdEdTc2aTZLZXYxbGFmMGMvNzIr?=
 =?utf-8?B?ZGF0SVp1MXY3Ry9LYjBvazA0WlJuNUtMVytkaE1aYVkzZXRBdHZoSmpXK0xt?=
 =?utf-8?B?aEZrMzFVMTRTWVY0SUpLdDg5cnVQSkx1WjNYRlJlckdtQnNiU1dYTWJFM3Vp?=
 =?utf-8?B?bGlSVHZsUkJ5YlpWUFpKK3VHTmpPeVNlWGNTODJEZk9oZ1YxTDJsejhEVzJ1?=
 =?utf-8?B?VEt0QVRtd3VjUzRpaWJDczhPZDQ2NlBZZXZteGdYNUxHa2JlVTFBMmg4K3BV?=
 =?utf-8?B?VVgvOHBmVFJDUnBUV2F1OVR1WXplSitnVnhLRkEyQkdldk1rWEFqOUxJY0FI?=
 =?utf-8?B?NTRBVWltalIrUGx5dmk4c1Z0M2lCZUlDc0p5Yk9wWmd4V1BoQ2VRc3h4bVlu?=
 =?utf-8?B?NDB5S1BFYkc2ZFEvem9LOUlEcXJRbkVqYlFaa2NPam5XK0hTelMrc1Vzem9s?=
 =?utf-8?B?dk5Sc0I2MkFQR0tkS3o5OVYzcGFkZ0ZOQ29icTJWVkE5akRuVmNiNCs1Sm55?=
 =?utf-8?B?RjFBZi9jTWJVT3NxcWtMcWJRTnNDR2MzN25GeTNGWGw0WWY4WEZjS2RGaXpR?=
 =?utf-8?B?dGRxcEM1SCtrMzFQdktySHBaTFUxZ3BxUklJSnFNYmhONkhBcFNMWFNnYVlw?=
 =?utf-8?B?Z0k2NHhWdlU1TkFZZUErSGd3VEdiZCtmTEFWcXhUTjJIRG5TVVdaRVh6VnhX?=
 =?utf-8?B?cTU0Zm5HL1VLWi9RTUN5bStzTk40ajNjNUNHbkQvWEZVY0JaazZNZjhuM0dE?=
 =?utf-8?B?K0hWejJCRS9ZMWQ1cnYxZFZLMW14c1BxMTZLSHNIVVNab1A4Q0RGOFhSbE9K?=
 =?utf-8?B?TUYrWmRJTHZPSUs0T3VUVENRK2dJYy9veWRIUEN5cC9kL2szMC85ZERPWkVy?=
 =?utf-8?B?VGdibDFkUWZCWUJsVWRKR2ZuYmlDQlRnRENVWWpsNzdZaWJhSHM4OTcwdE1E?=
 =?utf-8?B?bU9SdWVSWSsraWNDVUhPOG9TZjFxUE1WVThzeWUwVnhVSmRtMDZEaGZPTVVn?=
 =?utf-8?B?RTZ1NGl6aGZ6OFlrd0xoOFZyMFFobFdZdUg4MndncE4rSzdReUFiaVVycWhE?=
 =?utf-8?B?TzQ0czhuVDVQOElWUWxlWlkzaTFtWGxxY2FvRVVmU3hwMldHaWxqdDhWWEJ3?=
 =?utf-8?B?Q2c1cGMyb09mT3M3azkvS0g2NzJ0WWhqNk9jMGpEa25na2ZWWFprMEVLSXVK?=
 =?utf-8?B?NEZwNE9yR1lLaUU5SVdxU1ZTZzhmanQxRSt3eEhHSTQ2cjhVNVd1V1NwVUIr?=
 =?utf-8?B?RTVJMm1VZ3l3a2FoRE1EcWhrTk9jazlYc0R5MDN5a01rMW81czh4K0FPZlll?=
 =?utf-8?B?TTRvSWlqTWpkTUh5YjFwMWk0TGpEaUNpZ2xweFgwNkoyd0dHeXFmekZYMmRq?=
 =?utf-8?B?SUNlNS9acDQvN1lQQjl6M05ISTE5MW5RVFlWREc0VFllY3FtZStoeWtiTXNa?=
 =?utf-8?B?WlNibUF4Q0Jrc0hEODViZE40R2ZQN2hqbHI5V0I0cWV6WmN6SmNSQXB5SklX?=
 =?utf-8?B?NHIxR3k2QzdSVm1RUmZ4cFFDMzBiV2JicGZhamxvb3RGUnFnOEd1cVJlNHF1?=
 =?utf-8?B?OEtNNlR6ZnhwdnZGSFNtNUhkZ0IxdVhvczJwOUVRSGpZQlRBQkJVdlZUbSsw?=
 =?utf-8?B?aTE2QUlqeHUzenV3cnQvbFNXNlNtT0hHRWU3djdZS0JyRCtIdWZENTVrbnNx?=
 =?utf-8?B?VHJLRUJleEJDdlBHTEgzbDhaaTUrNmIzUVhiOWhyYjZpb0hSQTRuRjRPVUFT?=
 =?utf-8?B?UUY3ZGJzTSthemVUc2VPeTVTVWp4N3dZOE5OZEt0YVA1REhSMVlLVE5KbktY?=
 =?utf-8?B?anI4bUd6cWNKNE11VHJZN1d3SzhHbTc2d1JxQy9HVXFUZjRtTDZOMFBpYytZ?=
 =?utf-8?B?aXNHTWFwUTdSTWtqV3BXQkNmQk9ld2d2b2tLTmZvbjMrbURpZTJEWXBGUmJm?=
 =?utf-8?B?cWdqSlBaTVgwdEtIWmdBK1ZvUzVnb0ZEd0g0U2NaaDFHUm50d0xLSy9GQ0JQ?=
 =?utf-8?B?aUNsb1dBK284OUdFOCtZZUxjY1lFanR3RUJxNURHTXFUeC8wTkVHTWd1TllK?=
 =?utf-8?B?UUpKNWxORUtzZC9MQm5nNjVyZ2lycEM3TitYVjJ3eGRkMkZHMm5KdG44Vk9v?=
 =?utf-8?Q?h7U1a5VwFxqJsN2ckw5p1kIB50t2bAnqqO7BpeuCHvFs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6697.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ea77d2-74d4-446b-f1f8-08db66fef858
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 02:29:07.7236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKHU6OUMpPi+wV97fEcK/Ak7Txzz33q6d99LAwzm/ztxhCusdWkacHLPqmPkH4kgam0V46yLdyc61lvQqlcRtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5708
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 02:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103154

VGhhbmtzIFJpY2hhcmQsIGZvciB0aGUgaW5mb3JtYXRpb24uDQoNCkkgd2lsbCBpbnZlc3RpZ2F0
ZSB0aGlzIHBhcnQgYW5kIHNoYXJlIHVwZGF0ZSBpbiBuZXh0IDIgZGF5cy4NCi0gd2h5IENWRXMg
YXJlIG5vdCByZXBvcnRlZCBhZ2FpbnN0IHdlYmtpdGd0ayBwYWNrYWdlLg0KDQotIFNhbmpheQ0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogVHVlc2RheSwgSnVuZSA2LCAy
MDIzIDc6MzkgUE0NClRvOiBTYW5qYXlrdW1hciBrYW50aWJoYWkgQ2hpdHJvZGEgLVggKHNjaGl0
cm9kIC0gRS1JTkZPIENISVBTIElOQyBhdCBDaXNjbykgPHNjaGl0cm9kQGNpc2NvLmNvbT47IFlv
Z2l0YS5VcmFkZUB3aW5kcml2ZXIuY29tOyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KQ2M6IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPg0KU3ViamVj
dDogUmU6IFtvZV0gW29lLWNvcmVdW2tpcmtzdG9uZV1bUEFUQ0ggMS8xXSB3ZWJraXRndGs6IGZp
eCBDVkUtMjAyMi00Mjg2Nw0KDQpPbiBUdWUsIDIwMjMtMDYtMDYgYXQgMTM6NDcgKzAwMDAsIFNh
bmpheWt1bWFyIGthbnRpYmhhaSBDaGl0cm9kYSAtWCAoc2NoaXRyb2QgLSBFLUlORk8gQ0hJUFMg
SU5DIGF0IENpc2NvKSB3cm90ZToNCj4gDQo+IERvIHdlIGFjY2VwdCB0aGUgQ1ZFIGZpeGVzIHdo
aWNoIGFyZSBub3QgcmVwb3J0ZWQgaW4gb3VyIENWRSBtZXRyaWNzPw0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS9wYXRjaG1ldHJpY3MvY3ZlLXN0YXR1cy1r
DQo+IGlya3N0b25lLnR4dA0KPiDCoA0KPiBPbiB3aGljaCBpbWFnZSB3ZSBydW4gY3ZlX2NoZWNr
IHRhc2sgdG8gZ2VuZXJhdGUgQ1ZFIG1ldHJpY3M/IEFueSANCj4gaW1hZ2Ugd2hpY2ggcnVuIGZv
ciBhbGwgdGhlIHBhY2thZ2VzIGF2YWlsYWJsZSBpbiBTREs/DQoNClllcywgd2UgZG8gYWNjZXB0
IHN1Y2ggQ1ZFIGZpeGVzLiBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgdGhlIHRvb2wg
aXNuJ3Qgc2hvd2luZyB0aGVtIHRvbyB0aG91Z2ggaWYgcG9zc2libGUgYW5kIG1heWJlIGZpeCB0
aGF0Lg0KDQpXZSBkb24ndCBydW4gdGhlIGNoZWNrZXIgYWdhaW5zdCBpbWFnZXMsIHdlIHJ1biBp
dCBhZ2FpbnN0IGFsbCByZWNpcGVzIGluIE9FLUNvcmUgc28gaXQgc2hvdWxkIGhhdmUgc2hvd24g
dXAuDQoNCkNoZWVycywNCg0KUmljaGFyZA0K

