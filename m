Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDOke-000713-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:50:45 +0100
Received: by gxk26 with SMTP id 26so3177626gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UayjeAOdgdn646pXZB1Er+2stSwbrFtMlVUZIQG6U0Q=;
	b=TzvxCdOWqetvulvVJIYju8j90V5v12lrcIOmmAonG0fEfAqJemM6XoU/RGRw3niD2A
	CSdYmfaLtWmgRC/I09YqP5bJTyXypt054dNhHjEIuN82Eh0CvC/A4zOSFtJQ8obzMbU0
	J9q/mG8Lg5L6HjUMAUlN0QR7jOxQQkA6GSdqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=imcSzN7cBcGg5/0GyPyujOAHOr32SeNp50dsCnnGPAiDAyvBfL0oSuQabssYYxL7CI
	ebGzXh8vI8DwhUHK7DNCDsnnMlbjKyXarhsZpSgxpRBSCWE3qf72+xj9Yl/lQDTRXear
	Y917qwbXHU95sfXaZ9Ft+/78j7HUDHbeHNF08=
Received: by 10.90.15.31 with SMTP id 31mr2056276ago.10.1288734593271; Tue, 02
	Nov 2010 14:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 14:49:33 -0700 (PDT)
In-Reply-To: <1288732510-30545-1-git-send-email-anarsoul@gmail.com>
References: <1288732510-30545-1-git-send-email-anarsoul@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 14:49:33 -0700
Message-ID: <AANLkTin2CR7+C8zz1NtBmV0d2H=gEgNZrXCh5oATzqvz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: fix build with make-3.82
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
X-List-Received-Date: Tue, 02 Nov 2010 21:50:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2010 at 2:15 PM, Vasily Khoruzhick <anarsoul@gmail.com> wrot=
e:
> Add patch to fix this error when building eglibc-2.12
> with make-3.82:
>

thanks for the patch. while you are at it can you also patch other
versions of eglibc
that would be nice.

> make[2]: Entering directory `eglibc-2_12/libc/manual'
> Makefile:246: *** mixed implicit and normal rules. =C2=A0Stop.
>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
> =C2=A0recipes/eglibc/eglibc_2.12.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A0recipes/eglibc/files/eglibc-make-382.patch | =C2=A0 15 ++++++++++++=
+++
> =C2=A02 files changed, 17 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/eglibc/files/eglibc-make-382.patch
>
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.b=
b
> index 40ab65c..956f64b 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -4,7 +4,7 @@ DEFAULT_PREFERENCE =3D "-1"
> =C2=A0DEPENDS +=3D "gperf-native"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> =C2=A0PV =3D "2.12"
> -PR =3D "${INC_PR}.6"
> +PR =3D "${INC_PR}.7"
> =C2=A0PR_append =3D "+svnr${SRCPV}"
> =C2=A0SRCREV=3D"11762"
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_12"
> @@ -16,6 +16,7 @@ SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${E=
GLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_local-fpscr_values.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-dont-cache-slibdir=
.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://armv4-eabi-compile-fix.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://eglibc-make-382.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> diff --git a/recipes/eglibc/files/eglibc-make-382.patch b/recipes/eglibc/=
files/eglibc-make-382.patch
> new file mode 100644
> index 0000000..5ecad90
> --- /dev/null
> +++ b/recipes/eglibc/files/eglibc-make-382.patch
> @@ -0,0 +1,15 @@
> +http://git.frugalware.org/gitweb/gitweb.cgi?p=3Dfrugalware-current.git;a=
=3Dblob_plain;f=3Dsource/base/glibc/make-3.82-fix.patch;hb=3D8217c32ecc2e14=
962847ba3d8a272eb64a3dba4f
> +
> +--- libc/manual/Makefile
> ++++ libc/manual/Makefile
> +@@ -232,7 +232,9 @@
> + .PHONY: stubs
> + stubs: $(objpfx)stubs
> + endif
> +-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
> ++$(objpfx)stubs ../po/manual.pot:
> ++ =C2=A0 =C2=A0 =C2=A0touch $@
> ++$(objpfx)stamp%:
> + =C2=A0 =C2=A0 =C2=A0 $(make-target-directory)
> + =C2=A0 =C2=A0 =C2=A0 touch $@
> +
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


