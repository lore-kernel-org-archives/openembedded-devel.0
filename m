Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LKCqV-0008WV-7M
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 15:23:51 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 16ACB400CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2009 10:18:04 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 25FF42253A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2009 10:17:46 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 04194610057; Tue,  6 Jan 2009 12:12:49 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 06 Jan 2009 12:12:49 -0200
Message-ID: <87r63gseu6.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: [RFC] bitbake git fetcher fix
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
X-List-Received-Date: Tue, 06 Jan 2009 14:23:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I've found a issue when using current GIT fetcher and bellow patch
fixes it for me; could someone take a look at it and commit if it does
look fine?

Cheers,

Index: lib/bb/fetch/git.py
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- lib/bb/fetch/git.py	(revis=C3=A3o 1150)
+++ lib/bb/fetch/git.py	(c=C3=B3pia de trabalho)
@@ -42,19 +42,17 @@
             ud.proto =3D ud.parm['protocol']
=20
         ud.branch =3D ud.parm.get("branch", "master")
+        ud.tag =3D None
=20
         tag =3D Fetch.srcrev_internal_helper(ud, d)
         if tag is True:
             ud.tag =3D self.latest_revision(url, ud, d)=09
-        elif tag:
+        elif tag and tag !=3D "1":
             ud.tag =3D tag
=20
-        if not ud.tag:
+        if not ud.tag or ud.tag =3D=3D "master":
             ud.tag =3D self.latest_revision(url, ud, d)=09
=20
-        if ud.tag =3D=3D "master":
-            ud.tag =3D self.latest_revision(url, ud, d)
-
         ud.localfile =3D data.expand('git_%s%s_%s.tar.gz' % (ud.host, ud.p=
ath.replace('/', '.'), ud.tag), d)
=20
         return os.path.join(data.getVar("DL_DIR", d, True), ud.localfile)

--=20
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


