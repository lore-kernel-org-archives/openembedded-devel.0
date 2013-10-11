Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id DFFAA6CE84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 03:02:47 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id l12so539816wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 20:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NYeGtkKQwM9y8P4sXHjAhN0w37xh8uMuhsw5jYwZddY=;
	b=WMaRRzfhtOVSJt/7ZPgGTLTQd0boDyz8Cgag2avEZMpoKsHSmFFJyL7ztQamWOM8MN
	EDhiPTORfTvBT73VvJEXvVeXC9iSzDsx9JHyhA2ADV6Ka8VbAiQ3IkudpvYGkgnl4eMu
	rKbMOMx3ImT5ChjGCh4ViqzPi6HcQNjKLVb/R4NkXVWSHhxYp015cEEpecglsEzouXuF
	KZ0WSDmidmV+zBDAttL0sK8C7oxCgNtM8NlWR9UME92gqHO8FLtibQBkDG8Al9fKsdip
	lvcNPcKaH8FPPvH8vlm5ABeOnY92bae+xyECfXP9v57xtCNLhF+ECVgYXP7vwpOkNx1x
	/4tw==
MIME-Version: 1.0
X-Received: by 10.180.187.175 with SMTP id ft15mr1243335wic.20.1381460569278; 
	Thu, 10 Oct 2013 20:02:49 -0700 (PDT)
Received: by 10.194.22.2 with HTTP; Thu, 10 Oct 2013 20:02:49 -0700 (PDT)
In-Reply-To: <3526425.HOOTbMNAZg@helios>
References: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
	<3526425.HOOTbMNAZg@helios>
Date: Thu, 10 Oct 2013 20:02:49 -0700
Message-ID: <CAOLEWZVgW5g7pKpogBfwPWMw34e27iqk3DHxbeLjFTWBG8Z7YQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 11 Oct 2013 03:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hmm, fun with gmail...

Anyway, I was (somewhat blindly) following the submission/patch
instructions here:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

I can certainly provide more info (as well as clean up the recipe) but your
first few points don't seem to be mentioned there, although the page seems
fairly current date-wise.  Should I be looking in a different place?
Otherwise I'll do me best to address everything, it just might take a few
days (too many work hours lately).

Thanks for the feedback.

Steve


