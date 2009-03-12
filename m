Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LhpqR-0004hF-44
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 19:41:27 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGE004NFP7P69E5@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	12 Mar 2009 13:40:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 69BC06B83B5; Thu,
	12 Mar 2009 14:40:37 -0400 (EDT)
Date: Thu, 12 Mar 2009 14:40:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090312184037.GA1109@denix.org>
References: <ac9c93b10903120130v5c19e5fbq224df848792f3a5f@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <ac9c93b10903120130v5c19e5fbq224df848792f3a5f@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: do_patch fails if path starts with ./
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
X-List-Received-Date: Thu, 12 Mar 2009 18:41:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 12, 2009 at 09:30:47AM +0100, Frans Meulenbroeks wrote:
> Hi,
> 
> When generating my (normally small) patches I typically do a cp file
> file.orig in the work dir, then change file and at the end do a diff
> -urN path/file.oirg path/file >file.patch
> no probllems with that (although if there are recommendations to do
> things simpler/better, I'm of course open to suggestions).
> 
> However yesterday I copied and pasted filenames and ended up with
> diff -urN ./path/file.orig ./path/file >file.patch

Have you tried:
diff -urN path/file.orig path/file >file.patch

> of course then in file.patch the filenames starts with ./
> when that happens do_patch does not find the file.(probably because it
> thinks there is an additional directory because it does not see that
> ./ is actually the same dir)

You may want to play with the pnum variable (increase it?) in the SRC_URI 
of the patch...

> is this a bug in our build system? or in patch?
> or should I just avoid using ./ if I create a patch?
> 
> btw: I alredy tried diff -Nurd (so an additional d flag) but that did
> not make a difference).

-- 
Denys


