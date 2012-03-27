Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SCVJo-0004qn-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 14:16:08 +0200
Received: by localhost (Postfix, from userid 1000)
	id 494574439E3; Tue, 27 Mar 2012 14:07:08 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:07:03 +0200
Message-Id: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1332849864.git.sledz@dresearch-fe.de>
References: <cover.1332849864.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
Subject: [2011.03-maintenance 1/3] python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`
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
X-List-Received-Date: Tue, 27 Mar 2012 12:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Paul Menzel <paulepanter@users.sourceforge.net>

A clean build fails with the following error [1].

| ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc1=
6/tmp/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.=
26596 for further information)
| + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons=
-native-1.3.0-r1/scons-1.3.0
| + do_compile
| + distutils_do_compile
| + STAGING_INCDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-=
linux/usr/include
| + STAGING_LIBDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-=
linux/usr/lib
| + BUILD_SYS=3Dx86_64-linux
| + HOST_SYS=3Dx86_64-linux
| + /home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-linux/usr/bin/pyt=
hon setup.py build
| /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-nati=
ve-1.3.0-r1/temp/run.do_compile.26596: line 94: /home/sgh/oe-new-oe/build=
-vmc16/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or director=
y
| + oefatal 'python setup.py build_ext execution failed.'
| + echo FATAL: 'python setup.py build_ext execution failed.'

Adding `python-native` to `DEPENDS_virtclass-native` as suggested in [1] =
and done for `python-scons-native_1.2.0` fixes the issue.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/03=
2180.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
Acked-by: S=C3=B8ren Holm <sgh@sgh.dk>
---
 recipes/python/python-scons_1.3.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-scons_1.3.0.bb b/recipes/python/python=
-scons_1.3.0.bb
index 82231f2..5a412cb 100644
--- a/recipes/python/python-scons_1.3.0.bb
+++ b/recipes/python/python-scons_1.3.0.bb
@@ -2,6 +2,7 @@ DESCRIPTION =3D "A Software Construction Tool"
 SECTION =3D "devel/python"
 PRIORITY =3D "optional"
 LICENSE =3D "MIT"
+DEPENDS_virtclass-native =3D "python-native"
 SRCNAME =3D "scons"
 PR =3D "r1"
=20
--=20
1.7.7



