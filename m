Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.69])
 by mx.groups.io with SMTP id smtpd.web11.33187.1606126011005865344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 02:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=KVGS+bGD;
 spf=pass (domain: skidata.com, ip: 40.107.5.69, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCve5rJMDTTDLPuMo3HPVkBmFitUjLWj2+OxyzHfu1rtMrS0D8+19GeQjFwiei3Bm23QgS6lBsavPDcqBdMuchcL7K0vpp06FYM/bZh1VoAH6CKgicpv6YOj/Ms/h5N1sTho1/X8aD9hFoEdYyc6+H9V4CzXHZkRsDmQCcxijRmc0vDuDtKZC2yhvD/NLSeimkgVrL4edgweFJgvwZIjQTppWW8mPLoD30mKuYXxfol60uHH4GLDfcb+uRPA3QI9KoB7vgS5YeIyzAEUcCWNUhzywUGvjdqz33whvv36eCI0zduN1qPqiXFDjgEzY0SPKHT8VAhyKrYFPBtjgeYeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxpEPTUBlfKwrTSXNEsCYrbZQsCqdip3/g1yWTRwPNY=;
 b=UspNMR1ZX3NYE2LRuElVWS5OE69BQibnwHNBAiBZ08Ip2gmboCI0yOWr0VUVNRzT9xzBAe5NvipFqLUF/K8cW2WSwb9GcmAo5upEoipG+LJUnaoyp6ednIMNq8UKnp/dv7TbxHdKKCEqnS8IUmKWB8wJDQrMzY/S/zXj/lZVAbuoOLcegwZrOJbf4+M3YN2CksEk3rsj3ZoBRJ0Gv69u1IS4/I5GW5ZuN9XhutLmwNFvpDCcDn9X0JEDAYkkdg661/MTsVyP/hp05mfm2HX71s0CrKA6Ucjp1L8zkbzQFkoS5m+wNUNhvAZc1e8gH9m1q9BfsteZcSUkGJtq0FY6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxpEPTUBlfKwrTSXNEsCYrbZQsCqdip3/g1yWTRwPNY=;
 b=KVGS+bGDyxltP0jBI7Ajr3b3Jbo3D61+0gUA3o10S+X7gfeg/+5RMJPsa8xaXjSCYyl7KS/jsTrGDbLo7mAPmDKZl5tBsaG3e1Bnan6MRJb5+vR90EHvvy4AwTe8LjziSnerJ4ZHimtuXGFmd27qWi6UV99MZmrokXaUOreYbEg=
Authentication-Results: teq.ch; dkim=none (message not signed)
 header.d=none;teq.ch; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB7005.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:17c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 23 Nov
 2020 10:06:48 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6%4]) with mapi id 15.20.3589.025; Mon, 23 Nov 2020
 10:06:48 +0000
Date: Mon, 23 Nov 2020 11:06:41 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Eric Boccati <e.boccati@teq.ch>
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java] [zeus] cacao ERROR 404
Message-ID: <20201123100623.GA2341@brokenbit>
References: <3ec4be3d-509d-8325-a2f9-76ab01d4c6da@teq.ch>
 <0f808cdf-c294-99f7-2f33-814f065fbf6d@teq.ch>
In-Reply-To: <0f808cdf-c294-99f7-2f33-814f065fbf6d@teq.ch>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To VI1PR01MB5007.eurprd01.prod.exchangelabs.com (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Mon, 23 Nov 2020 10:06:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aabd34b-b5b2-44f1-c015-08d88f977d64
X-MS-TrafficTypeDiagnostic: VI1PR01MB7005:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB70053E1A89B7684F32145655F0FC0@VI1PR01MB7005.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NFOh5KqQmNcrc9ZhD9ObyW++TyrEHSWEr8E4ZYLHYk5MJB2cqZXm8gC9ZZwj4HnTnGqpO8qmevA/9NzRK82h1jdxjsENMFXnzbZzYb7WpHS36MUQYET7E/ZMr2Iq4XoO4L0E8uzgrBfKCDmnh389ElSbQM/JD8cx1xLjSlTYTHyNxAF5vaol+OEgt5zL8EE0i1YvYOL6oitjQ1IEaJ6AfOQ/HTly2ABxVsgi2OYYYUHwYw/aOI88D+rYXV7ZDtQPEoSo/pbv7rAguRDARNKEIeDOfQS+MAeiU/XZaXA1L3Q7lnZzoYnakV/LAg0fPW98OgtxZbsm3mlEAO9UKPGN4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(396003)(366004)(376002)(136003)(478600001)(6666004)(26005)(66556008)(2906002)(9576002)(66476007)(316002)(186003)(44832011)(33656002)(33716001)(4744005)(16526019)(9686003)(52116002)(6496006)(86362001)(83380400001)(66946007)(956004)(1076003)(6916009)(55016002)(4326008)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	y5W3WVeRpY8gk6ZKcrwx4CdQN3p0ah5QykgrSrS2XLHMaVjj2y8IUVcy2MlkdyAP0sJp+5EPKXk7OwMZOAsgkX6bib3RlQwuxz5b+ViX2tMYEXH1q+ilSdwhIlr09fpbJeqL76TBNrZ80UTXYkdlkuSNk3qeGynWOT+yfnurgIr/510z0xBFjlPGQIfFDQ6W8SC8kiIZAQK2FH/SXn8UN30FabBfvTaZePbdmazrJK9aRs3qf2gMsy2HdJtQKmNuFYsgY25VazHO6Na8KTDQi0pVwoCYEDQVYSw0yEyf9Pl6EIyUavi3EmbgfYDSr9xMGqIiqKe4oIGKbHpotF+cCO6B7cRXe07oczAB+XGAkatJJwf4CXo7kCM1xc9sropCyxwXkmHQwd8wAf+QL2XfntuizM6okPMaf/v1KUnv3rJlrot8Y5d+xgA+FcGWhf2ipBEZbU3jsUfVZ6zum33xGrEy3tvFInX8tjmNr/yQcz/+LFE0YDKKgGm8AzUkZqquVJaFTQ3aaqfImM41K97cwaEnZc4j7/wUvrZrAaTbnxy5CCFTcT6/cOwpJVlIC6e0Hsjgx6EUidj9CvmFJaD2/1Le7QRIRU6bD8+HGh8whZor4hwii1YNGSD+bofGcW621DOs5Ax+AXSs696PgQi1Rg==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aabd34b-b5b2-44f1-c015-08d88f977d64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 10:06:48.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JPhI8kVsnncV1QWarbd3gsqi04stnnVVa013GBdq3KM0KUB38ytfgZlBthrkoOg0rwWk2Hy/PODXulw0AK6bzg3QK9t2VJLjUklTHggVc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7005
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, Nov 19, 2020 at 02:33:49PM +0100, Eric Boccati wrote:
> Hi,
>=20
> im trying to build jre using your meta-java pulling it from last commit o=
f
> zeus branch but cacao fetch fail:

The zeus branch for meta-java isn't maintained anymore. Please update to
dunfell, gatesgarth or master.

If you need to stick with zeus please feel free to send a patch
adressing the issue.
A good starting point would be commit 00cb61f (cacao: update to latest
git version, 2020-08-20) =F0=9F=98=89

regards;rl

>=20
> I tried to move recipe from meta-java rocko (our previous/working branch)
> but it stuck on:
>=20
>=20
>=20
