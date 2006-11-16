Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1GkhS9-0001yy-Tf
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Nov 2006 14:38:54 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id B8D2FD2818;
	Fri, 17 Nov 2006 00:36:36 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00509-09; Fri, 17 Nov 2006 00:36:34 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id E4BFE2090E;
	Fri, 17 Nov 2006 00:36:34 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id BBB4015F3670; Fri, 17 Nov 2006 00:36:34 +1100 (EST)
Date: Fri, 17 Nov 2006 00:36:34 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20061116133633.GA7740@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Koen Kooi <koen@dominion.kabel.utwente.nl>,
	openembedded-devel@lists.openembedded.org
References: <455C6643.1020607@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <455C6643.1020607@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl tries to run './miniperl' on cross builds
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
X-List-Received-Date: Thu, 16 Nov 2006 13:38:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 16, 2006 at 02:23:15PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Since (approx.) yesterday the perl build fails with:
> 
> |
> LD_LIBRARY_PATH=/data/build/koen/OE/build/tmp/angstrom/work/armv4t-angstrom-linux-gnueabi/perl-5.8.7-r21/perl-5.8.7
> ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl configpm.tmp
> | /bin/sh: ./miniperl: cannot execute binary file

That miniperl is meant to be renamed to miniperl-arm and then
symlinked to hostperl, so you end up with something like this:

 [nynaeve][12:28AM]~/devel/oe/build/titan-glibc-24/tmp/work/perl-5.8.7-r21/perl-5.8.7%> file miniperl miniperl-arm hostperl
 miniperl:     symbolic link to `hostperl'
 miniperl-arm: ELF 32-bit LSB executable, Hitachi SH, version 1 (SYSV), for GNU/Linux 2.4.0, dynamically linked (uses shared libs), for GNU/Linux 2.4.0, not stripped
 hostperl:     ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV), for GNU/Linux 2.4.0, dynamically linked (uses shared libs), for GNU/Linux 2.4.0, not stripped

I can't think of any reason why that would have broken. I've done
full rebuilds targeting sh4 and i486 in the past few hours with no
problems.

Probably need to see the full log to see why the Makefile failed to
do this when it was meant to.

-- 
 Jamie Lenehan <lenehan@twibble.org>


