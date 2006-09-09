Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>)
	id 1GLujl-0006Ux-E6; Sat, 09 Sep 2006 06:46:37 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 32D1CA7AB2;
	Sat,  9 Sep 2006 14:43:30 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15777-08; Sat, 9 Sep 2006 14:43:28 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 709EE9AEBE;
	Sat,  9 Sep 2006 14:43:28 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 53717FD7350; Sat,  9 Sep 2006 14:43:28 +1000 (EST)
Date: Sat, 9 Sep 2006 14:43:28 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: MartinDietze commit <openembedded-commits@lists.openembedded.org>
Message-ID: <20060909044327.GA10580@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	MartinDietze commit <openembedded-commits@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GLfnq-00056C-UM@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GLfnq-00056C-UM@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: PCRE breakage [libpcre: added new port]
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
X-List-Received-Date: Sat, 09 Sep 2006 04:46:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 08, 2006 at 02:49:50PM +0200, "MartinDietze commit" wrote:
> libpcre: added new port.

You added libpcre and removed pcre and in the process you've also:

 - Broken 20+ recipes which DEPEND on pcre. These would all need to
   be modified to depend on libpcre now instead.

 - Removed the clearning of PARALLEL_MAKE so libpcre no longer builds
   for anyone doing parallel builds.

 - It looks like you've also removed the fix which was added to stop
   libtool linking against the host libriares when somethings it
   attempts to link in libpcre on x86_64 hosts.

I think the change of name is ok, since it's only a library and the
new naming matches what happens on other platforms but you really
should also fix up all of the above issues.

-- 
 Jamie Lenehan <lenehan@twibble.org>


