Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3FCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:19:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6943.1758791976578553960
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 02:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gYUdCntT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1363c4b735=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4oRph3447135
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3BX22GT7NJJSdYb4F09yhj
	XjUI7x8lJpB5OlOs+7DYc=; b=gYUdCntTqxY8PrD1BKNBf2TlEEFxwSlN6mviO9
	PGQqvFVScBwfgrQ8cvErjTUoTMN8UNfBlbcIrroEgQnn3/ePwtaq49FIZIxfpVGu
	Uhzw0hA1iCwv/bC/rzy65xCHoyuQ5OELEe4uKoEQCjlBUyLl2H7TvRv64tn7VEkS
	7imW/V9TDI2SU3JCw48hA06WZy0SpGZYnWc8eJ12ycVMz1JLGvmT3pTf6FhfGhnf
	yGzJG/YNH0D6dxDO/B5e4ePJ3YHxNqCj6OIb+OL7MdrecEApXj8TjZql2v+TR4uo
	C0yubzKkyOaGtrA3YKm2ZYGItvnkn0mZ/6dXUGciCDyM646w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1p4gm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:19:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLY7SnJC1F58bICgwqMRW5yiX0uDhXzUg67zlOXeL7qMN3pJDR6MuOKXR0816rR19tK9PAlf2C/wBYLDbMmIbCo1/up4Zr5qwU4hDg/QwJ556Nyl9vSAS39Ufae65x7OKZ2LMio5PLRvIlQpQwqEY1h5wB+AKFI0PVpVEFO82lzyWG4hSZq5V3fiQNoBOZJzSKQARogpqc81FTZ21S4x4eZc0le3JBKLGAMsgorSGa7c4+Q8NR1HzQTyzXGI16m3MCwtYBU9zrrrplDJz9U5fmG7AXWxE0siUV8Lpsulmz3gpOB2bY52+rYSy80pmKIsy8YmuFh0dgV0ZKpD7FFh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BX22GT7NJJSdYb4F09yhjXjUI7x8lJpB5OlOs+7DYc=;
 b=yAlaRTwmJecwb7WpHuph3hTBq0nNRNkwZuxHdHjkqN48V54w0wnIUlwaQmNT/F05l3TFmQE20FD1EEtDLFhrD3DRkdrOvWJ9ySqYgVy8uu7ijP/Be6GH4bdaUzU+VVoj2kcNxmr0t/5lbw1NLJjx6zFAytPWFK+KV+fe+jYAhtO7DrZuul4H2u5W2azRcW9PPYPsZZy/VajN2hQbmI3YHZCyne7KL5p0ETidWMcuLSTOB0X7O5SgAI4iGkqxUnD1XLwaQLTWmnZ0qKinhbaRCWCesqSeEtCTgb3qrPoktourejHZYhN4dagwrBvk001yL5mMsOvb0uYzytWyhiElPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.21; Thu, 25 Sep 2025 09:19:33 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:19:33 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe] [PATCH 1/2] tcpreplay: fix CVE-2025-51006
Thread-Topic: [oe] [PATCH 1/2] tcpreplay: fix CVE-2025-51006
Thread-Index: AQHcLf1GWXMmmGKU2EWVcfV3vGQdGbSjnv5M
Date: Thu, 25 Sep 2025 09:19:33 +0000
Message-ID: 
 <DM8PR11MB57031B992265B85691B733D0841FA@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <18687BE00F0A3952.29753@lists.openembedded.org>
