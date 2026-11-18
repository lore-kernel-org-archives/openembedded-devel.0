Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10844.1795002572863451893
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LhgquQpp;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12724; q=dns/txt;
  s=iport01; t=1795002572; x=1796212172;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=BRqFYmLgHAoUu7ZYDgnZ9sYrE9ef/EdvfzUKgj+jkkw=;
  b=LhgquQppsaptFgHkKTUs+yYiBUw//LUOfwvrpyEPjb2KIbbz/9hXAmET
   58+1djiWmnkHF6XQQJOZxAkNenzSVeHbBVvhAt9FRmdho5/Fa1Cd70SNg
   1HlN1oG/kR3C6/oRO1/n9ew0w34EybTUdDrgymjIJGQgqiy/HVajJ29+q
   Onyp6xbOu3+VTS7ziLgtor2MomAJCr0Af9FIicoEIFZVJlj4qC+UHtk2p
   Bx9C2WD81Ep8u1Q2PM1kPrJc+sfXiq/WhaKIyjBzhy3MH34AjSfPy3rkM
   WGgnEfczFc93UJp12y/cecxGnd0JiTpwB5sRCYI53DBdFIkTU85a8GcUJ
   Q==;
X-CSE-ConnectionGUID: ynRoSdOpTb+7YjCenrGRFA==
X-CSE-MsgGUID: OJZtOW7eSNuL5Pkn5cDvVg==
X-IPAS-Result: =?us-ascii?q?A0DNAgAZkP1q/47/Ja1agS6BK4E9ATBTFnMCgRESGi+II?=
 =?us-ascii?q?wOFK4ZZgiEDniiBfg8BAQENAi4BFQ0EAQGFBQKOIAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDARE5ARsiAgEIEQMBA?=
 =?us-ascii?q?QEvJwodCAIEEwgagmGCHRZBAwECDq9icwKKHXiBNIEBgykB3QcBCxQBgTiFQ?=
 =?us-ascii?q?oMfAQErgTWCXYEjhRYnGxuBcoFXgSiBQj6CPyICAoE1Kx6DdoIwBIIiehIbg?=
 =?us-ascii?q?TkeYAQJjAwBAYFPh3VSciIDJjMsAVUTFwsHBYElQwMqLy0jDzwFLR2BIxIpF?=
 =?us-ascii?q?xEeWBsGBRIgKkBDW4ESgQNdgSsoXgIfRi0VgXYCglGBI10CAUlBDgdFUwkWD?=
 =?us-ascii?q?z4FEkckIggSCQETGiwKgRo1PAkmPxUMWwwLGgUaRwgCCwIMdCgREBMdHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4IbT03FRkDBIE1BZJHB1uDGHsTASsEExkfUWUaFIUnj0GOH?=
 =?us-ascii?q?0eOGZUZCiiDeYwkjT6IMheFW6UXmQgjixSCU5sPAgQCBAUCEQEBBoFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OLxUcgVyBaMtGeQIJMgIHAgcOAwuRaIF+AQE?=
IronPort-PHdr: A9a23:A0eOcxFFwfEwok//IfwA6p1GfhMY04WdBeZdwoAsh7QLdbys4NG7e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:8/PLa6Myz5dKuWbvrR39lsFynXyQoLVcMsEvi/4bfWQNrUojhDIAz
 zAWWWvXbv2CNjH3LtoiPt/n9EwPsZfXydQ3HXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+RoNkYNMaoAxuw0XlBM3
 vEeMh83QDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237kVApgOW9YYKMEjCMbeJ3rFq/m
 T3LxELkJkwiN9rCwhabzH3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Dg2Nqa/QMM3DxTV815Fuk+HRdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBepTnhAsW9qADnhOBICOgqTPuftWbdyRCVxe1ZnO/fKnjbalHDH41mpO
 hdmspFeafN5DFB5K6QjnjbYrMdKZu8gd2VbIzlvhFQpHRRGtldBnBCe3+m+yNNNW57LKt8Pq
 CxouBAoD2tc2kWaMOUOlkpNtKom/T70LjdTVojHRAI1Cmi5AnE1JfKVzSI1BYXVD1ChYwl7X
 XElALB4KCiueGQyxPX1WPfhq4m1ucJzOEtOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjPsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZJBOe
 NwriCkXqhsfFf9dRfGlp/1vtZR5wyJSE8Z4KsuZrpkINIjgfFq3NQiFQhuYeY99WrBmfAa+a
 9VfYDhzccTV0+GZHbEuWQq6tmtUnMvWiqieCE5y5eoO/w8pgEl86Per/ZvxEvp+P8GOup5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB/a/Yw8SjvwQqTMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy5wGckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ30qlqYA6OvPH8YQKYRqWkx+MDLEHzxZln9LQw
