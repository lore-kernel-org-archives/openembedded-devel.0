Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D622C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:35:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.1059.1716413721506413502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 14:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Hv6VBZYE;
 spf=pass (domain: siemens.com, ip: 40.107.20.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flwx+lj6Cib+umjXwF+zGdV63htu3hQtTZ907gPZhURHp75gAF5Vhepzo2OsVETWs5bCW1GZlcZL+sayjAO8ObI+fXsFo/E+veWF0ouNqxlmKgtrlhNF7iZyZF0uKXUv0Cn7YChrikmPqI8MQ68O5sqFUh1P0EXw2c4Ir7goxPF7NQnTmEUboBPH29bD3I16obleaE2VBjolFk0nIKAzyGuyya+fvVrG4/fXr2/gU1CDDbVF72FIBPdVf93OiSC3JIqOydQO4KnFc0fAoYFSpOZnLxtJTcpk3xeviL47Md75lpZyFQjiSJVG/S1YuCLyRXGQrXYS8+EwrFJ8nX7Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyZTvan6chCew+u81bVy1PkPVB2JXgccKVtlBp0myu4=;
 b=LJ0JqAVjOPZeQNG7SX0zCezLIR63dtEc8tBoYpzJpWyDnkabHgirVtm8vpMoJYwnvRHOZZB5mHyK4WQQAUzlPu0gNiRvJ9SbgUPmYVi/VNBrE/zgb1iA47cjopUS4BGYcddkBlE/XhmJdXVpgmGrmgqwrOoxDIZAytkCitvpIwh6QPBjpfaFGEIzy6I/gjtB1lsnPMthJSXMlKMNEutvvAWVwCui24ZkgPfNOSqbx8hGzWJwC6rvbgMYqbYDtXHjjCzQYAreZCajkReDJNUEr+CLYKJbZwsSYdshQBk3mb7hbRydj8kHtwYf3fha08ptHjB41phexRh8qcGffuVXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyZTvan6chCew+u81bVy1PkPVB2JXgccKVtlBp0myu4=;
 b=Hv6VBZYEfe7l7GMNl4o3umC06hrT5Q2VSPoOI5EXqVi5eVty/TjrtJ1sYl/v7Y/10tgsoQ0dww4xGLJTWoGPb7hnJArbmplWF7eTRSTGZml6BskpwRucaYHzrIGJw1e8fwNmyn1pUimWBTfTIjxBAvEX6kvFWv8m5nR/ivWibYLbRQNtS4/CzbpKa8NEHEV7UsTQyRuq+CoA+qLIw7sbPTdJuxYjs7WaWRUU0zgyUstci2oTMJrAhL6XjxKdbLAELTjt1jZ3al+kFOSdJYBqyaPWsrT96pX9xbAaENpi7y5Vp35CLbv0heacYg4i9/+GabBaiU1e6cVcpryhTiru2g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 21:35:18 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 21:35:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH 44/44] uriparser: upgrade 0.9.7 -> 0.9.8
Thread-Topic: [oe] [meta-oe] [PATCH 44/44] uriparser: upgrade 0.9.7 -> 0.9.8
Thread-Index: AQHapd8FTa8B+7D93USEVclqRmfvQ7Gj07Hw
Date: Wed, 22 May 2024 21:35:18 +0000
Message-ID: 
 <AS1PR10MB5697B5368251796D43A37E13FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
 <1715677817-2223-44-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1715677817-2223-44-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d1c8a39a-b1a9-4005-9e76-2c1698d802e2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-22T21:33:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5989:EE_
