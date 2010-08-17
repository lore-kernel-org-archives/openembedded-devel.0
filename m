Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlKlk-0002Y7-RV
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 13:56:08 +0200
Received: by yxd39 with SMTP id 39so1948755yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bralnj6EhKiEM615n29PduP+aGXOKZzHfeSe6APElSA=;
	b=tezH185daE1E+sOx/EU2HQ0HOtTmtU+QDfYJ1d81yR36uXIw0RDK6dD0kxPDiq4tf2
	8RGRM4civZy5hkjeGA0ZjW7GzA6lm2kxRrmmQoTZi58JHg1OSvT3lKZMhFxZ4dHZBoiu
	xl0PRHRKAQ8X6092o6wABWj801e1prDoIQ2tU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dYEXTB8HMFLq99z75e3RZ48kvUMtT8NNv5JTchZ2VZTCCfi3DcP3tH9xLh/8NDu56F
	aoUUJ3mcIoWKvThXxbNoGMTDFl3Y7VSVoaNB+s2+kOb7hLpP/aEh0snw3yWVRYCYKksb
	X92ymojU5vYadikBIW1WA018Ncn13GAc5rG7k=
MIME-Version: 1.0
Received: by 10.231.15.203 with SMTP id l11mr2052559iba.182.1282046130839;
	Tue, 17 Aug 2010 04:55:30 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 04:55:30 -0700 (PDT)
In-Reply-To: <1282044373-17782-1-git-send-email-fahad_usman@mentor.com>
References: <1282044373-17782-1-git-send-email-fahad_usman@mentor.com>
Date: Tue, 17 Aug 2010 13:55:30 +0200
Message-ID: <AANLkTikYE2zoDFrLbb23qTh6Jfq6UY9AM4re9YJOAnEn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh-native: used oe-stylize.py
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
X-List-Received-Date: Tue, 17 Aug 2010 11:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Fahad Usman <fahad_usman@mentor.com>:
> * just incorporated the output of oe-stylize.py, no functionality is chan=
ged
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> =A0recipes/cacao/cacaoh-native.inc =A0 =A0 =A0 | =A0 =A07 +++----
> =A0recipes/cacao/cacaoh-native_0.99.3.bb | =A0 =A05 ++---
> =A0recipes/cacao/cacaoh-native_0.99.4.bb | =A0 =A05 ++---
> =A03 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/cacao/cacaoh-native.inc b/recipes/cacao/cacaoh-nativ=
e.inc
> index d255df4..fcbe93b 100644
> --- a/recipes/cacao/cacaoh-native.inc
> +++ b/recipes/cacao/cacaoh-native.inc
> @@ -1,7 +1,6 @@
> =A0DESCRIPTION =3D "Header generator for Cacao JVM - Needed for cross-com=
pilation builds"
> =A0HOMEPAGE =3D "http://www.cacaojvm.org/"
> -LICENSE =A0=3D "GPL"
> -
> +LICENSE =3D "GPL"
> =A0DEPENDS =3D "libtool-native zlib-native virtual/javac-native classpath=
-native"
>
> =A0S =3D "${WORKDIR}/cacao-${PV}"
> @@ -21,6 +20,6 @@ do_compile() {
> =A0 oe_runmake -C src/cacaoh cacaoh
> =A0}
> =A0do_install() {
> - =A0 =A0 =A0 install -d ${D}${bindir}/cacaoh-${PV}
> - =A0 =A0 =A0 install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacao=
h-${PV}
> + =A0install -d ${D}${bindir}/cacaoh-${PV}
> + =A0install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
> =A0}
> diff --git a/recipes/cacao/cacaoh-native_0.99.3.bb b/recipes/cacao/cacaoh=
-native_0.99.3.bb
> index b321329..1bc3b84 100644
> --- a/recipes/cacao/cacaoh-native_0.99.3.bb
> +++ b/recipes/cacao/cacaoh-native_0.99.3.bb
> @@ -1,8 +1,7 @@
> -require cacaoh-native.inc
> -
> =A0PR =3D "r2"
>
> =A0SRC_URI =3D "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-=
${PV}/cacao-${PV}.tar.bz2"
> -
> =A0SRC_URI[md5sum] =3D "db93ab31c6d1b7f1e213771bb81bde58"
> =A0SRC_URI[sha256sum] =3D "1ea5bd257f755ffcae2c7a1935c37147c7392478922410=
e0870361eea08b6c27"
> +
> +require cacaoh-native.inc
> diff --git a/recipes/cacao/cacaoh-native_0.99.4.bb b/recipes/cacao/cacaoh=
-native_0.99.4.bb
> index e269e43..d0fc1c0 100644
> --- a/recipes/cacao/cacaoh-native_0.99.4.bb
> +++ b/recipes/cacao/cacaoh-native_0.99.4.bb
> @@ -1,8 +1,7 @@
> -require cacaoh-native.inc
> -
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-=
${PV}/cacao-${PV}.tar.bz2"
> -
> =A0SRC_URI[md5sum] =3D "63220327925ace13756ae334c55a3baa"
> =A0SRC_URI[sha256sum] =3D "1dfc4903dc0172286df4f1740fd0f12749ac81d51c6022=
90b47cbe83d51e1d56"
> +
> +require cacaoh-native.inc
> --

Have you tested this?
Moving a require file might lead to errors or unexpected results
a require (or include) is an inclusion of the file. Moving it might
cause a problem if the recipe itself redefines a var that is also
defined in the inc file.
(e.g. if the recipe overrules the DEPENDS that are in an .inc file)

Frans.


