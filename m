Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03ADCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 17:58:36 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17700.1778781511726928720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 10:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UIMd9r3r;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5239; q=dns/txt;
  s=iport01; t=1778781511; x=1779991111;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rD3IJxCwVKtbCRnUYRdIW6MRGtaiDol9PgrYFQRnK28=;
  b=UIMd9r3rXV1GzmtXklqkbKsVZ6+L2eI8p/vlq2pmIkeq1KluGMInyTzq
   mQ/TYGZvo8EjhlvMeeVZzN4/gNKGhqlGV1jtdqPAlABdG9LS0Ebb3OKx5
   hj80ggpBS55bnjF4RmecBZqgFbxulz6TlGGQ+QzRHSraJ9dsys6WWVjPz
   6ifwIAJss+7/ZxcmAToC2Flhut+0wdfaqw0SdDkanyHlbuKIxsGnhS+YE
   XaY3oowXyIug5IRX3VE7vSvvKylnyRDk7BnE8wJUAyf6R4P+cd92/APo2
   0h8JqiAVAEZmx3rtMmPsJ8NEq/BCyv0qIU4QKX3xPejtpljFVPKzEeRT+
   A==;
X-CSE-ConnectionGUID: jK6bLnNEQTOEf8OLyBx0Tg==
X-CSE-MsgGUID: YjI6JtEETo+h76+xn2G8wA==
X-IPAS-Result: =?us-ascii?q?A0AIFADFDAZq/5QQJK1aHAEBATwBAQQEAQECAQEHAQE6g?=
 =?us-ascii?q?S2BOxsCFFOBBoEREohsA4UshggBgnCXRoZrgWsPAQEBDQEBFD0EAQGFBgKNM?=
 =?us-ascii?q?gImOBMBAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlAMhl0WZxIBf?=
 =?us-ascii?q?ycEDg0ahH4WQAMBAqYlAYE9AooqeIE0gQHgMYFLAgEBiFcBKoE1AYkRJxsbg?=
 =?us-ascii?q?XKBV4dPCxGEE4IvBIIigQ6OcoFEIgMmMywBVRMXCwcFgWYDKi8tbjIdgSM+F?=
 =?us-ascii?q?zNYGwcFgUuCTmqBAYRfeCMvA06BK0sDC209NxQbAwSBNQWJXQeFDU4QG1BSB?=
 =?us-ascii?q?qJ1gXyMY5UXCiiDdKIOF4QEjROZVJkGIqh0AgQCBAUCEAEBBoF/JSuBLnAVg?=
 =?us-ascii?q?yNSGQ/aI4E2AgcCBw0DC5FqgXsBAQ?=
IronPort-PHdr: A9a23:LfOtdhJ4Cj0OPWsCyNmcuVQyDhhOgF28FhQe5pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:JW/Zy6wyCUUjTae3gEF6t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkUFz
 jEdXzzVMqmJZmPwf950atvg901UusCEy9ZgTgVkpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYpaz5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEMVY4c8/MBaOF1p2
 PJIDxQcRADbu+3jldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OS9aoOEI4fXFK25mG6pp
 EOY3XjULy0dd9zAl3mV9CiD1vDmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:HAkHdqONqFmTZMBcT9X255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UossREb9expOMG7MBXhHO1OkPYs1NaZLUTbUQSTXftfBOfZslnd8k7Fh6JgPM
 VbAtVD4bTLZDAQ47eZkWyF+r0bsaC6GdWT9JzjJgBWPHlXgs9bnmBEIzfeOHdbACNBAp00Ho
 ed4M1omxqMEE58Uu2LQlM+c6zmvdPkqLLKCCRqOzcXrCWehzKh77D3VyOfwgofVD13x7Ij+3
 jukgDy5Kmv2svLhSM00VW9071m3P/ajvdTDs2FjcYYbh/2jByzWYhnU7qe+BgoveCG8j8R4Z
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oPb+WCkxB6N69MJkm1rimgkdVeNHoe
 d2NlGixt5q5NT77WPADu3zJlNXf4yP0DwfeKAo/iViuMAlGcFsRMQkjTJo+dE7bWzHwbFiNv
 VyB8fB4/sTW1abY3fF+lRL+rWXLywO9tPseDlZhiRTuAImx0yQwyYjtbwit2ZF+5QnR5Ze4e
 PYdqxuibFVV8cTKblwHeEbXKKMeyTwqD/3QRSvyG7cZeg6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUOq3n2MS+AdCWoztsb64lyu7X6SrauOSqfSEo2m8/lp/kEGMXUV/
 u6JZoTCf7+KmnlH5pPwmTFKtJvAGhbVNdQtscwWlqIrM6OIor2tvbDePKWP7bpGSZMYBKJPp
 LCZkmGGCxt1DHfZpajummjZ5rEQD2Mwa5N
