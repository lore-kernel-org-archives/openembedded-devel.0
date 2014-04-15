Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4F26665E64
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 08:23:44 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WZyec-00050b-Px for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2014 10:23:42 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 10:23:42 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 10:23:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Apr 2014 10:23:33 +0200
Message-ID: <liiqa4$7f4$1@ger.gmane.org>
References: <cover.1397545082.git.jackie.huang@windriver.com>
	<98585e4f0a807976da5b7fae817d2ed1bf5b012c.1397545082.git.jackie.huang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <98585e4f0a807976da5b7fae817d2ed1bf5b012c.1397545082.git.jackie.huang@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 2/3] gd: add perl to RDEPENDS
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
X-List-Received-Date: Tue, 15 Apr 2014 08:23:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jackie.huang@windriver.com schreef op 15-04-14 09:01:
> From: Hongxu Jia <hongxu.jia@windriver.com>
> 
> | Note: adding Smart RPM DB channel | | Note: to be installed:  gd@x86_64
> run-postinsts@x86_64 kernel-modules@qemux86_64
> packagegroup-core-boot@qemux86_64 | Loading cache... | Updating cache...
> ######################################## [100%] | | Computing
> transaction...error: Can't install gd-2.1.0-r0.0@x86_64: no package
> provides /usr/bin/perl

That's nice and all, but you don't seem to runtime test this. I'm pretty
sure gd needs additional perl modules installed for its perl sections.

And FWIW, the bits that need perl should be split out in gd-perl

> | | Saving cache... | | WARNING: exit code 1 from a shell command. |
> ERROR: Function failed: do_rootfs (log file is located at
> tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.26487)
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> Signed-off-by:
> Jackie Huang <jackie.huang@windriver.com> --- 
> meta-oe/recipes-support/gd/gd_2.1.0.bb |    1 + 1 file changed, 1
> insertion(+)
> 
> diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb
> b/meta-oe/recipes-support/gd/gd_2.1.0.bb index 1b78b9b..3d41eec 100644 
> --- a/meta-oe/recipes-support/gd/gd_2.1.0.bb +++
> b/meta-oe/recipes-support/gd/gd_2.1.0.bb @@ -11,6 +11,7 @@ SECTION =
> "libs" LICENSE = "GD" LIC_FILES_CHKSUM =
> "file://COPYING;md5=c97638cafd3581eb87abd37332137669" DEPENDS = "freetype
> libpng jpeg zlib" +RDEPENDS_${PN} = "perl"

R* variables go below do_install

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTTOyEMkyGM64RGpERAu1dAJ4xqraqlz5pEmf+uZnOcxSt0gc9HgCghTpX
SWCuUnlnxjLDTnJSvlHHGqQ=
=IivC
-----END PGP SIGNATURE-----


