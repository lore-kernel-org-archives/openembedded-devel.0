Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LfBsX-0006uf-NS
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 12:36:41 +0100
Received: (qmail 14008 invoked by uid 813007); 5 Mar 2009 11:32:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Mar 2009 11:32:21 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Mar 2009 12:32:07 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200903051232.09899.marcin@juszkiewicz.com.pl>
Subject: [PATCH] gtk+: make 2.14.2 default version instead of 2.10.14
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
X-List-Received-Date: Thu, 05 Mar 2009 11:36:42 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


commit 67d5b4c8f0283225eab0408099d0d3cf440c0fd0
Author: Marcin Juszkiewicz <hrw@openembedded.org>
Date:   Thu Mar 5 11:03:13 2009 +0100

    gtk+: make 2.14.2 default version instead of 2.10.14

    =C5ngstr=F6m uses this version and many components of metadata depends
    on at least 2.12.

diff --git a/packages/gtk+/gtk+_2.14.2.bb b/packages/gtk+/gtk+_2.14.2.bb
index 38dd3a4..88c40dd 100644
=2D-- a/packages/gtk+/gtk+_2.14.2.bb
+++ b/packages/gtk+/gtk+_2.14.2.bb
@@ -4,9 +4,6 @@ PR =3D "r3"

 DEPENDS +=3D "cairo jasper"

=2D# disabled per default - this uses as little patches as possible
=2DDEFAULT_PREFERENCE =3D "-1"
=2D
 SRC_URI =3D=20
"http://download.gnome.org/sources/gtk+/2.14/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch;patch=3D1 \
            file://run-iconcache.patch;patch=3D1 \


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




