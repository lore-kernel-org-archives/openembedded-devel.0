Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1F09E71984
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 06:04:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l2-v6so10805362qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 23:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VhfiOl0zFP6RZ19VcgSL41Wc7/omIXdNMdsjDjgRs0o=;
	b=vKZTzW8LsEMbxt1M+h94vf49XmaUVLA2f+QoTvzCHL2UXKStnKsl20I6+fWoTzOVn8
	nta/Nfzuyf3/oUBtCOB1Hno0SkQZSrwHeUfvNJ790zp3/QSJmoT0XFoUiswcRzDjNe0U
	+/unDAXQg9EjuqVhvmMe6MyOqrn2XAVJSA97RNiqHyFtbmFv5RQ3yCZZKXNOsat3YLxJ
	pNTrgEROf1WWM+FMhJoGqzcpjdKn8U3iK45mJtkzboBH8HKoeskh/N8BQXNi82bmMbBi
	cjf++s3GZxMMaa6S4YMJv+ZMOmtJIozQbk2u+jxjUO//8BcTNf9D6ZMh7RCYBjc55EhP
	LWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VhfiOl0zFP6RZ19VcgSL41Wc7/omIXdNMdsjDjgRs0o=;
	b=HtU6xztwUxIyzYd1AQMWvkyvtVwS06j7Q+HitLzdHr17yrJfl0+/HeETLHe81LXz17
	9Xxj7wT2AuDLm5+YSTMe4ls7/iCzIkIDzQT9XXfcHGIHHaxZUhkB9D8bsS/4cVuc/iEq
	HFxjIxAzkyk//L+37JWpFI4oLSGIlaXrl217OGFL5Pqrb9JMSsIeryqyCphpLMqTtKOx
	y3F8dwMy7nU4BsZY4HynBNyR3kswBIdeJxZ43/qTnmlCPACmE1uBQZbqh7OMxLrl92gj
	iVe2gMe7kUXk+P2ZuPWch9PvqPqRhCLd9e4eho2KRnChL76MA1uJiEz4ZhgPZAZBi8l1
	CxRA==
X-Gm-Message-State: ABuFfoiD6zltrTS/7qRYTaPmwgXms+Ki8jLOCQYbGRFIkiKs6Kh8WBb1
	PSCbwOHwz1ENMuqt71WdHIZ0iUpRGfnrhm7CPoQ=
X-Google-Smtp-Source: ACcGV60uzV3b6KuFN6JY2v+tA3SAsd3bgp5oidk+bAf6Dt7FLPASEPNt1pp0Pm7OEPyUvudSuPw9EXQNX61hZLhwjpo=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr4362539qth.314.1538287478978;
	Sat, 29 Sep 2018 23:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180929193105.25864-1-akuster808@gmail.com>
	<20180929194635.GC1449@jama>
	<ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
	<CA+chaQe2D2Byk7CZof3dA64UtSV+PAWOXZ7HHSEdAye22Or22w@mail.gmail.com>
In-Reply-To: <CA+chaQe2D2Byk7CZof3dA64UtSV+PAWOXZ7HHSEdAye22Or22w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Sep 2018 23:04:11 -0700
Message-ID: <CAMKF1so46sTf9VCFcu+D+st5s90npvnPEktt14xyDnPZkC_7Hg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2018 06:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2018 at 10:55 PM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
> The --- marker line serves the essential purpose of marking for patch
> handling tools where the changelog message ends.
>
> One good use for the additional comments after the --- marker is for a
> diffstat, to show what files have changed, and the number of inserted and
> deleted lines per file. A diffstat is especially useful on bigger patches=
.
> Other comments relevant only to the moment or the maintainer, not suitabl=
e
> for the permanent changelog, should also go here. A good example of such
> comments might be patch changelogs which describe what has changed betwee=
n
> the v1 and v2 version of the patch.
>

yeah, i have fixed it locally no need for next rev
>
> On Sat, Sep 29, 2018 at 10:16 PM akuster808 <akuster808@gmail.com> wrote:
>
> >
> >
> > On 09/29/2018 12:46 PM, Martin Jansa wrote:
> >
> > On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
> >
> > ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-opene=
mbedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS o=
n or otherwise requires it)
> >
> > enable aac only if LICENSE_FLAGS is commercial
> >
> > [v2]
> > fix typo in commit message
> > rebase on latest master
> >
> >
> > This belongs to cover later or under ---.
> >
> > I failed to have a [V2] in the subject.  I guess a V3 is inorder for th=
at.
> >
> > Can you point me to the doc that says where a [v2] comments in a git
> > header should be. I can not find it. I seem to be reminded that when I =
do
> > revisions I am doing them wrong.
> >
> > I don't see reference to this policy:
> > https://www.openembedded.org/wiki/Styleguide#Patches
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
> > per kernel process:
> > "The --- marker line serves the essential purpose of marking for patch
> > handling tools where the changelog message ends."
> > Are you saying I should violate that?
> >
> > is there somewhere else I should be looking?
> >
> > - armin
> >
> >
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com> <akuster808@gmail.co=
m>
> > ---
> >  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb =
b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > index 9123673fb..f91ce4d62 100644
> > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
> >  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
> >  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'--with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-syst=
emdsystemunitdir', d)}" <$%7B@bb.utils.contains('DISTRO_FEATURES','systemd'=
,'--with-systemdsystemunitdir=3D$%7Bsystemd_unitdir%7D/system/','--without-=
systemdsystemunitdir',d)%7D>
> >
> > -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsy=
nth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upn=
p openal opus oss recorder vorbis wavpack zlib"
> > +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack=
 libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack z=
lib"
> > +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial'=
, 'aac', '', d)}" <$%7B@bb.utils.contains('LICENSE_FLAGS','commercial','aac=
','',d)%7D>
> >
> >
> > This removes much more than just aac now.
> >
> > Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vorbis?
> >
> >
> >
> >  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
> >  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing listOpenembedded-devel@lists.openembedded.or=
ghttp://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

