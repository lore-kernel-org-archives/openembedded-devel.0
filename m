Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q61hG-0006oP-UV
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:21:04 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 4F2781D360AA;
	Sat,  2 Apr 2011 16:18:59 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 16:18:45 +0200
Message-Id: <1301753930-32581-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1301753930-32581-1-git-send-email-ynezz@true.cz>
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH 1/6] zeromq: add new recipe for version 2.1.1
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
X-List-Received-Date: Sat, 02 Apr 2011 14:21:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tested-by: Craig Swank <craigswank@gmail.com>
Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/zeromq/zeromq_2.1.1.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zeromq/zeromq_2.1.1.bb

diff --git a/recipes/zeromq/zeromq_2.1.1.bb b/recipes/zeromq/zeromq_2.1.1=
.bb
new file mode 100644
index 0000000..a73ceda
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "ZeroMQ looks like an embeddable networking library but =
acts like a concurrency framework"
+HOMEPAGE =3D "http://www.zeromq.org"
+LICENSE =3D "LGPLv3"
+
+PR =3D "r0"
+
+DEPENDS +=3D "util-linux-ng"
+
+S =3D "${WORKDIR}/zeromq-${PV}"
+
+SRC_URI =3D "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+
+inherit autotools
+
+do_configure_prepend() {
+	./autogen.sh
+}
+
+SRC_URI[md5sum] =3D "987079513e4816979e4e3bd52ac4b0a7"
+SRC_URI[sha256sum] =3D "963844dcc2bd7b3c9104343d17c2b21125864edb9d953ae2=
b9ee844ea07b39ce"
--=20
1.7.1



