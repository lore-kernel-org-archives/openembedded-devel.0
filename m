Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC0FCCF9EE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 01:35:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.web10.18073.1761788148869944765
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 18:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bp5Yjx2y;
 spf=pass (domain: intel.com, ip: 192.198.163.15, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761788149; x=1793324149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4jDi/7HfhsA5fPPbbJq2svwGUQd0jEDaAplVS2V1KgI=;
  b=bp5Yjx2y7SgUZlzp3cLj7RmAQj6fiFBsyHDLlURhNjmyi0Drp5gkb31v
   /+J5uyvqzLKzsSgfrq3e9E6JMDT/oudCwl/a5WlR6DnzLtD8vJ8pBw/IZ
   kGkaPBNed7oOIjwGqxYmq6ajbCzkqhdxNZiplyjsVJQt8EVeu2b3TaIh8
   rcsnQf8G/v6QGR+l6p3IKQ1lE+1gRE+Vg4Ye7SGKNpCi1KVuWitW9n1p1
   RZlC9lJ+2QPp0/4GNheBnnZd+ZFih9+jW742N7ps1PsHGpo/97eVMF4S+
   jcEZl0JdDf7mdTN4iDmdMTjI7/O9qxKVPBh3bKEEuLBt0ddunVEQvd5Gz
   g==;
X-CSE-ConnectionGUID: OP0tFomMQd+BbWGtS51y4g==
X-CSE-MsgGUID: p7uxOUOKRi+cNTxy0yeKKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64019635"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64019635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:35:48 -0700
X-CSE-ConnectionGUID: xVabswcbQ9q+ya1RUvJEmg==
X-CSE-MsgGUID: zHBvuwjOSI26uqsxozzi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185702084"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:35:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:35:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 18:35:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+MNhPj34xoWwAcB8uufQHYClIicmkDyulqgb3GwQofGPS7b8W/HiTXKCgja9+YBbxWEyjopqONe6dMbl/lP1OnMH8epClk7Pxkmel5eHPr2BQriSVojMPVxuWtB0ZL4CLm8GK8uPpqX/QsFfttqSJsHbjeTOADrvgZsFl9YnvO4PU2Bg4LK3yji4Pj2L8l58oBs0PVw+ME6RcCyeDvugO2fuVeR7nspJhyXVYHlONeK/tXKOwlh80ZABDgwtD8DpZ7VxDRUKUaxN8App2+G8RYtBrN18gOnZBZ0o6+2u/HzA7P6E29mj9Xf5+b7arIOW6mjbSVQH8KsVm+hgAWbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jDi/7HfhsA5fPPbbJq2svwGUQd0jEDaAplVS2V1KgI=;
 b=wMpT0tIS7xQJ0YxCGxlEL6YMs5wPi24+9R7kzJhj6TCLvfym46PzBxYd6aaqBF1nQVotARCVo/Nn6AwfYWl53EVsyJjKG12noXhsUTy5o1XXoOilUtKUj8plb3a2/6gj+DDdo5E4S4Goj5sIg/buNXMjTeVPIBvwNV0wqUMREFOuG2anTD5qi2oV3+ysYtjFrONS03ey1mtDanvppOQwo9wJZeoQ7xbDC6qRwHuTzhBwtC8H6o8/p5F6OkPhD8fqryFlK8RKTUTsQt3SnGHax/g5nfn3K8M4SWeez0J5GWyRUC+LXaAfzx0LvAVMI5kH4v0bZiE1cYay01LotuT5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 01:35:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 01:35:45 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 ->
 2.44.3
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1
 -> 2.44.3
Thread-Index: AQHcHj62CcW8wG8FC0WmwJIgrUpNzrTZJfvwgAESygCAAAPCgIAAAf6A
Date: Thu, 30 Oct 2025 01:35:45 +0000
Message-ID: <fbcbf6a0f7b3111ed3784242c3ed39adcdeb3e16.camel@intel.com>
References: <186254E5AFCF9A1C.28137@lists.openembedded.org>
	 <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
	 <56d9e7c77a9924f1ec4f526a0a083d2652243b44.camel@intel.com>
	 <CAMKF1srL9oF4h1K0E+ejj-TxerhHyC2s_GiAe8jAnTFey6_xkA@mail.gmail.com>
In-Reply-To: <CAMKF1srL9oF4h1K0E+ejj-TxerhHyC2s_GiAe8jAnTFey6_xkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB7495:EE_
x-ms-office365-filtering-correlation-id: 5e97d2cd-099a-4ff7-0c69-08de1754a5b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NWUzMy9uY1ltYzRPOFF6VExTRVdDQXlmS2lETDA5VjVlbFZ1U1hUYll0Njdw?=
 =?utf-8?B?eGwweThFSWtxR3RqTE44akZoeGdGSDQwd0ZEVFdNL0h1RXVZMG9id2J6d1cv?=
 =?utf-8?B?M1hLdk84cGtINVowcGROWXZydFNjbVRwc0NiQlVpV1Z5VC8wWkFhaWV3eGJy?=
 =?utf-8?B?T01YZ0xPK2NoNGNtQ2lSTi80Y3ZLcXg3RDJpK1FsWjZXVWNRRExRS3czeFRI?=
 =?utf-8?B?cW01cVpsOWM5akFyVnJkWmc2KzN4M1BTRVo2ekg0eG1vaVJrU3I3Uk9FWkZ1?=
 =?utf-8?B?T0VkTmt3UnhiNWxRN3VLa3Q3dXpsSGhVQUp3ME9vSktVcm55amtoQmVGekFy?=
 =?utf-8?B?M0lYQVUyYnZKaHltUWNTTmluQ1JoRGhxSkEzMFVmSjgxSWQwSDB6dlNxWXh1?=
 =?utf-8?B?STdUY1RGUlU2cUZGa0pQbktPT2JwdUJuMjlWcFZ2dG5IOTM3TmVZbldsWTdy?=
 =?utf-8?B?eWpObEdabU9pM1ZEUjRVUGxORFBwOS8yNzlLR2tza3l3ZzlySktBY2ZXMVRE?=
 =?utf-8?B?QUNNSFlUY2lmVVhReWZpUzhkRDlzazBMTGwvZi9YWC8rNkVJMFhpWEZQbjlp?=
 =?utf-8?B?VXhkM0JHRmx4OXl0dlR4SXVXeGRTdnFFRUJNOHFLMzVERDA4ZkdRTzNxUExU?=
 =?utf-8?B?M29kWG9IR2x0V2FuYnFPcnBrUUdiMDczMzhmQW5tVDhHMXB6QlgzTXhBRndC?=
 =?utf-8?B?WHQxUzRBMnBsMUNVbm1DZTJTaEUxMzVuRXVHc21TUmhZT1V5Tkh3Um41YVZx?=
 =?utf-8?B?TnFOSmtNdGcra3VnQ1RnNEtFMGFGUFd1ZW01c1o3dUJDUGVIaVJ5SFJJTVVX?=
 =?utf-8?B?TDZta0VPV0gwM21ocXdnMzRuMmYzb1NMdVo5Z2V0VVVVZlJVbEhFY2kzRXAx?=
 =?utf-8?B?VHFNRjcxUkZ5VzhXdktnNkdqOGtDUXFKVkdVS3JrOFRBUFdKOWlGQVFiTXlu?=
 =?utf-8?B?S3o5em9xSzV6OVVPYXpQWEc3VzgxdGJCVm1vY2NEMUdmbmluQyttc3NQdWFH?=
 =?utf-8?B?TmtvdEIvbGRHcjYxZGYyUCtqZUlVaFp4eGYwSVU5ZVJSSXVBL0ZzdlZyNlcw?=
 =?utf-8?B?bXdoUHlLamg5NlYrcExMM3U1dFJQSzBBbnhaSnNKTGJ4cnA5VUZmUUpTSG5C?=
 =?utf-8?B?L2U4SjNRakE4YkRHMW9TUGFNcG1qTC9jTklFb2doaFJzRktrUnpaaWp1NGNa?=
 =?utf-8?B?K1lCaXI5b2FucTYwekpzVEJGcFNZUmtqNEYvUmlTclUxb2QvWlVTVG4wUjRk?=
 =?utf-8?B?c3N1ajV3NUIwaklxTlo4RUpJTnNBdWN0d25sNnhjSDllVzVkSkRRdmlXQnkw?=
 =?utf-8?B?UnhpenE3bm5nVjZRdHFDK1dxOXVmWkFnL0NkRmw4bml5MThrSlI5cWhsUi9D?=
 =?utf-8?B?VW4xVGJ4TElURng3d3JiRkpYemRwYmJrVVBrbTYvUHU2T05FMmdQR211VXlp?=
 =?utf-8?B?cTR6N01yd3JvN0E2UVhIT3ZndTdIb2gwNnVPbFprS1Q1RkNBc3ZSV2hodGE0?=
 =?utf-8?B?ZjlXa0xHTkZpaGQyaktJRGpYeElDUlErcTRXY0pyb2I5KzVMaEFiajJna0RW?=
 =?utf-8?B?b3FwcXJMQ3dHbGRSazhKV2lqUDFqRGxEcnJVQTFvRXJ5VXY5UC9kM21QR0Nx?=
 =?utf-8?B?NHNuTXA0M0VHMFZxeXdBVVo5U0JsZjd3bUNoN0NReTFFa1l2cEk5Zk1CQk1I?=
 =?utf-8?B?ZmpDbnFkTTh3WE55VVlNZlFPVlVVT1VPb1M2NDgvWHJXbUsvYVlhTDRpN2tH?=
 =?utf-8?B?bTFsQ0lkRkd1aElmeFphaDBVbkZxMHl4eU1nL1ptY0VaWTIwYkFuTENwVGlP?=
 =?utf-8?B?SmgvSGYwMTV0MUQ3dzdzU2Q5UGVIRG9kcUZndmc1U0lpKzkreTkyK3lZUU1K?=
 =?utf-8?B?QW9Gb2pMM21VMDhwWHluVmk0WjB0QWltdW9rdDl1WXhVSEZlTHBKSGx0Tlpl?=
 =?utf-8?B?K254K2p0bWh2cHV3QU9hSWFNTGNvVElNK3duZFo1bUllRHN0bjNjdHdGek02?=
 =?utf-8?B?S0FqelhEQkZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0RCUGNCY0oxeXdyZmViT1NEUStTcFVrRDFRZlU4YTBySEJLcnZrTzhYMzRw?=
 =?utf-8?B?QXNiK0NyV2ovQ3ltYUI0Z3hiVHhMVUROR1RESnI4ZTdSRWQ4WFhWS0d6Q0Qz?=
 =?utf-8?B?S1lXMFFnbUdpU3R4STJMWlpmODBIS013aGVFdUtwY25UNit6TFc1K2ZTaWF1?=
 =?utf-8?B?bk13MWVpQ25ia0tyTkEwZEhyemVSNmFTRG5oTytUKzB6T3lrSmhTNTFCU3VD?=
 =?utf-8?B?NEhvWjlJTmJoOEFCK3hjVlh0ZXp6Yis0clV5c2pScXV2MzNEKzRGS1pOMDg2?=
 =?utf-8?B?NHFRWXFvTnhsSmNHdVBBb0V6ZlBhUW0wQVl3UE9kN0NzN2N6VXh6aXg5V2pD?=
 =?utf-8?B?MS92ZWpZTytnY2o1ZlFxSHA5MGkzL2V5WENpUXFaNCtXM3ZxOXNTdTR5alRM?=
 =?utf-8?B?RHVpKysrSWJ5L3ZrcUJpZk5QU21lQTNKMldJWkhrVkswcnRINHBYV0xzeFgr?=
 =?utf-8?B?c3NqeWJvWktFVTVhUmNLMzZFZG8vSDUzeGVzbXQ3eFJ2NWxONlR2dXA3Sktz?=
 =?utf-8?B?dUJmbDkwWVZPb0lOTTJwVDhHRzJvaTVDc1FkM29qOC95L1k4ZXZUbU9hY01L?=
 =?utf-8?B?MzVXcDlFRk9MOGVQN2VNRXhZUGZQeWx5WXRycXpTYmt4SVRydk9MaHJHQnRH?=
 =?utf-8?B?dzcveVRjQmNyd3VNTEhqNXZYb2Z3Mk9aUGZmNHRpTHdqd2IxS1BTMjRMcmta?=
 =?utf-8?B?MWk2eTNlcTZ2SmQ2czJQaElaeGcwZUZOS08rdEg1MTJ5VERZcnJlSWpmaW1T?=
 =?utf-8?B?M3ZyOEhzSVhpUStQRFY3b0lDNVpjMVJXeGZUaFViampvNllNQ3JkT2tqWlBk?=
 =?utf-8?B?Rm40UEdnMTNjVVRVa0hLejFXdmJpZWZoMVp0N29xWjNDZ0h5Y3hhNHpiZjhV?=
 =?utf-8?B?K2R3VXp0ZWRFQXNzaXE1QWhuMDVjcllkMGJiRGlERnhLbEtjYTJVZStiYjdQ?=
 =?utf-8?B?WEpjRlhUbkJaTXlHZnM1NFRDSnpPa2dFSDdDTENicCtrNnRFQmJiYWJFU011?=
 =?utf-8?B?T2xnRFZSM3RFRlJBQUhLSVJGMzlRSFB5VWovNTBrOWJURS96cGtBckM3ZkVa?=
 =?utf-8?B?Tk9GQkJ5Ym8vSHBHa2VFd3h6MUp1RkJ6UXBzSXRHN3h2VmgvRjVoTitTMkZ1?=
 =?utf-8?B?MEY0YlZ6ejlhN0VwaUFOTit4MktyTjZ4b1Y5TWpNS0lkNGN3VDdYS0RkclhT?=
 =?utf-8?B?azF2am5IQkg2Mm5hdVZGL2VqcTdQeEFycVMvK2lncGZSWjVPdko0ZFl3WDBs?=
 =?utf-8?B?d0tlZVRTalo3a1dZYnJyUFZ0aWhwRWNzN3dTcnFVVWdHbUJwQ3NHSHE0Ym51?=
 =?utf-8?B?UTdWNEl3OXFna0xVeGYvbXpOK1FsKzNkQTh6MjJxMnlRM0Z0WnlpZHdiZG9k?=
 =?utf-8?B?Z25pT0ZrRktNWTNHNzRDMnJkd0tscjBaY1RtbUZPU3RtZnovWVhZQmUweUdT?=
 =?utf-8?B?M1IzODNnSUJWVFJDNVJPbTBQaUoyV2RrMXdoMHNPeWo1RFc5a1ZTWGpvNmxM?=
 =?utf-8?B?ZXhXT3M3R3Jnb2R6NWlFYWpFN2pzRHBvcXhPTWFNNmVOWnRKK0ZVVUREV2Na?=
 =?utf-8?B?LzRKcUNUdTM2MGxhMGpYUlRnemo0SDQrdWhlWHhTNUFqTW1XMkR1cWVOcUo0?=
 =?utf-8?B?blgrUDc1REM3aTA2bzltV1NCRWUzaGlVTXlSbUlXOGduMjdyVWJoRDlNZGU2?=
 =?utf-8?B?MWNKVThUTHhzZWg5UStUT0RPN1lrQTBBa0p4b0ZOUFhXVS9nN0xkRTk4M2lU?=
 =?utf-8?B?VmkzUUVnWkd6bDJVQzcxRTdwdnNSb3F3Y1A5NGExMy9HSFZscWp6Vm12NGFN?=
 =?utf-8?B?RUxXdkxXU00wWlpaZUxMQzAwblNGQmNPMldYR080MEFPeEExdUlsZlNrL2lz?=
 =?utf-8?B?N01xYzdwemRIOGpwbmNsd0U3WW5wU3NUSVBoZWtLeU1LWkFlV3RCVXRJT3ZM?=
 =?utf-8?B?YzZoSFZPVmI1OXEzaDhVNVlZVkkzZE9ZUWlBWFBNV2J2SlptUm5QOHVHZ0ww?=
 =?utf-8?B?bTRRWEw5cDFlSUlSdHc4WXpyV3V0ZFZudUhKRmU3Qzg0NVNHS1ZMbWRzU2p3?=
 =?utf-8?B?V3Z5MUZEV2huSk5JV29rWjNHQkFST0JNT0l1MXVuK0oyOWhMeFhZL2ludVFi?=
 =?utf-8?B?SlVsNUtycEh0K0ZzN3NRSGpkN2lOalZrVEo4RG9mVUM4RmoyUVJUbmgzS0ZF?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D011A666FF7A844981504FE7B5050571@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e97d2cd-099a-4ff7-0c69-08de1754a5b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:35:45.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /frMHU0QOaI/v2VOgwxhuVs59NqMIbyQipV4vIOcvxMyHDpJh/NYNachxfShdrKgLLSXvVaLSTnFhe6wvHL/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121176

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE4OjI4IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
V2VkLCBPY3QgMjksIDIwMjUgYXQgNjoxNeKAr1BNIEFudWogTWl0dGFsIHZpYQ0KPiBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IDxhbnVqLm1pdHRhbD1pbnRlbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ID4gDQo+ID4gT24gV2VkLCAyMDI1LTEwLTI5IGF0IDA4OjUyICsw
MDAwLCBTb25nLCBKaWF5aW5nIChDTikgdmlhDQo+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3
cm90ZToNCj4gPiA+IGtpbmRseSBwaW5nIGZvciBzY2FydGhnYXAgYnJhbmNoDQo+ID4gPiANCj4g
PiANCj4gPiBUaGVzZSB3ZXJlIG1pc3NlZCBhbmQgSSB3aWxsIGluY2x1ZGUgdGhlbSBub3cuDQo+
IA0KPiBhcmUgeW91IGdvaW5nIHRvIGFkZCBpdCB0byBjdXJyZW50IFBSIHRoYXQgd2UgaGF2ZSBv
biBNTCBub3cgPw0KPiBvciB0byB0aGUgbmV4dCBsb3QNCg0KTmV4dCwgYmVjYXVzZSB0aGVzZSBo
YXZlIG5vdCBiZWVuIHRlc3RlZCB5ZXQuIEkgcGxhbiB0byBzZW5kIG5leHQgUFINCmFnYWluIHRo
aXMgd2VlayB0aG91Z2ggdG8gY2F0Y2ggdXAgd2l0aCByZXN0IG9mIGNoYW5nZXMuDQoNCj4gDQo+
ID4gDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IEFudWoNCj4gPiANCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOg0KPiA+ID4gb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmfCoDwNCj4gPiA+IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gPiA+IE9uIEJlaGFsZiBPZiBTb25nLCBKaWF5aW5nIChDTikg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVy
IDUsIDIwMjUgNDoxNiBQTQ0KPiA+ID4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBbb2VdIFttZXRhLW9lXVtzY2FydGhnYXBdW1BB
VENIIDEvMl0gd2Via2l0Z3RrMzogdXBkYXRlDQo+ID4gPiAyLjQ0LjEgLT4gMi40NC4zDQo+ID4g
PiANCj4gPiA+IEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5j
b20+DQo+ID4gPiANCj4gPiA+IENoYW5nZWxvZzoNCj4gPiA+IGh0dHBzOi8vd2Via2l0Z3RrLm9y
Zy8yMDI0LzA1LzE2L3dlYmtpdGd0azIuNDQuMi1yZWxlYXNlZC5odG1sDQo+ID4gPiBodHRwczov
L3dlYmtpdGd0ay5vcmcvMjAyNC8wOC8xMy93ZWJraXRndGsyLjQ0LjMtcmVsZWFzZWQuaHRtbA0K
PiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5j
bkB3aW5kcml2ZXIuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoC4uLi93ZWJraXRndGsve3dlYmtp
dGd0azNfMi40NC4xLmJiID0+IHdlYmtpdGd0azNfMi40NC4zLmJifcKgwqDCoA0KPiA+ID4gfCAy
DQo+ID4gPiArLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSnCoCByZW5hbWUgbWV0YS0NCj4gPiA+IG9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRn
dGsve3dlYmtpdGd0azNfMi40NC4xLmJiID0+DQo+ID4gPiB3ZWJraXRndGszXzIuNDQuMy5iYn0g
KDk5JSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy0NCj4gPiA+
IHN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40NC4xLmJiDQo+ID4gPiBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIuNDQuMy5iYg0KPiA+ID4gc2lt
aWxhcml0eSBpbmRleCA5OSUNCj4gPiA+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy0NCj4g
PiA+IHN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40NC4xLmJiDQo+ID4gPiByZW5hbWUg
dG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40NC4zLmJi
DQo+ID4gPiBpbmRleCBmYzk2ZDVkYzNiLi43ZDcwY2JkYTc4IDEwMDY0NA0KPiA+ID4gLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40NC4xLmJiDQo+
ID4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRndGsvd2Via2l0Z3RrM18y
LjQ0LjMuYmINCj4gPiA+IEBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPQ0KPiA+ID4gImh0dHBz
Oi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLSR7UFZ9LnRhci54esKgXA0K
PiA+ID4gDQo+ID4gPiBmaWxlOi8vMDAwMS1Mb3dMZXZlbEludGVycHJldGVyLmNwcC0zMzktMjEt
ZXJyb3ItdDYtd2FzLW5vdC1kZWNsLnBhdGNoDQo+ID4gPiDCoFwNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqANCj4gPiA+IGZpbGU6Ly8zMGUxZDVlMjIyMTNmZGFjYTJhMjllYzM0MDBjOTI3
ZDcxMGEzN2E4LnBhdGNowqBcDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICINCj4gPiA+
IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ID4gIjQyNWIxNDU5YjBmMDRkMDYwMGM3OGQxYWJi
NWU3ZWRmYTNjMDYwYTQyMGY4YjIzMWU5YTZhMmQ1ZDI5YzU1NjENCj4gPiA+ICINCj4gPiA+ICtT
UkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ID4gImRjODJkMDQyZWNhY2E5ODFhNDg1MjM1N2MwNmU1
MjM1NzQzMzE5Y2YxMGE5NGNkMzZhZDQxYjk3ODgzYTBiNTQNCj4gPiA+ICINCj4gPiA+IA0KPiA+
ID4gwqBpbmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gcGVybG5h
dGl2ZQ0KPiA+ID4gZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdpLWRv
Y2dlbg0KPiA+ID4gDQo+ID4gPiAtLQ0KPiA+ID4gMi4zNC4xDQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gDQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJl
Y2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9u
bGluZSAoIzEyMTE3NSk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTIxMTc1DQo+ID4gTXV0ZSBUaGlzIFRvcGljOg0KPiA+
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTYwMDkxNDMvMTk5NzkxNA0KPiA+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiA+IHJhai5raGVtQGdtYWlsLmNvbV0N
Cj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IA0K

