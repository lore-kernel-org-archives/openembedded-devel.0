Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GMFDC-0000Fn-5J
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 04:38:22 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 92D7A8A525
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 12:35:09 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14609-05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 12:35:07 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id C8A328A524
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 12:35:07 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id B9763FD743F; Sun, 10 Sep 2006 12:35:07 +1000 (EST)
Date: Sun, 10 Sep 2006 12:35:07 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060910023507.GA25398@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <200609062324.33029.christopher.lang@plus.cablesurf.de>
	<20060909025533.GA4524@twibble.org>
	<45027F94.5080705@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <45027F94.5080705@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: error: #error "TLS support is required." while building glibc-initial-2.4 on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Sep 2006 02:38:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 09, 2006 at 10:47:16AM +0200, Koen Kooi wrote:
[...]
> > I've added make 3.81 to OE (by copying all the 3.80 releated make
> > files to 3.81 versions - no changes necessary) and then do a "bitbake
> > make-native" prior to building rather than update the host version of
> > make.
> 
> Are there any nasty side-effects of update to 3.81? If not, could you commit it?

Not that I've seen. I've been doing builds for i486 (WRAP boards) and
i586 (EPIA) with make 3.81 without any problems, although I don't
build any UI stuff. I believe some newer distros are also shipping
make 3.81 as the default.

In this case make-native isn't actually built unless you explicitly
ask for it and make would be used on the target not by OE.

So I don't see any issues with pushing this version. I'll do that
now.

-- 
 Jamie Lenehan <lenehan@twibble.org>


