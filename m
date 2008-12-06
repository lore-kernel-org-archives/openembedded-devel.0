Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1L967x-0003uo-Sg
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 00:00:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6MuDsO026755
	for <openembedded-devel@openembedded.org>; Sat, 6 Dec 2008 22:56:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26636-03 for <openembedded-devel@openembedded.org>;
	Sat,  6 Dec 2008 22:56:09 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB6Mu8eL026749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 6 Dec 2008 22:56:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20081207001358.17e45205@widy.localdomain>
References: <1228574376.5375.6.camel@dax.rpnet.com>
	<ghe5v4$9hp$1@ger.gmane.org> <20081207001358.17e45205@widy.localdomain>
Date: Sat, 06 Dec 2008 22:56:10 +0000
Message-Id: <1228604170.5375.14.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake release
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
X-List-Received-Date: Sat, 06 Dec 2008 23:00:15 -0000
X-List-Received-Date: Sat, 06 Dec 2008 23:00:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-12-07 at 00:13 +0200, Paul Sokolovsky wrote:
> On Sat, 06 Dec 2008 16:32:52 +0100
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > On 06-12-08 15:39, Richard Purdie wrote:
> > > As people have probably noticed I just synced up a number of useful
> > > changes from Poky into bitbake and brought things pretty much back
> > > into sync.
> > >
> > > The current plan is to let this stabilise for 1 week and the
> > > providing no major bugs were introduced, make a new release
> > > (finally!).
> > 
> > Not a bug, but something for people to note:
> > 
> > http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-October/006289.html
> 
> I actually wonder why these (and few other) vars are not whitelisted by
> default.

Good question and there are several reasons:

1. MACHINE and DISTRO mean nothing to bitbake, they're only given
meaning by the OE metadata. Whitelisting them would mean adding them to
bitbake which is the wrong place to have knowledge of OE variables.

2. Changing variables from the environment is a risky business. If you
do that and don't invalidate the cache strange things can happen. You
can take special precautions such as making the cache path MACHINE
specific which "solves" the problem. Not every configuration is going to
know to do things like this.

I therefore decided that if people want to whitelist those variables and
use them from the environment, they should do so explicitly on a per
distro basis. Most distros and developers have environment setup scripts
and those scripts are the right place to make this kind of choice.
Hardcoding it into bitbake would be a bad thing.

Note that there is a list of variables that bitbake does auto whitelist
which is in lib/bb/utils.py. Those variables are common system variables
like PATH, not OE specific ones like MACHINE or DISTRO though.

Cheers,

Richard





