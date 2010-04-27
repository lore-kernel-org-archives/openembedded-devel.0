Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O6sI3-0008Jy-3U
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 23:26:03 +0200
Received: by pwj5 with SMTP id 5so8842196pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 14:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nYQygvHFB36ZDPNAxDWHZyrYGzglbncruCA8LIl6QFc=;
	b=Ixy0Sh21IyjT99KKCWFbroWkDw6FGGHKBpEwzMA986HAsNu0wJzmkJpMgmnw13zRdm
	8yjA5SpjZ2v11Rnc9GeswAaoGcrlc1KjyxWurkcXwgYsGicG3+tfgVBNccESNfT7QAHM
	j47tgaruoBH0MBwPWih//iBHpPGyaJIB7u7ME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XFem/qT/HfpGG61zdogZE1bzg2Aekzw54PoWrwiC5tnp6Hcn9wE0IzOpauPYS01Y25
	JRXEpo2gEIu1s1j7mevbjtDbG0HQE1ISofYKqu9MkSeYG1s9c1loAQNfjlYBcvSWEar1
	rur9dI4frmNzzjWxVeVfGz1+fxCJvjHcHcibw=
MIME-Version: 1.0
Received: by 10.141.131.13 with SMTP id i13mr6586278rvn.121.1272403336496; 
	Tue, 27 Apr 2010 14:22:16 -0700 (PDT)
Received: by 10.231.16.198 with HTTP; Tue, 27 Apr 2010 14:22:16 -0700 (PDT)
In-Reply-To: <1272401386.3865.719.camel@trini-m4400>
References: <1272401386.3865.719.camel@trini-m4400>
Date: Tue, 27 Apr 2010 14:22:16 -0700
Message-ID: <o2w19c1b8a91004271422sedcf25f4v2b0890ad9fab0194@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove scsi headers from linux-libc-headers
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
X-List-Received-Date: Tue, 27 Apr 2010 21:26:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2010 at 1:49 PM, Tom Rini <tom_rini@mentor.com> wrote:
> linux-libc-headers: Go and delete include/scsi when it exists
>
> With 2.6.31, the kernel started exporting SCSI headers again. =A0After
> talking with Christoph Hellwig and James Bottemley (scsi maintainer),
> these really should be removed. =A0A patch to the kernel to do so will be
> happening shortly, but for now fixup the broken recipes we have.

yeah back then it was not clear what the final solution will be.
So its decided now that they will follow the approach
"Don't export and let glibc supply the headers"

In that case this interim fix can be removed.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> index 2e4041f..c2cf5d4 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> @@ -44,6 +44,7 @@ do_compile () {
> =A0do_install() {
> =A0 =A0 =A0 =A0set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D
> $ARCH
> + =A0 =A0 =A0 rm -rf ${D}${exec_prefix}/include/scsi
> =A0}
>
> =A0SRC_URI[md5sum] =3D "84c077a37684e4cbfa67b18154390d8a"
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> index d82a749..b8b109e 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> @@ -44,6 +44,7 @@ do_compile () {
> =A0do_install() {
> =A0 =A0 =A0 =A0set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D
> $ARCH
> + =A0 =A0 =A0 rm -rf ${D}${exec_prefix}/include/scsi
> =A0}
>
> =A0SRC_URI[md5sum] =3D "260551284ac224c3a43c4adac7df4879"
>
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


