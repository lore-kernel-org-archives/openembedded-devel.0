Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KTXSA-0005IH-UB
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Aug 2008 09:41:02 +0200
Received: from 88-111-45-211.dynamic.dsl.as9105.com ([88.111.45.211]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KTXRW-0001FA-St
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Aug 2008 08:40:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g7vqvs$3fi$1@ger.gmane.org>
References: <g7vqvs$3fi$1@ger.gmane.org>
Date: Thu, 14 Aug 2008 08:41:05 +0100
Message-Id: <1218699665.10360.25.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 07:41:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-08-14 at 01:33 +0200, Rolf Leggewie wrote:
> It has always been possible to shoot yourself in the foot with OE.  I 
> believe the opportunities will rise with the introduction of git.  The 
> reason is that AFAIU, with mtn there was a 1:1 relation between checkout 
> dir and upstream branch.  This information was recorded in _MTN/options. 
>   git does not have this restriction.  One can freely add remote 
> branches to an existing checkout with "git remote add" and switch to 
> them with "git checkout $branch".  This can easily corrupt tmp/ and I 
> fear it will happen quite often.  I wonder if there is anything 
> OE/bitbake can do to alleviate the pain.

What's the specific corruption that you're worried about?  Any change
which is truly incompatible in TMPDIR ought to result in a change to
SANITY_ABI which will be automatically detected.  Smaller changes ought
not to cause any real problem in the first place.

I'm also not convinced that the operations you mention here with git are
not already possible with monotone.  Isn't this basically what "monotone
update -b BRANCH" does?

Maybe you could give a concrete example of the kind of operation that
you think is going to get users into trouble.

p.




