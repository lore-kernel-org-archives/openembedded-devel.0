Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F829C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 01:06:57 +0000 (UTC)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com
 [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web11.5432.1648084015036933826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 18:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=x3QufD5v;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.65,
 mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1648084015; x=1679620015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=k/TYe/OK9DwbbGDR7nE9T20qpIeqFZ0v4qYFF6PwJaA=;
  b=x3QufD5vNItC8s3RVIfwY5M5u+eF/kINTBitCEB9//lTLEl8aR4K8Iou
   EWBqnTN86fxWExtC5SdmsCa3csLj2YIweRLrQFcGORvqpDWxaFiXMqCsL
   dqNGgw0KR8umuEHOZiy+bJ7cjIifpIW8iIbBNERZN8nnN7JRRtknOxjRB
   nzqKUVvNHltlos3f+ns8sR6V+Pb9I2qu15viJzRmte2jrBBPcl1RwRQom
   w2fiYrFqNAgugfOd2mWu9vtYitxzB0E6SE9NMN9MopXycjFYHggMNrXu3
   AOjmAiVmQu17a6NZGtTNHmNGHr2Yj86LWeExLpqtJPuSvRO20EmrlEK0J
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="52375320"
X-IronPort-AV: E=Sophos;i="5.90,205,1643641200";
   d="scan'208,217";a="52375320"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 10:06:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD6Z5k4bLOyPb/Fu0vT2I9gX3xOA26GWopkNPWXv/fkF+qCMu3UaTQV8Iqxlmgnr0uElHTy8hS+o5lcbg3vAM07uDPolsvXTAExDNC4+3fDRQVlC9q562F4lltkvgIXHqMrkzUZRt/0CyPBAXuuu+dtgHmnmwd5uKF/Aq6rxNdVIXp/Pj62Q0PS7XC60mVgRRaXutSFN/KmNWmbYUppWnkCKd/2sLfsbqv6/gecz7PSCN98rDw+WhXMR46AWLUxyGq2RXCzecld2ux0AGZ/O3Tc8530Vy9lr8wBHrIz3ZaaqtgMDWLkwAeWlXyr6x7frSY5zWfpIgXiS58cQf6zf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f02D60tK9kjOmxgB3L8nZjs+2MF3sCADNiz3YB8NtKs=;
 b=H/+oEAEBpoKhl1pTsdIrtt95fcE722aT5vLI5thDUZK/amKARl7DQpo0oZ8mFy+tpO2flYFgdhWEMXJ5qbg/N/XoMFsEGxVTvpArl5AMwAS+2Olo3HG0tED+qbNAXV45Yt7bYjBGKFsSfzbZz0ntzbVXafQv6E+SLOhGPuqY+ILXjH/1BSDEjZVsBUzQ+hBRwOXILd84e4O2XhGmWG+fb5Wz3mknDuF9Vy/vvP/fxFSsu/2wEJ7MUWh0Gf16FfkfPidY4RhqDa6Ml9WPUjwKScyc0rZnQn9GPGUM3QFkkXrJemYg2ZgIQcxwBfnizievi38gbJoDkIPj5Rq9huY45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f02D60tK9kjOmxgB3L8nZjs+2MF3sCADNiz3YB8NtKs=;
 b=JwGoKUrGQujMF5nWMcQ84oACvrpfpUwTmP1TPDV+ywjpxwbeEVxGZe9DaB2KkB5LGyY3reLi/D0s8xx3o4e5rAnt7dKvACKgy4egr95ijh9Xkfxg2xEeRvWpvife0ssLNjAVU+NA9P4CS84p6HP5g0yMU3YNJqbi5rD2N8/bf9c=
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com (2603:1096:404:75::15)
 by TYCPR01MB8705.jpnprd01.prod.outlook.com (2603:1096:400:189::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 01:06:48 +0000
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::14b3:1e96:d14f:50d3]) by TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::14b3:1e96:d14f:50d3%3]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 01:06:48 +0000
From: "shin.matsunaga@fujitsu.com" <shin.matsunaga@fujitsu.com>
To: 'Marta Rybczynska' <rybczynska@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
Thread-Topic: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
Thread-Index: AQHYNP6OsAim2Xl0iEO3PcUFaAfVe6y5pzgAgBQlVrA=
Date: Thu, 24 Mar 2022 01:06:48 +0000
Message-ID: 
 <TY2PR01MB328987D15AEBB3F92B6E6D5192199@TY2PR01MB3289.jpnprd01.prod.outlook.com>
