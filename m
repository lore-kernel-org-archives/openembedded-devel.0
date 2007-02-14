Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1HH91h-0007xV-SB
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Feb 2007 02:33:42 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 728F5207A5;
	Wed, 14 Feb 2007 12:33:40 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02860-04; Wed, 14 Feb 2007 12:33:38 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id DB07418350;
	Wed, 14 Feb 2007 12:33:38 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id E1A16B701CA; Wed, 14 Feb 2007 12:34:42 +1100 (EST)
Date: Wed, 14 Feb 2007 12:34:42 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Martin Dietze <di@fh-wedel.de>
Message-ID: <20070214013442.GA1347@twibble.org>
References: <20070208113136.GA1408@fh-wedel.de>
MIME-Version: 1.0
In-Reply-To: <20070208113136.GA1408@fh-wedel.de>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Thread-support in perl-native often breaks libintl-perl
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
X-List-Received-Date: Wed, 14 Feb 2007 01:33:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 08, 2007 at 12:31:36PM +0100, Martin Dietze wrote:
> Hi,
> 
>  on most platforms thread support is turned off for the
> cross-compiled perl packages. However it is always turned 
> on in the perl-native package. Since libraries like
> libintl-perl depend on perl-native since they include their
> headers from staging/[my-platform]-linux/lib/perl5 we get
> an inconsistent configuration: the shared lib gettext_xs.so
> is cross-compiled with headers with thread support turned
> on while the actual (non-native) perl has it turned off. In
> the end libintl-perl will not work:
> 
> | /var/bin/perl: relocation error: /var/lib/perl5/auto/Locale/gettext_xs/gettext_xs.so: undefined symbol: Perl_Gthr_key_ptr
> 
> Removing the `-Dusethreads' from the perl-native recipe solves
> this problem, but will it cause problems for others?

For sh4 I turned on threading for perl which is probably why I didn't
have this issue. I can't remember if I turned it on because of this
issue or if I needed it for somethings else. It probably doesn't
matter much anymore for my situation because I've since rewrote the
perl management application I was working on in C, so I only use perl
a lot of simpler things now.

I agree that we probably need to make perl and perl-native agree on
this. If everything appears to be ok with it turned off in
perl-native then I'd be fine with that (and would turn it of for the
sh4 perl as well.)

-- 
 Jamie Lenehan <lenehan@twibble.org>


