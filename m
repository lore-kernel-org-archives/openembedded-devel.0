Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OleCo-0005PF-FD
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 10:41:07 +0200
Received: by iwn38 with SMTP id 38so390561iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zxfA9qao1IuRaL9mf48xAyjBmI3ske007Cc9FeQeTV8=;
	b=ku4+z01LEw4WEB3qt4Tqy4zyOA/V78Kz44EQTSHJyYVWw4ODpofcVyoQEZ64PKjFai
	a0wU67Rs/XNqAkT6hWtO5Wuj5lEkgel/G4BsCGerSEavqKGNsBX7nkuUsohwF79i86Z7
	3dF/aIaLanHCcmW5GHBzG56b7pvutZ0V/J/6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wQLRpsAcAjxj9lX7OCVeMjefarx0f6NIoNK9PbRKf9IeBT4qAVfXtu+SvDYF/nQJCx
	FRn4Ytoz+J7Kb74DjueYqgVNRGuczPgTo8oTUOGQVL8/wUXx4Mm4BfCHZ2piH8VdVo0x
	rbDtPXQWa8SFAgqHuyrZSouz6r+rzzWrLI650=
MIME-Version: 1.0
Received: by 10.231.183.149 with SMTP id cg21mr551122ibb.133.1282120848849;
	Wed, 18 Aug 2010 01:40:48 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 01:40:48 -0700 (PDT)
In-Reply-To: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
References: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
Date: Wed, 18 Aug 2010 10:40:48 +0200
Message-ID: <AANLkTik0m-1QRcExaT9wX2kc5SA8XyBDOGiC7nad5rvz@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gawk-native_3.1.4.bb: Removed legacy style staging
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
X-List-Received-Date: Wed, 18 Aug 2010 08:41:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/18 Fahad Usman <fahad_usman@mentor.com>:
> * converted do_stage to do_install
>
> * replaced ${STAGING_BINDIR} with ${D}${bindir}
>
> * added NATIVE_INSTALL_WORKS =3D "1"
>
> * added PR =3D "r1"
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> =A0recipes/gawk/gawk-native_3.1.4.bb | =A0 =A09 ++++++---
> =A01 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/gawk/gawk-native_3.1.4.bb b/recipes/gawk/gawk-native=
_3.1.4.bb
> index 0a33f71..67d254c 100644
> --- a/recipes/gawk/gawk-native_3.1.4.bb
> +++ b/recipes/gawk/gawk-native_3.1.4.bb
> @@ -1,5 +1,8 @@
> =A0INHIBIT_AUTOTOOLS_DEPS =3D "1"
> =A0require gawk_${PV}.bb
> +PR =3D "r1"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
>
> =A0inherit native
>
> @@ -8,7 +11,7 @@ PATCHTOOL =3D "patch"
>
> =A0S =3D "${WORKDIR}/gawk-${PV}"
>
> -do_stage() {
> - =A0 =A0 =A0 install -d ${STAGING_BINDIR}
> - =A0 =A0 =A0 install -m 755 gawk ${STAGING_BINDIR}
> +do_install() {
> + =A0 =A0 =A0 install -d ${D}${bindir}
> + =A0 =A0 =A0 install -m 755 gawk ${D}${bindir}
> =A0}
> --

I suggest to merge this with the non-native recipe.
Also I feel that the default do_install should work here, so a
specific do_install seems not needed (it is an autotools recipe).

Frans


