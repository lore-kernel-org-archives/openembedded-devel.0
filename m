Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MLgy8-0004wp-4p
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 19:18:08 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM2008ODA596TR0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	30 Jun 2009 12:05:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3013414AF5F; Tue,
	30 Jun 2009 13:05:33 -0400 (EDT)
Date: Tue, 30 Jun 2009 13:05:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090630170533.GC6573@denix.org>
References: <5f2b60906300444w31cdcf67o6b3eeab0d1fb85ab@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <5f2b60906300444w31cdcf67o6b3eeab0d1fb85ab@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: bitbake virtual/kernel fails for davinci
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
X-List-Received-Date: Tue, 30 Jun 2009 17:18:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 30, 2009 at 01:44:43PM +0200, Bj??rn Forsman wrote:
> Hi,
> 
> I am a bit new to OpenEmbedded, but have successfully built angstrom
> for davinci and qemu in the past. Today I tried to "bitbake
> virtual/kernel" for a davinci (dm6446) system. The build fails during
> unpack of linux-davinci kernel because git cannot find a given object
> hash (see output below). Has anybody else experienced this? How come
> OE references a non-existent git object?
> 
> The non-existent git object hash is specified in
> "recipes/linux/linux-davinci_git.bb" and was lastly modified by commit
> 160616d5f2a57ba828ed5ec06e37fc1cd4713af7.

Since then linux-davinci tree was updated to 2.6.30 final and more 
specifically, staging/vpfe branch was rebased from v2 to v3 vpfe patches. 
Unfortunately, rebase rewrites the history and changes commit numbers, hence 
the old commit cannot be found any more...

I'll update the recipe with the latest state of the linux-davinci tree. But, 
it may brake in the future again, as this is a moving target. If you want 
something, which does not break that often, I'd suggest you don't use the 
"git" version of the recipe - try setting PREFFERED_PROVIDER/VERSION for 
2.6.28 or 2.6.29...

-- 
Denys