X-Talos-CUID: =?us-ascii?q?9a23=3A1K3P72uMBU/B+juG33kojIX46Is0dEfa93v3O3O?=
 =?us-ascii?q?ySjlYSpaYT0W/wo1Nxp8=3D?=
X-Talos-MUID: 9a23:lSjNqwgxVwqOGriikRmQ5sMpE+Va/4ORV002t4gi5vGHM3F7Fymjg2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 11:49:31 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id B305018000225
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:49:31 +0000 (GMT)
X-CSE-ConnectionGUID: lRA/sBTKTXysaWuSPtuwbg==
X-CSE-MsgGUID: 9VrRuACITzGhu31aVt+zOA==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208,217";a="75744358"
Received: from mail-centralusazon11010027.outbound.protection.outlook.com (HELO DM1PR04CU001.outbound.protection.outlook.com) ([52.101.61.27])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 11:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWm/DkXRfdl8B4Exjc3K0oRA8919Af+etOwEIYjztmwgAN1PYUB5GnoU7KgFcWiEFYcg5nps7x1LSGuHG17ZHplf4BJFvMYd7tVTpOudeFaKOz/+oq0dcMsbHcajRHngy+wP/R1JefHGBrOgk+gIMpPjOfKe+11Q4LA3fKDbjGOf7mXWaSF65r/6X3jha8NmB0IhAl4vjK4wEtpcUnpckE9qJlgfkpN6Nu8DIflBAHHvHkcZ9THxYhBxhwmH8sQZDwt9IzIg2dhem9zoFksuet833EwaCwsLdVSDZF9T78s5RQ/101nVznZZ68Ar2b81SNbTwZIWEfq2VkEECNx6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRqFYmLgHAoUu7ZYDgnZ9sYrE9ef/EdvfzUKgj+jkkw=;
 b=W5KRwwoSrZsAdYCdOX5A6GMJWHStwt5Xaj51gib1jl++hS2aF/9+Ut/JIVFzJCd/DUL4kPVCnGsp0nt6wBy+/CPRSXMNQ50yq9AdcHacHTKYZttbGgEfe+GlcufwA/kQGmM8r74XB5LHN79BXBXiuhrNtRXE5m9odmzkeRbEuOlOZYWxNz/db5FZJRXJeWmk2CZz1UJt5s14M4AuGAI3Gc3QCN+x2W3SuKP0/1zUUGZmVGHfC7lylv8FwL0EEHW69J1Vkj372+vKB7/D9G5LrZSCF828SS+rI9C2MedpGQ7yAEJuAFV4ruutcazayQY121LvoAB7ojDvvD/LutCnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 11:49:29 +0000
Received: from MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc]) by MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:49:29 +0000
From: "Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<yurade@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Yogita Urade -X (yurade - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <yurade@cisco.com>
Subject: Re: [oe] [OE-core][wrynose][PATCH] frr: Fix build with bison
 rejecting paths in output directives
Thread-Topic: [oe] [OE-core][wrynose][PATCH] frr: Fix build with bison
 rejecting paths in output directives
