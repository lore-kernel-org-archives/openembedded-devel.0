Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk04r-0007vz-9x
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:05:52 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk02B-0001w6-EK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 11:03:03 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 11:03:02 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 19:03:02 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 12:03:01 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 12:02:56 -0700
Message-ID: <1266951776.18176.47.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 19:03:02.0888 (UTC)
	FILETIME=[D2E8F680:01CAB4BA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Tue, 23 Feb 2010 19:05:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was about to just push this and I noticed that a number of
distributions (SlugOS, Angstrom, Kaelios, micro) currently set
FEATURE_SUID=3Dy, but it's not actually install SUID.  And since I recall
some way-back-when's of "busybox SUID is dangerous / crap!", I thought
it best to post the patch first and let folks speak up / ask me to drop
FEATURE_SUID=3Dy when I do this.  So, here's the patch:

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 5f52850..b165d0f 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE =3D "GPL"
 SECTION =3D "base"
 PRIORITY =3D "required"
=20
-INC_PR =3D "r24"
+INC_PR =3D "r25"
=20
 SRC_URI =3D "\
   file://busybox-cron \
@@ -96,7 +96,11 @@ do_install () {
 	# Install /bin/busybox, and the /bin/sh link so the postinst script
 	# can run. Let update-alternatives handle the rest.
 	install -d ${D}${base_bindir}
-	install -m 0755 ${S}/busybox ${D}${base_bindir}
+	if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig; then
+		install -m 4755 ${S}/busybox ${D}${base_bindir}
+	else
+		install -m 0755 ${S}/busybox ${D}${base_bindir}
+	fi
 	ln -sf busybox ${D}${base_bindir}/sh
=20
 	if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


