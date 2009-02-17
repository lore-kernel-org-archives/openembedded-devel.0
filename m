Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LZP7W-0004bW-M6
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 13:32:14 +0100
Received: from [192.168.1.116] (unknown [192.168.1.116])
	by mail.altell.local (Postfix) with ESMTP id 968186819B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2009 15:30:04 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2009 15:25:28 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<200902141715.56797.khimov@altell.ru>
	<87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902171525.28995.khimov@altell.ru>
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Tue, 17 Feb 2009 12:32:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Otavio Salvador:
> Roman I Khimov <khimov@altell.ru> writes:
> > Marcin Juszkiewicz:
> >> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
> >> > diff --git a/packages/siproxd/siproxd.inc
> >> >
> >> > +RDEPENDS =3D "libosip2"
> >> >
> >> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
> >> >
> >> > +PR =3D "r0"
> >>
> >> Drop those two lines. You should not add libs to RDEPENDS (OE takes
> >> care of it) and "r0" is default PR value.
> >
> > OK.
>
> It would be quite nice if you could send a git exported patch since it
> makes the life eaiser for anyone going to apply your commit (locally or
> for pushing it) and also keeps the credit for you.

OK, let me try to embed it here first, then I'll try to send raw format-pat=
ch
output for other patches. I've also fixed config files installation with th=
is one.

=46rom d6e5e440e1083455a916964f2da6695337fcffe6 Mon Sep 17 00:00:00 2001
From: Roman I Khimov <khimov@altell.ru>
Date: Mon, 16 Feb 2009 19:03:48 +0300
Subject: [PATCH] siproxd: new package

---
 conf/checksums.ini                |    4 ++++
 packages/siproxd/siproxd.inc      |   17 +++++++++++++++++
 packages/siproxd/siproxd_0.7.1.bb |    1 +
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 packages/siproxd/siproxd.inc
 create mode 100644 packages/siproxd/siproxd_0.7.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e867c6e..e198cae 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19754,6 +19754,10 @@ sha256=3D928fa03d1b8a2329f5e71dd9190080146b5275119=
e28c19c36fdd57e788d84ba
 md5=3D597d7ff7edb42a18421c806ffd18a136
 sha256=3D7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
=20
+[http://downloads.sourceforge.net/siproxd/siproxd-0.7.1.tar.gz]
+md5=3D45e5a44803181e2bf3361d562060c904
+sha256=3D9e702c1fe770815ed87cf2a2b1d1d1d87551573d
+
 [http://download.berlios.de/sipsak/sipsak-0.9.6-1.tar.gz]
 md5=3Dc4eb8e282902e75f4f040f09ea9d99d5
 sha256=3D5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
diff --git a/packages/siproxd/siproxd.inc b/packages/siproxd/siproxd.inc
new file mode 100644
index 0000000..c4ac144
--- /dev/null
+++ b/packages/siproxd/siproxd.inc
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "SIP proxy/masquerading daemon"
+SECTION =3D "net"
+DEPENDS =3D "libosip2"
+LICENSE =3D "GPL"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/siproxd/siproxd-${PV}.tar.gz"
+
+do_install_append() {
+	mv ${D}/${sysconfdir}/siproxd.conf{.example,}
+}
+
+CONFFILES_${PN} =3D " \
+	${sysconfdir}/siproxd.conf \
+	${sysconfdir}/siproxd_passwd.cfg \
+	"
+
+inherit autotools
diff --git a/packages/siproxd/siproxd_0.7.1.bb b/packages/siproxd/siproxd_0=
.7.1.bb
new file mode 100644
index 0000000..760a8b6
--- /dev/null
+++ b/packages/siproxd/siproxd_0.7.1.bb
@@ -0,0 +1 @@
+require siproxd.inc
--=20
1.6.1.3

--=20
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



