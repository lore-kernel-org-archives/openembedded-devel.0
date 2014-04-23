Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDA465D3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:11:36 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WcsHH-0000zM-8x for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2014 10:11:35 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:11:35 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:11:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Apr 2014 10:11:20 +0200
Message-ID: <lj7sj8$46s$1@ger.gmane.org>
References: <1398240000-22960-1-git-send-email-Chong.Lu@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <1398240000-22960-1-git-send-email-Chong.Lu@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Wed, 23 Apr 2014 08:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chong Lu schreef op 23-04-14 10:00:
> 1. default enable perl and python bindings 2. rrdtool uses perl.real, 
> perl.real doesn't know where the PERL5LIB should be when prebuilts are 
> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes 
> perl.real 3. While using dash as /bin/sh, subsequent commands in 
> functions will not use the environment variables passed to the function 
> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized 
> options: "--enable-local-libpng" and "--enable-local-zlib"
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> --- 
> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  125 
> ++++++++++++++++++++- 1 file changed, 119 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb 
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index 
> 533451f..1fe0302 100644 --- 
> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++ 
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -5,6 +5,7 @@ 
> LICENSE = "GPLv2" LIC_FILES_CHKSUM = 
> "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
> 
> DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
> +RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long
> perl-module-time-hires perl-module-io-file"

Variables are ordered by task order, so R* vars go next to FILES* vars. And
I suspect PN-python will need python-core.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTV3WoMkyGM64RGpERAvDkAKCZwY6DfiM8YYyc0ZUXbwz2SjdQUgCgoGbK
+TpF5uCZRHGAPlipvP/UxqU=
=kATN
-----END PGP SIGNATURE-----


