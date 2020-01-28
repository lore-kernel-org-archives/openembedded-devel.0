Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89CF37F971
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 02:47:23 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e7so12529398iof.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 18:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H6goR2KMeGQcv2w/5gJuE2Rpy7hXfPOy7oVUGpncZ1U=;
	b=aWM526JsR1sl7Au4vCR26Ap9shxzfNyjkVhq3HpDvUjuQWSsZDwv54ojmCaucZoNDt
	yupm/JeFXqJwoqPmpBdaF4hB4VZyjYgWCilX/RtTQ5ydNbXgi36yoJWUM2n2yY/z97xM
	AIxKtsqE1pHw3SIPRNqus3mxi/D+bcVATetMmYmmijlZyHiPrd5SnLyHcFzzLLqD/ZbE
	cWE//anZxRAh13qXcrWdkxoO85Gj3tPdP3YiRlk1hO0UWsTE5AmkKcJSNbDF6Y1wTVWT
	fXKeGpgjdNnKHH6U8uNXWXM4TDymL9ljaoonxxR3X1LcUJJyAmxmbVb5K7WbMxbKkm5A
	matw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H6goR2KMeGQcv2w/5gJuE2Rpy7hXfPOy7oVUGpncZ1U=;
	b=N8MVDhWaZSpXrUwC1sWWPY7/wRVJYJxxoTrvcjQKyOhNQpp2BQJYiuLTx4LqGpyMMh
	psrWZWIKD3cpqqPNbasIDJuNJVnONwJX/KBg9wmYBotD8jxSiA/1NbR+HJrSq7+8DK6f
	KOsYR+ft06z2AXAGwSBhvlRhBQ5VeEKw68u3kGZxHCJtB2GXtBDzJwHJq417JcnIr0rr
	9TaMigSnChmQG7BFbBPVWhtYoOgg99sCCoajZi7k0UhRZ73XV/GK2RRpZN9fHRMnKslb
	+Uj7dnFLDeh38B4NprvV8Oqi9YFvtzlALwxlQE3ySKQDNamqDHFeAmdg0tak2M4F3roy
	12HQ==
X-Gm-Message-State: APjAAAVKKugjFkUwL2m9T2welLMlVNsOaj0BwidO8vkNAuCRa67V8BTd
	BU9mTWa3FbGJtuGfHdEYGnMuekwFc/k6Kv6Z2Ss=
X-Google-Smtp-Source: APXvYqySFgukyLotbmJf0mpNoBENZ4aZLqIMnGfm4A7EwkguMVdw8Jia3XGzBzN1oYQsqfrvAxxI8Qze0pN4oIYWrq4=
X-Received: by 2002:a02:742:: with SMTP id f63mr16063652jaf.138.1580179644359; 
	Mon, 27 Jan 2020 18:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20200127231234.26090-1-andrey.z@gmail.com>
In-Reply-To: <20200127231234.26090-1-andrey.z@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 27 Jan 2020 18:47:12 -0800
Message-ID: <CANx9H-CFuV6qACC8avZQUzLLCiDx3iiKWzpFqxSS9mxtnrG_aw@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] dnssec-conf: move recipe from oe-core to meta-python2
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
X-List-Received-Date: Tue, 28 Jan 2020 02:47:23 -0000
Content-Type: text/plain; charset="UTF-8"

It's moving from meta-networking, not oe-core. I'll simply change the
commit log locally before merging.

On Mon, Jan 27, 2020 at 3:12 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> dnssec-conf did not receive any updates since 2010 and relies heavily on
> python2 code base.
>
> Move recipe to this layer, since python2 support has been dropped in
> oe-core.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  .../dnssec-conf/dnssec-conf_2.02.bb           | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>
> diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> new file mode 100644
> index 0000000..ca59bd2
> --- /dev/null
> +++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "DNSSEC and DLV configuration and priming tool"
> +DESCRIPTION = "\
> +DNSSEC configuration and priming tool. Keys are required until the root \
> +is signed, as well as for local unpublished DNSSEC keys to be preloaded \
> +into the recursive nameserver. These DNSSEC configuration files can be \
> +directly included in the bind or unbound nameserver configuration files. \
> +dnssec-conf includes a commandline configuration client for Bind and \
> +Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
> +and harvested keys, as well a script to harvest DNSKEY's from DNS. \
> +See also: system-config-dnssec"
> +HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
> +SECTION = "net"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +DEPENDS += "xmlto-native docbook-xml-dtd4-native \
> +            docbook-xsl-stylesheets-native libxslt-native"
> +
> +SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
> +SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    rm -rf ${D}
> +    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
> +    # We no longer ship trust anchors. Most of these are in the DLV
> Registry now.
> +    # and it prevents the problem of shipping outdated trust anchors.
> +    # For DLV, we ship the ISC DLV Registry key
> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
> +    install -d -m 0755 ${D}${sysconfdir}/sysconfig
> +    install -m 0644 packaging/fedora/dnssec.sysconfig
> ${D}${sysconfdir}/sysconfig/dnssec
> +}
> +
> +RDEPENDS_${PN} = "python"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

