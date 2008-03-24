Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JdsVp-0002wo-Bv
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 20:39:17 +0100
X-ASG-Debug-ID: 1206387555-216d00090000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id D39412908A; Mon, 24 Mar 2008 14:39:15 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 3QDswpqAuAkUMyVn; Mon, 24 Mar 2008 14:39:15 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 - stops at gcc-cross-4.2.1 configure
	GCC_NO_EXECUTABLES
Date: Mon, 24 Mar 2008 14:39:20 -0500
User-Agent: KMail/1.9.7
References: <47E7757A.6080807@linuxdevelopment.de>
	<47E7E283.8050903@linuxdevelopment.de>
	<200803241321.48929.geoffrey@pager.net>
In-Reply-To: <200803241321.48929.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200803241439.20503.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206387555
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
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
X-List-Received-Date: Mon, 24 Mar 2008 19:39:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 24 March 2008 01:21:48 pm Geoffrey Wossum wrote:
> On Monday 24 March 2008 12:18:59 pm Robert W=F6rle wrote:
> > > Not sure why you need to use the external-toolchain anymore.

> > Maybe you could ( if you dare ) rebuild your gcc-cross-4.2.1 and send me
> > the configure output log. then i could compare and see what it did
> > detect and those certain points ?
> > Would you be so kind ?
>
> I'm actually trying to rebuild it now with a patch for the ICE I was
> getting while building OpenSSH.  I'm getting some kind of error while
> building gcc-cross-initial.  Doesn't look like the same error you were
> getting, though.  Looking into it...

Okay, figured that one out.  Don't use TARGET_FPU_avr32 =3D "soft".  The AV=
R32=20
target in gcc doesn't like that.  I added that because I thought I needed i=
t=20
to get libmad to compile, but that wasn't the issue with libmad anyway.  I=
=20
needed some sort of optimizations turned on.  angstrom-uclibc.inc was turni=
ng=20
off all optimizations for the AVR32, which was unnecessary.

Waiting for a full rebuild right now.

=2D--
Geoffrey


