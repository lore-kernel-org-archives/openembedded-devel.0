Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id C5B9D7C3BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:32:03 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id b16so1013586ior.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kIUCGbFXYjYZ9sfVHh+DYAgkp1oWby/MY1Yx00BVX4g=;
	b=E56u9zMoq7XV7uKP6wY5D8+Y4oZL5SUUbSdG1EnQZdAGdiOby+EzqD0F1y16Ym3p1I
	KZowu9OUM9RjTyv2ECSGX1nhPCysGi0Rf5WdPao/nAlikTj4342liohzfMEej7mmTIJr
	mNG6F89tplGxtzJgvUlhcmZc8GR7k6YHiDqpmUzBuvPEOcW6FD+fx/SZKgkD05WSANEG
	E9mmQRRSXsaPtO9hDvuTB1R5lhGKoqCJSYPkAAA2qKLcnvixu8ghF9FzlDnhypFRipJI
	LS7d8ECCy9Dcy/NdhLKjAHoTThSd3cmSdqylHZIHCVBJ9s5OGPKUlgKUSVl4WmKmXUMe
	fClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kIUCGbFXYjYZ9sfVHh+DYAgkp1oWby/MY1Yx00BVX4g=;
	b=f+GW+55eXb3Q0qsg2LYaeZxavElAWGQvCgKQWXNyk1d/jUYQNG3pMyxnz0Dwn41cvn
	P5kGg5a4ALs9CJttFOnwZrIJh38/84T8e53rZ/ONNmF2bC4NHF0H1E1TW3TRzhiOWrnz
	YKHysGemPt80aZohkLvFrpz86tyXk6bgx2adt5sew4A4Bpq6Vxof9EEpgpS7k6RbCyp8
	+j8+h0+M8EtjWc50u2L++Od3B/nXv+jTcGeUdUT+HYOTfXVdeGGVr5aze9adRctPa17i
	a/e5+hY1HGV+ps4Iqdp5+EoL+tC74rDeRiSPuHg8dOf0Ubmcpa45DJYxpAMQXngxxXrX
	FGBg==
X-Gm-Message-State: AJcUukc0dyZR1fRqwLwcdHVY/CLkwbNX/HsIxeOexoee0ZkYTgUyiGzz
	xNiWz9BCe7d3zuKaAWS54yEf/dV+vNxvx6PjWBbgD8Uh
X-Google-Smtp-Source: AHgI3IaUvhf//9lbhpoHUkbGYuPW2bGU7l723DIwknVS3Mm5Rf32Xjy6ilgROGjTsrOOIfbqipYR6k95tvusyuf3tY8=
X-Received: by 2002:a5e:cb09:: with SMTP id p9mr19602097iom.91.1548887524746; 
	Wed, 30 Jan 2019 14:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20190130095201.11965-2-bunk@stusta.de>
In-Reply-To: <20190130095201.11965-2-bunk@stusta.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 30 Jan 2019 23:31:52 +0100
Message-ID: <CALbNGRQTaFFC1P1zQvjwO=-Kr1s61UPTGBv1w0+5YcCaXsnzFA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Fix the libnm* packages
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
X-List-Received-Date: Wed, 30 Jan 2019 22:32:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 10:52 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> - libnmutil, libnmglib and libnmglib-vpn no longer exist
>   after the 1.10.10 -> 1.14.4 upgrade
Checked (OK am on thud environment) but it is 1.14.4. All packages you
want to remove contain files on my build! Are you sure that you have
the required PACKAGECONFIGS set (please set all and test) and the
nasty new 'polkit' in your distro features?

So Khem - have seen this on master-next - please block this one - I
expect fallout.

Andreas


> - add a package for libnm
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb    | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
> index f1826c68e..9efe1fe49 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
> @@ -90,14 +90,12 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
>
> -PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
> +PACKAGES =+ "libnm \
>    ${PN}-nmtui ${PN}-nmtui-doc \
>    ${PN}-adsl \
>  "
>
> -FILES_libnmutil += "${libdir}/libnm-util.so.*"
> -FILES_libnmglib += "${libdir}/libnm-glib.so.*"
> -FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
> +FILES_libnm += "${libdir}/libnm.so.*"
>
>  FILES_${PN}-adsl = "${libdir}/NetworkManager/libnm-device-plugin-adsl.so"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

