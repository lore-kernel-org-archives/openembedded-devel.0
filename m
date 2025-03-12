Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B83AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 22:02:44 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.web11.708.1741816962136309762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 15:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=SP4omfQS;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=tM5B4asK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLNPmM028694;
	Wed, 12 Mar 2025 15:02:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfeb2020; bh=fTlGtR0Fmt0waEiVOlB3W7gZ
	OrGUgN0G8FMVwOtFbpE=; b=SP4omfQS4cYWIkZ+FvBEgeM+u6QvnlbA4BRZXffw
	AolLexOZTJvmlSAf1O2f6QYb77wbgrnhhS5kyqsQpxcWPcWhqw1o5TTN4p1jzR9u
	NIct2Cv5q4gR7VyF5ojOlRGFpp3dSTfrSmLgFJkrLqd6YNNq+zGWVOKf5HXLVR+Y
	tHjZBZCfF8gOZN9RoceKsqc8wQWyITv0Frmf6F5FqOmVTk7V+uhGg+oPzjvYLypY
	T0GciiI0ySv197FMvob/UCVbxfNKH9LjN84tt8+xPb6G8dXTFE+z0TRYPHinpG6V
	egcSuOk3xXdT/l1rXep+qss5vfsDaFbdQsZMiTkab2T8bQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 45au39k4j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 15:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfUx8U0CO2awfBBKSZ80urFew0PGGaFxpQwanmSa9KpeEM7yBN0j+g6PkI5yQwhbVsHXiySGMLvXCrd0+5YNCf4Lrcm32IC5dmW3z48zGkJ1vCTasNG2E3YWYFD5YcdpQXneoldYO5qPpA/qUi6I8pUeNEG47JSYDhjMLCJZjPacGVn5gC3PTvjfKShdifRN9ZtoLMcfvJsyoCGhz78/QOEZuJi6zJQuAwYBJGYw06z6ym6yU6tN0htO3MlaG/HNKlu4vD5kbaaU10fPYZbQ4yfJ+ox0lnGcr+RM5axAWbl4/iph0ujXf1nGA+EktrBjV4/d5YV2Lst3ikD2RcpMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTlGtR0Fmt0waEiVOlB3W7gZOrGUgN0G8FMVwOtFbpE=;
 b=nogTvS7HfWrm/yMjEtv+Q//zuBLtj0UHi5frSpdybOmJM0kqTc7NmbEyj0rAAu1xZCJ8B3dldgLDcEelHvYHiu6vIuzvEEXDOyrKVcSYmlF4pd/CQ/KJaZZlMOb9eYXIArl38Od3G1ipbFGcAIfVV78liBjNz+wL9cAhPeRhXBqynRkLa5dMmXO1jbqV4JMdw3BzdGAH0mk4G5RS2vph96fJeCKjeNg9WFip14rdLhlodqs0x85BZWqw4vK0gmGkvAJNo5ePF0EyDBZ5FTeMda44f3MDKpr5N5ZiP4zOifqWvb+b/gOQP7i2fFDxwscgSwNpAOrEgEL/SZOrfCqnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTlGtR0Fmt0waEiVOlB3W7gZOrGUgN0G8FMVwOtFbpE=;
 b=tM5B4asKLO/8KAiGHxtc4YKQTYFSKSy34ehOkkfVe9TQr8WuLe35Av5H/ZskIXgp8OHgJmVgatmaQ8aKSed9mMrGBvbjQwdTaGoeI3Is2i7EYkBAosWhG+Vlf0QHGxb0N/UTSG2RoU+bS34XptItc5Xpd3cVRoQB+pB75rqUGQE=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH0PR17MB5963.namprd17.prod.outlook.com (2603:10b6:510:169::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 22:02:36 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 22:02:36 +0000
From: John Ripple <john.ripple@keysight.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] fitimage.bbclass: Add missing punctuation
Thread-Topic: [oe] [meta-oe][PATCH] fitimage.bbclass: Add missing punctuation
Thread-Index: AQHbk42jbVHawtIFjk+yqsOUpSG+ZbNv+NMAgAAU2dY=
Date: Wed, 12 Mar 2025 22:02:36 +0000
Message-ID: 
 <PH7PR17MB613055047228E33500EB97519CD02@PH7PR17MB6130.namprd17.prod.outlook.com>
