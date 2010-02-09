Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NeeEz-0005VC-FQ
	for openembedded-devel@openembedded.org; Tue, 09 Feb 2010 01:46:12 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 315A61D360F8;
	Tue,  9 Feb 2010 01:43:38 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 01:43:35 +0100
Message-Id: <1265676216-9722-6-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1265676216-9722-5-git-send-email-ynezz@true.cz>
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
	<1265676216-9722-3-git-send-email-ynezz@true.cz>
	<1265676216-9722-4-git-send-email-ynezz@true.cz>
	<1265676216-9722-5-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.32: update to latest stable 2.6.32.7 patchset
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
X-List-Received-Date: Tue, 09 Feb 2010 00:46:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch updates to 2.6.32.7 and adds
clocksource-fix-compilation-if-no-generic_time.patch patch, otherwise it =
won't
compile on platforms which don't implement GENERIC_TIME. Compilation ends=
 with
following error:

kernel/time/clocksource.c: In function 'clocksource_register':
kernel/time/clocksource.c:556: error: implicit declaration of function 'c=
locksource_max_deferment'

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini                                 |    4 ++
 ...source-fix-compilation-if-no-generic_time.patch |   48 ++++++++++++++=
++++++
 recipes/linux/linux_2.6.32.bb                      |    5 +-
 3 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.32/clocksource-fix-compilatio=
n-if-no-generic_time.patch

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 0478fa5..98aba73 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -21794,6 +21794,10 @@ sha256=3Dd207f4217c4b3fef9c5a19620b6ca90dbd9b958=
3ed9c686b5636eec973a7cc60
 md5=3D49e6bc73c7a7f690fe7ddf09fe2b5d06
 sha256=3Db4d0d667db5094fd430ed58955f4f9ed71d278d5ce70e63d287c53f8db028ac=
3
=20
+[http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.32.7.bz2]
+md5=3Da68305d3e77dddc9555ba58f678a1ce2
+sha256=3Db3382d02ec25e3ae86fac7852ba540e59af770a76604d317b39df57505b376b=
f
+
 [http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
 md5=3Dd6249654087f0bcafaa860ac573316a4
 sha256=3D91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9a=
c
diff --git a/recipes/linux/linux-2.6.32/clocksource-fix-compilation-if-no=
-generic_time.patch b/recipes/linux/linux-2.6.32/clocksource-fix-compilat=
ion-if-no-generic_time.patch
new file mode 100644
index 0000000..f6f9885
--- /dev/null
+++ b/recipes/linux/linux-2.6.32/clocksource-fix-compilation-if-no-generi=
c_time.patch
@@ -0,0 +1,48 @@
+From aaro.koskinen@iki.fi  Mon Feb  1 13:24:31 2010
+From: Aaro Koskinen <aaro.koskinen@iki.fi>
+Date: Mon,  1 Feb 2010 18:24:58 +0200
+Subject: clocksource: fix compilation if no GENERIC_TIME
+To: stable@kernel.org, gregkh@suse.de, tglx@linutronix.de, linux-kernel@=
vger.kernel.org
+Message-ID: <1265041498-2434-1-git-send-email-aaro.koskinen@iki.fi>
+
+From: Aaro Koskinen <aaro.koskinen@iki.fi>
+
+commit a362c638bdf052bf424bce7645d39b101090f6ba upstream
+
+Commit a9238ce3bb0fda6e760780b702c6cbd3793087d3 broke compilation on
+platforms that do not implement GENERIC_TIME (e.g. iop32x):
+
+  kernel/time/clocksource.c: In function 'clocksource_register':
+  kernel/time/clocksource.c:556: error: implicit declaration of function=
 'clocksource_max_deferment'
+
+Provide the implementation of clocksource_max_deferment() also for
+such platforms.
+
+Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
+
+---
+ kernel/time/clocksource.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/kernel/time/clocksource.c
++++ b/kernel/time/clocksource.c
+@@ -413,8 +413,6 @@ void clocksource_touch_watchdog(void)
+ 	clocksource_resume_watchdog();
+ }
+=20
+-#ifdef CONFIG_GENERIC_TIME
+-
+ /**
+  * clocksource_max_deferment - Returns max time the clocksource can be =
deferred
+  * @cs:         Pointer to clocksource
+@@ -456,6 +454,8 @@ static u64 clocksource_max_deferment(str
+ 	return max_nsecs - (max_nsecs >> 5);
+ }
+=20
++#ifdef CONFIG_GENERIC_TIME
++
+ /**
+  * clocksource_select - Select the best clocksource available
+  *
diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.b=
b
index 560ff42..36fc3cc 100644
--- a/recipes/linux/linux_2.6.32.bb
+++ b/recipes/linux/linux_2.6.32.bb
@@ -1,6 +1,6 @@
 require linux.inc
=20
-PR =3D "r5"
+PR =3D "r6"
=20
 S =3D "${WORKDIR}/linux-${PV}"
=20
@@ -22,7 +22,8 @@ DEFAULT_PREFERENCE_jornada6xx =3D "-1"
 DEFAULT_PREFERENCE_jornada7xx =3D "-1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2;name=3Dkernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.5.bz2;p=
atch=3D1 \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.7.bz2;p=
atch=3D1 \
+           file://clocksource-fix-compilation-if-no-generic_time.patch;p=
atch=3D1 \
            file://defconfig"
=20
 SRC_URI[kernel.md5sum] =3D "260551284ac224c3a43c4adac7df4879"
--=20
1.6.0.4



