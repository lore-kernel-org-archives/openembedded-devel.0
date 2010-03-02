Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmINb-0000Fh-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 04:02:44 +0100
Received: by iwn10 with SMTP id 10so2910326iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 18:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DjJgVEoz3JyhnTX601jHaNoFtsSNDVgB6x7FLt5yatE=;
	b=qbPmeMfWmi3JV6kOVqKLIVbxOXRFrT+8QjOs7K5dMayqG3yIcFzzEY2NNtGinOOEU/
	Qphht44AHJUV/XDosymdg1+4PM5J2pKSWo6POqCmyNcK9oA7haG5G9U2NZCyu9uw+oPt
	r5zpE7DeW5AyFdroQjILRqiSRauzmptubLYPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=s0Hi67SmBsOpnUNlppHpWPAac0gVRRc6qPbbELjPRsMBBURoCYm1EQn3jHE6SJBUw7
	uFmeF+m6484MGXO5UiQG/EzRx47CCgZHkkdZfkII1V0c0EPo8g2/cfa5bXxPmYXg9fie
	d2dKCQ47PoS9xlQGCdTUkqBPxVZ1U5avWTB34=
MIME-Version: 1.0
Received: by 10.231.161.138 with SMTP id r10mr222887ibx.34.1267498789020; Mon, 
	01 Mar 2010 18:59:49 -0800 (PST)
In-Reply-To: <1267497275.4739.292.camel@trini-m4400>
References: <1267497275.4739.292.camel@trini-m4400>
Date: Mon, 1 Mar 2010 18:59:48 -0800
Message-ID: <19c1b8a91003011859k16853712hbca10305afa44da9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Add eglibc-pic, resync eglibc-dev with glibc
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
X-List-Received-Date: Tue, 02 Mar 2010 03:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 1, 2010 at 6:34 PM, Tom Rini <tom_rini@mentor.com> wrote:
> eglibc-package.bbclass: Add eglibc-pic, resync eglibc-dev with glibc
>
> Resync what goes into eglibc-dev based on what we have in glibc-dev.
> This includes zoneinfo and picking up the reset of the static libraries
> (many are missed otherwise and static linking in SDKs fails). =A0We add i=
n
> a eglibc-pic package to catch all of the pic stuff (some of which would
> otherwise be caught in -dev).
>
> Will bump PRs when I push this.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass
> b/recipes/eglibc/eglibc-package.bbclass
> index 3c33f93..9c660b4 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -29,11 +29,12 @@ BINARY_LOCALE_ARCHES ?=3D "arm.* i[3-6]86 x86_64
> powerpc"
> =A0# Set this to zero if you don't want ldconfig in the output package
> =A0USE_LDCONFIG ?=3D "1"
>
> -PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef
> eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault
> eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
> +PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef
> eglibc-utils eglibc-pic eglibc-dev eglibc-doc eglibc-locale libcidn
> libmemusage libsegfault eglibc-extra-nss eglibc-thread-db
> eglibc-pcprofile"
> =A0PACKAGES_DYNAMIC =3D "glibc-gconv-* glibc-charmap-* glibc-localedata-*
> glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-*
> eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
>
> =A0RPROVIDES_eglibc =3D "glibc"
> =A0RPROVIDES_eglibc-utils =3D "glibc-utils"
> +RPROVIDES_eglibc-pic =3D "glibc-pic"
> =A0RPROVIDES_eglibc-dev =3D "glibc-dev"
> =A0RPROVIDES_eglibc-doc =3D "glibc-doc"
> =A0RPROVIDES_eglibc-locale =3D "glibc-locale"
> @@ -43,12 +44,16 @@ RPROVIDES_eglibc-pcprofile =3D "glibc-pcprofile"
> =A0RPROVIDES_eglibc-dbg =3D "glibc-dbg"
> =A0libc_baselibs =3D "${base_libdir}/libcrypt*.so.*
> ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.*
> ${base_libdir}/libc*.so ${base_libdir}/libm*.so.*
> ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so
> ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so
> ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so
> ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so
> ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
> ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so
> ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so
> ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so
> ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so
> ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so
> ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so
> ${base_libdir}/libBrokenLocale*.so.*
> ${base_libdir}/libBrokenLocale-*.so"
>
> -FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/*
> ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '',
> d)}"
> +FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo
> ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '',
> d)}"
> =A0FILES_ldd =3D "${bindir}/ldd"
> =A0FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> +FILES_libcidn =3D "${base_libdir}/libcidn*.so"
> +FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
> =A0FILES_eglibc-extra-nss =3D "${base_libdir}/libnss*"
> =A0FILES_sln =3D "/sbin/sln"
> -FILES_eglibc-dev_append =3D " ${libdir}/*.o ${bindir}/rpcgen
> ${libdir}/libc_nonshared.a ${libdir}/libpthread_nonshared.a"
> +FILES_eglibc-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map
> ${libdir}/libc_pic/"
> +FILES_eglibc-dev_append +=3D "${bindir}/rpcgen ${libdir}/*.a \
> + =A0 =A0 =A0 ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> =A0FILES_nscd =3D "${sbindir}/nscd*"
> =A0FILES_eglibc-utils =3D "${bindir}/* ${sbindir}/*"
> =A0FILES_eglibc-gconv =3D "${libdir}/gconv/*"
> @@ -95,7 +100,6 @@ do_install() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUP=
PORTED
> =A0 =A0 =A0 =A0done
> =A0 =A0 =A0 =A0rm -f ${D}/etc/rpc
> - =A0 =A0 =A0 rm -rf ${D}${datadir}/zoneinfo
> =A0 =A0 =A0 =A0rm -rf ${D}${libexecdir}/getconf
> =A0}
>
>
>

Why is change to not delete zoneinfo needed ? these should be provided
by tzdata
for other changes

Acked-by: Khem Raj <raj.khem@gmail.com>

> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>


