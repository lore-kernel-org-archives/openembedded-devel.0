Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsgmC-0001z6-CL
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 20:50:47 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 5720E4B01D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 20:50:02 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 20:48:55 +0200
Message-Id: <1283798935-4819-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lib/oe/unpack.py: fix uncompressing .gz .bz2 or .xz
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
X-List-Received-Date: Mon, 06 Sep 2010 18:50:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

* Actually, the destination file has the full path (ie it's uncompressed
in the download directory) as only the extension is removed.
* By also removing the path, this patch should fix this problem.
* An other fix could be to no uncompress to stdout but let gunzip|bunzip2=
|
xz uncompress directly to the file.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 lib/oe/unpack.py |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
index 34569aa..8fc329a 100644
--- a/lib/oe/unpack.py
+++ b/lib/oe/unpack.py
@@ -64,14 +64,17 @@ def unpack_file(file, destdir, dos=3DFalse, env=3DNon=
e):
         cmd =3D 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
     elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.=
z'):
         base, ext =3D os.path.splitext(file)
+        ext, base =3D os.path.split(base)
         cmd =3D 'gzip -dc %s > %s' % (file, base)
     elif file.endswith('.bz2'):
         base, ext =3D os.path.splitext(file)
+        ext, base =3D os.path.split(base)
         cmd =3D 'bzip2 -dc %s > %s' % (file, base)
     elif file.endswith('.tar.xz'):
         cmd =3D 'xz -dc %s | tar x --no-same-owner -f -' % file
     elif file.endswith('.xz'):
         base, ext =3D os.path.splitext(file)
+        ext, base =3D os.path.split(base)
         cmd =3D 'xz -dc %s > %s' % (file, base)
     elif file.endswith('.zip') or file.endswith('.jar'):
         cmd =3D 'unzip -q -o'
--=20
1.6.3.3



