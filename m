Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDC5EB3653
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 02:28:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9533.1772504896020409361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 18:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fm3nKQl0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7522b53711=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231dF2v3534667
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Mar 2026 18:28:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=oCU9tlLCrbVQsOFQMBeSNG8D/uVVSaKjFvNwt5QZSVE=; b=Fm3nKQl0QyNi
	dT/4g3HO1UXxIfYoN3fi7qQXt2SYW5fBG/QcN7upX1uQFfxRU020ZPPf9ABIVzoX
	FGzSLiqCDsZhpgSO1sNFCjEY/1hHFOhn9r6p4KXe/EvJJFgHx4dXk+4gsNoQliJ8
	hT8pYera5wUMat1WWh7N3XRvuBYLmd/3+XaxFblwZqviqgGDfbau8c3ItePmA32i
	9Ah2jGGB/LiV/wUGdBN5aCTxMlmI7ePc9enphLjWNcakusz07Sqr5mKXIisY+fLQ
	J3DOIM6REik552DpdH5yoO7ozeUeVurocAvY2B5Ruu/AmYDRjIjYbJ9zMJOAnOGq
	7ydS0uGOzg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh42ta6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 18:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPRYxGl9lvdm97RJQbU8jF6G89yNIsPUqkPyfqx/VZ5+4CfqPy7XjtJn0KxicXFwa7e2AV+TR6Qy0NA9D/P7TGT92egve652TN5NDpz6ztREvmA8ddfEPaMdgGQdy2L3oiZEG8sK0ND1FXN78dMjKgjVQw7eX/Rssc2H4EWmUtg3/iahSi8m5IkkmYctttwuUKX1RPm2808QhFqrQjW/hBIC8wI8o8D5hefzZSqEFd1qERp4E0CMBo22vGTz2zDcrdXpS4lxVZ4mCfgoB3CynE98h3VHK8eIlVyl9CUf0Ff0b/DFgUUNN/HPGCcOelHLTH92biuPMxdUI7OUKXIhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCU9tlLCrbVQsOFQMBeSNG8D/uVVSaKjFvNwt5QZSVE=;
 b=nTj7bJsHnIrHcjXejGQUZXjVZxF7ognrRG0hvadabmnoW5z79cVqs0OUPTYfgSfqAVn4HYZAp3v91s6/gNfJUtzWaWPpj5wNUsMXgrubU52tOz2JfSiO5wINKy+VLqxs5b0RixEluthQe3ZXV1vwfFTNnWwxEdO4dHeoYwbNQN8TpqWWbkmczFJ0Y5PLnfqQPkRcoqx7qiMlHg8QsjnCdENSo+Sdq5hVGqlDnC96YIyDWCxn5W0nFWqIJAoOMBn8tvyeWBDcqki3SsE1ZdBXekQ7Jn1HCIVGErmb9Ne3omW6h85Qex3pim3xDa3TlwyLWjGmqLWWOfzUHyF5I/pBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 02:28:13 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:28:13 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe][meta-oe][PATCH] librelp: update PACKAGECONFIG setting
 related to valgrind
Thread-Topic: [oe][meta-oe][PATCH] librelp: update PACKAGECONFIG setting
 related to valgrind
Thread-Index: AQHcqrSUzyX0d0TIQUa0PBhmThplRLWcFWDg
Date: Tue, 3 Mar 2026 02:28:13 +0000
Message-ID: 
 <PH0PR11MB561119606AE32E05F5D6E0D7ED7FA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20260303022208.1399940-1-Qi.Chen@windriver.com>
