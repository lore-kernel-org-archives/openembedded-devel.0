Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KNq1p-0003N1-08
	for openembedded-devel@openembedded.org; Tue, 29 Jul 2008 16:18:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TEGdBe004609
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04377-06 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:33 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TEGS7S004594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 29 Jul 2008 15:16:29 +0100
Message-Id: <1217340989.5482.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 14:18:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

We've made the decision we want to switch to git so what happens now? We
now have:

* Agreed policies (pending no major objections from openembedded-devel)
* A git server setup
* Web browsing of the git server
* Commit hooks for CIA and email notification of commits

What remains:

* A final mtn -> git conversion
  - There is a known problem with the mtn -> git conversion which needs 
    to be addressed. Holger has the details of this
  - We also need to decide how to map the key names
* Collection of keys for access to the git server
* Creating a BKCVS history import and graft this onto the monotone 
  history
  - There are some conversion defects. Richard has the details and is 
    trying to look into this
  - We also need to decide on key name mappings, preferably consistent 
    with the git ones.
* Rename "gittrial" -> "git" on amethyst

Of these the BKCVS import and be done and also redone at a later date so
I'm not worried about this and it doesn't affect timescales. Renaming
gittrial -> git is pretty much trivial and won't take long. Collection
of keys is also relatively straightforward, we just need someone to
document key generation and collect them. They're basically ssh public
keys and gitosis makes them trivial to add so I can take on collection
role if existing developers with access to monotone want to start
sending me keys (ssh v2 keys please).

This leaves the mtn -> git conversion which isn't trivial. Holger is our
expert in this area and I'd really like to let him have the time needed
to sort this out to his satisfaction. I appreciate he has many time
constraints so this may not happen immediately.

There is also the issue of commit ID naming. I'm tempted to propose we
use commit IDs with a domain such as userid@developers.openembedded.org.
This would allow email redirection should we ever want it without
interfering with the main domain. The alternative is to let people use
their own domains but this means the IDs change when people change email
address and isn't really consistent for the metadata and maintaining a
single identity. I'm really open to opinions on this though. 

Also documenting all users with access on the wiki might be a good idea
(we used to do this but I think the data is stale).

Once we have the mtn -> git conversion working to satisfaction I propose
we give 1 weeks warning before monotone becomes readonly, the conversion
is made and we open up git for read/write. This email serves as notice
that people need to be ready to watch out for that time.

I hope this covers everything but any questions just ask...

Cheers,

Richard




