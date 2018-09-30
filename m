Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id C868B71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 14:51:08 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id i10-v6so11504877qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B1aWyVTmJn3d1k0P5ve8qup5CpWZa6dgBL0q/fDL3ko=;
	b=ahiNtEarBWMtArIimy8VMqqev7snIw/IgrliVvn+W1lMbWAXdxtjczDfldTWSFy7Up
	tm/jGTMOIWJzCLBYbn1wgV6FsbFsxT9O1PKySyKd7flsBlMBysYMiLBxyjfDuxyRHQd3
	QdzP2vATm15SW+254P8OUUV85bf5L3AXCVMWKGPlseow1NwovnO3GNhjio7cmNfmPe1o
	6VDQjxwm+JYG2LnZwu/wqG95BZHmf2A1/KBHilTXp6impaPj4x2M5kCR45636MQdQwE2
	OJcsSsRpKZO/R7GLeM7SLsnDH9BHdtV3eECFwbnZ4lAyIIEWerioN1fuiCPFu8zmmTjR
	U/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B1aWyVTmJn3d1k0P5ve8qup5CpWZa6dgBL0q/fDL3ko=;
	b=aQodVwiDerW8aczCj2OkWFKJB0NuK9fAZ8iTiv+Afi/c0kPe/v3LHVmUm1N1hinqvs
	DnOBGHZyoLzw1taRQYJZyfQiNygprWBJz6E5/7VZqf5f8dokfDQzv7PeLsRtwX9HMkFh
	oT4rmhvSNS3DVXqI+HvuEbbl0u19inWLtASWYVQqRLppaSxYkZktm1pHfdagtyZyHnaW
	QBs7dmdFkovKbrGJ8mvo0FDQOSv+CTYv4l61nZ0VQc3cia2ok0AwxBe9VDmU/6I34V1Z
	psce85eblLRk4uf+kn3EgTeAR1wVVnCFx5psTkjN3tbArWgxyHr1i00CskDAzzUhXocG
	x1Cw==
X-Gm-Message-State: ABuFfoik64uzRQAkCYDo83FEClWzT1qZV04RE6pA4Ru+bMQUwr++TEwq
	dQyvEJoS8hqy9UFq7MZIkDJiN66AXuwjqj9JD5s=
X-Google-Smtp-Source: ACcGV61AYZbIWDtc2Y/4BHrbJkxWqddASVL4jd8JA570sJclkaSkbkbMrDIFJ3AQBGAzZn/K/QhMzOLGsnoMFxHno1o=
X-Received: by 2002:a0c:e552:: with SMTP id
	n18-v6mr3718221qvm.224.1538319069403; 
	Sun, 30 Sep 2018 07:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180929193105.25864-1-akuster808@gmail.com>
	<20180929194635.GC1449@jama>
	<ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
	<CA+chaQe2D2Byk7CZof3dA64UtSV+PAWOXZ7HHSEdAye22Or22w@mail.gmail.com>
	<CAMKF1so46sTf9VCFcu+D+st5s90npvnPEktt14xyDnPZkC_7Hg@mail.gmail.com>
	<20180930061055.GD1449@jama>
In-Reply-To: <20180930061055.GD1449@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Sep 2018 07:50:42 -0700
Message-ID: <CAMKF1sqoYytz5j_KVAtKk7zQmqHysx0U1d4JH5vFJ78xdEGFXQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Sep 2018 14:51:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct. Armin I think a v3 is better.
On Sat, Sep 29, 2018 at 11:10 PM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> On Sat, Sep 29, 2018 at 11:04:11PM -0700, Khem Raj wrote:
> > On Sat, Sep 29, 2018 at 10:55 PM Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > >
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l
> > >
> > > The --- marker line serves the essential purpose of marking for patch
> > > handling tools where the changelog message ends.
> > >
> > > One good use for the additional comments after the --- marker is for =
a
> > > diffstat, to show what files have changed, and the number of inserted=
 and
> > > deleted lines per file. A diffstat is especially useful on bigger pat=
ches.
> > > Other comments relevant only to the moment or the maintainer, not sui=
table
> > > for the permanent changelog, should also go here. A good example of s=
uch
> > > comments might be patch changelogs which describe what has changed be=
tween
> > > the v1 and v2 version of the patch.
> > >
> >
> > yeah, i have fixed it locally no need for next rev
>
> Only the commit message, right?
>
> Because the PACKAGECONFIG is still incorrect in:
> http://cgit.openembedded.org/meta-openembedded-contrib/commit/?h=3Dyoe/mu=
t&id=3D14a9f80296aa0141ea9a065439970f8fc1e0c36b
>
> There is also typo in the subject and
> "mpd: enable aac PACKAGECONFIG only with commercial LICENSE_FLAGS
>
> * fix yocto-check-layer issue with multimedia"
>
> would be better commit message IMHO.
>
> > >
> > > On Sat, Sep 29, 2018 at 10:16 PM akuster808 <akuster808@gmail.com> wr=
ote:
> > >
> > > >
> > > >
> > > > On 09/29/2018 12:46 PM, Martin Jansa wrote:
> > > >
> > > > On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
> > > >
> > > > ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-o=
penembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPEN=
DS on or otherwise requires it)
> > > >
> > > > enable aac only if LICENSE_FLAGS is commercial
> > > >
> > > > [v2]
> > > > fix typo in commit message
> > > > rebase on latest master
> > > >
> > > >
> > > > This belongs to cover later or under ---.
> > > >
> > > > I failed to have a [V2] in the subject.  I guess a V3 is inorder fo=
r that.
> > > >
> > > > Can you point me to the doc that says where a [v2] comments in a gi=
t
> > > > header should be. I can not find it. I seem to be reminded that whe=
n I do
> > > > revisions I am doing them wrong.
> > > >
> > > > I don't see reference to this policy:
> > > > https://www.openembedded.org/wiki/Styleguide#Patches
> > > > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > > > https://www.kernel.org/doc/html/latest/process/submitting-patches.h=
tml
> > > >
> > > > per kernel process:
> > > > "The --- marker line serves the essential purpose of marking for pa=
tch
> > > > handling tools where the changelog message ends."
> > > > Are you saying I should violate that?
> > > >
> > > > is there somewhere else I should be looking?
> > > >
> > > > - armin
> > > >
> > > >
> > > >
> > > > Signed-off-by: Armin Kuster <akuster808@gmail.com> <akuster808@gmai=
l.com>
> > > > ---
> > > >  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21=
.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > > index 9123673fb..f91ce4d62 100644
> > > > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > > @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
> > > >  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
> > > >  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', '--with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-=
systemdsystemunitdir', d)}" <$%7B@bb.utils.contains('DISTRO_FEATURES','syst=
emd','--with-systemdsystemunitdir=3D$%7Bsystemd_unitdir%7D/system/','--with=
out-systemdsystemunitdir',d)%7D>
> > > >
> > > > -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac flu=
idsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile=
 upnp openal opus oss recorder vorbis wavpack zlib"
> > > > +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 =
jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpa=
ck zlib"
> > > > +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commerc=
ial', 'aac', '', d)}" <$%7B@bb.utils.contains('LICENSE_FLAGS','commercial',=
'aac','',d)%7D>
> > > >
> > > >
> > > > This removes much more than just aac now.
> > > >
> > > > Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vor=
bis?
> > > >
> > > >
> > > >
> > > >  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
> > > >  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> > > > --
> > > > 2.17.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing listOpenembedded-devel@lists.openembedde=
d.orghttp://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

