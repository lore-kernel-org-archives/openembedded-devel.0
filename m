Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0Wb9-0005vQ-I8
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Dec 2006 06:17:35 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0WaP-0000ug-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2006 16:16:50 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 7FE5F4AF73; Sat, 30 Dec 2006 16:16:42 +1100 (EST)
Date: Sat, 30 Dec 2006 16:16:41 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061230051641.GA30225@hezmatt.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
Subject: A question of workflow
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
X-List-Received-Date: Sat, 30 Dec 2006 05:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[I've never used monotone for a project before, so this may be something of
a general monotone question, but please bear with me]

I've hacked on the Ruby bitbake spec so it can build commonly-used
extensions like zlib, socket, and openssl.  However, I'm not sure how to go
about committing, submitting, and merging this patch with the main OE tree.

What I've done so far:

* Gotten a checkout of the org.openembedded.dev branch;
* Made my modifications;
* Created a key;
* Committed my changes to my working copy.

Now I can't even manage to retrieve the diff of my changes (the 'obvious'
step of running "mtn diff -r <SHA1>" didn't do anything useful) to submit
them to the bugzilla.  Of course, submitting a context-free patch when
you've got a full distributed RCS at your bidding seems a bit archaic
anyway.

So, my questions:

* How do I get my diff back?
* How do I submit my changes to the OE project for merging?
* Will I have problems when the change gets committed to the trunk?
* (The biggie) is there a guide on the wiki or somewhere describing the
  preferred workflow for making changes and working effectively with the rest
  of the OE developer community?  (Google wasn't at all illuminating)

Thanks,
- Matt


