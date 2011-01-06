Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PaqgQ-0007Ni-5B
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 15:19:18 +0100
Received: by iyj18 with SMTP id 18so15627416iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Knio1w6bS3haBoJSzPTty4rqE5B1pPyy5zpWzKH2ATk=;
	b=Rpl5Jlbx1/9bF9Jmf/ePTUQQFksjOAQKoqEnxOb52excGKW+GxJrbZZKkYA9k2dbVV
	TTg/UM1qiPmsaHRKCSrK94+0HJNpNC7CJrm9sdpmHW5JXyRfBjHJXTsPJ92h425azyae
	oy65PmteIDzvR0ykNJNRnW2vRWxKsbhTsS1iQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nUsQ03/2s9NKP1Tm7uOfyaTzc4h6cR54zytFdACkhpIzEh4Wgqot5VFwpe1VcA/iov
	6kh074joULfKAhgiIMkpYDX9Qm7+vLbyHl0GAdYUCvGL+iibVVasewu2PXJBihVGT9J9
	dcmCFvfdZkl6vcHkpUOFqpLtQ/i+/Fp86RZmM=
MIME-Version: 1.0
Received: by 10.231.16.68 with SMTP id n4mr24336705iba.94.1294323531655; Thu,
	06 Jan 2011 06:18:51 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Thu, 6 Jan 2011 06:18:51 -0800 (PST)
In-Reply-To: <1294318110-23521-2-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-2-git-send-email-obi@opendreambox.org>
Date: Thu, 6 Jan 2011 15:18:51 +0100
Message-ID: <AANLkTingw=BJke5Y6fkXg_s9EL37_DcY0E3OLoJXhetX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 06 Jan 2011 14:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/6 Andreas Oberritter <obi@opendreambox.org>:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Martin Jansa <Martin.Jansa@gmail.com>
> ---

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


