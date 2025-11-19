Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3682CF318B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:42:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3826.1763548924819653462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qzYoZllw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qzYoZllw;
 spf=temperror, err=temporary DNS error (domain: arm.com, ip: 52.101.70.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iDnMXPnlja7x1WE5FMOU64oPCkWtmpGyej2GHD3AQ9boZyd/RDG7qB56wE6jA63O5sb38xlBgkTMLzwVjKlyVXMmUb1cPZkQVJMp2Jt+A+DDnGBOL1RUl6iPZXE/inhusPtHnPv3tvWia0qcAcuRyBehqYJCUFqHBU1nahjx9MRE6qFIf1D0HF63xj2vqlSuqdiFH3VTKDVG2yfZl6YRBK5k44IkK7ZLLoaM/JUIRLUqw8wRQC8wFO7SxOCu4dl03qPlBFRG2y7Viy1+gaP53fh1X2xMTQpwfPJNW0JM9TuOOv4GUoyJ8EDew2kqJS+PeL9sEhubB80V8jw5WzEjjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOz9yICPTet+iOJwrM7ADw+fqd3zF/oWIoZon16W0WY=;
 b=RqlAqIxmVUx9oj6H6wtW7/Vj24KM+J54Tp/Gi5rRGXAL+/NTEbXRscBIqPZUE2ck68jWsyOia8b5s740dFFe4/7uDn33cASHtqnFRkHAlvALAhV0r9aEMM3cZW8za+fJN/6HzsxB+xQe2xKN9A77ESM7oAfQ0Nd8pFcwoKOXnZSQGW7/PtBHFpmcGbBfJ/WSlax9hn0qA3mroQn2Hw04dypdEm/uJVtrPMmPAbOBdwXIvQrMPNVpY7cYlLjswrQuhJghcBLwdHhWOQF3KsvhUqW3kOkLdjtNL1yA9zlraHHCnrtIpJJ6NKF7u7H/Pe5EOnKjdLFXVZkWvWFKRoGt2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOz9yICPTet+iOJwrM7ADw+fqd3zF/oWIoZon16W0WY=;
 b=qzYoZllwlM+akG2bSVLSO3yhgAFTSMIX+FVsZFEK0aAT/z77psTwckD9yFh0zqSYhZ2DsKHqo9DpndrCY/aAfvOy4x6RFhdKVf0vhemz4MLjGclGoYb/eOy6t0n+Ydx72P9lu+0PLcnfLA9CohNqvw0qv2/uNn4PPWKtDxL3y24=
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by PA4PR08MB6174.eurprd08.prod.outlook.com
 (2603:10a6:102:e6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:41:57 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::f8) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 10:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Wed, 19 Nov 2025 10:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnWAtRh4tKwBN+2+drznVOOaNBnxJbcJweRqipqy+28IdFoQiLUBkXk47AsP/5ZtUEuxllsjZkUSTSydwsLQsEJbiC1f7abhwrNLe0MvQEFGktWXpGIkytW4mJJKutQWcsFFPg+VgTrSgff3n3+HATsRhaKaOvU7Wv1nUMHwASCPWzwimZ8Z9YGV5imF/0Twh6J/X8HdPmNZzBlR/0YCGoclzxNNIyVxOe5xs5sdLhNscQBB62tPS5DJqAhnFGChVq5dSpfym1QZdmU/JCBNtmD370YQlyPRxERSdcKHOmjwzQAdSfVEO3788vOul+fKDfBcjYyR0afO/dRsfSGx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOz9yICPTet+iOJwrM7ADw+fqd3zF/oWIoZon16W0WY=;
 b=ZIgXHB9mFXExg39wG7FD9et8kapn1o/1oM1VzNlZRQ7ncR3/rvWHwgew8xKAO6aZ7zSTybOahylZrJEGl/4UIMgKpZtWg9ek0G32/FWSb5uyaby+fakhN0j85pBViY3HOxdmgmQcQLXJUa5QVNabeUtR4RVi8szkTciiC5mdpPyYK6xS9pakCQBTzKF/e3ET2KVP+I0LAWwaU/5+Hi74Xs63jz6wcl/lp75gyEVEr0fBzA8s1csElkafKb+Jt4NPT8weZRdmOi9e7G739d3PenjYgAip1Z5WjLOsv9r+++oGCrMr61hvugg6+vZVFboZW5F+vz0SrQXkOTBX56RgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOz9yICPTet+iOJwrM7ADw+fqd3zF/oWIoZon16W0WY=;
 b=qzYoZllwlM+akG2bSVLSO3yhgAFTSMIX+FVsZFEK0aAT/z77psTwckD9yFh0zqSYhZ2DsKHqo9DpndrCY/aAfvOy4x6RFhdKVf0vhemz4MLjGclGoYb/eOy6t0n+Ydx72P9lu+0PLcnfLA9CohNqvw0qv2/uNn4PPWKtDxL3y24=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:41:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:41:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][ 1/3] gtksourceview4: Adjust for setting S in
 gnomebase.bbclass
