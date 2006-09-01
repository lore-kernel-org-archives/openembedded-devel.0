Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <alain2210@free.fr>) id 1GJA8e-0000yP-T7
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 16:36:56 +0200
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 1F9F490B2D;
	Fri,  1 Sep 2006 16:34:35 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id 9602889AE; Fri,  1 Sep 2006 16:55:08 +0200 (CEST)
Received: from AMontsouris-153-1-27-129.w86-212.abo.wanadoo.fr
	(AMontsouris-153-1-27-129.w86-212.abo.wanadoo.fr [86.212.82.129]) 
	by imp8-g19.free.fr (IMP) with HTTP 
	for <alain2210@127.0.0.1>; Fri, 01 Sep 2006 16:55:08 +0200
Message-ID: <1157122508.44f849cc7f44b@imp8-g19.free.fr>
Date: Fri, 01 Sep 2006 16:55:08 +0200
From: Alain2210 <alain2210@free.fr>
To: Jamie Lenehan <lenehan@twibble.org>
References: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
	<20060901013235.GA12885@twibble.org>
	<1157104905.44f80509b9320@imp8-g19.free.fr>
	<20060901142001.GA13118@twibble.org>
In-Reply-To: <20060901142001.GA13118@twibble.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 86.212.82.129
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gd package and cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2006 14:36:57 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

Quoting Jamie Lenehan <lenehan@twibble.org>:
> On Fri, Sep 01, 2006 at 12:01:45PM +0200, Alain2210 wrote:
> [...]
> > > I suspect you have one of those distro's that include the X header =
in
> > > /usr/include only and not in /usr/X11R6/include and so it's the
> > > search for the X headers that is the issue.
> >
> > I have forgotten to say that I was using familiar-unstable.
>
> Ah, that's not actually what I meant ;). In this case I was talking
> about your "host distro" not the OE distro you were building for.

Ok, my host distro is Debian etch i386

>
> The check for host systems headers complains if something tries to
> use headers from /usr/include but it doesn't complain if something
> tries to use headers from /usr/X11R6/include. Most host distro's have
> the X headers in /usr/X11R6/include - I have Fedora Core 4 x86_64 and
> that's where it puts the X headers. But some disto's (whatever host
> distro your using for example) have the X headers in /usr/include/X11
> only. The configure scripts appear to check for /usr/X11R6/include
> before /usr/include/X11/.

Yes, on my host system, X include are in /usr/include/X11.

>
> So most OE developers don't actually see any of the problems that are
> related to the use of the X headers, so you may run into a few of
> those.
>
> The solution for the X headers that usually works is to pass
> appropriate options to config. That's either:
>
>  --without-x
>
> if X isn't needed, or:
>
>  --x-libraries=3D${STAGING_LIBDIR} --x-includes=3D${STAGING_INCDIR}
>
> if X is needed.

I will try that.

>
> [...]
> > I get an analogous problem in tetex. And will try to solve it with th=
e same
>
> Yeah, tetex is looking for the X libs and headers as well:
>
>  [nynaeve][12:09AM]%> grep /usr/.\*/include
>
/data/oe/build/wrap-glibc/tmp/work/tetex-native-3.0-r1/temp/log.do_config=
ure.18267
>  checking for X... libraries /usr/X11R6/lib64, headers /usr/X11R6/inclu=
de
>
> On your system it'll be finding th headers in /usr/include/X11, so
> the fix should be the same.
>
> You should probably add entries in the bugtracker for each one of
> these you find and fix as well.

I have found a non correct solution for tetex :
export includedir =3D "${STAGING_INCDIR}"
but that was not a good solution (the package tetex-dev want to install t=
he
files in
${STAGING_INCDIR}...)

Moreover, since xdvi is configure to not be compile, tetex could be confi=
gure
with
-without-x

I will experiment your solution.

Tanks,

Alain




