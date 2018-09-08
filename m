Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF1479436
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 00:51:25 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6-v6so18125734qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 17:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=11/7kvcD+OANYiaTeeCFPeT1pygMe/Ap+ASuc0+hCPc=;
	b=c7GQYbzRnNkm4mSHI3Zozsagous1JlapQb31No8l4B2desomQkv9HoL/lRrllDB4hp
	5ImC6wyEkUFFKmwscuMM92x50GFVFD0cKrQIhzq0tV6dff4dCy+dygPHp/ixvv5NwgGf
	xhcHK9itPh832tKBpm8Q2qzpk54jnsBLR6H2glSLElq1FMpFBO3nBvNoT6yDIdnAqJ4h
	OpwabQJ0IY8ubj2juagBaHeYWIlu4vLZW+ggidcrzK1ehgKT+a3OhUJh+ylxojVXTR+H
	Ub6SNP5JEOn+3OopYoPSXzPCElu5t86NxbLxmKjzEbG6l3SFNCDT0tpLh5XI6LRQIi6R
	9S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=11/7kvcD+OANYiaTeeCFPeT1pygMe/Ap+ASuc0+hCPc=;
	b=RMcHeuMNxflUvJTRFCCiIJn73PGiU0EzSNx2p5Z4PLbuZDD+ISW0lxUU+S+FQp7GrK
	Xk6oSy7XEScqgIBpvaw4P/nmhF/CDiGCnc4GEVg1qzEFsREF6nLIpezbE7dPXFKBr0wR
	JNR+acR6rHvo+xBau7zIz/l3sjj2P23Pj1bunx6SSiVHPpEaeZYs6J9JTsKD5DztbhEE
	LsF0wguLBcFed0y1HQh9LBwfANwP7vVmMgxbDa0LACVWT9a3dSpiSHMRKvoxXZwS6isM
	IJFUsK28cYqwP0/tspXFZuJWn9iK3HXlWOUY4qIN/icqDSXE/gCkPSJmSielMD68ddpx
	db5w==
X-Gm-Message-State: APzg51BqO3XieiJCdn6cMidj4LyyXWu0ScycEWv3YVM7kXMuJYEeyYp3
	I+D75biv8Ze8BSEEhU9bROzoURsYBcrotk8aC/E=
X-Google-Smtp-Source: ANB0Vdb5DawBJgErt3dEcGgWKhCPWj3+aVhccimypbZM1UZR6nDsM181cP0UeIZ5WcIlECkh9OmAvwbGerBeSN6nvg0=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr7786619qvo.50.1536367886071; 
	Fri, 07 Sep 2018 17:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180907105515.18840-1-brgl@bgdev.pl>
In-Reply-To: <20180907105515.18840-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2018 17:50:59 -0700
Message-ID: <CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
To: brgl@bgdev.pl
Cc: bgolaszewski@baylibre.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] networkd-dispatcher: new package
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
X-List-Received-Date: Sat, 08 Sep 2018 00:51:25 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/192034/
On Fri, Sep 7, 2018 at 3:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This adds a recipe for networkd-dispatcher.
>
> It's a simple package containing a python script that needs to be
> installed together with a systemd service and an example config
> file. There's nothing to build.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> NOTE: resending with a proper tag
>
> v1 -> v2:
> - skip the package if systemd is not in DISTRO_FEATURES
> - use -D in install for new directories
> - use deltask instead of an empty do_compile() function
> - define PV in the recipe as <version>+git${SRCPV}
>
>  .../networkd-dispatcher.bb                    | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> new file mode 100644
> index 000000000..7bb2347a8
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
> @@ -0,0 +1,33 @@
> +python __anonymous() {
> +    features = d.getVar('DISTRO_FEATURES')
> +    if not features or 'systemd' not in features:
> +        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
> +}
> +
> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
> +more limited in the types of events it supports due to the limited nature of \
> +systemd-networkd(8)."
> +AUTHOR = "Clayton Craft and others"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> +
> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
> +
> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
> +PV = "1.7+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +# Nothing to build, just a python script to install
> +deltask do_compile
> +
> +do_install() {
> +    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
> +    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
> +    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
> +}
> +
> +FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
> --
> 2.18.0
>