References: <NNse.1741811441373566415.sSfB@lists.openembedded.org>
 <CAMKF1sr0i2LzE9XbwgWNE8EcpZQ9ca4wD+aTDRVf=6o_Ks7n8w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr0i2LzE9XbwgWNE8EcpZQ9ca4wD+aTDRVf=6o_Ks7n8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR17MB6130:EE_|PH0PR17MB5963:EE_
x-ms-office365-filtering-correlation-id: f9605160-d85f-4cd7-d4c7-08dd61b19952
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?TDhhWLJlQbbjOQv/UyC2H3jWrd+3U4zFJqjc1CbvEPUsXThFvjAV5J7naH?=
 =?iso-8859-1?Q?FcIMFvg693mbWICc3SAjkTQ3Nts/whHgXc4XZvUGgIxQqfCpNh1QP1nLTO?=
 =?iso-8859-1?Q?n3HadFEJme+QkV0c5VMZmR9qqTwTZY347eJP2OkwW3srQHr8Jd+ksj7AJJ?=
 =?iso-8859-1?Q?oL2knG2w41K2Lgc3AvuVSDaQia587qibKu3UerAkPmfiTbmLzs6ie+vAZQ?=
 =?iso-8859-1?Q?ZGiHeP9YHEEN4n3EYBN3Dsk8EW0CgPkHjJq/+cVgGpNB5XGb/ULLLZ2is5?=
 =?iso-8859-1?Q?HB4jyc7b51YJomquJfqZf4eGOOD78PVmwO4HWbA9r+tEmmE+PS1xD85cjZ?=
 =?iso-8859-1?Q?600qvyW8h87BpxZGu2o6Yyue2Vf93qXPyKNQ/3oU4xy5cyqgb3Y2yb+iSS?=
 =?iso-8859-1?Q?ceI/ixvH1PElMbew2093Oz1N0mMDKppIMOTsfxubvnG2eRF2qdO0sv38oF?=
 =?iso-8859-1?Q?LoiXlvFYFONPWvFvTkV//JAGwOVXO/0x3kMePPY9RmxlUXvM55mkSdJHfz?=
 =?iso-8859-1?Q?2VfcCVVDUn9Ig91bdavMBU8sqOG1pm4LpRFZ/SUqJItWWZ8sL601BmJ0ZS?=
 =?iso-8859-1?Q?FZnLanWRl8gp1dfIoiU9LtvwC0PzG5yL1Y5kVrh1xhv4g50c0Y7Erc8yoz?=
 =?iso-8859-1?Q?R67cTYlmM+4ZPYlF+iyS9ZYBEjvU2qWFtueGTDY/8tc41y9M2O9qTx0PC8?=
 =?iso-8859-1?Q?40eWNzMagOiXuHVoAgDJnlJvaHDCxFNOJSfQ9/C6y/ymt/O9AZhRLH41sG?=
 =?iso-8859-1?Q?M57j/kpn7YJ+LSMot6MKfMRbKlxjHet/78W9qzglKoCrqj5XRDmx/XkZA9?=
 =?iso-8859-1?Q?By23mB4pl5Omjl3c7sqqwcAAx9EoH0YJHDCAutzuwDpZX6XDcCz4L9TucW?=
 =?iso-8859-1?Q?9sB2Jt3vdJut0jLOhW4wlEbK+L0R4TbtJ14EpMYt6QN2KfY6SW6OppMikr?=
 =?iso-8859-1?Q?jrkrgIPfFxBfmlhUbNZYRD2UiBQzz72XzDEDAkFuMkr3zvQ3MHun66TNLP?=
 =?iso-8859-1?Q?fLxS0YDNOw2a37w/C6ZL7I4ynE+wXk88Z3xxkp4Nf1uVIYdSTD/AAuCj/S?=
 =?iso-8859-1?Q?WGXB5i05FMVFgebyMgN25fDMtn5sm6S8g/llpYvsYi4ZILgh5a/4oo1oh/?=
 =?iso-8859-1?Q?clfsIaEEj+awTU+7cYDsCdDpd0NzPJ4WX3kX92ktYxCNwqpL73U8Qj+/Bu?=
 =?iso-8859-1?Q?GkA8XCNxiQVpZzDS3tRBXb4WmLIl4XjginXqu+q6FPVfDuq/wzGxZR2Swh?=
 =?iso-8859-1?Q?vyTj34Gomyfhgibf3P1A2fZUcPTztHhKrpduRiR/KBCgiv3enCK0YXGHau?=
 =?iso-8859-1?Q?EdjZW9SuKxSEH3v42KVr3wOA7sPBZxElhGAt0souCK6O0H9KiSFG14/IPL?=
 =?iso-8859-1?Q?wHxvL/cshCraEXRmx6JtajboS+02XNADKcklX66pUjgyqOI9xFRuW9Km0D?=
 =?iso-8859-1?Q?nCIxj5F/R8jdzn31NaUr/awyaYlt65UxjWTmDGbYxfotxwvCwc6KK71YFb?=
 =?iso-8859-1?Q?1cwqJBoUYrOz+vqGSTsjKo?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qDEx4BdALqnIaEesYknb6zr12ZFm9t5urI8EN3tWcWU/54MyJse/Z8XowS?=
 =?iso-8859-1?Q?wGuq/K2ttTy6eMIanmaECnJeYu/5bDf3QFpo/qyGjNAnZlHbPmYDyT37us?=
 =?iso-8859-1?Q?iBwRhQ7+zSfuiZpa1NQKLeTO950V+RFn0HTPRtM6Ne/Mp48C3Op7UEezKk?=
 =?iso-8859-1?Q?xbLE9GdmGVd6L8z5GHbOAHo89O4n5kFuu7BOZaICRIycA/WVVSfbJSAoMd?=
 =?iso-8859-1?Q?ZgR7WxftyhWJ1/3zDT5zaj+tcKvKW+DGMl4gMWR8v434Ei95P8yZ8OPy+o?=
 =?iso-8859-1?Q?i3RQeXKcw3/fskDu4AE4W4Qp/CzUJ7vJUAp147UacKbVZXHnnXVAtWIM0o?=
 =?iso-8859-1?Q?tgV5+I2+H+NPxhxBuHY9VLNliiIqdj+NfiFneOAHW7yYA0Wbt9eYxl130b?=
 =?iso-8859-1?Q?A2g23a8fzDr+BTJ7yP8c70MZGoih7OSPXeLp+9diD9Y23l5AroaVBLAeLj?=
 =?iso-8859-1?Q?5n5wMHk0xOEBFg2acCS/jjcQ89Z9k3VZUF2fU/ht4tc9URSQb2DGTZHU0I?=
 =?iso-8859-1?Q?hbV/YIU3Fl2ydqQyMdDlmv8g6uB7mXsnNtX8IBINGpZGJ6O77sKIrfff4C?=
 =?iso-8859-1?Q?Nq9z8LHMdokE0aoiNRqiI3GIXOrffEZgs0iPSqtUOIXpGtqmDoDPfNQimi?=
 =?iso-8859-1?Q?2NGnJOF0nxButdo1VZWjGgPPlZH7pRswUkr5eQKziwVCNJpNkb3gwsvfEs?=
 =?iso-8859-1?Q?yHXK9SQF54qycBA+a89SOmEQSFVyz8/aZRmjjarpauM0I/d3gKvcmRv4Gv?=
 =?iso-8859-1?Q?to907Z5Oq7zudqssXYHs3xAR1Dds8V59b8UyCxMBFrFu9Q1v2g8mS6uq8P?=
 =?iso-8859-1?Q?56haePxdWGOgnhVCr1HjtuP6nhue1TUc5mIbwXurU9FBIqL8J7Y0sfpU4W?=
 =?iso-8859-1?Q?is8rkx3HCvhVmh2ycwChCTE9hzDfvhGl5WwMoat2AZj3JKRhgoYJw0hMur?=
 =?iso-8859-1?Q?ILH4os6Kc7A2Py7zNVKzmeKvKF1C/clNgAUS9+Awf1jk0NDc8Nly008PC8?=
 =?iso-8859-1?Q?o2FYrVPB2JwpqqeYblCsmwdQr/iYG2zJRlPz/RRboXZTka3EI3gJjmAvfM?=
 =?iso-8859-1?Q?IyQ+e5O0giO0zJ/2giDBXhadQ5fkMF+LWSTIoUJVROJ6ldEfj2dgXC8hzi?=
 =?iso-8859-1?Q?pAgDWdvmprfnuKbxZMyImLothegi+S5CwPLsIrVrLgGYRD9ChNrFb7Ypr3?=
 =?iso-8859-1?Q?K0haKg4qpRNTtgvRf04KkCGsl3QnzzbyI7mD15vFCkFxCzMJIBNIX7FZUN?=
 =?iso-8859-1?Q?ij76qMqptBFmZqQivNd/XFzPBiwNIeHLBU+1nO3Cea7zBVWejWJt32xt/0?=
 =?iso-8859-1?Q?k3SimkN3ed5eKvc0mgH+6OyTtfL8HTUyd54HcfyPlUJ0/7+A1+6sFbb+W0?=
 =?iso-8859-1?Q?Bkk0YXRG4lc8F0AvMAlzh35qPC5b5250SUMeuLkfWkWH8vixjIqIm6yVs3?=
 =?iso-8859-1?Q?N85rYgW2iEmZvwGqf1h7W0dxwn4xxVbMRBxZBW2EDFH6o0z/xn/R8tpkXf?=
 =?iso-8859-1?Q?OVZiK47xzN2Z+D6kUN0lsmGtwUYalhxbqJEtNAeYPxM87sU3Mwl30QkY4l?=
 =?iso-8859-1?Q?EOVTZ1V8NIB2DwPfEc+TovjoBk3CNOyZKvUl2lfPBLe8govNuNgXi45lk3?=
 =?iso-8859-1?Q?WGWbW4UXPCpRh3on6uLMZjZbK2ucy3mS9z?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR17MB613055047228E33500EB97519CD02PH7PR17MB6130namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mwpNtTZ/yZ7bvSpktgQKtaZ63O0tY1JLJQ6mThn/gYQcDMrStuVzdWMi/ksdLqPa/GeC8CWkUOYmoxu8g1YXPD0w/axL3hNfs8fOZu5Bfil36fA0JQCwkJJNee0QadGkEa0ZEjc5af3ArEABBPzTIhFkHwxVkvewccrV5+t7coyjCtdkBqss+03LwWplR7d6T/CIxZalPLHyvd2+sXaqXSGWzJCwEQo+NNTB68gFC3ZnOPZDp6UGOrCx9JwZM9Y7cgMI1GbF7zIHwoqhAuvPnmfWcq/pAT9r7lEN2w6/0JjS/XJFYKQn4cmJrJ37IVL3yuhdc9XAGBjJznH/2RzMIAld2uYR314kgVadUjwED71SAqvx1dbRgFcBMzEGkwNdJADGas4vIPJq5evoXaEnAwlt0c/SLIMEGKRHpOx/FEQpZqCLH64WRYQrNz8vCjBlSaJ95rlH1dd8nFlD98a00wNV3DCJbtx1GE47noMZTAY1l2eHj2/1xfsphWF/zeOMKujgmVvp6639jOdlRrRfJJxfVqufGwhi6RJ6QAc/G7iHpfH9ReoiS0O+O7Hxc2DWSHn/QzhcNpdX1s6uDsyg6vqA7uUPom0YIPku/ZATMACZCpv8L3ztY6EADS4xBRBT
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9605160-d85f-4cd7-d4c7-08dd61b19952
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 22:02:36.5386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uamkenzkwdssUysd6Ef/2VQZQYie+YkfFsCtEGlPqwEiJSMtzwV+Ef1oz8OTi6XHuUYAIqCDnv0O1NXkN07wNvDlXhEY6jmzrwPz0tEeZAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5963
X-Proofpoint-GUID: nWBkAlEJQcVbn7OaRFDBzd6HMM8bmiMT
X-Proofpoint-ORIG-GUID: nWBkAlEJQcVbn7OaRFDBzd6HMM8bmiMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120156
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 22:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115944

