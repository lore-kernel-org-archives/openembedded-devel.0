Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdIUJ-0006NI-R4
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 08:48:13 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1058843qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8Xs1UMty+/+ipaUbv9Irfr6A4qFZTkIQboUWZWZKfbs=;
	b=ZRWomGm2TTrWE1voGp2iLGT8P38bVI4qtwKU2hrgMp/8ovQ/cgD4XcSLa9NeKkgm9q
	QrwMCXRbmjzJSEgQUMlneH6Bbv4lYoxMxYyeIoXQiGpgKw7+Mr9tpuhXgONLYaXAGUdA
	VPin6H5knYITJgYYTl7xOpu5yrcc/uc227xQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OK/0sDNxfEoPdvqoo53CFSti3+vTmD1y9i9zNlA8y1SndlrMcPaI4ZOA5Bj3zyjxyU
	hkxifW78t7gsrL5ZRK8MdsjoXnH1rVDG3HnZ27hBuHNowFHedWPhgcNUGjYo8vq0SC+p
	9y3+NQRkDI2Rlocw+Hgd4JCjP/tp7kam6RPDg=
MIME-Version: 1.0
Received: by 10.229.32.148 with SMTP id c20mr2302762qcd.52.1250577065370; Mon, 
	17 Aug 2009 23:31:05 -0700 (PDT)
In-Reply-To: <1250567655-14771-1-git-send-email-msmith@cbnco.com>
References: <1250567655-14771-1-git-send-email-msmith@cbnco.com>
Date: Mon, 17 Aug 2009 23:31:05 -0700
Message-ID: <19c1b8a90908172331m1ef0a7d2r98287533c595f126@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] glibc: fix hardcoded /sbin/ldconfig path
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
X-List-Received-Date: Tue, 18 Aug 2009 06:48:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2009 at 8:54 PM, Michael Smith<msmith@cbnco.com> wrote:
> Put it in ${base_sbindir} instead of /sbin.
>
> Not bumping PR because most people let /sbin be /sbin.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0recipes/glibc/glibc-package.bbclass | =C2=A0 =C2=A05 +++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-pa=
ckage.bbclass
> index 2da6818..0127646 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -36,11 +36,11 @@ INSANE_SKIP_glibc-dbg =3D True
>
> =C2=A0libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/lib=
crypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir=
}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir=
}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${=
base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/l=
ibrt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_li=
bdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so $=
{base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_li=
bdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/=
libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* =
${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl=
-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*=
.so"
>
> -FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${=
@base_conditional('USE_LDCONFIG', '1', '/sbin/ldconfig', '', d)}"
> +FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${=
@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> =C2=A0FILES_ldd =3D "${bindir}/ldd"
> =C2=A0FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> =C2=A0FILES_glibc-extra-nss =3D "${base_libdir}/libnss*"
> -FILES_sln =3D "/sbin/sln"
> +FILES_sln =3D "${base_sbindir}/sln"
> =C2=A0FILES_glibc-dev_append =3D " ${libdir}/*.o ${bindir}/rpcgen"
> =C2=A0FILES_nscd =3D "${sbindir}/nscd*"
> =C2=A0FILES_glibc-utils =3D "${bindir}/* ${sbindir}/*"
> @@ -66,6 +66,7 @@ def get_glibc_fpu_setting(bb, d):
> =C2=A0 =C2=A0 return ""
>
> =C2=A0EXTRA_OECONF +=3D "${@get_glibc_fpu_setting(bb, d)}"
> +EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
>
> =C2=A0OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
>
> --
> 1.6.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