Thread-Index: AQHdd05RpwnrE4iFNUSWejxHmeQRL7cztq6h
Date: Wed, 18 Nov 2026 11:49:28 +0000
Message-ID: <MW3PR11MB4585FD66D94E5421DD72A6C9DE7A2@MW3PR11MB4585.namprd11.prod.outlook.com>
References: <18E91F8A5A75836E.1337826@lists.openembedded.org>
In-Reply-To: <18E91F8A5A75836E.1337826@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4585:EE_|PH7PR11MB6554:EE_
x-ms-office365-filtering-correlation-id: 4d146ff1-7e36-4278-6882-08df456a00ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|260925021311599003|261009221227099003|260925021911599003|260925022911599003|5023799004|56012099006|11063799006|261021121427099003|261021123027099003|261009220027099003|261009223027099003|261102123227099003|261009223327099003|261009221727099003|261026121527099003|261022105027099003|261022113327099003|261026140227099003|261028144727099003|261022075727099003|10067099003|17096099006|22082099003|18002099003|13003099007|3023799007|8096899003;
x-microsoft-antispam-message-info: vT5DduE+AetD2YRJOpzh9jF2UzmlfslmwOKOrcBcpMrWLjQDXEPHofkL8wM3NOb3e9xFenUUHBvJliRt4JOULGUAM1rzl5buLCmGM+SEpqXo+BaXbCptlVVzSKPxXJbFqiCepzh3Gg+FC2Uf3ePSOnfpRldBI4Ulc9XDqaqzu7N5Ih6M0XpSY/Grx0gCqAvCow9gpJf+PtU0jEJS3D/eKYONOMNTglOhzpPPPiOgjX1b+Q3GpvpkevfEqEC3XJ68pv8jZLByaOVDXn3osHvOpQmqG1eYN3FiZZQdDjHps7gVQ6suYE27Np+rGVKnaXu20VZQ/gPF73PmiOsltifxqLH0pso89++cxn6yp2eGT5zFlSJfDymuY+dvcB6qNFekpXFVmNP6d5/UwYX1TkoV8nqRV4Qtus+lZVO101AAutuiB7fjJfv3y3yIj+BjCYnK1GdwyIpFV4DwPZCcX+qs+EadERhG8wQ2ad2i7ADw/ST0kHAUdZQf01YDwuy6pDLNrLDmQ3np2QB995W/E63pE5tnqwxWC2dWJcLeYjAJ5z5z3Qkt9vBQZhGif1tLVkhiRYC8DloSjRiWPB1DZV6LGiBJm2ALcYrssjwAo+DMKE4LSNmOKcVtBRo9OIvdrD7Bjy5fjgE4jUFU0vPp4nD/z1RwrfG1fW/YFXeqAaaK6E3p6096tdGZR4qXE9nHwe+V
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(260925021311599003)(261009221227099003)(260925021911599003)(260925022911599003)(5023799004)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009220027099003)(261009223027099003)(261102123227099003)(261009223327099003)(261009221727099003)(261026121527099003)(261022105027099003)(261022113327099003)(261026140227099003)(261028144727099003)(261022075727099003)(10067099003)(17096099006)(22082099003)(18002099003)(13003099007)(3023799007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hP7VtRLRTFNZoltq2D7GxEhugoD50XxGxO3SZ7FC59g6ZeM0ZqsiypfWQiRg?=
 =?us-ascii?Q?9mqBQQXWdWXMPXBKJS4fG6NSWJDVepH1/mbhwujGqDl8UuAYn9k7KlUou70m?=
 =?us-ascii?Q?8+HHaWn3kR3EPAmPtqvJ3MZciHQNJwxfg6yVSlffh4pDTj9NM2Cb65GorkE3?=
 =?us-ascii?Q?18NgPfE3ayLc0hFncHSuWRa4Y9vK51zrBNc2eJ5CHwgD0vAYA/CcFrHoQolp?=
 =?us-ascii?Q?ZERcUiUrGZsMYBKxRNgNsuyEf0mSfxpMwz44FrcbjWoXc2BBs25SXtPrdyBJ?=
 =?us-ascii?Q?6bsPvnjD+JqBmNebZxu7cFuJ5IrBLVqHXkt8hExGhEB5xSKb0ABnYL04qdYN?=
 =?us-ascii?Q?S4UMUOmuGwcZBtrd2VNKejudGbkPyrnoVLZRvke1yNhzfNdQu2XdbEJEMHp0?=
 =?us-ascii?Q?t5YRYwOzgGqvjmUtK20ksQqg3MQuhqx3X70uR0fvZ8c5wQ94naUU7++zdzH8?=
 =?us-ascii?Q?ZSqNqR2V3BPkySjlTWPbSoZF6dnorkjfI+PIPyxrVBTO5Uq6Y1vvaD/HuGuf?=
 =?us-ascii?Q?5Eeynq0LhaWE1Q3DTBxRDHNZWlGzA1x/VZPr3iHpYtCyTTqYQDqqmalOJiGs?=
 =?us-ascii?Q?lkq3RqrHvGL8ZR6NJJi/NKWH3b0IzCWr9LRR0b2U4gi+zpgc2HkD70lA7Fs+?=
 =?us-ascii?Q?0J9e/QeL5vsrUUp5MHaMydLqUx4msCiBYQsA3j0hAsVWqUrox8fSH20B2R69?=
 =?us-ascii?Q?r8pyucHqy7eJ54nMlM90jLyAzh4virPS+M3yWHboxwHvs1neYn/aXtYN2W1P?=
 =?us-ascii?Q?HHcTAXY5iJyCsMRsBTdPtlSlLrarS3zDOMdz29VMzyQRccaa6Hot2ITWQGhT?=
 =?us-ascii?Q?D5EO6ozIqYnGrBfeYH5YngkHGfYYl+jSPnkjsWw25N1NwdOX/2IFDo2x6AEJ?=
 =?us-ascii?Q?L5nu73H9iJ6c42XBfaiwxasxW0QHF6wbDFqEeUr4H2st9FftqsUlqMzz6TIP?=
 =?us-ascii?Q?ABTBJcWVQh64NODGxUpaAqoWZQMrILpuqW2UwzI0Ozd1BfCgoy16sFRnOmTo?=
 =?us-ascii?Q?IL+P9kLSE1ZbNKedfqvLHjZqFWJcEGKlskAizy8CFA7HdhI8ghR0Mo/Zs1lH?=
 =?us-ascii?Q?KRvYVGaCmi1ZrD4Aaq78S/HSzsneogjghD71msi0yDIxwfqvoio3zGUovi6W?=
 =?us-ascii?Q?TIV6bFpEh13CAZP21fX+TiVZrO+a3TOYZf/e/F3Lp2Gk3OE8XLE221B7d6z5?=
 =?us-ascii?Q?XYA2WkMVAcH4KhY5ibXF7h5FWjlWXjXEN2k6Oev3XF9Z0uM24Y1PYSjDT/Ux?=
 =?us-ascii?Q?FOoiXD6y1I6QdiBJGv1fGQM6M+oArDo1Grf11e7C+CWCQ58qQ/UzGlA5sncr?=
 =?us-ascii?Q?g0uE4C+XjYTqL/3AoaV2iIuZjEAKilNdDT9UGYdvQEsn1TAIc8cd5x9+DjpU?=
 =?us-ascii?Q?Mt3ZhFrTdi8Dv1cERgRSytgaLFd8bNie+DKOry0jvreCT3bjlYPpSubg1Ys+?=
 =?us-ascii?Q?OztgaEjgA3rUMgXuOy8Qf82l7tTtXcWeGMs+ZI1dTVnmST7lqRyN9FjN+9av?=
 =?us-ascii?Q?jRmrNiaqUGD8VxYtSuwSAoYQJclfIEExK5TLRL4XFyxeJZ3ZJPmTtGcg7MwS?=
 =?us-ascii?Q?MgLpDozGvZHwPsuYWazcGEbThUq4DIsOhQ5DlXJjNHpN4axhLd2h1qDiWQCQ?=
 =?us-ascii?Q?jxX0RelEfENz3LEDTv94o8atAxu3kRYVVEgXm4wscsCSbJojGNQ4vCdG6YyE?=
 =?us-ascii?Q?lE+JmfsK6g4lsLABScKN5KKC3WoR3CjTn3l8qh1qSbnZ5xAB?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB4585FD66D94E5421DD72A6C9DE7A2MW3PR11MB4585namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: X0CScRVbALGJjY55OAoTGZW86hCmhQ9SPMDz9c50vGDgeXzPUhMaRiKeZMQ+gJ+VuLkuVN822zAQDmnLJ7sN4HhFpfcOYyB1WXadCk++VFMI4vMIQn5MgsVyYfUR7C4kz0pCkXpzrbJvC049OHxIsYgxeBYSXkDPGiHgFSo4ADLfL3tk4Jq9n4nov0+XeQm/SxWq226T9ZPnfT69Osrb5biU5kqL190R1MObWQGeBBa+pBmCrt5oxAkw6i6q3ZYHX2V6EvqB4R15C1YayVEDJJUb42HOmYYrVs7QXoOotzfydtVPRXclI7wGXUYOUTI/tnAaToZ/jGdCTAx8OHzGnA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4585.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d146ff1-7e36-4278-6882-08df456a00ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 11:49:28.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +F0ejCMrzHdGx0sBvjB6s7frFX9h7C70EDJJ2pxErUsXjRgtJqvd/rL59iIrioNbrahzsT/20YjQyVkxUmBI7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132646

--_000_MW3PR11MB4585FD66D94E5421DD72A6C9DE7A2MW3PR11MB4585namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch.
Sending new one with correct subject.

Regards,
Yogita Urade
________________________________
From: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) via o=
penembedded-devel <yurade=3Dcisco.com@lists.openembedded.org>
Sent: 18 November 2026 16:46
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [OE-core][wrynose][PATCH] frr: Fix build with bison rejecting=
 paths in output directives

