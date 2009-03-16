Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LjJH3-0000D6-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 21:19:03 +0100
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id DA2E2940131
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 21:18:19 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp1-g21.free.fr (Postfix) with ESMTP id F265E940139
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 21:18:16 +0100 (CET)
Date: Mon, 16 Mar 2009 21:22:19 +0100
From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090316202219.GA4160@sourdiere>
References: <20090316195707.GA3793@sourdiere>
MIME-Version: 1.0
In-Reply-To: <20090316195707.GA3793@sourdiere>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: caratorn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50, RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] qwo input method recipe
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
X-List-Received-Date: Mon, 16 Mar 2009 20:19:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Library libconfig is needed for package qwo.

---
 packages/libconfig/libconfig_1.3.1.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 packages/libconfig/libconfig_1.3.1.bb

diff --git a/packages/libconfig/libconfig_1.3.1.bb b/packages/libconfig/l=
ibconfig_1.3.1.bb
new file mode 100644
index 0000000..cae25f4
--- /dev/null
+++ b/packages/libconfig/libconfig_1.3.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "Library for manipulating structured configuration files=
"
+AUTHOR =3D "Mark Lindner"
+HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+LICENSE =3D "LGPLv2"
+DEPENDS =3D ""
+PV =3D "1.3.1"
+PR =3D "r0"
+
+SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
+
+S =3D "${WORKDIR}/libconfig-${PV}"
+
+inherit autotools
+
+do_stage() {
+	install -m 644 libconfig.h ${STAGING_INCDIR}
+	install -m 644 libconfig.h++ ${STAGING_INCDIR}
+	oe_libinstall -a -so libconfig ${STAGING_LIBDIR}
+	oe_libinstall -a -so libconfig++ ${STAGING_LIBDIR}
+}
--=20
1.6.2

--=20
Charles Cl=E9ment.


