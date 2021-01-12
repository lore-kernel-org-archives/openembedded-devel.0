Subject: Yocto recipe for scikit-learn
To: openembedded-devel@lists.openembedded.org
From: kodali13451@gmail.com
X-Originating-Location: Frisco, Texas, US (107.204.20.30)
X-Originating-Platform: Mac Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 12 Jan 2021 07:35:44 -0800
Message-ID: <Tx4I.1610465744315911278.fazH@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qYw8Lj3ogIkBwieKnuic"

--qYw8Lj3ogIkBwieKnuic
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to create a `yocto` `recipe` for `scikit-learn` package. It dep=
ends on `scipy` pacakge. I was able to successfully build the `scipy` packa=
ge using : https://github.com/gpanders/ meta-scipy ( https://github.com/gpa=
nders/meta-scipy ).

When I run `bitbake python3-scikit-learn`, i am getting the below error:
`ModuleNotFoundError: No module named 'scipy'`

I am executing the commands in the below order.

Once I have cloned/copied the `scipy` recipes and the patches listed in th=
e `meta-scipy`, i am running `bitbake python3-scipy` and the build was succ=
essful.

Then, I created a `recipe` file with the name ` python3-scikit-learn_0.23.=
2. bb ( http://python3-scikit-learn_0.23.2.bb/ ) ` and the contents are as =
below.

```
PYPI_PACKAGE =3D "scikit-learn"

LICENSE =3D "BSD"
LIC_FILES_CHKSUM=C2=A0 =3D "file://PKG-INFO;beginline=3D8; endline=3D8;md5=
=
=3D 40ee42dc5a49f1617c5c78f16c50e0 65"

SRC_URI[sha256sum] =3D " 20766f515e6cd6f954554387dfae70 5d93c7b544ec0e6c6a=
5d8e006f6f7e f480"

inherit pypi setuptools3

#DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy ${PYTHON_PN}-sc=
ipy ${PYTHON_PN}-joblib ${PYTHON_PN}"
DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy ${PYTHON_PN}-sci=
py ${PYTHON_PN}"

RDEPENDS_${PN} +=3D "${PYTHON_PN}-numpy ${PYTHON_PN}-scipy"
```

When I run the `bitbake python3-scikit-learn`, i am getting this `ModuleNo=
tFoundError: No module named 'scipy'`

Checked the path where the `devshell python3` is looking (`poky/build/tmp-=
glibc/work/ aarch64-oe-linux/python3- scikit-learn/0.23.2-r0/recipe- sysroo=
t-native/usr/lib/ python3.8/site-packages`), and i can only see the `numpy`=
 package there, but `scipy` package is not there.

`ls` command output :
```easy_install.py
numpy
numpy-1.17.4-py3.8.egg-info
pkg_resources
__pycache__
README.txt
setuptools
setuptools-45.2.0-py3.8.egg- info
```

Can someone point me on how to include the `python3-scipy` package, so tha=
t it will be included/copied to the `devshell`. Or do I need to update/fix =
something else.

Appreciate any guidance on this.

--qYw8Lj3ogIkBwieKnuic
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small;">I am trying to create a `yocto` `recipe` for `scikit-learn=
` package. It depends on `scipy` pacakge. I was able to successfully build =
the `scipy` package using :&nbsp;<a style=3D"color: #1155cc;" href=3D"https=
://github.com/gpanders/meta-scipy" target=3D"_blank" rel=3D"noopener" data-=
saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://github.com/gpande=
rs/meta-scipy&amp;source=3Dgmail&amp;ust=3D1610551142577000&amp;usg=3DAFQjC=
NHKaSwj1oD2fdhVv8GnG8JiUwRWhQ">https://github.com/gpanders/<wbr />meta-scip=
y</a>.&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">When I run `bitbake python3-scikit-learn`, i am getting t=
he below error:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">`ModuleNotFoundError: No module named 'scipy'`</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">I am executing the commands in the below order.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Once I have cloned/copied the `scipy` recipes and the pat=
ches listed in the `meta-scipy`, i am running `bitbake python3-scipy` and t=
he build was successful.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Then, I created a `recipe` file with the name `<a style=
=3D"color: #1155cc;" href=3D"http://python3-scikit-learn_0.23.2.bb/" targe=
t=3D"_blank" rel=3D"noopener" data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttp://python3-scikit-learn_0.23.2.bb&amp;source=3Dgmail&amp;ust=
=3D1610551142577000&amp;usg=3DAFQjCNHWVfrXLjZKc-SDH8NQrDU2a4pI2g">python3-=
scikit-learn_0.23.2.<wbr />bb</a>` and the contents are as below.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">```</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">PYPI_PACKAGE =3D "scikit-learn"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">LICENSE =3D "BSD"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">LIC_FILES_CHKSUM&nbsp; =3D "file://PKG-INFO;beginline=3D8=
;<wbr />endline=3D8;md5=3D<wbr />40ee42dc5a49f1617c5c78f16c50e0<wbr />65"</=
div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">SRC_URI[sha256sum] =3D "<wbr />20766f515e6cd6f954554387df=
ae70<wbr />5d93c7b544ec0e6c6a5d8e006f6f7e<wbr />f480"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">inherit pypi setuptools3</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">#DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-nump=
y ${PYTHON_PN}-scipy ${PYTHON_PN}-joblib ${PYTHON_PN}"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">DEPENDS =3D "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy=
 ${PYTHON_PN}-scipy ${PYTHON_PN}"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">RDEPENDS_${PN} +=3D "${PYTHON_PN}-numpy ${PYTHON_PN}-scip=
y"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">```</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">When I run the `bitbake python3-scikit-learn`, i am getti=
ng this `ModuleNotFoundError: No module named 'scipy'`</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Checked the path where the `devshell python3` is looking =
(`poky/build/tmp-glibc/work/<wbr />aarch64-oe-linux/python3-<wbr />scikit-l=
earn/0.23.2-r0/recipe-<wbr />sysroot-native/usr/lib/<wbr />python3.8/site-p=
ackages`), and i can only see the `numpy` package there, but `scipy` packag=
e is not there.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">`ls` command output :</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">```easy_install.py</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;numpy</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;numpy-1.17.4-py3.8.egg-info</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;pkg_resources</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;__pycache__</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;README.txt</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;setuptools</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;setuptools-45.2.0-py3.8.egg-<wbr />info</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">```</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Can someone point me on how to include the `python3-scipy=
` package, so that it will be included/copied to the `devshell`. Or do I ne=
ed to update/fix something else.&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Appreciate any guidance on this.&nbsp;</div>

--qYw8Lj3ogIkBwieKnuic--
