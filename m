Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Hi98U-00044t-KB
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 15:08:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 096A710C79C;
	Sun, 29 Apr 2007 22:59:11 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30790-06; Sun, 29 Apr 2007 22:59:09 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 851BB10C757;
	Sun, 29 Apr 2007 22:59:09 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 7505BB70148; Sun, 29 Apr 2007 22:59:09 +1000 (EST)
Date: Sun, 29 Apr 2007 22:59:09 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
Message-ID: <20070429125909.GB8230@twibble.org>
References: <20070427105722.GA4340@twibble.org> <f0vs5r$6pm$1@sea.gmane.org>
MIME-Version: 1.0
In-Reply-To: <f0vs5r$6pm$1@sea.gmane.org>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2007 13:08:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 28, 2007 at 06:19:04PM +0200, Rolf Leggewie wrote:
> Jamie Lenehan wrote:
> 
> > You need to build perl-native 5.8.8 and then perl 5.8.8.
> 
> I tried DISTRO=sharprom-compatible.  perl-native-5.8-8 builds fine, but
> unfortunately, perl itself still has issues.  Bug 1700 is not yet resolved.

That uses an old out-of-tree toolchain doesn't it?

I suspect that the gcc_s linking issue would be fixed. The other
issue looks to be related to the compiler version being used. Can you
attach the configure and compile logs for perl 5.8.8 builds using the
sharprom toolchain to the bug? I'll then take a look at it and see if
it can be fixed.

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


