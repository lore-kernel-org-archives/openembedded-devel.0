Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866B1D262B2
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:23:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12331.1769004033380535640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 06:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=KL6L5o6H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=2481adb8b2=andreas.schulz2@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L2fN3K2632079
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 13:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S-DKIM-20210427; bh=AP+yoGqTyd686TN2
	C0jNUy1WehK7nPelJlyWfdCzpC0=; b=KL6L5o6Hv8Q53o5ZPlXO/hwKPSJa/dtV
	Y68xERY4G8TbTMIAIM2rAYpxDF3+pkeZRzSNjeOi/5wyrySX7UKDnx3EFIfofWWG
	Et9DbcYHRUPr45g5FDjSPuNdzo2kj/+1VkhqMHbcAr8AvFCi7lnVm1+y8PSz169w
	F7lYnGs7/LoaAFv4K06RQnGSe2GIwIhe1DuFITXWNcOtQhVWobWk/VsZ5h6n/FYJ
	tj57KC82ldKvHLzI3NI1LVqCe0WkRPAS6AJpQTuqWF3n5+t5QGvhgZ0QW7bSlcL+
	2TMokT1J2wZxa2/5psdJQ7cN9LtVMldMuZ2Inqkuo7g6Zsz+DBs15A==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4btgfctnrt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 13:39:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujMpbgnHhkX+JFV1OWb8e7LahkYCGHFlFjAMdwm1AVbTjY9RntDOTSlLObTKXp1WGjXahYl1xxD7tYAMEhLo8FcRclAG2mHcfmbLLeVIM62zAY9RexGWzm0Rnqd8HTDUjfeb3Bf8Nyien4jbjhOSq0Rm4jVJ4m+TKzdfhfS4shftBMM6gmzr2XyLr5xVsR4JHxiaPSvb3Ily3cKJEaCfpnyenvsbJ5f+fbdMcKO8Vf/Iv7gFR9y65q7VX5zLZXIewpcCwib0Vc+P7zOQytyS3Sz66eN/dZyH0s/wQeTCgzHtvxaaXIMkrFFa1jCFotD2YPwVSMrsfCpjlcQlbwoV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP+yoGqTyd686TN2C0jNUy1WehK7nPelJlyWfdCzpC0=;
 b=c+4v52u419JtebjaKYBrh9UHTtPwtT9hY+Weo/78OHXPGp82lKYjQAYExgjUPDCkAvZRtVnybDOPdAPcwm0wDyl7fjjCNxZY6r6cNk8NZalHjWYSvW17IZgffskiQ/mBE9Gh5pVQUxk33mfQOf4UN3pUVkO3fXmf0+CfuQOAgVZGBZkxFvDf7PTlUbMOTrl8WrOekGCK3dgVXgCffOLw0hAwZDq6eMdItbg/ww7R5+YvtvIT+nIw3X4jxEr7DIhAt1lcEAfRqxjR8zFvjSrHWN9LfGZSEyhXvH9nWxoaIQUJdnYFgW/UqXbKuvTbYq7xBGOSSGniTNluQJIHt1ICCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from GVXPR01MB10499.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:14b::15) by AM8PR01MB7996.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:36f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:39:13 +0000
Received: from GVXPR01MB10499.eurprd01.prod.exchangelabs.com
 ([fe80::6dc4:c163:6d50:ab0d]) by
 GVXPR01MB10499.eurprd01.prod.exchangelabs.com ([fe80::6dc4:c163:6d50:ab0d%4])
 with mapi id 15.20.9520.005; Wed, 21 Jan 2026 13:39:13 +0000
From: "Schulz, Andreas - Enabler & Imaging Software"
	<Andreas.Schulz2@karlstorz.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] chrony: Ensure /var/lib/chrony belongs to correct user/group
Thread-Topic: [meta-networking][PATCH] chrony: Ensure /var/lib/chrony belongs
 to correct user/group
Thread-Index: AQHcitaDCZ+JYSdhpUiDxv8g7JVNMQ==
Date: Wed, 21 Jan 2026 13:39:12 +0000
Message-ID: 
 <GVXPR01MB10499B15E6F189486ADB3D348A896A@GVXPR01MB10499.eurprd01.prod.exchangelabs.com>
