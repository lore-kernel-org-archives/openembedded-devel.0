Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PK4eJ-0002U6-3T
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 08:47:47 +0100
Received: by gwaa11 with SMTP id a11so3707236gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 23:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=fl4Jp7fRv6Kqi47LHPwpWi9esiNr4e0EDogoQbgwCGw=;
	b=DqlxDEFC4dOT4F7OXLdzMJSaBQhSWaLnyeGMi+bbJoEmswEkZv6SAjKj/IGiCNwX8u
	tYM6nLXUT/dF5vrx9NbGGN7TDAYMmhVznYECiALJ61IDSCUpFsXgWjS7hc6m6O4g5VZc
	ack2XkmUzC2WzS7AbHCifOxY8B8F33uRxDiVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=yBSuPMiCv2XRjS1SnYzdrxnIY+8M7oNT0F1zLPMwgqObfGF5pVr5VIVbNa/esCzCu3
	cMR4xP23cO3l/+HAoIi4K/3578/W7Kxd29kth7WPshpeT0wB7//B7o6Ij1ocKxa3/PSJ
	V+HLNBrAePzz/7BzEDyXRCv+9Y1BovnlXoqLg=
Received: by 10.91.10.21 with SMTP id n21mr3807997agi.75.1290325595553; Sat,
	20 Nov 2010 23:46:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 20 Nov 2010 23:46:15 -0800 (PST)
In-Reply-To: <1290288073-7632-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1290288073-7632-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2010 23:46:15 -0800
Message-ID: <AANLkTims+n4ixJEoJZObTUaxFy_Hq4bm2PpnOZ7PnHZv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] php: fixed path
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
X-List-Received-Date: Sun, 21 Nov 2010 07:47:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 20, 2010 at 1:21 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> with the arrival of a new release the old php tarball moved to the
> museum site, Fixed SRC_URI and moved it from the inc file to the bb file
> so when adding the latest version there is no SRC_URI clash in the .inc
> file.
>
> Also introduced INC_PR
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0recipes/php/php-native_5.3.2.bb | =C2=A0 =C2=A07 +++++--
> =C2=A0recipes/php/php.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A04 +---
> =C2=A0recipes/php/php_5.2.13.bb =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12 ++++++++=
----
> =C2=A03 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/recipes/php/php-native_5.3.2.bb b/recipes/php/php-native_5.3=
.2.bb
> index d5ed932..3a2299c 100644
> --- a/recipes/php/php-native_5.3.2.bb
> +++ b/recipes/php/php-native_5.3.2.bb
> @@ -1,8 +1,11 @@
> =C2=A0require php-native.inc
>
> -PR =3D "r1"
> +PR =3D "${INC_PR}.1"
>
> -SRC_URI +=3D "file://CVE-2010-0397.patch"
> +SRC_URI =3D =C2=A0 =C2=A0 "http://museum.php.net/php5/php-${PV}.tar.bz2;=
name=3Dsrc \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude-xml2-=
config.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://php-m4-divert.p=
atch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2010-0397.pa=
tch"
>
> =C2=A0SRC_URI[src.md5sum] =3D "46f500816125202c48a458d0133254a4"
> =C2=A0SRC_URI[src.sha256sum] =3D "9a380a574adcb3a9abe3226e7c3a9bae619e8a1=
b90842ec2a7edf0ad92afdeda"
> diff --git a/recipes/php/php.inc b/recipes/php/php.inc
> index bfee93c..a48827a 100644
> --- a/recipes/php/php.inc
> +++ b/recipes/php/php.inc
> @@ -3,9 +3,7 @@ HOMEPAGE =3D "http://www.php.net"
> =C2=A0SECTION =3D "console/network"
> =C2=A0LICENSE =3D "PHP"
>
> -SRC_URI =3D =C2=A0 =C2=A0 "http://us2.php.net/distributions/php-${PV}.ta=
r.bz2;name=3Dsrc \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude-xml2-=
config.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://php-m4-divert.p=
atch"
> +INC_PR =3D "r7"
>
> =C2=A0S =3D "${WORKDIR}/php-${PV}"
>
> diff --git a/recipes/php/php_5.2.13.bb b/recipes/php/php_5.2.13.bb
> index 0f9317d..5871dca 100644
> --- a/recipes/php/php_5.2.13.bb
> +++ b/recipes/php/php_5.2.13.bb
> @@ -3,12 +3,16 @@ require php.inc
> =C2=A0DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native =
mysql5 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-client openssl"
>
> -PR =3D "r7"
> -
> -SRC_URI +=3D "file://pear-makefile.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://imap-fix-autofoo.patch =
\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2010-0397.patch \
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI =3D =C2=A0 =C2=A0 "http://museum.php.net/php5/php-${PV}.tar.bz2;=
name=3Dsrc \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude-xml2-=
config.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://php-m4-divert.p=
atch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pear-makefile.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://imap-fix-autofoo=
.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2010-0397.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> =C2=A0SRC_URI[src.md5sum] =3D "eb4d0766dc4fb9667f05a68b6041e7d1"
> =C2=A0SRC_URI[src.sha256sum] =3D "2b50a2535e3bb9a98cd4d1633f9452d877276c4=
0b385915261f040d535c7eadb"
>
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


