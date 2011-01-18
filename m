Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfKcT-0007UJ-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 00:05:45 +0100
Received: by ywi6 with SMTP id 6so54719ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 15:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=wPW5Za/+fnApFb4FZAL4L8JZVIoiFT4m0RwV+q/vBe0=;
	b=OJMGlEFet1QKjP3XqfoqDQBPeDxvAj9+kQBV9rzDi+6h6m/VxM1m1XwpFcsQfCiUEm
	BPrVAZA3G2ZmulW/vaVf3ZmrF0o/NM/PwDmPNW0b2D8Yba1xSdIZNdmMaLtHoJUfFKkx
	IHgjG8/cprCbSx4ciyN1vb+jqkyZLkpEbVOTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ezktx9UEjGL5Qiumr0N5WFzGLOz8ah1SR0xh+SxaIJmOFc9QGNhgqus5AI+N8N6x4r
	jAm+W4u9XOw0HnQamlCltdaxi1NRF4tRKC/NdsUn7Dy5cYawcRydhO970F40uZg7Ne8w
	yyqNJJ7XLz2i+q55H2XiQAftjUAjHvEee0eR8=
Received: by 10.90.104.20 with SMTP id b20mr6904448agc.193.1295391905881; Tue,
	18 Jan 2011 15:05:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Tue, 18 Jan 2011 15:04:44 -0800 (PST)
In-Reply-To: <1295388343-2058-2-git-send-email-msmith@cbnco.com>
References: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
	<1295388343-2058-2-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 15:04:44 -0800
Message-ID: <AANLkTi=hg7BMgGrYaJU81eCEixuQ87YiZ9u6ySKe+oWt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: update 2.29.91 to 2.32.2
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
X-List-Received-Date: Tue, 18 Jan 2011 23:05:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 2:05 PM, Michael Smith <msmith@cbnco.com> wrote:
> The new release fixes several issues and is API/ABI compatible.
> (at least, webkit-gtk still builds and runs.)
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Koen Kooi <koen@openembedded.org>

Looks ok. Make sure its not pinned somewhere then RFC those parts too

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0...isable-TLS-1.2-in-addition-to-1.0-and-1.1.patch | =C2=A0 29 ----=
----------------
> =C2=A0...ibsoup-2.4_2.29.91.bb =3D> libsoup-2.4_2.32.2.bb} | =C2=A0 =C2=
=A08 +----
> =C2=A02 files changed, 2 insertions(+), 35 deletions(-)
> =C2=A0delete mode 100644 recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-add=
ition-to-1.0-and-1.1.patch
> =C2=A0rename recipes/gnome/{libsoup-2.4_2.29.91.bb =3D> libsoup-2.4_2.32.=
2.bb} (68%)
>
> diff --git a/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0=
-and-1.1.patch b/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1=
.0-and-1.1.patch
> deleted file mode 100644
> index 1a03581..0000000
> --- a/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0-and-1.=
1.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 01a43ad9824fba77384534c6d588e0e0d653986e Mon Sep 17 00:00:00 2001
> -From: Dan Winship <danw@gnome.org>
> -Date: Tue, 29 Jun 2010 13:43:20 +0000
> -Subject: Disable TLS 1.2 in addition to 1.0 and 1.1
> -
> -Due to bug 581342 we want to only negotiate SSL 3.0. Previously we
> -were telling gnutls to not do TLS1.0 or TLS1.1, but that means with
> -newer versions of gnutls that support TLS1.2 it would try to negotiate
> -that instead and generally fail. Fix that by disabling TLS1.2 too
> -(which works fine even with gnutls versions that don't support TLS1.2
> -yet).
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=3D622857
> ----
> -diff --git a/libsoup/soup-gnutls.c b/libsoup/soup-gnutls.c
> -index cb0fbe5..0b57f28 100644
> ---- a/libsoup/soup-gnutls.c
> -+++ b/libsoup/soup-gnutls.c
> -@@ -477,7 +477,7 @@ soup_ssl_wrap_iochannel (GIOChannel *sock, gboolean =
non_blocking,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto THROW_CREATE_ERRO=
R;
> -
> - =C2=A0 =C2=A0 =C2=A0 /* See http://bugzilla.gnome.org/show_bug.cgi?id=
=3D581342 */
> -- =C2=A0 =C2=A0 =C2=A0if (gnutls_priority_set_direct (session, "NORMAL:!=
VERS-TLS1.1:!VERS-TLS1.0", NULL) !=3D 0)
> -+ =C2=A0 =C2=A0 =C2=A0if (gnutls_priority_set_direct (session, "NORMAL:!=
VERS-TLS1.2:!VERS-TLS1.1:!VERS-TLS1.0", NULL) !=3D 0)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto THROW_CREATE_ERRO=
R;
> -
> - =C2=A0 =C2=A0 =C2=A0 if (gnutls_credentials_set (session, GNUTLS_CRD_CE=
RTIFICATE,
> ---
> -cgit v0.8.3.1
> diff --git a/recipes/gnome/libsoup-2.4_2.29.91.bb b/recipes/gnome/libsoup=
-2.4_2.32.2.bb
> similarity index 68%
> rename from recipes/gnome/libsoup-2.4_2.29.91.bb
> rename to recipes/gnome/libsoup-2.4_2.32.2.bb
> index aec60fa..5bc793c 100644
> --- a/recipes/gnome/libsoup-2.4_2.29.91.bb
> +++ b/recipes/gnome/libsoup-2.4_2.32.2.bb
> @@ -3,15 +3,11 @@ SECTION =3D "x11/gnome/libs"
> =C2=A0LICENSE =3D "GPL"
> =C2=A0DEPENDS =3D "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring=
"
>
> -PR =3D "r2"
> -
> =C2=A0inherit gnome
>
> =C2=A0SRC_URI =3D "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libs=
oup-${PV}.tar.bz2;name=3Dlibsoup"
> -SRC_URI[libsoup.md5sum] =3D "900390c0ead254fbb23f3f0b84fd18bb"
> -SRC_URI[libsoup.sha256sum] =3D "626c88f6b87463cb092733d2bcd5672ca69529a7=
66cc6c5cc817f34b49c821b1"
> -
> -SRC_URI +=3D "file://Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch"
> +SRC_URI[libsoup.md5sum] =3D "03f37350a2a31046ebabb8470e75abcc"
> +SRC_URI[libsoup.sha256sum] =3D "96e6973c8b7459523c0f44e7aec69528ff2fbd38=
8e8ddc415f91bcc42f50777f"
>
> =C2=A0S =3D "${WORKDIR}/libsoup-${PV}"
>
> --
> 1.6.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