X-Talos-CUID: 9a23:34ZG62EBcy0GT73iqmJl1xAePsYDX0Th61rec2icGEx5EIGaHAo=
X-Talos-MUID: 9a23:6EWLjQbL4c8bX+BThj3N2hN+GepU5OeuVx5OgZNclJmbHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 May 2026 17:58:09 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 87AFC1800038F
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 17:58:09 +0000 (GMT)
X-CSE-ConnectionGUID: zyM32lMRQdSkZAAGtZlGXw==
X-CSE-MsgGUID: mayLaqhMTEKT6eeHRRoL3w==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,235,1770595200"; 
   d="scan'208,217";a="56552297"
Received: from mail-dm2pr0701cu00106.outbound.protection.outlook.com (HELO DM2PR0701CU001.outbound.protection.outlook.com) ([40.93.13.70])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 May 2026 17:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdGt5SLDl1tJRx58vR1cq7j69s8iljrLSg7bzdlYac6K/fZ4hvBNnOz7cIcB13/gpWqmF3w6TMbZsyb1n4MztIRF+ri3g5Dp8SHpRvgmIzO/ouMrbxs+xAUGPTtD78apK1OUV/m+X4UlSBg0Q3Uq7EUylxY+dKUe0JJgF45leYyb3AovpYT0yaoZtKjd248HHf/o1zJrAh9rvLsZk9IoQ0Ab0UoglQzuTcpzBfThu7k2j9WtRMwguGHwF8WxIBYkcCLlzmd2fpVODDjIXj9Nzgwhg0afb3QbxdF80OaudrE4/DQnM9JRgP44Xb9Y81HRsUS1MsCJROQSj5XWGny0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD3IJxCwVKtbCRnUYRdIW6MRGtaiDol9PgrYFQRnK28=;
 b=Ptx12CXbXGGa4kFiP8+/BzGJpKDf2kvIw6TnZrf+HKx2+xLxQkXhLt2H5b74hb/3jjuYLklssZLbz3EZGiKVaG3cGjdHVS0Pg3hIKx39de4O3U/JfnkmJop/x2ROUGr5btsa3wcIVIyTpP/XS/b8aiso8+A5ahuiOiXmEnaOstdasjop36mwwMbwPb2/F0HaEzlivfX2mz2beHszd88rUJ4syhOnZvw0MtH5//KL+HSTKwv1xfCp6cQagZfKcqj/ClocbJw0F5yZL19wdY1FzUHztlzS0NdctyW5/sgmAG7lVbJCAPTe9MPk8y9kJBi66OCXzOUT5aTBPoAmySgK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA4PR11MB8941.namprd11.prod.outlook.com (2603:10b6:208:55d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 17:58:06 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:58:05 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: [meta-openembedded] Wrynose Release notes
Thread-Topic: [meta-openembedded] Wrynose Release notes
Thread-Index: AQHc48kshizjJi6tsk2WuSVogPhkfw==
Date: Thu, 14 May 2026 17:58:05 +0000
Message-ID: 
 <DM4PR11MB618984B94205B67D6B201681C4072@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA4PR11MB8941:EE_
