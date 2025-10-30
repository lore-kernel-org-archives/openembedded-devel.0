Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75972CCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:02:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web10.20858.1761804118908364626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mDSCE7X8;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761804119; x=1793340119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f3JDa9hhC66MDs2/6Adt9SdkHsPnGKOxWYliiKcJZjA=;
  b=mDSCE7X8E0+HZCSjC4K0ZBrBj2sOmjWfvK86mlKNJinY4UnSHWGrBGnd
   8EKnTqekaWpu2i+ApnBtk0Fz2+vaWAxr90B+sY6Y18XJ7Hf0FLFMiHE2k
   WPoDle5G01lop6UOyvaYiZBCQBsYrLG6IOhppT+tHce+UeovPqw0k+loz
   3HgP5OHem9bA+pRSRoogJ62Q1noH+G1i27JU6usZ2IVp68ajdbxkzqsi7
   CIMUBozsGta2XxEMEY2QKkkrllthRtKsnyyUGl91YSiSS3RWQw7DlDKXX
   a+4w7rR9eu9MHgtlDycWCw9C+2nTi0lq3NGsSDsu6Orctuao8RZMCEPjV
   g==;
X-CSE-ConnectionGUID: earwfNMlRlm95RQu435SDQ==
X-CSE-MsgGUID: chHKuiUSTjauPPkfnoYXGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67797677"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67797677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:01:59 -0700
X-CSE-ConnectionGUID: Lsz55xwWRlO3RxK/TTrUdw==
X-CSE-MsgGUID: 1m/ofKTKQ9yCbM/SJypouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185520316"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:01:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:01:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:01:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtjLCtG5Qpj9UP7GODnV+wcugGmJmZl4KhryWNqhL5+lGDUHzoVPEGsBCoU1X05dtaoL3gtl6Yd+bQeYqwswBbq/EqCYsA999O85TJWMZnMO/uRKIWT3bHyWtMdg2zFDl3tkRAJ8y3OnBDIC1M77JXHJxZIOxa+1hjY7vrqam1h2YCl7LqVkzAORLf+yPuMcTJTdmeBrk84uXQa8U0W7CzAsfYxkr4NJgcBzIoKzkkXFf5VrWHG7BBUjx5nfkWoIMCJUhLHf8J92xeUsP3OKwVF5gVYLOBg+HvEyHGAipK3ZgLl0ybxINorNXbKsR2JQlF14q4hpJZKC58JF8+BX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3JDa9hhC66MDs2/6Adt9SdkHsPnGKOxWYliiKcJZjA=;
 b=OTmcRliDdJjyalDLyPiNKe0g1zwaMpvCvkeZK3JHuoL777eDINQN34LSbltOL0GSSYU5txD0hRKZYdyIDFBWuHxQBghu23PUra91GEIduKRZWFhEwS35JlAzfeMqKGdUz3NrRBIdI/64NQYagMzbeAiCA4PDaktRtMjYtgnuI/DERvlX8H0/5v+yKSZTYF4GF/TRd5EYQLFW5wZ7XeBE+RhH6mjytB/IGJUz+htJDkXT8lVcHeL5lrWCMhIZ/IKz5Bcog+wLGSN6oQylg4HUVoaV8UG/qCtvfqRd/fwJonbo3uX5q5cx0Ry1ZCM/5ZBVycU8CDlrm/ggioWiUkX6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 06:01:47 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:01:46 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "nikhil.r@bmwtechworks.in" <nikhil.r@bmwtechworks.in>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] inotify-tools: add ptest support
 for inotify-tools
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] inotify-tools: add ptest
 support for inotify-tools
Thread-Index: AQHcRAsvrjmy1R/qjECz9V1Ngv35JbTP29wAgAphZIA=
Date: Thu, 30 Oct 2025 06:01:46 +0000
Message-ID: <03bf8dcd0470da2d9e1607a3603e04fd9e706848.camel@intel.com>
References: <20251023105231.688693-1-virendra.thakur@kpit.com>
	 <CAMKF1spRb_7=zb7BiKQ42VCLeNDKxN0aRiWO8uvYwXJAme5amw@mail.gmail.com>
