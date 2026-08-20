Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C96C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:24:38 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2377.1787214270032709934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eu5zLInE;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7361; q=dns/txt;
  s=iport01; t=1787214270; x=1788423870;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=ajSp0HLErAQzgjPwPn9Otpnum1Is4aLLvqAABdObfrA=;
  b=eu5zLInEL5VumsuRqj06/jtJMoTAKg2unTvXpTL+udFE6pWnk0um1j5I
   MQnAszB/dnWozKN+pm83AMV5VkGHEsNEqxbY4bGHlWA+ANwUeRvcoHCCx
   wBJ2klP7vCy8QF8csxuDm8IgnnEhSnF0+RQCkaso2RHeFSSnCmLW1cqet
   8Kn+K2aiw6qElmUt3smbTAYqgWgLndwuAY5MrxvfnSBKJk++Frxp35vYO
   ohVI73qYI/HCEq72DgnMD2ALj5B18vz8wb46D4goS6eOnYmlVoqLUemUe
   GBCeu0NAe7FFKOH0iSP1x+uS91aOmrM0KZTTIZKdTd9YM4y+Xpms61Q8w
   A==;
X-CSE-ConnectionGUID: Bwd3YZL8RV+C9ArWRUcMwQ==
X-CSE-MsgGUID: Jibg6+IpTz+dBcWEUDizMQ==
X-IPAS-Result: =?us-ascii?q?A0ApAwC4uIZq/4//Ja1aHgEBCxIMZYEgC4E9ATBTFnICg?=
 =?us-ascii?q?SFJiCMDhSuGWIIhA54bFIFqDwEBAQ4BLgEIGgQBAYUFAo1rAiY2Bw4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8BDIZaAQEBAQMBSgEoFQIBC?=
 =?us-ascii?q?BEEAQEvJwodCAIEEwiCe4IdFkEDAQK4NQKKHHiBNIEBgygB3QQBCxQBgTiFP?=
 =?us-ascii?q?4MeAQEqgTWCXYEjhRUnGxuBcoFXgmk+gmEEAYFDHIQTgjAEgiJ6EhuBVwZQP?=
 =?us-ascii?q?5BDUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxceWBsGBRIgKkFEI?=
 =?us-ascii?q?wM+OIEIQQKBdT8jGTZ8gQlegSsqYgIQF0YuFYIKAoJwgSheAgFJRQ4JFwttP?=
 =?us-ascii?q?TcUGQMEgTUFjWUHWyCCFzR7CQocFCwgMCATJzwcC5MAFFKPF0ejMAoog3aMI?=
 =?us-ascii?q?Y0+iDIXhVulEZkII6NOhScCBAIEBQIQAQEGgW8CM4FZcBWDIglKGQ+XNscGe?=
 =?us-ascii?q?QI7AgcCBw4DC5NmAQE?=
IronPort-PHdr: A9a23:ETaFdBJKJjbMz0I+h9mcuVQyDhhOgF28FhQe5pxijKpBbeH4uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:Hg+t6aPZM6vr+pnvrR3/lsFynXyQoLVcMsEvi/4bfWQNrUpxhTAFy
 zNND2GHPquDYTagc493btjg/U9SvJaEy4JgTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj699xABoHD6lIwNg0KjBn7
 8MiFTsocSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiOa3aouEI43iqcN9vEeSq
 TyF3nzFEFIWHteg5Aep82CJv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:DrTKnKhV83WlQs/tgftBiAMsT3BQX9N23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sda9qBPnmaKdkrNhQ4tKPTOW9FdAQ7sSlrcKrweQfxEWs9QtqZ
 uIEJIOR+EYb2IK9/oSiTPQe71Psbv3lZxAx92uskuFJjsaDZ2Imj0JcjpzZXcGPTWua6BJc6
 a0145snRblU3IRaciwG3kCWMb+h/CjrvjbSC9DLSQKrC2Vgx2VyJOSKXWl9yZbfyJEwL8k/2
 SAqArk+6Wlvci8zx/Xx0XT455VlNaJ8KoMOCWLsKcoAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF4SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7nF5x9qAnTy8orh6No+QgZCsa0XZcZkBS19L7ukYvFLf2roUh9LD3snklSKvoVxiKmbzPWN
 MefP00oswmMG+yXjT+onRlxsCqUzAYGxeLRVVHh+muugImx0yQCyAjtZEidrBqzuNmd3FJit
 60QZhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cE4lhqSHqYnd3tvaMKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+6P7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKwnFadjqKgTQk2DEjOZN+fLhjpouIaA2R/hxjjQ=
