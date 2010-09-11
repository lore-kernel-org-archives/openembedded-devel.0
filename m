Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OuUPP-0008Dw-HX for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 20:02:40 +0200
Received: from g225137114.adsl.alicedsl.de ([92.225.137.114]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OuUOh-0006Dp-Hz for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 18:01:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Sep 2010 20:01:52 +0200
Message-ID: <1284228112.14396.159.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Sat, 11 Sep 2010 18:02:40 -0000
X-Groupsio-MsgNum: 23463
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uDSNVvKqvAQ8JM0nT50y"

--=-uDSNVvKqvAQ8JM0nT50y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


`do_compile()` of `freesmartphone/libfsobasics_git.bb` fails for me
reliably since today. As with my other reported failure of gtk+ [1]
nothing was changed regarding this recipe in the last days and it worked
for me before. Even yesterday because I could build gtk+ which is
supposed to happen after `libfsobasics_git.bb`. But several things get
build in parallel so that statement could be wrong.

Minimal compiles fine with EGLIBC and glibc.

	$ find . -name execinfo.h

did not return anything in my build directory.

	$ more log.do_compile
	NOTE: make
	make  all-recursive
	make[1]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/w=
ork/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6f=
ea92168e88201be98dcceaef-r2.0/git/libfsobasics'
	Making all in fsobasics
	make[2]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/w=
ork/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6f=
ea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/bin/va=
lac -C --basedir .. --vapidir ../vapi --pkg posix --pkg linux --pkg libnl-2=
.0 --pkg glib-2.0 --pkg gio-2.0 --header fsobasics.h --library fsobasics-2.=
0  asyncworker.vala inotifier.vala kobjectnotifier.vala libinitexit.vala lo=
gger.vala netlinknotifier.vala netlinkutils.vala overlay.vala process.vala =
smartkeyfile.vala syncasync.vala threading.vala types.vala utilities.vala
	fsobasics/logger.vala:300.17-300.33: warning: unreachable code detected
		              return "UNKNOWN";
		              ^^^^^^^^^^^^^^^^^
	fsobasics/smartkeyfile.vala:117.13-117.25: warning: unreachable code detec=
ted
		          return false;
		          ^^^^^^^^^^^^^
	Compilation succeeded - 2 warning(s)
	touch fsobasics.vala.stamp
	make  all-am
	make[3]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/w=
ork/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6f=
ea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
		CC     asyncworker.lo
		CC     inotifier.lo
	inotifier.c: In function 'fso_framework_inotifier_construct':
	inotifier.c:173:2: warning: passing argument 4 of 'g_hash_table_new_full' =
from incompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct INotifyDelegateHolder *)'
		CC     kobjectnotifier.lo
	kobjectnotifier.c: In function 'fso_framework_base_kobject_notifier_constr=
uct':
	kobjectnotifier.c:182:2: warning: passing argument 4 of 'g_hash_table_new_=
full' from incompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct GList *)'
	kobjectnotifier.c:183:2: warning: passing argument 4 of 'g_hash_table_new_=
full' from incompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct GList *)'
	kobjectnotifier.c:184:2: warning: passing argument 4 of 'g_hash_table_new_=
full' from incompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct GList *)'
	kobjectnotifier.c:188:52: warning: passing argument 2 of 'bind' from incom=
patible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/sys/socket.h:115:12: note: expected 'const struct sockadd=
r *' but argument is of type 'struct sockaddr_nl *'
		CC     libinitexit.lo
		CC     logger.lo
		CC     netlinknotifier.lo
	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_constr=
uct':
	netlinknotifier.c:206:2: warning: passing argument 4 of 'g_hash_table_new_=
full' from incompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNoti=
fy' but argument is of type 'void (*)(struct GList *)'
	netlinknotifier.c: In function '_lambda0_':
	netlinknotifier.c:260:162: warning: assignment discards qualifiers from po=
inter target type
	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_handle=
NetlinkMessage':
	netlinknotifier.c:296:15: warning: assignment makes pointer from integer w=
ithout a cast
	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_handle=
Message':
	netlinknotifier.c:344:56: warning: cast to pointer from integer of differe=
nt size
	netlinknotifier.c: In function '_fso_framework_base_netlink_notifier_addMa=
tch':
	netlinknotifier.c:366:56: warning: cast to pointer from integer of differe=
nt size
	netlinknotifier.c:372:41: warning: cast to pointer from integer of differe=
nt size
		CC     netlinkutils.lo
		CC     overlay.lo
		CC     process.lo
		CC     smartkeyfile.lo
		CC     syncasync.lo
		CC     threading.lo
	threading.c: In function 'fso_framework_threading_callDelegateOnMainThread=
':
	threading.c:451:4: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyNot=
ify' but argument is of type 'void (*)(struct Block3Data *)'
	threading.c:455:4: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyNot=
ify' but argument is of type 'void (*)(struct Block3Data *)'
	threading.c:458:4: warning: passing argument 4 of 'g_idle_add_full' from i=
ncompatible pointer type
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyNot=
ify' but argument is of type 'void (*)(struct Block3Data *)'
		CC     types.lo
		CC     utilities.lo
	utilities.c:35:22: fatal error: execinfo.h: No such file or directory
	compilation terminated.
	make[3]: *** [utilities.lo] Error 1
	make[3]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/wo=
rk/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fe=
a92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
	make[2]: *** [all] Error 2
	make[2]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/wo=
rk/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fe=
a92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
	make[1]: *** [all-recursive] Error 1
	make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/wo=
rk/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fe=
a92168e88201be98dcceaef-r2.0/git/libfsobasics'
	make: *** [all] Error 2
	FATAL: oe_runmake failed
	ERROR: Function do_compile failed

Does anyone have a clue on how that can be fixed.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/=
024097.html

--=-uDSNVvKqvAQ8JM0nT50y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyLxBAACgkQPX1aK2wOHVgU5QCePDNS6reytlpYOqh/+7MtMcLN
+KwAn042cb7+Kb9ogBJuhVem43Y4nK65
=Zc0v
-----END PGP SIGNATURE-----

--=-uDSNVvKqvAQ8JM0nT50y--
