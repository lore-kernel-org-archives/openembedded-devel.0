Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 1939660D0A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 16:45:18 +0000 (UTC)
IronPort-SDR: rz5E2qaoW0CIZ08UEFb5DrXhh43HSAlOcgdigoJ+OT4cscQCHjKKSNJOISQxxrLvzCpg8Cs1Zz
	RZT0Hfyxfzazv7xE96jkjrG9wC3qTC+6Nbr2f1EoQqSW2mS28xR73rMRhfgxCBFe3a4/drvuEt
	1pgOaGSdpMc6PIV9oEnHPkIYfsxKtCg1r44Y91DU418GPd7WXBerf7UsNk4iDc7s94OQbhVzX/
	rtwz/2J7hR0F6xBq5vSC91q2XjuLwyTys4N4kDJH93hTUtu20qZF84YYYZKA4HzFz3+eoQmppH
	fHM=
X-IronPort-AV: E=Sophos;i="5.70,414,1574118000"; 
   d="scan'208";a="5053755"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: systemd-conf bbappend not working (warrior)
Thread-Index: AdXd0SmjdGHO6GZZQMiy3ZBEJU4iSwAA2tPw
Date: Fri, 7 Feb 2020 16:45:19 +0000
Message-ID: <fc16d2651b9547f3848da69a6090ec24@XBOX03.axis.com>
References: <HE1PR05MB4635DB8B3F93600E64ADE444C51C0@HE1PR05MB4635.eurprd05.prod.outlook.com>
In-Reply-To: <HE1PR05MB4635DB8B3F93600E64ADE444C51C0@HE1PR05MB4635.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: systemd-conf bbappend not working (warrior)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 16:45:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Visser Sander (2)
> (Consultant)
> Sent: den 7 februari 2020 17:15
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] systemd-conf bbappend not working (warrior)
>=20
> Hi
>=20
> In warrior there is systemd-conf_243.bb but in the build folder tmp/work

In Warrior, the version of systemd-conf is 241, not 243.=20

* What versions of what layers do your really have?
* Do you have any other layers than the layers in Poky?
* Are there any other bb or bbappends for systemd-conf in any of the=20
  other layers?

> the version is called 1.0-r0

"1.0" is the default version if no version is set in the recipe name=20
or using PV. Before Warrior, systemd-conf did not have an explicit=20
version set and would then use "1.0" as version.

> If I create a systemd-conf_%.bbappend its content is not applied. For
> instance if I set PR =3D "r1" that has no affect. I am also unable to add
> tasks to modify the default configuration...
>=20
> Any ideas why this is happening for this recipe alone?
>=20
> /Regards Sander

//Peter


