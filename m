Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C35BD71A1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 21:35:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z3so13716476wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 13:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YfK2rkOuqTcJ9731f1EjOYKOZ++DWrZR28Cz/H6coSM=;
	b=uS8FZI+tzavQ5jKTPcQZZ7Em3aEYTgPvh/g9A+JS5lp+syVlfMZ4o4Hzxk6N3ZLijU
	BdftO6x97XPDEH18MvtV/V9Ei+qhcJPwy/5ee5gJT21Aik7OGAX0O3LQbxTJa0W3yai5
	UByRYMSFvmT4JyNRB8m9rR27dC54zkRHadCLO1H8c/oNGTy0Sg+WwrMFnkpPcRutzGJc
	yiABIq9qmpV9w/J8yVRNTBABCwm4N5ntTMJdNcM/DjQ6CVBoc6AQOF17fHK7zZ6EIz7z
	TkRphQ1DOyKAYl5XBCPvk7yRdcoP99BIX1XcuduqdGOLzfxesXTJEWMKc2TRvv1sMiso
	Dx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YfK2rkOuqTcJ9731f1EjOYKOZ++DWrZR28Cz/H6coSM=;
	b=PuExNwvlBBBjWLUtFxevKb1tvoxoqQmbXl31Y4Sim8QwPww5ZNX9MwIgLPTuBgAJ9M
	10hjPlhOy1FXzvje/OIxVUs194yw8hI4+EB/XRgFEn+ge0lGryJy+/HekhXwxEbQ5wRT
	HsWHhyZntBaeCFbpg69QL7cum13sAROO17uFUblDsF2m2FOnG++w9ihidKFLJsao3m6N
	3HY7LGlQRAnoz6qwuzcsayXeg/9QeRgKnOm3i4HjaUPifE/iJsMi1Z2Nq8xWcE6+YBMK
	qEqWDns8RNczikFTpI/6QWrWKzAzLN/4zllxkB3GpcPwJi13uLg5cGr5D567oqrdc1Ta
	hBKw==
X-Gm-Message-State: AJaThX4kHgKHuN+1FESYR6U3RHsXFWhZueuQ2u6TT7/pyp0JNP9cAVER
	i5c+R+1FTA2WCoa/oST/qeInn6HqGW7GnXJ65qw=
X-Google-Smtp-Source: ABhQp+QaQ40bDNLK+BYOhZrOv01QLY8BixeGVXaj7BPEn7i/qHGyF4OmJQ+Hqs9If6B6QHZjaMfDKkt86Dj5koLdm8A=
X-Received: by 10.28.58.81 with SMTP id h78mr1520600wma.10.1510176932328; Wed,
	08 Nov 2017 13:35:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 8 Nov 2017 13:35:31 -0800 (PST)
In-Reply-To: <1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
	<1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Nov 2017 22:35:31 +0100
Message-ID: <CA+chaQeKUJT0MBZ3S7uFpj9j_49_Fda=KynqnH9vkF6NsOZxxA@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2 1/6] ddclient: new package
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
X-List-Received-Date: Wed, 08 Nov 2017 21:35:32 -0000
Content-Type: text/plain; charset="UTF-8"

libio-socket-ssl-perl is in meta-perl and meta-networking doesn't depend on
meta-perl.

See my review from Feb 22

On Wed, Nov 1, 2017 at 2:23 PM, Joe MacDonald <joe_macdonald@mentor.com>
wrote:

> From: "Kinsella, Ray" <ray.kinsella@intel.com>
>
> Adding the package ddclient. DDClient updates Dynamic DNS servers with an
> IP address.
> Recipe is based on the original OE recipe found here.
>
> http://cgit.openembedded.org/openembedded/tree/recipes/
> ddclient/ddclient_3.6.3.bb
>
> with modifications based on the recipe at:
>
> https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-
> connectivity/ddclient/ddclient_3.8.3.bb
>
> DDClient version has been updated to 3.8.3.
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45
> ++++++++++++++++++++++
>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>  .../recipes-daemons/ddclient/files/persistent      |  1 +
>  3 files changed, 50 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.
> 3.bb
>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/
> persistent
>
> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> new file mode 100644
> index 0000000..f4ef536
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> @@ -0,0 +1,45 @@
> +SECTION = "net/misc"
> +DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS
> entries for accounts on Dynamic DNS Network Services"
> +HOMEPAGE = "http://ddclient.sourceforge.net/"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "\
> +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
> +    file://ip-up"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +
> +RDEPENDS_${PN} = "\
> +    perl-module-getopt-long \
> +    perl-module-sys-hostname \
> +    perl-module-io-socket \
> +    perl-module-vars \
> +    perl-module-overload \
> +    perl-module-overloading \
> +    perl-module-config \
> +    perl-module-integer \
> +    perl-module-exporter-heavy \
> +    perl-module-symbol \
> +    perl-module-selectsaver \
> +    bash \
> +    perl \
> +    libio-socket-ssl-perl"
> +
> +do_install() {
> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient
> ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default/persistent
> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d
> ${D}${docdir}/ddclient
> +    install -m 755 ${S}/ddclient ${D}${sbindir}
> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/
> ddclient.conf
> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/
> ddclient
> +    install -m 0644 ${WORKDIR}/persistent ${D}/${sysconfdir}/default/
> persistent/50_ddclient
> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g'
> ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> +    install ${S}/README* ${D}${docdir}/ddclient
> +    install ${S}/COPY* ${D}${docdir}/ddclient
> +    install ${S}/sample* ${D}${docdir}/ddclient
> +}
> +
> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
> +
> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b864
> 5199b1995d27605a886b8c71e44d819591"
> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up
> b/meta-networking/recipes-daemons/ddclient/files/ip-up
> new file mode 100644
> index 0000000..4411db9
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
> diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent
> b/meta-networking/recipes-daemons/ddclient/files/persistent
> new file mode 100644
> index 0000000..b721272
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/persistent
> @@ -0,0 +1 @@
> +l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

