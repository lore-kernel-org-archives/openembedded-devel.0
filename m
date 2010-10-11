Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5ICh-0005Ul-Jx for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 15:14:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5ICI-0006eh-In for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 15:13:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 15:13:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 15:13:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Oct 2010 15:13:36 +0200
Message-ID: <i8v2i1$o2f$1@dough.gmane.org>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Mon, 11 Oct 2010 13:14:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-10-10 03:46, Khem Raj wrote:
> Hi
> 
> Following set of patches is v2 of the patches adding support for getting libtool 2.4 into
> openemebedded. I have so far built minimal-image for two machines successfully using old 
> and new libtool.
> 
> The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT variable. If this is
> set to "yes" then you ought to use libtool > 2.4 by default its set to "no" which means
> the current behavior remains.
> 
> The big change that libtool 2.4 brings is sysroot support and I have added
> support to use this feature. It should make our life easier.
> 
> This needs a lot of testing.
> 
> Please cherry pick the patch bundle and give it a try in yout environment
> 
> Some distros pin libtool version to 2.2.6b
> 
> include/preferred-slugos-versions.inc
> include/angstrom-2008-preferred-versions.inc
> include/kaeilos-2009-preferred-versions.inc
> include/angstrom-2010-preferred-versions.inc
> include/preferred-shr-versions.inc
> 
> So if you are using one of these distro's then you might have
> to override the version in your local.conf
> 
> LIBTOOL_HAS_SYSROOT = "yes"
> LIBTOOL_VER = "2.4"
> PREFERRED_VERSION_libtool           = "${LIBTOOL_VER}"
> PREFERRED_VERSION_libtool-native    = "${LIBTOOL_VER}"
> PREFERRED_VERSION_libtool-cross     = "${LIBTOOL_VER}"
> PREFERRED_VERSION_libtool-nativesdk = "${LIBTOOL_VER}"
> PREFERRED_VERSION_libtool-sdk       = "${LIBTOOL_VER}"
> 
> Please review, test, and provide feedback

Libtool-sdk_2.4.bb was missing, so I just pushed a version that makes
pkgconfig-sdk build, but it fails in meta-toolchain since it installs
files that are clashing with binutils-sdk. Could you have a look at that
please?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMsw2AMkyGM64RGpERArhjAKCwxaL5N2wxpCw/mxDHjNkyu3igJgCgqZ7e
xajKCa+yK0st6GL/vMg91uM=
=rT5A
-----END PGP SIGNATURE-----



