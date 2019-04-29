Return-Path: <trini@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89DB07D67A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 00:53:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r6so13360725wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 17:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gPqi1ys2cqUpB9JWGk/WbunaxQrbhjin/SCmu1McKNc=;
	b=qzE141oMUCY5vJOgQHEi195YnjaPJvzIauGJL3hX6kZsqWVquzLohtAopqmDKXKmVi
	sU1BGhtc34LzsCRZg/i7DPdy5qisvoADCm5XZQAUyVZzDGyXZdizlU49mWyrqAVroUML
	ZnsmJTUZmlNmwbrwvE00zGvzQOcPtG6D1i/9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gPqi1ys2cqUpB9JWGk/WbunaxQrbhjin/SCmu1McKNc=;
	b=s8RrG/mN0YImykaH1nqgrV6qNODoPr+f9IJKAZ5vL6v0A3uJ9Kfv3g/aV38hjSG7Gh
	QGCCIlyHzASdOX6hWGxuP60tVbQZPjur8vSy3o+7c4B791A0EenqTfTglEkPyb5ysusR
	gkd6Ql8DeaVcdbGhJrD+oXK0DOhgnWw9wgohifr9q85GUo9kUD3uCw5HrNyR4p3nMozv
	CCTYmbZLhL85P1I4bhnY5x7OBHVlUWw1iVkOqSTpMSaVYeM/xTZ33qzVI7HcnK7Be2HO
	pLRKE7DIzmxSL/Cnnaq1bJjtBB6shxY1w6rBS1l/XXbamSFmAeEySuG7Qt5SQIHKrG6v
	uRaA==
X-Gm-Message-State: APjAAAWlNMduSi2NEnaRA2NY3ycSmA5VlOO+KPOgxdEVGv2vihY2mDcL
	zWUOrZhRt8+kQKYV2oHU+rCHhw==
X-Google-Smtp-Source: APXvYqySiMPYo+XN3uidTEe7rLL7LUIkNeirR7NJtxMSl+b2G+aZA5/ewovplJq3TDNmV47ItU9w+g==
X-Received: by 2002:adf:b696:: with SMTP id j22mr19086392wre.85.1556499215114; 
	Sun, 28 Apr 2019 17:53:35 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	u6sm64485773wrg.72.2019.04.28.17.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Apr 2019 17:53:34 -0700 (PDT)
Date: Sun, 28 Apr 2019 20:53:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Message-ID: <20190429005330.GH31207@bill-the-cat>
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190427213551.14485-1-beniamin.sandu@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.1
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
X-List-Received-Date: Mon, 29 Apr 2019 00:53:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:

> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> ---
>  .../recipes-support/unbound/unbound_1.9.1.bb  | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> 
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> new file mode 100644
> index 000000000..84bbe6581
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
> +	features including enhanced security (DNSSEC) validation, Internet Protocol \
> +	Version 6 (IPv6), and a client resolver library API as an integral part of the \
> +	architecture"
> +
> +HOMEPAGE = "https://www.unbound.net/"
> +SECTION = "net"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> +
> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
> +SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
> +
> +inherit autotools pkgconfig systemd
> +
> +DEPENDS = "openssl libevent libtool-native bison-native expat"
> +RDEPENDS_${PN} = "bash openssl-bin"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
> +		--with-ssl=${STAGING_EXECPREFIXDIR}"
> +
> +PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> +PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"

You should probably add:
PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"

> +do_install_append() {
> +	# systemd support
> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -d ${D}${systemd_unitdir}/system/
> +		install -m 0644 ${B}/contrib/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
> +	fi
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"

Then you're missing the sysvinit script too?  You can just do:
do_install_append() {
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
}

And the right things are packaged or not.

I had a recipe for 1.9.0 locally that I didn't post as I ran into some
other problem with unbound, and then ran out of time to re-visit, which
is why I have these bits handy.

-- 
Tom

