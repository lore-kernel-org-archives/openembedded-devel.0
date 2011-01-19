Received: from smtpauth03.prod.mesa1.secureserver.net ([64.202.165.183])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PfZm5-0004KO-Mj
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 16:16:42 +0100
Received: (qmail 30693 invoked from network); 19 Jan 2011 15:09:19 -0000
Received: from unknown (209.242.7.132)
	by smtpauth03.prod.mesa1.secureserver.net (64.202.165.183) with ESMTP;
	19 Jan 2011 15:09:19 -0000
Message-ID: <4D36FE98.3070606@mwester.net>
Date: Wed, 19 Jan 2011 09:09:12 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>	<4D36A64E.9060804@xora.org.uk>	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
In-Reply-To: <AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 15:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As I read this thread, I find that as a distro maintainer, I'm a bit
unclear on a few points.  Pardon me if I've just failed to read/follow
this thread...

- So if I wish (or am forced) to use "layers", where do they come from?
 Am I then responsible for finding a git hosting service, arranging for
CIA commit messages, etc?  Or will each layer be hosted alongside the
main OE repo?  Or have we not yet considered the added administrative
burden of multiple repos?

- Does this not "silo" things even more?  For example, I have found life
has gotten much easier now that other autobuilders are building SlugOS
-- but what incentive do people have if they have to deal with adding
layers and all that, especially if the "SlugOS layer" ends up with a
conflict in some fashion with the "Angstrom layer"?  And
correspondingly, if I am struggling with some issue, would it not be
less likely that I could get assistance and guidance from #OE if I'm
using some layer?

- And unless I'm not missing something with the layers proposal (and I
hope I am), is it not most likely that we'll end up with the following
scenario:

  a) Larger distros eventually fork OE-core and go off on their own as
they find that their "layer" becomes more and more substantial compared
to OE-core, especially when "people-originated conflicts" occur rather
than "technically-originated conflicts" (a single repo tends to force
resolution of the former).

  b) Small distros are forced to comply with nothing but OE-core, or
perish -- the cost of maintaining the extra infrastructure (git, cgit,
CIA, etc, etc) along with the added complexity of teaching new distro
developers about this new layer of stuff) is simply too high, not to
mention that creating a layer for distro-specific stuff might be an
instant killer in terms of autobuilder and assistance from the OE
community at large (I ask myself -- do *I* intend to pull the Angstrom
layer and build it?  I've done so in the past, but only because it was
trivial to kick off such a build... but with layers, it seems it will be
far harder to do so -- unless I'm missing something).

  c) Obscure/experimental distros simply die off, or find an alternative
to OE.  The learning curve is quite steep already, and without access to
shared knowledge, shared recipes, and the assistance of the community,
what is there to encourage a newcomer to use OE?


I'm putting on my asbestos skivvies, since I expect this must have
already been discussed :)

-Mike (mwester)


