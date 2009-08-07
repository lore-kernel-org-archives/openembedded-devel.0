Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MZFxe-00071w-5a
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Aug 2009 05:17:43 +0200
Received: by rv-out-0708.google.com with SMTP id l33so314618rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2009 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FRKnzCtCpN1qqEtLaOEuqu4UIjrrNc3jMPuMnGu67qU=;
	b=ZoTTO4M7UwOeFqEqJWWBVCB0WbisY/FEmrhYqwSzSfU+IHQ8mutYgvw2nouHd1vx04
	iTCEpY85PRje/aXc+FeFhI2avVVpqP0um5j/7IlrvqUrMTNVliHXqiH2/Yg5EBIHZk2r
	Uy099FG6dv9AtLb9wn24R8Xly4hSwQOxWgqZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rVTtqTOTub01ltSLFz2HXxPkUNswnAvTk7CKXx2fq+KXNjig1wyxM3CdE5infeJoME
	FdROI119bkVzxQ3PnEzedxIu4vB262Hb/uUvJ2V1sKDnK2d+hqRx9im77ogayxl+LIr5
	vKcMAyVO2fVYRnkaA0jNUW3hF4jfqhUOESBec=
Received: by 10.140.202.12 with SMTP id z12mr247060rvf.294.1249614112518;
	Thu, 06 Aug 2009 20:01:52 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-49.dsl.pltn13.sbcglobal.net
	[71.146.25.49])
	by mx.google.com with ESMTPS id f42sm3199295rvb.45.2009.08.06.20.01.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Aug 2009 20:01:51 -0700 (PDT)
Date: Thu, 6 Aug 2009 20:01:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090807030145.GA4153@gmail.com>
References: <4A7B82BD.9030804@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A7B82BD.9030804@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] fix dbus-daemon segfault on mipsel with recent toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2009 03:17:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/08/09 10:56), Graham Gower wrote:
> dbus-daemon segfaults on mipsel when built with -fPIE/-pie, as outlined in
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=532821
> 
> Removes PIE compilation from the dbus-daemon Makefile as a workaround.
> 
> -Graham
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

looks ok to me.

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> diff --git a/recipes/dbus/dbus-native_1.0.3.bb b/recipes/dbus/dbus-native_1.0.3.bb
> index 8a4c6fe..6ec0fc8 100644
> --- a/recipes/dbus/dbus-native_1.0.3.bb
> +++ b/recipes/dbus/dbus-native_1.0.3.bb
> @@ -1,6 +1,6 @@
> require dbus.inc
> 
> -PR = "r1"
> +PR = "${INC_PR}.0"
> DEFAULT_PREFERENCE = "-1"
> 
> inherit native
> diff --git a/recipes/dbus/dbus-native_1.2.1.bb b/recipes/dbus/dbus-native_1.2.1.bb
> index 566c7bc..2b1610e 100644
> --- a/recipes/dbus/dbus-native_1.2.1.bb
> +++ b/recipes/dbus/dbus-native_1.2.1.bb
> @@ -1,4 +1,5 @@
> require dbus.inc
> +PR = "${INC_PR}.0"
> RRECOMMENDS_${PN} = ""
> RDEPENDS_${PN} = ""
> inherit native
> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> index 0302cfe..b5eeb08 100644
> --- a/recipes/dbus/dbus.inc
> +++ b/recipes/dbus/dbus.inc
> @@ -4,6 +4,8 @@ SECTION = "base"
> LICENSE = "GPL"
> DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> 
> +INC_PR = "r16"
> +
> SRC_URI = "\
>   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>   file://cross.patch;patch=1 \
> @@ -30,6 +32,10 @@ EXTRA_OECONF = "\
>   --with-dbus-default-reply-timeout=200000 \
> "
> 
> +do_compile_prepend_mipsel() {
> +	sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus/Makefile
> +}
> +
> do_install_append() {
>         install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
> diff --git a/recipes/dbus/dbus_1.0.3.bb b/recipes/dbus/dbus_1.0.3.bb
> index 2589cfe..7001bb9 100644
> --- a/recipes/dbus/dbus_1.0.3.bb
> +++ b/recipes/dbus/dbus_1.0.3.bb
> @@ -1,4 +1,4 @@
> require dbus.inc
> -PR = "r16"
> +PR = "${INC_PR}.0"
> 
> DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes/dbus/dbus_1.2.1.bb b/recipes/dbus/dbus_1.2.1.bb
> index 9d6c4c1..72db1da 100644
> --- a/recipes/dbus/dbus_1.2.1.bb
> +++ b/recipes/dbus/dbus_1.2.1.bb
> @@ -1,3 +1,3 @@
> include dbus.inc
> 
> -PR = "r12"
> +PR = "${INC_PR}.0"
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


