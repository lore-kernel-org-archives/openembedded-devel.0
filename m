Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpR9-0004Bi-7F for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:08:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpOR-0007UK-JW for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:05:35 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 21:05:35 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 21:05:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Feb 2010 21:05:23 +0100
Message-ID: <hmeia3$p6c$1@dough.gmane.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sun, 28 Feb 2010 20:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

How do you know that some versions aren't used at all? Did you check all
external overlays?

But more importantly, what harm do the recipes do to you? Does it offend
you that there are 26 recipes?

What are you trying to accomplish?

If a recipe isn't doing any harm, just leave it alone. Deleting recipes
just to please someones sense of aesthetics is the wrong thing to do.

What would be a lot better is to fix the latest version for each minor
release to use things like new style staging, bbclassextend, etc and
*after* that clean up ask to remove the recipes that weren't updated.
That way there is a recipe for each minor version so we can check
regressions quite easily. But the real bonus is that the remaining
recipes are of good quality. Your proposal doesn't address any QA
concerns, it just makes the mess a bit smaller.

And even then I would rather move recipe + associated patches to
obsolete than delete it. When we start doing tarball releases
recipes/obsolete will be a lot more important than it is now.

On 28-02-10 20:39, Frans Meulenbroeks wrote:
> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
> Only a few versions are used (see also the grep below)
> 
> for glib-2.0:
> "2.12.12"
> "2.16.4"
> "2.18.3"
> "2.20.3"
> "2.22.1"
> "2.22.4"
> "2.6.4"
> "2.8.6"
> 
> for glib-2.0-native:
> "2.16.1"
> "2.18.0"
> "2.22.1"
> "2.22.4"
> 
> Both include the last two versions
> Proposal is to remove all versions that are not used.
> 
> How do people feel about this?
> 
> Frans
> 
> 
>  frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> ls
> bug-556515.patch  glib-2.0-2.16.3         glib-2.0-native_2.12.4.bb
> glib-2.0_2.12.13.bb  glib-2.0_2.18.1.bb
> files             glib-2.0-2.16.4         glib-2.0-native_2.16.1.bb
> glib-2.0_2.12.6.bb   glib-2.0_2.18.3.bb
> glib-2.0-2.12.10  glib-2.0-2.16.5         glib-2.0-native_2.18.0.bb
> glib-2.0_2.12.9.bb   glib-2.0_2.2.3.bb
> glib-2.0-2.12.11  glib-2.0-2.18.0         glib-2.0-native_2.2.3.bb
> glib-2.0_2.14.0.bb   glib-2.0_2.20.3.bb
> glib-2.0-2.12.12  glib-2.0-2.18.1         glib-2.0-native_2.22.1.bb
> glib-2.0_2.14.1.bb   glib-2.0_2.20.4.bb
> glib-2.0-2.12.13  glib-2.0-2.18.3         glib-2.0-native_2.4.6.bb
> glib-2.0_2.14.4.bb   glib-2.0_2.22.1.bb
> glib-2.0-2.12.9   glib-2.0-2.2.3          glib-2.0-native_2.6.5.bb
> glib-2.0_2.15.6.bb   glib-2.0_2.22.4.bb
> glib-2.0-2.14.0   glib-2.0-2.20.3         glib-2.0-native_2.6.6.bb
> glib-2.0_2.16.1.bb   glib-2.0_2.4.6.bb
> glib-2.0-2.14.1   glib-2.0-2.20.4         glib-2.0.inc
> glib-2.0_2.16.3.bb   glib-2.0_2.6.4.bb
> glib-2.0-2.14.4   glib-2.0-2.22.1         glib-2.0_2.12.10.bb
> glib-2.0_2.16.4.bb   glib-2.0_2.6.6.bb
> glib-2.0-2.15.6   glib-2.0-2.22.4         glib-2.0_2.12.11.bb
> glib-2.0_2.16.5.bb   glib-2.0_2.8.6.bb
> glib-2.0-2.16.1   glib-2.0-native-2.12.4  glib-2.0_2.12.12.bb
> glib-2.0_2.18.0.bb   glib.inc
> frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> grep PREFERENCE *
> glib-2.0_2.16.3.bb:DEFAULT_PREFERENCE = "-1"
> glib-2.0_2.16.4.bb:DEFAULT_PREFERENCE = "-1"
> glib-2.0_2.16.5.bb:DEFAULT_PREFERENCE = "-1"
> frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> grep -r glib-2.0 ../../conf
> ../../conf/distro/micro.conf:USE_NLS_glib-2.0 = "yes"
> ../../conf/distro/micro.conf:USE_NLS_glib-2.0-native = "yes"
> ../../conf/distro/chinook-compat.conf:PREFERRED_VERSION_glib-2.0
>   = "2.12.12"
> ../../conf/distro/chinook-compat.conf:PKG_glib-2.0 = "libglib2.0-0"
> ../../conf/distro/maemo5-compat.conf:PREFERRED_VERSION_glib-2.0
>  = "2.20.3"
> ../../conf/distro/maemo5-compat.conf:PKG_glib-2.0 = "libglib2.0-0"
> ../../conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_VERSION_glib-2.0
> 	= "2.22.4"
> ../../conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_VERSION_glib-2.0-native
> = "2.22.4"
> ../../conf/distro/include/kaeilos-2009-preferred-versions.inc:PREFERRED_VERSION_glib-2.0
> 	= "2.22.4"
> ../../conf/distro/include/kaeilos-2009-preferred-versions.inc:PREFERRED_VERSION_glib-2.0-native
> = "2.22.4"
> ../../conf/distro/include/preferred-gpe-versions-2.7.inc:PREFERRED_VERSION_glib-2.0
> ?= "2.6.4"
> ../../conf/distro/include/angstrom-uclibc.inc:USE_NLS_glib-2.0 = "yes"
> ../../conf/distro/include/angstrom-uclibc.inc:USE_NLS_glib-2.0-native = "yes"
> ../../conf/distro/include/sane-toolchain-uclinux-uclibc.inc:USE_NLS_glib-2.0
> = "yes"
> ../../conf/distro/include/sane-toolchain-uclinux-uclibc.inc:USE_NLS_glib-2.0-native
> = "yes"
> ../../conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_glib-2.0
> ?= "2.16.4"
> ../../conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_glib-2.0-native
> ?= "2.16.1"
> ../../conf/distro/include/slugos.inc:# glib-2.0 builds require USE_NLS
> to be overridden
> ../../conf/distro/include/slugos.inc:USE_NLS_glib-2.0 = "yes"
> ../../conf/distro/include/slugos.inc:USE_NLS_glib-2.0-native = "yes"
> ../../conf/distro/include/preferred-shr-versions.inc:PREFERRED_VERSION_glib-2.0
>      = "2.22.4"
> ../../conf/distro/include/preferred-shr-versions.inc:PREFERRED_VERSION_glib-2.0-native
> = "2.22.4"
> ../../conf/distro/include/preferred-slugos-versions.inc:PREFERRED_VERSION_glib-2.0			?=
> "2.22.1"
> ../../conf/distro/include/preferred-slugos-versions.inc:PREFERRED_VERSION_glib-2.0-native		?=
> "2.22.1"
> ../../conf/distro/include/preferred-om-2009-versions.inc:PREFERRED_VERSION_glib-2.0
>      = "2.18.3"
> ../../conf/distro/include/preferred-om-2009-versions.inc:PREFERRED_VERSION_glib-2.0-native
> = "2.18.0"
> ../../conf/distro/include/angstrom-uclinux-uclibc.inc:USE_NLS_glib-2.0 = "yes"
> ../../conf/distro/include/angstrom-uclinux-uclibc.inc:USE_NLS_glib-2.0-native
> = "yes"
> ../../conf/distro/include/maemo-preferred.inc:PREFERRED_VERSION_glib-2.0
> = "2.6.4"
> ../../conf/distro/include/preferred-gpe-versions-2.8.inc:PREFERRED_VERSION_glib-2.0
> ?= "2.8.6"
> ../../conf/distro/include/sane-toolchain-uclibc.inc:USE_NLS_glib-2.0 = "yes"
> ../../conf/distro/include/sane-toolchain-uclibc.inc:USE_NLS_glib-2.0-native
> = "yes"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLisyDMkyGM64RGpERAldgAKCM3/TP7G540bPars60N9AF9Vcr1QCfe2rR
QHQjbqauqjmMMvFXz5uhNCI=
=BPJk
-----END PGP SIGNATURE-----



