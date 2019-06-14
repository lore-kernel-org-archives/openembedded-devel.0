Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 049B37E26B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 18:10:54 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h21so3477704qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AO1uE8ysnGNdfxFQp9oeyVAXttcRqDeccUfk9DjNRSU=;
	b=SFWvDOMAk6K7v6SDioqpcw8JhEIUgfSWTOJJTqe2GTesnuN4K/dtZpKiCE568YkZE0
	4XjMomO9wSx96scM2CSjzVoNU55IVZA6/9Ri8Y5WqjEMSqik2AYR5Pu6mkm1B2lij++J
	yI7AMHfNNlzo8GGjl/G8DUzA5BxdTx1xI0dI7THHfQdZMtP7rxtkASXIDyB5ZlgkmYhl
	et+wRU235kUmsLntJKhysilI1BZbY10xwakJ0jGn5uXgNv4gXDOULk3zogjdBI3MeKH0
	exxZjdE15eFdJBTag2oM6fSLKhPD+Z260nqz3UyFf04yzNHZohtmMDQ1yrFOtaouue8f
	3gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AO1uE8ysnGNdfxFQp9oeyVAXttcRqDeccUfk9DjNRSU=;
	b=V6SyCHJ2dAjnb7/bc5yLtPvbVYCY49F4WT/ybrB0GYTueMKe4Qi8UhoKeo7v2ow7bP
	8sVyhbAoBhUrFRKEWYlD3X2URVm5uIy/p9oAqdzj5YQLjNc97yPbk+hvoBMBdoGiGpZV
	4CsQXBF+asCSopDEgG56VcJHXMSGHl6JDHa0LLvSelruRbrxQLjO8taWs2NEGug68Qj8
	zkVFKIRscZVg9/lLiC/rFApKLUsN9UbcwLVau5DvTqldK96h4R0adKzLssy2mqGWO2li
	BHvOi6cUmSMa5ppK3qKzpSXLomhizC1L7CbLJ3AlciIuthztH+B6TbcgoiPkf+y4WpWb
	DtUg==
X-Gm-Message-State: APjAAAWhMr57fCxFqS0Nj/XoJMhfJqCeWYQHV34ahXPwK3w8vOrueVa6
	JgfQEhREWO3ZsfV7Xw4cXxf+rg5fQI5FgvA/0rE=
X-Google-Smtp-Source: APXvYqxSRK+NpEvAznOuqV50Ybk4pBMjm55qPUuQx07yHwMFpXXBqf/pwrbmKw9ag6WXgNQiAuU2I/xclQW+NXT7kZo=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr9530551qvg.181.1560535855487; 
	Fri, 14 Jun 2019 11:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
	<20190523115505.18245-3-Martin.Jansa@gmail.com>
In-Reply-To: <20190523115505.18245-3-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2019 11:10:29 -0700
Message-ID: <CAMKF1sraHDXnk1iL_vpZfZUngVvLXQ3fWRiCKTP1YW3e5vUkrQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/8] funyahoo-plusplus, icyque, pidgin-sipe, purple-skypeweb: add couple plugins for pidgin
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
X-List-Received-Date: Fri, 14 Jun 2019 18:10:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin

I noticed this error on qemux86-64

https://errors.yoctoproject.org/Errors/Details/248480/

It seems we need to bring in recipe for gmime for this to work. This
is already in master
so can you work on fixing this?

On Thu, May 23, 2019 at 4:55 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * import from luneos to make pidgin here in meta-oe a bit more useful
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../pidgin/funyahoo-plusplus_git.bb           | 25 ++++++++++++++
>  meta-oe/recipes-support/pidgin/icyque_git.bb  | 27 +++++++++++++++
>  .../pidgin/pidgin-sipe_1.24.0.bb              | 34 +++++++++++++++++++
>  .../pidgin/purple-skypeweb_git.bb             | 26 ++++++++++++++
>  4 files changed, 112 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
>  create mode 100644 meta-oe/recipes-support/pidgin/icyque_git.bb
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
>  create mode 100644 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
>
> diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> new file mode 100644
> index 0000000000..3a437659e7
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Protocol plugin for New Yahoo (2016) for Adium, Pidgin, Miranda and Telepathy IM Framework"
> +SECTION = "webos/services"
> +LICENSE = "GPLv3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> +
> +DEPENDS = "pidgin json-glib glib-2.0"
> +
> +inherit pkgconfig
> +
> +SRC_URI = "git://github.com/EionRobb/funyahoo-plusplus;branch=master;protocol=git"
> +SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    oe_runmake CC="${CC}" CXX="${CXX}" EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR="${D}" install;
> +}
> +
> +FILES_${PN} += " \
> +    ${libdir} \
> +"
> diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
> new file mode 100644
> index 0000000000..0f32dc3a39
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "WIM Protocol plugin for ICQ for Adium, Pidgin, Miranda and Telepathy IM Framework"
> +SECTION = "webos/services"
> +LICENSE = "GPLv3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
> +
> +DEPENDS = "pidgin json-glib"
> +
> +PV = "0.1+gitr${SRCPV}"
> +
> +inherit pkgconfig
> +
> +SRC_URI = "git://github.com/EionRobb/icyque"
> +SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    oe_runmake;
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR="${D}" install;
> +}
> +
> +FILES_${PN} += " \
> +    ${libdir} \
> +"
> diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
> new file mode 100644
> index 0000000000..beae281a30
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Protocol plugin for Office 365/Lync/OCS for Adium, Pidgin, Miranda and Telepathy IM Framework"
> +SECTION = "webos/services"
> +LICENSE = "GPLv2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +DEPENDS = "pidgin intltool-native glib-2.0-native"
> +
> +inherit pkgconfig
> +inherit autotools
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
> +"
> +
> +SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
> +SRC_URI[sha256sum] = "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
> +
> +PACKAGECONFIG ??= "nss krb5"
> +PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
> +PACKAGECONFIG[openssl] = "--enable-openssl=yes,--enable-openssl=no,openssl"
> +PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
> +#PACKAGECONFIG[voice_and_video] = "--with-vv=yes,--with-vv=no,libnice gstreamer"
> +PACKAGECONFIG[telepathy] = "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib gmime"
> +#PACKAGECONFIG[gssapi_only] = "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
> +PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/purple-2/*.la \
> +"
> +
> +FILES_${PN} += " \
> +    ${libdir}/purple-2/libsipe.so \
> +    ${datadir}/appdata \
> +    ${datadir}/metainfo \
> +"
> diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> new file mode 100644
> index 0000000000..092e6059b8
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Skype protocol plug-in for libpurple"
> +SECTION = "webos/services"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://skypeweb/gpl3.txt;md5=d90260d32cef39f3c8d6c0f05d3adb8e"
> +
> +DEPENDS = "pidgin json-glib glib-2.0 zlib"
> +
> +inherit pkgconfig
> +
> +SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=git"
> +SRCREV = "14f1b69b6292bbdc98cca484b050ec8359394c4e"
> +
> +S = "${WORKDIR}/git"
> +PV = "1.5+git${SRCPV}"
> +
> +do_compile() {
> +    oe_runmake -C skypeweb;
> +}
> +
> +do_install() {
> +    oe_runmake -C skypeweb DESTDIR="${D}" install;
> +}
> +
> +FILES_${PN} += " \
> +    ${libdir} \
> +"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