In-Reply-To: <20260303022208.1399940-1-Qi.Chen@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=be1af947-7f00-4e0e-89bc-61e38712cbdc;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-03T02:27:52Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: fde17ec8-7139-47e3-3004-08de78cc8522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 hffX9FnHeVCz/hrEyvIIP+YRS06+PF7jnrptnEjMGWv66TQjZS7H3Os3YVRorzfJ67ywB3ExTYczVtqd5BZ9dJIqyNxSglMax/tGRv3f5rRyDyT/xCy/mLJm14WcOz/pxLPbavspSPbpS6OB0+Blte0rM6uLG1lbXIpKACMRzZNd6LzJSaL3QbEbtaMdU7htauN0B97tQC2SeE6DOKJpUhltKkJi542jJe7WMjyC797gyhNVkS36zXQRUji9SR1D5NdE6uVpF9igRZTU8MZ/fTZvZTfhVNVOdjOs/eNz2y6B7zTJBzpHnAPVBjZxIaboY07vtt2reXHIi44kYf5JqU8XXoAYyDqicrvh6ke/VzaX9WKtBOhN5mT+MQyO26B+HmesqK6yJAYQ0QOw3RB3g6x6zxqUzDsFt1RoxO9q5d8hcIzpfIYkc/mSSoy4oPigfG1vBS6n//3VtbJ43pZWU9SJxwm1yJLoEoYInu4kKX07u3VbPvw3R8dGwNpGHp1Hd58HsJAV8vpxOxKAommR/jV+tL7FQI7yxSGDpsHTodleNCvt0+dhE+6xYq78dUqrXT1XVZgx712o5WEYv57PD97RQlRU8OpfL86fgN8utrvZlAfp33PNf831mpyWAlVlpQVyfjx8u2u4KOXOB2X6xzWhudzXpNvqmoA4+ReKcDFbOUsWNwSWaaK0FFK8sksyGRRRuz/RvlxxtwsMz7QKD+HDhEpJv5geSfxvrPdUucAY2yPF8U4FOsIrmcNgxm6DCzwomXhQtrWVIbZDgtYlf8YIt6iXsZgWfXBb06yRRRs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9O8Tr/I0okCT94XmE6jIcCN9EiHhb7574yvvTofJ8XMPuyUglSUCOdhYKw+f?=
 =?us-ascii?Q?YpVkdptj2/24ZH1lUxX6zaLCdLDybvWAkn/V3CnsPjcbnfWU0wgAO2D6rBb1?=
 =?us-ascii?Q?cOSB5S5NxKU31Gmk5kHAlsuLxB4dINb66sunKYVgLQkHANkUDpZQxDYS9s0c?=
 =?us-ascii?Q?5qdQeDG3Tc+ve+V0n5qHX82zquoZcYyeEHSYZKAnFEMqJHjrIAHzCQmryhRX?=
 =?us-ascii?Q?eBkoDpDGiluyRrTkIvkBaEZNV8nszPUNmrTJXyDsH7RkPgG5NUufdO7uCEeB?=
 =?us-ascii?Q?S9z9P0MHY8Z5VqdHZYyk66UeZm7M6afq8RlmCY0n+WWqOuapj2mDGyCoRexb?=
 =?us-ascii?Q?j51cy0b+Dr3A7y25bYCD4ajs9UjJ55KPd5sejOotV1U7s9hAMThyn3OuwloR?=
 =?us-ascii?Q?w6CexqHMUFrYkxr+purksA62uViKB55WZ7SvKEbAutCckxj5Lc+JaOZ9qlUM?=
 =?us-ascii?Q?+wpoG0nBj6hQy9eJL61wh6u7u/8LzXLzrhxtlpnc9rLWrJyAb5ZZ9hSSdmt5?=
 =?us-ascii?Q?qXK29z3dlFnrNJeMQjGidxTG5aCAzec/MiWIu2DrUUHDDoFyGxD6CaXBydZA?=
 =?us-ascii?Q?c/x9omViSdZweY7JQyH5Lom+zT+/wRduF8ncR+pv4zVWDsw9lLHzxG1eScAb?=
 =?us-ascii?Q?ar0XwIsiS4y9VgUr6q6NPdBZ5vfuuPgsM4pAUojsmkHwMeR99nSdIPcm1rA+?=
 =?us-ascii?Q?E30R8zddJso7iZGm/8tTNjUA489rXN9qHo3V2z+EJVzgFGaaBZffroxI0w8h?=
 =?us-ascii?Q?32h8wedr6hjNFcKSTtZ6J+HED9tlrM4Qjod5dzosp3wn9LZKz8poEpoIrwLG?=
 =?us-ascii?Q?o03WRwfBNtexHA7ehDPTuubVK5dp5UmqmIlp3Si1+Qc3E4j1r8rkzC9VsoPi?=
 =?us-ascii?Q?UEZ2gForv3sgypNJ3oKap2fqNna3PD2RQcSIWU7jE6A/gkdJ5QXYIbqeu/xR?=
 =?us-ascii?Q?x8VkXgvGnW8eKuUCiGmIRhRNoIGxyGkXQlRvPrqo3eFVK5hNSHwmjilI75zz?=
 =?us-ascii?Q?52G/OIJ9arkH3YNtUH7S+eI5WiVgC6hLh8Q5cfgRYH81233W3KOg2tlFJzir?=
 =?us-ascii?Q?GI2f97SoZUjQK/YPyQOWu5+k3Ovsc8DtUit179qxzITpuTEYru3+zliU3/e6?=
 =?us-ascii?Q?GfStXXH2RiSDCIhCncgm3PugiBCgVTPVg7vyK70NWF+MQ5HutvVqVEDSAsxU?=
 =?us-ascii?Q?8hAJBmjYKezpsqcqhkXBb0BtaEYCPnCp+ISJ52L3drl7/1SMerZaNW3f+bPd?=
 =?us-ascii?Q?cdjZON/cHSoj/fEEUstsJ4ifXElUU3Q8sUyTDuAtH8skcVSRxaCXkfOW0n+t?=
 =?us-ascii?Q?PDXNCaiL9jbsPmNQqB85sbsLTDvhhbjsAFVaEGfN6XHd4ZnxaRxaIGL8hBro?=
 =?us-ascii?Q?DXnZyOF7P+o6EfgmAaviceiSfm18/0sxfebsqWIaCdr+//YpwIBwuWUpmwEI?=
 =?us-ascii?Q?fxt/y2hCAjTRmEY+WUJPBY8uW5SixVVpSAGqo+9LhB1gYDnRSbw6NDJR8dBv?=
 =?us-ascii?Q?cR+ShKtDmj24n9lNky+fqkx3W+idot0U39FYT0YY/9Gq3ryooa/o8knpg9Ko?=
 =?us-ascii?Q?qpP1m0UEXrn6rt7O4KKh9AHit4UzeCwBgnEHFVG7TZ/5KJLdoKAM/f7iil4B?=
 =?us-ascii?Q?kco8nwWbdR/R+RUaPkt9FPXY2++Uho01RXfAMe0AJ/h86MLrU67SeFUgs+K2?=
 =?us-ascii?Q?X86WLAE1RT43WFIp8JBs5l/jNuikpMFbsUKwn4gAEN/yhIRff9kvhN78nbEE?=
 =?us-ascii?Q?5rSG+WTiPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde17ec8-7139-47e3-3004-08de78cc8522
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 02:28:13.5250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DW/0NPXBHtSBO5jDZ2Yz83TCMmNhlZVpuQ9Y71RCqWiqfVEyZ8ilrRs9Tmc47hpsGA59jJoetWE7in38haCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
X-Proofpoint-ORIG-GUID: FVHuSf4t4WYCarUIyAembPu9ebeuyYsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAxMiBTYWx0ZWRfX5ZMhwsU0/1lk
 M9oHMKvlVCj7bpC3Py0HPrw4YlgaJ4A1uV7oVsOG0ErSk4UHEA3ykIhH8v/Sbua8GcUnRDk2s38
 tbTM57zAlxRc3zwa+OQcbqRiIKBffaJpVaYy2deeR0VBXnZS/JdZNXCx5O/iWFrfYpP/422UViA
 r0O6khV5OHqMVuys7W3VlNkN4A5uzt13nR+aubkg5U+hPtzEQ6nANVEvX9ZOPxfgHJO8eQj9NNY
 wfg1C4Ur10DGlhzc036wFrtm0wb5mCEoNaKFNKymWBrBEHU8ZJO6wGjNUAvR/AbdK8zMTyMz3Y2
 vcmGzaUQfA8EtgQKgEzfFxjbCXtRvGvAGUy+mfaFRvQ6NySn7IxFDJUvBLOT1S9XcKFlHT8+Z8Q
 8oWyHcUUr/44vrxjanHMLU/rzsftrRYvblW7OZ7kKhM41Y28b5lHanCoQVFu9+gzP1e5Dp8ds2u
 A6qNIoifjM+05tgzeIw==
