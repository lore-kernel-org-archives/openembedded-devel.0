Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 960B6733F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:08:26 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 3B3231A739D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 11:08:26 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0224.002; Fri, 13 Feb 2015 11:08:26 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
Thread-Index: AQHQR3KA5JWJLooH0kGQTC1vM4sanJzuV4Kw
Date: Fri, 13 Feb 2015 10:08:26 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
In-Reply-To: <20150213094951.GA14290@mail.itconsulting-heinold.de>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.31]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrkedvgdduudcutefuodetggdotefrucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffuthffkfhfjghitgfgggesthhqtddttddtudenucfhrhhomhepoffqpfffqffpucffrghnihgvlhcuoeffrghnihgvlhdroffqpfffqffpsehlphhgshihshhtvghmshdrtghomheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhg
X-VRSPAM-EXTCAUSE: mhhouggvpehsmhhtphhouhht
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile:	Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 10:08:29 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok, but my problem is I must not change distribution.

The system is installed on many machines, and moving to and other repo will=
 generate too many work (dev and validation)!

I have not enough time to pass on this problem : It was so complicated to b=
uild, install and configure Java on angstromv2012.05 environment!

Is it because Ubuntu 12.04 java was updated ?

Thanks
Daniel.

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Henning Heinold
Envoy=E9=A0: vendredi 13 f=E9vrier 2015 10:50
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Fa=
iled

On Fri, Feb 13, 2015 at 08:36:45AM +0000, MONDON Daniel wrote:
> Hi,
>=20
> I am under Ubuntu 12.04 server and I build an angstromv2012.05 distributi=
on.
>=20
> Making a build all (from scratch), I've got the error:
> | Error: time is more than 10 years from present: 1104530400000
> | java.lang.RuntimeException: time is more than 10 years from present: 11=
04530400000
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecial=
CaseEntry(GenerateCurrencyData.java:285)
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAn=
dSpecialCaseTables(GenerateCurrencyData.java:225)
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.main(Genera=
teCurrencyData.java:154)
> |    at java.lang.reflect.VMMethod.invoke(Native Method)
> |    at java.lang.reflect.Method.invoke(Method.java:327)
> |    at jamvm.java.lang.JarLauncher.main(JarLauncheERROR: Function failed=
: do_compile (see /home/lpg/VPN/lpg-project/build/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/icedtea6-native-1.8.11-r5.3/temp/log.do_compile.8710 =
for further information)
>=20
> The log.do_compile.8710 is attached.
>=20
> Please help :)
>=20
> Thanks
> Daniel.

The layer has moved and is now available under git://git.yoctoproject.org/m=
eta-java

Bye Henning


> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

