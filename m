Return-Path: <fleuryhugo7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59476C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:17:10 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
To: openembedded-devel@lists.openembedded.org
From: "Hugo" <fleuryhugo7@gmail.com>
X-Originating-Location: =?UTF-8?B?TWV4aW1pZXV4LCBBdXZlcmduZS1SaMO0bmUtQWxwZXMsIEZS?= (88.176.79.23)
X-Originating-Platform: Mac Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 08:17:08 -0700
References: <20250423143607.453363-1-fleuryhugo7@gmail.com>
In-Reply-To: <20250423143607.453363-1-fleuryhugo7@gmail.com>
Message-ID: <21889.1745594228213105117@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NOxPKLx4Y8DsVkdvacYe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 15:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117130

--NOxPKLx4Y8DsVkdvacYe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This revision of the patch fix the '${PYTHON_PN}' issue to 'python3'.

Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
---
.../python/python3-fastapi_0.115.12.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++=
+++++++++++++++
1 file changed, 23 insertions(+)
create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.11=
5.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.b=
b b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb
new file mode 100644
index 0000000000..6c80beb7c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "FastAPI - high performance API framework"
+HOMEPAGE =3D "https://fastapi.tiangolo.com/"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95792ff3fe8e11aa49ceb247e66e481=
0"
+
+SRC_URI[sha256sum] =3D "1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95=
b5fd68c2602681"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS +=3D " \
+ =C2=A0 =C2=A0python3-pdm-native \
+ =C2=A0 =C2=A0python3-pdm-backend-native \
+"
+
+RDEPENDS:${PN} +=3D " \
+ =C2=A0 =C2=A0python3-pydantic \
+ =C2=A0 =C2=A0python3-pydantic-core \
+ =C2=A0 =C2=A0python3-starlette \
+ =C2=A0 =C2=A0python3-typing-extensions \
+"
+
+PYPI_PACKAGE =3D "fastapi"
--
2.43.0

--NOxPKLx4Y8DsVkdvacYe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>This revision of the patch fix the '${PYTHON_PN}' issue to 'python3'.<=
/div>
<div>&nbsp;</div>
<div>Signed-off-by: Hugo FLEURY &lt;fleuryhugo7@gmail.com&gt;<br />---<br /=
>&nbsp;.../python/python3-fastapi_0.115.12.bb &nbsp; &nbsp; &nbsp; &nbsp;| =
23 +++++++++++++++++++<br />&nbsp;1 file changed, 23 insertions(+)<br />&nb=
sp;create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0=
.115.12.bb</div>
<div>diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.115=
.12.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb<br=
 />new file mode 100644<br />index 0000000000..6c80beb7c3<br />--- /dev/nul=
l<br />+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.b=
b<br />@@ -0,0 +1,23 @@<br />+SUMMARY =3D "FastAPI - high performance API f=
ramework"<br />+HOMEPAGE =3D "https://fastapi.tiangolo.com/"<br />+LICENSE =
=3D "MIT"<br />+<br />+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95792ff3f=
e8e11aa49ceb247e66e4810"<br />+<br />+SRC_URI[sha256sum] =3D "1e2c2a2646905=
f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681"<br />+<br />+inherit p=
ypi python_setuptools_build_meta<br />+<br />+DEPENDS +=3D " \<br />+ &nbsp=
; &nbsp;python3-pdm-native \<br />+ &nbsp; &nbsp;python3-pdm-backend-native=
 \<br />+"<br />+<br />+RDEPENDS:${PN} +=3D " \<br />+ &nbsp; &nbsp;python3=
-pydantic \<br />+ &nbsp; &nbsp;python3-pydantic-core \<br />+ &nbsp; &nbsp=
;python3-starlette \<br />+ &nbsp; &nbsp;python3-typing-extensions \<br />+=
"<br />+<br />+PYPI_PACKAGE =3D "fastapi"<br />--<br />2.43.0</div>
</div>

--NOxPKLx4Y8DsVkdvacYe--

