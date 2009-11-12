Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8ZH8-0006zK-0t
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:59:49 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8ZFs-0004dM-DP for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 07:58:28 -0500
Date: Thu, 12 Nov 2009 07:58:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.0911120748300.3045@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 12:59:49 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1430356997-1258030706=:3045"

--8323328-1430356997-1258030706=:3045
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 12 Nov 2009, Frans Meulenbroeks wrote:

> 2009/11/12 Robert P. J. Day <rpjday@crashcourse.ca>:
> > On Thu, 12 Nov 2009, Frans Meulenbroeks wrote:
> >
> >> 2009/11/12 Robert P. J. Day <rpjday@crashcourse.ca>:
> >>
> >> > the above is switching on a symbolic mode, and that final line is
> >> > using sed to convert the symbolic mode to the corresponding numeric
> >> > mode for installation.
> >> >
> >> > =A0that worked fine a few years back, but it fails on newer linux
> >> > distros for which the long listing might have a trailing period, as
> >> > does my fedora 11 system:
> >> >
> >> > $ ls -l /etc/passwd
> >> > -rw-r--r--. 1 root root 2474 2009-11-09 14:59 /etc/passwd
> >> > =A0 =A0 =A0 =A0 =A0^ there
> >>
> >> Hm. I've never ever heard about this trailing period. Where does it
> >> come from/how was it introduced?
> >
> > https://fedoraproject.org/wiki/Fedora_11_FAQ#Why_does_ls_show_a_dot_.28=
=2E.29_or_a_plus_.28.2B.29_at_the_end_on_the_file_modes_for_some_files.3F
> >
> > rday
> > --
>
> Robert thanks for the link. Didn't know that. Apparently one is
> never too old to learn something new.

  i was a bit puzzled the first time i saw that, and had to ask around
about what it meant.

> So it is not really fedora specific, but it is SELinux specific. Do
> we want to support SELinux as build host ? (the ideal solution of
> course would be to have our own ls in the cross dir).
>
> Frans.
>
> PS: Personally I think it is a bad idea to change the output format of
> a utility that is more than 30 years old and that is so widespread.

  i have to agree but, frankly, i'm astonished that that fundamental a
change caused breakage in only one package out of about 10,000 (i
tripped across that building beagleboard-demo-image -- it was the only
package that failed because of that; i actually think that shows an
amazing level of robustness).

> (and I did not even see an obvious way to get the old behaviour).

  i'm checking right now if there's an option to "ls" to turn *off*
that feature, but i don't see one offhand.  perhaps a better lesson is
that the way xterm's sinstall.sh script works is really hacky, using
sed to allegedly reproduce a file's existing mode settings.  perhaps
there's a simpler way to get that effect without dragging "sed" into
it.  but, again, if only one package was affected, maybe just hack up
an xterm fix and move on, and deal with things on a case-by-case
basis as they come up.

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

--8323328-1430356997-1258030706=:3045--
