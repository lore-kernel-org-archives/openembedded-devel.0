Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlKsx-000359-Vs
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 14:03:36 +0200
Received: by yws5 with SMTP id 5so1425777yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vcV6piY5iP5s3j9tu/rI0I3ZABEPUQCc86NTaxMKs9A=;
	b=hsAmn656J9/UR+6XcVBG/KHfQXcqW7rUE2NcjLvQAGBNdMgCKYsYi9hGnEnllWxZ4s
	tcnz7OmD34GetHusZRKy5/lg/6Ud45cXrpG32FxUcTaeU2c2M/htECSE6Y3Yn5jKABZQ
	P73d+r6nui/GmfVdvn9DEwzbrjaSjBdXWOXqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UTTfcwpGIEeleTxnr7aN+s22i7IK60jWSJNNGeoIASIJGBLsFt1LsPu0TWV8Qjw7WD
	z76hEyFOWHV2e8eeRLkIRdQz2PTLPdPZRU+VHZI9UI+Keze/uHwOtt09IcBldwd7zVYY
	tP+E8bGIzmvkXT/58veekuOe2q0USFZcWup5k=
MIME-Version: 1.0
Received: by 10.231.19.3 with SMTP id y3mr7263712iba.156.1282046574003; Tue,
	17 Aug 2010 05:02:54 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 05:02:53 -0700 (PDT)
In-Reply-To: <1282043314-17275-1-git-send-email-fahad_usman@mentor.com>
References: <1282043314-17275-1-git-send-email-fahad_usman@mentor.com>
Date: Tue, 17 Aug 2010 14:02:53 +0200
Message-ID: <AANLkTikTVRGqOYsqh2+shqgAHskGCCxZ9T9-Hb8GnAVW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh-native: Removed legacy style staging
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
X-List-Received-Date: Tue, 17 Aug 2010 12:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Fahad Usman <fahad_usman@mentor.com>:
> * converted do_stage to do_install
>
> * replaced ${STAGING_BINDIR} with ${D}${bindir}
>
> * bumped the PR in the .bb files
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> =A0recipes/cacao/cacaoh-native.inc =A0 =A0 =A0 | =A0 =A06 +++---
> =A0recipes/cacao/cacaoh-native_0.99.3.bb | =A0 =A02 +-
> =A0recipes/cacao/cacaoh-native_0.99.4.bb | =A0 =A02 +-
> =A03 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/cacao/cacaoh-native.inc b/recipes/cacao/cacaoh-nativ=
e.inc
> index a44c503..d255df4 100644
> --- a/recipes/cacao/cacaoh-native.inc
> +++ b/recipes/cacao/cacaoh-native.inc
> @@ -20,7 +20,7 @@ do_compile() {
> =A0 oe_runmake -C src/vmcore libvmcore.la
> =A0 oe_runmake -C src/cacaoh cacaoh
> =A0}
> -
> -do_stage() {
> - =A0 =A0 =A0 install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/c=
acaoh-${PV}
> +do_install() {
> + =A0 =A0 =A0 install -d ${D}${bindir}/cacaoh-${PV}
> + =A0 =A0 =A0 install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacao=
h-${PV}
> =A0}
> diff --git a/recipes/cacao/cacaoh-native_0.99.3.bb b/recipes/cacao/cacaoh=
-native_0.99.3.bb
> index b3baee0..b321329 100644
> --- a/recipes/cacao/cacaoh-native_0.99.3.bb
> +++ b/recipes/cacao/cacaoh-native_0.99.3.bb
> @@ -1,6 +1,6 @@
> =A0require cacaoh-native.inc
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-=
${PV}/cacao-${PV}.tar.bz2"
>
> diff --git a/recipes/cacao/cacaoh-native_0.99.4.bb b/recipes/cacao/cacaoh=
-native_0.99.4.bb
> index a9effc0..e269e43 100644
> --- a/recipes/cacao/cacaoh-native_0.99.4.bb
> +++ b/recipes/cacao/cacaoh-native_0.99.4.bb
> @@ -1,6 +1,6 @@
> =A0require cacaoh-native.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-=
${PV}/cacao-${PV}.tar.bz2"
>
> --
> 1.6.3.3

I think you need
NATIVE_INSTALL_WORKS =3D "1"
in your recipe.

When updating your patch please resubmit as v2 and update patchwork

Frans