In-Reply-To: <18687BE00F0A3952.29753@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-25T09:17:44.175Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|DS0PR11MB7928:EE_
x-ms-office365-filtering-correlation-id: 6f027892-75d6-4bef-28e0-08ddfc14a3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+CtfRZrXsz29wHQIJ24SzoOcKt8w7EP0Is9ptqj8NVeugBMk12DB//wH1meM?=
 =?us-ascii?Q?Dd4sJP1EGhfpsLAtwAriIm+5xu4bGEK6GRW78s/EC1O2VJRdHaGPu3nc6BcC?=
 =?us-ascii?Q?wLmsfNqq+AdD8qY3fgMETpk1KEBhZDHgmJBvP0RQYdD8yuafnZR94Kx/J0iM?=
 =?us-ascii?Q?lfIfCpHxenEoxghWC51x2UObXt50fI8oKfiXKtGSG7RzaoMVpO3LV86gLH6O?=
 =?us-ascii?Q?xCO1jDKID5KgswxQ+MVU7gEfz+8kQWL/Zqyi16bILqKhKVuc08ykZtt5w4A6?=
 =?us-ascii?Q?3bWZsYbv0HW5xSYTsesQhkXnT9y03O6MdsNAfUUnCsI1OkD9BSK/sImqrnVS?=
 =?us-ascii?Q?RjIOlCxmgVdspW0KhmzfDHPAQ76j31glO1sDgbs+KmgoCSyNWPpmZzOzNsTE?=
 =?us-ascii?Q?avq/OBWFxfKQAKLZgeiDU+Nxqd0MB89YBrqoTE2tL6c1SJanqlQi9UC76jbe?=
 =?us-ascii?Q?OWQduXTKOHL4ett8KGO6QY2ee6DsgF8aQxkqdlEITLqXpWpxc95XYNULUIdH?=
 =?us-ascii?Q?vVomJ4a/LOKIWdiB+klefadwdNSmZremaXAXimQwJhOTb/SmFY10R1peaGgq?=
 =?us-ascii?Q?tgzkpA/4CVxFFI0cXon331fP8rT2jXoPZ6SM5QbgnMRR+E6GbbEWbgoUxYtB?=
 =?us-ascii?Q?xiysyMU/ir/a+X6OcBV1JW0gqwYuVEdoanEd0NMUW3ai/4dRqpewyP8RZucV?=
 =?us-ascii?Q?Xl4FwSyATxpao1ueiwkt4KpaUxFmpuevC+DQntRQInljy78Y4b6Kzb268arT?=
 =?us-ascii?Q?vupPtTyQxILOwiN/AqhUsXwj0d6Jt3jxz5D4jrveeatmpd8e8tcXBV1Yoq9j?=
 =?us-ascii?Q?hK/5Z7+1SarxmxwGAToHZKZYz8RanavIPQwvTMiVgjOSwd5Cp6Is708t2y3r?=
 =?us-ascii?Q?JnXlwjXymNg+CdyycR13fR/qSVoaOHjUxKY9m4OqIGTyvkx2qAlDcffjdzFO?=
 =?us-ascii?Q?grL1ID6b+euKpGYECm1FIZxlPgY0RB5pOjKzmWDm0wS/4TI826QC6CWKgd4p?=
 =?us-ascii?Q?YsuRL4YT10aBA6w5Ztx4l7kbLeQOM4Fc2yICbn6mfvvA/zBGaX+G4/C2+CdT?=
 =?us-ascii?Q?bHp1u/27JvTXy80xexshgaPa7rxWxtwD/8+xvM0GSkQpMBRAyVZm6gcQ2801?=
 =?us-ascii?Q?HWzxw9q3dS+4PHVOp7janHlwTK2M2oTAVrY/aG7KymB6lAoLXb6uQ4aokD19?=
 =?us-ascii?Q?2io2+Aax0PKZKOTYCdZOvBjPRM4yg6qaHRT2yrBZPj2XaBBVEo+NynyWkJoS?=
 =?us-ascii?Q?80fOvJ0xDsUzw+TaK2/cfvs3+GTOpY7NPJIXxGTRP3Img3dYpHkn3kqqrdrb?=
 =?us-ascii?Q?DI4AP8H703j2H2QxGI4bMP8pL4DiSyvdXNj+5pMNwUa/+EC5fRZCcWcuKtyb?=
 =?us-ascii?Q?vudyOdIMPSdqJM0A0hcgMubQYceWu+iWKF++uZf7cwgrchvQeqCLSaTyyx+d?=
 =?us-ascii?Q?Q5Ej6JlRrmhQo017c9X26mHgocCUJiiqGhNP72ONvXC7qw0DYaQPHQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vq7ppFhQ92C+nu1zsW/TXeWBHx+AYkzSVb8CbkLa9EPATB53x7/oAuwFqmSN?=
 =?us-ascii?Q?w5CaiqcVJjnQ3mOGgMVADEcbmoPGOh1zHkyDYDeo6ChIk0FR3/j75zITxSgd?=
 =?us-ascii?Q?ddd9EImQE+c0PyyFLNd7o16rRXy1f2QGb+qmwgn/EFAPZ1nsvlEAKRKiZ1sO?=
 =?us-ascii?Q?yoGaAuR6Ngf5wY2E5XECIM0e85DKWFMazXEPSbDoWnN0SDO3oeG68Qaxv0MB?=
 =?us-ascii?Q?Zn7cpxFN7D99+cnCwu91ALj2Wv2rJbWr4xJoHhM1b15uRmNg5K+t+DREwAyK?=
 =?us-ascii?Q?UgxPT8OM6QJQ7FpfZgGpYX/lV8jmWCe+w0BTgbCECl8TOQ5Qs7yg/E6N5PGH?=
 =?us-ascii?Q?1xyhmTQfkHhMzjxCST24rqSz3oSL7eBO1k52BCdnOXTV4svZJOAhanXQZAib?=
 =?us-ascii?Q?7a5uNV8zAWjjxOVdbj0s4wwuR3KaxFTGBHYRX7tzd9PkRpI85Va854X6LFIy?=
 =?us-ascii?Q?w52RwbSfrvni6IbQvVfszU+cFqN/mlfRid6QZav1xe55VDwuQKyU2doUJiLB?=
 =?us-ascii?Q?aRYffNpHGVgovZ17x3xCHanQGIZikvJJk/QvWJ+gl6nxJo+OHygQlcJID8kz?=
 =?us-ascii?Q?5Z7QgoNSjYnfYC3YM8/0Lx0ocjAmUdBKV2f+wPuTEm3YXehv/ul5dNWstvCH?=
 =?us-ascii?Q?7I1sUJ4i2urFZFbx0jIpFK8/joV+13OM067UaNJ0jKIohiDUBRHj4Fk7zBCF?=
 =?us-ascii?Q?GFxkMmm/WD3hx3XbmKqGFOuZGuzPNIVZce3DLhq9B1/zVp8QE0rfpjnIYe2Z?=
 =?us-ascii?Q?WXiseg1eZznRS/KC7nvdobfACEfZp9/kkxpvBIyDdGpSOZWFe7e9hUTknb7r?=
 =?us-ascii?Q?bH+mt52LzRzb3TG/x8/441mIqvmg/zQZ113JwYudgNo52MSm056KP9gXXaUn?=
 =?us-ascii?Q?fXHubcx2WX5nL+zEClZzn6Ul9flfNm4A/IY5x3RzRGv8FMNLK1SK8cENCjUy?=
 =?us-ascii?Q?47zd0Td37OXs+prbkUSAQ1usCTttQcSFIfuLDyvTXNyKtFvMZOAChaHtV2GP?=
 =?us-ascii?Q?QJMOuW8a9yE3jD0iAHpCNZoHb8SVpe4fZ38lcYP7878/BMkhVj+FIvPX4kdr?=
 =?us-ascii?Q?81yQ0oMIH2divxQbCujzLwSLN80jU63Efc5seBJSSWmv2SLmvX4DWxz4C/St?=
 =?us-ascii?Q?0CI69GrK0Dvt9uPaeiGwThMkmbb4oI2Wy2tQ5vnQWKQNBlfftohpWPTo7Gnn?=
 =?us-ascii?Q?aAYUmcWGmyhSfAGk3t/ZPu6sDcEVdLl6jiQyXOQc+6aaiHeZi1G+NgyxAAzY?=
 =?us-ascii?Q?WLH8Kibq6+RhRIrjstMsQsb1I/k1/5XJQ46PW5ZfA/gqQo15PRDVj2I9NeZv?=
 =?us-ascii?Q?QBQAuwYmw3rThcIfmD0QOwNtT/LF5FowFA/r85qUbZ3hE8aiBWk13zWLXrLv?=
 =?us-ascii?Q?353HA8fdhhaycJDFqIoCpJO/Twj4ZUqi7InTkm8rssXFdezuDu6BaGlJJaR3?=
 =?us-ascii?Q?6sE9lRzTthm2FZWM4j9iGwDiZLq7wYgV3jwKchZu7lrLNs0tDZTCxLRTn5Ax?=
 =?us-ascii?Q?oeeXIFNm8FMbrGNj2FAvLYCVnKC+7VCjGBDioZqEZi4uBj6ogePtJNqvY7+6?=
 =?us-ascii?Q?iGFNpxpUtrCTsm1rWnDUGUQWyiMbCRRZZ3DpFFuSrBHqtWg8UlwKYltlWatv?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB57031B992265B85691B733D0841FADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f027892-75d6-4bef-28e0-08ddfc14a3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 09:19:33.2320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQ63Z63RWlQr19XAbnGJmUH6GLnFXuHafJew22iwLGHOATDeiBKXL1MrXMOkgSp7QrS5Gpdu+M/rne/jeDVFdhB5lye3k5bBSKv5uJR/lglNzKgOG5qKhM0MX7CRSJem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
