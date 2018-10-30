Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2B63679C98
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:36 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c16-v6so11912083qtj.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OEVtVRfk4BLIyryhz3Y0p4Se3qcx81dRftdFTu5p0YA=;
	b=BZYTYFksol39x54Lc9Xay9jAn0EEOhcE92gIjUCu8AcUM6WQPhPp0JMvTBTNpmIPgQ
	AMdlwWB+qZ5/ZIEAIo3QXzNBDcyGIeD44s/2OXtQ9vf+RwGlXGnPuv+rB2rLazlLVnAD
	6dKVqk4DwyOevQscf4dX7DEGOsQOWCot5TuhjJ+2bjL1pSRNxVBkdjLbHoChoNFT9njN
	YSzNjnj1Z6zGoXWe1QdFrk5ESHc5qdQPGY+cV48E3J1KqDtBNA4UvlWBMzK2qCy1rayu
	2Pnuhmue36hgo/FRSklyetgQ2PU6+/JhASlVqUQg0lP3wyQL+vvEtPz2uvV7QInmTq3y
	Sy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OEVtVRfk4BLIyryhz3Y0p4Se3qcx81dRftdFTu5p0YA=;
	b=k7IP5gZb5AyhGj20vHfJeODeZ5jDupHpONIFagdNTMWcNnQqHZV4LKAG02+thOUZXA
	gq+S7sNEzCYGtdwcR3I8xzgAD4j+tTy4hHX+MMKkQctDA6UVUadNUNPqOCtJas/9ITL/
	1+Glvr09ia0CsmFt/UNQ5/TvUSW1xsy/U2cAMxChcz3/6TgRVmPN+GcVowxCbKCOFnXW
	OcNeyvKimIcTIi3fYwPsU4oXhVI0iRGzVNnIt8CHRzwZEhPX6KFGXEhk3nwLEprKxhqx
	Efu4EmHkArBIxvFuRvCe2XZIMtWoVtFzYVfvc8BAjZG+HFxwT3nu06WErzXwY6yaT+s4
	mUvw==
X-Gm-Message-State: AGRZ1gKSTOC48ISLTE2YgcWCBdzj9oiOLhKnv/Z4pX5YmWGWQQG/T/Hd
	1ZKL34wtkmPMIINyKB90vuvM/oo8z8CXDI5cyQK5Bg==
X-Google-Smtp-Source: AJdET5f8R/O6FZ9mmjhhSl6PSwtAN/NBdr2xbLQTg81Tdpcj7/1ku+RCfp5OK7o1+3Eu5UbDg+c0efs4B/2Wylz3854=
X-Received: by 2002:a0c:d585:: with SMTP id
	g5-v6mr15611778qvi.50.1540870957924; 
	Mon, 29 Oct 2018 20:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<950a5e000cdf171ed8bce8d574a7f7d4b91c1fb7.1540830650.git.brendank310@gmail.com>
In-Reply-To: <950a5e000cdf171ed8bce8d574a7f7d4b91c1fb7.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:49:40 -0700
Message-ID: <CAMKF1sqYo141QcJ1kkrC1zhVnt_tz9uMfuSDjFk536gat6S4pg@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 08/16] libgweather: add recipe for libgweather
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:42 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../recipes-gnome/gnome3/libgweather_git.bb   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
> b/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
> new file mode 100644
> index 000000000..29ee2c90d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/libgweather_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "GNOME Weather Library"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +           gtk+3 \
> +           glib-2.0 \
> +           libsoup-2.4 \
> +           libxml2 \
> +           geocode-glib \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://
> gitlab.gnome.org/GNOME/libgweather.git;protocol=http;branch=gnome-3-28 \
> +           "
> +
> +FILES_${PN} += "${datadir}"
> +FILES_${PN} += "${libdir}"
> +


Does is make sense to package these libraries separately? I ask because if
they are used by other packages then it will not need to pull whole package


> +SRCREV="${AUTOREV}"
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson gobject-introspection
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

