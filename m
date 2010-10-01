Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1P1fLI-0007Jg-Ch for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 15:08:05 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 01 Oct 2010 14:53:01 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Fri, 1 Oct 2010 15:07:26 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 15:07:26 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 1 Oct 2010 15:07:25 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74975@deimsg40.de.net.world>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E89ECFA1F@DEMCHP99E35MSX.ww902.siemens.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] svn:// fetcher do not checkout repository at every build
Thread-Index: ActF0WqNP0WhmhscQgyc1zcdtpEpIAbgJ4hwAAKGZWAAAz9j0A==
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74937@deimsg40.de.net.world>
	<09D9BE2AC4AA764DABAA8C91E48D819E89ECFA1F@DEMCHP99E35MSX.ww902.siemens.net>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Oct 2010 13:07:26.0333 (UTC)
	FILETIME=[98360AD0:01CB6169]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Fri, 01 Oct 2010 13:08:05 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Fabrice,

thanks for that tip, it works.

But you have to avoid a rev=3Dxxxx argument in SRC_URI. This will =
overrule the AUTOREV setting.

By the way, that should be corrected/reported by a specialist in the =
user manuals.

Regards
Wolfgang

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Aeschbacher, Fabrice
Gesendet: Freitag, 1. Oktober 2010 13:33
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] svn:// fetcher do not checkout repository at every =
build

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
>=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


