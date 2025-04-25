Return-Path: <fleuryhugo7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7687DC369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:14:00 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
To: openembedded-devel@lists.openembedded.org
From: "Hugo" <fleuryhugo7@gmail.com>
X-Originating-Location: =?UTF-8?B?TWV4aW1pZXV4LCBBdXZlcmduZS1SaMO0bmUtQWxwZXMsIEZS?= (88.176.79.23)
X-Originating-Platform: Mac Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 08:13:51 -0700
References: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com>
In-Reply-To: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com>
Message-ID: <6525.1745594031172178467@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YIQ7sGaEtgvpCv9S8Yl9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117129

--YIQ7sGaEtgvpCv9S8Yl9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Added tests and fixed the issue related to ${PYTHON_PN}.

Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
---
.../python/python3-uvicorn/run-ptest =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A06 +++
.../python/python3-uvicorn_0.34.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37=
 +++++++++++++++++++
2 files changed, 43 insertions(+)
create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn/run-=
ptest
create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.34=
.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest =
b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
new file mode 100644
index 0000000000..d75b4cd4c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# based on the gunicorn ptest
+echo "nameserver 8.8.8.8" >> /etc/resolv.conf
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb =
b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
new file mode 100644
index 0000000000..cd2691a5ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D "Lightning-fast ASGI server implementation."
+HOMEPAGE =3D "https://www.uvicorn.org/"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D5c778842f66a649636561c423c0e=
ec2e"
+
+SRC_URI[sha256sum] =3D "0e929828f6186353a80b58ea719861d2629d766293b6d19baf=
086ba31d4f3328"
+
+inherit pypi python_hatchling python_setuptools_build_meta ptest
+
+SRC_URI +=3D "file://run-ptest"
+
+RDEPENDS:${PN}-ptest +=3D " \
+ =C2=A0 =C2=A0python3-pytest \
+ =C2=A0 =C2=A0python3-httptools \
+ =C2=A0 =C2=A0python3-dotenv \
+ =C2=A0 =C2=A0python3-httpx \
+ =C2=A0 =C2=A0python3-pyyaml \
+ =C2=A0 =C2=A0python3-websockets \
+ =C2=A0 =C2=A0python3-a2wsgi \
+ =C2=A0 =C2=A0python3-pytest-mock \
+"
+
+do_install_ptest() {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+PYPI_PACKAGE =3D "uvicorn"
+
+RDEPENDS:${PN} +=3D " \
+ =C2=A0 =C2=A0python3-typing-extensions \
+ =C2=A0 =C2=A0python3-click \
+ =C2=A0 =C2=A0python3-h11 \
+ =C2=A0 =C2=A0python3-anyio \
+"
+
+S =3D "${WORKDIR}/uvicorn-${PV}"
--
2.43.0

--YIQ7sGaEtgvpCv9S8Yl9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Added tests and fixed the issue related to ${PYTHON_PN}.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Hugo FLEURY &lt;fleuryhugo7@gmail.com&gt;<br />---<br /=
>&nbsp;.../python/python3-uvicorn/run-ptest &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;| &nbsp;6 +++<br />&nbsp;.../python/python3-uvicorn_0.34.2.bb &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;| 37 +++++++++++++++++++<br />&nbsp;2 files changed=
, 43 insertions(+)<br />&nbsp;create mode 100644 meta-python/recipes-devtoo=
ls/python/python3-uvicorn/run-ptest<br />&nbsp;create mode 100644 meta-pyth=
on/recipes-devtools/python/python3-uvicorn_0.34.2.bb</div>
<div>diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/run-p=
test b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest<br />n=
ew file mode 100644<br />index 0000000000..d75b4cd4c9<br />--- /dev/null<br=
 />+++ b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest<br /=
>@@ -0,0 +1,6 @@<br />+#!/bin/sh<br />+<br />+# based on the gunicorn ptest=
<br />+echo "nameserver 8.8.8.8" &gt;&gt; /etc/resolv.conf<br />+<br />+pyt=
est<br />diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0=
.34.2.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb<br=
 />new file mode 100644<br />index 0000000000..cd2691a5ee<br />--- /dev/nul=
l<br />+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb<=
br />@@ -0,0 +1,37 @@<br />+SUMMARY =3D "Lightning-fast ASGI server impleme=
ntation."<br />+HOMEPAGE =3D "https://www.uvicorn.org/"<br />+LICENSE =3D "=
BSD-3-Clause"<br />+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D5c778842f=
66a649636561c423c0eec2e"<br />+<br />+SRC_URI[sha256sum] =3D "0e929828f6186=
353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328"<br />+<br />+inherit p=
ypi python_hatchling python_setuptools_build_meta ptest<br />+<br />+SRC_UR=
I +=3D "file://run-ptest"<br />+<br />+RDEPENDS:${PN}-ptest +=3D " \<br />+=
 &nbsp; &nbsp;python3-pytest \<br />+ &nbsp; &nbsp;python3-httptools \<br /=
>+ &nbsp; &nbsp;python3-dotenv \<br />+ &nbsp; &nbsp;python3-httpx \<br />+=
 &nbsp; &nbsp;python3-pyyaml \<br />+ &nbsp; &nbsp;python3-websockets \<br =
/>+ &nbsp; &nbsp;python3-a2wsgi \<br />+ &nbsp; &nbsp;python3-pytest-mock \=
<br />+"<br />+<br />+do_install_ptest() {<br />+ &nbsp; &nbsp; &nbsp; &nbs=
p;install -d ${D}${PTEST_PATH}/tests<br />+ &nbsp; &nbsp; &nbsp; &nbsp;cp -=
rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br />+}<br />+<br />+PYPI_PACKAGE =
=3D "uvicorn"<br />+<br />+RDEPENDS:${PN} +=3D " \<br />+ &nbsp; &nbsp;pyth=
on3-typing-extensions \<br />+ &nbsp; &nbsp;python3-click \<br />+ &nbsp; &=
nbsp;python3-h11 \<br />+ &nbsp; &nbsp;python3-anyio \<br />+"<br />+<br />=
+S =3D "${WORKDIR}/uvicorn-${PV}"<br />--<br />2.43.0</div>
</div>

--YIQ7sGaEtgvpCv9S8Yl9--

