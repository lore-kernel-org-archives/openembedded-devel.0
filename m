Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web11.2506.1616570918340172212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 00:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=MJhZloFz;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.73, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZkRhViftnLEAdsrROpmvTzLEpdO3cKEXgnbabygy1I=;
 b=MJhZloFzsgig1TacKJ+7TYpMg7Nq3AwylszLKH/RGj+VMQpba2149hnrno1c7A1nGvC5YZcuyHz0X7U3ynvBgcIcChe5N1+8wko+YAcj+DQEG+yBPDMmSXonHcIkgQx5oikkh84BVwSfo826zaAIIIGaZfy+nljMatbCDshAhxA=
Received: from AS8PR04CA0038.eurprd04.prod.outlook.com (2603:10a6:20b:312::13)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 07:28:35 +0000
Received: from VE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::fe) by AS8PR04CA0038.outlook.office365.com
 (2603:10a6:20b:312::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 07:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT037.mail.protection.outlook.com (10.152.3.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 07:28:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 24 Mar 2021 07:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdpiJyxhRV+/CiJMyw3QvGAzCFMJmBpvcwyZeLoLE1JhFXb2SBzRi+elfjlvOyzQ726DkXN8/zjDMMX5PrpP85ReDa83Ll+Y9bH48+rWVk9clw/m3OOqX/fvqnIG0uA/hDfPKRM1thyOQArgVBZOC1yDq1WFPFcZNuHzB/YzI305BsmFhB29g2A98dvHoRdkYJC63TVtI96dF2gbu/i9L73A/hFbyVrLM+/7TawnE1jlWfmseRscbHrbBqlqO4QDshvq8y3NKuTWyD4Y0zX6mxprLy7h6XDB8iYhFr+roVwTEHKkzmlSazeEnR45cBOnhGPTdnpArXJP3Mb4zWjEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFg3Qr1RvD2Eb7ykEeNdLgbQMlM6hcPbIO0QAJIPxNY=;
 b=GnRFgE4d9oK95aHzfCm7cC73r2IdVqOe96WBwI6wqP7qBpwXWwlRLZhoo/feaFSlSKefeOdMRucLZ7BqtXmwDqtMpIT8a3DD1bBipyRnY4J/nAkAu1stw70trbB6YWsMcnX14tzGo+dnDGSddjLZvNZgYdjsTbTrpPWUsOZFq4CFl586XEwYlBQcQWWNktaNtZ6VCWpG2u6zRIgu9m+YaKBjaaX2wJOf2sgMuo24Fv4fBHWCkGbc6HUO2wvNG243QlBUcIaBXcB+AWoibvR3JgO6oelYciMT+GJ0ki3XF6+dsSnKMtJ6xz3Ei44y5ehBSpvEkPXyjm3jmnCj8pdZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB9PR04MB8267.eurprd04.prod.outlook.com (2603:10a6:10:24b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 07:28:27 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 07:28:27 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <166EA0EA5639ABCD.32074@lists.openembedded.org>
 <166F014747987FB1.18754@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <c79e14e9-4708-6404-87ce-ff71e3d44097@topic.nl>
Date: Wed, 24 Mar 2021 08:28:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166F014747987FB1.18754@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 07:28:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb19f94-0b30-47d0-d886-08d8ee966f16
X-MS-TrafficTypeDiagnostic: DB9PR04MB8267:|AM9PR04MB8397:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB839739726FD03EA5FF874BDB96639@AM9PR04MB8397.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jNlM8n0g6zQWfqqUyDV7TOw37+onHuQRKCnSpMIQDkGMfRCU6ltmbeWztMKtWGZtZ+xAeFWNsNx6KaHM8HbqZXbKpZuJ6X7EYxVt/Hn9m444P0xtNqHh6diw8EPdZRW1047DBfoW8VWEyggoh6wq4eUTyr+lpqDp23hpNMKkKJm8kuSDb8IvQHDqqsj2dZNz5j60d6zSmgEcFvXug0hlHsfROhS83OK5OhIxCnZsCTz0gfMYX5X56RuyDcwzql05d5Ka94tygU0RMPqNTfk+wRM1JSeEEBosoj+fUsuERKE6dPI7dU3fX9d7PlbwklDAhGY1WAToLuc4zotsQCVaZ1WmmQEzyGm7nZKawaleV/FxyBrgMSU4n03oFmWgEya1nYDgEaGPPe5jufwoXe9qpMB7dcqJEL3ZgIfhIo7Z84YVNl+IIWlmQtsv1FLb/XfkC1YFiusSHOZi1KE5Ka06WGc/7PM48xIbmOzKnF8WXhB7t746/ZDFAxmNCZsSZ554GYLVM+DFMWj6u5t1dq67SgIGZj3BWx/qWLXZZ1lsSU8k+FSrXOc2E9InMJHEo0PjO1CXEVB8yG5hKu6586s12bfBq7WGjIPfQ9EvUvDt7BqxyxtS1pNbYXX6pXNyyzoYNa0OEdZyLjffNwbjKbtBLMXNdVa40Xi4S9ptdIKsKT55c63NIWg8NfTcqdAz9+Sv48mfIsiFiNMfQ1KfJcMhoumMgzLL1UgTAmO97azDTFeo1s4IfwHeC5fs2tTTiD27KYiG1SzgP7e1HGPdwIcIzeYYI4bYFyIE4sUhSH1nHG+V+UZBKqdi0pn9SROFTj0t
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(39830400003)(136003)(2906002)(4326008)(8936002)(316002)(16576012)(53546011)(508600001)(26005)(6486002)(966005)(6916009)(36916002)(8676002)(52116002)(16526019)(42882007)(186003)(15974865002)(44832011)(2616005)(38100700001)(956004)(83380400001)(5660300002)(36756003)(31696002)(83170400001)(66476007)(66946007)(31686004)(66556008)(30864003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IstXPCLT/mIhce6UPFHRh383mXrnLOYYZd+/DMBy4jB0BbLIvvhnSFrcmt9Q?=
 =?us-ascii?Q?qeN6uqOrVHdhia+KBQ8AjNDtJi+3Yl4lvlCy+3i8iC7tcL2eXXblIyaY3qZp?=
 =?us-ascii?Q?md205Jq69aYcXgkBAsVGHk+S+vN5B62x27M8yhBAemJTOTodyD1qNntXBTHN?=
 =?us-ascii?Q?D50koQqYk5f9P3f+xZWF8JJhreyK/MXnuzhUMyg7nhsxsSH40DoHFJwOAmh/?=
 =?us-ascii?Q?tKagezkec1RI69hdkP42+fSh9h0aoKoQSW1ZUIhVm67B2/IikI5FlNAXqYeM?=
 =?us-ascii?Q?vYr6aEQNKED4f0ygmfD20lRtKkl5n/uqO6yC3rr/AWPnna2b/PNx1bxjG/0T?=
 =?us-ascii?Q?0deMGQpguphL/QtDe/2Clns4i24V8AmfEzdm8V3UluBv44RVKXj0eZa7gkcD?=
 =?us-ascii?Q?DhycZhqJ2EN7lKMnsCuyH/V0qDesD7GGWRqKkRWyrlBZM6T/+2iozFT1NaW9?=
 =?us-ascii?Q?L0Racf54gOO/0D7M9pzu7WS5M0/nGeQg8i7lDosMDjFeUZQNNPvo1FvkAgno?=
 =?us-ascii?Q?6GPBYFjaLKaucb7n2EZciJO/y467QBkFlX3ZSHN5LO/lB33sqi7Cq7fYH1fL?=
 =?us-ascii?Q?aSRCjxZ9Jzk8lPRd5dmDdfzK+x+9JFK+ydPYFubod49kSqffbZA9XxOpKS5N?=
 =?us-ascii?Q?HaodenJubp/Qkq/9gXK9Q7x1L/hy+cN4pXkNT00r+LhnGGdgtz7aPOve7xG8?=
 =?us-ascii?Q?pbqsvYkbGwrxXiNOjXIVQQ59uDaZCzqEzbNwE1wAZr9ffG5Bpj61bAjQmZZs?=
 =?us-ascii?Q?QF+Drjebzr1MroB4vvX8dGaUB9JIBqczlpdO/3FS8X4lF5JUYZzhTMMGaGvr?=
 =?us-ascii?Q?25t2zSd6+7eMZ66T5vlPhK4KjARXr9zBPmTm2o+fTidDL+HzEsqbkyf55xNV?=
 =?us-ascii?Q?WtsvS9N+iUVvrVm1j4HY1ZX+8uIkTq9NTll1yls7FLXGnMD6eAfhIyaCRNlW?=
 =?us-ascii?Q?UI8bldHyAqA5eYpp5tqnqBmec/S9BPvBxUMllOrmZxsgw3A4EUGT6BoOvbby?=
 =?us-ascii?Q?5JI2ye36r//OruUvwGXFFw/TK0DmeO6RIkC/vNedj7BHN16/+Pv8e5WFzMha?=
 =?us-ascii?Q?51XJwaAwNBAOohQYEQN08djBV6TLF1YACDuQLIL6bk29+8vlQcYbeQmo3HIA?=
 =?us-ascii?Q?+1+8zoOUMJeU3179xK3Gv1v/0VQe84fMH1HsLYHbJyZLpBQo5BmWRCvC3rsZ?=
 =?us-ascii?Q?4xS0XPzliMLjfedHYIoX7cx7WKgGYHFyKaWoWKR7MrhMM0EmDM4jBIJJ04Iv?=
 =?us-ascii?Q?yw+lYqrnMfK9/LRZNYjuQX0doC3E2hUR+va0+vHy0g6V/1ozKPXEm2wNRECs?=
 =?us-ascii?Q?mzIO0RUw4GZj9W9v91RoI3yR?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8267
X-CodeTwo-MessageID: ab70a9dc-4c33-4da1-b5e0-e37e0ea46e5e.20210324072833@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c05bb7eb-b99c-4933-f2d6-08d8ee966a00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I6lXmtRfq3xETQwuva+ONHFexozgFRcY57P4wJbcw3smJQEZzYXu2AEi57AkgcuE8BPAogR4PTiF0zSPK4PspGm/vkqb3V5NvUMUmaD8NSS3BKveWDe5PZgV2NEmPjF6uh58xmkydx9xpjFk83KMkIPDpu6RVkAMGAyDZXOOJwDGLwPEE+dozQOVms9fZq3uHo8GRv9otXqLejuMEF3yCx952slKEYnuU3TfdtVpTFPZj2y7a1mmQtGl2Gk4qMTiaY7oGVqCqLdmwTUBHLmBkuvH9Zc6kr6rwG2ZuZM+gGkJbDv00J/fdBX1B+x019dlr9FS2l+AIGXSh96ZsSXw2Zf8+DHY7J7dnatPlRkesixFt5plrHknW0dBtVvZwPhhFEYaRwS4BdUmKBv9WoqkhrcCniWXsYPONSEuMeFa3+sNVO85+wMTC0lOgoxXi2SlZwGlqzZrioOlpOIHLCGtC8IG/6Xj7d7yTDfl66JtwtPMfza+zQkERtNbJNijjdJcVBhZ5/WXTBI4iCs1GfCLHrmv5UbouwKKWTVm2iog7PTvoYQc2NIvsEWVFSQAxI68xHAFKe3UbCPKe3DXy/mhWncD0eX3QUZ7TPW8gnl9pZXmWB8Pa4+XtgtRw18pBBURev0jrSg0+6bfPfTLjliV/Laxu6GMkFOLIeoH85G5uPyI2NESs2rc3EjQNlHhhqM3cZUDXOkNxtCFlRPE7BTtpHFfqrD+5AqRxM9wE8++URe9Fwv52Ut7oR9eVJznYJIC0J3g5RN+Wsp2g5X7e+8xRxtou/3JmppNw58xK81TM9M=
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(39830400003)(46966006)(36840700001)(478600001)(36916002)(8676002)(186003)(16526019)(6916009)(36756003)(53546011)(316002)(47076005)(16576012)(15974865002)(5660300002)(8936002)(30864003)(42882007)(44832011)(966005)(36860700001)(2616005)(336012)(956004)(26005)(4326008)(6486002)(31686004)(2906002)(70206006)(83380400001)(83170400001)(7596003)(7636003)(31696002)(82310400003)(356005)(70586007)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:28:34.8318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb19f94-0b30-47d0-d886-08d8ee966f16
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Been digging into this, something weird is going on with the TOPDIR=20
environment.

recipes-core/openjdk/openjdk-8-common.inc:
do_configure_prepend () {
 =C2=A0=C2=A0=C2=A0 export TOPDIR=3D${S}
}

So TOPDIR should be set okay, but in the logging one can see that the=20
autoconf tools do not expand it.

Bluntly adding the following line:
 =C2=A0=C2=A0=C2=A0 mkdir $TOPDIR/common/autoconf/build-aux

Errors out with an error that this path already exists.

So it's something askew in the shell environment handling, but I cannot=20
figure out what is going on here.




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 23-03-2021 16:09, Mike Looijmans via lists.openembedded.org wrote:
> In a desperate attempt to get openjre-8 to build, I just went to the=20
> current master, and that failed to build with lots of warnings about=20
> "inherit native". I noticed that those were fixed in master-next, so I=
=20
> switched to that instead. Still fails to build after a looooong time.=20
> (I replaced some private path details with '...')
>
> These are the GIT hashes are reported by OE.
>
> meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:69f8f3e21324223c8e68a34db156e4472=
acfba6d"
> meta-oe
> meta-python
> meta-multimedia
> meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:589aa162cead42ac=
dd7e8dbd7c0243b95e341f19"
> meta-java=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 =3D "HEAD:db9a58bb71fffdb74eb9850978a643a98ff13323"
> meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "HEAD:324843cb1a2feb5f5c7b0064ca33edaa605cb749"
> meta-raspberrypi=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:a3cda589508a9b56ea803=
cdd31e870481fc27132"
> meta-swupdate=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "HEAD:065aaf=
a41cff44985170b9ff6170ff9f87007b7f"
>
>
> Log data follows:
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',=20
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are=20
> ['virtual:native:/home/.../oe-core/meta/recipes-support/libxslt/libxslt_=
1.1.34.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-connectivity/openssl/open=
ssl_1.1.1j.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-core/glib-2.0/glib-2.0_2.=
66.7.bb:do_populate_sysroot',=20
> '/home/.../oe-core/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb=
:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/pkgconfig/pkgcon=
fig_git.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/fontconfig/fontc=
onfig_2.13.1.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/jpeg/libjpeg-tur=
bo_2.0.6.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../meta-oe/meta-oe/recipes-devtools/giflib/giflib=
_5.1.4.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-support/ca-certificates/c=
a-certificates_20210119.bb:do_populate_sysroot',=20
> '/home/.../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_po=
pulate_sysroot',=20
> '/home/.../meta-java/recipes-core/ant/ant-native_1.8.1.bb:do_populate_sy=
sroot',=20
> '/home/.../oe-core/meta/recipes-core/gettext/gettext-minimal-native_0.21=
.bb:do_populate_sysroot',=20
> '/home/.../oe-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_p=
opulate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-multimedia/libpng/libpng_=
1.6.37.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/make/make_4.3.bb=
:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-core/zlib/zlib_1.2.11.bb:=
do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/automake/automak=
e_1.16.2.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-devtools/autoconf/autocon=
f_2.71.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-graphics/freetype/freetyp=
e_2.10.4.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-extended/unzip/unzip_6.0.=
bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-extended/zip/zip_3.0.bb:d=
o_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-core/coreutils/coreutils_=
8.32.bb:do_populate_sysroot',=20
> 'virtual:native:/home/.../oe-core/meta/recipes-support/attr/attr_2.4.48.=
bb:do_populate_sysroot']=20
>
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['libxslt-native',=20
> 'openssl-native', 'glib-2.0-native', 'libtool-native',=20
> 'pkgconfig-native', 'fontconfig-native', 'libjpeg-turbo-native',=20
> 'giflib-native', 'ca-certificates-native', 'icedtea7-native',=20
> 'ant-native', 'gettext-minimal-native', 'quilt-native',=20
> 'libpng-native', 'make-native', 'zlib-native', 'automake-native',=20
> 'autoconf-native', 'freetype-native', 'unzip-native', 'zip-native',=20
> 'coreutils-native', 'attr-native', 'libxml2-native', 'ninja-native',=20
> 'xz-native', 'gettext-native', 'util-linux-native', 'gtk-doc-native',=20
> 'libpcre-native', 'libffi-native', 'meson-native', 'python3-native',=20
> 'texinfo-dummy-native', 'expat-native', 'gperf-native',=20
> 'cmake-native', 'rhino-native', 'xorgproto-native',=20
> 'classpath-native', 'ecj-bootstrap-native', 'jamvm-native',=20
> 'libxt-native', 'libxrender-native', 'libxext-native',=20
> 'libx11-native', 'bcel-native', 'xerces-j-native', 'gnujaf-native',=20
> 'commons-logging-native', 'log4j1.2-native', 'oro-native',=20
> 'bsf-native', 'fastjar-native', 'jdepend-native', 'regexp-native',=20
> 'xml-commons-resolver1.1-native', 'gnumail-native', 'xalan-j-native',=20
> 'commons-net-native', 'junit-native', 'antlr-native', 'jsch-native',=20
> 'm4-native', 'gnu-config-native', 're2c-native', 'libcap-ng-native',=20
> 'ncurses-native', 'libpcre2-native', 'python3-setuptools-native',=20
> 'readline-native', 'sqlite3-native', 'gdbm-native', 'libtirpc-native',=
=20
> 'libnsl2-native', 'bzip2-native', 'curl-native',=20
> 'libecj-bootstrap-native', 'util-macros-native', 'libxdmcp-native',=20
> 'libxcb-native', 'libsm-native', 'xtrans-native', 'jaxp1.3-native',=20
> 'logkit-native', 'servlet2.3-native', 'jacl-native', 'inetlib-native',=
=20
> 'cup-native', 'jlex-native', 'jzlib-native', 'xcb-proto-native',=20
> 'libpthread-stubs-native', 'libxau-native', 'libice-native',=20
> 'avalon-framework-api-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.16.2
> | Copyright (C) 2020 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later=20
> <https://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <ad=
l@gnu.org>.
> | AUTOV is 1.16
> | NOTE: Executing ACLOCAL=3D"aclocal=20
> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-n=
ative/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8=
-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16"=20
> autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint=20
> --exclude=3Dgtkdocize -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/=20
> -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/build-aux/
> | autoreconf: export WARNINGS=3Dcross,no-obsolete
> | autoreconf: Entering directory '.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal=20
> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-n=
ative/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8=
-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
> -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/=20
> -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: configure.ac: tracing
> | autoreconf: configure.ac: creating directory=20
> $TOPDIR/common/autoconf/build-aux
> | autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux:=20
> No such file or directory
> | autoreconf: configure.ac: not using Libtool
> | autoreconf: configure.ac: not using Intltool
> | autoreconf: configure.ac: not using Gtkdoc
> | autoreconf: running:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoconf=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: running:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoheader=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: configure.ac: not using Automake
> | Error in tempfile() using template=20
> $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
> ($TOPDIR/common/autoconf/build-aux/) does not exist at=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoreconf=20
> line 411.
> | ERROR: autoreconf execution failed.
> | WARNING:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646:284=20
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 284
> | =C2=A0=C2=A0=C2=A0 #2: die,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 274
> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 236
> | =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 160
> | =C2=A0=C2=A0=C2=A0 #5: main,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 298
> | ERROR: Execution of=20
> '/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/tem=
p/run.do_configure.16646'=20
> failed with exit code 1:
> | automake (GNU automake) 1.16.2
> | Copyright (C) 2020 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later=20
> <https://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and Alexandre Duret-Lutz <ad=
l@gnu.org>.
> | AUTOV is 1.16
> | autoreconf: export WARNINGS=3Dcross,no-obsolete
> | autoreconf: Entering directory '.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal=20
> --system-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-n=
ative/272-r0/recipe-sysroot-native/usr/share/aclocal/=20
> --automake-acdir=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8=
-native/272-r0/recipe-sysroot-native/usr/share/aclocal-1.16=20
> -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/=20
> -I=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/jdk8=
u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: configure.ac: tracing
> | autoreconf: configure.ac: creating directory=20
> $TOPDIR/common/autoconf/build-aux
> | autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux:=20
> No such file or directory
> | autoreconf: configure.ac: not using Libtool
> | autoreconf: configure.ac: not using Intltool
> | autoreconf: configure.ac: not using Gtkdoc
> | autoreconf: running:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoconf=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: running:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoheader=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/=20
> --include=3D/home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/272-r0/jdk8u-jdk8u272-ga/common/autoconf/build-aux/=20
> --force
> | autoreconf: configure.ac: not using Automake
> | Error in tempfile() using template=20
> $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX: Parent directory=20
> ($TOPDIR/common/autoconf/build-aux/) does not exist at=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/reci=
pe-sysroot-native/usr/bin/autoreconf=20
> line 411.
> | WARNING:=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646:284=20
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 284
> | =C2=A0=C2=A0=C2=A0 #2: die,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 274
> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 236
> | =C2=A0=C2=A0=C2=A0 #4: do_configure,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 160
> | =C2=A0=C2=A0=C2=A0 #5: main,=20
> /home/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/272-r0/temp=
/run.do_configure.16646,=20
> line 298
> |
> | Backtrace (metadata-relative locations):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /home/.../oe-core/meta/classes/log=
ging.bbclass,=20
> line 72
> | =C2=A0=C2=A0=C2=A0 #2: die, /home/.../oe-core/meta/classes/base.bbclas=
s, line 56
> | =C2=A0=C2=A0=C2=A0 #3: autotools_do_configure,=20
> /home/.../oe-core/meta/classes/autotools.bbclass, line 224
> | =C2=A0=C2=A0=C2=A0 #4: do_configure, autogenerated, line 6
> ERROR: Task=20
> (/home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_con=
figure)=20
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4517 tasks of which 4312 didn't need to=
=20
> be rerun and 1 failed.
>
> Summary: 1 task failed:
> /home/.../meta-java/recipes-core/openjdk/openjdk-8-native_272.bb:do_conf=
igure=20
>
>
>
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
>=20
>

--=20
Mike Looijmans

