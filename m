Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id EB1BE77140
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 20:45:06 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c200so46186069wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bGxbv+fTyiWDWEmHa0la4yZQOex0AU2KuzH4YO4glDk=;
	b=D588q/rxiKAzRmadlyVKF4WHFVYZgiAFQ2hIbZGRS82q7/wM3AbpZLUrsIbINaPv0E
	Ho9NWFt1rCtmPmaFcUz3ONrnSNFowMa0jFZ5mM+IAySKItO2jPXYIgbeEcVA1W78x6Un
	t9cNHJW4+Immc/kOm6ZE1Sa92eSR/uBOjdn/ZTDBEYuu+eZ8d057RIhutTvCM9O+ATrM
	5NvGGvaVvPZW4MkX+hn+8/TGHFMCYAqdQ2tH7hsnJjolLT2UODRIZ0Lx8+9R8ycc5SPM
	4USCl5Ye8oNX1+GkxangqOQCAXpyfFd5rtNvP2erGGQ9ICAYSaIUFlLWdPSSuL1wfd50
	Q9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bGxbv+fTyiWDWEmHa0la4yZQOex0AU2KuzH4YO4glDk=;
	b=Pwbse8mNHv3lVztKjagwEoWeiY9Mclf/VX90jjcRCMky8rCuir1UUq6l36lHegfCak
	n1NkXVp+8x6gmyfY8q1/1FbdTrIJDTv+QJH5KooiDm1rlvUIbdc8NCGiNQCG0XpRjlDz
	gwWTN5XBwrr3nAUDSp+xblmXO2cUx7CB7S7ACczdDJeI+B/iBF0EC+veuNEm5bPnXt7t
	x7sWiXkJBH3Fy0gmrDKJnhXoAtkwI1aMGbbOri7dWAK9gBUx5vznvw1/Y7xRp0lpzXgX
	0kA61CHz5JgxoK8rMKrqHgb/guUDXgT9V1hGUHaM8cQ67LAr/4QcSSYkFcN2vSXZDAS5
	P8RQ==
X-Gm-Message-State: AG10YOQtnU7kfQlg0vpuxZ+R0+b4W+8xjuqJwEukgh5PCTfCsNg3+ZvWzwCcIQWtsRKTP/GtN4u3YMx9Eq/+Bg==
MIME-Version: 1.0
X-Received: by 10.194.7.195 with SMTP id l3mr45889458wja.43.1456433106593;
	Thu, 25 Feb 2016 12:45:06 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 25 Feb 2016 12:45:06 -0800 (PST)
In-Reply-To: <1456418243-11769-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456418243-11769-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2016 12:45:06 -0800
Message-ID: <CAJ86T=UoPcL3+jwzmxDgjAApVqmCBqBkKM=OhUxUbTunPLtntw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Thu, 25 Feb 2016 20:45:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 8:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * Using "cp -a" leaks UID of user running the builds, causing
>   many QA warnings.
> * See this thread for details:
>   http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html

