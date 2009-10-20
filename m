Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N0Jow-0003hD-9B
	for openembedded-devel@openembedded.org; Tue, 20 Oct 2009 20:52:37 +0200
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N0Jnk-0008JX-Dq
	for openembedded-devel@openembedded.org; Tue, 20 Oct 2009 14:51:20 -0400
Date: Tue, 20 Oct 2009 14:50:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <19c1b8a90910201108u1ad326c3w251d73e793d1b848@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.0910201450110.29057@localhost>
References: <23738f080910021832k712d31dcra5e2fda045a892e6@mail.gmail.com>
	<19c1b8a90910201108u1ad326c3w251d73e793d1b848@mail.gmail.com>
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
Subject: Re: building module-init-tools-cross fails
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
X-List-Received-Date: Tue, 20 Oct 2009 18:52:37 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-557989236-1256064680=:29057"

--8323328-557989236-1256064680=:29057
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Oct 2009, Khem Raj wrote:

> On Fri, Oct 2, 2009 at 6:32 PM, Sashan Govender <sashang@gmail.com> wrote=
:
> > I'm trying out openembedded but get this error:
> >
> > ERROR: function do_compile failed
> > ERROR: log data follows
> > (/home/sashan/code/openembedded/build/tmp/work/i486-oe-linux-gnu/module=
-init-tools-cross-3.2.2-r5/temp/log.do_compile.12217)
> > | NOTE: make
> > | gcc =C2=A0-isystem/home/sashan/code/openembedded/build/tmp/staging/x8=
6_64-linux/usr/include
> > -O2 -g -Wunused -Wall -static
> > -L/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
> > -Wl,-rpath-link,/home/sashan/code/openembedded/build/tmp/staging/x86_64=
-linux/usr/lib
> > -Wl,-rpath,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linu=
x/usr/lib
> > -Wl,-O1 -o insmod.static insmod.o
> > | /usr/bin/ld: cannot find -lc
> > | collect2: ld returned 1 exit status
> > | make: *** [insmod.static] Error 1
> > | FATAL: oe_runmake failed
> >
> > This is my local.conf file:
> >
> > DL_DIR =3D "${HOME}/archives"
> > BBFILES =3D ${OEBASE}/openembedded/recipes/*/*.bb
> > BBMASK =3D ""
> > PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
> > PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cros=
s-initial"
> > PREFERRED_PROVIDERS +=3D "
> > virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
> > MACHINE =3D "x86"
> > TARGET_OS =3D "linux"
> > DISTRO =3D "minimal"
> > IMAGE_FSTYPES =3D "jffs2 tar"
> > BINCLUDELOGS =3D "yes"
> >
> > What am I missing?
>
> its looking for libc.a on your build machine because you are linking
> static version. Depending upon what distro you run on
> your host you can install appropriate package. e.g on debian/ubuntu
> libc6-dev provides it.

  if you're running fedora, you need to separately install the
"glibc-static" package.

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-557989236-1256064680=:29057--
