Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 63F4560123
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:28:09 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k6so24543945wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=4ivd6TyWnsMQ3zxGwt7yNrL0PTJXvKc9pD/AMvNVVjs=;
	b=ZsMKnpctfqCjSWlAAzocoXx/WGdtPNcKhKpgS786o8yYW+Cv+w30uGfKMgAsXtNcjR
	2sxbbGYCO9T0iUSYyU/8NCnYzY1iz+x8GM/CM0JdDHW52hszB9X71fmoASMWQlD/e/Ma
	ZqgZVVgcaPYtnPL+roqymXSTrlSl1vbl2gbUL/VzPoXY4GaM35EXTdwQTBfHXdN1JPya
	DngDztGEQBg2OxVOUALH7XOXnBCE9cB/r8kX4DYu6u2sQg3i7wJ9pCwGtPQN0wudJl8g
	gRszv8dOlfjVB5SmCMpYcUnOChivrzL5YzCuuE1qWRj6c4W91VWbDf6Yhf6q/0Px/fpv
	mMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=4ivd6TyWnsMQ3zxGwt7yNrL0PTJXvKc9pD/AMvNVVjs=;
	b=aiMcuuwH8eVTQ4Ed9xtO9HL6wxdi+li1XQYM8yKrzaNU+E753qTNMPBytftH+lYlH6
	re7E8yiKCBMaPB8fQx6+3ubhlTJKl4+q0JITw7+oEQlNN3NIZeNBJwfY2uS4+qPSpKoT
	8RPYAMQUsw4MlHgVAligUxT9hk/wlTekouSGo02ZRL3OVTmErCe4KSvXZr/V6+FzTXzb
	ciZJeWFmE/b++/Iw+QyhIPdMiF2Y0wKIrgrfxUnm2fs4kq1wOd6MUoKw3Hwjye6yJwhY
	DrOSev6IoB+ScsF7MiwAMUc9F+f/u5ulgF7jXzw8vIImhbfoZzkF3NbwVUe4UWtVzddE
	fWaQ==
X-Gm-Message-State: AFeK/H0mQBttXitR6V7UPJ7vT9wMRCmwmnHkNP/j64i+vgNu06Yx5Ht9ENWnA5PZFq3zXp57cKo/7yJI1Xy19A==
X-Received: by 10.223.128.194 with SMTP id 60mr19379333wrl.175.1491413290935; 
	Wed, 05 Apr 2017 10:28:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:27:40 -0700 (PDT)
In-Reply-To: <20170405134010.GA18688@graute-opti>
References: <20170405134010.GA18688@graute-opti>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:27:40 -0700
Message-ID: <CAMKF1sq7vX1rwFL062BB_8UXeCxzQcdyr=PsZsUvEsfwqs-QjA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe_macdonald@mentor.com>
Subject: Re: [meta-networking] [PATCH] unbound: this patch adds unbound to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 17:28:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 6:40 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
> Unbound is a validating, recursive, and caching DNS resolver
>
> Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
> ---
>  .../recipes-support/unbound/unbound_1.6.1.bb       | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.6.1.bb
>
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.6.1.bb b/meta-networking/recipes-support/unbound/unbound_1.6.1.bb
> new file mode 100644
> index 0000000..b6e0a42
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound_1.6.1.bb
> @@ -0,0 +1,57 @@
> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
> +DESCRIPTION = "\ Unbound is designed as a set of modular components, so that \
> +                also DNSSEC (secure DNS) validation and stub-resolvers \
> +                (that do not run as a server, but are linked into an applica \
> +                tion) are easily possible."
> +
> +HOMEPAGE = "https://www.unbound.net/"
> +SECTION = "net"
> +LICENSE = "BSD"

Can you see which clause it is ? it will make it more clear

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> +DEPENDS = "openssl libtool libevent"
> +RDEPENDS_${PN} += "bash"
> +inherit autotools pkgconfig
> +PR = "r0"

drop it

> +
> +SRC_URI = "https://www.unbound.net/downloads/${BP}.tar.gz"
> +SRC_URI[md5sum] = "aa808f33d94a36c9312d1b8ad8805e14"
> +SRC_URI[sha256sum] = "42df63f743c0fe8424aeafcf003ad4b880b46c14149d696057313f5c1ef51400"
> +
> +S = "${WORKDIR}/unbound-${PV}"
> +
> +EXTRA_OECONF = " \
> +        --host=${TARGET_SYS} \
> +        --sysconfdir=/etc/ \
> +        --localstatedir=/var \
> +        --sbindir=/usr/bin \

these look redundant.

> +        --with-conf-file=/etc/unbound/unbound.conf \
> +        --with-pidfile=/run/unbound.pid \
> +        --with-rootkey-file=/etc/trusted-key.key \
> +"
> +
> +do_configure () {
> +        ${S}/configure ${EXTRA_OECONF}
> +}

do we really need it? can't be reconfigure ?

> +
> +do_compile () {
> +        oe_runmake
> +}

redundant remove this function

> +
> +do_install () {
> +        install -d ${D}${bindir}
> +        install -d ${D}${libdir}
> +        install -d ${D}${sysconfdir}
> +        install -m 644 -D ${S}/libunbound/unbound.h ${D}${includedir}/unbound.h
> +        install -m 644 -D ${S}/doc/example.conf.in ${D}${sysconfdir}/unbound/unbound.conf
> +        install -m 644 -D ${S}/contrib/unbound.service.in ${D}${libdir}/systemd/unbound.service
> +        install -m 755 unbound ${D}${bindir}
> +        install -m 755 unbound-anchor ${D}${bindir}
> +        install -m 755 unbound-checkconf ${D}${bindir}
> +        install -m 755 unbound ${D}${bindir}
> +        install -m 755 unbound-control-setup ${D}${bindir}
> +        install -m 755 unbound-host ${D}${bindir}
> +        install -m 755 ${WORKDIR}/build/.libs/libunbound.so* ${D}${libdir}
> +}

do this in a do_install_append()

> +
> +FILES_${PN} ="${sysconfdir}/unbound/unbound.conf ${bindir}/unbound* ${libdir}/systemd/unbound.service ${includedir}/unbound.h ${libdir}/libunbound.so*"
> +FILES_${PN}-dev = "${includedir}/*"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

