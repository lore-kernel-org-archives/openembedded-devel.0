Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSExY-0004oW-89
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 18:11:52 +0100
Received: by nf-out-0910.google.com with SMTP id h3so111417nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2008 09:11:43 -0800 (PST)
Received: by 10.78.204.20 with SMTP id b20mr16143485hug.64.1203613902840;
	Thu, 21 Feb 2008 09:11:42 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id h1sm347176nfh.20.2008.02.21.09.11.41
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 09:11:42 -0800 (PST)
Date: Thu, 21 Feb 2008 19:13:27 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Message-ID: <20080221191327.63b6bc9a@widy.localdomain>
In-Reply-To: <47BCEECA.9000102@gmail.com>
References: <47BCEECA.9000102@gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.182.186
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [RFC] Streamline the process of getting fixes from .dev --> feed
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
X-List-Received-Date: Thu, 21 Feb 2008 17:11:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 20 Feb 2008 22:23:54 -0500
Junqian Gordon Xu <xjqian@gmail.com> wrote:

> As invoked in the other discussion about the landmark for closing
> bug, I think the current process of getting fixes from .dev -->
> stable --> feed leaves a lot to be desired. Here is my 2 cents.
> 
> 1. We should make the process as transparent as possible to everybody 
> (even users, so they will hate Angstrom dev less or at least respect
> us as organized mob). Koen and Paul have sent out couple of emails
> about this. However I don't see a summary in the Angstrom/Developer
> page. If I had the rw access to the page, I would have at least put
> the following information in there:

If I had, I'd probably do that too, even though I think that current
process is still an RFC, subject for assessment how performant it is,
and open for proposals for improvements. So, IMHO it would be to just
open a usual wiki page for now.

> 
> [1] send email with subject [Review] to angstrom-devel list with 
> cumulative diff:
> 
> mtn diff packages/<path> -r $(mtn head -b
> org.openembedded.angstrom-2007.12-stable | tail -n1 | awk '{print
> $1}') -r $(mtn head -b org.openembedded.dev| tail -n1 | awk '{print
> $1}')
> 
> [2] Once approved by at least two core dev, 

This is crucial point. Original post from Koen is here:
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2007-December/001249.html

Quoting as is:
======
org.openembedded.angstrom-2007.12-stable

  which will only get changes that have been approved by at least 2
angstrom developers, anything else will get disapproved. Sounds ok?
======

*Angstrom developers*, not *core angstrom developers*. And that's how I
used to interpret it during this time already. Because otherwise we
have gross chore and bottleneck. So who's "angstrom developer"? Anyone
who is interested in Angstrom stable and follows this procedure, IMHO.
In particular, I consider Altboot patches to be ready for merge,
approved by yourself and Koen.

Note that "approve" means "sign-off", so parties should perform all due
diligence on reviewing changes they ack. Remember, all this bureaucracy
here is to ensure that we know answers to questions "Does it build?"
and "Does it work?" at all times, and that answer was "Yes".

Well, as not many people yet fully get used to this procedure, it would
be nice if we worked in "at least 1 core dev should ack" mode for
the time being, but long-term, it would be nice to minimize bus- and
wait- factors.

> update the BACKPORTS.txt
> in the stable branch. This file holds all the revision from .dev we
> want in this stable branch. To quickly lookup any revision from
> below, use http://www.openembedded.org/viewmtn/revision/info/<rev>
> 
> [Koen and Paul, please help complete the following. I know these have 
> been mentioned before in this list, but I forgot exactly which files
> and what policies]
> 
> [3] how to update which packages to be added to the feed and autobuilt
>      how to update which machine/images to be autobuilt.
>      where are the scripts located to initiate the autobuilding
> process
> 
> [4] what's the frequency of refreshing the feed (I am not aware of
> this being mentioned, but preferably as frequent as possible).
>      what's the frequency of autobuilding -rX machin/image. If I 
> remember correctly, this is every other week.
> 
> [5] etc...
> 
> 2. The current review process is not efficient as either, depending
> on whether core dev's availability, their interests and experiences
> on the particular fixes, etc. But I have no better suggestions.
> Comments are welcome.
> 
> Regards
> Gordon

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


