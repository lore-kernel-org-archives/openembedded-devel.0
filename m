Return-Path: <mathieu.anquetin@groupe-cahors.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94886C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:30:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web11.6554.1699349448504629362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@GROUPECAHORS.onmicrosoft.com header.s=selector2-GROUPECAHORS-onmicrosoft-com header.b=d9d8pOIS;
 spf=pass (domain: groupe-cahors.com, ip: 40.107.7.55, mailfrom: mathieu.anquetin@groupe-cahors.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+HwU2FH4k/JwLWi2d0wRy5UylAAH8W/FcKLG3pvaYNoxb+OJGf/jQGnejqjc2HyqeZUrSqLgVPzu248YbK0DxYrLP0RhjueF7NugeGq1b1ET6SD383WyYKREceMGx8Lo0mcOyq9xOO3vy+B89xary1BHhOajuT8FB4r855C4UHZtGTxdw8cXAYDUjJklRHXMH7g954qQWjmLFsp/7yh8PA3z7pHrhgQm7dzTri0t29chzhwwNM4EO+mE1LmxyPrCk6WsMikMHVLrdRpXyGKs/KMeleE6xLiCbxpL04XGF/chjiKcgURFXpY6Bplfa9AwrLOhphaWWdzw/N7Mlb8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA1Kzyd0HmNxAZeSbeCzMnovW7lFjQK5chSYeldyyUM=;
 b=ivJzaoG6i/WUf1VCnrdUhZZdtNsDRUvVzkLjMrM0OasUfsduP+MAOY/sXq3VtHVi/kap6JYfk/a5P3hc/aj53t/2AveAVufyPnpRXc25cqBEicYluaAIFVctwsBNjMvnzfghtuTSbr+lI/DCn3Y3kgnT2b8zNybQetPPJT6geVqfQaBHADoZ+Mz5w/PRaezwHNPYE4vTwP0KREowPaHiphTG5zGD3Jrn0V8PFWtLFQ1r6WAEPGL24KZ9IQTzOeAPykGnMA2RYmzVveuJGk2Y3d7pVH6R0aaY2boyCnHSqSZl7hDxcvTbT8axTrnVBAyGUEi33Y2fUqCwHmXUInyUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=groupe-cahors.com; dmarc=pass action=none
 header.from=groupe-cahors.com; dkim=pass header.d=groupe-cahors.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=GROUPECAHORS.onmicrosoft.com; s=selector2-GROUPECAHORS-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA1Kzyd0HmNxAZeSbeCzMnovW7lFjQK5chSYeldyyUM=;
 b=d9d8pOIS5AzorF+knOkfL4q/obaNMxGjdQc0PNhyLmTGchbYkZh1JKvKjr4JGFSJzryY8/igIuCr7vQ/AfbQqtk/Sv0s/PrI/gVTBcQPsK1XDjSWVQACi62jn55RRQm6K12B2PPkpHkT8yDciQBv1o9CvXFEWreLuplctSrOwak=
Received: from AS4P251MB1013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:588::13)
 by PAXP251MB0621.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:28b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 09:30:45 +0000