X-Proofpoint-GUID: oDnZfl9sIGInWDC8-atssJ614hzzwuAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA4OCBTYWx0ZWRfX/Mg5QV5ilRpI
 vEQzikU7Mz02gKKnfczyJ/+JigDKLYXOOCEa/vJf2zGuz2POwLNX9z8qKmjxfzL1mL1FMK1m8Lz
 evtYt5+0FsNWjE1bzMY6nBuC8I83i94xJybqTUBr4LhLr9D3A0ycP6vhS6bq1Ab/ZVUmQ395DB5
 JX6pDf8PLYSS7LYmTQ8VHjWtRRW+lDPP5dIB9RmERrc1AfwHzeRWe3FD6kGJgPn7A8OeXCh93y0
 QhMpkTdJ5WApUXYdlFBPXFQs5zPmWupk2elO+5Hg7zUis3CZqYrhwMB47hd4T1wR+lH49CCxPnA
 ju3FlEdCuw2p2zK7meGZXjQAFgfL5wyyPuFzsKFLrI8at1w2AXjQ+Mi8fx4mMk=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d50927 cx=c_pps
 a=M48x8qJemVpu2SzQJjJwbA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8
 a=7qX4Yb8m7rkgjjqMpFMA:9 a=CjuIK1q_8ugA:10 a=I3XimhyGDX6NAC05:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oDnZfl9sIGInWDC8-atssJ614hzzwuAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119857

