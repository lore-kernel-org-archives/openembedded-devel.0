Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LPhaX-0008GG-1U
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jan 2009 19:14:05 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id B19D11F529E; Wed, 21 Jan 2009 19:06:58 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRUX1YACig=
Message-ID: <47406.AFRUX1YACig=.1232561218.squirrel@webmail.no-log.org>
In-Reply-To: <34438.AFRUX1YACig=.1232560782.squirrel@webmail.no-log.org>
References: <34438.AFRUX1YACig=.1232560782.squirrel@webmail.no-log.org>
Date: Wed, 21 Jan 2009 19:06:58 +0100 (CET)
From: GNUtoo@no-log.org
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: fixing scummvm
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
X-List-Received-Date: Wed, 21 Jan 2009 18:14:05 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Hello,
> the last scummvm(0.12) and maybe others scummvm version are broken beca=
use
> of that:
>
> do_compile() {
> oe_runmake CC=3D"${CC}" CXX=3D"${CXX}" CFLAGS=3D"${CFLAGS}" \
> CXXFLAGS=3D"${CXXFLAGS}" \
> LDFLAGS=3D"${LDFLAGS} ${@base_conditional('ENTERPRISE_DISTRO', '1', '',
> '-lmpeg2', d)}" \
> DEFINES=3D"-DUNIX -DSCUMM_NEED_ALIGNMENT -DUSE_VORBIS -DUSE_ZLIB -DUSE_=
MPEG2
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '-DUSE_MAD -DUSE_MPEG=
2',
> d)}"
> }
>
> I was told that was triggered by a script(which goal is obvious...remov=
e
> mp3 support because of software patents(because openmoko company had a
> problem with patents:
> http://lists.openmoko.org/pipermail/community/2008-November/035618.html
> and
> http://lists.openmoko.org/pipermail/community/2008-November/035635.html=
))
>
> the solution would be to remove that and to remplace it by:
> EXTRA_OECONF =3D "--host=3D${HOST_SYS} \
> 		--backend=3Dsdl \
> 		--with-sdl-prefix=3D${STAGING_BINDIR_CROSS} \
> 		--disable-alsa \
> 		--prefix=3D${prefix} \
> 		--with-ogg-prefix=3D${STAGING_LIBDIR}/.. \
> 		--with-vorbis-prefix=3D${STAGING_LIBDIR}/.. \
> 		${@base_conditional('ENTERPRISE_DISTRO', '1', '--disable-mpeg2',
> '--with-mpeg2-prefix=3D${STAGING_LIBDIR}/..', d)} \
> 		${@base_conditional('ENTERPRISE_DISTRO', '1', '--disable-mad',
> '--with-mad-prefix=3D${STAGING_LIBDIR}/..', d)} \
> 		"
> in scummvm.inc
>
> I contacted the maintainer but I had on response yet...
>
> what should I do?
> fix all recipes and commit them?
oops I didn't told the details:
here's the mail I sent:

>You seem to be the maintainer of scummvm in openembedded.
>The policy says to contact the maintaner and not to push changes without
>contacting him:
>* Recipe changes are less sensitive but maintainers should be consulted
>where known
>
>Here's the problem:
>you can compile scummvm fine,however when you run it you discover that
>none of the engines are built-in and so you can't play any games.
>
>here is the solution with a recipe:
>http://bugs.openembedded.net/show_bug.cgi?id=3D4958
>but:
>*I've done it only for one of the recipes
>*the PR is wrong change it before commiting
>
>should I do the necessary changes on each recipe and report to you befor=
e
>commiting?
>
>Thanks for your work.



