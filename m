Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.11820.1610469689426911047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=OC4bXqUQ;
 spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 22FCF600E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 16:41:27 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1610469686;
	bh=HoD3Ns77omO/FiSfsBpTJsFrY7JKjHhS+6H9Zawdkmw=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=OC4bXqUQ886IxFGS0vebzUWr0J7l2joc+zZL29JyLc24mHLY7HcrjDQ4nf3o2TBKU
	 fPjxbGd6sCrSTSmVSj6WgNx9t/BYhy48QCznmA1UIlw8YwILknR+P/GSuaVFD38Dzu
	 nYSErYwjwbuDuc7Bq7K2XlnJt42dDSRqKs0giokwRe8C8bfpgocUVJbxBVHYZDJfnE
	 ZGU+qXgDL+Pn8b2iPT2TrNxLVoFZQcJfuvyNZIypNHYoT21I+nE0+IBApAxqnQp7EM
	 OElUHl6SZ00CO/iYXA/gtVLuLyj755MgFUs3V3BmBbCGVPeK6J3heSuXH6uxFmWJso
	 PhtAxfcpHzCgg==
Subject: Re: [oe] Yocto recipe for scikit-learn
To: openembedded-devel@lists.openembedded.org
References: <Tx4I.1610465744315911278.fazH@lists.openembedded.org>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <042511c7-8ad2-fa6d-2f55-bee8eb7cba7a@embed.me.uk>
Date: Tue, 12 Jan 2021 16:41:17 +0000
MIME-Version: 1.0
In-Reply-To: <Tx4I.1610465744315911278.fazH@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable

On 12/01/2021 15:35, kodali13451@gmail.com wrote:
> I am trying to create a `yocto` `recipe` for `scikit-learn` package. It
> depends on `scipy` pacakge. I was able to successfully build the `scipy=
`
> package using :=C2=A0https://github.com/gpanders/meta-scipy
> <https://github.com/gpanders/meta-scipy>.=C2=A0
> =C2=A0
> When I run `bitbake python3-scikit-learn`, i am getting the below error=
:
> `ModuleNotFoundError: No module named 'scipy'`
> =C2=A0
> I am executing the commands in the below order.
> =C2=A0
> Once I have cloned/copied the `scipy` recipes and the patches listed in
> the `meta-scipy`, i am running `bitbake python3-scipy` and the build wa=
s
> successful.
> =C2=A0
> Then, I created a `recipe` file with the name
> `python3-scikit-learn_0.23.2.bb
> <http://python3-scikit-learn_0.23.2.bb/>` and the contents are as below=
.
> =C2=A0
> ```
> PYPI_PACKAGE =3D "scikit-learn"
> =C2=A0
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM=C2=A0 =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D40ee42dc5a49f1617c5c78=
f16c50e065"
> =C2=A0
> SRC_URI[sha256sum] =3D
> "20766f515e6cd6f954554387dfae705d93c7b544ec0e6c6a5d8e006f6f7ef480"
> =C2=A0
> inherit pypi setuptools3
> =C2=A0
> #DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> ${PYTHON_PN}-scipy ${PYTHON_PN}-joblib ${PYTHON_PN}"
> DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
> ${PYTHON_PN}-scipy ${PYTHON_PN}"
> =C2=A0
> RDEPENDS_${PN} +=3D "${PYTHON_PN}-numpy ${PYTHON_PN}-scipy"
> ```
> =C2=A0
> When I run the `bitbake python3-scikit-learn`, i am getting this
> `ModuleNotFoundError: No module named 'scipy'`
> =C2=A0
> Checked the path where the `devshell python3` is looking
> (`poky/build/tmp-glibc/work/aarch64-oe-linux/python3-scikit-learn/0.23.=
2-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages`),
> and i can only see the `numpy` package there, but `scipy` package is no=
t
> there.
> =C2=A0
> `ls` command output :
> ```easy_install.py
> =C2=A0numpy
> =C2=A0numpy-1.17.4-py3.8.egg-info
> =C2=A0pkg_resources
> =C2=A0__pycache__
> =C2=A0README.txt
> =C2=A0setuptools
> =C2=A0setuptools-45.2.0-py3.8.egg-info
> ```
> =C2=A0
> Can someone point me on how to include the `python3-scipy` package, so
> that it will be included/copied to the `devshell`. Or do I need to
> update/fix something else.=C2=A0
> =C2=A0
> Appreciate any guidance on this.=C2=A0
>=20

I'm also working on a scikit-learn recipe, you need to create a recipe
to provide python3-scipy-native as it uses this during the build
process. However, even with this recipe in place and scikit-learn
building, the resulting packages doesn't work due to inconsistencies in
the build, with the most obvious failure looking like a 64bit -> 32bit
compile error from using the native include headers in cython generated
files. I'm still looking into this but if anybody else has managed to
get this compiled properly I would also be interested in hearing about it=
.

Regards,
Jack.

--=20
Jack Mitchell, Consultant
https://www.tuxable.co.uk
