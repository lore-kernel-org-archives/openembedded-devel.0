Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PaqrD-0007dv-H6
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:30:27 +0100
Received: by wyb40 with SMTP id 40so16853034wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=xAm/dKcDnKilmE77mrS0Z4TRWboS5kfK+FVDUzKK0DE=;
	b=eLcrlN6RzZ3Qx7Cy+WvH79gRI/+8fAOD0fZWeuJGNVHdxHWnUaiA0jVlnAREoBCKw5
	OKrrylA1pSHvPkvCMX0bBukFKf+352/FxOv1fBZ333bpWyxK5Xf3D6DOMG+4UlWpVgxa
	FlYjiMEGeSOKHY6IjWuMhU3ETNrf4RmLQYjVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=N5eVZlaEqtSzmLaMrdGuX4BublmAeuRyqNzPJRip1ZQqYgJVe3J6A7NDFJl/zAyEh3
	+0+Y2Wb/kNPi0rBGZqgoDyUMdho3briiDwJOeXaTXdUw/JmqJT3H4cz7s4ZaqDNZZ7jt
	o/WZhgTB9sEU/5LHRQ5lcjBuR5ai4k1U6D7lk=
MIME-Version: 1.0
Received: by 10.227.147.129 with SMTP id l1mr14326420wbv.26.1294324202478;
	Thu, 06 Jan 2011 06:30:02 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Thu, 6 Jan 2011 06:30:02 -0800 (PST)
In-Reply-To: <1294318110-23521-2-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-2-git-send-email-obi@opendreambox.org>
Date: Thu, 6 Jan 2011 15:30:02 +0100
Message-ID: <AANLkTinPP7MUN-x5J+6Vns-rrky44rzcdPQfAGScHyq8@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] python-wifi: remove version 0.3.1
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
X-List-Received-Date: Thu, 06 Jan 2011 14:30:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 6, 2011 at 1:48 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Martin Jansa <Martin.Jansa@gmail.com>

Ackey-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/python/python-wifi_0.3.1.bb | =A0 21 ---------------------
> =A01 files changed, 0 insertions(+), 21 deletions(-)
> =A0delete mode 100644 recipes/python/python-wifi_0.3.1.bb
>
> diff --git a/recipes/python/python-wifi_0.3.1.bb b/recipes/python/python-=
wifi_0.3.1.bb
> deleted file mode 100644
> index fefffe6..0000000
> --- a/recipes/python/python-wifi_0.3.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION =3D "Fusil is a Python library used to write fuzzing program=
s."
> -HOMEPAGE =3D "http://fusil.hachoir.org/"
> -SECTION =3D "devel/python"
> -LICENSE =3D "GPLv2"
> -SRCNAME =3D "python-wifi"
> -
> -SRC_URI =3D "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz"
> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} =3D "\
> - =A0python-ctypes \
> - =A0python-datetime \
> -"
> -
> -
> -
> -
> -SRC_URI[md5sum] =3D "0458e32f82900e03c9fd155442242638"
> -SRC_URI[sha256sum] =3D "a7087ac16ce2d1f146dd76cbfc442ae5b91774f4b8c8eba9=
13c09d0c325eb12f"
> --
> 1.7.2.3
>
>


