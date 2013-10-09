Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C04686CBAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 09:55:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Oct 2013 02:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1062,1371106800"; d="scan'208";a="416554167"
Received: from unknown (HELO helios.localnet) ([10.252.120.216])
	by orsmga002.jf.intel.com with ESMTP; 09 Oct 2013 02:55:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "stephen.arnold42" <stephen.arnold42@gmail.com>
Date: Wed, 09 Oct 2013 10:55:30 +0100
Message-ID: <3526425.HOOTbMNAZg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
References: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded/meta-webserver][PATCH] nginx: new recipe, updated from aging original in rpi layer (has not been scrubbed for any potential policy issues).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2013 09:55:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stephen,

Thanks for sending this. A few comments below.

On Tuesday 08 October 2013 22:33:44 stephen.arnold42 wrote:
> From: "stephen.arnold42" <stephen.arnold42@gmail.com>

Ideally the part of the subject from "updated..." onwards should go into the 
commit message. You should really specify that the "rpi" layer you refer to is 
your own.

> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
> @@ -0,0 +1,212 @@
> +diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature

Could you please add a header to this patch mentioning what it does, the 
origin if it wasn't something you wrote, the Upstream-Status and your Signed-
off-by?

> +DESCRIPTION = "HTTP and reverse proxy server"

Please set this as SUMMARY rather than DESCRIPTION since it's one line.

> +HOMEPAGE = "http://nginx.org/"
> +LICENSE = "BSD"

Can we be specific about which BSD license this is? Looking at it I think 
"BSD-2-Clause" is the correct one.

> +SECTION = "net"
> +PRIORITY = "optional"

Please drop PRIORITY, we don't use this anymore.

> +DEPENDS = "libpcre gzip openssl"
> +
> +PR = "r4"

PR should ideally be dropped since this is a new recipe for public layers.

> +SRC_URI = " \
> +	http://nginx.org/download/nginx-${PV}.tar.gz \
> +	file://nginx-cross_${PV}.diff;name=crosspatch \
> +	file://nginx.conf \
> +	file://nginx.init \
> +"
> +
> +S = "${WORKDIR}/nginx-${PV}"

This is the default value for S ("${WORKDIR}/${BP}" where BP is "${BPN}-${PV}" 
and BPN is "nginx") so no need to set this.

> +inherit autotools update-rc.d useradd

I could be mistaken, but looking at the source it doesn't appear to be using 
autotools, in which case inheriting autotools wouldn't be right. That does 
mean you'll have to define your own do_install (doing 
"oe_runmake 'DESTDIR=${D}' install" before what you currently have in 
do_install_append).

> +SRC_URI[md5sum] = "d496e58864ab10ed56278b7655b0d0b2"
> +SRC_URI[sha256sum] =
> "84aeb7a131fccff036dc80283dd98c989d2844eb84359cfe7c4863475de923a9"
> +SRC_URI[crosspatch.md5sum] = "707c4cdd6bb82719ea2ed50971101c21"
> +SRC_URI[crosspatch.sha256sum] =
> "96cc3b087126caaa0951ab3e3f9f26169e9caf283dd2aeb689ed6c435070f052"

We don't normally checksum local files such as "crosspatch".

> +LIC_FILES_CHKSUM = "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f" +
> +CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
> +		${sysconfdir}/nginx/fastcgi.conf\
> +		${sysconfdir}/nginx/fastcgi_params \
> +		${sysconfdir}/nginx/koi-utf \
> +		${sysconfdir}/nginx/koi-win \
> +		${sysconfdir}/nginx/mime.types \
> +		${sysconfdir}/nginx/scgi_params \
> +		${sysconfdir}/nginx/uwsgi_params \
> +		${sysconfdir}/nginx/win-utf \
> +"
> +
> +INITSCRIPT_NAME = "nginx"
> +INITSCRIPT_PARAMS = "defaults 92 20"
> +
> +do_configure () {
> +	PTRSIZE=$(expr ${SITEINFO_BITS} / 8)
> +
> +	echo $CFLAGS
> +	echo $LDFLAGS
> +
> +	./configure \
> +	--crossbuild=Linux:${TUNE_ARCH} \
> +	--with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little',
> 'big', d)} \ +	--with-int=4 \
> +	--with-long=${PTRSIZE} \
> +	--with-long-long=8 \
> +	--with-ptr-size=${PTRSIZE} \
> +	--with-sig-atomic-t=${PTRSIZE} \
> +	--with-size-t=${PTRSIZE} \
> +	--with-off-t=${PTRSIZE} \
> +	--with-time-t=${PTRSIZE} \
> +	--with-sys-nerr=132 \
> +	--conf-path=/etc/nginx/nginx.conf \
> +	--http-log-path=/var/log/nginx/access.log \
> +	--error-log-path=/var/log/nginx/error.log \
> +	--pid-path=/var/run/nginx/nginx.pid \
> +	--prefix=/usr \
> +	--with-http_ssl_module \
> +	--with-http_gzip_static_module
> +}
> +
> +do_install_append () {
> +    install -d ${D}${localstatedir}/www/localhost
> +    mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
> +    chown www:www-data -R ${D}${localstatedir}
> +
> +    install -d ${D}${sysconfdir}/init.d
> +    install -d ${D}${sysconfdir}/nginx
> +    install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
> +    install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/
> +
> +    install -d ${D}${sysconfdir}/default/volatiles
> +    echo "d www www-data 0755 ${localstatedir}/run/nginx none" \
> +        > ${D}${sysconfdir}/default/volatiles/99_nginx
> +}
> +
> +FILES_${PN} += "${localstatedir}/ /run/"

I don't think we should be adding /run/ here. There is a guide on how to deal 
with unshipped file/dir warnings for /run in case you haven't seen it:

http://permalink.gmane.org/gmane.comp.handhelds.openembedded/58530

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

