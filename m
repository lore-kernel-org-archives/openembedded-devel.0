Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IwQlD-0006x9-Te
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2007 00:19:36 +0100
Received: from home.lan (c62-222.icpnet.pl [62.21.62.222])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id C4CCDE2A5D7;
	Sun, 25 Nov 2007 18:41:01 -0500 (EST)
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org,
	Matthias 'CoreDump' Hentges <oe@hentges.net>
Date: Mon, 26 Nov 2007 00:16:43 +0100
User-Agent: KMail/1.9.7
References: <20071125221011.B403A40012A@tinman.treke.net>
In-Reply-To: <20071125221011.B403A40012A@tinman.treke.net>
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200711260016.45820.openembedded@haerwu.biz>
Subject: Re: [oe-issues] [Bug 3131] zaurusd should rdepend on bl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Nov 2007 23:19:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 25 listopada 2007, bugzilla-daemon@tinman.treke.net=20
napisa=B3:
> http://bugs.openembedded.org/show_bug.cgi?id=3D3131
>
>
> Matthias 'CoreDump' Hentges <oe@hentges.net> changed:
>
>            What    |Removed                     |Added
> ----------------------------------------------------------------
>    CC    |                            |oe@hentges.net=20
>Status    |NEW                         |RESOLVED
>Resolution|                            |FIXED
>
> --- Comment #1 from Matthias 'CoreDump' Hentges <oe@hentges.net>=20
> 2007-11-25 14:10:11 --- Added gpe-conf to DEPENDS and RDEPENDS as
> gpe-conf emulates "bl" these days.

Zaurusd REQUIRE bl - not gpe-conf and we have 'bl' in repo -=20
packages/bl/bl_cvs.bb recipe. Please do test and fix zaurusd recipe to=20
depend on proper tool.

And DO NOT add stuff into DEPENDS if this is NOT needed to build.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

             I'm not being rude, you are being insignificant.


