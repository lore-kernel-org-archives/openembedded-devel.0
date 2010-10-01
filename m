Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1P1e80-0001wa-Tq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:50:17 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.12.11.20060308/8.12.11) with ESMTP id o91BWmi8006180
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 13:32:48 +0200
Received: from DEMCHP99ET1MSX.ww902.siemens.net
	(demchp99et1msx.ww902.siemens.net [139.25.131.180])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id o91BWmf4031146
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Oct 2010 13:32:48 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.164]) by
	DEMCHP99ET1MSX.ww902.siemens.net ([139.25.131.180]) with mapi;
	Fri, 1 Oct 2010 13:32:48 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Oct 2010 13:32:48 +0200
Thread-Topic: svn:// fetcher do not checkout repository at every build
Thread-Index: ActF0WqNP0WhmhscQgyc1zcdtpEpIAbgJ4hwAAKGZWA=
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E89ECFA1F@DEMCHP99E35MSX.ww902.siemens.net>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74937@deimsg40.de.net.world>
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74937@deimsg40.de.net.world>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.2
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: svn:// fetcher do not checkout repository at every build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Oct 2010 11:50:17 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Wolfgang,

This should work by putting:

  SRCREV =3D "${AUTOREV}"

in your .bb file

Kind regards,
Fabrice Aeschbacher


> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Hauser, Wolfgang (external)
> Gesendet: Freitag, 1. Oktober 2010 12:25
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] svn:// fetcher do not checkout repository=20
> at every build
>=20
> Hello,
>=20
> unfortunately nobody answers to that question.
>=20
> Has nobody an idea how to solve this problem ?
>=20
> As a workaround I am searching for the best position to add a=20
> removal function for the tar archive after building the=20
> package or, as best position, after unpack.
> Where I can get the used archive name to manage the removal ?
>=20
> Thanks for your help
> Wolfgang=20
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: Hauser, Wolfgang (external)=20
> Gesendet: Freitag, 27. August 2010 12:20
> An: openembedded-devel@lists.openembedded.org
> Betreff: svn:// fetcher do not checkout repository at every build
>=20
> Hello,
>=20
> as pointed in the bitbake user manual, the svn fetcher should=20
> checkout a repository at every build if SRCDATE is set to "now".
>=20
> If I want to use that in OE (for our local applications),=20
> always the archive for the repository, stored in download=20
> cache, is used instead of doing a new checkout. (I user bb 1.8.18)
>=20
> Is it possible to turn off the download cache check for a recipe ?=20
>=20
> Regards
> Wolfgang Hauser
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