Thread-Topic: [meta-gnome][ 1/3] gtksourceview4: Adjust for setting S in
 gnomebase.bbclass
Thread-Index: AQHcWQ8cokb/mSIfqEO77p4GAWb367T5z+0A
Date: Wed, 19 Nov 2025 10:41:23 +0000
Message-ID: <2C0908CC-B83A-412E-AD6C-528B88BD542A@arm.com>
References: <20251119044347.2884483-1-raj.khem@gmail.com>
In-Reply-To: <20251119044347.2884483-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6147:EE_|DB5PEPF00014B93:EE_|PA4PR08MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dff357-f28b-4890-982e-08de27584309
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Lf3+jtw2joVNjZysOYKl55RztJ8m9ANfp2MwcHpD9el3fbI4+NhMcTP2WQ1k?=
 =?us-ascii?Q?A1NTvFnLGjpqd9xyK/M0fA9SRgOpPMxDdHcVwEcE+5geTWeCeztBfBNirQGN?=
 =?us-ascii?Q?jI97C2O9nlEyoPh/ba0DAzPbOxCJ4lGPk0mhR0dacXTxtfb7LImPmcjd5mNH?=
 =?us-ascii?Q?0BczScRTB0re6mhls+wRy1YoQ9/bV4XyJWmRWc/IkFDUa/5KCFoB1KeS9qlh?=
 =?us-ascii?Q?QPPmDQ08lhsRRhpn6Ik/nnL9Ov4/CqmyYZrgd/rcK+3vSF8eybMsdU0c6jsI?=
 =?us-ascii?Q?zXd5qiJ5CMPG52gQO32Wu5GVthdHXazQ73b5iyF1dv5ZIndqfxoUo7KDmjRa?=
 =?us-ascii?Q?pYP40SNsiXQ6JfECsR0CbcQoaWjmsIXlKo5TikGwKAEF5Qn7YpqpR9rUcdZ/?=
 =?us-ascii?Q?5v2rSMDKY+uE6PSyHeeVx7CKccVttIxrklz80VwM3xxfuQ5q7R4SHHsFKiAE?=
 =?us-ascii?Q?WxWeW/V5fhxuAdzqahXM3FyIJWHAQqew3jWmeL/TfjFacs+xe1vIBqqQh+X7?=
 =?us-ascii?Q?xYd8gpdFPAoQhSc+e6CAtpwD/ixdXUV5gb1FQg6GuFMO5z34ciFoQvOo2zfi?=
 =?us-ascii?Q?TSX31K+M3hgXKCTPcK4Qk06wCeD+hFXW4GHfGWCLGyIjiL2VHYpQfT8EOJB4?=
 =?us-ascii?Q?PivsnBlDyOuW5Q+RCqswyWlO5dF4fQ9hhfAxnG7pl61P34zk683WIfpBjnr0?=
 =?us-ascii?Q?mYe/ma20hV6YWv6nrLU69ZgTP7/RYGLv0ACx8rEHinq9reHUtCCqBoYORDWb?=
 =?us-ascii?Q?zQZtqVcVtLnJIZG842LKi7N+zOo50vewnQFdzt1TWuQLfLVGiwvcyEX1mJmi?=
 =?us-ascii?Q?yUbqveW02zccbTIYCi/D0XqpA1OzKrjGAXeYG4MONHyul4CjxPL9dPjZiKeJ?=
 =?us-ascii?Q?43QKcY/zMpwaF8qZhVysrSQKqELQ0jFpwOhfhuPZIDOcMo/3ZkCs7ckAKggR?=
 =?us-ascii?Q?1fPf1NEfmWAj+BpYCKgeJymbn+nHCHJwXJTo7F0G/QAxl1a6yS1MOY/lZySh?=
 =?us-ascii?Q?2GnSMTKwUMoOkM42qDoolamHSy5J0BQ94mDXcM+VzroCPJPffiX+LGDT/1Kd?=
 =?us-ascii?Q?EfNFioEj7Zkt7R5OdhQY4Mr8hKUcoQovIVlchOzncKXuQ61JxJWeLn960e3v?=
 =?us-ascii?Q?MBk1mQm8e8s7Viq7P30WI+mDQykW9kpOKPrZRwhwh+/mJadLGD4Izcau4Fhj?=
 =?us-ascii?Q?jmyenBSwQ5hQpkRJvd7xRUiSe2fR/6ALcCag6D5vcVGFP71k5hd3AGC9pFHW?=
 =?us-ascii?Q?TnYJKOzITlZP05DcfBVjrkmvQbeuiwnVIAy5WxaIVX9F67SFTjrpPYqrVloy?=
 =?us-ascii?Q?c9xsqsyNlrKJbUwG5m/uHsjxb7oE5nqLXuqVk/vnLD3P6xBikebv8fj4h9EP?=
 =?us-ascii?Q?/T2Z1bhJycIOzlEEJsqYWSsg4LuOHAeHKpX3kQa0df5BTFrGgidusfFP6f+A?=
 =?us-ascii?Q?Ask1MwAJVontU/fOqVa5wEjT2Po/skq8f4GYVSzoNEVZp95XZ4TbO6CpeAhT?=
 =?us-ascii?Q?xGOvJVDMMr+6xlnCzJSxqJv1kuO2u9IedfRL?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6DA189C5CB643479B35DE7E71AFFC5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7ff457a-9070-412b-3ad8-08de27582f25
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|376014|82310400026|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sjm+nHcqywTy1Li6AmpobWIchEvis0bet9+jw8jlOhwUIG/KcUEPtOBFR09Z?=
 =?us-ascii?Q?vCXwfTai1zk1Ts6iZwKULqE8KM3HtWW3g6PCPwhq3IqhER8rMGqEFh9nScpN?=
 =?us-ascii?Q?TxRHyahWdW9rjP9l3RYmcL9FtcY/t7lGA8ZJD5oXga+fouXM+abqtrMZlYGw?=
 =?us-ascii?Q?Pxc+S4wSocFozr7tTIMHEH93QhpbzQuZ4HAm4u8iVIq/b0VN4/G2VSlyKZMk?=
 =?us-ascii?Q?TbuHCpLtckga4XNtBv4iI3cE2BpMLjZw6NoS73xMB0DMyU3Rvwe5i5I3CXCA?=
 =?us-ascii?Q?kWpacNWajGKBwR35EIhmM0PMY6cvpx9/RloGP2bk4D3dSTihmG8HFlgGOnle?=
 =?us-ascii?Q?/wTgBHpO5QnFcQB4b6VOlB0EIJmZoUsL59wY5ZMDbv2Z/jU3MsJvMLmGhM+o?=
 =?us-ascii?Q?MzGTnXIG9+It8izkZHLMkOCIgIJ7DxGKj6dBWZZ40AVWFcEfL3wgOcQh2gRG?=
 =?us-ascii?Q?ppfm355nC7zaNrxCuCmT8sOqaZ0xXQzV8+r+F+GQreRN0dUO+L+7gZiTawtk?=
 =?us-ascii?Q?VCsI9NBZTNyCacjGU2XJsWbTYWPz+N3bDofHH9reXXMgwe09Yj42KjP6IS+H?=
 =?us-ascii?Q?EGxQF4qNeZO7n/9UuJg866WBRGMYBoRQGom2oIlhAPcj8Kw9fVpj93k456Lx?=
 =?us-ascii?Q?AcupQUS7Tfx7TcV8VXz7sENYQRvKG8Y2QIVcHWhc5LQaoeftNqJAHR+fJdmg?=
 =?us-ascii?Q?Cae99FU/hwigpEC3yXMVoLOmjpdW3r+MwtRmmpXfvuxNTn0jN6Py3l6KAZQF?=
 =?us-ascii?Q?mqe0X0IAYxy7HSAJi9A66rwTRT5YvkmWBaV9jNMlv5fQFrXnnU1m0HHmzs8a?=
 =?us-ascii?Q?SG3WdAzN6t05iTxk1qtv8v9JGi6kXHM+ee15Hfp9G5py0kHy8uDHT2cTEGvo?=
 =?us-ascii?Q?9Q79zAGSeOdHmKr2sdOoOieJcdNlVRzVYkzQ9wuJT1GklgaPCRplVsywJi/e?=
 =?us-ascii?Q?4Qakphw+kT0HLCpCLnILpqtadwtoBsVkmAU94tCkfjrZTQ71PhSavMn8PA4Y?=
 =?us-ascii?Q?3JSyF7fvmn/g8IqQEv8kfp4PGBFi7fkRsh1rAgmVQS9WfbO/ybk+SJxg8AhS?=
 =?us-ascii?Q?BjK12FwdVkN7zWxBtgcL8vWVQwNwqFqZk6CqJVxWTAuVGkpjr1Q/vY/dl/Sg?=
 =?us-ascii?Q?jJXIaw3ydIdqu1W+C5Goy7GiySu1goTzcmyUll0H/S1Oh9YbtYvJQaOpW+JT?=
 =?us-ascii?Q?Sdoc0g4qJnHTFxptNeGmCZFhtkjZ46d062LCs1zfy5LAQWvjUqVmHFM2RLEG?=
 =?us-ascii?Q?6p6niVyyiYpIMlB6IviTpNo2mfeowCkAS2+c1sPzkBVbRqYueNEbBOSDfgNT?=
 =?us-ascii?Q?J2ukOB7hTp05HNc4/W38XzkQ2mJ6OrxRfrO4Y1EF2ZOffr4b5SqO0k+JubZH?=
 =?us-ascii?Q?2wO/xSLA3PGRv7eDiNOzDhft+GSp61uQUmuksluhCZ1COQl5LrBrWHGwU83B?=
 =?us-ascii?Q?kqoK/Ju020LdCVSl6BBLrWoYHSAMvJERK7dNF37mlds8LH+IlSmyMlomJn//?=
 =?us-ascii?Q?/h/GNuZxrbDybq6k05z33UO/+oLkRczJCSeeTN+MSTi3lLm9sum0kBVF8SCj?=
 =?us-ascii?Q?JoO/lZLLwr6eKQxVMZE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(82310400026)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:41:56.8005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dff357-f28b-4890-982e-08de27584309
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121890

On 19 Nov 2025, at 04:43, Khem Raj <raj.khem@gmail.com> wrote:
> -SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
> +SRC_URI =3D "${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_version("${P=
V}", 2)}/${GNOMEBN}-${PV}.tar.xz \
>            file://0001-remove-pointless-check.patch"
> SRC_URI[sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fb=
abbb5958420a87d"

You can change the SRC_URI to be just +=3D the patch, as gnomebase has a de=
fault SRC_URI too.

Ross=