--_000_PH7PR17MB613055047228E33500EB97519CD02PH7PR17MB6130namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From c5d765dc5fe4d16dcce7878216a8916bfa832bb4 Mon Sep 17 00:00:00 2001
From: John Ripple <john.ripple@keysight.com>
Date: Wed, 12 Mar 2025 13:55:00 -0600
Subject: [PATCH] fitimage.bbclass: Add missing punctuation

The functions related to signing the fitimage had missing quotations and
newlines. Without this punctuation, the signing class would fail to
generate a signed fitimage.

To test this change just create a fitImage using this class and set
FITIMAGE_SIGN to 1. The resulting fitImage its file should have one
property per line with quotes around the property values.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta-oe/classes/fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bb=
class
index fef8974187..03c01a1ed3 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -276,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_imag=
es_list):
     fd.write('\t\t\tsignature-1 {\n')
     fd.write(f'\t\t\t\talgo =3D "{hash_algo},{encrypt_algo}";\n')
     if conf_sign_keyname:
-        fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sign_keyname}";\n')
+        fd.write(f'\t\t\t\tkey-name-hint =3D "{conf_sign_keyname}";\n')
     fd.write(f'\t\t\t\tsign-images =3D {sign_images};\n')
     fd.write(f'\t\t\t\tsigner-name =3D "{signer_name}";\n')
     fd.write(f'\t\t\t\tsigner-version =3D "{signer_version}";\n')