Accept-Language: de-CH, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
received-spf: Fail (protection.outlook.com: domain of karlstorz.com does not
 designate 62.134.76.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=62.134.76.232; helo=autodiscover.karlstorz.com;
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
x-ms-traffictypediagnostic: GVXPR01MB10499:EE_|AM8PR01MB7996:EE_
x-ms-office365-filtering-correlation-id: 846ce8cf-7b78-4011-fef1-08de58f2769d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?akWOMcl5FopakIIgDNk2SCvMJqg249u6hPS15YBj61M56YXWsX/HZ8tENuJG?=
 =?us-ascii?Q?DlkjGq2yNnWuuhjFojAYUN0u1L226X/KA7ARiFLs3gA0pYYWoIuKLbBrHwYu?=
 =?us-ascii?Q?sGd7wKUOEv+fiaXiYkQoV8d4z7HmPKhFtfl92R/8SU52ruK/sYN+eZQ7mQAl?=
 =?us-ascii?Q?lKigz7yaCy310h77XjcGXSeKHqURcJ+VmBC4IpHprafdyRqmWs9U+5GyrSJk?=
 =?us-ascii?Q?lWwYkg3jJ3d3nO4DBx46kLREJHkeLKYmANkrhrU+6YUNoL3GSZwp1YThpGIS?=
 =?us-ascii?Q?S22eLlLcb0u/3fLlB4379Y0lrk82681yhmeU6XWpdHellWvCos+Vrnm+gP8m?=
 =?us-ascii?Q?gZC5uxQL27sSpW01481H0H8Tr4LSmLW6mxKnGaU+xLeSSh9nPMUoZGor71b3?=
 =?us-ascii?Q?qvW7nLo13yI1v0EoZkbl376sEPxKHdpm5IL6FPco75y8Cmv7gtA58EsrqxLi?=
 =?us-ascii?Q?IT5pIHmTThkosssysJiOgTMe73x/CiDYyDiZv6aWoOoTxSRs0z2L4dV/B8F2?=
 =?us-ascii?Q?XFspa9ECwKBM34svilK42rUWe1lwS0gz1oF4HEMS+V7w78oedO54v9+71N+u?=
 =?us-ascii?Q?7MKCGq+EEsu1zbFL7uwn3immCBME/U5ZAmkSfXg6f5uSbAO/2xmjt6IpMPH8?=
 =?us-ascii?Q?k6dUyoJ7RtCIlvTEWvBMj/CKZolGUOCJBspS2p1+HFYSeLhWBqVcBDg4DavD?=
 =?us-ascii?Q?6ZRXhTZ4CJqLKhThbLNw6O5Gpt7VNyWQ7nSo1N3yvXrQXz+vcLpcq+2fbfiU?=
 =?us-ascii?Q?9xeuPO+4QtEi7m9BMUl1sbeK47LJqByF2oodUNSbyIfQ48oOzeul+Jd3S1XK?=
 =?us-ascii?Q?XVTXm0f6rlUhz6knnitxwuQDKicJpYcu+9fM1AH0anz+Rwpg/iOuT9RNKllo?=
 =?us-ascii?Q?V4/eGxelXAjH8AAp33viZNHzqq1My64+SxDGHMBKE7KPtWT+RCIrnCf6Qms2?=
 =?us-ascii?Q?VOj59WWiC3RCQfs9lBbgWG7b8GxALhreNp1hj6BGgjlD3eRUl2wFdXKcb80G?=
 =?us-ascii?Q?OggTwuCHCctpxjWRIdXta7An42z0Ooag5QZkM8BIbVV4u6d45zczQ6i9Yp/x?=
 =?us-ascii?Q?F9AaNndokXLAFQ1Nu6I+pRsWT3lX3V1Zxj1fRSKsz488X/A5fYqI5wAPBpau?=
 =?us-ascii?Q?e7d6O7rT/NzK/hiucoPOmH0yzKduhC8HMZc76IkF1w6WxtYtJMKrFyjEY98m?=
 =?us-ascii?Q?uno8ANVGjLqpmOfsbUKyYQMhNYNjZv7Fa4fhucdo6tyX/MLTbw0fQgAmVo7c?=
 =?us-ascii?Q?yUoYJDuRhsPpmPGZJbdgXL8DmTs+53Xwc11bJu81SDyh9XsDxwNz3/nmXGT/?=
 =?us-ascii?Q?QYVn9j9X3j05ufkelXoBGoMW+1wE4PSPNJUz0yl0ZQeH2xY7hBFVC7chXUXt?=
 =?us-ascii?Q?Mc6FgLUfiX+OMm0sjy64XWtH48vuP9X1QjJ2eb3+YTBTmdzU0DXy/GnYN1NC?=
 =?us-ascii?Q?eb/+lUnmOkqG0UvhjBQj87t9Wv/eqeBzIm37cr+CUgAnK0pfwPANZhDzqZ3u?=
 =?us-ascii?Q?hx5eYB8VSQu2yPYwHQOQpAXUzqBRJV+wtYpEMhbWqeLX9QMdgev/udVWLaV6?=
 =?us-ascii?Q?DlxzmqhpsbjN/kY+rxg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR01MB10499.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3cWrK1/jfUuC28KFOy16WC0CUxBNvnNF0/rpr1dOSkS4jIZRlCctOa+bGtcP?=
 =?us-ascii?Q?S09RLmy8aLEP2SC6W5ebDptdSjZCAEKHeta2Age756LvWBuNSJH4EMuF8R/e?=
 =?us-ascii?Q?xMx24P7OK8pR1YF9tcaeu9bNk/sOzVtYRBCGU+JukHpF284YZbQCdrHPvQ12?=
 =?us-ascii?Q?xF1KcY1aNoGfro0yGhhnp88WW/sH0ZDcIut/2BuxF1cRs37EofGFu52fLX2X?=
 =?us-ascii?Q?YKl52rCxM6LR80pBH3trfViLRe2sVgygFfZiMBHwOeqV0Z1TAvVICj1OUzx9?=
 =?us-ascii?Q?xXmHMsOeefZzjKJt2m05lQsZM3uK+sMO2+uVSLyGpM1ngVDdVT9YmjqjjEQh?=
 =?us-ascii?Q?MzAJEF9YpavoFoI89qfjWAWQ2QncEj7QBussY9IPJGaGhldhd7jbZb/s/S/u?=
 =?us-ascii?Q?gvxATiMzg2Vouv8+jiGj7z56VlNT7zwDVNSPyNGXrLyyhOTgRArSNheoaAKV?=
 =?us-ascii?Q?KhtDB2eSdC287N9DEwPb8p8yQuV6eKyZx6Ngn3GobsTMtnWBR3DqEPYfVRg4?=
 =?us-ascii?Q?XhC4t5RhEb7iFWoxJrbT7CuxMc7U436b5pr87s6CMn/G/xtSxaSmy0J1v8oc?=
 =?us-ascii?Q?AI8zw2D9FAfaOJKEkZJHuc6SQIPdxH+kS8U8RV2Wzuj5ysZvictpnFvHlklc?=
 =?us-ascii?Q?97+FU1r7mWDUv+46uv4v6cHZb9SPjoarDvji3Tz5zfZfVPXXD2UoFrHzbXZE?=
 =?us-ascii?Q?kBB8TcmbBxjRfQDUPYH8JN1krvL/09uo/sCZ6IDrxW+qoZWSVgQN8PYoyiwZ?=
 =?us-ascii?Q?bECdTBBxzVvX7jTydePFyC3NP6Z0GUyFLRw7+TDBB3s9h+CwAC9it25GmrVj?=
 =?us-ascii?Q?D+Cx9t0/PaYFweyVNTc4PV3L7bh3cAAxgD5PnjHyT6rsY9PfK2q1x5q9DpxF?=
 =?us-ascii?Q?dPZmbDw9nyNkNSdv6aMTMue4BIbU38WqSaVTG1IYYFglZa7TUp/ISudfDJDR?=
 =?us-ascii?Q?L2DySy1ogaXxjPlWqmB6BGtPhDtjDNF81ogjkHLCAZtffBO1wYAWa+tj1Iln?=
 =?us-ascii?Q?D94V6jpzSgpMXaZxTBRCtc6byl96nI8YovhERFDLGOb2t3bZmOYd3RZCrUJt?=
 =?us-ascii?Q?aMpdO4IkBA4eaUypUGra3UuJx4IcsTyiF2hZ48EHTd1Xuq5zEEIKvrH7cpDr?=
 =?us-ascii?Q?7eqa7GZN3mGPz4dYeY752sg4wi5Qie5YS/TBvodjW3CVeFWLUJ7d6/GpHYX8?=
 =?us-ascii?Q?w1mPAjosp7keHB6Ng0p99voQurfZnemSlzqi0+EdOgwqSYs/Sp1LAEPOcgu1?=
 =?us-ascii?Q?97NwrvHZJFf7nsqus7tBClcjR98kCZAmgpCooKeiY1Q8Ub8XprkO19J4XeUz?=
 =?us-ascii?Q?U7CLJb5PQgHcADQ8F/8WFUCxhUIAJWJv+c8YX5FqQ3o1+K4QyuFYq0MkeASo?=
 =?us-ascii?Q?TVIqBErBFLwQKDA/x9eA5CqOVBzho0ziot9dBEl5sNSx0KbuIWzR+kcYoQOv?=
 =?us-ascii?Q?WEInjNF5LlKuO83MjKJ8rgvlxpYjqaEkGNJQAhyVczPqRJQctaFFnAPr8LBv?=
 =?us-ascii?Q?hpE5N+cywxGujXxVMzCjoWemphQddinVrhcBKuu5MhlLQvJJX0JWe7WO+8mC?=
 =?us-ascii?Q?wmNfmm8taOagWToWaAQr2MK0UFR6oDcfvvdnpg45puyMUyJ98+nyuEksTwDy?=
 =?us-ascii?Q?qeTwfmQjVc4jbTaeScMUz443OOTm5x68BMqAePqADgrWbz+92v6XGS0sRyNl?=
 =?us-ascii?Q?p5cke4NBp/MPWVlAZiZQkg/mQE4JeRPzcFHw7F69SS/yfNxPPdBVqefty0qH?=
 =?us-ascii?Q?48nt3fzD5w=3D=3D?=
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(425001)(930201)(20251009114)(140003);
X-Microsoft-Antispam-Message-Info: 
 QXtSCq3OC0yWjPrVZLh9UtQRSe8yAUUqwT3yZFEdMqAnJduHvNwiNYrl86BvLQxGADJvi5Ia07M2x3gAUe47/FXMJGh3nDcJbqAPGxbJY0by/oar0SN8nWhNYt9fQNLS2SPEnoCF5CACo3owvMIKNCRkRIdKf/nX+YLZefxsX7U6UVkG5hDjc7Y2fCutFJV3nGEeyVPA+hUdgvtbnktDsQS27mEkXvppKP6MrJgcDCAYpC/HX6USw2pcC4GmIX0miF5TI5HwWGh2/cSCMlu/bhL7CpxxlA6jucYVThKjdkFEoRTNYIfWYTQ00GiIfP2wo97of6LXMnKALUgWBjr4g7sOdZKe9weEVYdp2NMolmcQZQSnmq8M5oaGzLLAWq1kzT1UgApY/vn5VBlFXmfITPaNsA/4HuHx5+WQSSTs0j413YMolwTygEriilNBx61YBxazlPV+ZPOBRLY9G9PLOeg5gasJsnIgoLG+alE/W2Uf3ckkIBzt29hyK91XwWeXbpFFuTNAGPBLZOZt/y5EGoldBUjRWVZARhtNJyjDikA2qQfYd+uiWRmFHbqQfWVZCqna2/XWi5o9wYM3whnwnlYyd+KUFUWdxGw4cbGbjav0jm3u0Iyn4nWdZpEG7k/g7pmsSKQzYm2qvVubTS0bLy/CZSWksMLEx36rvq2140gObUhugyF426hDM0KZfrtPmuQSdU6qJzdUAys5+MatjG0bguB0QlVZpxqd+d0sxe9yCnCqAQ93JOPiz3IHKEoWHbb88BKttpXm3qJJSwegkk8FL7f1G59QX6hO1jJDz7i3C3Ws83yq4EewSreiqkEyQmYvy0d0znnWjMxF6QxQgg==
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TUT-EX01-PV.KSTG.corp
X-MS-Exchange-CrossTenant-Network-Message-Id: 846ce8cf-7b78-4011-fef1-08de58f2769d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 13:39:12.8230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIo3JLts5pEOa6n5iwC+yQ3RKyT+WrlCshOB3WSBoRd/EgJn59G1q4EV2xMuaja4gwFU41a89nRBezy+hFsdv8NkVUMF3hrtbcXAbC7fqlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7996
X-Proofpoint-ORIG-GUID: D3LNnM5UV9EKyLyHVcykjl3GdsfZuXx_
X-Proofpoint-GUID: D3LNnM5UV9EKyLyHVcykjl3GdsfZuXx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExNSBTYWx0ZWRfX/JFzTPdC0jpx
 tAGYGwOBfGa38xz4SgVAeF+E4sGJ9k9rospxowFT9rmQil8VNoGEIF7g34i41gOasN/NC6GcD5p
 exiFKEy/IbWAv07Z8tjeK+sVHE8oTfulgmjyOAn/MnPWo4sLwO6zDqjbvTQfrcKNreiwAvcxyBw
 2vPE6ec8oq0wq3f0PKLQGMRvCs1d2bvNKFCZKPHRueuIHJl+rTLH/CmDxjwpKLzEqk8v/FHBKuR
 /IKUlx4ppIQQNFwY9GishCMSK8qBnZ54sxxC7xIkdrBgFJl+HzjwOBW7CXNgdcgTX6+rPP1azCn
 iEVg8aHdA1b1I6Jt7lPp+tVT//jDsca9b2JYK7RpmR0cN+D9FpOfyCzutRPv/iS8ewe9MYlLxZZ
 wdMy9dTli5EZFTTHWtDFmbd7p2gUfcZYynV2oWlOjMKlIBGifHwETF7AChA2GpPtUBB0f+wpgZ8
 Zn8RzH5IIHvychyVhLw==
X-Authority-Analysis: v=2.4 cv=Hoh72kTS c=1 sm=1 tr=0 ts=6970d703 cx=c_pps
 a=cOaRrpwSYXeplg7wOblQjQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=n9SCklZpAAAA:8
 a=BMhvJGtFcce9JE7zYnkA:9 a=CjuIK1q_8ugA:10 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123722

Signed-off-by: Andreas Schulz <andreas.schulz2@karlstorz.com>
---
 .../recipes-support/chrony/chrony_4.8.bb            | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb b/meta-ne=
tworking/recipes-support/chrony/chrony_4.8.bb
index f50576c272..a7fc73e081 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
@@ -48,6 +48,7 @@ inherit update-rc.d systemd pkgconfig
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd',=
 '', d)}
 USERADD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '$=
{PN}', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'privdrop'=
, '--system -d / -M --shell /sbin/nologin chronyd;', '', d)}"
+GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'privdrop=
', '--system chronyd', '', d)}"
=20
 # Configuration options:
 # - Security-related:
@@ -113,10 +114,18 @@ do_install() {
=20
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d /var/lib/chrony 0755 root root -" > ${D}${sysconfdir}/tmpf=
iles.d/chronyd.conf
+        if ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'true', 'fals=
e', d)}; then
+            echo "d /var/lib/chrony 0755 chronyd chronyd -" > ${D}${syscon=
fdir}/tmpfiles.d/chronyd.conf
+        else
+            echo "d /var/lib/chrony 0755 root root -" > ${D}${sysconfdir}/=
tmpfiles.d/chronyd.conf
+        fi
     else
         install -d ${D}${sysconfdir}/default/volatiles
-        echo "d root root 0755 /var/lib/chrony none" > "${D}${sysconfdir}/=
default/volatiles/00_runtime_chrony_dirs"
+        if ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'true', 'fals=
e', d)}; then
+            echo "d chronyd chronyd 0755 /var/lib/chrony none" > "${D}${sy=
sconfdir}/default/volatiles/00_runtime_chrony_dirs"
+        else
+            echo "d root root 0755 /var/lib/chrony none" > "${D}${sysconfd=
ir}/default/volatiles/00_runtime_chrony_dirs"
+        fi
     fi
=20
 }
--=20
2.52.0


