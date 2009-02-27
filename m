Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ld50k-0006jB-Rr
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 16:52:32 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id D19414C15D; Fri, 27 Feb 2009 16:48:57 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRVDw5RXnw=
Message-ID: <36869.AFRVDw5RXnw=.1235749737.squirrel@webmail.no-log.org>
Date: Fri, 27 Feb 2009 16:48:57 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: [patch](or sort of): emacs didn't compile[third and last part: liblockfile url]
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
X-List-Received-Date: Fri, 27 Feb 2009 15:52:43 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

liblockfile didn't find the file in any of the debian mirrors...
$ diff -Nurd org.openembedded.dev/packages/liblockfile/
local_packages/packages/liblockfile/
diff -Nurd org.openembedded.dev/packages/liblockfile/liblockfile_1.06.bb
local_packages/packages/liblockfile/liblockfile_1.06.bb
---
org.openembedded.dev/packages/liblockfile/liblockfile_1.06.bb	2009-02-25
11:40:19.000000000 +0100
+++ local_packages/packages/liblockfile/liblockfile_1.06.bb	2009-02-25
11:39:40.000000000 +0100
@@ -3,7 +3,9 @@
 LICENSE =3D "LGPL"
 PR =3D"r1"

-SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.ta=
r.gz \
+#SRC_URI =3D
"${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
+SRC_URI =3D "http://distfiles.gentoo.org/distfiles/liblockfile_${PV}.tar=
.gz \
+
 	   file://install.patch;patch=3D1 \
 	   file://configure.patch;patch=3D1 \
 	   file://ldflags.patch;patch=3D1 \

so I bet I can commit the changes here...
(the md5sum are in the checksums.ini:
[ftp://ftp.debian.org/debian/pool/main/libl/liblockfile/liblockfile_1.06.=
tar.gz]
md5=3D2de88389da013488bfd31356523070c0
sha256=3D14f9690328318d11f9ba13a9356a2c008bdd169b7a817f38cb7f9eb32cf7240e

[ftp://ftp.nl.debian.org/debian/pool/main/libl/liblockfile/liblockfile_1.=
06.tar.gz]
md5=3D2de88389da013488bfd31356523070c0
sha256=3D14f9690328318d11f9ba13a9356a2c008bdd169b7a817f38cb7f9eb32cf7240e
)
and I do not change the PR because it doesn't change the content of the
package...
but I post here just in case someone has an objection
Denis.


