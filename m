Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Pb9CH-0008Nc-1T
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 11:05:25 +0100
Received: by qwi2 with SMTP id 2so1733206qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=D9A8Vf4f2CB1k15jaGI9ZFCoWwEdD2iM7f+hE6IC/x4=;
	b=bwjRBkwHYkFoftVFxuq8I47uQKNn62qblAgpvRjogG9/rmDZ7ciiQnBKvgQKmLt3nG
	RPnV32YcbHnPvKSls2giBFpww3HfIbLhxfQWYuv02mPu2/gl11azMsLq8MP7IwUPm/kF
	TgqH3nsNOq8KOB13kZbSZeGOeBO2E0BhTW7FQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UA+gosxErqT8aKKt5t3o+cymP2fv1fajGkiy9GKCTIhY5A5kiI7yTJH87ogJQq1yMV
	sifjOEahPh57S1DZeorXi8pKFxhr22GfG8o6xgW7G/jPUqLJgXdQ4mCDAcJ0K3OWRDug
	oN9wIXLYQHSgf2GecAbS4xqtoNrecAYmUcnFs=
MIME-Version: 1.0
Received: by 10.229.184.1 with SMTP id ci1mr2995837qcb.193.1294394695174; Fri,
	07 Jan 2011 02:04:55 -0800 (PST)
Received: by 10.229.227.16 with HTTP; Fri, 7 Jan 2011 02:04:55 -0800 (PST)
In-Reply-To: <1294393157-25680-1-git-send-email-raj.khem@gmail.com>
References: <1294393157-25680-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 11:04:55 +0100
Message-ID: <AANLkTi=a1GNU=DmsOWGUUxTfGLEdQwDNrK5PERB7+8m9@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] slugos: Dont install ldconfig
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
X-List-Received-Date: Fri, 07 Jan 2011 10:05:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 10:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0conf/distro/slugos.conf | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
> index 7fb6d1c..e2e7cc0 100644
> --- a/conf/distro/slugos.conf
> +++ b/conf/distro/slugos.conf
> @@ -15,7 +15,8 @@ IPKG_VARIANT ?=3D "opkg-nogpg-nocurl-slugos"
> =A0PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg-nocurl-slugos"
> =A0PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-nogpg-nocurl=
-slugos"
> =A0IMAGE_INITSCRIPTS ?=3D "initscripts-slugos"
> -
> +# Disable installing ldconfig
> +USE_LDCONFIG =3D "0"
> =A0require conf/distro/include/slugos.inc
> =A0require conf/distro/include/sane-toolchain.inc
> =A0require conf/distro/include/arm-thumb.inc
> --

Acked-by: Leon Woestenberg <leon@sidebranch.com>


--=20
Leon


