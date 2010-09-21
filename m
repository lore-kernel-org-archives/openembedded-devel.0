Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <frederik.sdun@googlemail.com>) id 1OxvEx-0002Kh-J1
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 07:18:06 +0200
Received: by bwz2 with SMTP id 2so5239282bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 22:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=LHhNVydiUKrloSwKPNto0isyM7NtzKF1nfOYHowEy3w=;
	b=G2Hyaf/4c1VTNwq7NgRZcNB4c7HbSL2tiLfXziUdLDvvT5reFGg53Uw8mGtVAyi29E
	1Y8mYRlTiZQYUKF6IvZid3XWhy3oT/9066In0yUyqPYom1O5xJ1eF9y/aUE41xLWIL9z
	eVT2e4JSBoIHfpZqdJlsYcf3KlNZJhjRdqU0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sggYKmU/zUjRqHoadXl3tH15Yo8FL4ja++CjiqTuy3FjN7dmLwjZJsFyWfCzyKR0tn
	4lDtOATezGq6OM1N2RQu77gF13/b5VreWen3rOhkaQEKhE8ygz9jndCwXVUEDKU5fJ71
	BlW7Qi863F0pbvod1f7n/40mjhv00MQq/YNpY=
Received: by 10.204.65.145 with SMTP id j17mr7136985bki.209.1285046282161;
	Mon, 20 Sep 2010 22:18:02 -0700 (PDT)
Received: from smtp.googlemail.com ([93.216.213.29])
	by mx.google.com with ESMTPS id f10sm7210775bkl.5.2010.09.20.22.18.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Sep 2010 22:18:01 -0700 (PDT)
Received: by smtp.googlemail.com (nbSMTP-1.00) for uid 1000
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128/128 bits))
	frederik.sdun@googlemail.com; Tue, 21 Sep 2010 07:17:51 +0200 (CEST)