X-Talos-CUID: 9a23:/VwAIWMChNzYRO5DcjZrr38mPpAfTD72nV7KHHWFAkN2cejA
X-Talos-MUID: =?us-ascii?q?9a23=3AdR13kQ1JfFeaCiUXjemGOreBnDUjwaWkBx5OsI0?=
 =?us-ascii?q?6qYqIHydPFgqxjSaSe9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:24:29 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id F350E1800025A
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 08:24:28 +0000 (GMT)
X-CSE-ConnectionGUID: gkltf975Qli4xteSBvz6qQ==
X-CSE-MsgGUID: Dh9ZkpQhQsGWn2/nk2EANQ==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208,217";a="77664791"
Received: from mail-westcentralusazon11010044.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.44])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPYWqOxS6ECmz9B1gCoBUHAHys2A4FE6ocdtFzEzoxyinxzchB0Nq/E8SKOs+nhHYYh/g50OVA4/vA7LC5NWYuOVo5fJkXPJYKj5XJTzd/79IJI9xJuQf9mrBDl7jA8ho3PGrFRl91dUdxcps2X55ogqGlOiGxzbZc28WHNGZrFEZ7/La6q4/VGg3GEZxmJ4uLrqKniM3Lx3YWYqOHdNiXmMZofRJupMT+74FHcVKGBpZtEs8QnUk3NRRGMoSkyDSi5JjoIelE8kFPEK5uzpdcaGed0yakuGl72Vbk+KiXp5DG6GTPIH2RQdXD3ZejhQW/lGmwqiZ/bb75R0hG0xGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajSp0HLErAQzgjPwPn9Otpnum1Is4aLLvqAABdObfrA=;
 b=Qfu3p2Yasxngf2wMDxkdh0Je1SoCKEr0a8ngSf9j+YHpj4dWrD8m9zDlx3Mn7UZD+NcYKqRrSW8vXIb3yw7M9JJiY/39oHuqTGPzB+mEcFCOaZZR8IiyfkTDPH2FC3uPxLFTC7aasnHrjid+FvMZGSfK9c4EbDW+++Rp0MzNSMr4N1I8lLzeJg9+r4b4H3iKSNIrw6wstHPzTc/10+AAiDDyr+2dr8a5Xvj9+cmfjMiX27aUq+i+TzdskL/GsNYKX1XRvcY4HoZdCuRxOerDE6iool6xgGIWIS0cPmJtmKpdOL4yai/bUbSjufNMdXIFINO+2hDRViQ6V6065zMulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 08:24:27 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:24:27 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][wrynose][PATCH] redis: avoid LTO for clang builds
Thread-Topic: [oe] [meta-oe][wrynose][PATCH] redis: avoid LTO for clang builds
Thread-Index: AQHdL8ywI/Abhvr+s0aFJtVd7Wm/krammvRs
Date: Thu, 20 Aug 2026 08:24:27 +0000
Message-ID: 
 <DM4PR11MB618981747B3E856C580BE876C4A42@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <18CD30E6517B8494.2965692@lists.openembedded.org>
