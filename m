Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QJ1i6-0004Q2-Tn
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 12:59:40 +0200
Received: by vxd7 with SMTP id 7so5712036vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 03:56:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.116.146 with SMTP id m18mr1294895vcq.120.1304852214228;
	Sun, 08 May 2011 03:56:54 -0700 (PDT)
Received: by 10.220.195.202 with HTTP; Sun, 8 May 2011 03:56:54 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <20110508005952.GC20352@sakrah.homelinux.org>
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
	<20110508005952.GC20352@sakrah.homelinux.org>
Date: Sun, 8 May 2011 06:56:54 -0400
Message-ID: <BANLkTinOOsKHe7oh79ChQOVksHftxf+9Gg@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Sun, 08 May 2011 10:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 7, 2011 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (04/05/11 11:56), Bob Foerster wrote:
> > The recipe intended to add "yasm-native" to the dependencies on x86,
> > but it set DEPENDS_x86 = "yasm-native" which obliterated the base
> > dependencies. On a fresh build, this package was failing since it
> > was trying to build before the compiler was ready.
> >
> > Depends is now set with DEPENDS_append_x86, which leaves the base
> > dependencies intact.
> >
> > Signed-off-by: Bob Foerster <robert@erafx.com>
> > ---
> >  recipes/vlc/x264_r2245.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> > index 0cffea3..8c2b5b4 100644
> > --- a/recipes/vlc/x264_r2245.bb
> > +++ b/recipes/vlc/x264_r2245.bb
> > @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
> >  X264_DISABLE_ASM = "--disable-asm"
> >  # use assembler written functions for those archs supporting this
> >  X264_DISABLE_ASM_x86 = ""
> > -DEPENDS_x86 = "yasm-native"
> > +DEPENDS_append_x86 = "yasm-native"
>                          ^
> you need a space
>
>
Oddly, it works without the space. From bitbake -e:
DEPENDS="pkgconfig-native autoconf-native automake-native help2man-native
libtool-native libtool-cross gnu-config-native virtual/i486-oe-linux-gcc
virtual/libc yasm-native"

Nonetheless, I'll add a space and send a v2.



> Otherwise looks ok
> >
> >  EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM}
> --extra-cflags="${X264_ECFLAGS}"'
> >
> > --
> > 1.7.1
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

