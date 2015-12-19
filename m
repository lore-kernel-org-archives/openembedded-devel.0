Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 395426FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2015 04:43:20 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id jw2so5367601igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2ZoCoPImgYIb1ES+BC4xCiGYvFxPukCpmxaVXvpalZI=;
	b=WFraJd/w8GUaYv2omfcQaZB6xhhVUOf7X9TrMI7jkMCFdEKX0gXul7bPLXDhQ5VKwc
	gj67WACvfW0/UCIShfs40I3dE+ZlgTcs7LIeUA7xGOXrKEsLV41JUjQPq/yt/EURP/Z3
	lvvjvLN3qeobqa/ix3sw/ninvEWtfXB5+pwqEG0b1SFE2RnTyYD+1Hjaan7YZvbz8kp4
	pzdzGwUDJ3RDKIMoBCNii41G/gMLSmDIV38qAkggHdcr3YsjhpBnR8LXmMCXxJdChclv
	LT1z3J5eGSAs81pQqJ4ivoHnp0ZzGtr7W4NwOLgLhqxCZuaxaZa29ogjKrfgyc7qgkXs
	p+Mw==
MIME-Version: 1.0
X-Received: by 10.50.143.10 with SMTP id sa10mr7447740igb.77.1450500201564;
	Fri, 18 Dec 2015 20:43:21 -0800 (PST)
Received: by 10.107.12.205 with HTTP; Fri, 18 Dec 2015 20:43:21 -0800 (PST)
Received: by 10.107.12.205 with HTTP; Fri, 18 Dec 2015 20:43:21 -0800 (PST)
In-Reply-To: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
References: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
Date: Fri, 18 Dec 2015 20:43:21 -0800
Message-ID: <CAMKF1spvhZi0v4Kw4r1KvmtO6qYyptZ45uuSOD8+BPrvPTDyWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [meta-networking][PATCH 1/3] strongswan: add additional PACKAGECONFIG flags
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
X-List-Received-Date: Sat, 19 Dec 2015 04:43:21 -0000
Content-Type: text/plain; charset=UTF-8

Shouldnt openssl be a packageconfig too
On Dec 18, 2015 12:50 PM, "Chris Patterson" <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> - Add aesni, charon, gmp, openssl, scep, stroke, swanctl, and
>   systemd-charon.
> - Organize the packageconfig list alphabetically.
> - Update the default PACKAGECONFIG to match current defaults.
> - If swanctl is enabled, use strongswan-swanctl.service instead of
>   strongswan.service.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  .../recipes-support/strongswan/strongswan_5.3.2.bb |   24
> ++++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/
> strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/
> strongswan_5.3.2.bb
> index a231a90..df7b496 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
> @@ -14,21 +14,31 @@ SRC_URI = "
> http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
>  SRC_URI[sha256sum] =
> "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
>
> -EXTRA_OECONF = "--enable-gmp \
> -        --enable-openssl \
> +EXTRA_OECONF = " \
>          --without-lib-prefix \
>  "
>
>  EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
>
> -PACKAGECONFIG ??= "sqlite3 curl \
> +
> +PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
>          ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
>  "
> -PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
> -PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
> +PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
> +PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
>  PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
> -PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
> +PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,"
> +PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
>  PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
> +PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
> +PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
> +PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
> +PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
> +PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,"
> +PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
> +
> +# requires swanctl
> +PACKAGECONFIG[systemd-charon] =
> "--enable-systemd,--disable-systemd,systemd,"
>
>  inherit autotools systemd pkgconfig
>
> @@ -42,4 +52,4 @@ FILES_${PN}-staticdev += "${libdir}/ipsec/*.a
> ${libdir}/ipsec/plugins/*.a"
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl',
> '${BPN}-swanctl.service', '${BPN}.service', d)}"
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