References: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
 <CAApg2=RCBt272k4-b0x+ymoToqbHam7ZVJRFt=f4kw7zLQXJ8w@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RCBt272k4-b0x+ymoToqbHam7ZVJRFt=f4kw7zLQXJ8w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-03-24T01:05:39Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=1f6027b0-55e8-4d41-8af6-24d65bd9df22;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80ede9e8-7112-484e-e8b1-08da0d3292c1
x-ms-traffictypediagnostic: TYCPR01MB8705:EE_
x-microsoft-antispam-prvs: 
 <TYCPR01MB8705D77FD349331B2129A4C192199@TYCPR01MB8705.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z658ej7v0F9nA5yKSofcPk9zqDvfN8+3Gpt12WQIntMZqIhuVeEM/itq//wh12buJV53XLw1frxXYO2KJXRXuTDZjAZQNvhANAn6dOgeSWOgvUEBAMkMmdLFeZDhYwl97903iaeBkKJHnuNy7q+qKOrPpYF4a7Od/lK8rQxJXEUoulrJPjdnvcj4oaY9FWB4D00dYDNXBquPXeeg0mrCPxS9tySa7tXVxv+UBQbXIEigUw/gQAWJ1Gid4LzZ8MGVHQc7+BfNopPf0MdwPpndXEyIwdHv53fVFDX97T9Cl+O2/qGvn6bDxn66JvR8l4PBSeomMxuqS3JkAwld73iN/agU0N9g6faFLM+ULDfjOaWz7lnVt0BjVz7SVsARa/KNsjVkVHpVwXddGVsyRMl7VWWa+dkVSJ29pLOuwLkbIQQdqYURLMZEz1rZ+ttoxrTLRfiDYjZp6+iwJ6R4VpJTSwvF6WFX4ZuY6aeJA5wOXAVrGcuyKUDlym7/0F+Dd3Eq/bIA4Lt0Y7kmhPCoIwZnC7pytJLO1+d994sXLVTp4U13KAKZi53+rpXu2IR2IMwY+e1nStTTsz1xbRxnOh9G71iG6LP4bWB22j7qCVzhTzSRMOcWqp5Uh5VUjWuGAz0NM2mFeiqzMd4rlfnDU6J8BbvMusjCKSD5Og9WuNoTB4V1HjO48+ilARUzN13GmPJOB6RZkm0aWiyS/bh8Hn5oRmOJ6BU04p5jQxHA7CdRNVhuXbblHSZP+0uBfg6L1LUPISEPzpQ0BcPdh+7B+VVbnGxAIQ2vH1loFaO9ajI7+BA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3289.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(83380400001)(6916009)(966005)(66946007)(508600001)(186003)(6506007)(7696005)(53546011)(2906002)(33656002)(316002)(86362001)(66476007)(64756008)(66446008)(4326008)(8676002)(52536014)(66556008)(122000001)(26005)(38100700002)(9686003)(71200400001)(82960400001)(8936002)(166002)(5660300002)(38070700005)(85182001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?eVRsdTdQVytZY2RQRDhpdVFPb0E0dmtKQUJFdW9WQ1pySno0U2ZBMkZ6?=
 =?iso-2022-jp?B?REdKTHp5WWM3NDE4aHVZNU9vSGN2S1JWZHVSMnBOdWpqRDlIUkxNMlh5?=
 =?iso-2022-jp?B?dnF6eWl5NkEzbjAza2x2VjNzQ2pqUEJWN0dmYU1BenhEN3hNcTlYOGlF?=
 =?iso-2022-jp?B?WGF5ZkNlM05BbHNNMkNhVTJRV2lTZGNNeTNob2tVYjFMZmZPTlhHb1d4?=
 =?iso-2022-jp?B?cExNMHVlN1RMZ1VwZUE1cnhnNUUrOHhWVjN2U3dMNXd6U1ljWGY1OENJ?=
 =?iso-2022-jp?B?cXgrVUtRVXdQNlhCZzhTR05HUlMrVllpZUdUYm5UZlFiZ2U5b29aN1BY?=
 =?iso-2022-jp?B?UlFZK2RDNlE0M1Rhc2J6bWhvbU5FZ1hwVFl4ZVpzRVdNaTVSdkVpSU1t?=
 =?iso-2022-jp?B?bTg3SFYrYlFUNlZweEZwd01LWjR4eE5BaVNadDZZUURiNGhidFd2SEp3?=
 =?iso-2022-jp?B?YmV1eit2ZEFnRUd3Qi9zZTVnNEk4VkswVmRIU0pHZkpBRFlEZVk2SUFW?=
 =?iso-2022-jp?B?NmNUK2lhK01ESEV3VUxocVUrVzZ5cUMrbFRGMjRvVGdCVHZQV2R0U2FC?=
 =?iso-2022-jp?B?WG02RlZIb29Ba2Q5S2VOclVoU0oxcTZEMVBMdERvLzVGNTljZ0ZCdHBH?=
 =?iso-2022-jp?B?c2JmY3BGSEV4ODNnNEhyMG54bjg2WHREc09iVjJ3NktZSmJLZXdqVndr?=
 =?iso-2022-jp?B?MmJZeUFsZml4Y0wwZThjL29VQlV4eG13ZnZBTXpyQnVrSXF0NWVUS0J2?=
 =?iso-2022-jp?B?eDFFS01QR2xJaHVVbU1hWlUrVFYxSmUwK1UwRmNYcmF4ZE12SFVTWSs5?=
 =?iso-2022-jp?B?Z3dmTkllazIrV3ZQNTVrSkMybjhRc3FCZ25MK1hRMnBxT3ZQWkd6S0RC?=
 =?iso-2022-jp?B?OXQwQkx0V081M2Focm9NZ0xpcDZoVk10TkVaamJYK2liMjd5WDArTmpL?=
 =?iso-2022-jp?B?MUpOb3BPVlUydDZMUk9SdWx4UUlSUHFDWEg2T0srK2kzUk8xRXM3T1dy?=
 =?iso-2022-jp?B?TUhKTUlWVkRlNkpvWGYrOEtIYTlqbjV5MTMrQWtMRWt4QzhqMHZWQ1Rt?=
 =?iso-2022-jp?B?Sk9Nd1hxZFBXbmNwenErWHFGanNPTGVCbzFHcG43VHl0aUg3QkNQblBI?=
 =?iso-2022-jp?B?MU4vdjh4TElnZS9iNnNsRi9wMXUrT1dHNlo3T3AxNTFMSUpMaG1DelE1?=
 =?iso-2022-jp?B?bU1FK3MrTmRDdWYrSW41eUhPZ2ZOVDZFZExDYzhoM2ZJNGxZS3lUWkVZ?=
 =?iso-2022-jp?B?VnN6SmRjd1FWUUJCdVFlT3MyczBHOUNxUjZnZ0hobnAwM0s2ZXU0eVUv?=
 =?iso-2022-jp?B?ei9GNHVwMVVkb3QzMCtDLzNXN2xGZnhWMStLZzhzQWM3RzVCQ2p1VENG?=
 =?iso-2022-jp?B?WjNnV2F5L1lUNzhDSTlvLzMvL0dHeEROZlRaZlY4WTRDakRDZXp5YmFG?=
 =?iso-2022-jp?B?UjRueEl6MFA0ZnFQSy9WK1R4bGdVRWZKQUZvSnVmVm1wTnJVdDNCMEhp?=
 =?iso-2022-jp?B?a1FPcXdCZEp3WnZBTjhWVWkwaEl5eW5XNytLb0RVY1dVblV3VEQ2M0tu?=
 =?iso-2022-jp?B?dk45b1ZsTGdrSXc5dmJqa0VoWVQ1ODVUbUhwMDY5Ny8xR0Y3aURxeFVo?=
 =?iso-2022-jp?B?N0ZCWllYakd4WDdFaWljZWpkd1lrSjhWQ2JjQ3pQWjhXU2E3K2pTR2VK?=
 =?iso-2022-jp?B?c3NtemRjaEdITXcrSUM0d3Z1YkRNcUlCRUpVclplekZvb1dBTkUvd1BP?=
 =?iso-2022-jp?B?ZGtjT1J3bHlnZCtOc0t3WkM3S2k3MTkvWGZlYXUvRWxPL1VvSkxTcVlE?=
 =?iso-2022-jp?B?Rmx3R1pqVVB6YXBoeTBPbzRlYStMTXcreEtZUHUvWE5pbkd2OXByQVpi?=
 =?iso-2022-jp?B?WXUyME5rWVlFUkpuTG9pVVdBSXBXeElqVUF1RHBwa1BUMzFDR0tyUllV?=
 =?iso-2022-jp?B?RjhxM3lxOVZqc2FkRU5EQ2Q5QmNpSW12MkFwai9qQkovcUlyZUVicHNl?=
 =?iso-2022-jp?B?V0ZpMnRjV2VZVzNud3dad2dIazlSY3hDTG5rV0RvUmZzcXdDK2pvSSs1?=
 =?iso-2022-jp?B?SlY3ZlQ3Z1dkNDZVbkkrSlJVdU9uM0dwNzB1N2Q3Qmp6NXFLcUc0NVNF?=
 =?iso-2022-jp?B?d1JYTmF3VlNCR0RTVy9FV3o4WXlzSTRKNS94NUkvV3UrZWl0MFBnTEhj?=
 =?iso-2022-jp?B?UnNzVmNWdTk5SGY2VzJUaEpIYXJvU1N5RnMrVTU2VUFWS1A1TzJZdURV?=
 =?iso-2022-jp?B?cmxYYzlOc3lEQ3luUE8zYUFwMmNCaTNBc0NzTlIxYUE4eWFHbDFzT1pI?=
 =?iso-2022-jp?B?dkpxbVdZVldNU0x1bDJ2MXFqUnI1aUVrU21GRk1sOVREYjZqTmtiblFD?=
 =?iso-2022-jp?B?VUtlY0dDVTQzbHd6YS8xK2dWd2w5aFN6R0VQYml3bVpHUVNnckhiWHU3?=
 =?iso-2022-jp?B?OHZkRWRQTVp5Wi8vVEs4QXZPeTBHTDhQajlUL2RCVXVPdzNzNkhVeDZM?=
 =?iso-2022-jp?B?eXdGazlKNi9GY2tIYVJVK2RjYk15OGE3K3E3L05oWDhkR1dGTllVWkFJ?=
 =?iso-2022-jp?B?NGJNd1E3UT0=?=
