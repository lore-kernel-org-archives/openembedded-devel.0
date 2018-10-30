Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5E07469B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:32 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 131so6410450qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NkwzCb50pSna3h5906yR7KQtCHE9NUVH8w/ZkRiSNRU=;
	b=elkguk8+Q8bH5/J4g8xGtPAqdBiojBlf0iOzxHDpkjDqzIEh1UueTfSHXTfR+dcfdC
	8e6W0Uz8C5CgTPwl5SC+AIcCt2lc2JXkwW5vp23CFZ4vdPj/09RwHjy4dmKUqAKDTnK9
	RTT12WVhET1q9mW7tZ7PaeA2A4V2f3XkT4RHQF+wdjBEJZ8aBiiUI4OM4j2lc2C24RIY
	Ms056eOSKJmuhQ60avvEC/7/xP0yeTtoEjKsEa3Thj9IhylOW3Nn6zPEye9drFHjCveK
	5s6saw8yGicZegLLENxffeByoUmkQOnveucjcN7PuxrWY5cLTdvuUDermWeIdrD+5MWB
	1ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NkwzCb50pSna3h5906yR7KQtCHE9NUVH8w/ZkRiSNRU=;
	b=oRBph+nppjPFARByY/5hEPVyBzIQIb82aPximQ00NmLjB3NE7oY96jB4gJJU1+G0g9
	fAMlLCTNqoA33y8wn8gv0wJhML63EXwniuu7IYeKYuVo6zrVM9nQG0gN1F3Xrv+BSoqF
	HKFfgdc+c8c0hFvbhv+Yv2YRjC5NXWjMEmPqXg6Djm7B+Qj4Uh7sIcPdTXu2HhQAn9lK
	ip4CX7V+pnIwwwwB/Ldm7zRUP0IlR4FuBl6eIYIcq7dnF87NFZfL6y0olS3V7jva8lpb
	z5mytDst4d8IQ/wGRlNKK9UKCV9ZlTyqGOrUDs47F+F+9pZ/IkLKIBIOY6wLqJMb5qGm
	VWYg==
X-Gm-Message-State: AGRZ1gIxCV27/H6hu6gXmhZf/GEwR2D4kniaqf8BNl8wjtmyBsUDf3HS
	xV2azHd2+Ti8QiKGEDdwXFX0dDji0reov3oBB7I=
X-Google-Smtp-Source: AJdET5eh4HMsmU5rRgaBRCh9/3mlCgeLhqD/uuSn7Ln84QZcpIP8N8g1fnplRwaywSmkCSHwi5rU3sBfyFec1I6RfVE=
X-Received: by 2002:a37:91c2:: with SMTP id
	t185-v6mr8978067qkd.223.1540870952833; 
	Mon, 29 Oct 2018 20:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
In-Reply-To: <dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:32:51 -0700
Message-ID: <CAMKF1srqe7q2xwAp20o-6KP6MqeFNqz105NL4BfyAbgDeQAHxg@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 16/16] gnome-tweak-tool: add recipe for the GNOME Tweak tool
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 29, 2018 at 9:43 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by:  Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../recipes-gnome/gnome3/gnome-tweaks_git.bb  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
> b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
> new file mode 100644
> index 000000000..fe305c922
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "GNOME Tweaks"
> +LICENSE =3D "GPLv2"


This seems should be GPL-3.0 as that=E2=80=99s what
Being checksummed few lines below

>
> +DEPENDS =3D " \
> +            gnome-shell \
> +          "
> +
> +LIC_FILES_CHKSUM =3D
> "file://LICENSES/GPL-3.0;md5=3D9eef91148a9b14ec7f9df333daebc746"
> +
> +SRC_URI =3D "git://
> gitlab.gnome.org/GNOME/gnome-tweaks.git;protocol=3Dhttp;branch=3Dmaster;t=
ag=3D3.30.1
> \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +FILES_${PN} +=3D "${libdir}"
> +FILES_${PN} +=3D "${datadir}"
> +
> +inherit pkgconfig meson gobject-introspection gettext
> +
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

