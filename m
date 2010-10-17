Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P7VRM-0007Tx-SU
	for Openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 17:46:30 +0200
Received: by yxt3 with SMTP id 3so20001yxt.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 08:45:56 -0700 (PDT)
Received: by 10.150.213.2 with SMTP id l2mr5102952ybg.85.1287330355875;
	Sun, 17 Oct 2010 08:45:55 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id q8sm3480956ybk.12.2010.10.17.08.45.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 08:45:55 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Sun, 17 Oct 2010 23:45:53 +0800
Message-Id: <19066226-040D-4A8A-A9E7-EBC31BCE2040@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] libsamplerate: Fix checksums to match downloaded file
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
X-List-Received-Date: Sun, 17 Oct 2010 15:46:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

diff --git a/recipes/libsamplerate/libsamplerate0_0.1.7.bb =
b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
index 737e934..2a81e4b 100644
--- a/recipes/libsamplerate/libsamplerate0_0.1.7.bb
+++ b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "An audio Sample Rate Conversion =
library"
 SECTION =3D "libs"
 LICENSE =3D "GPL libsamplerate"
=20
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
            file://libsamplerate-0.1.7-macro-quoting.patch;striplevel=3D0 =
\
@@ -12,5 +12,5 @@ S =3D "${WORKDIR}/libsamplerate-${PV}"
 inherit autotools pkgconfig
=20
=20
-SRC_URI[md5sum] =3D "ad093e60ec44f0a60de8e29983ddbc0f"
-SRC_URI[sha256sum] =3D =
"e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
+SRC_URI[md5sum] =3D "6731a81cb0c622c483b28c0d7f90867d"
+SRC_URI[sha256sum] =3D =
"78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"



