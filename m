Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Paqh3-0007OP-Jy
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:19:57 +0100
Received: by iwn8 with SMTP id 8so16713302iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fDgi9ugDqnJ3pn6x+fDMpASm49FH3M9XEHzjn66ZD8c=;
	b=OVywbdhx+OGPUb37L/k7dKoejnbL/8+i89H90Kk4eHMWQodJJ+HHH1jOPAKNyCCFx5
	dDWs2Nm+YoAkxEpJ7VawCSKy7ObP86jwcB5m6vOX6E+MMWa9weXRgKWuAXw5r7I7w6ue
	2FoftP8eAxE3utfxybv8SMcXHIkbY/RfuKnfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JqJtj13ki40U3jLpSahf4nv3JgTPDX0FTD77pPaHV/tqvDo4wJ797shyESw5AS7ork
	hiJ2H0kVEqd/XtC2/+ju7U0kpmRWzam94gG5sUvhnI6A8H62ISMqp6Uh3679d6lPU1ZV
	lvVuHfDGYL70hWVJLqzjbTKx1wDfFfAg/GIxo=
MIME-Version: 1.0
Received: by 10.231.10.76 with SMTP id o12mr8492618ibo.144.1294323572922; Thu,
	06 Jan 2011 06:19:32 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Thu, 6 Jan 2011 06:19:32 -0800 (PST)
In-Reply-To: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
Date: Thu, 6 Jan 2011 15:19:32 +0100
Message-ID: <AANLkTikv2TJZkimdaUb+Qw-SQKphm9Y-V2WzBKhHTuEa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 06 Jan 2011 14:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/6 Andreas Oberritter <obi@opendreambox.org>:
> * package previously unpackaged files into -doc and -examples
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Martin Jansa <Martin.Jansa@gmail.com>


Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


