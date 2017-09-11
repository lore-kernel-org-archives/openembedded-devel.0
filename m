Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6072577811
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:51:22 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id k23so11929752uaf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ely6Zw0U+EMjzZX9QiXMcE+E4fYDpHYel++89PfIKMc=;
	b=esz6JNZyJwfzjxLZ3sUx7oC9fYvJu0laO72HYDdxyP7mbKL3mwrJ0LakRTVEBsSz4E
	J192ok5rHpgy41T7yAbfxOG9Jo4K4IQZA6xaSilTivA7vKdAPP4UZZFA/6M8m2KV0Jt5
	j8FFkmuhHdxewEzdXn4dNNBlDa5htQu09WpFO+vQtsqGwhQmwdHWsm+r73LcVUrLQ7xM
	W1a9c9oY1bOqu+MMrOGCYrCgOotkW92fMp8xtpU+pCW+BPoRRijfmwB8cSdeCixMMlsJ
	7kECSOrGLlsq07tYlJ5+VGz4oLCSAkyc6RXC1zZOMGaVtq09Isg7A9np0HwuGWc8Eq4U
	h8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ely6Zw0U+EMjzZX9QiXMcE+E4fYDpHYel++89PfIKMc=;
	b=B88+gyC6KEgWm+wkaCyx+y8lAjYuTcT67G3h8ej48hPcQJ1ROV2YLvHVBtGCG5Rlps
	/Y2rBQ5K0I2wZpulJJnUeBxlgjArwzJGUrCtG30ib3QA8xMhcR0k6HUcXwjJc7UPfu4t
	S0A7njgtJ6kpfo/kEQdFjDpG/wX8aeX838YtcqpQhgyDlRuwl3fujH5LhlOI7GTNHV1+
	D2fKdYKl/20UE6lXFdse7IaMXHWi4pXuXivNPDWIQsZrCTxjDfxovyrWBJGXi85VPODY
	XUE3S8iS8PNprB/k0yJ4ekogqaTQqL70kKx5tdKf/E+0o2mhzmneZ6z38MdkCh47TT1O
	/8aA==
X-Gm-Message-State: AHPjjUhOYuJDdQMMTMF3Bp4dWBWHPGGM8CP3vcbXf2NxNARc+9Oq4k9d
	DT7Br4lRuXKUeFsbIsWnJmPllYBN+1m6
X-Google-Smtp-Source: ADKCNb40EZkoWLbgkr/wZb/X275UAFpOel2kyuC9bK4wbgIDB45yiguY7qw94xY7H56ATw+LCykzE71J2ptK3qyPIDA=
X-Received: by 10.176.21.109 with SMTP id p42mr1193859uae.127.1505148684212;
	Mon, 11 Sep 2017 09:51:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 09:51:23 -0700 (PDT)
In-Reply-To: <20170911125009.9837-1-fabien.lahoudere@collabora.co.uk>
References: <20170911125009.9837-1-fabien.lahoudere@collabora.co.uk>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Sep 2017 18:51:23 +0200
Message-ID: <CA+chaQdYaQa1-D9tRvvRksdv0vhudTaeUKKgRwwRte-PVLRCcg@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] libupnp: Bump to version 1.8.2
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
X-List-Received-Date: Mon, 11 Sep 2017 16:51:23 -0000
Content-Type: text/plain; charset="UTF-8"

This probably break mpd build:
http://errors.yoctoproject.org/Errors/Details/155531/

On Mon, Sep 11, 2017 at 2:50 PM, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../libupnp/libupnp/sepbuildfix.patch              | 34
> ----------------------
>  .../{libupnp_1.6.21.bb => libupnp_1.8.2.bb}        | 12 ++++----
>  2 files changed, 7 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/
> sepbuildfix.patch
>  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.6.21.bb
> => libupnp_1.8.2.bb} (66%)
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> deleted file mode 100644
> index 0493cea0e..000000000
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/
> sepbuildfix.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Tue, 9 Jun 2015 12:20:45 -0700
> -Subject: [PATCH] Fix builds when using separate source and build
> directories.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ----
> - configure.ac           | 10 +++++-----
> - 1 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index a8731b5..54a3c3d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -744,9 +744,9 @@ AC_OUTPUT
> - #
> - # Files copied for windows compilation.
> - #
> --echo "configure: copying \"autoconfig.h\"          to
> \"build/inc/autoconfig.h\""
> --test -d build/inc || mkdir -p build/inc
> --cp autoconfig.h build/inc/autoconfig.h
> --echo "configure: copying \"upnp/inc/upnpconfig.h\" to
> \"build/inc/upnpconfig.h\""
> --cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
> -+echo "configure: copying \"autoconfig.h\"          to
> \"\$srcdir/build/inc/autoconfig.h\""
> -+test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
> -+cp autoconfig.h $srcdir/build/inc/autoconfig.h
> -+echo "configure: copying \"upnp/inc/upnpconfig.h\" to
> \"\$srcdir/build/inc/upnpconfig.h\""
> -+cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
> -
> ---
> -1.9.1
> -
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_
> 1.6.21.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> similarity index 66%
> rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
> rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> index a1988295a..61b209ab8 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> @@ -8,11 +8,13 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
> -           file://sepbuildfix.patch \
> -"
> +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.
> tar.gz "
>
> -SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
> -SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2bd
> a427567e2a1fb4559bf73ccff0a4f9a39b"
> +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
> +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd6
> 9f049daba11d71bbb5d715336e00106cb4"
> +
> +S="${WORKDIR}/pupnp-release-${PV}"
>
>  inherit autotools
> +
> +EXTRA_OECONF += "--enable-reuseaddr"
> \ No newline at end of file
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

