Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1P2h9M-0007Eb-0b for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 11:16:06 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 04 Oct 2010 11:00:37 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 4 Oct 2010 11:15:18 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 4 Oct 2010 11:15:17 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 4 Oct 2010 11:15:14 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A749E7@deimsg40.de.net.world>
In-Reply-To: <AANLkTin7zH=nJJ63En6eU+km_nN7KZqVktSeHKYFwk=7@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] svn:// fetcher do not checkout repository at every build
Thread-Index: ActhhUZINqW52sAfTuO1MSXBAnMgswCHwmxQ
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74993@deimsg40.de.net.world>
	<AANLkTin7zH=nJJ63En6eU+km_nN7KZqVktSeHKYFwk=7@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 04 Oct 2010 09:15:17.0924 (UTC)
	FILETIME=[A978BE40:01CB63A4]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Mon, 04 Oct 2010 09:16:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

the solution of the problem was:

CVS_TARBALL_STASH =3D ""

in local.conf.

This turns off the searching for precreated tarballs.

Regards
Wolfgang Hauser
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Chris Larson
Gesendet: Freitag, 1. Oktober 2010 18:25
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] svn:// fetcher do not checkout repository at every =
build

On Fri, Oct 1, 2010 at 8:54 AM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@cassidian.com> wrote:

> an additional question according to checking out from svn:
>
> Before the sources are checked out from internal svn following =
messages
> are received:


See the PREMIRRORS variable.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


