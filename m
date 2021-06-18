Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web10.7532.1624021696061680208
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 06:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=brE2sXp5;
 spf=pass (domain: nxp.com, ip: 40.107.8.71, mailfrom: alejandro.lozano@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ7g4lLPoOdzqnSjCHSOIyFEHzQmPESK9ou7VrDe7apJMoxFoa8s3iJ1D8IPRcUU7koHDAeUa+fDI3BubQPGYmG4COK5hsAJ3sZAJ4QR42ctU5gkGrNHiFGiMAnnpANRGRFDIgpxFm+ybe4/GLVac6plrVq/jIkH75CvuDCv+z3kfgSAK+nynN9GGIp8UiRuHzzF8u7O8TFqu+oY4zw3QID8iuoRzXCN+TcEYVpiie5psTfC+rc+6R+WSscBpIRV+3rIcW3dToxxZ8OwZkzkp8B0YLkv/aJQPo4ocjmUJtHTCveJ3wTmfRv5ohq1RSezDqpwx+rf7SJ3lOgt/mrz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLsLWYd9P+WVmcTUS4XKFN85H/N4IOaKNyVqX5fuM0I=;
 b=JHyoZZP1LV1mWOSaTPqsnlsf09J4bAEgQjK8iFFsb1BCoJ6viQSK+G/Geq4wd9bGr8JNm3X95IlxHFH456PikZWdXQCxZd1++ZAfPCRmypLv15MM3hvutVA/L81zCRbgzmUh7hwDQSk12xS1EugXlh3bOm2/fV5A3izR7AZFkopmDGer8TjxSeO+9Gy+T/bMDtr1cCd5F5Y8O81S83j/+hOP3SJYdqxW/3Zlk2l8m1+vFot+x9MZ9ySnIE2hn6fW/+Z3zVmE83rVNj37wS5b40t05n6m/maN1IfKA/vBi3tfxjqV0PN0xwISwmn/ZIFqjxczef0cF7713H9AlCI6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLsLWYd9P+WVmcTUS4XKFN85H/N4IOaKNyVqX5fuM0I=;
 b=brE2sXp5PacZB6nHXkLXAJhMVWWCMXIAf0JWbvaXpUYLH9vpvs+JIDngPCRORgw6dMJIrEBEJsTyR+evHdrPjPurtOOtDaXDKoXTO0qPz7LOmMzwOo3OtckNej0UgxMLYjG69hcWzRi5yFszMukK3bZIHQ3CAotd3zhh064e0AE=
Received: from DB6PR04MB3045.eurprd04.prod.outlook.com (2603:10a6:6:10::12) by
 DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18; Fri, 18 Jun 2021 13:08:13 +0000
Received: from DB6PR04MB3045.eurprd04.prod.outlook.com
 ([fe80::699a:49ef:e764:303e]) by DB6PR04MB3045.eurprd04.prod.outlook.com
 ([fe80::699a:49ef:e764:303e%7]) with mapi id 15.20.4242.019; Fri, 18 Jun 2021
 13:08:13 +0000
From: "Alejandro Lozano Lozano" <alejandro.lozano@nxp.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Richard Leitner -
 SKIDATA <Richard.Leitner@skidata.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"George.Mocanu@rinftech.com" <George.Mocanu@rinftech.com>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error
Thread-Topic: [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error
Thread-Index: 
 AQHXXCzuuhyiXazm20y2Dxj27Z1lLKsM9QIAgAcIMQCAAAJJgIAAEYWAgACc7ACABR9z0A==
Date: Fri, 18 Jun 2021 13:08:13 +0000
Message-ID: 
 <DB6PR04MB3045822D414344179222A701900D9@DB6PR04MB3045.eurprd04.prod.outlook.com>
References: <98hT.1623132594082542882.bzIp@lists.yoctoproject.org>
 <CANNYZj9r_eZ8ZHEo801viRNuBekefmvKuqtLfKsKTQncw+uw-w@mail.gmail.com>
 <YMe6JtmeJc1NiRYZ@brokenbit>
 <ec0d85da208aa26517a50ea998b855a5aa0d1455.camel@linuxfoundation.org>
 <YMfKw9F6qY7daERE@brokenbit>
 <CANNYZj8DDhPseB_Vzr4oboJgQn6VY5LbRym6-Tp7=peHfKTJvw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8DDhPseB_Vzr4oboJgQn6VY5LbRym6-Tp7=peHfKTJvw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [177.241.61.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97c649de-2b3c-483d-65d4-08d9325a211f
x-ms-traffictypediagnostic: DB7PR04MB4875:
x-microsoft-antispam-prvs: 
 <DB7PR04MB487516C50205F55CCBCB5134900D9@DB7PR04MB4875.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jK1gdrRn9C8oq2d0Eg8FvJ+FVR7kIAjsPJzKo+iZpXv3NdHoqn02tMFrWfSYEK4ff+wgsDuUkoeFookMGzijkkYefbrqwefNOp01xQg41BFuCnn38qO/QzoztJ8e3cxOzCJw175IVM9xnp3Ky+dsiPM7W7SR0jZ0s6mblCyUZTOnQj/I84xbazWG81682p05dZgqdTu/+mZv1vqB08/pKNINrB2leTg80ul7shdJVHHNl4veys9vqAJRA7vRkvL5EJ6DZn4y93gQLEwhzgZJh7wtsJFf4tBtudD84EXP6KAcC6gnyXW28a60T9zYoEnEBjVpeyfQD46Z4kkLlGOi0dyBFJTYq11PxMEIKL2VAa4qq0f9ZfFd5pzxyoXgqyu+/IensvH6ie1XhGwhBc76RY+ppCeYZ1tU1noeN77a7hZQrMICsGuYo8y/wvqIcR/PTQNtJekBturMXMq+8a+AZhKMhU5SiDK6fDW5NbQlzJiMWJLljxwh278XfBFZu2vgROFwkNSyjsz4VhjVDxeguEvv8ho+BXJyyRe5y7xMpPs4n/TH79HNuj9CXciDLepGlrB+PaEkyztDR6AUlNZqZ3EI+vDqI0JVq/EQbxKTN5JD+9m3Cr9fd+o9ubTyGgkhOsw08JoPpoXJcN1FGEqbWRtvfatpNMGyZD7QoLKq+YKAA6Uc8f1fDICaFIYvdBwRCT0piARfR/wxQAtEPxDtHA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3045.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(76116006)(4326008)(53546011)(8936002)(166002)(33656002)(9326002)(38100700002)(8676002)(66946007)(71200400001)(83380400001)(66476007)(7696005)(186003)(26005)(66446008)(64756008)(2906002)(316002)(966005)(478600001)(54906003)(86362001)(9686003)(5660300002)(55016002)(6506007)(110136005)(66556008)(52536014)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WHKmlWL2FzcWFYhu+7TV+RIwvw+q+VkMr2HooEhUVq2MJAMd64/pOGf7Ce30?=
 =?us-ascii?Q?5pAYKEvlA0vk2ac9nuz04KqjCNSAisbJZn1lKl2zbvyNpPfGF2wcGJRaAn72?=
 =?us-ascii?Q?nYf/J3pOiGb6MVKk02tyeE3IlVELllwcM/wmXo8Qf1PFBUg57/xRpwzM5u+K?=
 =?us-ascii?Q?7lxAo5JgCPgjF9yGCrAL/Z1V8OloxUOlk7b94zioaOws+obpyy6GstNtzxkH?=
 =?us-ascii?Q?HGz+DCTEhq+TF6ytZQttBWgIV2Bs3ftGJsJ50OuRfm8tHUrMs67ydpEMrXIH?=
 =?us-ascii?Q?717XbcloZUsii0VXK3n9by3MRzz9k9nY5fu7wljWcL3U/xm/hd+BGI+7G39k?=
 =?us-ascii?Q?YUDVAAI/fqdn1xPW5FqNTpNR7rfv99cNY0uxJdRK9lCo97+kceIYVYfp+frf?=
 =?us-ascii?Q?CLWpmn3E5F0vZlxqTIQJfWCj64P0+PAjoKGGZlzxAWNvdoHfip1Dt1p9gtc4?=
 =?us-ascii?Q?vsKlu9GiXXGq9zoBOIcGJte9g325VkCyq9qLQEMlxtb+4ppWLMwiTV6C5U8r?=
 =?us-ascii?Q?5yRCDa6q9mu09/JlyxGsgGMjJJhQ8oq8tW4BFhdxbyVjewG80QxRbkMbRC+g?=
 =?us-ascii?Q?xbfNsCxWkvCEAYWR0og6NngTMR/TBUyPz1ByAbcouJFhiCclVfpnuxv9aBmh?=
 =?us-ascii?Q?19ObpeeHe0avttkMSolEK6U51Sfkbq0CTUx/QgbB1ouxC8v/D8MYnhLJjDKW?=
 =?us-ascii?Q?mk881aBAJyw3pttysUty4J4hpMKqmQen8TIj9MTxnkOc5jpIB17ZthrE17pN?=
 =?us-ascii?Q?XymNA7lzQtZiTGGhsYnuna5eY2LxdR3ziyT9oZ8Gqgpul4Dou0+Qzq9g74H6?=
 =?us-ascii?Q?tNRUAp0KUc3xitbrGlagr9nkUpoF8fVZS6OPeoxMUJTcz71HlR12Q4yLsCbe?=
 =?us-ascii?Q?Adnn4461Tx2DVss7lFgXwg4VsopW7b8m2YKEDRtpqmUu5RXUf8gX8sQgmwV5?=
 =?us-ascii?Q?xJfVk85cnUbgw2RI5ncseohbN9PGQhqfS31ViHKmCHjZPZx3Xj2GnTYNTIio?=
 =?us-ascii?Q?hVURxriPwwnEhZXrBrcxHav4x+3JLBxVFpAkUZRn/4pu+6M899kVjBwSSz5m?=
 =?us-ascii?Q?RfFEtvbneJqn2YMxedt8c/EWzjk1Hpi9NY8mzCaShQb7MmNvgmlBm24/ko+W?=
 =?us-ascii?Q?yt7UnqlCep5rFq98jaKbsPN3nsDJAIuW6VNk1Un+z6kC5zGvppYMNDqjWZvs?=
 =?us-ascii?Q?osZ5h2trNnkhI3ckmphpaoA+mpYCflLN0fkYjYkEc4LIIYJ/v7R2owGrktFD?=
 =?us-ascii?Q?Ujdu42CJr5tuwV+fp1xByhwVv2NLZbpPjgObYOhEid1Wnrbb8UNBnXuCoYJX?=
 =?us-ascii?Q?P1yw6MKtAHrgBBeyAAOwTxZw?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c649de-2b3c-483d-65d4-08d9325a211f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:08:13.2787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dvI5Lukpqy3xMWnb4KcY+I5UzvjwatpIHc/yyR/zRwdG+lyTjzhGru6LnbrezPI32zJt48hbjEzmAZy4zZz02UgMJeTAtnZN1M4GlC0cf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR04MB3045822D414344179222A701900D9DB6PR04MB3045eurp_"

--_000_DB6PR04MB3045822D414344179222A701900D9DB6PR04MB3045eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Do you know where can we fetch the correct tarballs?

Thanks,
Alejandro

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.org
Sent: Tuesday, June 15, 2021 1:53 AM
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; George.Mocanu@rinf=
tech.com; Yocto-mailing-list <yocto@lists.yoctoproject.org>; openembedded-d=
evel@lists.openembedded.org
Subject: [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error


Caution: EXT Email
On Mon, 14 Jun 2021 at 23:31, Richard Leitner - SKIDATA <Richard.Leitner@sk=
idata.com<mailto:Richard.Leitner@skidata.com>> wrote:
Thank you very much Richard!
The openjdk8 tarballs are now hosted at https://downloads.yoctoproject.org/=
mirror/sources/<https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fdownloads.yoctoproject.org%2Fmirror%2Fsources%2F&data=3D04%7C01%7C=
alejandro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2=
b4c6fa92cd99c5c301635%7C0%7C1%7C637593368341461232%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&s=
data=3DFkKLsu%2FHt%2B4%2B9XUKRq6C7HNB90uOMRnuwmZv93nDHZU%3D&reserved=3D0>
with their local download names.

Unfortunately I currently don't have the time and resources to provide a
patch for fixing the URLs and adding the mirror.
So help is greatly appreciated!

Unfortunately I think you mirrored the wrong tarballs. The problematic ones=
 are specifically the six tarballs coming from http://icedtea.classpath.org=
/hg/<https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fice=
dtea.classpath.org%2Fhg%2F&data=3D04%7C01%7Calejandro.lozano%40nxp.com%7Cc2=
faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7=
C637593368341461232%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=3DTCOz4kZDpoBR8FmE1aDP31jF=
QGUCTA7SMb0i3eUeADM%3D&reserved=3D0>
and I am not seeing them mirrored. See the original error at the start of t=
his thread:


--2021-06-07 17:24:33--  http://icedtea.classpath.org/hg/release/icedtea7-f=
orest-2.1/archive/f89009ada191.tar.bz2<https://eur01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2Fhg%2Frelease%2Ficedt=
ea7-forest-2.1%2Farchive%2Ff89009ada191.tar.bz2&data=3D04%7C01%7Calejandro.=
lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd=
99c5c301635%7C0%7C1%7C637593368341471236%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=3DBWX=
1PN%2Bm7dJKRJUwBMFpexMTI5HjYzSzOH%2BSPsKETOw%3D&reserved=3D0>

Resolving icedtea.classpath.org<https://eur01.safelinks.protection.outlook.=
com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F&data=3D04%7C01%7Calejandro=
.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92c=
d99c5c301635%7C0%7C1%7C637593368341471236%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=3Dzx=
r5t6d7YjEEgcf9l2EhVxRX5zaNsLrkI9LGh%2B%2BsMks%3D&reserved=3D0> (icedtea.cla=
sspath.org<https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Ficedtea.classpath.org%2F&data=3D04%7C01%7Calejandro.lozano%40nxp.com%7Cc=
2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%=
7C637593368341481229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=3DzOFS66KSo9%2BPCokh%2BHV=
dsi2ygTBVEf2ymvi2cjoSyXQ%3D&reserved=3D0>)... 172.104.137.120
Connecting to icedtea.classpath.org<https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F&data=3D04%7C01%7Caleja=
ndro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6f=
a92cd99c5c301635%7C0%7C1%7C637593368341481229%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=
=3DzOFS66KSo9%2BPCokh%2BHVdsi2ygTBVEf2ymvi2cjoSyXQ%3D&reserved=3D0> (icedte=
a.classpath.org<https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%=
3A%2F%2Ficedtea.classpath.org%2F&data=3D04%7C01%7Calejandro.lozano%40nxp.co=
m%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0=
%7C1%7C637593368341491219%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=3DQheEtmPN8Q5Q%2Fk81=
%2FoB8nrlCuAE2gJxH0obIlmt3kbY%3D&reserved=3D0>)|172.104.137.120|:80... conn=
ected.
HTTP request sent, awaiting response... 404 Not Found
2021-06-07 16:21:05 ERROR 404: Not Found.

Alex



--_000_DB6PR04MB3045822D414344179222A701900D9DB6PR04MB3045eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you know where can we fetch the correct tarballs?=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Alejandro<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-devel@lists.openembedded.o=
rg &lt;openembedded-devel@lists.openembedded.org&gt;
<b>On Behalf Of </b>Alexander Kanavin via lists.openembedded.org<br>
<b>Sent:</b> Tuesday, June 15, 2021 1:53 AM<br>
<b>To:</b> Richard Leitner - SKIDATA &lt;Richard.Leitner@skidata.com&gt;<br=
>
<b>Cc:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; Georg=
e.Mocanu@rinftech.com; Yocto-mailing-list &lt;yocto@lists.yoctoproject.org&=
gt;; openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error<=
o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p><b><span style=3D"color:white;background:darkred">Caution: </span></b><s=
pan style=3D"color:white;background:darkred">EXT Email
</span><o:p></o:p></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">On Mon, 14 Jun 2021 at 23:31, Richard Leitner - SKID=
ATA &lt;<a href=3D"mailto:Richard.Leitner@skidata.com">Richard.Leitner@skid=
ata.com</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Thank you very much Richard!<br>
The openjdk8 tarballs are now hosted at <a href=3D"https://eur01.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fdownloads.yoctoproject.org%2Fmi=
rror%2Fsources%2F&amp;data=3D04%7C01%7Calejandro.lozano%40nxp.com%7Cc2faea8=
f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C6375=
93368341461232%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DFkKLsu%2FHt%2B4%2B9XUKRq6=
C7HNB90uOMRnuwmZv93nDHZU%3D&amp;reserved=3D0" target=3D"_blank">
https://downloads.yoctoproject.org/mirror/sources/</a><br>
with their local download names.<br>
<br>
Unfortunately I currently don't have the time and resources to provide a<br=
>
patch for fixing the URLs and adding the mirror.<br>
So help is greatly appreciated!<o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Unfortunately I think you mirrored the wrong tarball=
s. The problematic ones are specifically the six tarballs coming from
<a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Ficedtea.classpath.org%2Fhg%2F&amp;data=3D04%7C01%7Calejandro.lozano%40nx=
p.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635=
%7C0%7C1%7C637593368341461232%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DTCOz4kZDpo=
BR8FmE1aDP31jFQGUCTA7SMb0i3eUeADM%3D&amp;reserved=3D0">
http://icedtea.classpath.org/hg/</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">and I am not seeing them mirrored. See the original =
error at the start of this thread:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<pre>--2021-06-07 17:24:33--&nbsp; <a href=3D"https://eur01.safelinks.prote=
ction.outlook.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2Fhg%2Frelease%=
2Ficedtea7-forest-2.1%2Farchive%2Ff89009ada191.tar.bz2&amp;data=3D04%7C01%7=
Calejandro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C1%7C637593368341471236%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&=
amp;sdata=3DBWX1PN%2Bm7dJKRJUwBMFpexMTI5HjYzSzOH%2BSPsKETOw%3D&amp;reserved=
=3D0" target=3D"_blank">http://icedtea.classpath.org/hg/release/icedtea7-fo=
rest-2.1/archive/f89009ada191.tar.bz2</a><o:p></o:p></pre>
<pre>Resolving <a href=3D"https://eur01.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F&amp;data=3D04%7C01%7Calejandro.l=
ozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4c6fa92cd9=
9c5c301635%7C0%7C1%7C637593368341471236%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3D=
zxr5t6d7YjEEgcf9l2EhVxRX5zaNsLrkI9LGh%2B%2BsMks%3D&amp;reserved=3D0" target=
=3D"_blank">icedtea.classpath.org</a> (<a href=3D"https://eur01.safelinks.p=
rotection.outlook.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F&amp;data=
=3D04%7C01%7Calejandro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%=
7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637593368341481229%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C2000&amp;sdata=3DzOFS66KSo9%2BPCokh%2BHVdsi2ygTBVEf2ymvi2cjoSyXQ%3D&=
amp;reserved=3D0" target=3D"_blank">icedtea.classpath.org</a>)... 172.104.1=
37.120<br>Connecting to <a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F&amp;data=3D04%7C01%7Cal=
ejandro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d92fca559f%7C686ea1d3bc2b4=
c6fa92cd99c5c301635%7C0%7C1%7C637593368341481229%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp=
;sdata=3DzOFS66KSo9%2BPCokh%2BHVdsi2ygTBVEf2ymvi2cjoSyXQ%3D&amp;reserved=3D=
0" target=3D"_blank">icedtea.classpath.org</a> (<a href=3D"https://eur01.sa=
felinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ficedtea.classpath.org%2F=
&amp;data=3D04%7C01%7Calejandro.lozano%40nxp.com%7Cc2faea8f6d3e483c2de608d9=
2fca559f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637593368341491219%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C2000&amp;sdata=3DQheEtmPN8Q5Q%2Fk81%2FoB8nrlCuAE2gJxH0obIlm=
t3kbY%3D&amp;reserved=3D0" target=3D"_blank">icedtea.classpath.org</a>)|172=
.104.137.120|:80... connected.<br>HTTP request sent, awaiting response... 4=
04 Not Found<br>2021-06-07 16:21:05 ERROR 404: Not Found.<o:p></o:p></pre>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB6PR04MB3045822D414344179222A701900D9DB6PR04MB3045eurp_--
