Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0J9A-0002g6-IR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 20:09:29 +0200
Received: by qyk6 with SMTP id 6so2370713qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yx9rPUu/rCTFHKHWA/0HQKkR/PbVWW4YVSUfBhHi054=;
	b=wY8YryNonr6TK218tidxyfzV+c5WOnvS/WpXQt1N90puDhdSkfto6dHbToNmyQJ61d
	M5DKrtq2J2tBya3LoSUqa/I4DbEHVALQZ9Yp22ivdDYM5Wt5Ix2FSSW+QhtWPSlYOGXv
	AdMP0EOuc6diNrjUDWgnFcbtlCQfy1cQ2uuIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BVJSg3slAK4KwZOCBM2J5T8atANUFgEo0+/bhHvA8VwvWnKn6wM6yP0EPa5R9LyqQp
	FmVv4awIKQmUcvsySqdzoHtRdNPyYUxsSrB9s9Ya6SCA40trd10AHCjd0uiInwFJhHKX
	8AunMMjbFUSw2+RAAl3QZ/mi1lx8pZudHMz9I=
MIME-Version: 1.0
Received: by 10.229.31.147 with SMTP id y19mr1028333qcc.5.1256062103894; Tue, 
	20 Oct 2009 11:08:23 -0700 (PDT)
In-Reply-To: <23738f080910021832k712d31dcra5e2fda045a892e6@mail.gmail.com>
References: <23738f080910021832k712d31dcra5e2fda045a892e6@mail.gmail.com>
Date: Tue, 20 Oct 2009 11:08:23 -0700
Message-ID: <19c1b8a90910201108u1ad326c3w251d73e793d1b848@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Tue, 20 Oct 2009 18:09:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2009 at 6:32 PM, Sashan Govender <sashang@gmail.com> wrote:
> I'm trying out openembedded but get this error:
>
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/sashan/code/openembedded/build/tmp/work/i486-oe-linux-gnu/module-i=
nit-tools-cross-3.2.2-r5/temp/log.do_compile.12217)
> | NOTE: make
> | gcc =C2=A0-isystem/home/sashan/code/openembedded/build/tmp/staging/x86_=
64-linux/usr/include
> -O2 -g -Wunused -Wall -static
> -L/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
> -Wl,-rpath-link,/home/sashan/code/openembedded/build/tmp/staging/x86_64-l=
inux/usr/lib
> -Wl,-rpath,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/=
usr/lib
> -Wl,-O1 -o insmod.static insmod.o
> | /usr/bin/ld: cannot find -lc
> | collect2: ld returned 1 exit status
> | make: *** [insmod.static] Error 1
> | FATAL: oe_runmake failed
>
> This is my local.conf file:
>
> DL_DIR =3D "${HOME}/archives"
> BBFILES =3D ${OEBASE}/openembedded/recipes/*/*.bb
> BBMASK =3D ""
> PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
> PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-=
initial"
> PREFERRED_PROVIDERS +=3D "
> virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
> MACHINE =3D "x86"
> TARGET_OS =3D "linux"
> DISTRO =3D "minimal"
> IMAGE_FSTYPES =3D "jffs2 tar"
> BINCLUDELOGS =3D "yes"
>
> What am I missing?

its looking for libc.a on your build machine because you are linking
static version. Depending upon what distro you run on
your host you can install appropriate package. e.g on debian/ubuntu
libc6-dev provides it.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


