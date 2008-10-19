Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1KrcgF-0006iw-DT
	for openembedded-devel@openembedded.org; Sun, 19 Oct 2008 20:07:07 +0200
Received: from [192.168.1.3] (tim.rpsys.net [194.106.48.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 97AD110CEA61
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 14:06:50 -0400 (EDT)
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224344240.5215.48.camel@dax.rpnet.com>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<1224341977.3140.112.camel@mill.internal.reciva.com>
	<1224344240.5215.48.camel@dax.rpnet.com>
Date: Sun, 19 Oct 2008 19:06:50 +0100
Message-Id: <1224439610.5211.11.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Subject: Re: Some open issues
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
X-List-Received-Date: Sun, 19 Oct 2008 18:07:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 16:37 +0100, Richard Purdie wrote:
> On Sat, 2008-10-18 at 15:59 +0100, Phil Blundell wrote:
> > i) why this is a terribly big issue in the first place (i.e. what the
> > real-world impact of the corruption is going to be); or
> 
> There is no impact on the current metadata, just the history. It depends
> how much value we place on that.
> 
> At present we can't at some future date add in a good version of the
> BKCVS data as easily as we could if it had been done by a tree graft
> originally. The data there at the moment is pretty useless for actually
> finding history (I know since I've tried to use it).
> 
> > ii) why, if we don't act now, it might be "too late" to solve the
> > problem in the future
> 
> As you point out, we have a certain number of commits already. At the
> moment we can probably deal with these but the longer we leave it, the
> more commits and the more I'd not want to rebase things. We also have
> the FILE_PR issue to consider and we need to revert that commit by some
> means and find a better solution (I think even zecke agrees with that
> but we'll discuss that in another thread).

I've run some tests and to fix things, someone needs to make a checkout
and then run:

git filter-branch --parent-filter  'test $GIT_COMMIT = e3d1546d2c1ec9fd00af7780ba41250496153b15 && echo || cat' -- --all

which will remove the bitkeeper data from the history. We can then graft
it back in with:

echo "b97239969db33bf4be1b5f5807eae4d1d2987ca1 c8e5702127e507e82e6f68a4b8c546803accea9d fc6dcc1f1f0eabd8f2a465f219ffcd2554deec04" > .git/info/grafts

(where b97239969db33bf4be1b5f5807eae4d1d2987ca1 is the revision
e3d1546d2c1ec9fd00af7780ba41250496153b15 became. Just to illustrate how
broken the bkcvs conversion is, look at the diff between the git and
bkcvs history:

git diff fc6dcc1f1f0eabd8f2a465f219ffcd2554deec04  b97239969db33bf4be1b5f5807eae4d1d2987ca1

The reason this is huge is that we seem to have ton of zero length
files. Given its so totally broken I'm keen to do the above so we need a
plan. I propose:

a) repo goes read only
b) checkout is made
c) conversion is run
d) sanity checks are made
e) new revisions are pushed
f) graft is added to the main OE repo
g) commits based on the old history are blocked
h) repo is made writable again
i) people are advised to rebase any unpushed changes

Is anyone strongly against this? If not, when should we do this?

Richard




