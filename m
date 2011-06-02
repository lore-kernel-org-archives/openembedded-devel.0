Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSFru-0004kW-6W
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 23:55:54 +0200
Received: by pzk36 with SMTP id 36so627909pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:organization:to:subject:date:user-agent
	:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=Zp5/a/zXKLZ+4A5ovIwufM5r59BhqPSMkQzlFRoMNOY=;
	b=SRErJA/lepogW4ddF1uPIH8ugrg9mPLGJ1ah8vVvjP00KBc0vKvJxtUqOz5YBwd3qZ
	ppeNSBnphc+ZFfB3UThW/PFCIOysVaCBZQZStoI/VrpYrr3/yQ6BjIF/6ci8O2AV/DS2
	YKQsPhhjKg6grkFa3+fQdo63vG/k5sZNOy4xU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=Br8WEzjhCHSv7FuODYuafgb1/XaPaw1CTT8XkXfdTlup+Tjz6Snr7yqdzy82YFJCRq
	h4aisr6bmQqkERnR+mMyueLhTlvks1LxxSD441DxfqBhtEABAjtXR6hxtporKV2EU5xk
	JM5sLEs/CDCzy3UCZQhCp5An7NXPLUJCX7FTI=
Received: by 10.68.68.209 with SMTP id y17mr504759pbt.416.1307051561365;
	Thu, 02 Jun 2011 14:52:41 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y2sm874516pbg.40.2011.06.02.14.52.39
	(version=SSLv3 cipher=OTHER); Thu, 02 Jun 2011 14:52:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Sakrah Inc.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Jun 2011 14:52:37 -0700
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.3; i686; ; )
References: <cover.1307040582.git.Martin.Jansa@gmail.com>
	<1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
In-Reply-To: <1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201106021452.38054.raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] gobject-introspection: add newer git version compatible with glib-2.0_git
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
X-List-Received-Date: Thu, 02 Jun 2011 21:55:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, June 02, 2011 11:51:34 AM Martin Jansa 
wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gobject-introspection_git.bb                   |   
33
> ++++++++++++++++++++ 1 files changed, 33 
insertions(+), 0 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/gobject-
introspection/gobject-introspection_git.b
> b
> 
> diff --git
> a/meta-oe/recipes-devtools/gobject-
introspection/gobject-introspection_git
> .bb
> b/meta-oe/recipes-devtools/gobject-
introspection/gobject-introspection_git
> .bb new file mode 100644
> index 0000000..2a7f30c
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/gobject-
introspection/gobject-introspection_git
> .bb @@ -0,0 +1,33 @@
> +# NOTE: WIP! This recipe does not cross-compile 
atm., only -native
> +DEPENDS = "glib-2.0 libffi python-native gobject-
introspection-native"
> +DEPENDS_virtclass-native = "libffi-native python-
native bison-native
> flex-native" +BBCLASSEXTEND = "native"
> +
> +SRC_URI = "git://git.gnome.org/gobject-
introspection;protocol=git \
> +  file://use-usr-bin-env-for-python.patch \
> +"
> +
> +LICENSE = "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM =
> 
"file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f 
\ +		   
> 
file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
> +
> +SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
> +PV = "1.29.0+gitr${SRCPV}"
> +DEFAULT_PREFERENCE = "-1"

why DP -1

> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
> +
> +do_configure_prepend () {
> +        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
> +}
> +
> +EXTRA_OECONF = "\
> +  --disable-gtk-doc \
> +  --disable-gtk-doc-html \
> +  --disable-gtk-doc-pdf \
> +  --disable-tests \
> +"