Content-Type: multipart/alternative;
	boundary="_000_TY2PR01MB328987D15AEBB3F92B6E6D5192199TY2PR01MB3289jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3289.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80ede9e8-7112-484e-e8b1-08da0d3292c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 01:06:48.7272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Y6QzTS9FiR3puSN6mbHm001FxZJMw8EKrlFHrrpEd2u/KC3v4+eyWQhrl4TgfI082xNgsxjVYn2IxYXcTlS/1jvfqLCXwk5L8zf9rd35DjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8705
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 01:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96176

--_000_TY2PR01MB328987D15AEBB3F92B6E6D5192199TY2PR01MB3289jpnp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Thank you for your comment.

When I sent a mail to NVD about a database modification request, this has b=
een approved.

NVD has made the appropriate modifications to reflect that the affected ver=
sions are up to (excluding) 109.

So we can confirm that the website has changed. The same is the data feeds.
https://nvd.nist.gov/vuln/detail/CVE-2016-1572

Regards
Shinji


From: Marta Rybczynska <rybczynska@gmail.com>
Sent: Friday, March 11, 2022 2:27 PM
To: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist


On Fri, Mar 11, 2022, 05:14 Matsunaga-Shinji <shin.matsunaga@fujitsu.com<ma=
ilto:shin.matsunaga@fujitsu.com>> wrote:
Patch for CVE-2016-1572 is applied in version 109.

Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com<mailto:shin.mat=
sunaga@fujitsu.com>>
---
 recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb<http://ecryptfs-util=
