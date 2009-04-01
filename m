Received: from [212.227.126.171] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joerg@hakker.de>) id 1Lp6T2-0001dC-KX
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 21:51:29 +0200
Received: from tristan.localnet (port-92-202-38-39.dynamic.qsc.de
	[92.202.38.39])
	by mrelayeu.kundenserver.de (node=mrelayeu4) with ESMTP (Nemesis)
	id 0ML21M-1Lp6Qj2gpX-0007kV; Wed, 01 Apr 2009 21:48:58 +0200
From: =?utf-8?q?J=C3=B6rg_Bakker?= <joerg@hakker.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Apr 2009 21:48:56 +0200
User-Agent: KMail/1.11.1 (Linux/2.6.27-11-generic; KDE/4.2.1; i686; ; )
References: <200903302141.30822.joerg@hakker.de>
	<19c1b8a90903311441o492174d0v9df11b339a7e0a3d@mail.gmail.com>
In-Reply-To: <19c1b8a90903311441o492174d0v9df11b339a7e0a3d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904012148.56556.joerg@hakker.de>
X-Provags-ID: V01U2FsdGVkX18dgTqAIVr9ycBnwI7PVd31Hq4Fk3dNdnEhBka
	58JddAtP1R587iQEnYCvwF0IHhpAOyBlsO4iEAzCETlJ6uC5BG
	M2tmXakOFdoz2qm6/octw==
X-SA-Exim-Connect-IP: 212.227.126.171
X-SA-Exim-Mail-From: joerg@hakker.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Wed, 01 Apr 2009 19:51:30 -0000
X-Groupsio-MsgNum: 8949
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_oU80JVGK51cGt0o"

--Boundary-00=_oU80JVGK51cGt0o
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yes, you're right. Changed patch is attached.

Thanks for the hint.

Am Dienstag 31 M=C3=A4rz 2009 23:41:03 schrieb Khem Raj:
> Thanks for the patch something like S_IRUSR | S_IWUSR instead of 0666
> would be better.
>
> On 3/30/09, J=C3=B6rg Bakker <joerg@hakker.de> wrote:
> > Building gcc-cross-kernel-3.3.4 stops with the following error:
> > | In function 'open',
> > |
> > |     inlined from 'collect_execute' at
> >
> > /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gcc=
=2Dc
> >ross-
> >
> > kernel-3.3.4-3.3.4-r9/gcc-3.3.4/gcc/collect2.c:1575:
> > | /usr/include/bits/fcntl2.h:51: error: call to '__open_missing_mode'
> >
> > declared
> > with attribute error: open with O_CREAT in second argument needs 3
> > arguments
> >
> > | make[1]: *** [collect2.o] Error 1
> > |
> > | make[1]: *** Waiting for unfinished jobs....
> > |
> > | done
> >
> > ....
> >
> > | make[1]: Leaving directory
> >
> > `/home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gc=
c-
> > cross-kernel-3.3.4-3.3.4-r9/gcc-3.3.4/build.i686-linux.i586-angstrom-
> > linux/gcc'
> >
> > | make: *** [all-gcc] Error 2
> > | FATAL: oe_runmake failed
> >
> > NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-
> > angstrom-linux/gcc-cross-kernel-3.3.4-3.3.4-r9/temp/log.do_compile.17555
> > NOTE: package gcc-cross-kernel-3.3.4-3.3.4-r9: task do_compile: failed
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of
> > /home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-
> > cross-kernel-3.3.4_3.3.4.bb do_compile failed
> > ERROR: Task 7
> > (/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-
> > cross-kernel-3.3.4_3.3.4.bb, do_compile) failed
> > NOTE: Tasks Summary: Attempted 271 tasks of which 265 didn't need to be
> > rerun
> > and 1 failed.
> > ERROR:
> > '/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-cross-
> > kernel-3.3.4_3.3.4.bb' failed
> >
> > OE Build Configuration:
> > BB_VERSION        =3D "1.8.13"
> > METADATA_BRANCH   =3D "org.openembedded.dev"
> > METADATA_REVISION =3D "8f8efbe43a7f28802d066f7f83915e8fbd0d4cc2"
> > TARGET_ARCH       =3D "i586"
> > TARGET_OS         =3D "linux"
> > MACHINE           =3D "epia"
> > DISTRO            =3D "angstrom"
> > DISTRO_VERSION    =3D "2009.X-test-20090329"
> >
> > The attached patch fixes this.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--Boundary-00=_oU80JVGK51cGt0o
Content-Type: text/x-patch;
  charset="UTF-8";
  name="gcc-cross-kernel-334.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="gcc-cross-kernel-334.patch"

diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch build/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch
--- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch	1970-01-01 01:00:00.000000000 +0100
+++ build/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch	2009-03-21 17:34:07.000000000 +0100
@@ -0,0 +1,11 @@
+--- gcc-3.3.4/gcc/collect2.c.orig	2009-03-21 17:26:11.000000000 +0100
++++ gcc-3.3.4/gcc/collect2.c	2009-03-21 17:26:47.000000000 +0100
+@@ -1572,7 +1572,7 @@
+   if (redir)
+     {
+       /* Open response file.  */
+-      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT);
++      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IWUSR);
+ 
+       /* Duplicate the stdout and stderr file handles
+ 	 so they can be restored later.  */
diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb
--- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 10:44:02.000000000 +0100
+++ build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 17:39:11.000000000 +0100
@@ -1,2 +1,3 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-cross-kernel.inc
+SRC_URI_append = "file://gcc334-collect2_file_open_args.patch;patch=1"

--Boundary-00=_oU80JVGK51cGt0o--
