Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCEE71144
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 08:16:48 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Z1sEg-0000mj-BA for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2015 10:16:46 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:16:46 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:16:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 08 Jun 2015 10:16:34 +0200
Message-ID: <ml3j12$nio$1@ger.gmane.org>
References: <1433468641-18841-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
In-Reply-To: <1433468641-18841-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] cpufrequtils: Create proper symlinks to versioned library
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
X-List-Received-Date: Mon, 08 Jun 2015 08:16:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 05-06-15 om 03:44:
> Currently it produces duplicated .so files for .so.0 and .so.0.0.0 this
> is also noticed by opkg upgrade
> 
> Configuring libxcb-randr0. /sbin/ldconfig: /usr/lib/libcpufreq.so.0 is
> not a symbolic link
> 
> Additionally helps in some code size savings
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb | 5 ++++- 1 file
> changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb index
> e3b4de1..88fcc02 100644 ---
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb +++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb @@ -14,7 +14,7
> @@ SRC_URI = "git://github.com/emagii/cpufrequtils.git \ 
> file://0001-dont-unset-cflags.patch \ "
> 
> -CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' ==
> 'no']} " +EXTRA_OEMAKE_append = " ${@['', 'NLS=false']['${USE_NLS}' ==
> 'no']} "

That's not mentioned in the commit message

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVdU9iMkyGM64RGpERAhnwAJ4v/Ds0cnWWGkmkG4XHDS8PTalfZQCfe8FM
M3MbPGfQb3mnso7vaHNpGN4=
=K71s
-----END PGP SIGNATURE-----