Date: Tue, 21 Sep 2010 07:17:49 +0200
From: Frederik Sdun <frederik.sdun@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921051747.GA3989@thinky>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1285021068.2453.80.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: frederik.sdun@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 21 Sep 2010 05:18:06 -0000
X-Groupsio-MsgNum: 23748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Paul Menzel <paulepanter@users.sourceforge.net> [21.09.2010 00:18]:
> Am Samstag, den 11.09.2010, 20:01 +0200 schrieb Paul Menzel:
>=20
> [=E2=80=A6]
>=20
> > `do_compile()` of `freesmartphone/libfsobasics_git.bb` fails for me
> > reliably since today. As with my other reported failure of gtk+ [1]
> > nothing was changed regarding this recipe in the last days and it worked
> > for me before. Even yesterday because I could build gtk+ which is
> > supposed to happen after `libfsobasics_git.bb`. But several things get
> > build in parallel so that statement could be wrong.
> >=20
> > Minimal compiles fine with EGLIBC and glibc.
> >=20
> > 	$ find . -name execinfo.h
> >=20
> > did not return anything in my build directory.
> >=20
> > 	$ more log.do_compile
> > 	NOTE: make
> > 	make  all-recursive
> > 	make[1]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-d=
ev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c96=
0c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
> > 	Making all in fsobasics
> > 	make[2]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-d=
ev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c96=
0c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/bi=
n/valac -C --basedir .. --vapidir ../vapi --pkg posix --pkg linux --pkg lib=
nl-2.0 --pkg glib-2.0 --pkg gio-2.0 --header fsobasics.h --library fsobasic=
s-2.0  asyncworker.vala inotifier.vala kobjectnotifier.vala libinitexit.val=
a logger.vala netlinknotifier.vala netlinkutils.vala overlay.vala process.v=
ala smartkeyfile.vala syncasync.vala threading.vala types.vala utilities.va=
la
> > 	fsobasics/logger.vala:300.17-300.33: warning: unreachable code detected
> > 		              return "UNKNOWN";
> > 		              ^^^^^^^^^^^^^^^^^
> > 	fsobasics/smartkeyfile.vala:117.13-117.25: warning: unreachable code d=
etected
> > 		          return false;
> > 		          ^^^^^^^^^^^^^
> > 	Compilation succeeded - 2 warning(s)
> > 	touch fsobasics.vala.stamp
> > 	make  all-am
> > 	make[3]: Entering directory `/oe/build-minimal-uclibc/minimal-uclibc-d=
ev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c96=
0c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> > 		CC     asyncworker.lo
> > 		CC     inotifier.lo
> > 	inotifier.c: In function 'fso_framework_inotifier_construct':
> > 	inotifier.c:173:2: warning: passing argument 4 of 'g_hash_table_new_fu=
ll' from incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroy=
Notify' but argument is of type 'void (*)(struct INotifyDelegateHolder *)'
> > 		CC     kobjectnotifier.lo
> > 	kobjectnotifier.c: In function 'fso_framework_base_kobject_notifier_co=
nstruct':
> > 	kobjectnotifier.c:182:2: warning: passing argument 4 of 'g_hash_table_=
new_full' from incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroy=
Notify' but argument is of type 'void (*)(struct GList *)'
> > 	kobjectnotifier.c:183:2: warning: passing argument 4 of 'g_hash_table_=
new_full' from incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroy=
Notify' but argument is of type 'void (*)(struct GList *)'
> > 	kobjectnotifier.c:184:2: warning: passing argument 4 of 'g_hash_table_=
new_full' from incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroy=
Notify' but argument is of type 'void (*)(struct GList *)'
> > 	kobjectnotifier.c:188:52: warning: passing argument 2 of 'bind' from i=
ncompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/sys/socket.h:115:12: note: expected 'const struct soc=
kaddr *' but argument is of type 'struct sockaddr_nl *'
> > 		CC     libinitexit.lo
> > 		CC     logger.lo
> > 		CC     netlinknotifier.lo
> > 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_co=
nstruct':
> > 	netlinknotifier.c:206:2: warning: passing argument 4 of 'g_hash_table_=
new_full' from incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expected 'GDestroy=
Notify' but argument is of type 'void (*)(struct GList *)'
> > 	netlinknotifier.c: In function '_lambda0_':
> > 	netlinknotifier.c:260:162: warning: assignment discards qualifiers fro=
m pointer target type
> > 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_ha=
ndleNetlinkMessage':
> > 	netlinknotifier.c:296:15: warning: assignment makes pointer from integ=
er without a cast
> > 	netlinknotifier.c: In function 'fso_framework_base_netlink_notifier_ha=
ndleMessage':
> > 	netlinknotifier.c:344:56: warning: cast to pointer from integer of dif=
ferent size
> > 	netlinknotifier.c: In function '_fso_framework_base_netlink_notifier_a=
ddMatch':
> > 	netlinknotifier.c:366:56: warning: cast to pointer from integer of dif=
ferent size
> > 	netlinknotifier.c:372:41: warning: cast to pointer from integer of dif=
ferent size
> > 		CC     netlinkutils.lo
> > 		CC     overlay.lo
> > 		CC     process.lo
> > 		CC     smartkeyfile.lo
> > 		CC     syncasync.lo
> > 		CC     threading.lo
> > 	threading.c: In function 'fso_framework_threading_callDelegateOnMainTh=
read':
> > 	threading.c:451:4: warning: passing argument 4 of 'g_idle_add_full' fr=
om incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestro=
yNotify' but argument is of type 'void (*)(struct Block3Data *)'
> > 	threading.c:455:4: warning: passing argument 4 of 'g_idle_add_full' fr=
om incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestro=
yNotify' but argument is of type 'void (*)(struct Block3Data *)'
> > 	threading.c:458:4: warning: passing argument 4 of 'g_idle_add_full' fr=
om incompatible pointer type
> > 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: expected 'GDestro=
yNotify' but argument is of type 'void (*)(struct Block3Data *)'
> > 		CC     types.lo
> > 		CC     utilities.lo
> > 	utilities.c:35:22: fatal error: execinfo.h: No such file or directory
> > 	compilation terminated.
> > 	make[3]: *** [utilities.lo] Error 1
> > 	make[3]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-de=
v/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960=
c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> > 	make[2]: *** [all] Error 2
> > 	make[2]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-de=
v/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960=
c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
> > 	make[1]: *** [all-recursive] Error 1
> > 	make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-de=
v/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960=
c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
> > 	make: *** [all] Error 2
> > 	FATAL: oe_runmake failed
> > 	ERROR: Function do_compile failed
> >=20
> > Does anyone have a clue on how that can be fixed.
>=20
> `execinfo.h` is not available in uClibc and is a =E2=80=9CGNUism=E2=80=9D=
 [2]. The
> dependency in in `linux.vapi` [3] and got included in [4].
>=20
> Unfortunately I do not know how to exclude that. I guess Autotools
> should check if `execinfo.h` is available and only use it if it is. But
> I do not know how to do that. Michael, are those libraries intended to
> be used with uClibc?
>=20
> If this is too much work, how can I exclude this recipe from
> console-image for minimal-uclibc?
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> > [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-Septem=
ber/024097.html
> [2] https://bugs.gentoo.org/show_bug.cgi?id=3D146693#c2
> [3] http://git.freesmartphone.org/?p=3Dcornucopia.git;a=3Dblob;f=3Dlibfso=
basics/vapi/linux.vapi
> [4] http://mail.gnome.org/archives/commits-list/2009-November/msg02423.ht=
ml
Hi,

fso is quit untested with none GNU libcs and we partly depend on it. I
wrote a short patch which add a --enable-no-gnuism switch for configure,
but want to talk to Michael, before commiting it. Could you test it and
report more gnuism in our code? And is possible to get a backtrace with
uClibc which is not gnuism, but available in all none-GNU
implementations?

Regards Frederik


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
IRC: playya @ Freenode, Gimpnet
xmpp: playya@draugr.de
identi.ca: playya

--6TrnltStXW4iwmi0
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="fsobasics_no_gnuism.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/libfsobasics/configure.ac b/libfsobasics/configure.ac
index ba06907..d9d4172 100644
--- a/libfsobasics/configure.ac
+++ b/libfsobasics/configure.ac
@@ -48,6 +48,12 @@ AC_ARG_ENABLE(debug,
   [debug=3D"no"])
 AM_CONDITIONAL( [WANT_DEBUG], [test x"$debug" =3D x"yes"])
=20
+AC_ARG_ENABLE(no_gnuism,
+  [  --enable-no-gnuism        Enable build for none GNU-libc (default=3Dd=
isabled)],
+  [no_gnuism=3D$enableval],
+  [no_gnuism=3D"no"])
+AM_CONDITIONAL( [WANT_NO_GNUISM], [test x"$no_gnuism" =3D x"yes"])
+
 # git version
 GITV=3D`cat ../.git/refs/heads/master || echo "unknown"`
 AC_DEFINE_UNQUOTED([PACKAGE_GITV], ["${GITV}"], [git version])
diff --git a/libfsobasics/fsobasics/Makefile.am b/libfsobasics/fsobasics/Ma=
kefile.am
index 66a7cd7..0fc534a 100644
--- a/libfsobasics/fsobasics/Makefile.am
+++ b/libfsobasics/fsobasics/Makefile.am
@@ -23,6 +23,10 @@ VALAC_ARGS +=3D -g -D DEBUG
 AM_CFLAGS +=3D -ggdb -O0
 endif
=20
+if WANT_NO_GNUISM
+VALAC_ARGS +=3D -D NO_GNUISM
+endif
+
 BUILT_SOURCES =3D fsobasics.vala.stamp
=20
 lib_LTLIBRARIES =3D \
diff --git a/libfsobasics/fsobasics/utilities.vala b/libfsobasics/fsobasics=
/utilities.vala
index 22d107d..6ed5fc8 100644
--- a/libfsobasics/fsobasics/utilities.vala
+++ b/libfsobasics/fsobasics/utilities.vala
@@ -420,6 +420,9 @@ namespace FsoFramework { namespace Utility {
     public string[] createBacktrace()
     {
         string[] result =3D new string[] { };
+#if NO_GNUISM
+        result +=3D "Backtrace not support for none GNU libcs";
+#else
         void* buffer =3D malloc0( BACKTRACE_SIZE * sizeof(string) );
         var size =3D Linux.backtrace( buffer, BACKTRACE_SIZE );
         string[] symbols =3D Linux.backtrace_symbols( buffer, size );
@@ -429,6 +432,7 @@ namespace FsoFramework { namespace Utility {
             result +=3D "%s\n".printf( symbols[i] );
         }
         result +=3D "--- END BACKTRACE ---\n";
+#endif
         return result;
     }
=20

--6TrnltStXW4iwmi0--

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEARECAAYFAkyYP/sACgkQvbwBzXsbjyqGHACgoWj4wP2twlAXMSfh4NWsH19C
dQUAmJOg+myVzQyeK0/C/6lIu146PjQ=
=ieUZ
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
