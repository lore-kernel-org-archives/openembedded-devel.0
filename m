Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Oct 2017 13:24:16 UTC
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB6560766
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 13:24:16 +0000 (UTC)
X-AuditID: c0a80110-5f9ff70000000ec4-66-59f875fb00e1
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 3C.45.03780.BF578F95;
	Tue, 31 Oct 2017 14:09:16 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 14:09:08 +0100
Message-Id: <20171031130908.23451-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.14.3
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 31/10/2017 14:09:27,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 31/10/2017 14:09:31,
	Serialize complete at 31/10/2017 14:09:31,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 31.10.2017 14:09:16
X-TNEFEvaluated: 1
X-Disclaimed: 52739
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42I5sILRRvdP6Y9Ig8vPeCwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujJazfcwFKwQrXuxbx9jAuIu/i5GTQ0LARKLh9h3mLkYuDiGB
	TYwSb/fcZAFJ8AoISpyc+QTMZhOwlTgy4SuYLSKgK/Hxw1xGEJtZwFri/fIFrF2MHBzCQPal
	1zEgYRYBVYmf9zvYIcZ4SKw+PJMNolxbYtnC18wQe+Ul1r69xwiyV0Kgg1li2pklUAkhidOL
	z0LZwhLz3zxknMDINwvJSbOQzFrAyLSKUTw3MTPHSC+pSDextCQ/N7EkMz9PLzk/dxMjJHwE
	djDufqN9iFGAg1GJh/dFzI9IIdbEsuLK3EOMEhzMSiK87MDgE+JNSaysSi3Kjy8qzUktPsQo
	zcGiJM5rW/cyUkggPbEkNTs1tSC1CCbLxMEp1cDYamAp9mqdnMzjFxPnlURk8skzMBUXTGF9
	mH9MuulfMPPRuOuvkqYoJpw6ucl6XuWGVPNLOjFV8Zu/C36Xu2vj/D1PhWGerK2woP0LXoXr
	Mxm7jBbIT3KPNU0TzXh6yPfRyut62dczj4r+WfhPYv3dt+8vH/Pose+2aDle/jLl/4d/G3xE
	md4rsRRnJBpqMRcVJwIAwo8U7BsCAAA=
Subject: [meta-python][PATCH] python-pydbus: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 13:24:17 -0000
Content-Transfer-Encoding: quoted-printable

python-pydbus is a pythonic DBus library, which is one of the mentioned rep=
lacement of the
deprecated python-dbus library (https://www.freedesktop.org/wiki/Software/D=
BusBindings)

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 meta-python/recipes-devtools/python/python-pydbus.inc       | 11 +++++++++=
++
 meta-python/recipes-devtools/python/python-pydbus=5F0.6.0.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pydbus=5F0.6.0.bb |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pydbus.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pydbus=5F0.6=
.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus=5F0.=
6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pydbus.inc b/meta-p=
ython/recipes-devtools/python/python-pydbus.inc
new file mode 100644
index 000000000..0773b7ff8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pydbus.inc
@@ -0,0 +1,11 @@
+DESCRIPTION =3D "Pythonic DBus library"
+HOMEPAGE =3D "https://pypi.python.org/pypi/pydbus/"
+LICENSE =3D "LGPLv2.1"
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3Da916467b91076e631dd8edb7424=
769c7"
+
+SRC=5FURI[md5sum] =3D "c6abd44862322679bd4e907bebc3e0d0"
+SRC=5FURI[sha256sum] =3D "4207162eff54223822c185da06c1ba8a34137a9602f3da5a=
528eedf3f78d0f2c"
+
+S =3D "${WORKDIR}/pydbus-${PV}"
+
+RDEPENDS=5F${PN} =3D "${PYTHON=5FPN}-pygobject"
diff --git a/meta-python/recipes-devtools/python/python-pydbus=5F0.6.0.bb b=
/meta-python/recipes-devtools/python/python-pydbus=5F0.6.0.bb
new file mode 100644
index 000000000..1722a80cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pydbus=5F0.6.0.bb
@@ -0,0 +1,2 @@
+require python-pydbus.inc
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pydbus=5F0.6.0.bb =
b/meta-python/recipes-devtools/python/python3-pydbus=5F0.6.0.bb
new file mode 100644
index 000000000..7ed1c63b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus=5F0.6.0.bb
@@ -0,0 +1,2 @@
+require python-pydbus.inc
+inherit pypi setuptools3
--=20
2.14.3



