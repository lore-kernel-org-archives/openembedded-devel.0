Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DB62979956
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 05:54:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o2-v6so5590124wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GWNWwIkogaB65y8/9bciYBIFSjZxuT6IE2gKBEVAJJA=;
	b=FLqIrC8DVVyVQIJwk6CL70F+4w+15Rm1UH7ubLFKcLat5/BwDnXnkRtMCaLVYylAlx
	ZQQF1CRsGXSEEZ0tlK1mMiJwjBGumdyhuF6w7FfDWWaYfaf1n7eujTZ9VUyN0kWvdNqD
	ezPqvAq+0dznZ1UT0iw6zyI0FmKSwQGwssikbA6gsuwfF+35oPNMO0ZaphnvpnanhucG
	5TUmh6DgZ+EKlNlArTUR2AJkMUJ8wo1/2G4vMo6K5kurbzFXMzQ6lCDbIqki4H2Qa3Bo
	71iQxALopOWfnXj8QrBaRknFeLT2vVjmdUGAeDUjUx2bxcJoD9SZLnsOY1lG9J3P0eHV
	JHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GWNWwIkogaB65y8/9bciYBIFSjZxuT6IE2gKBEVAJJA=;
	b=OIb2HiDqTyvjxr3frO9HfIaNoEEb4NFkQK0nBeg/V1osYF+/+sD/j5rq3Rvlr1u/Ar
	AWla7QB1twf858Su4V5y/5/E03Cj+0fLZksSSWawDsaO0O2oIYaUXxWcaMd73LduIbvL
	4jG+UAI3mhZUTS4gf3+89l1/+NN8mpsBUE2q1RZyPf2Q3EKMRGW0XoGdiwwJACEa0/w2
	iSP5xgEcZQ0lICZvES7EdChsLDypYjuEPCZ0tC10/M7qBH8721vaJEjdhYs7CefO8T6y
	RdAmNtuxh6bn2yUg1FZKMeEdAIUApGdodz4a1KqZQ7CtlI3ay0zGO2uyFJSxuqSZP4Fr
	ESbw==
X-Gm-Message-State: ABuFfoi/PMve7jEMCkTDKVc06eXAHokC4NysBz3YX7/hQOiuk2Vr6cSs
	jj44LcI3/OBiJhKAdzud1B81x4vR55xhCcfnmo0=
X-Google-Smtp-Source: ACcGV63U/C6nlZbZkez/DeCDP9M4rOi42Y4UoSUVBB0Q/AqHvCa/uUxkZ1ljoBleNDXHmT/l9AIpdIm6CoADu8J1Vog=
X-Received: by 2002:a1c:88c6:: with SMTP id
	k189-v6mr5552228wmd.32.1538286878318; 
	Sat, 29 Sep 2018 22:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180929193105.25864-1-akuster808@gmail.com>
	<20180929194635.GC1449@jama>
	<ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
In-Reply-To: <ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Sep 2018 07:54:26 +0200
Message-ID: <CA+chaQe2D2Byk7CZof3dA64UtSV+PAWOXZ7HHSEdAye22Or22w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 30 Sep 2018 05:54:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

The --- marker line serves the essential purpose of marking for patch
handling tools where the changelog message ends.

One good use for the additional comments after the --- marker is for a
diffstat, to show what files have changed, and the number of inserted and
deleted lines per file. A diffstat is especially useful on bigger patches.
Other comments relevant only to the moment or the maintainer, not suitable
for the permanent changelog, should also go here. A good example of such
comments might be patch changelogs which describe what has changed between
the v1 and v2 version of the patch.


On Sat, Sep 29, 2018 at 10:16 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 09/29/2018 12:46 PM, Martin Jansa wrote:
>
> On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
>
> ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openemb=
edded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on =
or otherwise requires it)
>
> enable aac only if LICENSE_FLAGS is commercial
>
> [v2]
> fix typo in commit message
> rebase on latest master
>
>
> This belongs to cover later or under ---.
>
> I failed to have a [V2] in the subject.  I guess a V3 is inorder for that=
.
>
> Can you point me to the doc that says where a [v2] comments in a git
> header should be. I can not find it. I seem to be reminded that when I do
> revisions I am doing them wrong.
>
> I don't see reference to this policy:
> https://www.openembedded.org/wiki/Styleguide#Patches
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
> per kernel process:
> "The --- marker line serves the essential purpose of marking for patch
> handling tools where the changelog message ends."
> Are you saying I should violate that?
>
> is there somewhere else I should be looking?
>
> - armin
>
>
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com> <akuster808@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> index 9123673fb..f91ce4d62 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-system=
dsystemunitdir', d)}" <$%7B@bb.utils.contains('DISTRO_FEATURES','systemd','=
--with-systemdsystemunitdir=3D$%7Bsystemd_unitdir%7D/system/','--without-sy=
stemdsystemunitdir',d)%7D>
>
> -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynt=
h iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp =
openal opus oss recorder vorbis wavpack zlib"
> +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack l=
ibsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zli=
b"
> +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', =
'aac', '', d)}" <$%7B@bb.utils.contains('LICENSE_FLAGS','commercial','aac',=
'',d)%7D>
>
>
> This removes much more than just aac now.
>
> Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vorbis?
>
>
>
>  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
>  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing listOpenembedded-devel@lists.openembedded.orgh=
ttp://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