In-Reply-To: <CAMKF1spRb_7=zb7BiKQ42VCLeNDKxN0aRiWO8uvYwXJAme5amw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: 2943242f-a11c-4718-91da-08de1779cf15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MG1hYk93K0JwSHROcEZVd1JTVWNuKzdIODFjYTBKVmhVR2lIOFFqODF6Zk04?=
 =?utf-8?B?K3g2Nms1VnhSQUJZa3R6cHBPQ1RGcmwvNXJZTkswVytWSVhQQkl5MkZKSTVR?=
 =?utf-8?B?Z2kwek5veE5EbVFIWmFNUzV6K0hNbjllRjhFU1BvWmxha3l2cFprL084MjRy?=
 =?utf-8?B?akUyU3NJT3F0OXhoSEJJSmM5bXVpZklpSTk1S0tteFY5d1dEOWJ6Sm1PeXlD?=
 =?utf-8?B?MVllUlBYQUtUTlJHYmtkSXFuQ1ZIbGJWSkZwV0ZwTkdxcWNraDBYQlRKeldB?=
 =?utf-8?B?SXB4YWViTnpUWGs5eGduV2o2bnpVZjBWSG5EMUF2cnlRamJWRUMyN2JYMXk2?=
 =?utf-8?B?dTNKQmsvdTFkK2I5QktacVVoUkpRbjNFaS8wRlJNd1BjOW5sU0Vmd3M1MFlU?=
 =?utf-8?B?RFRJdUFzZFM1elBJeEJVODZEQkFoTVNFQzJwaEcvUTJsZTZrM0pHTm5pZlFR?=
 =?utf-8?B?YXI4b2NIcCtsM2hPR3loNVlRMlNCMXplazFjbXFCQllGQ0YxT2ZUS2F1azg0?=
 =?utf-8?B?ZW5nTnBoc05YVXpkVnNUQWpBTyt5MFdaN2hGMk5LSnkwL1FoZ3pqWEpkcTFy?=
 =?utf-8?B?YUxkNkNsSlZYbWRTbWRVMTRPVFVEcmgwWGdpZFBtYklRVTR2TzV6aXZMYXJ6?=
 =?utf-8?B?Y2Z4Vk0vQTFHcjN2RGlEeDBiU1prTEpOMFVOaGN3K2tUNUlTT21XY1FEUlBO?=
 =?utf-8?B?YzZrajVqbm8zN1hoNWpNVmtlMkNVY1JDSDdJclpnZy9ZQ1Q0S1JGY21LT3JQ?=
 =?utf-8?B?eUt4UVg5eVM0M0JSakEzM25tOEdqYUFOaVhYOWJBZHhxTTJqVXNHQnFxcjQv?=
 =?utf-8?B?cHNYNEY2endxa21WTU9VK0IxY0dCSFFvMzM2NmFnd0JVSys3YWxqKzhWRi85?=
 =?utf-8?B?M2pPQ3VxWU1Jb2psZHFoeUtTWHBVMEpwZWN3bUtGQ0xEaGd1N21nRUw3SlVh?=
 =?utf-8?B?dUEyZ2Fjb1FQbDJaUGdUaWpOTytmNXgxUnZxZE9YM2NNMUFKQ2hES2Q3MDJU?=
 =?utf-8?B?cXZpcHoxam1uR0x4aWRaMEpQY2FkU2pRR1lhY0NjUlYzc1hIZWRuQ0dzbkN6?=
 =?utf-8?B?dTFNb2FQbzJGbTR1c2VPYUYxU3lLSHgwaVJNQ2M1ejVVOGJseFhueEJ6dHZj?=
 =?utf-8?B?QzI2UXJhSXJJdWJwZUxqK2daY3NTNFhzd1hZYzdPWmUzUk0rNVhTbVlCVlhR?=
 =?utf-8?B?MUFPMUdtS2FXeFVBcllkcmZ1TTNSQkt5TDNnMkkzYVhlbEdCY3Urd2RLSTFD?=
 =?utf-8?B?aHBqTThQb3cvTEg0QTJFRDFGRGNqK1ZRSG5lVEs1Wnc2V2crU2VXakExSGQ1?=
 =?utf-8?B?ZlJ1ajBaMkcwUDBMUExxM2dlSHVDTEZDZDJDVFg3REVtK2VhRGZwQi9ZUC9s?=
 =?utf-8?B?UWVSeXExdkI5NWtwcU5nb2pzM1VINEZWZVMvWndxdnZzNTBrUFZGcGZsNHRJ?=
 =?utf-8?B?QkY1WThrWTQ1SXYxa0duQVBBem4vd3FGS05USTJSTWpoSFFsMnhxL2o4cmhZ?=
 =?utf-8?B?MEJKbW9Ic0VJcFp0SEY1dm15TVo2T2RnbmhzR2ZPbGM1SzhtbUVmQUsyTHZo?=
 =?utf-8?B?RDFldmNmeW1SRXpScEdFOGZRekFhQVVXQStuQ25NSm9kT0Z3UmU0YXZjM0FN?=
 =?utf-8?B?RlhzTmdXRlIrWGtkYWE1ZTV3R3NZd29YdjRlSWhFZnRzbE9OM0RLbWhuVW9r?=
 =?utf-8?B?WnRpbXB5cENjd1BzNTFGaitwQ05TQTI2RHQwek11R09CUnFaK1JrRlFPd05N?=
 =?utf-8?B?NSt1aXZXempzbWxMcUI3Y1RjUThmeUwzU241cEhmbS9STmt1ZXhWR3BZMTdK?=
 =?utf-8?B?Nkt1MnZjWXhVeHhGNno2YlFHNWloQXFFUVQyRkFQSTBQOGlVa1VhS2lHS1A1?=
 =?utf-8?B?ZldmQmhWbHdBTVZoN0MvWVdPekF5MTAwMzZIZVl6VXJocVBvczllVlZIckJx?=
 =?utf-8?Q?YBXhnleXCDenk4z7nDvWWeHdtJfBUgIM?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXlaVThNQ0NubTVWSHpBVVZENktrYWh0MmpGbmtDMkJrRllUandVK0JJZTNr?=
 =?utf-8?B?eGJJdTlKZlRSNWtRYUhKL0R2ditQUWkyd1NFdUROb3BiRTBlYTlLQ0dvVkpX?=
 =?utf-8?B?Q0d2YWdKY3RYSVp3Ym9iNldGaVUwZGZzOU9LUzI2eU91Sll2VEx0U0RFWHMw?=
 =?utf-8?B?aVNOUm9BeWJieWV3VSs5bEtQa2pQblNWSlB5cUs1OVkyYXZ5WXJMTldNdFBG?=
 =?utf-8?B?OHBzTGwrWW4yL3hSbDVXOTJhUUVia0EycFZ5UEcyKzhtVmV1MThvajVjMS8w?=
 =?utf-8?B?T0pLQVpiL2kzUlkxRzljQnhaU0M3OGpURG1ES3NCSWJONFZlUE1tcEY3YThD?=
 =?utf-8?B?dnFmZzJvSDNldlJEVGtBTzZqRkFSa0d2SUZwRzdDWlJrdjNLWFRJV0Y0cTQz?=
 =?utf-8?B?QjFGelowVzdVQjJEd1I2NjlIM2JXNWQyYjlkSUowYWpHU1ZBd09DRm04cVQ1?=
 =?utf-8?B?c3RKdXpGcTlUNGZ3QzZFbWZXeTBGV0ZkT0lKRWhQR0ZWckZPMStlRCtONlFo?=
 =?utf-8?B?alZVUHR1NVpjRXZYNENxaHVOZ1pIRVBrRUNDL0ZYcXB6SG9uei8yWGJWTnUv?=
 =?utf-8?B?aHB1aHZNZVptYUZBS3dkeVZ5bmxUM21YaFdSOWNNWnRqQmVpYkRNWU9kUnph?=
 =?utf-8?B?V1BRaFNCSVdIUlRtTU8rWlJCSUVJejBESmhWeUswcFA1ZGtHUG5tUnFKZkFE?=
 =?utf-8?B?cjd2QmFQMmQvU0ZOYmt4dFRmUTlHU2JHdEJUSnRHc2dFeFRCcCtVV0lLTEZO?=
 =?utf-8?B?bDZVeFRJZXVxSlFhSWQ2bW5ZdzJkbVRLS1lNcEVzZU5YTGppcTZQcTYveUxu?=
 =?utf-8?B?UG1ES3k2a1lSZWhLVTlaajVHZzZYQVZ5ZVRYYmwrU2VYU2c2UTBESEFuOUN1?=
 =?utf-8?B?N0xzQjlFUDJHWnZZMEVjcHVKN29DWVN0UjhQWjNkTWYwVHNqZlhOd2NwODl0?=
 =?utf-8?B?bmNjSm05Zm1KeUtCS1NIYnBjYlova3NFVHU2TW1IYmhLS0ZmNnErU1k3czRK?=
 =?utf-8?B?WkI2djhibXcvZ2RBVFk5dXdWM3lDZ2ozblZOSzI2bnpjcU1qajNMOWdOYW5x?=
 =?utf-8?B?cEx1R3c4WHo4OERsdmNyUDF1aDRES0pKOU5YK25xVlVTcGZZNHlobVJOWHV1?=
 =?utf-8?B?OVFVbE4vRnFrMUlYUnQxQS9JeDJVdHlwK05PSlJYYzBlVXk3NzdIK2hrNi9x?=
 =?utf-8?B?UHdmK2czOUNiNU14Zm9hYUU2S29Pek1lT1V1TVEvbzBkQUR6aUNsQ2lDOUpJ?=
 =?utf-8?B?cnUxVVVUOHREaFJVMnRJaisyY29LaEtiQWsvSDhmNDd1N2UvNEtaMWFvNUdN?=
 =?utf-8?B?eVYzU2Y3c2pNREw3aU1XdzJiK3ZaKzQzNGtvQTE1QW9NQ3BrNnFuaGdLUEQv?=
 =?utf-8?B?SnpRVklneXJReVUxeXBZbCtPby9tVk8xN01maWZQZXo2Q3Nud2V1eTVGdytW?=
 =?utf-8?B?LzNyQ3ljdWErbXBuVlpZU2hZcVdYRHdSM05oQjFaN25naXZpWjFIdGpMU2pw?=
 =?utf-8?B?RytGVjFLa0MrWjBSUkp2MnJWVkJ6V3lFWmJyQXhla3ZvUjR6WnIyOEgzU2Nz?=
 =?utf-8?B?eDB0bnlDTFAyLzIrYmorNVFYakRldWpneW92aHNFTFJhSnVJZ05yc3hGaHl5?=
 =?utf-8?B?OE9iT1hWdGNndjBSdUtGK08wM3lJMk01QlJlVjVFRk5xcG1CUVVWT2VkQjhF?=
 =?utf-8?B?VmpWWW5kWnh4VlJyWno4K1pQOEJjZ1YxYVlJY2JzOG9tZFpyc1l5TVU0a2F2?=
 =?utf-8?B?cm5LbXJma2RqbWdDekdTSi9LeW9WSGlyeVJ1MDRpU2hvQTg2QWszaGpRSzBh?=
 =?utf-8?B?QWl2V0Q2UWlsa1loaUI2ZlJSQ0U0RlN6R2VubjBvVXdIZUh5ZWNrRmpndTBU?=
 =?utf-8?B?dFpUWGJpMndoNS92c1JsWlF5V1pzUTUxUXlRV3R3V05UQVdVOTlwOTNpTFFU?=
 =?utf-8?B?aThzUGxISjBhU1I1c0dQUnhTaktVYndvODV0eTZDWmZBN0s1QnMwclp2OXBU?=
 =?utf-8?B?cTZoSVdzdzlMa0pvdjV6UVlPR3pySnFTekRtRk56QUhLUDJkVCtMeUFZTm5W?=
 =?utf-8?B?QmJrbElidTQ2c1FWdlZnTmt2MXZuVU9HY3NuU21KTEhrS0Z0bjhRZjhJVFJu?=
 =?utf-8?B?YWR1dGcyRStnZzc2dmhsbGJZQ3U2Ui92UitsY0paWW5Wa0hQQU9KNUhGbUxE?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1F934945522FB48BA692CE4AB96ED11@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2943242f-a11c-4718-91da-08de1779cf15
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:01:46.5353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79sqdvJPzbg/WOowO/cnbTZm4AzA3ua+JGzsMbIEQsu3/N58aiCcDpcq446DHQfxeDzepFYtvsX/kJZsU/dltg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121190

