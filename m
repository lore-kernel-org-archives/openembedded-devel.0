Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIVAr-00048E-Fz
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:42:54 +0100
Received: by gxk2 with SMTP id 2so840430gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=Y0AMCKOyMXs5hR3J83537bgtmDVI9kl+ruxv5CNZKa4=;
	b=x7Den0CZrdLgBP4CB/hRZ6sUOFJRXdjSB2INpLPwZA1KfBDd3c7rRU5zJpOJKopS0w
	sfAJOCRhhGhVF59yfuhD0s0uutQct5tmW/sBp0zQl5z8mVyAj1o6dHLgFF6k6aYFJefP
	05Zfz5uZ9wQTPsMzEoVwY84q8mpCQTCBfHdjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=dDNXYfQfNy3z5cjUQ+ucVR2/LswsBa3/ZG1obG7XPTXvwJCWX+BxXbUhX0KVCh0EYA
	HxKvu2qaAvWsXcIdaotahTLAG3ybckD8Mb90ClofJZW8b+U/cJhkdbBhbyKwywr7qIvQ
	ZjnPJoCvyGkFChZMmgzy66mEB9kBL4XuVg+zs=
Received: by 10.91.121.3 with SMTP id y3mr4365835agm.156.1289950906836; Tue,
	16 Nov 2010 15:41:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:41:26 -0800 (PST)
In-Reply-To: <1289064187-19968-1-git-send-email-moncelier@devlife.org>
References: <1289064187-19968-1-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:41:26 -0800
Message-ID: <AANLkTimMji3JAxmXg7fkQAwaov0cshj_AWU-yARgORAf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 07/11] zbar: Add support for Qt widgets and bump to 0.10
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
X-List-Received-Date: Tue, 16 Nov 2010 23:42:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:23 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> =C2=A0* Added support for qt widgets (not only gtk ones)
>
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0recipes/zbar/zbar_0.10.bb | =C2=A0 31 +++++++++++++++++++++++++++++=
++
> =C2=A01 files changed, 31 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/zbar/zbar_0.10.bb
>
> diff --git a/recipes/zbar/zbar_0.10.bb b/recipes/zbar/zbar_0.10.bb
> new file mode 100644
> index 0000000..844764d
> --- /dev/null
> +++ b/recipes/zbar/zbar_0.10.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "2D barcode scanner toolkit."
> +SECTION =3D "graphics"
> +LICENSE =3D "GPL"

can you be explicit about which version of GPL it is

> +DEPENDS =3D "intltool-native gtk+ qt4-x11-free libpng jpeg"
> +PR =3D "r1"

new recipes dont start with r1

> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " --without-imagemagick --without-python"
> +
> +do_configure_append() {
> + =C2=A0 =C2=A0# This one tries to autodetect MOC and fails, so we have t=
o force it
> + =C2=A0 =C2=A0sed -i "s#^MOC =3D.*#MOC =3D ${STAGING_BINDIR_NATIVE}/moc4=
#" Makefile
> +}
> +
> +PACKAGES +=3D "libzbar libzbargtk libzbarqt"
> +
> +FILES_${PN} =3D "${bindir}/zbar*"
> +FILES_${PN}-doc =3D "${datadir}/doc ${datadir}/man "
> +FILES_${PN}-dbg +=3D " ${bindir}/.debug"
> +FILES_libzbar =3D "${libdir}/libzbar.so.*"
> +FILES_libzbar-dev =3D "${libdir}/libzbar.so ${libdir}/libzbar.*a ${inclu=
dedir}/zbar* "
> +FILES_libzbargtk =3D "${libdir}/libzbargtk.so.*"
> +FILES_libzbargtk-dev =3D "${libdir}/libzbargtk.so ${libdir}/libzbargtk.*=
a"
> +FILES_libzbarqt =3D "${libdir}/libzbarqt.so.*"
> +FILES_libzbarqt-dev =3D "${libdir}/libzbarqt.so ${libdir}/libzbarqt.*a"
> +
> +SRC_URI[md5sum] =3D "0fd61eb590ac1bab62a77913c8b086a5"
> +SRC_URI[sha256sum] =3D "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bf=
e8e191318bdbadc6"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


