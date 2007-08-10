Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IJVZ0-0000m2-I5
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2007 16:34:06 +0200
Received: by fk-out-0910.google.com with SMTP id 18so731301fks
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2007 07:31:17 -0700 (PDT)
Received: by 10.82.158.12 with SMTP id g12mr623507bue.1186756277462;
	Fri, 10 Aug 2007 07:31:17 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Fri, 10 Aug 2007 07:31:17 -0700 (PDT)
Message-ID: <74d0deb30708100731y124e3931g2e5dde6749d0cce3@mail.gmail.com>
Date: Fri, 10 Aug 2007 16:31:17 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: -dbg packages in image confusion
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
X-List-Received-Date: Fri, 10 Aug 2007 14:34:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

so the other day I noticed some debug packages that ended up in my
angstrom-x11-images' rootfs:

	$ alias ipkg-cl staging/i686-linux/bin/ipkg-cl -f
work/magician-angstrom-linux-gnueabi/angstrom-x11-image-1.0-r11/temp/ipkg.conf
-o rootfs
	$ ipkg-cl list_installed *-dbg
	glibc-dbg - 2.5-r6 -
	gpe-login-dbg - 0.90-r1 -
	gtk+-dbg - 2.10.14-r3 -
	libcairo-dbg - 1.4.10-r0 -
	libfreetype-dbg - 2.3.4-r2 -
	libglib-2.0-dbg - 2.12.12-r2 -
	libx11-dbg - 1:1.1.2-r1 -
	libxcb-dbg - 1.0+git-r0 -
	libxcursor-dbg - 1:1.1.8-r2 -
	libxdmcp-dbg - 1:1.0.2-r1 -
	libxext-dbg - 1:1.0.3-r1 -
	libxft-dbg - 1:2.1.12-r1 -
	libxinerama-dbg - 1:1.0.2-r3 -
	libxrandr-dbg - 1:1.2.1-r1 -
	libxrender-dbg - 1:0.9.2-r1 -
	pango-dbg - 1.16.4-r0 -
	Successfully terminated.

The culprit seems to be gpe-login-dbg. It pulls in the rest of those
packages via RRECOMMENDS.

	$ ipkg-cl remove gpe-login-dbg
	Nothing to be done
	Successfully terminated.
	Collected errors:
	Package gpe-login-dbg is depended upon by packages:
	        gpe-session-scripts
	These might cease to work if package gpe-login-dbg is removed.

	You can force removal of this package with -force-depends.
	You can force removal of this package and its dependents
	with -force-removal-of-dependent-packages or -recursive
	or by setting option force_removal_of_dependent_packages
	in ipkg.conf.

Ah, why would gpe-session-scripts depends on gpe-login-dbg?
Let's see ...

	$ ipkg-cl info gpe-session-scripts
	Package: gpe-session-scripts
	Version: 0.67-r10
	Depends: matchbox-panel, matchbox-desktop, matchbox-common,
gpe-session-starter, xtscal, gpe-question,
matchbox-applet-inputmanager, xmodmap, xdpyinfo, xserver-common,
ipaq-sleep
	Status: install ok installed
	Section: gpe
	Architecture: magician
	maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
	MD5Sum: f0a845ab2aafe044ba5b04dff3ea0193
	Filename: gpe-session-scripts_0.67-r10_magician.ipk
	Source: http://gpe.linuxtogo.org/download/source/gpe-session-scripts-0.67.tar.gz
file://matchbox-session file://disable-composite.xsettings
	Description: GPE session startup scripts

	Successfully terminated.

	$ grep "Package: gpe-session-scripts" deploy/glibc/ipk/magician/Packages -A 11
	Package: gpe-session-scripts
	Version: 0.67-r10
	Depends: matchbox-panel, matchbox-desktop, matchbox-common,
gpe-session-starter, xtscal, gpe-question,
matchbox-applet-inputmanager, xmodmap, xdpyinfo, xserver-common,
ipaq-sleep
	Section: gpe
	Architecture: magician
	Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
	MD5Sum: b037b9254e04eb977da32801abd96eed
	Size: 6408
	Filename: gpe-session-scripts_0.67-r10_magician.ipk
	Source: http://gpe.linuxtogo.org/download/source/gpe-session-scripts-0.67.tar.gz
file://matchbox-session file://disable-composite.xsettings
	Description: GPE session startup scripts

... it doesn't! But still ipkg is convinced it does:

	$ ipkg-cl remove gpe-login-dbg -recursive
	Removing package angstrom-gpe-task-base from root...
	Removing package gpe-session-scripts from root...
	(offline root mode: not running gpe-session-scripts.postrm)
	Removing package gpe-login-dbg from root...
	Successfully terminated.

Any idea what could have happened here?
Rebuilding gpe-login, gpe-session-scripts or angstrom-x11-image doesn't help.

regards
Philipp


