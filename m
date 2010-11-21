Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKCnj-0000rZ-Pw
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 17:30:04 +0100
Received: by gyd12 with SMTP id 12so1024386gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=zrI5QJPu2lFNMHotmxr6Ly7jk1I8+6Fn1/JOcES8zqc=;
	b=pbvBherOlziNNb+zmgDWrvWN8hBScexko1ObS8A8f0Fs/HZL5M5PIX1S40eGRnUuOP
	N4W7qLmfQdD50EfVtUGhM6kTGIjm6zv7Lm2myFBXDVcR2F0jVe3gESS3+ujYOPGwJyBq
	TkHjMbTMzOLIlnczQtuMXPegTLZIhTMPhRYBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=xkZaoOatOBaYRVIaNdMogVA60ifinvLKIgD5OPlGbw84KUeuRHkr5vRVcZ9hu1vSAU
	e/CGwGBxlO/5YydIQfY0Ynw9pFIkVFs6xmczpDr0pnign4OXaaPchQXAv9Rq9aLntafp
	ZNw2kHf5VOZOGviDwW4shM3fbmUxqz9qSBmfE=
Received: by 10.91.51.19 with SMTP id d19mr5811300agk.183.1290356927412; Sun,
	21 Nov 2010 08:28:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 08:28:24 -0800 (PST)
In-Reply-To: <1290352792-2563-1-git-send-email-eric@eukrea.com>
References: <4CE56C6B.1050009@eukrea.com>
	<1290352792-2563-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 08:28:24 -0800
Message-ID: <AANLkTimfoxpED7bJF=EkMcjp+Lz92CGN4O=epCvGeO1b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH] handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Sun, 21 Nov 2010 16:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/21 Eric B=C3=A9nard <eric@eukrea.com>:
> * setting PACKAGE_ARCH =3D "${MACHINE_ARCH}" in an amend.inc actually
> leads to a package with the correct machine arch but the
> work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
> updated after amend.inc is parsed.
>
> * this patch :
> - factorizes the code which compute MULTIMACH_ARCH in base.bbclass
> - updates MULTIMACH_ARCH if required by an amend.inc
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0classes/amend.bbclass | =C2=A0 =C2=A02 +
> =C2=A0classes/base.bbclass =C2=A0| =C2=A0 53 ++++++++++++++++++++++++++--=
--------------------
> =C2=A02 files changed, 31 insertions(+), 24 deletions(-)
>
> diff --git a/classes/amend.bbclass b/classes/amend.bbclass
> index a03de64..048a8f3 100644
> --- a/classes/amend.bbclass
> +++ b/classes/amend.bbclass
> @@ -42,4 +42,6 @@ python () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D set()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends |=3D set(newdata)
> =C2=A0 =C2=A0 d.setVar("__depends", depends)
> +
> + =C2=A0 =C2=A0set_multimach_arch(d)
> =C2=A0}
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 308498f..90a481b 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -288,6 +288,34 @@ addtask build
> =C2=A0do_build =3D ""
> =C2=A0do_build[func] =3D "1"
>
> +def set_multimach_arch(d):
> + =C2=A0 =C2=A0# 'multimachine' handling
> + =C2=A0 =C2=A0mach_arch =3D bb.data.getVar('MACHINE_ARCH', d, 1)
> + =C2=A0 =C2=A0pkg_arch =3D bb.data.getVar('PACKAGE_ARCH', d, 1)
> +
> + =C2=A0 =C2=A0#
> + =C2=A0 =C2=A0# We always try to scan SRC_URI for urls with machine over=
rides
> + =C2=A0 =C2=A0# unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=
=3D0
> + =C2=A0 =C2=A0#
> + =C2=A0 =C2=A0override =3D bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARC=
H', d, 1)
> + =C2=A0 =C2=A0if override !=3D '0' and is_machine_specific(d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_ARCH', "${MACHINE_AR=
CH}", d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('MULTIMACH_ARCH', mach_arch, =
d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> +
> + =C2=A0 =C2=A0multiarch =3D pkg_arch
> +
> + =C2=A0 =C2=A0packages =3D bb.data.getVar('PACKAGES', d, 1).split()
> + =C2=A0 =C2=A0for pkg in packages:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgarch =3D bb.data.getVar("PACKAGE_ARCH_%s"=
 % pkg, d, 1)
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# We could look for !=3D PACKAGE_ARCH here b=
ut how to choose
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# if multiple differences are present?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Look through PACKAGE_ARCHS for the priorit=
y order?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkgarch and pkgarch =3D=3D mach_arch:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multiarch =3D mach_arch
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break
> +
> =C2=A0python () {
> =C2=A0 =C2=A0 import exceptions
>
> @@ -363,30 +391,7 @@ python () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Already machine specific - nothing further =
to do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>
> - =C2=A0 =C2=A0#
> - =C2=A0 =C2=A0# We always try to scan SRC_URI for urls with machine over=
rides
> - =C2=A0 =C2=A0# unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=
=3D0
> - =C2=A0 =C2=A0#
> - =C2=A0 =C2=A0override =3D bb.data.getVar('SRC_URI_OVERRIDES_PACKAGE_ARC=
H', d, 1)
> - =C2=A0 =C2=A0if override !=3D '0' and is_machine_specific(d):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PACKAGE_ARCH', "${MACHINE_AR=
CH}", d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('MULTIMACH_ARCH', mach_arch, =
d)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> -
> - =C2=A0 =C2=A0multiarch =3D pkg_arch
> -
> - =C2=A0 =C2=A0packages =3D bb.data.getVar('PACKAGES', d, 1).split()
> - =C2=A0 =C2=A0for pkg in packages:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgarch =3D bb.data.getVar("PACKAGE_ARCH_%s"=
 % pkg, d, 1)
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# We could look for !=3D PACKAGE_ARCH here b=
ut how to choose
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# if multiple differences are present?
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# Look through PACKAGE_ARCHS for the priorit=
y order?
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkgarch and pkgarch =3D=3D mach_arch:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multiarch =3D mach_arch
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break
> -
> - =C2=A0 =C2=A0bb.data.setVar('MULTIMACH_ARCH', multiarch, d)
> + =C2=A0 =C2=A0set_multimach_arch(d)
> =C2=A0}
>
> =C2=A0EXPORT_FUNCTIONS do_setscene do_fetch do_unpack do_configure do_com=
pile do_install do_package
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


