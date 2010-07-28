Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oe0wB-0001AJ-DH for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 09:20:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oe0vs-00078h-TZ for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 09:20:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:20:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jul 2010 09:09:07 +0200
Message-ID: <i2ol2j$6j7$2@dough.gmane.org>
References: <4C4F6F91.8000902@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C4F6F91.8000902@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Disable packaged-staging for perl-native
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
X-List-Received-Date: Wed, 28 Jul 2010 07:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-07-10 01:45, Tom Rini wrote:
> I'd like to disable packaged-staging for perl-native.  The problem here
> comes from a number of things that happen.  Some of these can only
> happen in combination with packaged-staging but others I believe could
> happen today.  The problem itself is that if we have perl-native
> available from packaged-staging it can suddenly exist very early.  What
> this means in practical terms is that now we're trying to generate say
> pod2man.pl from pod2man.pl.in and @perl@ is expanded to something beyond
> the "#!" mechanic length limit and recipes start failing to build
> (fixable by changing pod2man.pl.in to use /usr/bin/env perl (and if it
> had a -w changing to Use warnings: or whatever the perl is)).
> 
> There may have been other rats nests I ran into but can't fully confirm
> weren't due to other crazy rats nests I made.  But we hit the above many
> times.
> 
> perl-native: Disable packaged-staging
> 
> Having perl-native come from packaged-staging can expose other issues.
> Disable so we get the normal (potential) behavior here.

In the past 'perl-native' was actually 'perl-cross', you needed to
rebuild it when changing archs. Dunno if that still is the case.

regards,

Koen

> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> diff --git a/recipes/perl/perl-native_5.10.1.bb
> b/recipes/perl/perl-native_5.10.1.bb
> index 0e0854b..98c2c3c 100644
> --- a/recipes/perl/perl-native_5.10.1.bb
> +++ b/recipes/perl/perl-native_5.10.1.bb
> @@ -9,6 +9,9 @@ NATIVE_INSTALL_WORKS = "1"
>  # Not tested enough
>  DEFAULT_PREFERENCE = "-1"
> 
> +# Introduces issues when re-used too early.
> +PSTAGING_DISABLED = "1"
> +
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
> 
>  SRC_URI =
> "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
> diff --git a/recipes/perl/perl-native_5.8.8.bb
> b/recipes/perl/perl-native_5.8.8.bb
> index fe1bc84..b966eeb 100644
> --- a/recipes/perl/perl-native_5.8.8.bb
> +++ b/recipes/perl/perl-native_5.8.8.bb
> @@ -6,6 +6,9 @@ DEPENDS = "virtual/db-native gdbm-native"
>  PR = "r20"
>  NATIVE_INSTALL_WORKS = "1"
> 
> +# Introduces issues when re-used too early.
> +PSTAGING_DISABLED = "1"
> +
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
> 
>  SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMT9eTMkyGM64RGpERAuaEAJ9kzPdQLHDcX/GfqTNWFTzMngqzuwCgr3nc
eHEzHXwGeLNBlf6PKpfvRcE=
=roO2
-----END PGP SIGNATURE-----



