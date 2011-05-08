Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QJ2Hb-0005sU-AQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 13:36:19 +0200
Received: by vxd7 with SMTP id 7so5728413vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 04:33:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.20.81 with SMTP id e17mr1303390vcb.85.1304854414088; Sun,
	08 May 2011 04:33:34 -0700 (PDT)
Received: by 10.220.195.202 with HTTP; Sun, 8 May 2011 04:33:34 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <1304852952.4124.52.camel@mattotaupa>
References: <1304852453-9294-1-git-send-email-robert@erafx.com>
	<1304852952.4124.52.camel@mattotaupa>
Date: Sun, 8 May 2011 07:33:34 -0400
Message-ID: <BANLkTimLb=i4eLMD2NWLRcC5QxADWQa4Mg@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] x264_r2245: do not override `DEPENDS` for x86
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
X-List-Received-Date: Sun, 08 May 2011 11:36:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 8, 2011 at 7:09 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Bob,
>
>
> Am Sonntag, den 08.05.2011, 07:00 -0400 schrieb Bob Foerster:
> > The recipe intended to add "yasm-native" to the dependencies on x86,
> > but it set DEPENDS_x86 = "yasm-native" which obliterated the base
> > dependencies. On a fresh build, this package was failing since it
> > was trying to build before the compiler was ready.
> >
> > Depends is now set with DEPENDS_append_x86, which leaves the base
> > dependencies intact.
>
> Btw. What `MACHINE` and `DISTRIBUTION` do you use?
>

machine=x86, distro=custom


>
> > Signed-off-by: Bob Foerster <robert@erafx.com>
> > ---
> >  recipes/vlc/x264_r2245.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> > index 0cffea3..21e5a0e 100644
> > --- a/recipes/vlc/x264_r2245.bb
> > +++ b/recipes/vlc/x264_r2245.bb
> > @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
> >  X264_DISABLE_ASM = "--disable-asm"
> >  # use assembler written functions for those archs supporting this
> >  X264_DISABLE_ASM_x86 = ""
> > -DEPENDS_x86 = "yasm-native"
> > +DEPENDS_append_x86 = " yasm-native"
> >
> >  EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM}
> --extra-cflags="${X264_ECFLAGS}"'
>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

