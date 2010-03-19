Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NsfV2-0005ys-Ar
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 17:57:17 +0100
Received: (qmail 1893 invoked by uid 813007); 19 Mar 2010 16:53:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Mar 2010 16:53:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 17:52:12 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201003191752.13129.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Rootfs without busybox in it
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
X-List-Received-Date: Fri, 19 Mar 2010 16:57:17 -0000
X-Groupsio-MsgNum: 17874
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9u6oLwveHSvU+3D"

--Boundary-00=_9u6oLwveHSvU+3D
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

As part of my work for BugLabs company I am working on creating root 
filesystem which does not rely on BusyBox for 90% of commands but rather use 
normal versions of them.

I have something what boots and more or less works but found few issues for 
which I want to get some discussion.

1. 'ifupdown' package needed changes:

- removal of 'networking' initscript
- removal of 'interfaces' definition
- shipping /etc/network/run/ directory

first two are present in 'netbase' and are usually more optimised for OE 
targets, last one is required for keeping information about state of 
interfaces

2. lack of '/bin/sh' makes device not bootable

One solution is to use 'update-alternatives' script for handling that. But 
this is 'egg & chicken' problem because 'u-a' is shell script. So far my 
temporary solution is creation of 'bash-sh' package which symlinks '/bin/bash' 
in post install script and in pre remove symlinks it to busybox. It is not 
ideal but I needed something to get it working.

3. lack of '/etc/init.d/hwclock.sh'

We provide it with BusyBox package, Debian has own one in util-linux(-ng) 
package. I am planning to strip Debian one from log functions and test it.

4. lack of 'start-stop-daemon'

So far I am using one from 'dpkg' but not extracted it to separate package.

5. 'adduser' is from 'tinylogin'

We can not use Debian one because it is written in Perl. 'useradd' comes from 
'shadow' package. There are few versions of 'adduser' command in contrib/ 
directory of shadow sources - 'adduser.sh' one looks simplest.

Tinylogin should be dropped in OE anyway in favour of BusyBox (but that's 
other story).

Will write more when will remind them.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_9u6oLwveHSvU+3D
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-ifupdown-do-not-ship-files-present-in-netbase.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-ifupdown-do-not-ship-files-present-in-netbase.patch"

From b8664428e4c7c60795d0682397376dd91983add2 Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Date: Thu, 18 Mar 2010 16:12:03 +0100
Subject: [PATCH] ifupdown: do not ship files present in netbase

There are two files which are also present in netbase:

- /etc/init.d/networking
- /etc/network/interfaces

netbase versions are more suited for OE targets

Also ship /etc/network/run/ dir for iface state

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/ifupdown/ifupdown_0.6.8.bb |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/recipes/ifupdown/ifupdown_0.6.8.bb b/recipes/ifupdown/ifupdown=
_0.6.8.bb
index 53ccb5f..0092e22 100644
--- a/recipes/ifupdown/ifupdown_0.6.8.bb
+++ b/recipes/ifupdown/ifupdown_0.6.8.bb
@@ -3,15 +3,14 @@ This package provides the tools ifup and ifdown which may=
 be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
 the file /etc/network/interfaces."
 LICENSE =3D "GPL"
+PR =3D "r1.1"
=20
 SECTION =3D "base"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/i/ifupdown/ifupdown_${PV}.tar.gz \
            file://busybox.patch;patch=3D1 \
            file://udhcpc.patch;patch=3D1 \
-           file://zeroconf.patch;patch=3D1 \
-           file://init \
-           file://interfaces"
+           file://zeroconf.patch;patch=3D1 "
=20
 EXTRA_OEMAKE =3D ""
=20
@@ -21,16 +20,13 @@ do_compile () {
 }
=20
 do_install () {
-	install -d ${D}${sysconfdir}/init.d \
-		   ${D}${sysconfdir}/network \
-		   ${D}${mandir}/man8 \
+	install -d ${D}${mandir}/man8 \
 		   ${D}${mandir}/man5 \
-		   ${D}${base_sbindir}
+		   ${D}${base_sbindir} \
+		   ${D}${sysconfdir}/network/run
+
 	install -m 0755 ifup ${D}${base_sbindir}/
 	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifdown
-	install -m 0644 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
-	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interface=
s
 	install -m 0644 ifup.8 ${D}${mandir}/man8
-	install -m 0644 interfaces.5 ${D}${mandir}/man5
 	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
 }
--=20
1.7.0


--Boundary-00=_9u6oLwveHSvU+3D
Content-Type: text/x-patch;
  charset="UTF-8";
  name="bash.inc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bash.inc.patch"

diff --git a/recipes/bash/bash.inc b/recipes/bash/bash.inc
index 4eba689..a6ef610 100644
--- a/recipes/bash/bash.inc
+++ b/recipes/bash/bash.inc
@@ -33,3 +33,16 @@ pkg_postinst () {
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
 	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
 }
+
+PACKAGES += "bash-sh"
+RDEPENDS_bash-sh = "bash"
+
+ALLOW_EMPTY_bash-sh = "1"
+
+pkg_postinst_bash-sh() {
+    cd $D/bin && ln -sf bash sh
+}
+
+pkg_postrm_bash-sh() {
+    ln -sf /bin/busybox /bin/sh
+}

--Boundary-00=_9u6oLwveHSvU+3D--
