Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S6hzx-0004wm-Vw
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 13:35:42 +0100
Received: by vcbfl13 with SMTP id fl13so3317783vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=J3ks2AzD/w4PYLtYU31J20R3lGEjGXXse9aYAP3wrBg=;
	b=MDL4DYMW7YgYMflub4Yfq6ImeycxKDgMWKOjIEQ2JDyAuL1uXk+uSTpkyS60S4Vsay
	wOs4ZYzOuYWAUzX5AJIBtlQ5AlSeYT1iYsPXjIyceoJo5ka66o+8QATuO26w/vHvHUoh
	11kfWSJYY6vvQzaRtBEl2pOemtpNG3xOHNCN9Ireq/TTbdTWYd/8RnvWbSq/MLSOsapN
	DHhGvXFcrd6A2Md2zirmWM4gaRPkhfdENPhitbvuNzLWKuHE96fZJ8yUfC8UXXxBv1nV
	WlvaXPlc5KxyDKWbiSQx9v5js6bjW082tczg/i3uc7fyxSZfeZ3p0fMo9nquuXQ8A6RQ
	vctw==
MIME-Version: 1.0
Received: by 10.52.240.177 with SMTP id wb17mr12158603vdc.63.1331468819676;
	Sun, 11 Mar 2012 05:26:59 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Sun, 11 Mar 2012 05:26:59 -0700 (PDT)
In-Reply-To: <1331464418-6339-1-git-send-email-ajlennon@dynamicdevices.co.uk>
References: <1331464418-6339-1-git-send-email-ajlennon@dynamicdevices.co.uk>
Date: Sun, 11 Mar 2012 13:26:59 +0100
Message-ID: <CACW_hTaHRCEGf5YqdCAh549KVquJJ8H6YUKNK5084ObURdRLQA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Replaced libpng 1.2.47 recipe with 1.2.48 as source tarball no longer available from SRC_URI
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
X-List-Received-Date: Sun, 11 Mar 2012 12:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/11 Alex J Lennon <ajlennon@dynamicdevices.co.uk>:
> From: Alex J Lennon <ajlennon@gmail.com>
>
> Signed-off-by: Alex J Lennon <ajlennon@gmail.com>
> ---
> =A0recipes/libpng/libpng_1.2.47.bb | =A0 =A06 ------
> =A0recipes/libpng/libpng_1.2.48.bb | =A0 =A06 ++++++
> =A02 files changed, 6 insertions(+), 6 deletions(-)
> =A0delete mode 100644 recipes/libpng/libpng_1.2.47.bb
> =A0create mode 100644 recipes/libpng/libpng_1.2.48.bb
>
> diff --git a/recipes/libpng/libpng_1.2.47.bb b/recipes/libpng/libpng_1.2.=
47.bb
> deleted file mode 100644
> index 8d594f1..0000000
> --- a/recipes/libpng/libpng_1.2.47.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require libpng.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[libpng.md5sum] =3D "4389dab9fcd2f9d57ac14701b9115f59"
> -SRC_URI[libpng.sha256sum] =3D "f0bfa4a33b419a61cf97935cd6a15f5cbda84d116=
c72fa4b3489b0605a00a7a2"
> diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.=
48.bb
> new file mode 100644
> index 0000000..50a3c03
> --- /dev/null
> +++ b/recipes/libpng/libpng_1.2.48.bb
> @@ -0,0 +1,6 @@
> +require libpng.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[libpng.md5sum] =3D "7612af5660cd4b5e8c433ce53bea01a7"
> +SRC_URI[libpng.sha256sum] =3D "f6db51aff81b6920203678b29e8c68a5e3703cf5b=
39ae5e9e56370d17f31b1c4"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Pushed, thanks.

I have this one pending for the maintenance branch too, but had
connectiivty problems yesterday

will submit that later

Frans