x-ms-office365-filtering-correlation-id: 0061bce2-fe4e-4785-26a9-08dc7aa7137b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4Kn76Oes+cpgB8qUm1XRAaqRZACrK13JtPgSvUsxiDcrP7Y8U7B6k8M3O5oG?=
 =?us-ascii?Q?9+J7Rmk3ej69G8avlZpoBjJZKwLYyOcy0/0zleOH5wun8sgZee4slh1UQDVY?=
 =?us-ascii?Q?nYqbuqTvpROj4Ex6rTh5yJCuCGw25DERrG6Ye2ke9TJ67Mkmsvu9FQVWd1Jj?=
 =?us-ascii?Q?KRk0nEtAIK954QX6KHdjezWY+LN4KYjybc2ALBUIn2VjmZTwoFg50CQPUOlm?=
 =?us-ascii?Q?uhTTmHa5HJ78VgOjGBM7Pe52zzvOGHRbS3d3vPOyLk3UPWz2TSo4clwDgRSA?=
 =?us-ascii?Q?jvwM5WnaGEL+SNOcC+8/1bEpBcUJ1EyekpxeigZv+p3K6aDxYj08NxxtLYGO?=
 =?us-ascii?Q?wZ5XSkcOZ+lWK1STNM4tlSMqqQuNQ9kiwz68mAmLOUqlxWYs2cY+xSmXBKWv?=
 =?us-ascii?Q?BgQfo160waZ5QIDU0qmCvZfL8RK+r78G9UuewLbdTGGcfgC6ZJfRfiF9ylbr?=
 =?us-ascii?Q?jBsrayUsI/dJdMhGG30fp+HjanwsFwVX6slLkgnAfz2JT3f0pYt0k7eSmIu/?=
 =?us-ascii?Q?OuYHVufjUpWs4sgcJJ9R/frekQQVzt2CvOZx0uiVUe9G6nH+Opux3fSNlfLz?=
 =?us-ascii?Q?mqxI+O6PyfkzoNRs6CkW/Ojpkqr74yAvKC3cGnj+tZn1eKK3juQe3lxy9Tn6?=
 =?us-ascii?Q?HcEQV/X04X9DfJ+3E7rtX72aZw88A51V3jI9HMdp5K4kjmPehxAXthhxkM90?=
 =?us-ascii?Q?SNVCPzfAYtWgppPJ8CGZNqleqJFSbWzX18OFQueh6qZ64C4pCixW2ScwFJRD?=
 =?us-ascii?Q?Mmi10zCPD8WxdBSNmE/eP1MbQ8RQy/FdVBCNqmOwqxDpGu34qFUm3ifzXU/z?=
 =?us-ascii?Q?HryMoflX5g24wsuTd6icRzOAwxn+c6W79TIiNQgvU5aJsA39smEqHxq0iThg?=
 =?us-ascii?Q?j4ultejcDUjcp64m0Xoz/bv+bG+Dig7sCI4BhMj+20U5ddUjQQYPCn1U90Mq?=
 =?us-ascii?Q?QIJCzCggBjBRborwSHbuYF1M9aVSIXU6ZwhNhKqIZCEZhjmVgakOjCatqWY9?=
 =?us-ascii?Q?k2RvVA81mgShWIm39Dn7YbzZZ0De3y1up3IQwJUdjMNB5slylCEzzwhHL5S8?=
 =?us-ascii?Q?LWAwfeIgBFgW4ycA1xOw997HEyzdN+N8AhC6M0JM8OFZk0V4o+XOD0DfWNLs?=
 =?us-ascii?Q?uwiPTL5xIhWpQroiVOQS7rR9ZSvf5nferukOpmxyeS2zMwNRILCaZLQUZVpu?=
 =?us-ascii?Q?IONY4Hxa2CjpUFDjDU1aoJfHozE7zHzjOVmWG5OMphyHHIAF5iP7UdOlZcFD?=
 =?us-ascii?Q?82jMAA96dAHD8UVJI4ZvZqa+hjcM+CXwjPA3YdAxqU3PsSVGQf4sKocjvJmV?=
 =?us-ascii?Q?5XiMc3kP/VEPCedeI9F7PP0w9qrrownf/Wx+FAYd8cME8Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oTHfCY7EHS4ta++gnRqrIWPBrZlZIs8KI8bMsL8XmJuqZXrnr7ZZ65qff8c+?=
 =?us-ascii?Q?oTfrSXGN2J4R5h9rs7htW/hfzbmK4x3btt3yaK0LNDcIsXEXpUmeGXq7dLTB?=
 =?us-ascii?Q?rj54OTVLT6tUrL9+1jAQZT4rn6KooVXB0oBFR3g7pW1Sm5E5vnyFefaUvEod?=
 =?us-ascii?Q?4743z6QrT1xLcfFDHa8lWVBFvJz8nlGOxYbgZq+7K8+Ozt2UiOog6bkJmOlo?=
 =?us-ascii?Q?AvU7mcIVy5BjurJwg17gDa1E5psRUMLEwRRSVL7rGxBwBHPajZ3L+CL8v3ol?=
 =?us-ascii?Q?DMgPSHFM2d5vaUd27WfZtBHzXxTbwtWDDEkR4D+3JHL78qUeRJuBYvVRa8g2?=
 =?us-ascii?Q?vSiQdnXmleSakE3f6U0TF3TrIZJz0vzT3ccth7Onyx61rvHG3Z6dJBp+zt4E?=
 =?us-ascii?Q?7sAdrAsdqdE/6MPCaafmHXphVxvZKJtWEqJDLznOjCBOE0yKBY7GXWR6E7rR?=
 =?us-ascii?Q?4MdpjzfpmOiGXgX9NDsx2m3tFkEDyMCogdsoMgUstjFWUaRn8hHkZoEObshj?=
 =?us-ascii?Q?+rYn/w9DOGiwolcgopIb/rRmFF7+uUfeZQtlLsACylXstFi5N8hJ2+ImEbdW?=
 =?us-ascii?Q?N0BcrxNnNzm5cIn6Yc9uFhnW4HgpVbhezcD4kZ+kYloyrgnZGjtcyiKdLCyW?=
 =?us-ascii?Q?6v9dh7zcTwL0+q3yByJWEdKFMcKsmD+qh809TyxHW8s8jqZ7MkmcZ2lXaRaX?=
 =?us-ascii?Q?UaXEy/Zg8+p2GHIIyiuhrvuvtcM9quar+PeRZL0TH8q30EmmF3xktrx+d1lR?=
 =?us-ascii?Q?pTmcUl103f6QoK5wl0+YTnBu8UkAHDL2g+gxcFz+iXRSx71Jbg+4l9SNj+iM?=
 =?us-ascii?Q?K3KNS88+fpslUsp6pgfrEdz44DxOOUJrp3TF0fnQTAYEu2QCz/m3rfNsdRSS?=
 =?us-ascii?Q?/bpym51Uhm+s6DmvmDZc/MfRX0q+1V8AcBCd3BnjWPsVefLXrUY2AE6jUNI1?=
 =?us-ascii?Q?aHGRReyI4bAN3kdQNLiDslizL4QM5hsTVlX/13N/MC414MGNTNee/3A9c7bS?=
 =?us-ascii?Q?0VNUP9EKkx9R9//6qk9q/j7mgHPAOS5DVRI8xxs5mWgQ/Id68HwbbOpju2lK?=
 =?us-ascii?Q?xVE45fgff8r2MP/0klbiWOjwoZolctH+L9BCht71WUnYBntX8I0Prmffo4pF?=
 =?us-ascii?Q?cD3tLYmqNwFxAuNKQ2uIh6GduPNeYHRRQyuknmxK9R+k2NbHa0yAdGwckZBy?=
 =?us-ascii?Q?Wgk2Ait+Gw7JFIjqaUe33u7YZJw2/H6Hf4NIjBTa982+vRCUryPdjrVuvKFL?=
 =?us-ascii?Q?0wrVL7HgQ+54GLItbQDtw+qtOQZ6GBp+1AjjZmMGnVA6tdEhNM01Tm3DPNb3?=
 =?us-ascii?Q?wMRjMArFdq5ZoJbxOTN6EiPn/EUzN3KPUCwJ5IgM/PZdlui47xNdFEgrtA43?=
 =?us-ascii?Q?wrs986Oyws24f3ibpdBhy7JFac0+a8wkbQhSykhH8wJYvL0renz5DuZQVDM3?=
 =?us-ascii?Q?8kxLFWQt3eG7iejgCha1TcaJTNI/5L1awU1n/iGHeTtUYMZRJGlCo9XnwVM9?=
 =?us-ascii?Q?6H0bbftnp5hRl9STsKc8vsiHm8vqeEz4/HG06lbfOfC8BqLOvlMt3/rcP7yN?=
 =?us-ascii?Q?MQwQHvs2DyF0jIlIGQvb3z5hJEf/e1dLJgjQ8kjT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0061bce2-fe4e-4785-26a9-08dc7aa7137b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 21:35:18.4291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXVq68q03kIdyKawu+mn77vlnFO5op0nq9FyHbtS8v2X6mr65YJF7fTty+yXDpE7EidXEJBAqEYm0+alJ4FmBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5989
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 21:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110490

Please take this also to scarthgap.
This contains fixes for two CVEs: CVE-2024-34402 and CVE-2024-34403.

Thanks,
  Peter