In-Reply-To: <18CD30E6517B8494.2965692@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|CH3PR11MB7323:EE_
x-ms-office365-filtering-correlation-id: ca295ec0-90b8-4927-3af8-08defe947310
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|22082099003|18002099003|11063799006|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 4OH+UiixST5g+6hV9zeMJWaHc+YwjdWzrFwiKKSl7FWPsT/LAL8cm8uvX7Hj12mC4LYKy2l9m6zwEHzeCbBA1k6iDkjMz7kna0/ML7R4jUk1hB/NEtFI5hH2rbWSs6M4XPZrAdBUz/EmpeF4DOzvMjJDHG5NKXmCtxPfpV6fbMOXiEriAY6qJJgNIKYn8I2WQVJh8GqlxEBEW5LDNWzHMwuL2nGnol9LSfUkNTb9K8jNIe7CpGCPeDzmIbzYJDGz6gCqP2Z2LvQHVcW+MFL1Ktnisq8ruN0MCssKajMNkvpiOetq/HpDQ8RTIvXMZCbpxZ861306dL5nuvLlRC+e/lGW/47rGcpg+LTt22AX19GKmDoJXajsqKhZtzfXobzzMaJ5eqHYQJcAhglHPaJwuSbK6Fnwpy78FSMRgH4o5yWlzxMD+wVbB1suFPBvvGNbz5kmWsGtIMCZshu0FfgdAl1D1hWEJ18cndMsNsKzB857MFrtsOd7/0qWKU4ZEkP21rMQduD2mvKE2QLwrwLcnst3yNFLiWMsmcdR9PpWnq4H/toRnaDhekAMTh8DwUbtDjT3q8g+5HaCxgWdlFizRkw1eVbbPC5qUwHwEAEcDaSRKXfkwfhs3L4R2Hgg8XyN7XEGxXker+5zD5nDAAP3+IDZW9qsbXtIoDIX0yGA4W7GHNMVY97hRSpTE9g/PWCQjwJPcBIxL8OignZUtl/9vNUaE6hwsRHvRSwAa5bAP2o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qvc92rUxAuTcykjYKhugbTJ/I5VBiXDe/GVx2zRd2P9oO4QniYibtPcr6ZCp?=
 =?us-ascii?Q?G68rzbTRAm6utQo+qUJBdPzB62jF/8IBiMH2mhBfyYWWCO2IzmuDTe5AAVrH?=
 =?us-ascii?Q?AkKN5oCDV3h2l4OiWD0lv2/Z4Z+RLZbTeUWcK+ALQkScA7sMpgcApsYPK/fy?=
 =?us-ascii?Q?82BLpEDbxsAboSHHBf0ACrLNn9zZkXkIK+OtVjpLkTfkscjtnFsuxf2cRASn?=
 =?us-ascii?Q?DoPTFYW4K6tUgaKGBZx1faLnIxhkV2v56KKXKLVnCuOCSdJ6k6Itl6AmUk2r?=
 =?us-ascii?Q?GS5ER9MaIh6J/OF6QIS+7vRXvVB4dfUYLT1pu0/EA9y/YNLiB0Nh6jEWD8et?=
 =?us-ascii?Q?RusYZxaUxFi6Zm0bL6iDnCZbJV+6ErvlW4pR0ALtSqtgOq/5j9oL+vefyFZh?=
 =?us-ascii?Q?qV7Ri7OUneXJoXjAhRBbIZ6FG8c3gPpYLg1Pfwp2ki2pG4ZXIsU3IUrBC2Ii?=
 =?us-ascii?Q?Q/c/hSFs59ieZYAwa/Ri+NNiuUEOB+qfsnYGigF/b4XP4Q6tPTS7y//3weCM?=
 =?us-ascii?Q?tYMBcYNatKqC+2fAv4TZlmK2IK5ZdcF/4RAv5CAH7dElR4xGl3ZhbLa6NJfD?=
 =?us-ascii?Q?K2W179j4Uskm9Ho25ks/tCqHsxgK+zPgE075WiWEsRlOttk3BWUlRpyifPJM?=
 =?us-ascii?Q?UjlRMANdBUwjqh23ygKeA2pIktiwiglKEQ95lIzOmzxpX5/JuGZANc/dRHTU?=
 =?us-ascii?Q?Q60bI8+BCyKNM4iTZlJl5jPS7oMvIBHVM31CKV96ogg9b3FPRkfV/LIxv5P4?=
 =?us-ascii?Q?l8Au8RmfOWzbarv4tYXF7r300o8j27BL4wjyeSibsoudTxUBh69ZmyDNwYvv?=
 =?us-ascii?Q?UeCRJud9h1Zp6WWlwFtT8GAOhrrpIFxI4ZahbLKetCg+zxJfWCUexksjRW0H?=
 =?us-ascii?Q?ooCxa+Cpq7T5MlYv1kDO4vkPf1cGas5BzyJZ5SbjWUZsWXLrqicyTbD9wk5L?=
 =?us-ascii?Q?DXz5gt2yoIOugONj12mpLST+CmhTRYOW9g6se5b8Ym7qqIzrEPbHTsWqqzWs?=
 =?us-ascii?Q?Ly+9XYw3XzuPAJnuKvJ1CmQu1f1rBpqY243jpvyobQydO9eEwlI50+0oLBti?=
 =?us-ascii?Q?eUVh11UWeWckty5r9/fdh6Gdc/A3ORDwVEuF+PuXgf4nbhSztcLv4Z5UWX7o?=
 =?us-ascii?Q?gSWvFkSMS3HdJTbwJaR9T4UBf0Kp7I2ZkVy9X1K5m3u7O8gBXMnr6USITlzP?=
 =?us-ascii?Q?XHLhftXGtjH3fGSmT8w1yquCATn10w8BQJPH9cDzWkwjlbPjbYZeLeg+sq2v?=
 =?us-ascii?Q?Ea/QYCAutZtykBRLH5W7kY6L/rVw7mUPIu43P0yr02vhhStx2frMYlGDQoJg?=
 =?us-ascii?Q?Qp/WesAGHPWRCCBNkjB39RVnyGD/XyU8SpDluh0wCriaoVQhmfsBW3SFCva7?=
 =?us-ascii?Q?sAGx7Npo3rGw7VMafa9Ev4wRKGnU7alz9eWWExiGdPW8TIM2YApo+SvQTF7W?=
 =?us-ascii?Q?HazQ/w5VBQ9tcYBwcwm8DxPfVKQg9/TXWckOrVJKak5DntHkRBKD1PpFQYN7?=
 =?us-ascii?Q?FqDTvOpzOFa5PX9NJWIWE9AOkgN7fTPVMGMVfotvAS794B2c/WbEktVejgR+?=
 =?us-ascii?Q?znNTrXUD0CSjwKlYivue/f9WuBI3W4kMSomDeA+udpAgxqVKXzqHeCQ9AOZJ?=
 =?us-ascii?Q?8beIDi1fJMU6dVqDYWf9RU/CPrmB6yFDRv6gGdSpnyIIPC7lbuQoCvAbGfpx?=
 =?us-ascii?Q?Yt8U7gBFrZLEeMv7FXpWSyUjc/jTV5u+29ZpnhDTbyH3nUIM?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618981747B3E856C580BE876C4A42DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	cjPBZywJbRGYQHNqG7E+UGnx1S2UQ3U/u6fY/pz5AD3RzMyGfxdsTJaQ+7CYcKOVTGYkDTXIw/jCkFeWHwmF2uTBzlNAFIoDVDSJrWCyDDwb70O53jBYEedq9j3AzHNt4OMOAMR6Mcn1nVdZh37pkQpyqjW0Hof9hlUq4sqCosbkJSTDwcSj/FDSHZD+KJsBheJH7ZhPFtTzUVCwLPC4YaTEeEWma+jNGg1KZxaMF07H/fmUd8st5xO5WqTVSUN7jyZMmunKUtczryipdTrVwvYG1WLTdcT4wZgQTo23qDXucP4Ip4ZX5GnwZalBIXPohfanhDz/TCOEymnifcK2Jw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca295ec0-90b8-4927-3af8-08defe947310
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 08:24:27.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXMyrc41Vu370R7c7FpUHLyZURMB3SyZckOIANLUkWGTm5r4ZSLo6KugB4c6QgxTCL7yLl9QjcbDeI3AgaKy7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 08:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129381