--_000_DM8PR11MB57031B992265B85691B733D0841FADM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Thursday, September 25, 2025 14:47
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [PATCH 1/2] tcpreplay: fix CVE-2025-51006

From: Archana Polampalli <archana.polampalli@windriver.com>

Within tcpreplay's tcprewrite, a double free vulnerability has been identif=
ied
in the dlt_linuxsll2_cleanup() function in plugins/dlt_linuxsll2/linuxsll2.=
c.
This vulnerability is triggered when tcpedit_dlt_cleanup() indirectly invok=
es
the cleanup routine multiple times on the same memory region. By supplying =
a
specifically crafted pcap file to the tcprewrite binary, a local attacker c=
an
exploit this flaw to cause a Denial of Service (DoS) via memory corruption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-51006.patch  | 97 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE=
-2025-51006.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5=
1006.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5=
1006.patch
new file mode 100644
index 0000000000..a55ac8c314
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.pa=
tch
@@ -0,0 +1,97 @@
+From 868db118535a646a8a48c957f1e6367069be1aa7 Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Wed, 9 Jul 2025 21:01:12 -0700
+Subject: [PATCH] Bug #902 juniper: added safeguards Protect against invali=
d or
+ unsupported Juniper packets.
+
+Notes:
+
+- only Ethernet packets are currently supported
+- was unable to recreate the original bug, but areas where hardening was r=
equired
+
+CVE: CVE-2025-51006
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/868=
db118535a646a8a48c957f1e6367069be1aa7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../plugins/dlt_jnpr_ether/jnpr_ether.c       | 33 +++++++++++++++++--
+ .../plugins/dlt_jnpr_ether/jnpr_ether.h       |  2 ++
+ 2 files changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit=
/plugins/dlt_jnpr_ether/jnpr_ether.c
+index 9642a2c..671d5c0 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
+@@ -202,8 +202,12 @@ dlt_jnpr_ether_parse_opts(tcpeditdlt_t *ctx)
+ int
+ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pktlen=
)
+ {
++    int extensions_len =3D 0;
+     int jnpr_header_len =3D 0;
+     const u_char *ethernet =3D NULL;
++    const u_char *extension;
++    u_char dlt =3D 0;
++    u_char encapsulation =3D 0;
+     jnpr_ether_config_t *config;
+
+     assert(ctx);
+@@ -228,9 +232,10 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char=
 *packet, int pktlen)