x-ms-office365-filtering-correlation-id: 5a77fd0b-0bab-45d3-61c9-08deb1e259b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|11063799003|8096899003;
x-microsoft-antispam-message-info: 
 IO7yQ6OyljTtjCwCK/fPWxkJeNZK8resM9WojuWueKwK29KjOrMp1/oltBEpqRICFEsUI/WY1nz7gvOteljNwG3vL5r5kHd3JvQDYMFS5U5aPne50p0rq330hCB6vGwC/njtWchQmTRL9kKhs4mDv+HdUX78A6j/GhfoSxgA/UWoq62eg1WhOQqZP2nKJuLCKzZ7+fmf/cWIoMA1piuVLWcZ6t22pApVltK/jx2XDflgECiMLisKrUpt/WmoTLWxsTvvdFs312RZnkmir7nHwnJPisv2Nqkl8VKpR0/H+Gfr58WHWovgGv25Xp97RchoMqG/S3NXTQrzkogx3KCB2G20S2BSZo9x5ZWqQSLAq7ASikFt4xqRDEiet98EDIr3Hfk0pV2FtVpAunzw3LSjs9X8jGjCC+/ncpBd0FZzKPQON3o9cKWWptuDRSkfCVSlaIKTp8owCE0dyy3LwL+Ppfv2eZIng9q94xjJO/qSknmvFaVpDW6pB2hgsSyPcYwwYODju9pEfMnXJgIx7m6Jx4mVeAjWnqYR4LEpWQTZMXi3v7LyHzLkDziEriB21kB28P5sQ84ct8RpbCra3p++jELHJIMpnXHdecCLmgrL2aPNWpZIotWmO10CX5Kx+SlDlvcITajbJIFWNzXVOz0kTUJACFEZeA16E/h4nwLsaQMkzZX1Yl5WI/FZKyeJ5rmYO7bq87V8fO+vdxVNXE6z5TXTQR/LJdfLMliKnAjK8enPMY4tcs9SipMeYqoGXBMz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(11063799003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1S5w37xBli72FMHy9xLHkjbY3Dt0wLCzTxHinWDz+ac9234ZdW1MRDHwXI?=
 =?iso-8859-1?Q?nWUcoeFXZBIfU7kB8IebuskYghrr7nFlJWwYVRgaOCm6FRV3Mo8dNM8uor?=
 =?iso-8859-1?Q?C8IaMp6eseQhQ96icHifas4kYaQDhINq4CmW7ppjo5OadsalJ0c87d8mGh?=
 =?iso-8859-1?Q?GwKsln1lej8c2S00TZy+2GMS3qpFXKGXNExfn5Bdxp+f5+EVNb3MsR1BEI?=
 =?iso-8859-1?Q?a81hxbjT70Op+v/5zSXGOFJ/In5iVkktjhyYJTOTJYNWakji76iuEAVJhA?=
 =?iso-8859-1?Q?oQCuyGZDHiejeYoIWN7ZwZksI0ai8ou/FeSyoKV7926xnhDys4syp6t8mF?=
 =?iso-8859-1?Q?nVKkhHRDLcCRijHFbW05+q+KoQUwkMyly3fxdekTnhXx1+BmQHexmCMUkz?=
 =?iso-8859-1?Q?RZkwfuyPB+1iR005AcG1GAEDi3kqZKsKOQEAQ7MLZOD9UxloIqLRBE/SJJ?=
 =?iso-8859-1?Q?hQZ73FvVYyGxIjs6r5aLkyt+1CIEfsd/79bJx41xOYl1WklcVtk1rS5vWj?=
 =?iso-8859-1?Q?zYjm3mx/xyQYqV3+SmOd4hksPTXBb1KdFX5M07PwMlh2Jhg0zzHhmSCHII?=
 =?iso-8859-1?Q?546gSj47QzpoZ8DLWEJm83Nzj/Jyi5VZtqLoPwGf+k0Cao2AoOx4tM6FvU?=
 =?iso-8859-1?Q?lrJTRvgwcQp6roIgAjw/JheY3UN8y2YxMGzSQqJ4k+tXS8mU6VL9YsEYGV?=
 =?iso-8859-1?Q?FrhZoKQ8bxYVx9FS/Cg8FuSuZFHGBT5s/yWm/RTltdy1qmGpUI9tLSG7ON?=
 =?iso-8859-1?Q?xeMs2eHJEC5582t0XaL2Zl/2eoYzd5+E2ifVWNAThPcYr53E4ZhjK9Kxlp?=
 =?iso-8859-1?Q?3/eWJk2//v3DeCaNCAr2osbksISZW3jRszJcnX2zW2EuCR2O+Ti000PD/f?=
 =?iso-8859-1?Q?UtKLCIvaAxzwMVGpX9jKWKTNqWAM6oypsoAxkx5uPggfqL59ifViUqJukH?=
 =?iso-8859-1?Q?2KohJxqKF//8C91ct0qgNnFi5Uj/HRxYdLwzkZ6Mh581/ZqLaxfMsMqE5i?=
 =?iso-8859-1?Q?Wg73Qhy0o3f0KAtzMPo/y+e3TyX0faKYTaR0tdlUYI4hKg1Gp6qwHbFGCm?=
 =?iso-8859-1?Q?+zn1q5soxtcU2HbWWLCuQaqYn0SVjP1NppAq7yhHr5G9ee/qXiihvJEj1y?=
 =?iso-8859-1?Q?eD45Iq/yWNZGjgEVi0WZH9Fkn+jcPY959V9sKhZ0Ach+i3hQPfbdI+AxPu?=
 =?iso-8859-1?Q?I1qm3gH7nKKyqsRfDkB5yUDAzCgh5ob4EEJB3rH5zUkbOpzcWcfHhYaf2g?=
 =?iso-8859-1?Q?baznmrK28jRLe7MqJZ0BlIDqcCBB5Z+v/LUZy+J50/TRfIkCKOhSjDne5k?=
 =?iso-8859-1?Q?0NFNTGIdhQmYDCFr7ypmdwTkzJoQ0G9ZH9ZWe4trQq8rQpnbbQyaJpmod+?=
 =?iso-8859-1?Q?U79fWMvmbblFcbQAQm6MVRR+zDU5PO1+dJ5YQbQibgtwG+88CKahWGBtpe?=
 =?iso-8859-1?Q?+Wl4NgZ8SFrMV6QnEydzA9DyY8JWJcomGpdd3h41DJlsBVh92wnY9PajjQ?=
 =?iso-8859-1?Q?Fey20EIuqKTwRzDRJV07jfeZmOJ8XzWnXIRsZhguOp1hcy83ND/FODxA9u?=
 =?iso-8859-1?Q?ZGCEao18I644GqtJzamNhemHMG+ltyqWMW6BCvo6a3EHmQLFYhMYk40Jdv?=
 =?iso-8859-1?Q?WMDUnjUFnD2Kvzlnk+QGoClq+JWlln/lkVl6Ga8Yf4d5nkCfTTmuku2Hfg?=
 =?iso-8859-1?Q?SP74MjtXlGhWRN0ovoW24Lknpx7tbCOAkkBIUyLLnGEeCAegYTW8SvG6DC?=
 =?iso-8859-1?Q?BugaC6GO6uBxhTscU8y78ujf5crkPutnbINRZgGIvE1d/z?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618984B94205B67D6B201681C4072DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	KoppWMMKdzWSftf/h16Z6SJ8Pe5ojDS36qJyZyCC30Uz7RR8ckbVXIxRUy8hcD1wxEUR8/mWTCIP2MSJYQhwnJ6dGhIoAdfANQp2Hkv0YzpKQtOTgJosdaIWjxUJgbDmUGrJo1GZUvJPtWlAvyIiJBGkgiZg4YOjLnL9jEHxjkuU9VhaGhLchbxhhedHengvMRSEPRquv+QqCPUrA+evYqfOuAkrOzP42ARwxV1ukbhJ4l7i7IVgSGib99Hgj41Bl6Wt8PZUavpYugDlmNJw5rVajSy+jwmQQCA2TyRji9ilXDEjWLQ7Zriz5ur9bl85DiPxgP0jI1yaz1LGHp4Dww==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a77fd0b-0bab-45d3-61c9-08deb1e259b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 17:58:05.8386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYX+PZKb2QHX3wZ+NTzcld2i0WaQ47HzUPQH6LNS1tXZsxpaGm94hrDBBUj+uEKZ9ZgidCCieBAgLXTWCDJ18A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8941
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-5.cisco.com [72.163.7.169];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 17:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126990

--_000_DM4PR11MB618984B94205B67D6B201681C4072DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We are currently migrating from Yocto Scarthgap (5.0 LTS) to Wrynose (6.0 L=
TS) and noticed that the wrynose branch is now available in the meta-openem=
bedded layer.
Could you please also share the key changes in Wrynose compared to Scarthga=
p? Specifically, information similar to the Yocto 6.0 release notes would b=
e very helpful for our migration, including:

  *   New features / enhancements
  *
Major recipe version upgrades
  *   Newly added packages
  *   Removed or deprecated packages
  *   Package splits and runtime behavior changes
  *   PACKAGECONFIG and default behavior changes
  *
Recommended migration actions
  *
Known issues if any

Thank you for your support.
Regards,
Deepak

--_000_DM4PR11MB618984B94205B67D6B201681C4072DM4PR11MB6189namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
We are currently migrating from Yocto <i>Scarthgap (5.0 LTS)</i>&nbsp;to <i=
>Wrynose (6.0 LTS)</i>&nbsp;and noticed that the
<i>wrynose</i>&nbsp;branch is now available in the meta-openembedded layer.=
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please also share the key changes in Wrynose compared to Scarthga=
p? Specifically, information similar to the Yocto 6.0 release notes would b=
e very helpful for our migration, including:</div>
<ul style=3D"text-align: left; background-color: rgb(255, 255, 255);">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); line-h=
eight: 20px;">
New features / enhancements</li><li style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0); line-height: 20px;">
<div class=3D"elementToProof" role=3D"presentation" style=3D"margin: 0px;">=
Major recipe version upgrades</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); l=
ine-height: 20px;">
Newly added packages</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFon=
t, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; co=
lor: rgb(0, 0, 0); line-height: 20px;">
Removed or deprecated packages</li><li style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0); line-height: 20px;">
Package splits and runtime behavior changes</li><li style=3D"font-family: A=
ptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-ser=
if; font-size: 11pt; color: rgb(0, 0, 0); line-height: 20px;">
PACKAGECONFIG and default behavior changes</li><li style=3D"font-family: Ap=
tos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-seri=
f; font-size: 11pt; color: rgb(0, 0, 0); line-height: 20px;">
<div class=3D"elementToProof" role=3D"presentation" style=3D"margin: 0px;">=
Recommended migration actions</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation" style=3D"margin: 0px;">=
Known issues if any</div>
</li></ul>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thank you for your support.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Deepak</div>
</body>
</html>

--_000_DM4PR11MB618984B94205B67D6B201681C4072DM4PR11MB6189namp_--

