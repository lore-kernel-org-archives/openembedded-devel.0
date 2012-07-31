Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SwC4S-0004fP-EJ for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 15:01:08 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SwBtD-0008Cs-8J for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 14:49:31 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 14:49:31 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 14:49:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 31 Jul 2012 14:49:27 +0200
Message-ID: <jv8k89$7sr$1@dough.gmane.org>
References: <1343048025-13347-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQZLyrO62ndATu02ds7+NWQZPdmVJ4+kwZU012iJyQV3g@mail.gmail.com>
	<20120731120912.GV3261@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <20120731120912.GV3261@jama.jama.net>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-oe] [PATCH] fuse: Fix-build-with-automake-1.12.1
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
X-List-Received-Date: Tue, 31 Jul 2012 13:01:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-07-12 14:09, Martin Jansa schreef:
> On Tue, Jul 31, 2012 at 02:03:05PM +0200, Andreas Müller wrote:
>> On Mon, Jul 23, 2012 at 2:53 PM, Andreas Müller 
>> <schnitzeltony@googlemail.com> wrote:
>>> error message was: | make[2]: ../mkinstalldirs: Command not found |
>>> make[2]: *** [install-exec-local] Error 127 | make[2]: *** Waiting
>>> for unfinished jobs.... | make[2]: ../mkinstalldirs: Command not
>>> found | make[2]: *** [install-data-local] Error 127
>>> 
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
>>> .../0001-Fix-install-from-out-of-tree-build.patch  |   33 +++++++++ 
>>> .../0002-Fix-build-with-automake-1.12.1.patch      |   73
>>> ++++++++++++++++++++ meta-oe/recipes-support/fuse/fuse_2.8.6.bb
>>> |    4 +- 3 files changed, 109 insertions(+), 1 deletions(-) create
>>> mode 100644
>>> meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out-of-tree-build.patch
>>>
>>> 
create mode 100644
meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-automake-1.12.1.patch
>>> 
>>> diff --git
>>> a/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out-of-tree-build.patch
>>> b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out-of-tree-build.patch
>>>
>>> 
new file mode 100644
>>> index 0000000..7f01227 --- /dev/null +++
>>> b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out-of-tree-build.patch
>>>
>>> 
@@ -0,0 +1,33 @@
>>> +From eac25997edf1de69130e6a8c7e72b058daa0bb5d Mon Sep 17 00:00:00
>>> 2001 +From: =?UTF-8?q?Andreas=20M=C3=BCller?=
>>> <schnitzeltony@googlemail.com> +Date: Mon, 23 Jul 2012 14:37:13
>>> +0200 +Subject: [PATCH 1/2] Fix install from out-of-tree build 
>>> +MIME-Version: 1.0 +Content-Type: text/plain; charset=UTF-8 
>>> +Content-Transfer-Encoding: 8bit + +Upstream-status: backport of [1] 
>>> + +[1]
>>> http://fuse.git.sourceforge.net/git/gitweb.cgi?p=fuse/fuse;a=commit;h=fd4a816823133dd66de60b3a017e1f0442486d1f
>>>
>>> 
+
>>> +Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> +--- +
>>> util/Makefile.am |    2 +- + 1 files changed, 1 insertions(+), 1
>>> deletions(-) + +diff --git a/util/Makefile.am b/util/Makefile.am 
>>> +index b9bcdaa..b627da1 100644 +--- a/util/Makefile.am ++++
>>> b/util/Makefile.am +@@ -29,7 +29,7 @@ INIT_D_PATH = @INIT_D_PATH@ + +
>>> install-exec-local: +       $(mkdir_p) $(DESTDIR)$(MOUNT_FUSE_PATH) 
>>> +-      $(INSTALL_PROGRAM) $(srcdir)/mount.fuse
>>> $(DESTDIR)$(MOUNT_FUSE_PATH)/mount.fuse ++      $(INSTALL_PROGRAM)
>>> $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_PATH)/mount.fuse +
>>> $(mkdir_p) $(DESTDIR)$(INIT_D_PATH) +       $(INSTALL_SCRIPT)
>>> $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH)/fuse +       @if test
>>> -x /usr/sbin/update-rc.d; then \ +-- +1.7.6.5 + diff --git
>>> a/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-automake-1.12.1.patch
>>> b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-automake-1.12.1.patch
>>>
>>> 
new file mode 100644
>>> index 0000000..358e77c --- /dev/null +++
>>> b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-automake-1.12.1.patch
>>>
>>> 
@@ -0,0 +1,73 @@
>>> +From 05bbacf18bcf1a66973297bcbb9a284af6ce654f Mon Sep 17 00:00:00
>>> 2001 +From: =?UTF-8?q?Andreas=20M=C3=BCller?=
>>> <schnitzeltony@googlemail.com> +Date: Mon, 23 Jul 2012 14:43:18
>>> +0200 +Subject: [PATCH 2/2] Fix build with automake >= 1.12.1 
>>> +MIME-Version: 1.0 +Content-Type: text/plain; charset=UTF-8 
>>> +Content-Transfer-Encoding: 8bit + +Upstream-status: backport of [1] 
>>> + +[1]
>>> http://fuse.git.sourceforge.net/git/gitweb.cgi?p=fuse/fuse;a=commit;h=a6a8bcbeefd6c9e9cf1c6c6f5e8224aff2beb51b
>>>
>>> 
+
>>> +Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> +--- +
>>> configure.in     |    2 ++ + util/Makefile.am |    8 ++++---- + 2
>>> files changed, 6 insertions(+), 4 deletions(-) + +diff --git
>>> a/configure.in b/configure.in +index 9604d5e..c0e4fc6 100644 +---
>>> a/configure.in ++++ b/configure.in +@@ -1,4 +1,5 @@ + AC_INIT(fuse,
>>> 2.8.6) ++AC_PREREQ(2.59d) + AC_CONFIG_MACRO_DIR([m4]) +
>>> AC_CANONICAL_TARGET + AM_INIT_AUTOMAKE +@@ -6,6 +7,7 @@
>>> AM_CONFIG_HEADER(include/config.h) + + AC_PROG_LIBTOOL + AC_PROG_CC 
>>> ++AC_PROG_MKDIR_P + AM_PROG_CC_C_O + + # compatibility for automake <
>>> 1.8 +diff --git a/util/Makefile.am b/util/Makefile.am +index
>>> b627da1..4d91e1a 100644 +--- a/util/Makefile.am ++++
>>> b/util/Makefile.am +@@ -16,7 +16,7 @@ ulockmgr_server_LDFLAGS =
>>> -pthread + install-exec-hook: +       -chmod u+s
>>> $(DESTDIR)$(bindir)/fusermount +       @if test ! -e
>>> $(DESTDIR)/dev/fuse; then \ +-              $(mkdir_p)
>>> $(DESTDIR)/dev; \ ++              $(MKDIR_P) $(DESTDIR)/dev; \ +
>>> echo "mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || true"; \ +
>>> mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || true; \ +       fi +@@
>>> -28,9 +28,9 @@ UDEV_RULES_PATH = @UDEV_RULES_PATH@ + INIT_D_PATH =
>>> @INIT_D_PATH@ + + install-exec-local: +-      $(mkdir_p)
>>> $(DESTDIR)$(MOUNT_FUSE_PATH) ++      $(MKDIR_P)
>>> $(DESTDIR)$(MOUNT_FUSE_PATH) +       $(INSTALL_PROGRAM)
>>> $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_PATH)/mount.fuse +-
>>> $(mkdir_p) $(DESTDIR)$(INIT_D_PATH) ++      $(MKDIR_P)
>>> $(DESTDIR)$(INIT_D_PATH) +       $(INSTALL_SCRIPT)
>>> $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH)/fuse +       @if test
>>> -x /usr/sbin/update-rc.d; then \ +               echo
>>> "/usr/sbin/update-rc.d fuse start 34 S . start 41 0 6 . || true"; \ 
>>> +@@ -38,7 +38,7 @@ install-exec-local: +       fi + +
>>> install-data-local: +-      $(mkdir_p) $(DESTDIR)$(UDEV_RULES_PATH) 
>>> ++      $(MKDIR_P) $(DESTDIR)$(UDEV_RULES_PATH) +
>>> $(INSTALL_DATA) $(srcdir)/udev.rules
>>> $(DESTDIR)$(UDEV_RULES_PATH)/99-fuse.rules + + uninstall-local: +-- 
>>> +1.7.6.5 + diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
>>> b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb index 15e9206..a7605da
>>> 100644 --- a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb +++
>>> b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb @@ -5,11 +5,13 @@
>>> LICENSE = "GPLv2&LGPLv2" LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \ 
>>> file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
>>> 
>>> -PR = "r1" +PR = "r2"
>>> 
>>> SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \ 
>>> file://define_GNU_SOURCE.patch \ file://gold-unversioned-symbol.patch
>>> \ +           file://0001-Fix-install-from-out-of-tree-build.patch \ 
>>> +           file://0002-Fix-build-with-automake-1.12.1.patch \ "
>>> 
>>> SRC_URI[md5sum] = "eaa32c8cef56a981656a786f258a002a" -- 1.7.6.5
>>> 
>> Any comments on this one?
> 
> Probably overlooked because of missing [meta-oe] prefix, but looks good 
> to me. (trying to add meta-oe to subject if pw finds it now :)).
> 
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

It wasn't overlooked, I solved it differently by updating fuse to 2.9.x. I
wanted to try a final rebuild before posting the patch, but then oe-core
went crazy and I couldn't build anything for the past weeks. When I get it
working again I'll post the 2.9.x patch.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQF9RXMkyGM64RGpERAmqzAJ49Awr4tnE7dYCv3XngsC8J2IgGvQCfUwm9
TCL68/RsdHaNtU23BhuGJR0=
=Q9o+
-----END PGP SIGNATURE-----



