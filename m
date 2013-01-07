Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsLjK-00042O-C9
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 00:03:57 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so24866757iej.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 14:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=CDGqczlyXQB1ly7D7ow26lY1nOffLsukCQeHWXGSrKc=;
	b=C2rrYFuvWXVfAVRyUzC59rQcLvRgEEYJ66Rya8AEPvfFMO/DMZcSzI6jOeplYfW8lT
	Cc0KTYrfEC8rh+hA5YqJR7CNvwCmhUyvMSYAIlS0ibBirt995JR0Bs2wKn9CLjjjI/KL
	G896E0R/46PB892oaIMdWbTD7N5n8sBErpfk7TcXFkVBNX/NE5QDMfuoLtsj/wWd+Lxq
	3kEQP/sD5S2YwK5Z5AO4nN2SksExKg1KkDCQ5BaarCXtcj6A3+oNDmQCJi9MtM5toC5W
	olPlT2uAI6MYsOlNdAU9ei8Iqcq7VGoedUslRpmXAqJEcxdmbnYkVVqAooAobTFVA0ub
	+JGg==
X-Received: by 10.50.13.173 with SMTP id i13mr6868805igc.93.1357598911937;
	Mon, 07 Jan 2013 14:48:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Mon, 7 Jan 2013 14:48:01 -0800 (PST)
In-Reply-To: <20130107155808.GE6154@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-3-git-send-email-raj.khem@gmail.com>
	<20130107155808.GE6154@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jan 2013 14:48:01 -0800
Message-ID: <CAMKF1sosuv-y3vkcXC=pfhjEcixH1cfoHHuLGJ6vR_MwNXOmmQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Mon, 07 Jan 2013 23:04:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 7, 2013 at 7:58 AM, Joe MacDonald
<Joe.MacDonald@windriver.com> wrote:
> Two simple questions on this.  Therefore, aggressive snipping.
>
> [[oe] [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7] On 13.01.06 (Sun 01:12) Khem Raj wrote:
>
> [...]
>
>> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
>> new file mode 100644
>> index 0000000..04f52c6
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
>> @@ -0,0 +1,26 @@
>> +Index: autofs-5.0.7/aclocal.m4
>> +===================================================================
>> +--- autofs-5.0.7.orig/aclocal.m4     2012-10-28 13:17:45.504237027 -0700
>> ++++ autofs-5.0.7/aclocal.m4  2012-10-28 13:20:50.108242739 -0700
>> +@@ -403,7 +403,7 @@
>> + # save current flags
>> + af_check_libtirpc_save_cflags="$CFLAGS"
>> + af_check_libtirpc_save_ldflags="$LDFLAGS"
>> +-CFLAGS="$CFLAGS -I/usr/include/tirpc"
>> ++CFLAGS="$CFLAGS -I=/usr/include/tirpc"
>> + LDFLAGS="$LDFLAGS -ltirpc"
>> +
>> + AC_TRY_LINK(
>> +Index: autofs-5.0.7/Makefile.rules
>> +===================================================================
>> +--- autofs-5.0.7.orig/Makefile.rules 2012-10-28 13:17:45.308237022 -0700
>> ++++ autofs-5.0.7/Makefile.rules      2012-10-28 13:21:25.720242803 -0700
>> +@@ -48,7 +48,7 @@
>> + LDFLAGS += -lpthread
>> +
>> + ifdef TIRPCLIB
>> +-CFLAGS += -I/usr/include/tirpc
>> ++CFLAGS += -I=/usr/include/tirpc
>> + LDFLAGS += $(TIRPCLIB)
>> + endif
>> +
>
> Are these required?  If they're not, they're probably benign, but I
> thought the -I=<path> was an rpmbuildism that wasn't specifically
> required here.

yes they are needed. The difference between -I <path> and -I=<path> is that
compiler will append sysroot to -I=<path> whereas -I <patch> will look into
your host includes.

>
> [...]
>
>> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
>> new file mode 100644
>> index 0000000..5013e5e
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
>> @@ -0,0 +1,71 @@
>> +DESCRIPTION = "Kernel based automounter for linux."
>> +SECTION = "base"
>> +LICENSE = "GPL-2.0"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +
>> +DEPENDS += "openldap libtirpc flex-native bison-native"
>> +
>> +inherit autotools systemd
>> +
>> +SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
>> +           file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
>> +           file://autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch \
>> +           file://autofs-5.0.7-fix-ipv6-proximity-calculation.patch \
>> +           file://autofs-5.0.7-fix-parse-buffer-initialization.patch \
>> +           file://autofs-5.0.7-fix-typo-in-automount-8.patch \
>> +           file://autofs-5.0.7-include-usage-in-usage-message.patch \
>> +           file://autofs-5.0.7-dont-wait-forever-to-restart.patch \
>> +           file://autofs-5.0.7-add-timeout-option-description-to-man-page.patch \
>> +           file://autofs-5.0.7-fix-null-map-entry-order-handling.patch \
>> +           file://autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch \
>> +           file://autofs-5.0.7-configure-in-allow-cross-compilation.patch \
>> +           file://autofs-5.0.7-README-update-mailing-list-subscription-info.patch \
>> +           file://autofs-5.0.7-allow-non-root-user-to-check-status.patch \
>> +           file://autofs-5.0.7-configure-allow-cross-compilation-update.patch \
>> +           file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
>> +           file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
>> +           file://autofs-5.0.7-handle-new-location-of-systemd.patch \
>> +           file://Makefile.rules-cross.patch \
>> +           file://no-bash.patch \
>> +           file://cross.patch \
>> +           file://libtirpc.patch \
>> +           file://libtirpc-name-clash-backout.patch \
>> +          "
>> +
>> +SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"
>> +SRC_URI[sha256sum] = "08c4304d8076dc80c14df559bc5fd821b67ef3457b245f61068bd053d8f94ccc"
>> +
>> +inherit update-rc.d
>> +
>> +INITSCRIPT_NAME = "autofs"
>> +INITSCRIPT_PARAMS = "defaults"
>> +
>> +SYSTEMD_PACKAGES = "${PN}-systemd"
>> +SYSTEMD_SERVICE = "autofs.service"
>> +
>> +# FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
>> +CFLAGS += "${LDFLAGS}"
>> +
>> +EXTRA_OEMAKE = "DONTSTRIP=1"
>> +EXTRA_OECONF += "--with-systemd --disable-mount-locking \
>> +                --enable-ignore-busy --with-openldap=no \
>> +                --with-sasl=no --with-libtirpc=yes \
>> +                --with-path=${STAGING_BINDIR_NATIVE} \
>> +                "
>> +CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
>> +                        ac_cv_path_RPCGEN=rpcgen \
>> +                       "
>> +
>> +do_configure_prepend () {
>> +        if [ ! -e acinclude.m4 ]; then
>> +                cp aclocal.m4 acinclude.m4
>> +        fi
>> +}
>> +
>> +#do_install () {
>> +#        install -d ${D}${mandir}/man5 ${D}${mandir}/man8 \
>> +#                   ${D}${sbindir}
>> +#        oe_runmake 'INSTALLROOT=${D}' install
>> +#}
>
> If do_install() is dead, any harm in removing it from the recipe
> entirely?

Fair enough. I will remove it in V3 and push it to branch

>
>> +
>> +INSANE_SKIP_${PN} = "dev-so"
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


