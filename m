Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1R22wf-0005xb-0N; Fri, 09 Sep 2011 17:24:45 +0200
Received: by yia28 with SMTP id 28so910017yia.6
	for <multiple recipients>; Fri, 09 Sep 2011 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9Kat3v0UrI1VoN15ye5Ap32vS7yzX18cLLd4Fs+X75k=;
	b=H+1Ts+b7b+dmUSC/OS7kPfLg7Cl0ya8kQT4AFc/JuxtIgPZHUgnR2RGzm5Kd3YPt1a
	TPbxxICVyu5NtfMKen7Q37XHQycR2XpMtPAiERUq/9YEaK7mjbUv5XUcLYMJlW7cQCHE
	EIO+bfpHG9wNXZMDxZYm+loclGTyO0cPNdPwI=
MIME-Version: 1.0
Received: by 10.68.7.170 with SMTP id k10mr155034pba.176.1315581579126; Fri,
	09 Sep 2011 08:19:39 -0700 (PDT)
Received: by 10.142.223.1 with HTTP; Fri, 9 Sep 2011 08:19:39 -0700 (PDT)
In-Reply-To: <E1R1t89-0005ZW-4f@garnet.openembedded.org>
References: <E1R1t89-0005ZW-4f@garnet.openembedded.org>
Date: Fri, 9 Sep 2011 17:19:39 +0200
Message-ID: <CA+chaQeXiGXt=KOPqgTjUa7y--Oz3MP4_RGEQCrSnxSHPXQx9w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joel A Fernandes : vlc: Imported from OE classic
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
X-List-Received-Date: Fri, 09 Sep 2011 15:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2011 at 6:55 AM, git version control
<git@git.openembedded.org> wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 6e0fb5ec91f5d397b519908e45664f8ce5c64190
> URL: =C2=A0 =C2=A0http://git.openembedded.org/?p=3Dmeta-openembedded.git&=
a=3Dcommit;h=3D6e0fb5ec91f5d397b519908e45664f8ce5c64190
>
> Author: Joel A Fernandes <joelagnel@ti.com>
> Date: =C2=A0 Wed Sep =C2=A07 05:54:06 2011 +0000
>
> vlc: Imported from OE classic
>
> - Reset PR
> - Dropped PRIORITY=3D variable and changed schroedinger dependency to gst=
-plugins-bad
> - Moved common code to .inc
> - Updated LICENSE version to GPLv2
>
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> ---
>
> =C2=A0meta-oe/recipes-multimedia/vlc/vlc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 85 +++++++++++++++++++++++++
> =C2=A0meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb | =C2=A0 12 ++++
> =C2=A02 files changed, 97 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-mul=
timedia/vlc/vlc.inc
> new file mode 100644
> index 0000000..bb67097
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
> @@ -0,0 +1,85 @@
> +DESCRIPTION =3D "Video player and streamer - davinci edition"
> +HOMEPAGE =3D "http://www.videolan.org"
> +LICENSE =3D "GPLv2"
> +SECTION =3D "multimedia"
> +
> +DEPENDS =3D "libfribidi libtool hal gettext libgcrypt gst-plugins-bad vi=
rtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_conditional('ENTERPRISE_DIST=
RO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"

Could you please also import libmad and mpeg2dec?

We're not all enterprise :)