On Wed, Oct 9, 2013 at 2:55 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> Hi Stephen,
>
> Thanks for sending this. A few comments below.
>
> On Tuesday 08 October 2013 22:33:44 stephen.arnold42 wrote:
> > From: "stephen.arnold42" <stephen.arnold42@gmail.com>
>
> Ideally the part of the subject from "updated..." onwards should go into
> the
> commit message. You should really specify that the "rpi" layer you refer
> to is
> your own.
>
> > +++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
> > @@ -0,0 +1,212 @@
> > +diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
>
> Could you please add a header to this patch mentioning what it does, the
> origin if it wasn't something you wrote, the Upstream-Status and your
> Signed-
> off-by?
>
> > +DESCRIPTION = "HTTP and reverse proxy server"
>
> Please set this as SUMMARY rather than DESCRIPTION since it's one line.
>
> > +HOMEPAGE = "http://nginx.org/"
> > +LICENSE = "BSD"
>
> Can we be specific about which BSD license this is? Looking at it I think
> "BSD-2-Clause" is the correct one.
>
> > +SECTION = "net"
> > +PRIORITY = "optional"
>
> Please drop PRIORITY, we don't use this anymore.
>
> > +DEPENDS = "libpcre gzip openssl"
> > +
> > +PR = "r4"
>
> PR should ideally be dropped since this is a new recipe for public layers.
>
> > +SRC_URI = " \
> > +     http://nginx.org/download/nginx-${PV}.tar.gz \
> > +     file://nginx-cross_${PV}.diff;name=crosspatch \
> > +     file://nginx.conf \
> > +     file://nginx.init \
> > +"
> > +
> > +S = "${WORKDIR}/nginx-${PV}"
>
> This is the default value for S ("${WORKDIR}/${BP}" where BP is
> "${BPN}-${PV}"
> and BPN is "nginx") so no need to set this.
>
> > +inherit autotools update-rc.d useradd
>
> I could be mistaken, but looking at the source it doesn't appear to be
> using
> autotools, in which case inheriting autotools wouldn't be right. That does
> mean you'll have to define your own do_install (doing
> "oe_runmake 'DESTDIR=${D}' install" before what you currently have in
> do_install_append).
>
> > +SRC_URI[md5sum] = "d496e58864ab10ed56278b7655b0d0b2"
> > +SRC_URI[sha256sum] =
> > "84aeb7a131fccff036dc80283dd98c989d2844eb84359cfe7c4863475de923a9"
> > +SRC_URI[crosspatch.md5sum] = "707c4cdd6bb82719ea2ed50971101c21"
> > +SRC_URI[crosspatch.sha256sum] =
> > "96cc3b087126caaa0951ab3e3f9f26169e9caf283dd2aeb689ed6c435070f052"
>
> We don't normally checksum local files such as "crosspatch".
>
> > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f" +
> > +CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
> > +             ${sysconfdir}/nginx/fastcgi.conf\
> > +             ${sysconfdir}/nginx/fastcgi_params \
> > +             ${sysconfdir}/nginx/koi-utf \
> > +             ${sysconfdir}/nginx/koi-win \
> > +             ${sysconfdir}/nginx/mime.types \
> > +             ${sysconfdir}/nginx/scgi_params \
> > +             ${sysconfdir}/nginx/uwsgi_params \
> > +             ${sysconfdir}/nginx/win-utf \
> > +"
> > +
> > +INITSCRIPT_NAME = "nginx"
> > +INITSCRIPT_PARAMS = "defaults 92 20"
> > +
> > +do_configure () {
> > +     PTRSIZE=$(expr ${SITEINFO_BITS} / 8)
> > +
> > +     echo $CFLAGS
> > +     echo $LDFLAGS
> > +
> > +     ./configure \
> > +     --crossbuild=Linux:${TUNE_ARCH} \
> > +     --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'little',
> > 'big', d)} \ +        --with-int=4 \
> > +     --with-long=${PTRSIZE} \
> > +     --with-long-long=8 \
> > +     --with-ptr-size=${PTRSIZE} \
> > +     --with-sig-atomic-t=${PTRSIZE} \
> > +     --with-size-t=${PTRSIZE} \
> > +     --with-off-t=${PTRSIZE} \
> > +     --with-time-t=${PTRSIZE} \
> > +     --with-sys-nerr=132 \
> > +     --conf-path=/etc/nginx/nginx.conf \
> > +     --http-log-path=/var/log/nginx/access.log \
> > +     --error-log-path=/var/log/nginx/error.log \
> > +     --pid-path=/var/run/nginx/nginx.pid \
> > +     --prefix=/usr \
> > +     --with-http_ssl_module \
> > +     --with-http_gzip_static_module
> > +}
> > +
> > +do_install_append () {
> > +    install -d ${D}${localstatedir}/www/localhost
> > +    mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
> > +    chown www:www-data -R ${D}${localstatedir}
> > +
> > +    install -d ${D}${sysconfdir}/init.d
> > +    install -d ${D}${sysconfdir}/nginx
> > +    install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
> > +    install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/
> > +
> > +    install -d ${D}${sysconfdir}/default/volatiles
> > +    echo "d www www-data 0755 ${localstatedir}/run/nginx none" \
> > +        > ${D}${sysconfdir}/default/volatiles/99_nginx
> > +}
> > +
> > +FILES_${PN} += "${localstatedir}/ /run/"
>
> I don't think we should be adding /run/ here. There is a guide on how to
> deal
> with unshipped file/dir warnings for /run in case you haven't seen it:
>
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/58530
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

