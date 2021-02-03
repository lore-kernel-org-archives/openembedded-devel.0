Subject: Re: [meta-python][Question] python3-dlib recipe?
To: openembedded-devel@lists.openembedded.org
From: open.prac@gmail.com
X-Originating-Location: Tequisquiapan, Querétaro, MX (187.145.20.250)
X-Originating-Platform: Linux Firefox 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Feb 2021 22:21:36 -0800
References: <CAMKF1spyP0g5vCywDz+c1NvO7D7jue+rv0RK1w-6uqkj9Kp24g@mail.gmail.com>
In-Reply-To: <CAMKF1spyP0g5vCywDz+c1NvO7D7jue+rv0RK1w-6uqkj9Kp24g@mail.gmail.com>
Message-ID: <1795.1612333296320046906@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yXEhEgkJqBRcYfjLzVT7"

--yXEhEgkJqBRcYfjLzVT7
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hi @Khem, based on [this](https://stackoverflow.com/q/65822507/8033671) dis=
cussion i tried the following recipe and it worked just fine

```bitbake
SUMMARY =3D "A toolkit for making real world machine learning and data ana=
lysis applications"
HOMEPAGE =3D "https://pypi.python.org/pypi/dlib"
PYPI_PACKAGE =3D "dlib"
LICENSE =3D "Boost-Software"
SRC_URI[md5sum] =3D "1e7e357d7d54e86267ef60f606cb40e1"
LIC_FILES_CHKSUM =3D "file://dlib/LICENSE.txt;md5=3D2c7a3fa82e66676005cd4e=
e2608fd7d2 \
                    file://dlib/external/libpng/LICENSE;md5=3D243135ddedf7=
02158f9170807cbcfb66 \
                    file://dlib/external/pybind11/LICENSE;md5=3Dbeb87117af=
69fd10fbf9fb14c22a2e62 \
                    file://python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.tx=
t;md5=3D064f53ab40ea2b6a4bba1324149e4fde \
"
DEPENDS =3D "sqlite3 "

inherit pypi cmake setuptools3
INSANE_SKIP_${PN} =3D "already-stripped"                                  =
                                          

DISTUTILS_BUILD_ARGS_append =3D " \
      --set CMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
"


```
I'm not sure if there is a better way to do this and make a PATCH from it

--=20
- el prac

--yXEhEgkJqBRcYfjLzVT7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi @Khem, based on <a href=3D"https://stackoverflow.com/q/65822507/80336=
71" target=3D"_blank">this</a> discussion i tried the following recipe and =
it worked just fine</p>
<pre class=3D"prettyprint"><code class=3D"language-bitbake">SUMMARY =3D &#=
34;A toolkit for making real world machine learning and data analysis appli=
cations&#34;
HOMEPAGE =3D &#34;https://pypi.python.org/pypi/dlib&#34;
PYPI_PACKAGE =3D &#34;dlib&#34;
LICENSE =3D &#34;Boost-Software&#34;
SRC_URI[md5sum] =3D &#34;1e7e357d7d54e86267ef60f606cb40e1&#34;
LIC_FILES_CHKSUM =3D &#34;file://dlib/LICENSE.txt;md5=3D2c7a3fa82e66676005=
cd4ee2608fd7d2 \
                    file://dlib/external/libpng/LICENSE;md5=3D243135ddedf7=
02158f9170807cbcfb66 \
                    file://dlib/external/pybind11/LICENSE;md5=3Dbeb87117af=
69fd10fbf9fb14c22a2e62 \
                    file://python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.tx=
t;md5=3D064f53ab40ea2b6a4bba1324149e4fde \
&#34;
DEPENDS =3D &#34;sqlite3 &#34;

inherit pypi cmake setuptools3
INSANE_SKIP_${PN} =3D &#34;already-stripped&#34;                          =
                                                  

DISTUTILS_BUILD_ARGS_append =3D &#34; \
      --set CMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
&#34;


</code></pre>
<p>I'm not sure if there is a better way to do this and make a PATCH from =
it</p>

<p>--
- el prac</p>

--yXEhEgkJqBRcYfjLzVT7--