@@ -341,9 +341,9 @@ def fitimage_emit_section_config_fdto(d, fd, dtb, compa=
tible):

     fd.write(f'\t\t{dtb} {{\n')
     fd.write(f'\t\t\tdescription =3D "Device Tree Overlay";\n')
-    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";')
+    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";\n')
     if compatible:
-       fd.write(f'\t\t\tcompatible =3D "{compatible}";')
+       fd.write(f'\t\t\tcompatible =3D "{compatible}";\n')

     if sign =3D=3D "1":
         sign_images =3D ["fdt"]
@@ -493,7 +493,7 @@ do_configure[postfuncs] +=3D "write_manifest"
 do_fitimage () {
     if [ "${FITIMAGE_SIGN}" =3D "1" ]; then
         uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \
-            -k ${FITIMAGE_SIGN_KEYDIR} -r \
+            -k "${FITIMAGE_SIGN_KEYDIR}" -r \
             -f "${B}/manifest.its" \
             "${B}/fitImage"
     else

--_000_PH7PR17MB613055047228E33500EB97519CD02PH7PR17MB6130namp_
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
From c5d765dc5fe4d16dcce7878216a8916bfa832bb4 Mon Sep 17 00:00:00 2001</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
From: John Ripple &lt;john.ripple@keysight.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Date: Wed, 12 Mar 2025 13:55:00 -0600</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Subject: [PATCH] fitimage.bbclass: Add missing punctuation</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The functions related to signing the fitimage had missing quotations and</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
newlines. Without this punctuation, the signing class would fail to</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
generate a signed fitimage.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
To test this change just create a fitImage using this class and set</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
FITIMAGE_SIGN to 1. The resulting fitImage its file should have one</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
property per line with quotes around the property values.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Signed-off-by: John Ripple &lt;john.ripple@keysight.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
---</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;meta-oe/classes/fitimage.bbclass | 8 ++++----</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;1 file changed, 4 insertions(+), 4 deletions(-)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bb=
class</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
index fef8974187..03c01a1ed3 100644</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
--- a/meta-oe/classes/fitimage.bbclass</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
+++ b/meta-oe/classes/fitimage.bbclass</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
@@ -276,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_imag=
es_list):</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write('\t\t\tsignature-1 {\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\talgo =3D &quot;{hash_algo},{encrypt_=
algo}&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;if conf_sign_keyname:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- &nbsp; &nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sig=
n_keyname}&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tkey-name-hint =3D &quot;{co=
nf_sign_keyname}&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsign-images =3D {sign_images};\n')</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsigner-name =3D &quot;{signer_name}&=
quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsigner-version =3D &quot;{signer_ver=
sion}&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
@@ -341,9 +341,9 @@ def fitimage_emit_section_config_fdto(d, fd, dtb, compa=
tible):</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t{dtb} {{\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\tdescription =3D &quot;Device Tree Over=
lay&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- &nbsp; &nbsp;fd.write(f'\t\t\tfdt =3D &quot;fdt-{dtb}&quot;;')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp;fd.write(f'\t\t\tfdt =3D &quot;fdt-{dtb}&quot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;if compatible:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- &nbsp; &nbsp; &nbsp; fd.write(f'\t\t\tcompatible =3D &quot;{compatible}&q=
uot;;')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; fd.write(f'\t\t\tcompatible =3D &quot;{compatible}&q=
uot;;\n')</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;if sign =3D=3D &quot;1&quot;:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sign_images =3D [&quot;fdt&quot;]</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
@@ -493,7 +493,7 @@ do_configure[postfuncs] +=3D &quot;write_manifest&quot;=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;do_fitimage () {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;if [ &quot;${FITIMAGE_SIGN}&quot; =3D &quot;1&quot; ]; =
then</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_AR=
GS} \</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-k ${FITIMAGE_SIGN_KEYDIR} -r \<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-k &quot;${FITIMAGE_SIGN_KEYDIR}=
&quot; -r \</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-f &quot;${B}/manifest.its&=
quot; \</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;${B}/fitImage&quot;</=
div>
<div class=3D"elementToProof" style=3D"font-family: sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif;">&nbsp; &nbsp; &nbsp;else</span>
</div>
</body>
</html>

--_000_PH7PR17MB613055047228E33500EB97519CD02PH7PR17MB6130namp_--

