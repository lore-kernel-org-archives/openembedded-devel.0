Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QAc6w-0005U4-39
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 08:02:31 +0200
Received: by iwn10 with SMTP id 10so2259297iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 23:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nuNGZZr+JOa19zI8XnyKIYqC/kvzXNu7zOlUEHep+6A=;
	b=gTbY7OFxtC8OtIeQJh0X44qkJjPQMPXIPIiVp3eIQMOVH5HlcBlLpdKN8LOF1yNhJD
	1uVYa4U+nVZ0+Uv8Db8LHW57LMHq3git2FWj+u8S1ECJG4H9Yt+X4CeKKXGbMAvfP/Qj
	XmVILxECSMPkEceXYQdcPEUtjrRKJmQYVH1qM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TVf6YGQ/IQ9VVZ6RlbfHy89Z6myLQqFK510sVlD/G0Z96vfZxQLC5wj94AzVs+HLQi
	g4jt3HygkNUs0BjJ2byAan/enHomLcSZF/kdALdfpeSWrhPdROqBAgY/rcvjHloSihok
	k2wbiICyPdL6YSKy4UWdVODzf0PgxYlUz2PiQ=
MIME-Version: 1.0
Received: by 10.231.79.131 with SMTP id p3mr1348108ibk.191.1302847211656; Thu,
	14 Apr 2011 23:00:11 -0700 (PDT)
Received: by 10.231.19.204 with HTTP; Thu, 14 Apr 2011 23:00:11 -0700 (PDT)
In-Reply-To: <1302823477-10855-1-git-send-email-obi@opendreambox.org>
References: <1302823477-10855-1-git-send-email-obi@opendreambox.org>
Date: Fri, 15 Apr 2011 08:00:11 +0200
Message-ID: <BANLkTikBWniZkEgrDekPkzOZo38ge+2WYQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] streamripper: fix depends and license
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
X-List-Received-Date: Fri, 15 Apr 2011 06:02:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/15 Andreas Oberritter <obi@opendreambox.org>:
> - Prefer the shared libmad over the one included in streamripper.
> - glib-2.0 is required to build streamripper.
> - libfaad2 will get picked up if built before streamripper. Make
> =A0builds consistent.
> - No need to set RDEPENDS_${PN} (already set by shlibdeps).
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/streamripper/streamripper_1.64.6.bb | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/streamripper/streamripper_1.64.6.bb b/recipes/stream=
ripper/streamripper_1.64.6.bb
> index 342d92e..39fae01 100644
> --- a/recipes/streamripper/streamripper_1.64.6.bb
> +++ b/recipes/streamripper/streamripper_1.64.6.bb
> @@ -1,8 +1,8 @@
> =A0DESCRIPTION =3D "StreamRipper lets you record streaming mp3 to your ha=
rd drive."
> =A0SECTION =3D "console/multimedia"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "libogg libvorbis"
> -RDEPENDS_${PN} =3D "libogg libvorbis"
> +LICENSE =3D "GPLv2+"
> +DEPENDS =3D "faad2 glib-2.0 libmad libogg libvorbis"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/streamripper/streamripper-${PV}.tar=
.gz;name=3Dsrc"
> =A0SRC_URI[src.md5sum] =3D "a37a1a8b8f9228522196a122a1c2dd32"
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


