Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQreM-00086v-8k
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 03:52:10 +0200
Received: by pvc30 with SMTP id 30so1504484pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 18:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:subject:from:to:in-reply-to:references
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=vROpWSQt2iYhdOtu0qqeCRXZAe27PEEy1WyzxyLI3FQ=;
	b=P0ItLMiiF4WxipTR15gYpukv3AGw3XRy9AjyDPquaA4R+64mfUtiIpfK1zARLTT6ur
	oKHNL61r/CXd/P6rgJjjNi1vqmz9F4hd4T5UkfQjcbumMCqVaSUWr3Dj/2Dpfd0Vca4o
	igO/qm8BzoIHT/hG3ShgVU/o4oO7TcaiOl9TE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=v8tGCn9Qvzn8e5g6rFnnhP6jYgfEAAuO+nZ0OvcNRdcpUS8eoQqdbJuimQTF91jDbh
	aS0gomRU6rEFylHJnIIG954IGM3vmKV9SnnZSRa/lqG7LZdzyaJ8z3peGPk51CEhytJ/
	DnLWEFNjk9h88MswFEMCIRM+8NuAgT0zPldcA=
Received: by 10.68.36.195 with SMTP id s3mr1605127pbj.388.1306720140712;
	Sun, 29 May 2011 18:49:00 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g1sm1848654pbj.83.2011.05.29.18.48.58
	(version=SSLv3 cipher=OTHER); Sun, 29 May 2011 18:48:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
	<c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>
Date: Sun, 29 May 2011 18:48:55 -0700
Message-ID: <1306720135.5979.1.camel@perseus>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 01:52:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

You do not need to import libelf recipe. oe-core provides libelf via
elfutils change the depending recipes to depend on elfutils instead.

> ---
>  meta-oe/recipes-support/libelf/libelf_0.8.13.bb |   38 +++++++++++++++++++++++
>  1 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libelf/libelf_0.8.13.bb
> 
> diff --git a/meta-oe/recipes-support/libelf/libelf_0.8.13.bb b/meta-oe/recipes-support/libelf/libelf_0.8.13.bb
> new file mode 100644
> index 0000000..2ca562f
> --- /dev/null
> +++ b/meta-oe/recipes-support/libelf/libelf_0.8.13.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "libelf is an ELF object file access library. \
> +The elf library provides routines to access, and manipulate, Elf object files."
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
> +SECTION = "libs"
> +PR = "r1"
> +
> +SRC_URI = "http://www.mr511.de/software/libelf-${PV}.tar.gz"
> +SRC_URI[md5sum] = "4136d7b4c04df68b686570afa26988ac"
> +SRC_URI[sha256sum] = "591a9b4ec81c1f2042a97aa60564e0cb79d041c52faa7416acb38bc95bd2c76d"
> +
> +inherit autotools
> +
> +PARALLEL_MAKE = ""
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
> +
> +do_configure_prepend () {
> +	if test ! -e acinclude.m4; then
> +		cp aclocal.m4 acinclude.m4
> +	fi
> +}
> +
> +do_install () {
> +	oe_runmake 'prefix=${D}${prefix}' 'exec_prefix=${D}${exec_prefix}' \
> +		   'libdir=${D}${libdir}' 'includedir=${D}${includedir}' \
> +		   install
> +	install -d ${STAGING_INCDIR}/libelf
> +        for i in libelf.h nlist.h gelf.h sys_elf.h; do
> +                install -m 0644 lib/$i ${STAGING_INCDIR}/libelf/
> +        done
> +        make includedir=${STAGING_INCDIR} install-compat
> +}
> +
> +BBCLASSEXTEND = "native"
> +





