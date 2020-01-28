Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38D8F7FE75
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:03:03 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n21so14563763ioo.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OiJo8psu6S+FGvPUwDt+5LtSMv0jtfkjGzVxXOMOI4o=;
	b=IztmoCz9J+ZqOeXBTkNljRJgMU67M4qldl7M0CVqL0iCeZ1ao4n0jPH/wH/+XAhsHz
	+U4eKTx1QwCoJiSlKZPxSVLcvBiMHdX39Dc1amRL7iXKsIYr9/eY3uJhrunBUaBJBKUU
	Mu7mHpePY08jSnWsbjsTaGPWtUTAnx4E/ESkvrnzXE1YS8CljOLfRNCzUE/tpavJoKRz
	fHeNRgG+AGZyGQZBZ5iH8CQjqeDz+QYJVYIALYXnb7ze9zo2PYuuOakQQjjcchWHEUGr
	rjdCnAPox6LGNe+6Qb/y3+CgpoDo0b0Bc12PxPKQAUrC+RGwtBR96cZjDlQvmAunG8NA
	uLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OiJo8psu6S+FGvPUwDt+5LtSMv0jtfkjGzVxXOMOI4o=;
	b=d6FrVNjY0dwlu19mb/Gm7us9IP9AfA3rsWutls9TsJCbNphIYyrg+Wo9mioeKTaL9C
	V+T9MTgkUcayXazyZ5OG8cJsqemn8rc3RkcAX9jAZ0tWfMNF7weLprnwUpMHkily+vYy
	JgnsfCgR/7mNd250m4LKDTvj+ZJyPUyehRABXkXZMqxNyvezOPL3L9v/xmEdAbiSLxeU
	xj/e87RLRMeXWldT39X00LomsdWF+AmFwDLnFRWmtItJhYDEB6bMo8yxganK+RotNK0c
	xZjNE42u/w1QPdMPhOGfLJnAHrJgCxCwsi8tzN/m5B0j/NmnUb48WRuNkgTYsGyPmJlc
	D62g==
X-Gm-Message-State: APjAAAU8nJ6s7lrq+Sr4dmdefTS1R9ormJ9OSbBHVGAXhw60rrxmzem6
	6WnBse71rbhdhG/5LLkCZCnvZ30TlE+Jb0Q01f0=
X-Google-Smtp-Source: APXvYqw11zmZTEOIJH/C4197C0dQw1rraroWaZ9Kyj5HpwYqVrXZy9T/ReCRfD6GjinGbcsb7Gt87xg7K1bdteXHO9Q=
X-Received: by 2002:a02:94a2:: with SMTP id x31mr18510843jah.22.1580223784934; 
	Tue, 28 Jan 2020 07:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20200127231234.26090-1-andrey.z@gmail.com>
	<CANx9H-CFuV6qACC8avZQUzLLCiDx3iiKWzpFqxSS9mxtnrG_aw@mail.gmail.com>
	<CANx9H-Aqfjqk+DHEKU6i=cqfwhxrKYxvXj0+iePDxw6LCeBfoA@mail.gmail.com>
	<CAHtQpK7UsCX4--Zn60p_vGY2be4dbiDwLJZgcV2Sup25rG8UZA@mail.gmail.com>
In-Reply-To: <CAHtQpK7UsCX4--Zn60p_vGY2be4dbiDwLJZgcV2Sup25rG8UZA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Jan 2020 07:02:53 -0800
Message-ID: <CANx9H-DFVySGQOhjrY=NxUxTsuASZW4Y1rh8xCGGeTmZf1Hexw@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Jan 2020 15:03:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 10:42 PM Andrey Zhizhikin <andrey.z@gmail.com>
wrote:

> Hello Tim,
>
> On Tue, Jan 28, 2020 at 5:37 AM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Mon, Jan 27, 2020 at 6:47 PM Tim Orling <ticotimo@gmail.com> wrote:
> >>
> >> It's moving from meta-networking, not oe-core. I'll simply change the
> commit log locally before merging.
> >>
> >> On Mon, Jan 27, 2020 at 3:12 PM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >>>
> >>> dnssec-conf did not receive any updates since 2010 and relies heavily
> on
> >>> python2 code base.
> >>>
> >>> Move recipe to this layer, since python2 support has been dropped in
> >>> oe-core.
> >>>
> >
> > There were missing RDEPENDS which I have fixed and sent to ML (already
> merged). While I was at it I sent the version of this patch that was
> actually merged. Obviously nobody has been using this since it could not
> have worked without the RDEPENDS.
>
> Thanks for taking care of this! Sorry I've missed those RDEPENDS, I
> had no possibility to test runtime of this package. But it looks like
> it would not have worked even in the the [meta-networking] layer
> before (other than people using it would have those packages pulled by
> IMAGE_INSTALL).
>
>
No worries. I am trying to make sure "everything" we add to meta-python2 is
functional, so at least it was "known good" when we branch the next stable
release. That said, I am sure that due to the volume of recipes merged
early on there are probably still some land mines.

>
> >
> >>> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> >>> ---
> >>>  .../dnssec-conf/dnssec-conf_2.02.bb           | 35
> +++++++++++++++++++
> >>>  1 file changed, 35 insertions(+)
> >>>  create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >>>
> >>> diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >>> new file mode 100644
> >>> index 0000000..ca59bd2
> >>> --- /dev/null
> >>> +++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
> >>> @@ -0,0 +1,35 @@
> >>> +SUMMARY = "DNSSEC and DLV configuration and priming tool"
> >>> +DESCRIPTION = "\
> >>> +DNSSEC configuration and priming tool. Keys are required until the
> root \
> >>> +is signed, as well as for local unpublished DNSSEC keys to be
> preloaded \
> >>> +into the recursive nameserver. These DNSSEC configuration files can
> be \
> >>> +directly included in the bind or unbound nameserver configuration
> files. \
> >>> +dnssec-conf includes a commandline configuration client for Bind and \
> >>> +Unbound, known DNSSEC keys, URL's to official publication pages of
> keys, \
> >>> +and harvested keys, as well a script to harvest DNSKEY's from DNS. \
> >>> +See also: system-config-dnssec"
> >>> +HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
> >>> +SECTION = "net"
> >>> +LICENSE = "GPLv2+"
> >>> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
> >>> +DEPENDS += "xmlto-native docbook-xml-dtd4-native \
> >>> +            docbook-xsl-stylesheets-native libxslt-native"
> >>> +
> >>> +SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
> >>> +SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
> >>> +
> >>> +S = "${WORKDIR}/git"
> >>> +
> >>> +do_install () {
> >>> +    rm -rf ${D}
> >>> +    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir}
> install
> >>> +    # We no longer ship trust anchors. Most of these are in the DLV
> Registry now.
> >>> +    # and it prevents the problem of shipping outdated trust anchors.
> >>> +    # For DLV, we ship the ISC DLV Registry key
> >>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
> >>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
> >>> +    install -d -m 0755 ${D}${sysconfdir}/sysconfig
> >>> +    install -m 0644 packaging/fedora/dnssec.sysconfig
> ${D}${sysconfdir}/sysconfig/dnssec
> >>> +}
> >>> +
> >>> +RDEPENDS_${PN} = "python"
> >>> --
> >>> 2.17.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Regards,
> Andrey.
>

