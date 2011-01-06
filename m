Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PaqrX-0007eM-BE
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:30:47 +0100
Received: by wwi17 with SMTP id 17so16499278wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 06:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=yJK5mM5ZoPzHw8/xeQ5YUJYCJuXUsgA7oBQdplsF7tI=;
	b=qw7FTmX4007T999RN6sb/TEpammZcUgnsjPLE4/1rfwkIYRNha7PItxxTh+2IhKedq
	2EzTnNHj2oWNIFvyJNheTiBYz1wfUlKlkQw2c/8tPbhEZjn7EVRYReL1GLzcFgQeWUtT
	PsiktYcvB/s6uM1FitmX4qcvTI5fHaxCb1ys8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=uudcuacsWTHorhX2KkS59mx0m+MZyR9QW0V16YTwMWBkfB5A/bQ/08dlnYuG/lD/Em
	+BckbCW9SnM0rs2BPny5gl0ym2zm2HS7vX8TV6tw1KKWchWtIThpAVssYox2tInr/89Y
	wMEeIt+SYsQXdp21qa750m9bDSDjvxcfG285Q=
MIME-Version: 1.0
Received: by 10.227.168.79 with SMTP id t15mr1208700wby.200.1294324222102;
	Thu, 06 Jan 2011 06:30:22 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Thu, 6 Jan 2011 06:30:22 -0800 (PST)
In-Reply-To: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
Date: Thu, 6 Jan 2011 15:30:22 +0100
Message-ID: <AANLkTin7pUoTKxpE1Fm9kaUqnFNXMtoqt2ZyG8q2keoc@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] python-wifi: add recipe for version 0.5.0
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
X-List-Received-Date: Thu, 06 Jan 2011 14:30:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 6, 2011 at 1:48 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> * package previously unpackaged files into -doc and -examples
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Martin Jansa <Martin.Jansa@gmail.com>

Ackey-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/python/python-wifi_0.5.0.bb | =A0 25 +++++++++++++++++++++++++
> =A01 files changed, 25 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/python/python-wifi_0.5.0.bb
>
> diff --git a/recipes/python/python-wifi_0.5.0.bb b/recipes/python/python-=
wifi_0.5.0.bb
> new file mode 100644
> index 0000000..faa3b43
> --- /dev/null
> +++ b/recipes/python/python-wifi_0.5.0.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Provides access to Linux Wireless Extensions"
> +HOMEPAGE =3D "http://pythonwifi.wikispot.org/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "LGPLv2+"
> +LICENSE_${PN}-examples =3D "GPLv2+"
> +RDEPENDS_${PN} =3D "python-ctypes python-datetime"
> +
> +SRC_URI =3D "http://download.berlios.de/pythonwifi/${P}.tar.bz2"
> +SRC_URI[md5sum] =3D "8fe7fd0a4edce1f9bedaff4acb7fd500"
> +SRC_URI[sha256sum] =3D "3e3f645d37ab20450f60c785cec5f21b330f28a6c46c7c1b=
0898305dd7a34b26"
> +
> +inherit setuptools
> +
> +do_install_append() {
> + =A0 =A0 =A0 =A0install -d ${D}${docdir}/${PN}
> + =A0 =A0 =A0 =A0mv ${D}${datadir}/README ${D}${docdir}/${PN}
> + =A0 =A0 =A0 =A0mv ${D}${datadir}/INSTALL ${D}${docdir}/${PN}
> + =A0 =A0 =A0 =A0mv ${D}${datadir}/docs/* ${D}${docdir}/${PN}
> + =A0 =A0 =A0 =A0install -d ${D}${sbindir}
> + =A0 =A0 =A0 =A0mv ${D}${datadir}/examples/* ${D}${sbindir}
> +}
> +
> +PACKAGES =3D+ "${PN}-examples"
> +
> +FILES_${PN}-examples =3D "${sbindir}"
> --
> 1.7.2.3
>
>


