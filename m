Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PTm3p-0000KP-Ct
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:58:13 +0100
Received: by yxd5 with SMTP id 5so608614yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 17:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=HMQrntLpptQxdw2kFZsKYUch677vDCyrV4EPwCLMCA0=;
	b=OrwTVxZL3PBZoPJ8VzAkITLR2qhbsVvV5hKZVv6orq8OTEYW1lYaMN/mP+8w+jmD82
	BLohxqanmls+CLAU2HtBNJi9Yt4cxM20cvT7zIOcBjfKykXmce4iCJskBcASPInPrb38
	Mez5v1l9RcVf4UejtafYxkc7qzp8KHgRpxHcY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fx2AyQwmA5qCLKnGLblzuXqsUVn5CSY6i5cu2urEZe/h6cB3+uapxFEPR7YeU5fb+M
	sqMyK+EKjqvB9jfWJ+iB/izzclru6ZOI0zUmxh/k9+hlE9lSG3F5awRm4yJO0hZhNGns
	Jk08u1amN6XScrnlmdZ1NAThhaT9bnZ9Kwg6s=
Received: by 10.90.72.2 with SMTP id u2mr3027691aga.4.1292637489563; Fri, 17
	Dec 2010 17:58:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 17 Dec 2010 17:57:49 -0800 (PST)
In-Reply-To: <4D0B000B.4010903@gmail.com>
References: <4D0B000B.4010903@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Dec 2010 17:57:49 -0800
Message-ID: <AANLkTimtY4+MaMDwWTagT0zRnRB5tZorCoYmjJZA-Wi_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] meta-toolchain.bb: Fix do_populate_sdk for DISTRO=micro.
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
X-List-Received-Date: Sat, 18 Dec 2010 01:58:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2010 at 10:15 PM, Graham Gower <graham.gower@gmail.com> wro=
te:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Looks ok

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/meta/meta-toolchain.bb | =C2=A0 16 +++++++++-------
> =C2=A01 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain=
.bb
> index e949432..cb9e438 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -72,9 +72,9 @@ do_populate_sdk() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${IPKG_TARGET} rem=
ove -force-depends ${TOOLCHAIN_TARGET_EXCLUDE}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 install -d ${SDK_OUTPUT}/${SDKPATH}/usr/lib/opkg
> - =C2=A0 =C2=A0 =C2=A0 mv ${SDK_OUTPUT}/usr/lib/opkg/* ${SDK_OUTPUT}/${SD=
KPATH}/usr/lib/opkg/
> - =C2=A0 =C2=A0 =C2=A0 rm -Rf ${SDK_OUTPUT}/usr/lib
> + =C2=A0 =C2=A0 =C2=A0 install -d ${SDK_OUTPUT}/${SDKPATH}${libdir}/opkg
> + =C2=A0 =C2=A0 =C2=A0 mv ${SDK_OUTPUT}${libdir}/opkg/* ${SDK_OUTPUT}/${S=
DKPATH}${libdir}/opkg/
> + =C2=A0 =C2=A0 =C2=A0 rm -Rf ${SDK_OUTPUT}${libdir}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Clean up empty directories from excluded pac=
kages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0find ${SDK_OUTPUT} -depth -type d -empty -prin=
t0 | xargs -r0 /bin/rmdir
> @@ -86,7 +86,7 @@ do_populate_sdk() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/=
${SDKPATH}/${sysconfdir}/
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# extract and store ipks, pkgdata and shlibs d=
ata
> - =C2=A0 =C2=A0 =C2=A0 target_pkgs=3D`cat ${SDK_OUTPUT}/${SDKPATH}/${TARG=
ET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
> + =C2=A0 =C2=A0 =C2=A0 target_pkgs=3D`cat ${SDK_OUTPUT}/${SDKPATH}/${TARG=
ET_SYS}${libdir}/opkg/status | grep Package: | cut -f 2 -d ' '`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/ipk/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/run=
time/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SY=
S}/shlibs/
> @@ -123,9 +123,11 @@ do_populate_sdk() {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# With sysroot support, gcc expects the defaul=
t C++ headers to be
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# in a specific place.
> - =C2=A0 =C2=A0 =C2=A0 install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/=
include
> - =C2=A0 =C2=A0 =C2=A0 mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/incl=
ude/c++ \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${SDK_OUTPUT}/${SDKPAT=
H}/${TARGET_SYS}/include/
> + =C2=A0 =C2=A0 =C2=A0 if [ "${base_prefix}" !=3D "${prefix}" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${SDK_OUTPU=
T}/${SDKPATH}/${TARGET_SYS}/include
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${SDK_OUTPUT}/${SDK=
PATH}/${TARGET_SYS}/usr/include/c++ \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
> + =C2=A0 =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Fix or remove broken .la files
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARG=
ET_SYS} -name \*.la`; do
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


