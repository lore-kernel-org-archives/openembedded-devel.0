Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpSIW-0003WA-0y
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:19:00 +0100
Received: by fxm17 with SMTP id 17so620907fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=9Z6ojMVP3c68DoKct+rYMFGRvFnwx5P4VI8ZIHHMhis=;
	b=eUwRqCIT9lfOyYvhus96sYjIEeV+MpeNm1YT/gEecGl1o8M76LM4KSV10eey8lGsWJ
	S37L70ObZ7wpxvWLDV9Sz4L6U929NHqPDFc5552+MeVqE46nFEaPGQtrc2HpcXdxvoJk
	H+XZYdqEP/qXmwf+0WusKO1QYNS3vP60aYeFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Vq3/wHuiMU1X47cvKXTyp3jyHz4bcWrJHaijLtt9RAGwKtqGrGIIYrEa68QFH8k0x1
	c07HsjjG4tVt4kYxtjC5a3Uzy/VdFCLv9ucm1dQQN5B+Nr/vKzKwWui4bOLNB0tNItNw
	eRJg8gSLyd5PxVXC+37v3BNt75wzmW4Ymfm4s=
Received: by 10.223.79.74 with SMTP id o10mr1116896fak.63.1297804668471; Tue,
	15 Feb 2011 13:17:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Tue, 15 Feb 2011 13:17:25 -0800 (PST)
In-Reply-To: <1297803782-8395-3-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
	<1297803782-8395-3-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2011 13:17:25 -0800
Message-ID: <AANLkTinEtCdGgO1m=MzzfFvCgdNSwoO7biLRkLtHKgc6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/4] libsoup-2.4: add 2.33.6 version needed for newer webkit-efl
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
X-List-Received-Date: Tue, 15 Feb 2011 21:19:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 1:03 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Can you also fix license field while at it

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/gnome/libsoup-2.4_2.33.6.bb | =C2=A0 18 ++++++++++++++++++
> =C2=A01 files changed, 18 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/gnome/libsoup-2.4_2.33.6.bb
>
> diff --git a/recipes/gnome/libsoup-2.4_2.33.6.bb b/recipes/gnome/libsoup-=
2.4_2.33.6.bb
> new file mode 100644
> index 0000000..e2dcb36
> --- /dev/null
> +++ b/recipes/gnome/libsoup-2.4_2.33.6.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "An HTTP library implementation in C"
> +SECTION =3D "x11/gnome/libs"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring"
> +
> +inherit gnome
> +
> +SRC_URI =3D "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-$=
{PV}.tar.bz2;name=3Dlibsoup"
> +SRC_URI[libsoup.md5sum] =3D "3a7219057d289dd7dcdd67681d27eebe"
> +SRC_URI[libsoup.sha256sum] =3D "988f7897fe125a77a5946b2fd6d47d7374fd94a1=
406e810482cfff6a52a6a923"
> +
> +S =3D "${WORKDIR}/libsoup-${PV}"
> +
> +PACKAGES =3D+ "libsoup-gnome"
> +FILES_libsoup-gnome =3D "${libdir}/libsoup-gnome*.so.*"
> +FILES_${PN} =3D "${libdir}/libsoup-2*.so.*"
> +FILES_${PN}-dev =3D "${includedir}/ ${libdir}/"
> +FILES_${PN}-doc =3D "${datadir}/"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


