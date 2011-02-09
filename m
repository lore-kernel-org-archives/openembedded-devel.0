Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pn6oD-0001ZG-9b
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:58:09 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pn6n2-0003Lr-Ob by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 10:56:51 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pn6mz-0005xg-LQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:56:45 +0100
Date: Wed, 9 Feb 2011 10:56:45 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110209095644.GE28019@excalibur.local>
References: <4D519C83.9060502@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
MIME-Version: 1.0
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 09:58:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-02-09 at 10:25, Aeschbacher, Fabrice wrote:
> 
> There are two things which could be useful (IMO) for OE users:
> 
> 1. a small README file (or wiki page) just highlighting the main
>    changes since last release (2010.12), e.g. something like
>    "Prominent features (the cool stuff)" on http://kernelnewbies.org/LinuxChanges
>    This would help us OE users to decice whether it is worth rebasing on the latest
>    release now, or if it can wait 

Good point. Getting such a high level changelog in place would indeed be a good
idea.

> 2. Do not delete the release branch after 2011.03 will be released (just like
>    it was done for 2010.12), but let it live and allow developpers committing
>    bug-fixes (backporting choosen things?) reported back by OE users (some would
>    would be happy to contribute this way)

That was already discussed. We make a tag with the release rev from which can be
branched again _if_ people are stepping up to support this branch on a mid or
long term base.

The branch Tom is using until the release is pretty useless froma history point
of view (all changes must be in master as well). When he thinks the release is
good enough the tag gets added and the old branch deleted. For the last release
nobody cared to support it afterwards with bugfixes so no release branch was
created.

I'm thinking about this for the upcoming release. If all works well we will base
a product on it which I would like to support directly from such a release
branch.

The hard part is how people could decide on pooling resources on this. Defining
goals for such a branch and stuff. E.g. only take serious fixes? What about
package updates? Security fixes? changes on the toolchain or classes?

This is up to the group who wants to support such a branch. Anyone else
interested in doing this for 2011-03?

My alternative would be to branch of from the tag and do the maintenance in a
private branch.

regards
Stefan Schmidt