WWVzLCBwbGVhc2UgYWxzbyBpbmNsdWRlIHRoZSBzYW1wbGUgb3V0cHV0LCBob3cgbWFueSB0ZXN0
cw0KcnVuL3Bhc3MvZmFpbC4NCg0KSWYgdGhpcyBpcyByZWFsbHkgcmVxdWlyZWQgZm9yIHNjYXJ0
aGdhcCwgdGhlbiBwbGVhc2UgZW5zdXJlIHRoYXQgdGhpcw0KZG9lcyBub3QgcmVzdWx0IGluIGNo
YW5nZSBpbiBwYWNrYWdpbmcgZm9yIGV4aXN0aW5nIHBhY2thZ2VzLiBJdA0KZG9lc24ndCBsb29r
IGxpa2UgdGhlIGNhc2UgaGVyZSBidXQgcGxlYXNlIHZlcmlmeS4NCg0KT24gVGh1LCAyMDI1LTEw
LTIzIGF0IDA4OjMwIC0wNzAwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
d3JvdGU6DQo+IFRoaXMgc2hvdWxkIGJlIGluIG1hc3RlciBhcyB3ZWxsIGFuZCB0aGVuIGJhY2sg
cG9ydGVkIHRvIHJlbGVhc2UNCj4gYnJhbmNoZXMgcGxlYXNlIHN1Ym1pdCBpdCBhZ2FpbnN0IG1h
c3RlciBmaXJzdCBhZnRlciBtYWtpbmcgc3VyZSBpdA0KPiB3b3JrcyB0aGVyZcKgDQo+IA0KPiBP
biBUaHUsIE9jdCAyMywgMjAyNSBhdCAzOjUy4oCvQU0gdmlyZW5kcmEgdGhha3VyIHZpYQ0KPiBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx0aGFrdXIudmlyZW5kcmExODEwPWdtYWlsLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBBZGQgcHRlc3Qgc3VwcG9ydCBmb3Ig
aW5vdGlmeS10b29scyBieSBpbnRyb2R1Y2luZyBhIHJ1bi1wdGVzdA0KPiA+IHNjcmlwdC4NCj4g
PiBUaGUgcHRlc3QgdmVyaWZpZXMgdGhlIGNvcnJlY3QgZnVuY3Rpb25pbmcgb2YgaW5vdGlmeSBl
dmVudA0KPiA+IGhhbmRsaW5nDQo+ID4gYW5kIHJlbGF0ZWQgdXRpbGl0aWVzLg0KPiA+IA0KPiA+
IFRlc3QgY292ZXJhZ2UgaW5jbHVkZXM6DQo+ID4gwqAtIEZpbGUgY3JlYXRpb24sIG1vZGlmaWNh
dGlvbiwgYW5kIGRlbGV0aW9uIGV2ZW50IG1vbml0b3JpbmcNCj4gPiDCoC0gRXZlbnQgaGFuZGxp
bmcgYW5kIGNvbW1hbmQtbGluZSBvcHRpb24gcGFyc2luZw0KPiA+IMKgLSBCYXNpYyBjb25zaXN0
ZW5jeSBhbmQgYmVoYXZpb3Igb2YgaW5vdGlmeSBldmVudCBxdWV1ZXMNCj4gPiANCj4gPiBUaGUg
cHRlc3QgY29tcGxldGVzIGluIHVuZGVyIDIwIHNlY29uZHMNCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWtoaWwgUiA8bmlraGlsLnJAYm13dGVjaHdvcmtzLmluPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFZpcmVuZHJhIFRoYWt1ciA8dmlyZW5kcmEudGhha3VyQGtwaXQuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgLi4uL2lub3RpZnktdG9vbHMvaW5vdGlmeS10b29scy9ydW4tcHRlc3TCoCDCoCDCoHwg
MjENCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqAuLi4vaW5vdGlmeS10b29scy9pbm90
aWZ5LXRvb2xzXzMuMjIuNi4wLmJiwqAgwqB8IDE2ICsrKysrKysrKysrKystDQo+ID4gwqAyIGZp
bGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9pbm90aWZ5LXRvb2xzL2lub3Rp
ZnktDQo+ID4gdG9vbHMvcnVuLXB0ZXN0DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2lub3RpZnktdG9vbHMvaW5vdGlmeS0NCj4gPiB0b29scy9ydW4tcHRl
c3QgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9pbm90aWZ5LXRvb2xzL2lub3RpZnktDQo+ID4g
dG9vbHMvcnVuLXB0ZXN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwLi5mM2IyM2Q4NmYwDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2lub3RpZnktdG9vbHMvaW5vdGlmeS10b29scy9ydW4tcHRlc3QNCj4g
PiBAQCAtMCwwICsxLDIxIEBADQo+ID4gKyMhL2Jpbi9zaA0KPiA+ICsjIHJ1bi1wdGVzdCBmb3Ig
aW5vdGlmeS10b29scw0KPiA+ICsNCj4gPiArc2V0IC1lDQo+ID4gKw0KPiA+ICsjIFJ1biB0aGUg
dGVzdCBiaW5hcnkgYW5kIGNhcHR1cmUgb3V0cHV0DQo+ID4gK291dHB1dD0kKC4vdGVzdCkNCj4g
PiArDQo+ID4gKyMgUHJpbnQgdGhlIG91dHB1dCBmb3IgbG9nZ2luZw0KPiA+ICtlY2hvICIkb3V0
cHV0Ig0KPiA+ICsNCj4gPiArIyBFeHRyYWN0IHRoZSBzdW1tYXJ5IGxpbmUNCj4gPiArc3VtbWFy
eT0kKGVjaG8gIiRvdXRwdXQiIHwgdGFpbCAtbiAxKQ0KPiA+ICsNCj4gPiArIyBDaGVjayBpZiBh
bnkgdGVzdHMgZmFpbGVkDQo+ID4gK2lmIGVjaG8gIiRzdW1tYXJ5IiB8IGdyZXAgLXEgIjAgZmFp
bGVkIjsgdGhlbg0KPiA+ICvCoCDCoCBleGl0IDANCj4gPiArZWxzZQ0KPiA+ICvCoCDCoCBlY2hv
ICJTb21lIHRlc3RzIGZhaWxlZCEiDQo+ID4gK8KgIMKgIGV4aXQgMQ0KPiA+ICtmaQ0KPiA+IGRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9pbm90aWZ5LXRvb2xzL2lub3RpZnkt
DQo+ID4gdG9vbHNfMy4yMi42LjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9pbm90aWZ5
LXRvb2xzL2lub3RpZnktDQo+ID4gdG9vbHNfMy4yMi42LjAuYmINCj4gPiBpbmRleCA4YTBhZTE3
YWQ3Li4zNjI5Y2U0NWIyIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2lub3RpZnktdG9vbHMvaW5vdGlmeS0NCj4gPiB0b29sc18zLjIyLjYuMC5iYg0KPiA+ICsrKyBi
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2lub3RpZnktdG9vbHMvaW5vdGlmeS0NCj4gPiB0b29s
c18zLjIyLjYuMC5iYg0KPiA+IEBAIC0xMCwxMSArMTAsMTIgQEAgU1JDX1VSSSA9DQo+ID4gImdp
dDovL2dpdGh1Yi5jb20vJHtCUE59LyR7QlBOfTticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBz
IFwNCj4gPiDCoCDCoCDCoCDCoCDCoCDCoA0KPiA+IGZpbGU6Ly8wMDAyLWxpYmlub3RpZnl0b29s
cy1CcmlkZ2UtZGlmZmVyZW5jZXMtYmV0d2Vlbi1tdXNsLWdsaWIucGF0Y2gNCj4gPiBcDQo+ID4g
wqAgwqAgwqAgwqAgwqAgwqANCj4gPiBmaWxlOi8vMDAwMi1jb25maWd1cmUtQWRkLUFDX1NZU19M
QVJHRUZJTEUtYXV0b2NvbmYtbWFjcm8ucGF0Y2ggXA0KPiA+IMKgIMKgIMKgIMKgIMKgIMKgDQo+
ID4gZmlsZTovLzAwMDMtcmVwbGFjZS1zdGF0NjQtbHN0YXQ2NC13aXRoLXN0YXQtbHN0YXQucGF0
Y2ggXA0KPiA+ICvCoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly9ydW4tcHRlc3QgXA0KPiA+IMKgIMKg
IMKgIMKgIMKgIMKgICINCj4gPiANCj4gPiDCoFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4gDQo+
ID4gLWluaGVyaXQgYXV0b3Rvb2xzDQo+ID4gK2luaGVyaXQgYXV0b3Rvb2xzIHB0ZXN0DQo+ID4g
DQo+ID4gwqBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWRveHlnZW4iDQo+ID4gDQo+ID4gQEAg
LTI1LDMgKzI2LDE2IEBAIENGTEFHUyArPSAiLVduby1lcnJvciINCj4gPiDCoFBBQ0tBR0VTID0r
ICJsaWJpbm90aWZ5dG9vbHMiDQo+ID4gDQo+ID4gwqBGSUxFUzpsaWJpbm90aWZ5dG9vbHMgPSAi
JHtsaWJkaXJ9L2xpYiouc28uKiINCj4gPiArDQo+ID4gK2RvX2NvbXBpbGVfcHRlc3QoKSB7DQo+
ID4gK8KgIMKgIMKgIMKgIGNkIGxpYmlub3RpZnl0b29scy9zcmMNCj4gPiArwqAgwqAgwqAgwqAg
b2VfcnVubWFrZQ0KPiA+ICvCoCDCoCDCoCDCoCBvZV9ydW5tYWtlIHRlc3QNCj4gPiArfQ0KPiA+
ICsNCj4gPiArZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4gPiArwqAgwqAgaW5zdGFsbCAtZCAke0R9
JHtQVEVTVF9QQVRIfQ0KPiA+ICvCoCDCoCBjcCAtciAke0J9L2xpYmlub3RpZnl0b29scy9zcmMv
LmxpYnMvdGVzdCAke0R9JHtQVEVTVF9QQVRIfS8NCj4gPiArfQ0KPiA+ICsNCj4gPiArRklMRVM6
JHtQTn0tcHRlc3QgKz0gIiR7UFRFU1RfUEFUSH0iDQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEyMDkzNyk6DQo+ID4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTIwOTM3
DQo+ID4gTXV0ZSBUaGlzIFRvcGljOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMTU5MDgzOTYvMzYxNjcwMg0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2
ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKg
Ww0KPiA+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IA0K

