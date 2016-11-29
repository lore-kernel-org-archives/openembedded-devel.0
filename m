Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75F9871A00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:41:24 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x186so7489277vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VwhgnGMRL60tC2tBBZkm+jr/K3ivWDdzdGRtUHapNdU=;
	b=YGP+D8kvNAAXRcfYA1kn0JUs7xYHOu6N8xKw03vlQPEDGJsfJtpmTB0G3Cu7pAMbiM
	VkpbCbt5RgnIag8VchFidLZ25fkAXa1nFRtSOt41adeiB/ydsSo4B6DEUSv7nD23ufY9
	XxE9dkwNhi7eUcWQzEJoWQsCMZZUUXjRL9+xh0IpJtQS6FgDXp8dgKHTEZBF63iHzzXb
	T22EHsf7O/Hb7phoqhX1lIEmh+Qd1qQKIu2T8BdW1MeqLbYX31a1piTXWpe/iZ7y3vat
	gx6NNOF2p4bmWYjrHg+ABJtaHMlADcSo9rdC3Q+FzzM6Ols/FCqz/ieEFRg7FoOQMQ4f
	2aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VwhgnGMRL60tC2tBBZkm+jr/K3ivWDdzdGRtUHapNdU=;
	b=ZnBQe5t/JnL+YdnDyw8AS2gzsAOphYyBSQKqlBt8ptlZtBot9JWw3rp/yk7hcC7Aj9
	C+LiqqxP2xW87NASF9JrGH2AvicrUZfkk8jlU6UbYXOIDhv5pzrd9oFa7g80cEyyvx2C
	LRa4hVBWtXbd17JQwjXbkwknK/pBx/n3g6f+v8ubHY+LCl4l6X8xlsmnKdMuezCjaOkr
	K3zGQscGEcOywIKuAALepk8EqUu2rjB0Ipg5yalbvXc+xAVfUh9++HvzE97un7vU56WP
	FR8AZFfxuMVfNs6dGc1H9itUNSUdNWa3LHWUUZqIcio9JnIciKlQAVQE4y10584xb8DM
	uewA==
X-Gm-Message-State: AKaTC00Z7BLSDxbQc/2TV/w0LB2CNmX5L/0UcPF2RdRJ6j//hIK8fGN3NG0sFWQbYJyeLJc8sMGyqgp0WALUiQ==
X-Received: by 10.31.197.195 with SMTP id v186mr10344194vkf.84.1480444885356; 
	Tue, 29 Nov 2016 10:41:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 29 Nov 2016 10:41:24 -0800 (PST)
Received: by 10.159.48.87 with HTTP; Tue, 29 Nov 2016 10:41:24 -0800 (PST)
In-Reply-To: <20161129090416.GA2700@jama>
References: <20161126062435.27569-1-raj.khem@gmail.com>
	<20161126062435.27569-3-raj.khem@gmail.com>
	<20161129090416.GA2700@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2016 10:41:24 -0800
Message-ID: <CAMKF1spPYgsMzSgm68a7cEG=QjUCns0261QQWqyOE=59t6JxjA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH V3 3/4] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Tue, 29 Nov 2016 18:41:26 -0000
Content-Type: text/plain; charset=UTF-8

Hmm yes seems so.

On Nov 29, 2016 1:04 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Fri, Nov 25, 2016 at 10:24:34PM -0800, Khem Raj wrote:
> > * Add packageconfig for krb5
> > * Require pam in distro
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-protocols/dante/dante_1.4.1.bb         | 49
> ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/dante/
> dante_1.4.1.bb
> >
> > diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> > new file mode 100644
> > index 0000000..0fb0f67
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> > @@ -0,0 +1,49 @@
> > +SECTION = "console/utils"
> > +SUMMARY = "A free SOCKS server"
> > +DESCRIPTION = "Dante consists of a SOCKS server and a SOCKS client,\
> > +implementing RFC 1928 and related standards. It is a flexible product\
> > +that can be used to provide convenient and secure network\
> > +connectivity. Once installed, Dante can in most cases be made\
> > +transparent to clients, providing functionality somewhat similar to\
> > +what could be described as a non-transparent Layer 4 router."
> > +HOMEPAGE = "http://www.inet.no/dante/"
> > +
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed9734672
> 49"
> > +
> > +SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
> > +          "
> > +SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
> > +SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fc
> deef4b28b16b048d804b50b48f261c4f53"
> > +
> > +# without --without-gssapi, config.log will contain reference to
> /usr/lib
> > +# as a consequence of GSSAPI path being set to /usr by default.
> > +# --with-gssapi-path=PATH specify gssapi path
> > +# --without-gssapi        disable gssapi support
> > +# --enable-release        build prerelease as full release
> > +EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
> > +
> > +DEPENDS += "flex-native bison-native libpam"
> > +
> > +inherit autotools-brokensep
> > +
> > +REQUIRED_DISTRO_FEATURES = "pam"
>
> Did you forget to add distro_features_check to inherit?
>
> I've added this when cherry-picking to master-next, but not sure if Joe
> will pick it from there.
>
> > +
> > +EXTRA_AUTORECONF = "-I ${S}"
> > +
> > +PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
> > +PACKAGECONFIG[krb5] = ",--disable-krb5,krb5"
> > +
> > +PACKAGECONFIG ??= ""
> > +
> > +do_install_append() {
> > +    install -d ${D}${sysconfdir}
> > +    cp ${S}/example/sock[sd].conf ${D}${sysconfdir}
> > +}
> > +
> > +PACKAGES =+ "${PN}-sockd ${PN}-libdsocks "
> > +
> > +FILES_${PN}-libdsocks = "${libdir}/libdsocks.so"
> > +FILES_${PN}-sockd = "${bindir}/sockd ${sysconfdir}/sockd.conf"
> > +
> > +INSANE_SKIP_${PN}-libdsocks = "dev-elf"
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

