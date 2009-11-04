Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5cjP-0003kJ-VB
	for openembedded-devel@openembedded.org; Wed, 04 Nov 2009 11:04:51 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5ci1-0007PZ-Bc
	for openembedded-devel@openembedded.org; Wed, 04 Nov 2009 05:03:21 -0500
Date: Wed, 4 Nov 2009 05:03:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <200911040919.51657.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.LFD.2.00.0911040502481.29456@localhost>
References: <alpine.LFD.2.00.0911040236430.13299@localhost>
	<200911040919.51657.marcin@juszkiewicz.com.pl>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: trying to get newest bitbake package into fedora
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
X-List-Received-Date: Wed, 04 Nov 2009 10:04:51 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-880437346-1257329001=:29456"

--8323328-880437346-1257329001=:29456
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 4 Nov 2009, Marcin Juszkiewicz wrote:

> Dnia =C5=9Broda, 4 listopada 2009 o 08:38:28 Robert P. J. Day napisa=C5=
=82(a):
> >   not sure if anyone involved with OE gets involved with this, but for
> > the sake of fedora folks, i'm trying to get an updated bitbake package
> > into fedora:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D529067
> >
> >   obviously not critical, just convenient if it happens.
>
> If that help I have somewhere srpm for bitbake 1.6.2.

  with fedora, it's easier than rummaging around, looking for
corresponding srpms.  if a binary package exists, then getting the
corresponding source package usually involves just:

$ yumdownloader --source bitbake
=2E.. snip ...
bitbake-1.8.10-3.fc11.src.rpm
$

  so now i have the source rpm for bitbake 1.8.10.  if it looks easy
to update it to 1.8.16, i'll take a shot at it, unless someone else
wants to do the honours.  the source rpm is only 127K in size if
anyone wants me to email it to them.

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-880437346-1257329001=:29456--
