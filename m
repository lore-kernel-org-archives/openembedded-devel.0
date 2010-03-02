Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmIOt-0000KO-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 04:04:04 +0100
Received: by iwn10 with SMTP id 10so2911357iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 19:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=R3H4EZx8MwRs5HdQEbMpFRAQf9PQigaLg07uKor73CE=;
	b=mWa9bFWjHeBCXxf9I45lEmmSAxycKNaKwSfri5jLy/Cq+3WIwV5+D0VzYvsqjIDyCr
	nchH3Nt3V4zQTN0EwzDRwXYRhfBxeZm0Satkfybqvc8j4e7NTHqQyLcJQ91WxdtoEsk/
	Y1W3PbUVv/L9yWNwjixJ4LIWYc6YosAUuibrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QKhPY+GpaFV+PiaRTAxWEcK34U8ZUCd+QNV5QmHF7tjP5tEav6SEUtKyvKovfjo14F
	1MogX6lRH7PMSsROLbI/H5DizcepwHhWduYNYrxUzH9DAso7PhDOzDgXrhtB+P1PZ2ug
	0lwsXio2ALpTyPiNO/W/JV9ChAZ5At4U6iBNY=
MIME-Version: 1.0
Received: by 10.231.85.198 with SMTP id p6mr564993ibl.65.1267498868220; Mon, 
	01 Mar 2010 19:01:08 -0800 (PST)
In-Reply-To: <1267497277.4739.293.camel@trini-m4400>
References: <1267497277.4739.293.camel@trini-m4400>
Date: Mon, 1 Mar 2010 19:01:08 -0800
Message-ID: <19c1b8a91003011901i13366629j3bc85665621e8dcb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add glibc-pic package
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
X-List-Received-Date: Tue, 02 Mar 2010 03:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Khem Raj <raj.khem@gmail.com>

On Mon, Mar 1, 2010 at 6:34 PM, Tom Rini <tom_rini@mentor.com> wrote:
> glibc-package.bbclass: =A0Add glibc-pic package
>
> By default, in our glibc builds we don't have these libraries. =A0They ma=
y
> however come from various binary toolchains, or custom source builds.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> diff --git a/classes/glibc-package.bbclass
> b/classes/glibc-package.bbclass
> index 413ed14..af75bb5 100644
> --- a/classes/glibc-package.bbclass
> +++ b/classes/glibc-package.bbclass
> @@ -9,7 +9,7 @@
>
> =A0GLIBC_INTERNAL_USE_BINARY_LOCALE ?=3D "ondevice"
>
> -PACKAGES =3D "glibc-dbg glibc catchsegv sln nscd ldd localedef
> glibc-utils glibc-dev glibc-static glibc-doc glibc-locale libcidn
> libmemusage libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> +PACKAGES =3D "glibc-dbg glibc catchsegv sln nscd ldd localedef
> glibc-utils glibc-pic glibc-dev glibc-static glibc-doc glibc-locale
> libcidn libmemusage libsegfault glibc-extra-nss glibc-thread-db
> glibc-pcprofile"
> =A0PACKAGES_DYNAMIC =3D "glibc-gconv-* glibc-charmap-* glibc-localedata-*
> locale-base-* glibc-binary-localedata-*"
>
> =A0INSANE_SKIP_glibc-dbg =3D True
> @@ -23,6 +23,7 @@ glibcfiles =3D "${libc_baselibs} ${libexecdir}/*
> ${datadir}/zoneinfo ${@base_condi
> =A0glibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug=
 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_bindir}/.debug ${base_sbindir}=
/.debug
> ${base_libdir}/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/gconv/.debug ${libexecdir}/=
*/.debug"
> +glibcpicfiles =3D "${libdir}/*_pic.a ${libdir}/*_pic.map
> ${libdir}/libc_pic/"
> =A0glibcdevfiles =3D "${bindir}/rpcgen ${includedir} ${libdir}/lib*
> ${SOLIBSDEV} ${libdir}/*.la \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkg=
config
> ${libdir}/*nonshared.a \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/*.a ${base_libdir}/*.o
> ${datadir}/aclocal"
> @@ -35,6 +36,8 @@ FILES_libcidn =3D "${base_libdir}/libcidn*.so"
> =A0FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
> =A0FILES_glibc-extra-nss =3D "${base_libdir}/libnss*"
> =A0FILES_sln =3D "${base_sbindir}/sln"
> +FILES_glibc-pic =3D "${glibcpicfiles}"
> +FILES_${PN}-pic =3D "${glibcpicfiles}"
> =A0FILES_glibc-dev =3D "${glibcdevfiles}"
> =A0FILES_${PN}-dev =3D "${glibcdevfiles}"
> =A0FILES_glibc-dbg =3D "${glibcdbgfiles}"
>
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