--_000_DM4PR11MB618981747B3E856C580BE876C4A42DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.
Regards,
Deepak
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Deepak Rathore via lists.openembedded.org <de=
eratho=3Dcisco.com@lists.openembedded.org>
Sent: Wednesday, August 19, 2026 4:49 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [meta-oe][wrynose][PATCH] redis: avoid LTO for clang builds

From: Himanshu Jadon <hjadon@cisco.com>

In Redis 8.0.x, the build system adds -flto by itself when clang is
used with the default optimization setting. In OE clang builds, the
final link still goes through the cross binutils linker path. That path
does not stage LLVMgold.so, so redis-benchmark link fails with:

  x86_64-oe-linux-ld: ../lib/LLVMgold.so: error loading plugin

The failure is not seen with gcc because Redis does not add clang LTO in
that path. Also, changing OPTIMIZATION from the recipe is not a good fit
because it replaces Redis defaults and drops -fno-omit-frame-pointer.

Use Redis documented OPT variable only for clang builds. This avoids
the clang LTO path and keeps the frame-pointer flag. The gcc/default
build is left unchanged.

This local workaround can be removed later if LLVMgold/binutils-plugin
support is available in the toolchain path used by clang LTO builds.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-oe/recipes-extended/redis/redis_8.0.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipe=
s-extended/redis/redis_8.0.6.bb
index f6866747eb..fe31033328 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -40,6 +40,10 @@ PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'systemd', d)}"
 PACKAGECONFIG[systemd] =3D "USE_SYSTEMD=3Dyes,USE_SYSTEMD=3Dno,systemd"

 EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