s_111.bb> | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb<http://e=
cryptfs-utils_111.bb> b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.=
bb<http://ecryptfs-utils_111.bb>
index 9aefc32..d98724c 100644
--- a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb<http://ecryptfs=
-utils_111.bb>
+++ b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb<http://ecryptfs=
-utils_111.bb>
@@ -68,3 +68,6 @@ FILES:${PN} +=3D "${base_libdir}/security/* ${base_libdir=
}/ecryptfs/*"

 RDEPENDS:${PN} +=3D "cryptsetup"
 RRECOMMENDS:${PN} =3D "gettext-runtime"
+
+# Patch for CVE-2016-1572 is applied in version 109.
+CVE_CHECK_IGNORE +=3D "CVE-2016-1572"

Wouldn't it be better to report this to the NVD and do the fix in the datab=
ase instead?

Regards
Marta

--_000_TY2PR01MB328987D15AEBB3F92B6E6D5192199TY2PR01MB3289jpnp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"=1B$B#M#S=1B(B =1B$B%4%7%C%/=1B(B";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"=1B$B#M#S=1B(B =1B$B#P%4%7%C%/=1B(B";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@=1B$B#M#S=1B(B =1B$B%4%7%C%/=1B(B";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"\@=1B$B#M#S=1B(B =1B$B#P%4%7%C%/=1B(B";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"=1B$B#M#S=1B(B =1B$B#P%4%7%C%/=1B(B";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.18
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Arial",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"JA" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">Thank you for your comment.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">When I sent a mail to NVD about a data=
base modification request, this has been approved.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">NVD has made the appropriate modificat=
ions to reflect that the affected versions are up to (excluding) 109.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">So we can confirm that the website has=
 changed. The same is the data feeds.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><a href=3D"https://nvd.nist.gov/vuln/d=
etail/CVE-2016-1572">https://nvd.nist.gov/vuln/detail/CVE-2016-1572</a><o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif">Shinji<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Marta Rybczynska &lt;rybczynska@gmail.com&gt;
<br>
<b>Sent:</b> Friday, March 11, 2022 2:27 PM<br>
<b>To:</b> Matsunaga, Shinji/</span><span style=3D"font-size:11.0pt">=1B$B>=
>1J=1B(B</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&qu=
ot;,sans-serif">
</span><span style=3D"font-size:11.0pt">=1B$B?5;J=1B(B</span><span lang=3D"=
EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif=
"> &lt;shin.matsunaga@fujitsu.com&gt;<br>
<b>Cc:</b> OpenEmbedded Devel List &lt;openembedded-devel@lists.openembedde=
d.org&gt;<br>
<b>Subject:</b> Re: [oe] [PATCH] ecryptfs-utils: add CVE-2016-1572 to allow=
list<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Fri, Mar 11, 2022, 05:14 Mat=
sunaga-Shinji &lt;<a href=3D"mailto:shin.matsunaga@fujitsu.com">shin.matsun=
aga@fujitsu.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0m=
m 0mm 0mm 6.0pt;margin-left:4.8pt;margin-right:0mm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Patch for CVE-2016-1572 is appl=
ied in version 109.<br>
<br>
Signed-off-by: matsunaga-shinji &lt;<a href=3D"mailto:shin.matsunaga@fujits=
u.com" target=3D"_blank">shin.matsunaga@fujitsu.com</a>&gt;<br>
---<br>
&nbsp;recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" target=3D"_blank">ecryptfs-utils_111.bb</a> | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-uti=
ls_111.bb" target=3D"_blank">ecryptfs-utils_111.bb</a> b/recipes-security/e=
cryptfs-utils/<a href=3D"http://ecryptfs-utils_111.bb" target=3D"_blank">ec=
ryptfs-utils_111.bb</a><br>
index 9aefc32..d98724c 100644<br>
--- a/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" target=3D"_blank">ecryptfs-utils_111.bb</a><br>
+++ b/recipes-security/ecryptfs-utils/<a href=3D"http://ecryptfs-utils_111.=
bb" target=3D"_blank">ecryptfs-utils_111.bb</a><br>
@@ -68,3 +68,6 @@ FILES:${PN} +=3D &quot;${base_libdir}/security/* ${base_l=
ibdir}/ecryptfs/*&quot;<br>
<br>
&nbsp;RDEPENDS:${PN} +=3D &quot;cryptsetup&quot;<br>
&nbsp;RRECOMMENDS:${PN} =3D &quot;gettext-runtime&quot;<br>
+<br>
+# Patch for CVE-2016-1572 is applied in version 109.<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2016-1572&quot;<o:p></o:p></span></p>
</blockquote>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Wouldn't it be better to report=
 this to the NVD and do the fix in the database instead?<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Marta<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_TY2PR01MB328987D15AEBB3F92B6E6D5192199TY2PR01MB3289jpnp_--

