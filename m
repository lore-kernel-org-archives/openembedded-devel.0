Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXns6-0007u5-Lf
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 03:33:43 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 770624025B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 22:32:37 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id B5503740D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 00:32:34 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0D9B0610142; Fri, 13 Feb 2009 00:32:21 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 13 Feb 2009 00:32:21 -0200
Message-ID: <87iqnfjccq.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Fri, 13 Feb 2009 02:33:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

One of nice features we've been using is the git-describe to get
versions based on tags; many projects are using it to name the
development releases and it does give a better view of how diverged it
from last released version.

So we're looking for a way to use it to generate the PV based on
that. The current git fetcher already has the required support to get
tags, so we can use it as SRCREV, but not yet to use git-describe.

I've tried to implement it, and failed. Here is the current patch just
to reference.

Index: lib/bb/fetch/git.py
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- lib/bb/fetch/git.py (revis=C3=A3o 1150)
+++ lib/bb/fetch/git.py (c=C3=B3pia de trabalho)
@@ -49,10 +49,7 @@
         elif tag:
             ud.tag =3D tag
=20
-        if not ud.tag:
-            ud.tag =3D self.latest_revision(url, ud, d)=20=20
-
-        if ud.tag =3D=3D "master":
+        if not ud.tag or ud.tag =3D=3D "master":
             ud.tag =3D self.latest_revision(url, ud, d)
=20
         ud.localfile =3D data.expand('git_%s%s_%s.tar.gz' % (ud.host, ud.p=
ath.replace('/', '.'), ud.tag), d)
@@ -179,6 +176,15 @@
=20
         sortable_revision =3D "%s+%s" % (output.split()[0], ud.tag)
         bb.data.setVar(key, sortable_revision, d)
+
+        if bb.data.getVar("GIT_USE_DESCRIBE", d, False):
+            describe =3D runfetchcmd("git describe 2> /dev/null").read().s=
trip()
+
+            if describe.empty():
+                bb.data.setVar("GIT_DESCRIBED_VERSION", "0.0.0+gitr%s" % (=
ud.tag))
+            else:
+                bb.data.setVar("GIT_DESCRIBED_VERSION", describe)
+
         return sortable_revision

Do someone has a better idea how to do that?

TIA,

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