Received: from AS4P251MB1013.EURP251.PROD.OUTLOOK.COM
 ([fe80::8b37:cbdb:fb4b:efc]) by AS4P251MB1013.EURP251.PROD.OUTLOOK.COM
 ([fe80::8b37:cbdb:fb4b:efc%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 09:30:44 +0000
From: ANQUETIN Mathieu <mathieu.anquetin@groupe-cahors.com>
To: "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [RFC] Support for alternative init systems
Thread-Topic: [RFC] Support for alternative init systems
Thread-Index: AQHaEVzaZ9J97SR5eE21kPcXpoCmjw==
Date: Tue, 7 Nov 2023 09:30:44 +0000
Message-ID: 
 <AS4P251MB101352FEDFB9A83CA5454B3EDCA9A@AS4P251MB1013.EURP251.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=groupe-cahors.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB1013:EE_|PAXP251MB0621:EE_
x-ms-office365-filtering-correlation-id: d6bc5498-db61-4b74-e165-08dbdf7437df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7Fg3PK8CcWRBaXmY/kos887uCfVZI0uEdr7QLY7ffOVeXwDYmApuMF/RMt9rCA2Mc0tcvSNiKhXbp/xpKY4JQRxz8cKxbkbweOx+Orkmo9DdIHA0/yNZSbPCNMed3OGR+hUhQiC7T9ExKUUGiTmCmVP2wNBjJ+Y7zEUcRMlBVTrq+8YucLnDbwsxinJcJaaDlQgrFp0vD4F/bSZeBJ6DRSX+DqRDV7TOa9bY2/rUGrD7RdHAX5BrPB4e6driqEGwDr7rgvwrTbkaJ67fVcHubBnH98mclvNKB266eNvAKvFPtLV/+hGv/ll40DyvTZCbwUcqEotRWGp9zCYTlgCgPqmPuBXUDkhPDGHziwanX3H0iM0b5kK4AxmAwoYurcJiGbHzAZOyTwTLO4Y92YGOqXeHWlXc0pJUjLl0lvOgtCHr5nuLh9xzX9S+FNrgrWYSkYZiNud4eeTPRVQ6tpaorYZJpcvZzqpc3D+bYsxndoKuMyPMEFSiR2sU66mbxa4I4NGp3Qez841xNN/jWqN7Qlq2Lbmc98cCrjZGdImzkBRxQw2o621GFJDyUmfC7C40+nIrYaR/lctIsmrr0hzSZCEpah1nef4GipFRP8nlOfWDZRv6KuOB8LimVELlo0h3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P251MB1013.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(366004)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6916009)(122000001)(478600001)(91956017)(71200400001)(7696005)(66446008)(6506007)(64756008)(66476007)(66946007)(9686003)(76116006)(38100700002)(66556008)(5660300002)(86362001)(2906002)(8676002)(52536014)(33656002)(450100002)(4326008)(41300700001)(38070700009)(8936002)(316002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FAteHtV08AfcCrXcUvudVjeQO+jY6JNoWZFLQ3N6UdS450TJI2GIHdaLv0?=
 =?iso-8859-1?Q?stkh006R5lMI5iBS8A5ZymCQhZ+/2AQnGUF3K+nuT4x9B8FJ4VV5ONaasq?=
 =?iso-8859-1?Q?Lnwi7S4AinMN3piY13BoZYy0uEbfnpvQOUVRszlvtgPQgSNu6RAz1GOwDY?=
 =?iso-8859-1?Q?xvUtCdlMnRJeKJr2Om77ZR6GuZ9GBt6b/nPYoUcyB8OGkrrX1jqSDmIU7Q?=
 =?iso-8859-1?Q?3dLmhl1UvKNLoqTgC1/QGkMXrYTl9l5EGm/q7LSWh1eR/QT9SUT55umlgK?=
 =?iso-8859-1?Q?YulxuEzhz9omqZRdDXxpwZAkfOSQ4yRbr32doq9w89k6aixAXX68J3YYY5?=
 =?iso-8859-1?Q?GTAocFRTmhCn6oJPpMg1HYCbHsm9wUxDMHFWb97t61kB37RqwsqaxNBUK0?=
 =?iso-8859-1?Q?wj998bcd7KJUxRsVojJI6wcHes7nUUK0+vRjhKTAecr3b2/hkOXYNXQAmc?=
 =?iso-8859-1?Q?AqNTP+S+dqcPCRy9h+mfOQDvRBVI+57mHSQwNat/2AMOzDTHQVDzvc0qw7?=
 =?iso-8859-1?Q?N8p6Zf+127+VJMeHCWPUsqMV7qMB4Nk8+VduZOiXrSpnb/Ic+B30s9p/zv?=
 =?iso-8859-1?Q?JIC9sWQ0hm6fjAeLF1GYwbQoBbof4NrjQtAubO0lpA3TN6ZxvOKlGDavls?=
 =?iso-8859-1?Q?dg0maiGZYnBLWVVg1WwRRSoZwOfiztyGskrYZLUqllbMbJb9YmMp7KFHyM?=
 =?iso-8859-1?Q?cC7ESzn9j54iBXjjYcG1NQWRvSZnXaC780dF2Y9MU0ov67OxmO6Qkn7whN?=
 =?iso-8859-1?Q?RnxEV4euAHGyaFXOjVJkGs3FOAko3ylcM3M7k2fbioejrdv4VLmw2cMN2F?=
 =?iso-8859-1?Q?acnyK8OOJcLB5bQ4YLYAFFneM/Xa8EP3WBcyQHiy+Pyd/cM93tN7osxpra?=
 =?iso-8859-1?Q?Eag9vGPKPwAWMGwlslF9FLRGkBEQK5y5cLFk6i49b6oLZnR2TpGzQaRSY7?=
 =?iso-8859-1?Q?VQGBIffjcpFipgz6S4z8OK0sjLNpcAUj0hNAUcv9scFeQeNFGa0GRO8WF5?=
 =?iso-8859-1?Q?xNWf/uGA2o2iIPjkApCV8I7rHXtdajzi8q/GAWnd1a9Cgnat68Rg63aevo?=
 =?iso-8859-1?Q?JsCLsbIWupBnwj3mViO7XIBuWJVAQ4EQhkS3ndRd3on5sdStx7vLKh8B5G?=
 =?iso-8859-1?Q?EwMKw1G1+iwr3cyK0Ftg0ulJyPg87zisgHMYfmWUZYgKI6C62fJVbWrz7V?=
 =?iso-8859-1?Q?WWqVetgChJLEjbDHeY8djFl/IH3/8/5d8rqAlZtihOOiiN30Dcc+JlePUV?=
 =?iso-8859-1?Q?4HqJnczN3ik/xfhmjPdapo/q4rTzpnHuFuy31KtWmKQf43cwa7gRit3S3i?=
 =?iso-8859-1?Q?xfyBSsz+pWo+yX9pfBC9mTBnLjjjrKftUs2+tPMlNBb3Ays1fty8w1Pk4x?=
 =?iso-8859-1?Q?PkPfbmtHx2/hUwAd4JPlgniD9R5Q7LmX65N3ENIQQauRbXfwv5+XpxmfvK?=
 =?iso-8859-1?Q?rYQ84Ow6jkK401Bayo8J3FP3xNpzclpE+ybGZ/PV3Dya/QTP+kZ+hb65Zq?=
 =?iso-8859-1?Q?GxfH87XUTCh0fG9Iv3MbnuFF3uDEj/NpFC+2Bsz7rfAaqq+MqD12IFQQjO?=
 =?iso-8859-1?Q?IdZfDU9dRW23mk2V+Jy/vQietnBN15Kfu4bmZpkLR4uk85jWnqcI4weInE?=
 =?iso-8859-1?Q?xmpjK9MVnmRvpFH/zvk6+uMnUeXl65zQ8ZfN0IWy4ugAFfkud0Xcei3d7x?=
 =?iso-8859-1?Q?35JGk3WnpkwwnmuLSIAHOikcDwE7C5a6s+dngG822kNoBPT0yFwb9HLU/B?=
 =?iso-8859-1?Q?XudA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: groupe-cahors.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB1013.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bc5498-db61-4b74-e165-08dbdf7437df
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 09:30:44.9359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c63d0cf2-4086-47b3-adbf-b322014182ae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dsr3ATYH5f0lDOqj3DO2hi7NJUDcOXhYTfQUk5WHCm0kXVGBi1C3HtmVKaevBLLhIRc+hYGVmFW+HuSajEOI426ZkxZW6Y+ZoOt+IjGZxGjUOXf7tCwixcc6IKGKOdBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0621
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 09:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106441

Hello all,=0A=
=0A=
I would like to discuss an architecture solution to ease support for altern=
ative init systems.=0A=
=0A=
As of now, OpenEmbedded supports sysvinit and systemd as first-class citize=
ns but does so by including required files in the main package based on the=
 value of the VIRTUAL-RUNTIME_init-manager variable. This forces layers, li=
ke meta-openrc for example, to remove files generated by other layers befor=
e providing their own. This increases the maintenance burden for layer main=
tainers of these alternative init systems while making them always feel lik=
e second-class citizens.=0A=
=0A=
My solution would be to generate specific packages for each init system (${=
PN}-sysvinit, ${PN}-systemd, ...) and RDEPENDS on them given the value of t=
he VIRTUAL-RUNTIME_init-manager variable. This would simplify recipes becau=
se filtering files would no longer be required since all packages would be =
generated and other layers would simply provide their ${PN}-altinit package=
 through bbappends.=0A=
I have made a PoC on the 'kirkstone' branch but this kind of modification r=
equires all recipes to adapt to the new architecture and therefore I would =
like to know if you would accept such modifications.=0A=
=0A=
Best regards,=0A=
--=0A=
Mathieu ANQUETIN=