+# Redis adds -flto automatically to OPTIMIZATION when clang is used.
+# Pass OPT instead, which is the documented way to provide explicit flags
+# without Redis adding its own optimization defaults.
+EXTRA_OEMAKE:append:toolchain-clang =3D " OPT=3D'-fno-omit-frame-pointer'"

 TARGET_LDFLAGS:append =3D " ${DEBUG_PREFIX_MAP}"

--
2.35.6


--_000_DM4PR11MB618981747B3E856C580BE876C4A42DM4PR11MB6189namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Team,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Deepak Rathore via lists.openembedded.org
 &lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, August 19, 2026 4:49 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [meta-oe][wrynose][PATCH] redis: avoid LTO for clang b=
uilds</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
<br>
In Redis 8.0.x, the build system adds -flto by itself when clang is<br>
used with the default optimization setting. In OE clang builds, the<br>
final link still goes through the cross binutils linker path. That path<br>
does not stage LLVMgold.so, so redis-benchmark link fails with:<br>
<br>
&nbsp; x86_64-oe-linux-ld: ../lib/LLVMgold.so: error loading plugin<br>
<br>
The failure is not seen with gcc because Redis does not add clang LTO in<br=
>
that path. Also, changing OPTIMIZATION from the recipe is not a good fit<br=
>
because it replaces Redis defaults and drops -fno-omit-frame-pointer.<br>
<br>
Use Redis documented OPT variable only for clang builds. This avoids<br>
the clang LTO path and keeps the frame-pointer flag. The gcc/default<br>
build is left unchanged.<br>
<br>
This local workaround can be removed later if LLVMgold/binutils-plugin<br>
support is available in the toolchain path used by clang LTO builds.<br>
<br>
Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-extended/redis/redis_8.0.6.bb | 4 ++++<br>
&nbsp;1 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipe=
s-extended/redis/redis_8.0.6.bb<br>
index f6866747eb..fe31033328 100644<br>
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb<br>
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb<br>
@@ -40,6 +40,10 @@ PACKAGECONFIG =3D &quot;${@bb.utils.filter('DISTRO_FEATU=
RES', 'systemd', d)}&quot;<br>
&nbsp;PACKAGECONFIG[systemd] =3D &quot;USE_SYSTEMD=3Dyes,USE_SYSTEMD=3Dno,s=
ystemd&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OEMAKE +=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<br>
+# Redis adds -flto automatically to OPTIMIZATION when clang is used.<br>
+# Pass OPT instead, which is the documented way to provide explicit flags<=
br>
+# without Redis adding its own optimization defaults.<br>
+EXTRA_OEMAKE:append:toolchain-clang =3D &quot; OPT=3D'-fno-omit-frame-poin=
ter'&quot;<br>
&nbsp;<br>
&nbsp;TARGET_LDFLAGS:append =3D &quot; ${DEBUG_PREFIX_MAP}&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB618981747B3E856C580BE876C4A42DM4PR11MB6189namp_--