From: Khem Raj <khem.raj@oss.qualcomm.com>

bison now carries the fix for CVE-2026-56390, which rejects '/' in
%header/%defines and %output file names, so generating the command
parser fails:

  lib/command_parse.y:20.10-30: error: invalid %header file name ignored
  lib/command_parse.y:21.10-30: error: invalid %output file name ignored

Backport the upstream fix which drops these directives and passes the
output file name with -o instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cf06742a7c064d293c715e143fdabf91bf072893)
Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 ...ths-in-bison-output-defines-directiv.patch | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_10.6.1.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Don-=
t-use-paths-in-bison-output-defines-directiv.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-p=
aths-in-bison-output-defines-directiv.patch b/meta-networking/recipes-proto=
cols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patc=
h
new file mode 100644
index 0000000000..ac732d9ebc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in=
-bison-output-defines-directiv.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 13 Oct 2026 15:33:02 +0300
+Subject: [PATCH] lib: Don't use paths in bison %output/%defines directives
+
+The fix for CVE-2026-56390 rejects any '/' in %output and %header (%define=
s)
+file names. The directive is then ignored, and bison reports an error
+and exits non-zero, which breaks the build:
+
+    invalid %output file name ignored
+    invalid %header file name ignored
+
+We only used these directives to place the generated files in lib/,
+because the .y.c rule ran bison without -o. Drop them and pass
+`-o $@` instead. With -d, bison derives lib/command_parse.h from the
+-o name, so the generated files stay the same.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7ad39d=
799d98c982713b29c1d0ba6d49691308b]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/command_parse.y | 4 ----
+ lib/subdir.am       | 2 +-
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/command_parse.y b/lib/command_parse.y
+index bc04bc93bb4c..4d9377e5df87 100644
+--- a/lib/command_parse.y
++++ b/lib/command_parse.y
+@@ -16,10 +16,6 @@
+ %define api.pure full
+ /* define api.prefix {cmd_yy} */
+
+-/* names for generated header and parser files */
+-%defines "lib/command_parse.h"
+-%output  "lib/command_parse.c"
+-
+ /* note: code blocks are output in order, to both .c and .h:
+  *  1. %code requires
+  *  2. %union + bison forward decls
+diff --git a/lib/subdir.am b/lib/subdir.am
+index 20947c306d60..dafebacf8e7a 100644
+--- a/lib/subdir.am
++++ b/lib/subdir.am
+@@ -537,7 +537,7 @@ CLEANFILES +=3D vtysh/vtysh_cmd.c $(vtysh_cmd_split)
+ .l.c:
+        $(AM_V_LEX)$(am__skiplex) $(LEXCOMPILE) $<
+ .y.c:
+-      $(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) $<
++      $(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) -o $@ $<
+
+ #
+ # generated sources & extra foo
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-net=
working/recipes-protocols/frr/frr_10.6.1.bb
index 8f53cf68d5..bd977be214 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db=
234ee4d69f5fce4486a80fdaf4a
 SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/10.6;tag=3Dfrr-${PV} \
            file://frr.pam \
            file://0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.pa=
tch \
+           file://0001-lib-Don-t-use-paths-in-bison-output-defines-directi=
v.patch \
            "
 SRCREV =3D "71da51baee6fb2a02b24262defc46591c86e8a81"

--
2.35.6


--_000_MW3PR11MB4585FD66D94E5421DD72A6C9DE7A2MW3PR11MB4585namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Kindly ignore this patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sending new one with correct subject.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yogita Urade</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yogita Urade -X (yura=
de - E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-devel &lt;yurad=
e=3Dcisco.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 18 November 2026 16:46<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [OE-core][wrynose][PATCH] frr: Fix build with bison re=
jecting paths in output directives</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<b=
r>
<br>
bison now carries the fix for CVE-2026-56390, which rejects '/' in<br>
%header/%defines and %output file names, so generating the command<br>
parser fails:<br>
<br>
&nbsp; lib/command_parse.y:20.10-30: error: invalid %header file name ignor=
ed<br>
&nbsp; lib/command_parse.y:21.10-30: error: invalid %output file name ignor=
ed<br>
<br>
Backport the upstream fix which drops these directives and passes the<br>
output file name with -o instead.<br>
<br>
AI-Generated: Uses Claude Code<br>
Signed-off-by: Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<br>
(cherry picked from commit cf06742a7c064d293c715e143fdabf91bf072893)<br>
Signed-off-by: Yogita Urade &lt;yurade@cisco.com&gt;<br>
---<br>
&nbsp;...ths-in-bison-output-defines-directiv.patch | 54 ++++++++++++++++++=
+<br>
&nbsp;.../recipes-protocols/frr/frr_10.6.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 55 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib=
-Don-t-use-paths-in-bison-output-defines-directiv.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-p=
aths-in-bison-output-defines-directiv.patch b/meta-networking/recipes-proto=
cols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patc=
h<br>
new file mode 100644<br>
index 0000000000..ac732d9ebc<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in=
-bison-output-defines-directiv.patch<br>
@@ -0,0 +1,54 @@<br>
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001<br>
+From: Donatas Abraitis &lt;donatas@opensourcerouting.org&gt;<br>
+Date: Tue, 13 Oct 2026 15:33:02 +0300<br>
+Subject: [PATCH] lib: Don't use paths in bison %output/%defines directives=
<br>
+<br>
+The fix for CVE-2026-56390 rejects any '/' in %output and %header (%define=
s)<br>
+file names. The directive is then ignored, and bison reports an error<br>
+and exits non-zero, which breaks the build:<br>
+<br>
+&nbsp;&nbsp;&nbsp; invalid %output file name ignored<br>
+&nbsp;&nbsp;&nbsp; invalid %header file name ignored<br>
+<br>
+We only used these directives to place the generated files in lib/,<br>
+because the .y.c rule ran bison without -o. Drop them and pass<br>
+`-o $@` instead. With -d, bison derives lib/command_parse.h from the<br>
+-o name, so the generated files stay the same.<br>
+<br>
+Signed-off-by: Donatas Abraitis &lt;donatas@opensourcerouting.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/FRRouting/frr/com=
mit/b7ad39d799d98c982713b29c1d0ba6d49691308b">https://github.com/FRRouting/=
frr/commit/b7ad39d799d98c982713b29c1d0ba6d49691308b</a>]<br>
+Signed-off-by: Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<br>
+---<br>
+ lib/command_parse.y | 4 ----<br>
+ lib/subdir.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
+ 2 files changed, 1 insertion(+), 5 deletions(-)<br>
+<br>
+diff --git a/lib/command_parse.y b/lib/command_parse.y<br>
+index bc04bc93bb4c..4d9377e5df87 100644<br>
+--- a/lib/command_parse.y<br>
++++ b/lib/command_parse.y<br>
+@@ -16,10 +16,6 @@<br>
+ %define api.pure full<br>
+ /* define api.prefix {cmd_yy} */<br>
+ <br>
+-/* names for generated header and parser files */<br>
+-%defines &quot;lib/command_parse.h&quot;<br>
+-%output&nbsp; &quot;lib/command_parse.c&quot;<br>
+-<br>
+ /* note: code blocks are output in order, to both .c and .h:<br>
+&nbsp; *&nbsp; 1. %code requires<br>
+&nbsp; *&nbsp; 2. %union + bison forward decls<br>
+diff --git a/lib/subdir.am b/lib/subdir.am<br>
+index 20947c306d60..dafebacf8e7a 100644<br>
+--- a/lib/subdir.am<br>
++++ b/lib/subdir.am<br>
+@@ -537,7 +537,7 @@ CLEANFILES +=3D vtysh/vtysh_cmd.c $(vtysh_cmd_split)<b=
r>
+ .l.c:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(AM_V_LEX)$(am__skiplex) $(LEX=
COMPILE) $&lt;<br>
+ .y.c:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE)=
 $&lt;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE)=
 -o $@ $&lt;<br>
+ <br>
+ #<br>
+ # generated sources &amp; extra foo<br>
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-net=
working/recipes-protocols/frr/frr_10.6.1.bb<br>
index 8f53cf68d5..bd977be214 100644<br>
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb<br>
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb<br>
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://doc/li=
censes/GPL-2.0;md5=3Db234ee4d69f5fce4486a80fdaf4a<br>
&nbsp;SRC_URI =3D &quot;git://github.com/FRRouting/frr.git;protocol=3Dhttps=
;branch=3Dstable/10.6;tag=3Dfrr-${PV} \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://frr.pam">file://frr.pam</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.patch">
file://0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.patch</a> \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch">
file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRCREV =3D &quot;71da51baee6fb2a02b24262defc46591c86e8a81&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW3PR11MB4585FD66D94E5421DD72A6C9DE7A2MW3PR11MB4585namp_--
