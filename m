Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OxogJ-0008Qw-EP for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 00:17:52 +0200
Received: from g225138219.adsl.alicedsl.de ([92.225.138.219]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OxogI-0006PG-5E; Mon, 20 Sep 2010 22:17:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284228112.14396.159.camel@mattotaupa>
References: <1284228112.14396.159.camel@mattotaupa>
Date: Tue, 21 Sep 2010 00:17:48 +0200
Message-ID: <1285021068.2453.80.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Mon, 20 Sep 2010 22:17:52 -0000
X-Groupsio-MsgNum: 23742
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Qfqo9vCik81EM1QgB9oH"

--=-Qfqo9vCik81EM1QgB9oH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 11.09.2010, 20:01 +0200 schrieb Paul Menzel:

[=E2=80=A6]

> `do_compile()` of `freesmartphone/libfsobasics_git.bb` fails for me
> reliably since today. As with my other reported failure of gtk+ [1]
> nothing was changed regarding this recipe in the last days and it worked
> for me before. Even yesterday because I could build gtk+ which is
> supposed to happen after `libfsobasics_git.bb`. But several things get
> build in parallel so that statement could be wrong.
>=20
> Minimal compiles fine with EGLIBC and glibc.
>=20
> 	$ find . -name execinfo.h
>=20
> did not return anything in my build directory.
>=20
> 	$ more log.do_compile
> 	NOTE: make
> 	make  all-recursive
> 	make[1]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev=
/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c=
6fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
> 	Making all in fsobasics
> 	make[2]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev=
/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c=
6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/bin/=
valac -C --basedir .. --vapidir ../vapi --pkg posix --pkg linux --pkg libnl=
-2.0 --pkg glib-2.0 --pkg gio-2.0 --header fsobasics.h --library fsobasics-=
2.0  asyncworker.vala inotifier.vala kobjectnotifier.vala libinitexit.vala =
logger.vala netlinknotifier.vala netlinkutils.vala overlay.vala process.val=
a smartkeyfile.vala syncasync.vala threading.vala types.vala utilities.vala
> 	fsobasics/logger.vala:300.17-300.33: warning: unreachable code detected
> 		              return "UNKNOWN";
> 		              ^^^^^^^^^^^^^^^^^
> 	fsobasics/smartkeyfile.vala:117.13-117.25: warning: unreachable code det=
ected
> 		          return false;
> 		          ^^^^^^^^^^^^^
> 	Compilation succeeded - 2 warning(s)
> 	touch fsobasics.vala.stamp
> 	make  all-am
> 	make[3]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-dev=
/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c=
6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> 		CC     asyncworker.lo
> 		CC     inotifier.lo
> 	inotifier.c: In function 'fso_framework_inotifier_construct':
> 	inotifier.c:173:2: warning: passing argument 4 of 'g_hash_table_new_full=
' from incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNo=
tify' but argument is of type 'void (*)(struct INotifyDelegateHolder *)'
> 		CC     kobjectnotifier.lo
> 	kobjectnotifier.c: In function 'fso_framework_base_kobject_notifier_cons=
truct':
> 	kobjectnotifier.c:182:2: warning: passing argument 4 of 'g_hash_table_ne=
w_full' from incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNo=
tify' but argument is of type 'void (*)(struct GList *)'
> 	kobjectnotifier.c:183:2: warning: passing argument 4 of 'g_hash_table_ne=
w_full' from incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNo=
tify' but argument is of type 'void (*)(struct GList *)'
> 	kobjectnotifier.c:184:2: warning: passing argument 4 of 'g_hash_table_ne=
w_full' from incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNo=
tify' but argument is of type 'void (*)(struct GList *)'
> 	kobjectnotifier.c:188:52: warning: passing argument 2 of 'bind' from inc=
ompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/sys/socket.h:115:12: note: expected 'const struct socka=
ddr *' but argument is of type 'struct sockaddr_nl *'
> 		CC     libinitexit.lo
> 		CC     logger.lo
> 		CC     netlinknotifier.lo
> 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_cons=
truct':
> 	netlinknotifier.c:206:2: warning: passing argument 4 of 'g_hash_table_ne=
w_full' from incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroyNo=
tify' but argument is of type 'void (*)(struct GList *)'
> 	netlinknotifier.c: In function '_lambda0_':
> 	netlinknotifier.c:260:162: warning: assignment discards qualifiers from =
pointer target type
> 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_hand=
leNetlinkMessage':
> 	netlinknotifier.c:296:15: warning: assignment makes pointer from integer=
 without a cast
> 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_hand=
leMessage':
> 	netlinknotifier.c:344:56: warning: cast to pointer from integer of diffe=
rent size
> 	netlinknotifier.c: In function '_fso_framework_base_netlink_notifier_add=
Match':
> 	netlinknotifier.c:366:56: warning: cast to pointer from integer of diffe=
rent size
> 	netlinknotifier.c:372:41: warning: cast to pointer from integer of diffe=
rent size
> 		CC     netlinkutils.lo
> 		CC     overlay.lo
> 		CC     process.lo
> 		CC     smartkeyfile.lo
> 		CC     syncasync.lo
> 		CC     threading.lo
> 	threading.c: In function 'fso_framework_threading_callDelegateOnMainThre=
ad':
> 	threading.c:451:4: warning: passing argument 4 of 'g_idle_add_full' from=
 incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyN=
otify' but argument is of type 'void (*)(struct Block3Data *)'
> 	threading.c:455:4: warning: passing argument 4 of 'g_idle_add_full' from=
 incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyN=
otify' but argument is of type 'void (*)(struct Block3Data *)'
> 	threading.c:458:4: warning: passing argument 4 of 'g_idle_add_full' from=
 incompatible pointer type
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestroyN=
otify' but argument is of type 'void (*)(struct Block3Data *)'
> 		CC     types.lo
> 		CC     utilities.lo
> 	utilities.c:35:22: fatal error: execinfo.h: No such file or directory
> 	compilation terminated.
> 	make[3]: *** [utilities.lo] Error 1
> 	make[3]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6=
fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> 	make[2]: *** [all] Error 2
> 	make[2]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6=
fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> 	make[1]: *** [all-recursive] Error 1
> 	make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6=
fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
> 	make: *** [all] Error 2
> 	FATAL: oe_runmake failed
> 	ERROR: Function do_compile failed
>=20
> Does anyone have a clue on how that can be fixed.

`execinfo.h` is not available in uClibc and is a =E2=80=9CGNUism=E2=80=9D [=
2]. The
dependency in in `linux.vapi` [3] and got included in [4].

Unfortunately I do not know how to exclude that. I guess Autotools
should check if `execinfo.h` is available and only use it if it is. But
I do not know how to do that. Michael, are those libraries intended to
be used with uClibc?

If this is too much work, how can I exclude this recipe from
console-image for minimal-uclibc?


Thanks,

Paul


> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-Septembe=
r/024097.html
[2] https://bugs.gentoo.org/show_bug.cgi?id=3D146693#c2
[3] http://git.freesmartphone.org/?p=3Dcornucopia.git;a=3Dblob;f=3Dlibfsoba=
sics/vapi/linux.vapi
[4] http://mail.gnome.org/archives/commits-list/2009-November/msg02423.html

--=-Qfqo9vCik81EM1QgB9oH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyX3YYACgkQPX1aK2wOHVhHBACfQyWcl/RMh3KzrnU/sR9QA1Hx
QkgAmwVRjvu2B4ho8mGdTPKuTS5YJ0gr
=pgLT
-----END PGP SIGNATURE-----

--=-Qfqo9vCik81EM1QgB9oH--
