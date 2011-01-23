Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ph87F-0006sg-E3
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 23:08:57 +0100
Received: by yie16 with SMTP id 16so1223110yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 14:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=53c11PECXv8BPu/AuOjyAzn47IIHOC4F4qhJqZYyWbE=;
	b=JkiPH3SZ5d9eheWGjCB0WaLFkmvcbfla9DU2g/0icBUXDrbpKNMRoDaZLXnmhyX83j
	ReVzJtTQCkBc5FRSVPrnXVkDC+fsPql/XjjF1BUyu+Q+A4OhnfHTxPJVSqQZrIwJHEQE
	qKXKJddQiJ6zB7E5ytHdmRZBRxZhKqodOarNU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=uyEa2PiPaTkvvQIEafH5Pgd4gzwJW7e6I41QIn7pXFbjiN+hd+LfQ77YjU/dDpW8dh
	w52otNEg/UQZYkaHUdfRbrxyrEyxJOVNyH86bClD6bIgpxr1y7kMLZvwmNBQldAiN4Rl
	LZsDk9JIRtUspAQqX4fC4h1bsqEdsblXvdong=
Received: by 10.90.54.8 with SMTP id c8mr851896aga.112.1295820491955; Sun, 23
	Jan 2011 14:08:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sun, 23 Jan 2011 14:07:51 -0800 (PST)
In-Reply-To: <4D3C8312.2040405@mwester.net>
References: <4D3C8312.2040405@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jan 2011 14:07:51 -0800
Message-ID: <AANLkTikgG=OQY5Ng91OvZ8qeUz1JG=78bb08VzV5pu=T@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] add version 1.1.3 of cryptsetup
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
X-List-Received-Date: Sun, 23 Jan 2011 22:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 23, 2011 at 11:35 AM, Mike Westerhof <mike@mwester.net> wrote:
> Updates cryptsetup recipe to version 1.1.3, the most recent version that =
builds
> with the current version of automake in OE. =C2=A0Note that we need to ke=
ep the old
> 1.0.5 recipe, even though it is not fetchable any longer, because the lic=
ense
> has changed.
>
> Signed-off-by: Mike Westerhof <mike@mwester.net>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>
> diff --git a/recipes/cryptsetup/cryptsetup_1.1.3.bb b/recipes/cryptsetup/=
cryptsetup_1.1.3.bb
> new file mode 100644
> index 0000000..54fd96e
> --- /dev/null
> +++ b/recipes/cryptsetup/cryptsetup_1.1.3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Setup virtual encryption devices under dm-crypt Linux"
> +HOMEPAGE =3D "http://code.google.com/p/cryptsetup/"
> +SECTION =3D "console"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "util-linux-ng device-mapper libgcrypt popt"
> +RRECOMMENDS_${PN} =3D "kernel-module-aes \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
ernel-module-dm-crypt \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
ernel-module-md5 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
ernel-module-cbc \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
ernel-module-sha256 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar=
.bz2"
> +SRC_URI[md5sum] =3D "318a64470861ea5b92a52f2014f1e7c1"
> +SRC_URI[sha256sum] =3D "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e060=
2bf40208b5e69c0a"
> +
> +inherit autotools
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


