Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GLum7-0006XK-El
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 06:49:03 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 32C97A7ABD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2006 14:45:56 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15777-10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 9 Sep 2006 14:45:54 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 71C7FA7883
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2006 14:45:54 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 65EE3FD734E; Sat,  9 Sep 2006 14:45:54 +1000 (EST)
Date: Sat, 9 Sep 2006 14:45:54 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060909044554.GA10625@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GLfnq-00056C-UM@linuxtogo.org>
	<20060909044327.GA10580@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060909044327.GA10580@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: PCRE breakage [libpcre: added new port]
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
X-List-Received-Date: Sat, 09 Sep 2006 04:49:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 09, 2006 at 02:43:28PM +1000, Jamie Lenehan wrote:
> On Fri, Sep 08, 2006 at 02:49:50PM +0200, "MartinDietze commit" wrote:
> > libpcre: added new port.
> 
> You added libpcre and removed pcre and in the process you've also:
> 
>  - Broken 20+ recipes which DEPEND on pcre. These would all need to
>    be modified to depend on libpcre now instead.
> 
>  - Removed the clearning of PARALLEL_MAKE so libpcre no longer builds
>    for anyone doing parallel builds.
> 
>  - It looks like you've also removed the fix which was added to stop
>    libtool linking against the host libriares when somethings it
>    attempts to link in libpcre on x86_64 hosts.

And another one:

   - Removed the LICENSE field from the recipe as well.

-- 
 Jamie Lenehan <lenehan@twibble.org>


