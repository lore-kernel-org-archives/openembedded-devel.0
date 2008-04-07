Received: from [64.233.170.187] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JifEb-0008NI-6t
	for openembedded-devel@openembedded.org; Mon, 07 Apr 2008 02:29:17 +0200
Received: by rn-out-0910.google.com with SMTP id i24so1061957rng.0
	for <openembedded-devel@openembedded.org>;
	Sun, 06 Apr 2008 17:29:15 -0700 (PDT)
Received: by 10.143.3.4 with SMTP id f4mr725429wfi.343.1207528154971;
	Sun, 06 Apr 2008 17:29:14 -0700 (PDT)
Received: from ?192.168.1.64? ( [71.146.34.138])
	by mx.google.com with ESMTPS id 24sm16924218wff.10.2008.04.06.17.29.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Apr 2008 17:29:14 -0700 (PDT)
Message-ID: <47F96AD4.8010502@gmail.com>
Date: Sun, 06 Apr 2008 17:29:08 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.6
OpenPGP: id=A57A7A6E
Subject: Error building glib-2.0-2.16.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2008 00:29:17 -0000
X-Groupsio-MsgNum: 4918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig556F8020FD9BCB0C09479D58"

--------------enig556F8020FD9BCB0C09479D58
Content-Type: multipart/mixed;
 boundary="------------060207080905000506060703"

--------------060207080905000506060703
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I am hitting this error reported here

http://bugzilla.gnome.org/show_bug.cgi?id=3D522335

In OE too. Two options, first is to upgrade glib to 2.16.2 and second=20
option to backport the patch.

I have tried backporting the patch and it works ok for me. Attached is=20
the patch for this. I have left the upgrade for 2.16.2 for another day.

I think we will need both solutions :)

OK?


Thanks

-Khem
#
# old_revision [ac891e557582299a2c482837fc1a4741608997eb]
#
# add_file "packages/glib-2.0/glib-2.0-2.16.1/hurd-arg-max.patch"
#  content [73f93c002ddc4e9a8bacabba9bf1e817609f773c]
#=20
# patch "packages/glib-2.0/glib-2.0_2.16.1.bb"
#  from [3a48d903a74285a67c66bab7fd96be2bf1e1270a]
#    to [2facce514edcf565a81d088b6aa171df585c7adc]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glib-2.0/glib-2.0-2.16.1/hurd-arg-max.patch	73f93c002ddc4e9a8=
bacabba9bf1e817609f773c
+++ packages/glib-2.0/glib-2.0-2.16.1/hurd-arg-max.patch	73f93c002ddc4e9a8=
bacabba9bf1e817609f773c
@@ -0,0 +1,76 @@
+Source: http://bugzilla.gnome.org/show_bug.cgi?id=3D522335
+
+This patch fixes the following error.
+
+| make[4]: Entering directory `/home/khem/oe/build/eglibc/tmp-qemuarm/wor=
k/armv5te-angstrom-linux-gnueabi/glib-2.0-2.16.1-r3/glib-2.16.1/glib'
+| if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm9=
26ej-s -DHAVE_CONFIG_H -I. -I. -I..  -I..  -DG_LOG_DOMAIN=3D\"GLib\" -DG_DI=
SABLE_CAST_CHECKS -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DG_DISABLE_DEPRECA=
TED -DGLIB_COMPILATION -DPCRE_STATIC -isystem/home/khem/oe/build/eglibc/tmp=
-qemuarm/staging/arm-angstrom-linux-gnueabi/usr/include -pthread  -isystem/=
home/khem/oe/build/eglibc/tmp-qemuarm/staging/arm-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers=
 -Os -Wall -MT gtester.o -MD -MP -MF ".deps/gtester.Tpo" -c -o gtester.o gt=
ester.c; \
+| =09then mv -f ".deps/gtester.Tpo" ".deps/gtester.Po"; else rm -f ".deps=
/gtester.Tpo"; exit 1; fi
+| gtester.c: In function 'launch_test_binary':
+| gtester.c:276: error: 'ARG_MAX' undeclared (first use in this function)
+| gtester.c:276: error: (Each undeclared identifier is reported only once
+| gtester.c:276: error: for each function it appears in.)
+| gtester.c:276: warning: unused variable 'argv'
+| make[4]: *** [gtester.o] Error 1
+
+
+Index: glib-2.16.1/glib/gtester.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- glib-2.16.1.orig/glib/gtester.c	(Revision 6750)
++++ glib-2.16.1/glib/gtester.c	(Arbeitskopie)
+@@ -273,7 +273,8 @@
+   GTestLogBuffer *tlb;
+   GSList *slist, *free_list =3D NULL;
+   GError *error =3D NULL;
+-  const gchar *argv[ARG_MAX];
++  int argc =3D 0;
++  const gchar **argv;
+   GPid pid =3D 0;
+   gint report_pipe[2] =3D { -1, -1 };
+   guint child_report_cb_id =3D 0;
+@@ -289,7 +290,34 @@
+       return FALSE;
+     }
+=20
++  /* setup argc */
++  for (slist =3D subtest_args; slist; slist =3D slist->next)
++    argc++;
++  /* argc++; */
++  if (subtest_quiet)
++    argc++;
++  if (subtest_verbose)
++    argc++;
++  if (!subtest_mode_fatal)
++    argc++;
++  if (subtest_mode_quick)
++    argc++;
++  else
++    argc++;
++  if (subtest_mode_perf)
++    argc++;
++  if (gtester_list_tests)
++    argc++;
++  if (subtest_seedstr)
++    argc++;
++  argc++;
++  if (skip_tests)
++    argc++;
++  for (slist =3D subtest_paths; slist; slist =3D slist->next)
++    argc++;
++
+   /* setup argv */
++  argv =3D g_malloc ((argc + 1) * sizeof(gchar *));
+   argv[i++] =3D binary;
+   for (slist =3D subtest_args; slist; slist =3D slist->next)
+     argv[i++] =3D (gchar*) slist->data;
+@@ -343,8 +371,10 @@
+       else
+         g_warning ("Failed to execute test binary: %s: %s", argv[0], err=
or->message);
+       g_clear_error (&error);
++      g_free (argv);
+       return FALSE;
+     }
++  g_free (argv);
+=20
+   subtest_running =3D TRUE;
+   subtest_io_pending =3D TRUE;
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glib-2.0/glib-2.0_2.16.1.bb	3a48d903a74285a67c66bab7fd96be2bf=
1e1270a
+++ packages/glib-2.0/glib-2.0_2.16.1.bb	2facce514edcf565a81d088b6aa171df5=
85c7adc
@@ -1,9 +1,10 @@ require glib.inc
 require glib.inc
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/glib/2.16/glib-${PV}.=
tar.bz2 \
            file://glibconfig-sysdefs.h \
            file://configure-libtool.patch;patch=3D1 \
            file://gcc-4.2-inline-fix.patch;patch=3D1 \
+           file://hurd-arg-max.patch;patch=3D1 \
           "

--------------060207080905000506060703--

--------------enig556F8020FD9BCB0C09479D58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH+WrXHnJKy6V6em4RArZMAKChYI10wj2ALtDpxE7TiHeIhRnLNACeOaQL
NAkgDZApfIhr30KjIUZXSvw=
=MZeN
-----END PGP SIGNATURE-----

--------------enig556F8020FD9BCB0C09479D58--
