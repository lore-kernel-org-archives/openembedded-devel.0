Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PLvqu-0000qo-RO
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:48:29 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 8D6C01D36171; Fri, 26 Nov 2010 11:47:12 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 11:47:11 +0100
Message-Id: <1290768432-13366-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Fri, 26 Nov 2010 10:48:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fixes the compile problem:

x264-r2245-r7/x264-snapshot-20100531-2245/encoder/set.c:236: undefined re=
ference to `log2f'
libx264.a(encoder.o): In function `x264_validate_parameters':

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/distro/angstrom-2008.1.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
index 1fd5ab6..895deed 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -78,8 +78,8 @@ PREFERRED_VERSION_linux-libc-headers-native =3D "${LINU=
X_LIBC_HEADERS_VERSION}"
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 			?=3D "2.9"
 PREFERRED_VERSION_glibc-initial 	?=3D "2.9"
-PREFERRED_VERSION_uclibc        	?=3D "0.9.30.2"
-PREFERRED_VERSION_uclibc-initial	?=3D "0.9.30.2"
+PREFERRED_VERSION_uclibc        	?=3D "0.9.30.3"
+PREFERRED_VERSION_uclibc-initial	?=3D "0.9.30.3"
 PREFERRED_VERSION_eglibc			?=3D "2.9"
 PREFERRED_VERSION_eglibc-initial	?=3D "2.9"
=20
--=20
1.7.0.4



