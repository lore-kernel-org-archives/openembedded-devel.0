Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LjJOi-0005cB-KN
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 21:26:58 +0100
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 28686940200
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 21:26:14 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 3E122940147
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 21:26:12 +0100 (CET)
Date: Mon, 16 Mar 2009 21:30:14 +0100
From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090316203014.GA4171@sourdiere>
References: <20090316195707.GA3793@sourdiere>
MIME-Version: 1.0
In-Reply-To: <20090316195707.GA3793@sourdiere>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: caratorn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] qwo input method recipe
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
X-List-Received-Date: Mon, 16 Mar 2009 20:26:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


---
 packages/qwo/qwo_0.4.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 packages/qwo/qwo_0.4.bb

diff --git a/packages/qwo/qwo_0.4.bb b/packages/qwo/qwo_0.4.bb
new file mode 100644
index 0000000..bdf6d6d
--- /dev/null
+++ b/packages/qwo/qwo_0.4.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "qwo virtual keyboard"
+AUTHOR =3D "Charles Clement"
+HOMEPAGE =3D "http://www.nongnu.org/qwo/"
+SECTION =3D "x11"
+PRIORITY =3D "optional"
+LICENSE =3D "GPLv2"
+DEPENDS =3D "libxtst libxext virtual/imlib2 libconfig"
+RDEPENDS +=3D "imlib2-loaders"
+PN =3D "qwo"
+PV =3D "0.4"
+PR =3D "r0"
+
+SRC_URI =3D "http://download.savannah.nongnu.org/releases/${PN}/${PN}-${=
PV}.tar.gz"
+
+inherit autotools
--=20
1.6.2

--=20
Charles Cl=E9ment.


