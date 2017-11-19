Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9D77876F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 23:20:08 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id z125so2196611ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 15:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2o4fGDXdHnfnm2Rxj2TmY8kewFd/37TpLFey2lk2Suk=;
	b=Ou0eZCX9i5LGHGEXtwfbgSbHVb/DgYc06Hdt/UDcatzCn98nQKz/QrW2UvXLBuPOFt
	Vo4aNpfBHQJolVgLkqyfOCh/fhK1lovW0s5gewINtYB9/wnWvf+dMwlPFC0FuVwlVyY7
	yz4trzrX7SyOZO7RsMu/nlDHwkuAWUbqzJco/LAvtkkJeM0AkmrTa0cidbpTnIZxlNZq
	fBbVZ3WKobzuWIzoXBdlPaS9oRsCPqcKVFWwfpJRHbYj78wi+/APzDreP4bvnqnsrLb0
	CmKl/svrCOIEBlvUaDobEqxFJQy7kn1dTzlB9G2S3YfRv08K61UmtRcVuYxtr6TUVfgt
	TREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2o4fGDXdHnfnm2Rxj2TmY8kewFd/37TpLFey2lk2Suk=;
	b=Ityzm8VWiK3ulGDiDHOdSO1uiab3OU/JvBf4EqG4VcJOxd8GsHgcqUeANpnDT6kVYQ
	qd/y5qBN32J2zLDwttLgXb7FbEgH5mAI1Cd/iK2NAoFVaZJDe1vBCIMrQ0hEYPQMoCBn
	YR/nYiuWW1Fy0fdlOmpi9nTARt/R90nmTO++rH/Cpdwxrb1M23/rAIyT56c69yY/QscE
	OQ0gAmK9YC8M057ufqkAKVmSzGbCO+yZIXr6l6PKEJZSW1BtK3L7sRYKGLA+aNTlaiD1
	6TrIl9e/jYpHd05IH0QdJonaI+0ZKSxF00hU0VlnRU0+XjqvUx1vpf5Mr0ciT0BSL9+g
	a2dA==
X-Gm-Message-State: AJaThX5OLYgsS4wrfVJI4nOnD5hkDqn0nRtnTaVadDtzFbN92cxlVtc1
	XggdOFgBO6pLPQS6wSPuaLyUOv7/26nNlamng24=
X-Google-Smtp-Source: AGs4zMaNTU6tGU659k6+QBBQ40pxizaChr9aAWGJIaSW4DkWem254DmPLtQnhPw/D5PyGNEMb4rJJLq5VGaD/a87hhE=
X-Received: by 10.129.158.149 with SMTP id v143mr7632374ywg.49.1511133609725; 
	Sun, 19 Nov 2017 15:20:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.102.17 with HTTP; Sun, 19 Nov 2017 15:20:09 -0800 (PST)
In-Reply-To: <20171111132950.12570-11-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
	<20171111132950.12570-11-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 20 Nov 2017 00:20:09 +0100
Message-ID: <CALbNGRRSPjQLS3Ht+vtJadLSJ0xpCa+OHoc+jJVg7Bv26FF+QQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][v2 10/13] tumbler: ensure thumbnails work properly
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
X-List-Received-Date: Sun, 19 Nov 2017 23:20:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2017 at 2:29 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> From: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> After some builds link tumbler-cache-plugin.so is not prperly created
> causing:
> | Failed to load the cache plugin "tumbler-cache-plugin.so":
> /usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so: cannot open
> shared object file: No such file or directory
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> index 1f5419a..1786eff 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> @@ -15,6 +15,12 @@ INSANE_SKIP_${PN} =3D "dev-so"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-
> thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0
> gstreamer1.0-plugins-base"
>
> +do_install_append() {
> +    # Makefile seems to race on creation of symlink. So ensure creation
> here
> +    # until fixed properly
> +    ln -sf tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/
> plugins/cache/tumbler-cache-plugin.so
> +}
> +
>  FILES_${PN} +=3D "${datadir}/dbus-1/services \
>                  ${libdir}/tumbler-1/tumblerd \
>                  ${libdir}/tumbler-1/plugins/*.so \
> --
> 2.9.5
>
> Just saw that this was not applied. For clarification: The first version
of this patch was buggy and Khem pointed that out. Later I checked further:
The problem persists and is sporadic (some race in Makefile?). So at the
time I created the patch I thought it fixed the problem but fix was random
only. Then I fixed the patch and sent it in V2.

My suggestion:
* I will rebase this patch (tumbler was updated) and resend again for
master.
* Later when rebased version is in master I will send this to apply for
rocko.

Is that OK or is there anything else wrong with this patch?

Regards

Andreas