+     }
+
+     /* then get the Juniper header length */
+-    memcpy(&jnpr_header_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
++    memcpy(&extensions_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
+
+-    jnpr_header_len =3D ntohs(jnpr_header_len) + JUNIPER_ETHER_HEADER_LEN=
;
++    extensions_len =3D ntohs(extensions_len);
++    jnpr_header_len =3D extensions_len + JUNIPER_ETHER_HEADER_LEN;
+
+     dbgx(1, "jnpr header len: %d", jnpr_header_len);
+     /* make sure the packet is big enough to find the Ethernet Header */
+@@ -245,6 +250,30 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char=
 *packet, int pktlen)
+     /* jump to the appropriate offset */
+     ethernet =3D packet + jnpr_header_len;
+
++    /* parse the extension header to ensure this is Ethernet - the only D=
LT we currently support */
++    extension =3D packet + JUNIPER_ETHER_HEADER_LEN;
++    while (extension  < ethernet - 2) {
++        u_char ext_len =3D extension[1];
++        if (extension[0] =3D=3D JUNIPER_ETHER_EXT_MEDIA_TYPE)
++            dlt =3D extension[2];
++        else if (extension[0] =3D=3D JUNIPER_ETHER_EXT_ENCAPSULATION)
++            encapsulation =3D extension[2];
++        if (dlt !=3D 0 && encapsulation !=3D 0)
++            break;
++        extension +=3D ext_len + 2;
++    }
++
++    if (extension > ethernet) {
++        tcpedit_seterr(ctx->tcpedit, "Extension to long! %d", extension -=
 ethernet);
++        return TCPEDIT_ERROR;
++    }
++
++    if (dlt !=3D DLT_EN10MB || encapsulation !=3D 14) {
++        tcpedit_setwarn(ctx->tcpedit, "packet DLT %d and extension type %=
d not supported",
++            dlt, extension);
++        return TCPEDIT_WARN;
++    }
++
+     /* let the en10mb plugin decode the rest */
+     if (tcpedit_dlt_decode(config->subctx, ethernet, (pktlen - jnpr_heade=
r_len)) =3D=3D TCPEDIT_ERROR)
+         return TCPEDIT_ERROR;
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h b/src/tcpedit=
/plugins/dlt_jnpr_ether/jnpr_ether.h
+index 4875350..90c12b4 100644
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
+@@ -33,6 +33,8 @@ extern "C" {
+ #define JUNIPER_ETHER_L2PRESENT 0x80
+ #define JUNIPER_ETHER_DIRECTION 0x01
+ #define JUNIPER_ETHER_EXTLEN_OFFSET 4
++#define JUNIPER_ETHER_EXT_MEDIA_TYPE 3
++#define JUNIPER_ETHER_EXT_ENCAPSULATION 6
+
+ int dlt_jnpr_ether_register(tcpeditdlt_t *ctx);
+ int dlt_jnpr_ether_init(tcpeditdlt_t *ctx);
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b=
/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index a784190868..04f3ee1c2d 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/appneta/${BPN}/releases/d=
ownload/v${PV}/${BP}.tar.
     file://CVE-2023-43279.patch \
     file://CVE-2024-22654-0001.patch \
     file://CVE-2024-22654-0002.patch \
+    file://CVE-2025-51006.patch \
 "

 SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb=
2785e37ad6d4bf"
--
2.40.0


--_000_DM8PR11MB57031B992265B85691B733D0841FADM8PR11MB5703namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Kindly ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, September 25, 2025 14:47<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [PATCH 1/2] tcpreplay: fix CVE-2025-51006</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
Within tcpreplay's tcprewrite, a double free vulnerability has been identif=
ied<br>
in the dlt_linuxsll2_cleanup() function in plugins/dlt_linuxsll2/linuxsll2.=
c.<br>
This vulnerability is triggered when tcpedit_dlt_cleanup() indirectly invok=
es<br>
the cleanup routine multiple times on the same memory region. By supplying =
a<br>
specifically crafted pcap file to the tcprewrite binary, a local attacker c=
an<br>
exploit this flaw to cause a Denial of Service (DoS) via memory corruption.=
<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../tcpreplay/tcpreplay/CVE-2025-51006.patch&nbsp; | 97 +++++++++++++=
++++++<br>
&nbsp;.../tcpreplay/tcpreplay_4.4.4.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 98 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-51006.patch<br>
<br>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5=
1006.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5=
1006.patch<br>
new file mode 100644<br>
index 0000000000..a55ac8c314<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.pa=
tch<br>
@@ -0,0 +1,97 @@<br>
+From 868db118535a646a8a48c957f1e6367069be1aa7 Mon Sep 17 00:00:00 2001<br>
+From: Fred Klassen &lt;fred.klassen@broadcom.com&gt;<br>
+Date: Wed, 9 Jul 2025 21:01:12 -0700<br>
+Subject: [PATCH] Bug #902 juniper: added safeguards Protect against invali=
d or<br>
+ unsupported Juniper packets.<br>
+<br>
+Notes:<br>
+<br>
+- only Ethernet packets are currently supported<br>
+- was unable to recreate the original bug, but areas where hardening was r=
equired<br>
+<br>
+CVE: CVE-2025-51006<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/appneta/tcpreplay=
/commit/868db118535a646a8a48c957f1e6367069be1aa7">https://github.com/appnet=
a/tcpreplay/commit/868db118535a646a8a48c957f1e6367069be1aa7</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ .../plugins/dlt_jnpr_ether/jnpr_ether.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 33 +++++++++++++++++--<br>
+ .../plugins/dlt_jnpr_ether/jnpr_ether.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp; 2 ++<br>
+ 2 files changed, 33 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit=
/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
+index 9642a2c..671d5c0 100644<br>
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
+@@ -202,8 +202,12 @@ dlt_jnpr_ether_parse_opts(tcpeditdlt_t *ctx)<br>
+ int<br>
+ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pktlen=
)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp; int extensions_len =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int jnpr_header_len =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const u_char *ethernet =3D NULL;<br>
++&nbsp;&nbsp;&nbsp; const u_char *extension;<br>
++&nbsp;&nbsp;&nbsp; u_char dlt =3D 0;<br>
++&nbsp;&nbsp;&nbsp; u_char encapsulation =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; jnpr_ether_config_t *config;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; assert(ctx);<br>
+@@ -228,9 +232,10 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char=
 *packet, int pktlen)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* then get the Juniper header length */<br>
