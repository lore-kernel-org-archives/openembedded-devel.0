Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BB3396DEC8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2013 10:32:17 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Vpbep-0004Ef-RL for openembedded-devel@lists.openembedded.org;
	Sun, 08 Dec 2013 11:32:15 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2013 11:32:15 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2013 11:32:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 Dec 2013 11:34:16 +0100
Message-ID: <l81hqp$jma$1@ger.gmane.org>
References: <1386455381-40913-1-git-send-email-ulf@emagii.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386455381-40913-1-git-send-email-ulf@emagii.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] xfconfig: use sysroot and target perl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Dec 2013 10:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson schreef op 07-12-13 23:29:
> xfconf-4.10.0 does not use OE sysroot as is. --with-sysroot=yes will make
> configure run CC --print-sysroot and use that.
> 
> When searching the PATH for perl, no target perl is found, since PATH
> does not contain any reference. Instead native perl is found, and if
> certain perl packages are installed on the host machine, the xfconf perl
> support is enabled which may cause the build to fail on 64 bit hosts. If
> the perl packages are not installed on the host, then perl support in
> xfconf is disabled, and the xfconf build will succeed, even on 64 bit
> hosts.
> 
> If native perl is found, and the perl packages are available on the host,
> the perl support is enabled.
> 
> Since native perl is used, the native linker is used to link the 
> resulting *target* code.
> 
> The perl support requires some libraries, which are built for the
> target. If the host is 64 bit (x86_64) and the target is 32 bit (ARM?), 
> there is a mismatch which is detected by the linker, and the libraries
> found are rejected.
> 
> If the host does not have the correct libraries, then the xfconf build
> fails. If the host has the correct libraries, then the linker will try to
> link host libraries with the target application.
> 
> The patch will define PERL as the target perl. This means that configure
> will look for the required perl packages in the target sysroot, instead
> of in the native filesystem.
> 
> The patch has been tested in Angstrom master, which does not build the
> required perl packages, and thus perl support in xfconf is disabled, and
> the build succeeds.
> 
> A simpler way to do this, proposed by Charles Ash <ashcharles@gmail.com> 
> is to simply disable the perl-support in xfconf. This patch will be
> better, if ever the support for the needed perl packages is added to the
> OpenEmbedded/Angstrom build.
> 
> 
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com> --- 
> meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb |    6 +++++- 1 file
> changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb index 4ea2b88..6d5bf57
> 100644 --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb +++
> b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb @@ -2,10 +2,14 @@
> DESCRIPTION = "Xfce configuration daemon and utilities" SECTION =
> "x11/wm" LICENSE = "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" -DEPENDS =
> "dbus-glib libxfce4util perl-native" +DEPENDS = "dbus-glib libxfce4util
> perl" +PR="r1"

PR is deprecated and shouldn't be used anymore

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSpEsoMkyGM64RGpERAlIhAJ4kMnyd5FMTUs9Cn4Vq7h9pSh+UOACgk9cw
eLnKna8CgytIcQ2+jalZA7I=
=5hcf
-----END PGP SIGNATURE-----