Would using "cp -a --no-preserve=ownership" be a clearer way to
express what you're actually trying to do?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-devtools/python/python-edbus.inc              |  2 +-
>  meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb           |  2 +-
>  meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |  2 +-
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  2 +-
>  .../recipes-support/cim-schema/cim-schema-docs_2.40.0.bb       |  2 +-
>  .../recipes-support/cim-schema/cim-schema-exper_2.39.0.bb      |  2 +-
>  .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb      |  2 +-
>  meta-oe/recipes-benchmark/fio/fio_2.2.6.bb                     |  2 +-
>  meta-oe/recipes-devtools/lua/lua_5.3.2.bb                      |  2 +-
>  meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb          |  2 +-
>  meta-oe/recipes-multimedia/live555/live555.inc                 | 10 +++++-----
>  meta-oe/recipes-navigation/orrery/orrery_2.7.bb                |  2 +-
>  meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb             |  4 ++--
>  meta-oe/recipes-support/tbb/tbb_4.1.bb                         |  2 +-
>  meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb    |  2 +-
>  15 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
> index 1d8098f..3e72261 100644
> --- a/meta-efl/recipes-devtools/python/python-edbus.inc
> +++ b/meta-efl/recipes-devtools/python/python-edbus.inc
> @@ -39,7 +39,7 @@ do_install_append() {
>          done
>          cd ${S}
>          install -d ${D}${datadir}/${PN}/
> -        cp -a examples ${D}${datadir}/${PN}/
> +        cp -R --no-dereference --preserve=mode,links -v examples ${D}${datadir}/${PN}/
>          find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
>      fi
>  }
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> index 7cc0ec7..71e2bfc 100644
> --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> @@ -19,7 +19,7 @@ do_install() {
>      install -d ${D}${libdir}
>      install -m 0644 libebml.a ${D}${libdir}
>      install -m 0755 libebml.so.* ${D}${libdir}
> -    cp -a libebml.so ${D}${libdir}
> +    cp -R --no-dereference --preserve=mode,links -v libebml.so ${D}${libdir}
>
>      install -d ${D}${includedir}/ebml
>      for i in ../../ebml/*.h; do
> diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> index 19a7edb..1ad87cb 100644
> --- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> +++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
> @@ -21,7 +21,7 @@ do_install() {
>      install -d ${D}${libdir}
>      install -m 0644 libmatroska.a ${D}${libdir}
>      install -m 0755 libmatroska.so.* ${D}${libdir}
> -    cp -a libmatroska.so ${D}${libdir}
> +    cp -R --no-dereference --preserve=mode,links -v libmatroska.so ${D}${libdir}
>
>      install -d ${D}${includedir}/matroska
>      for i in ../../matroska/*.h; do
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index e8df06c..06f3707 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -85,7 +85,7 @@ do_install_ptest() {
>      for i in ${S}/dist ${S}/include ${B}/include ${S}/mibs ${S}/configure \
>          ${B}/net-snmp-config ${S}/testing; do
>          if [ -e "$i" ]; then
> -            cp -a "$i" ${D}${PTEST_PATH}
> +            cp -R --no-dereference --preserve=mode,links -v "$i" ${D}${PTEST_PATH}
>          fi
>      done
>      echo `autoconf -V|awk '/autoconf/{print $NF}'` > ${D}${PTEST_PATH}/dist/autoconf-version
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> index 093f0d4..31875ea 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
> @@ -18,7 +18,7 @@ do_unpack() {
>
>  do_install() {
>          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
> -        cp -a ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
> +        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
>  }
>
>  FILES_${PN} = "${datadir}/doc/*"
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
> index e4ed7b3..4b07c0b 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
> @@ -16,7 +16,7 @@ do_install() {
>          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
>          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
>
> -        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/
> +        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
>          chown -R root:root ${D}${datadir}/mof/cimv${PV}
>          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>                  sed -i -e 's/\r//g' $i
> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
> index 7ab9c4d..5675384 100644
> --- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
> @@ -21,7 +21,7 @@ do_install() {
>          install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
>          install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
>
> -        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/
> +        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
>          chown -R root:root ${D}${datadir}/mof/cimv${PV}/
>          for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>                  sed -i -e 's/\r//g' $i
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> index 5bf387c..db67173 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -37,5 +37,5 @@ do_configure() {
>  do_install() {
>      oe_runmake install DESTDIR=${D} prefix=${prefix} mandir=${mandir}
>      install -d ${D}/${docdir}/${PN}
> -    cp -a ${S}/examples ${D}/${docdir}/${PN}/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
>  }
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> index f97ed50..07a1a43 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
> @@ -55,7 +55,7 @@ do_install () {
>  }
>
>  do_install_ptest () {
> -        cp -a ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
> +        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
>  }
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> index 85035d9..0ac8fad 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
> @@ -33,7 +33,7 @@ do_install_append() {
>      install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
>
>      install -d ${D}${sysconfdir}
> -    cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
>      chown -R root:root ${D}${sysconfdir}
>  }
>
> diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
> index 0c8208a..0d11de9 100644
> --- a/meta-oe/recipes-multimedia/live555/live555.inc
> +++ b/meta-oe/recipes-multimedia/live555/live555.inc
> @@ -34,11 +34,11 @@ do_install() {
>      install -d ${D}${includedir}/liveMedia
>      install -d ${D}${includedir}/UsageEnvironment
>      install -d ${D}${libdir}
> -    cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
> -    cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
> -    cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
> -    cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
> -    cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
>      # Find all the headers
>      for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
>          install ${i} ${D}${includedir}
> diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> index 617afbc..40a6df3 100644
> --- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> +++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> @@ -23,7 +23,7 @@ do_configure_prepend() {
>  }
>  do_install_append() {
>      install -d ${D}${datadir}/orrery
> -    cp -a ${S}/data/* ${D}${datadir}/orrery
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/data/* ${D}${datadir}/orrery
>      chown -R root:root ${D}${datadir}/orrery
>      install -d ${D}${datadir}/icons
>      install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
> diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> index 18979d5..35c891e 100644
> --- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> +++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> @@ -19,10 +19,10 @@ EXTRA_OECONF = "--without-x \
>
>  do_configure() {
>      export topdir=${S}
> -    cp -a ${S}/autoconf/configure.in ${S}
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/autoconf/configure.in ${S}
>
>      if ! [ -d ${S}/platforms/${DISTRO} ] ; then
> -        cp -a ${S}/platforms/unknown ${S}/platforms/${DISTRO}
> +        cp -R --no-dereference --preserve=mode,links -v ${S}/platforms/unknown ${S}/platforms/${DISTRO}
>      fi
>
>      gnu-configize --force
> diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
> index 55212dc..09ed6ec 100644
> --- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
> @@ -26,7 +26,7 @@ do_compile() {
>  do_install() {
>      install -d ${D}${includedir} ${D}${libdir}/pkgconfig
>      rm ${S}/include/tbb/index.html -f
> -    cp -a ${S}/include/tbb ${D}${includedir}
> +    cp -R --no-dereference --preserve=mode,links -v ${S}/include/tbb ${D}${includedir}
>      install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
>      install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
>  }
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> index b8faf12..ac32185 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
> @@ -20,7 +20,7 @@ inherit allarch
>
>  do_install() {
>      install -d ${D}${datadir}/${BPN}
> -    cp -a * ${D}${datadir}/${BPN}
> +    cp -R --no-dereference --preserve=mode,links -v * ${D}${datadir}/${BPN}
>      chown -R root:root ${D}${datadir}/${BPN}
>      # Don't install patches to target
>      rm -rf ${D}${datadir}/${BPN}/patches
> --
> 2.7.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

