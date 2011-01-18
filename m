Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfKbU-0007St-6r
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 00:04:44 +0100
Received: by gyh20 with SMTP id 20so54701gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 15:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=DQTOnWPbTl0lpUhFXMFxdMwQXEMiGfkVSfuu1MtdfYY=;
	b=qVTYxEpoMELZhiTXANrVdE1VIZqWobqjgx4TGwCauMJ2yKddcrGgSQ41WYhYIUCwvJ
	Q4J55Eg10GWrQ3qN0i1wpf5i9XnPZzIiDsnljaFD1OOFuo4bmVbkHp/oZA2djN6l5wMz
	I/n2Tbnmki65PSpMEJ6QSmW5OdFC5eizuF62c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tyOyGCGmmzgq8rbg23iLYidsQ2xfuULESC+NYrM9wLRMxmA1wVKf+5Ym3F7PwRodr9
	eW9taLWom/0I+/Vg0V3uRezs7gJNL5DK+z8TkBCwztBPrp00slU8gUgHm9a4/o1FLes/
	w2mOmcW7YoFp5NHPKMcQTasCTfA8Js4NIBDRk=
Received: by 10.90.1.2 with SMTP id 2mr9893aga.58.1295391843883; Tue, 18 Jan
	2011 15:04:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Tue, 18 Jan 2011 15:03:43 -0800 (PST)
In-Reply-To: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
References: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 15:03:43 -0800
Message-ID: <AANLkTikQfYB+ffj7Dp8n1OVNdtuZ0DHE0wGLKYoEh+=3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] gnutls: move to latest stable branch 2.10.2 -> 2.10.4
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
X-List-Received-Date: Tue, 18 Jan 2011 23:04:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 2:05 PM, Michael Smith <msmith@cbnco.com> wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../gettextize-with-gettext-0.18.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../gnutls-openssl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../gnutls-replace-siginterrupt.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../gnutls/{gnutls_2.10.2.bb =3D> gnutls_2.10.4.bb} =C2=A0| =C2=A0 =
=C2=A04 ++--
> =C2=A04 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gettextize=
-with-gettext-0.18.patch (100%)
> =C2=A0rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gnutls-ope=
nssl.patch (100%)
> =C2=A0rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gnutls-rep=
lace-siginterrupt.patch (100%)
> =C2=A0rename recipes/gnutls/{gnutls_2.10.2.bb =3D> gnutls_2.10.4.bb} (77%=
)
>
> diff --git a/recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.pa=
tch b/recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.pat=
ch
> rename to recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
> diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch b/recipes/=
gnutls/gnutls-2.10.4/gnutls-openssl.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch
> rename to recipes/gnutls/gnutls-2.10.4/gnutls-openssl.patch
> diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.pat=
ch b/recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.patc=
h
> rename to recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
> diff --git a/recipes/gnutls/gnutls_2.10.2.bb b/recipes/gnutls/gnutls_2.10=
.4.bb
> similarity index 77%
> rename from recipes/gnutls/gnutls_2.10.2.bb
> rename to recipes/gnutls/gnutls_2.10.4.bb
> index 8af70ec..3e582b0 100644
> --- a/recipes/gnutls/gnutls_2.10.2.bb
> +++ b/recipes/gnutls/gnutls_2.10.4.bb
> @@ -24,5 +24,5 @@ do_configure_prepend() {
>
> =C2=A0}
>
> -SRC_URI[gnutls.md5sum] =3D "777823f5746ab80cd6f7f7b5fcb2f91b"
> -SRC_URI[gnutls.sha256sum] =3D "e82e7a3fc69b02cc06c291a1652789d73e45bc073=
2e139817838248f814f8724"
> +SRC_URI[gnutls.md5sum] =3D "4e1517084018a8b1fdc96daabea40528"
> +SRC_URI[gnutls.sha256sum] =3D "b8bfe36450fe671e99db5ff1e44e6b65fda8a79ca=
cd9e77d550eff7da3745fc8"
> --
> 1.6.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


