Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.45])
 by mx.groups.io with SMTP id smtpd.web08.10360.1616406241892077518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 02:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=cG2eAoSJ;
 spf=pass (domain: topicproducts.com, ip: 40.107.2.45, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho8YrKlmqTaDKF+OsmyEd+Yho4wn9syOnJq1aIQMGU0=;
 b=cG2eAoSJ49NUYZGN8jr9uTyQl/UCZnuuneTNFPn+OiOR9pj95JMngA171a1AKVk9rDciJeFpFCSPGZekImWnU8ebZXGGqzN79q1bcHidldVXFjBzfohD3yx5+VdLULfzg4+YX2OEo7A7oujXHad55rvcwtNVL2AqiIt/35HHEE8=
Received: from AM6PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::44) by DB7PR04MB5548.eurprd04.prod.outlook.com
 (2603:10a6:10:8c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:43:59 +0000
Received: from HE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::d6) by AM6PR01CA0067.outlook.office365.com
 (2603:10a6:20b:e0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 09:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT025.mail.protection.outlook.com (10.152.0.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:43:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.105) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 09:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dql7OLtXKj040g9OfAyx3xPdaCQ2VXYpY439j2YK87O070FTSLkvu4viyG0CefpnlU4KLjuoK0sl7xWfIUGvDYPuKjca5b9VZ3Lo/SF9KYNm7Z0O4gdGHNLwGHoB1FlShC4f6AIN3sZ0rshiE+OliQc5w2+T92PiGYuFfHiHY0KTi1hCl04bEJ4doFT/vyQVxtuA2MxT48nID/cNer/xvdiIMgV95NcFlMC3VUrizd/3bKI+biVVq9HevOSt9CiyfnRpzkKA5+xIDkwGiZzINkkKmmAhNTSMDA37pV6TpJfrCis/kcryGSachvz2sq6kMRC26BRKkdNeXiLhQF3/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huT+XbFZdwwYxqzkQzWZolaOvkxji3POgZ3uRqeqz9A=;
 b=VGteADXbDcY5XUz6bZq4xiUep8+iMd+xUqPk+Xdz1wWPHeurTLaijlFkAcfQ4TNkDY9+4w9+rt7eYkvf/zbzapdNi6fWnUNr1j1UdWqLtiqshKdCaSvIgggqrJmPtsQD8pIQXkWAaKQKCasTL8Z1PXgl7JBk0gVudtUYLH2h7lwQcdaJ26OUqaCtqOOYDOCCxuTykI0cbq7K+A1akJnL3sxWFOclCX7vpjavNZj+Gg2zNrS9XihWXfvk8pxY2QdFcvkTow2sp4G1fMT5204UbAAUxVfpNh+uK8e6L8iUwJNATo8+GGTCEHtdK+/gP1CVEQ8PfGDA47KIwEzUGaRtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB5097.eurprd04.prod.outlook.com (2603:10a6:10:15::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:43:55 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 09:43:54 +0000
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Subject: [meta-java] openjre8 fails to compile on aarch64
To: openembedded-devel@lists.openembedded.org
Organization: Topic
Message-ID: <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl>
Date: Mon, 22 Mar 2021 10:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR03CA0044.eurprd03.prod.outlook.com (2603:10a6:208::21)
 To DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR03CA0044.eurprd03.prod.outlook.com (2603:10a6:208::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:43:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273bfe56-591a-4fd4-2915-08d8ed170442
X-MS-TrafficTypeDiagnostic: DB7PR04MB5097:|DB7PR04MB5548:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB554885F3E01EA6FFF5988C2396659@DB7PR04MB5548.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aQD3BjHlhgOBi0RZMCqB59UCNfjcYDGrCu08J29chiIRnV4UVAVI8xorUkdN9mrhuSxfyUHULFEgxuqzVRezbIFh3fQmAf6hay3KjlvrE4mI/Av4VOF/wyk5VzP8ttmbMyUEYWbUt7BgQkVck5XBu6Tbf6XGI/BB9PqMw2bb8GKRICU7r7u0ZXg4Yxx+zN18Qld6YRwFFHNZlOqXQ3iNsdSKhktV5rxd1tWHqqCTAotOCsid9rG8JkVdgtniqYEmxt9LSgFVapLfShRUpOg2SpeaB1uHwywUQLom6BRhPzhJCZSn3sJQnovUoKp1RstsSR09CN78XGY+ZlhYv2XSG34W7ABaE8Hwnaq5Le2cDFI+L9BPjBKk8ICgC4LJAjgWEK2ja+w0JhHvGuCbTntclIoGfXiJqj7k17Kfz0ePS+05cCBf1kE05V276CL2U1/V//1K8u42hdJOY0mfIe3NofzcT9COcBLuNvKK5U8WVXocnCMjJR0SGHmSoTu7a9Cn0Uvpf40PzmeYeS2siQXXtuMQq156rqKoVJB4UXD0abnQPLHvYh22gPZkkdvDM/BFFoavX2rAJVqarjvhHOKGW+EIq55quz0tRZrb5/AngYR1D5ZVfM5EB6BM+5N9XhHBoJQPsPkOojYA1JWhS3TTR2nN3HBjlSqvYGDs7gV3ZLDBRk50NrobMEidM0q+1f+j5U2bcJU9HUSkHiWeM5E3wmaTfq9JB2VPFkzSK2hXCcs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(366004)(346002)(36916002)(31686004)(52116002)(6916009)(8676002)(6486002)(8936002)(31696002)(38100700001)(44832011)(956004)(2616005)(5660300002)(66556008)(66476007)(478600001)(66946007)(2906002)(42882007)(26005)(83170400001)(83380400001)(16576012)(316002)(36756003)(16526019)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HIrVOYdzr7KA4rvLSx0PsXw51mR+7Znzm5/zxecMJ9/gshHLKkSndX7kFCts?=
 =?us-ascii?Q?Jh3E5mlTqQ9CzmsTFAAuvJ2JUXjHHfV1PnGm+QkhApF4X6IoPqBsDMBQI8TE?=
 =?us-ascii?Q?aCf5Brzk8Cllgk5knt5Boykm/vq8TM5s7baR82V701g6MwcwBY12BKPQsn4/?=
 =?us-ascii?Q?QH+637N96/M84/5r7DBB0kg2rrWbUB5Yh+JRWZF6bUZ+HXDtyYDXfV/TMCvm?=
 =?us-ascii?Q?WQTB46YsCeH5Piaincklk3M8OVooRkRynzBfbU52KfLVrMqjV7PrGYAQn5ma?=
 =?us-ascii?Q?c4m4ktuF9LRg4UjooyfAuxReAqBW/gQCm5BBUjADGlBiARJwsMZZVKAbRghR?=
 =?us-ascii?Q?52Q0CBFpDMi07B080fRerzCmolG2eaGV7XAGDxXJyDLY4CbCpSUah0+Tjb7t?=
 =?us-ascii?Q?+5Yzp50Y3YZnI7X2sk15ttUUYDMg+SQG3q008EAWLbfnorlVLmaklFSdSb0O?=
 =?us-ascii?Q?Wk5fNrQaHzQzfwltwHwde3Y9ltsZapLCs7e60gXaiC8K+kSC6nXy0hxK9Zzl?=
 =?us-ascii?Q?JFNZRqRHun73mmhP/I9GUVVElHKzJpd/NGYDhElp6thpzqM3n66TDdekc+vQ?=
 =?us-ascii?Q?l1eC7swUJ5vESsqTO/qzRmRNR0Ov4YVqzTJtOMsBVqP4Z8WtyaQWQ6soHEpN?=
 =?us-ascii?Q?todhNNkkn5YvriN8zH0G6HejKQYTNlAqCtMscZmSDnskBAkCUlbdsDVyA1+O?=
 =?us-ascii?Q?krhoogxg5Kpga9/OtNuYkO1SgVLdHPaQMyrlq/4I0SRcHBwbHDHL0b9fEDt6?=
 =?us-ascii?Q?cDYzgmckH4y/u53E1NecJjMCyha6v7TtZFcH8LzT684LomFpTME39i+PiH1N?=
 =?us-ascii?Q?eL9zX7ipyZMV61I3Y0oUt67NvvW3qsH+809nqw630OqK0IbfPLKoWic1ZKW1?=
 =?us-ascii?Q?FOU/1FXDqr5hXpVjIM1jfbTD6v98Yy6DFtMBnxFdllwnqdWqxuIpPXvqKmMt?=
 =?us-ascii?Q?hHZjpZlfWeZxZXYVKbRbNp20Lq6sV7hZ2MnJm9nZNjvXVNj/oGisoqDDr/+A?=
 =?us-ascii?Q?WwqY1S2NTX6heargfaSgRbnYg65evJHJD7XRQFIR88Yvbq9iUa+N9x9Cf0bq?=
 =?us-ascii?Q?zpQhNUAYSM8Bh2ndfo5F01YbPJEn4MnxebTz+0Bii/Qipm3vttoU+vAWavpu?=
 =?us-ascii?Q?2vfdWGQ6ZQ3nlM//BhokpivdX8TPUwJJb2Kp01yod5Z8GxdM0ISQ69or0ttz?=
 =?us-ascii?Q?TMOcQCC8vfLUsS0U61kZh9lqVMgNLX6isSWVE40tLpaHrOgqwSdZ9D1q9VgC?=
 =?us-ascii?Q?L6Bd8z7XG0SltlH6d9anQiQJr1/BB9obBCkurjpZg9p6exH2LRNLU0oLOIy0?=
 =?us-ascii?Q?M1diRkmADVUE3ZvnY6M2009X?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5097
X-CodeTwo-MessageID: d8c6a9dd-a180-4b96-88ca-9a38046e8fbb.20210322094357@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f24490c-d3b9-4961-dedc-08d8ed17020f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Oz01vwXjqKyGb5KkhLEY/dG+CU2AsbO03oFdbKIHXo2Stl88J4ynBuJUKc+gR3BEs2thL5WKr+svzb54DpvJJhPWS1ZelpCkGTHCBShWfVHEK+BCyYysOp0HSqI39GPiHBRkj/JgKIDA8YnBFIzNVqSFoQ53nJgIEu4EmuhtXAbZ7peOw7yeWg0VTFPdkLXA9UYvZg6hceECO2aoT5BapqpSe3uo72FYkGzpNFQuSzeTz/4sfZR30Aebe9uQNE1uxmvRNtibA/2HCXhTH+8xW9382sNWlY0HtYeIO9Asl7QXUcTu7jX1PhNYXVculFDTcED8x7KW/SXtyiVFoAWSUnL1cMHko9ZyNSF5w80a/I9nRrQhN/f36EQsND6F7AcMN7aZLCfsqzrGrEuOvsOsNhKon9mpia0/lq5KOWFl5yXI2R4MdUof1Ij5ivVDIFPSUkdThe8V+rQO67kBFY7g49sliHdPaDB7g7ErAIMR2SXmCDKOZXqbxxBmiN/pG/+uZ4ExqWV4oJuVJS8vimYyuDXoW2lRArPTLEfmEvN/3upB5vVq2oxtJNS3fhG2Qq3lESyxRZ5nNmYDQCGoVXcvGqIsx6zzypx2ZW9RiWgGVTX4zRMF6S0xjlkYRyU+v4maPr10W8xRvpWPu9rpUO9SIj1qgQNJ1uC4xagah7f3PNzDOQqKDNdW2Iq4hBefALgL3lK4Agj2gdbVYNE9DTg9q0ZhlPhFMPiu3yp1STif80eUzwmBVnvkdgDuPpgibt4aMDuLS7nBf3rFyHomsF7FtA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(136003)(376002)(396003)(39830400003)(346002)(46966006)(36840700001)(36860700001)(336012)(44832011)(15974865002)(47076005)(42882007)(16576012)(36916002)(31686004)(8936002)(31696002)(2906002)(83380400001)(6916009)(8676002)(70586007)(7596003)(6486002)(83170400001)(186003)(16526019)(36756003)(478600001)(70206006)(7636003)(5660300002)(2616005)(956004)(356005)(26005)(316002)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:43:58.3870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 273bfe56-591a-4fd4-2915-08d8ed170442
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5548
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I cannot get openjre8 to compile. Any ideas what the real issue is?

Compile for 32-bit ARM is okay, but building for aarch64 fails:

...
| g++: error: unrecognized command line option=20
=E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/=
openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
| g++: error: unrecognized command line option=20
=E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/=
openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.make:=
228:=20
recipe for target '../generated/adfiles/output_c.o' failed
| make[6]: *** [../generated/adfiles/output_c.o] Error 1
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.make:=
228:=20
recipe for target '../generated/adfiles/main.o' failed
| make[6]: *** [../generated/adfiles/main.o] Error 1
| g++: error: unrecognized command line option=20
=E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/=
openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.make:=
228:=20
recipe for target '../generated/adfiles/output_h.o' failed
| make[6]: *** [../generated/adfiles/output_h.o] Error 1
| make[5]: *** [ad_stuff] Error 2
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/top.make:9=
1:=20
recipe for target 'ad_stuff' failed
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284:=20
recipe for target 'product' failed
| make[4]: *** [product] Error 2
| Makefile:230: recipe for target 'generic_build2' failed
| make[3]: *** [generic_build2] Error 2
| make[2]: *** [product] Error 2
| Makefile:177: recipe for target 'product' failed
| HotspotWrapper.gmk:44: recipe for target=20
'/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/build/hotspo=
t/_hotspot.timestamp'=20
failed
| make[1]: ***=20
[/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/build/hotspo=
t/_hotspot.timestamp]=20
Error 2
|=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-shenand=
oah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:=20
recipe for target 'hotspot-only' failed
| make: *** [hotspot-only] Error 2
| WARNING:=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267:189=20
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 189
| =C2=A0=C2=A0=C2=A0 #2: die,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 179
| =C2=A0=C2=A0=C2=A0 #3: oe_runmake,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 168
| =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 163
| =C2=A0=C2=A0=C2=A0 #5: do_compile,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 158
| =C2=A0=C2=A0=C2=A0 #6: main,=20
/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_c=
ompile.9267,=20
line 202
|
| Backtrace (metadata-relative locations):
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/logging.bbc=
lass, line 72
| =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass, line =
56
| =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.bbclass=
, line 65
| =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
/.../oe-core/meta/classes/autotools.bbclass, line 243
| =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
ERROR: Task=20
(/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile) failed=20
with exit code '1'

--=20
Mike Looijmans


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
