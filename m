Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB4D6AB9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:24:49 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZCNFF-0000H8-Uc for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jul 2015 09:24:45 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 09:24:45 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 09:24:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Jul 2015 09:24:28 +0200
Message-ID: <mnfurd$pvc$1@ger.gmane.org>
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 07 Jul 2015 07:24:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rongqing.li@windriver.com schreef op 07-07-15 om 03:55:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Remove backport patch Add CSocket submodule Add the dependency on icu
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com> ---

> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb
> b/meta-networking/recipes-irc/znc/znc_git.bb index 2e35e4d..f5bed08
> 100644 --- a/meta-networking/recipes-irc/znc/znc_git.bb +++
> b/meta-networking/recipes-irc/znc/znc_git.bb @@ -1,16 +1,16 @@ SUMMARY =
> "ZNC, an advanced IRC bouncer" SECTION = "net" LICENSE = "GPLv2" 
> -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> 
> -DEPENDS = "openssl" +DEPENDS = "openssl zlib icu"
> 
> -PV = "1.0+git" +PV = "1.6.0+git"

If it's the 1.6 release, just call it '1.6.0'

> 
> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2" -SRC_URI =
> "git://github.com/znc/znc.git \ -
> file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \ +SRC_URI =
> "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df8
> \ +
> git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name
=Csocket
> \ " +SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
> 

Why are you using 2 different notations for SRCREV?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVm36sMkyGM64RGpERAnkdAKCu2PeFLY0tM3mwKlS9AJ2TDj4LAQCeNsmL
GIoJ0jDJYLU2/z7hph+y+Ik=
=sHdl
-----END PGP SIGNATURE-----


