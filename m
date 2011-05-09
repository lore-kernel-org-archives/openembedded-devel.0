Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QJRtv-0006J9-FJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 16:57:35 +0200
Received: by vxd7 with SMTP id 7so153601vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 07:54:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.20.81 with SMTP id e17mr1516420vcb.85.1304952889728; Mon,
	09 May 2011 07:54:49 -0700 (PDT)
Received: by 10.220.195.202 with HTTP; Mon, 9 May 2011 07:54:49 -0700 (PDT)
X-Originating-IP: [207.180.56.102]
In-Reply-To: <1304868955.4124.67.camel@mattotaupa>
References: <1304852453-9294-1-git-send-email-robert@erafx.com>
	<1304852952.4124.52.camel@mattotaupa>
	<BANLkTimLb=i4eLMD2NWLRcC5QxADWQa4Mg@mail.gmail.com>
	<1304868955.4124.67.camel@mattotaupa>
Date: Mon, 9 May 2011 10:54:49 -0400
Message-ID: <BANLkTi=ZS_Cubc9+9o0tqc3z9D9vGvExWg@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 May 2011 14:57:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 8, 2011 at 11:35 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Am Sonntag, den 08.05.2011, 07:33 -0400 schrieb Robert Foerster:
> > On Sun, May 8, 2011 at 7:09 AM, Paul Menzel wrote:
>
> > > Am Sonntag, den 08.05.2011, 07:00 -0400 schrieb Bob Foerster:
> > > > The recipe intended to add "yasm-native" to the dependencies on x86,
> > > > but it set DEPENDS_x86 = "yasm-native" which obliterated the base
> > > > dependencies. On a fresh build, this package was failing since it
> > > > was trying to build before the compiler was ready.
> > > >
> > > > Depends is now set with DEPENDS_append_x86, which leaves the base
> > > > dependencies intact.
> > >
> > > Btw. What `MACHINE` and `DISTRIBUTION` do you use?
> >
> > machine=x86, distro=custom
> >
> > > > Signed-off-by: Bob Foerster <robert@erafx.com>
> > > > ---
> > > >  recipes/vlc/x264_r2245.bb |    2 +-
> > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > >
> > > > diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
> > > > index 0cffea3..21e5a0e 100644
> > > > --- a/recipes/vlc/x264_r2245.bb
> > > > +++ b/recipes/vlc/x264_r2245.bb
> > > > @@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
> > > >  X264_DISABLE_ASM = "--disable-asm"
> > > >  # use assembler written functions for those archs supporting this
> > > >  X264_DISABLE_ASM_x86 = ""
> > > > -DEPENDS_x86 = "yasm-native"
> > > > +DEPENDS_append_x86 = " yasm-native"
> > > >
> > > >  EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM}
> > > --extra-cflags="${X264_ECFLAGS}"'
> > >
> > > Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
> I pushed your patch upstream in 0409d1d9 [1].
>
> Please update the patch queue [2] with for example the following
> command.
>
>        $ pwclient update -s Accepted -c
> 0409d1d98a400c56d348de1f49c8a09f38b52fba 3385
>
> I do not have the rights to change the state of patches I did not
> submit.
>
>
>
Done. Thanks, Paul!



> Thanks,
>
> Paul
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=0409d1d98a400c56d348de1f49c8a09f38b52fba
> [2] http://openembedded.org/index.php/Patchwork
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

