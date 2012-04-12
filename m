Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SILtD-0000Fj-Re
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 17:24:52 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 62C564B0194
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 17:15:30 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2012 17:15:29 +0200
Message-Id: <1334243729-19664-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [meta-oe] qte-toolchain: add qwte support
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
X-List-Received-Date: Thu, 12 Apr 2012 15:24:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

we have QWT in meta-oe so include it in the SDK to give users the
opportunity to use these widgets in their developments.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../tasks/task-qte-toolchain-target.bbappend       |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bb=
append

diff --git a/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend =
b/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend
new file mode 100644
index 0000000..7ca6c59
--- /dev/null
+++ b/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend
@@ -0,0 +1,3 @@
+RDEPENDS_${PN} +=3D "qwt-e-dev"
+
+PRINC =3D "1"
--=20
1.7.7.6