X-Proofpoint-GUID: FVHuSf4t4WYCarUIyAembPu9ebeuyYsy
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a6473f cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=06zrz42mlFf1_MCMxTQA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 02:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124821

Sorry. Typo in commit message.
Riscv64 is not -> riscv64 is now

V2 will be sent.

Regards,
Qi

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Tuesday, March 3, 2026 10:22 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] librelp: update PACKAGECONFIG setting related=
 to valgrind

From: Chen Qi <Qi.Chen@windriver.com>

The riscv64 is not in COMPATIBLE_HOST of valgrind.
The armv4/armv5/armv6 are not in COMPATIBLE_HOST of valgrind.
Update the settings accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-oe/r=
ecipes-extended/rsyslog/librelp_1.12.0.bb
index 6bad112e5a..260e4171a7 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
@@ -17,9 +17,12 @@ CVE_PRODUCT =3D "rsyslog:librelp"
 inherit autotools pkgconfig ptest
=20
 PACKAGECONFIG ?=3D "tls-openssl valgrind"
-# Valgrind is not available for RISCV yet
-PACKAGECONFIG:remove:riscv64 =3D "valgrind"
+# Valgrind is not available for RISCV32 yet
 PACKAGECONFIG:remove:riscv32 =3D "valgrind"
+# armv4/armv5/armv6 is not in COMPATIBLE_HOST of valgrind
+PACKAGECONFIG:remove:armv4 =3D "valgrind"
+PACKAGECONFIG:remove:armv5 =3D "valgrind"
+PACKAGECONFIG:remove:armv6 =3D "valgrind"
=20
 PACKAGECONFIG[tls] =3D "--enable-tls,--disable-tls,gnutls nettle"
 PACKAGECONFIG[tls-openssl] =3D "--enable-tls-openssl,--disable-tls-openssl=
,openssl"
--=20
2.49.0