+-&nbsp;&nbsp;&nbsp; memcpy(&amp;jnpr_header_len, &amp;packet[JUNIPER_ETHER=
_EXTLEN_OFFSET], 2);<br>
++&nbsp;&nbsp;&nbsp; memcpy(&amp;extensions_len, &amp;packet[JUNIPER_ETHER_=
EXTLEN_OFFSET], 2);<br>
+<br>
+-&nbsp;&nbsp;&nbsp; jnpr_header_len =3D ntohs(jnpr_header_len) + JUNIPER_E=
THER_HEADER_LEN;<br>
++&nbsp;&nbsp;&nbsp; extensions_len =3D ntohs(extensions_len);<br>
++&nbsp;&nbsp;&nbsp; jnpr_header_len =3D extensions_len + JUNIPER_ETHER_HEA=
DER_LEN;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; dbgx(1, &quot;jnpr header len: %d&quot;, jnpr_hea=
der_len);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* make sure the packet is big enough to find the=
 Ethernet Header */<br>
+@@ -245,6 +250,30 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char=
 *packet, int pktlen)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* jump to the appropriate offset */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; ethernet =3D packet + jnpr_header_len;<br>
+<br>
++&nbsp;&nbsp;&nbsp; /* parse the extension header to ensure this is Ethern=
et - the only DLT we currently support */<br>
++&nbsp;&nbsp;&nbsp; extension =3D packet + JUNIPER_ETHER_HEADER_LEN;<br>
++&nbsp;&nbsp;&nbsp; while (extension&nbsp; &lt; ethernet - 2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u_char ext_len =3D extension[1=
];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (extension[0] =3D=3D JUNIPE=
R_ETHER_EXT_MEDIA_TYPE)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlt =
=3D extension[2];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (extension[0] =3D=3D J=
UNIPER_ETHER_EXT_ENCAPSULATION)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encaps=
ulation =3D extension[2];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dlt !=3D 0 &amp;&amp; enca=
psulation !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extension +=3D ext_len + 2;<br=
>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (extension &gt; ethernet) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcpedit_seterr(ctx-&gt;tcpedit=
, &quot;Extension to long! %d&quot;, extension - ethernet);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TCPEDIT_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (dlt !=3D DLT_EN10MB || encapsulation !=3D 14) {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcpedit_setwarn(ctx-&gt;tcpedi=
t, &quot;packet DLT %d and extension type %d not supported&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlt, e=
xtension);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TCPEDIT_WARN;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* let the en10mb plugin decode the rest */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (tcpedit_dlt_decode(config-&gt;subctx, etherne=
t, (pktlen - jnpr_header_len)) =3D=3D TCPEDIT_ERROR)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TCPEDIT_ERROR;<br>
+diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h b/src/tcpedit=
/plugins/dlt_jnpr_ether/jnpr_ether.h<br>
+index 4875350..90c12b4 100644<br>
+--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h<br>
++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h<br>
+@@ -33,6 +33,8 @@ extern &quot;C&quot; {<br>
+ #define JUNIPER_ETHER_L2PRESENT 0x80<br>
+ #define JUNIPER_ETHER_DIRECTION 0x01<br>
+ #define JUNIPER_ETHER_EXTLEN_OFFSET 4<br>
++#define JUNIPER_ETHER_EXT_MEDIA_TYPE 3<br>
++#define JUNIPER_ETHER_EXT_ENCAPSULATION 6<br>
+<br>
+ int dlt_jnpr_ether_register(tcpeditdlt_t *ctx);<br>
+ int dlt_jnpr_ether_init(tcpeditdlt_t *ctx);<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b=
/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
index a784190868..04f3ee1c2d 100644<br>
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://github.com/app=
neta/${BPN}/releases/download/v${PV}/${BP}.tar.<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2023-43279.patch">file://CVE=
-2023-43279.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-22654-0001.patch">file:=
//CVE-2024-22654-0001.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-22654-0002.patch">file:=
//CVE-2024-22654-0002.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-51006.patch">file://CVE-2025=
-51006.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;44f18fb6d3470ecaf77a51b901a119dae16da5be=
4d4140ffbb2785e37ad6d4bf&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB57031B992265B85691B733D0841FADM8PR11MB5703namp_--

