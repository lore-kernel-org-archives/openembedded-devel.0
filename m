Received: from [209.85.198.236] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LjICz-00022K-41
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 20:10:47 +0100
Received: by rv-out-0506.google.com with SMTP id g9so1973517rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 12:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=nN7SI3mQMhU3+thY2uGUQkbYyY8TcnIjSydQonGeRr8=;
	b=S4SrZ9JJhgVc7gcQamfMFiBi3bumqColCEFsH/NvitIaytLbBP9pvHFNbDjQ5pFkes
	t6qYux2AhTK/1A9v5Dp6ud/edLEH7ZQNdSxNgLNmAdEVgiIByJiVlfnBMlegVag/4JxL
	V8aHld/LqwtYnaBU2GjD1GMKxW9/8r8PV6CZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Joc6gCZseQqx8gUEe3v7kv5vIAK1l+xC7OpdrXgfm0gmrz2NAvkhI48AYqpdpUboao
	uhtTqbLBVOcTqQfun1ZRe6YtPIt04mTmZNXsqNMTCojyaevQo6nCpFA0qqbYHzcMLEL6
	OqQ8A/8dZb0w1gwZJUwgjYXWlCYRJamc+FCgk=
MIME-Version: 1.0
Received: by 10.140.157.5 with SMTP id f5mr2457722rve.122.1237230605159; Mon, 
	16 Mar 2009 12:10:05 -0700 (PDT)
Date: Mon, 16 Mar 2009 15:10:05 -0400
Message-ID: <f96d234e0903161210q37ccc45cyc0dffe95b8fe302@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.236
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2009-03-09 to 2009-03-16
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
X-List-Received-Date: Mon, 16 Mar 2009 19:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

OE weekly changelog 2009-03-09 to 2009-03-16

Chris Larson (1):
      enterprise.conf: combine with user-specified BBMASK instead of
overwriting it

Cliff Brake (1):

Denys Dmytriyenko (2):
      minimal.conf: make IMAGE_FSTYPES a weak assignment to allow overwriting
      meta-toolchain: use DEPLOY_DIR instead of TMPDIR/deploy for consistency

Florian Boor (3):
      gpe-scap: Add 1.4 fixing MIPS target support.
      gpe-scap: bump PV of svn recipe
      checksums.ini: add gpe-scap 1.4

Frans Meulenbroeks (14):
      opkg: upgraded to R204: this fixes the endless loop in opkg
upgrade coreutils
      proftpd: yet another ftp daemon; created recipe
      zope: added __init__.py* files to python-zopeinterface, otherwie
the package does not work!
      python-coherence_0.6.0.bb: removed (should have been moved to
0.6.2 but a new 0.6.2 was made, so dropping this one now)
      python-coherence: updated DEPENDS (removed unneeded zope, added
a few missing ones)
      wt3: created: wt 3.* (including 2.99); retain package wt (which
is for 2.*) as 2.* and 3.* are not compatible
      angstrom/build-feeds.sh: added proftpd and wt3 to the feed
      proftpd: previous recipe was no good; fixed it; this one is
without pam and might require some more chown's
      proftpd: added missing make.patch
      proftpd: fixed paths

Graeme Gregory (1):
      checksums.ini : add new checksums and fix checksum for refreshed busybox

Jader H. Silva (1):
      Kernel bbclass "too many open files" bugfix

John Lee (1):
      sane-srcrevs: update fso-abyss, libgsm0710 and libgsm0710mux rev.

Khem Raj (1):
      checksums.ini: Update checksum for busybox-1.13.2-modprobe.patch

Koen Kooi (9):
      checksums.ini: add more checksums
      checksums: add ti codeccs
      gstreamer-ti: bump PR
      dm355-leopard: add board file for the dm355 leopard board
      u-boot 1.2.0: add support for dm355-leopard
      checksums.ini: merge checksums from mamona

Lukas Gorris (1):
      linux-msm7xxxx: update htcvogue defconfig update srcrevs use
correct branch for htcblackstone

Mike Westerhof (1):
      thttpd: disable PARALLEL_MAKE due to build failures

Philip Balister (1):
      linux-davinci_git.bb : Comment out DEFAULT_PREFERENCE = "-1" for now.

Robert Schuster (13):
      jamvm: Updated to 1.5.2.
      jamvm 1.4.5: Increased PR.
      jamvm 1.5.0: Increased PR.
      jamvm-native: Updated to 1.5.2.
      checksums.ini: Removed jamvm 1.5.1 entries, added 1.5.2 one.
      jamvm-native 1.5.2: Set PR to r0.
      java-native.bbclass: New file.
      native.bbclass: Remove java specific stuff from do_stage again.
      antlr 2.7.7: Use java-native bbclass.
      llvm-native 2.5: New recipe.
      checksums.ini: Added cmake 2.6.3 entry.
      cmake-native 2.6.3: New recipe.
      java.bbclass: Make oe_makeclasspath more flexible (partly by
Marcin Juszkiewicz <hrw@openembedded.org>)

Roger Monk (2):
      ti-codec-combos: Update recipe to use ti software download site
      ti-codec-combos: Combo Build Cleanup and additional html docs in package

Stefan Schmidt (6):
      preferred-om-2008-versions.inc: Update to version that are available
      checksums.ini: Add sums for connman packages. (Changed location)
      preferred-om-2008-versions.inc: Update more versions to available ones
      connman: Moved from moblin.org to kernel.org
      connman: Add latest release

Steffen Sledz (2):
      linux-2.6.24: PCI config delay patch for OXNAS machine
      linux-2.6.24: patch for maximum PCI address range for OXNAS machine

Tom Rini (1):
      Revert "module-base: Fix the test on KERNEL_OBJECT_SUFFIX"

woglinde (9):
      ncurses: set LEAD_SONAME to libncurses.so.5 and bump PR
      chinook-compat: pin libtool revision
      libsdl-directfb: added updated version 1.2.11
      chinook-compat: pin version of libsdl-directfb to 1.2.11
      checksums.ini: add sums for rhino
      chinook-compat: pin to older avahi version
      checksums.ini: add sums for icedtea6-1.3.1
      checksums.ini: add sums for openjdk-6-src-b12-28_aug_2008
      checksums.ini:

Bugs fixed:

bug_id resolution        short_desc
3232 FIXED       icecc-create-env.sh is adding cc1 and cc1plus to
wrong directory
5058 FIXED       busybox-1.13.2-r16: task do_fetch - md5 error

Bugs opened:

bug_id resolution        short_desc
5068     ffmpeg doesnt build


-- 
=======================
Cliff Brake
http://bec-systems.com


