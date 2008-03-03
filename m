Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JWBlX-0004Cm-6s
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 15:35:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m23EYXQW025986
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 14:34:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25823-04 for <openembedded-devel@openembedded.org>;
	Mon,  3 Mar 2008 14:34:28 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m23EYQub025970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 14:34:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fqgs03$f44$1@ger.gmane.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<200803030207.40083.zecke@selfish.org>
	<1204537079.8095.19.camel@dax.rpnet.com>
	<200803031312.15859.zecke@selfish.org>  <fqgs03$f44$1@ger.gmane.org>
Date: Mon, 03 Mar 2008 14:34:26 +0000
Message-Id: <1204554867.8095.61.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Mon, 03 Mar 2008 14:35:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-03-03 at 13:46 +0100, Koen Kooi wrote:
> Holger Freyther schreef:
> The previous consensus to that proposal was "we should be able to do
> cleanups in-place". I still think we should start such a branch where we
> can do the clean up while retaining the history. Those cleanups would
> consist of:
> 
> a) basic janitorial stuff:
> 
> * running the recipe through oe-stylize.py and fix accordingly
> * document patches (origin, upstream status, etc)
> * restucrure FILESDIR to avoid duplicate files (e.g. files/foo.patch
> bar-1.0/foo.patch, etc)
> 
> b) updating to OE standards
> 
> * Replace custom methods with standards ones where appropriate (e.g.
> do_stage() -> autotools_stage_all
> * document remaining custom methods (e.g. do_configure_append sed magic)
> * sanitize PACKAGES and FILES
> * sanitize overrides (e.g. fix all the CONFFILES_nylon stuff)
> 
> c) unit testing
> 
> * compile for different archs
> * run through insane
> 
> Regardless if we create a branch for that or not, we should declare a
> freeze for e.g. 3 months where only bugfixes and cleanups are allowed to
> be checked in.

I like the idea of a cleanup process, I don't like the ideas of
branching or freezing since I think we don't have the manpower for it.

With this in mind I'd propose we just mark clean/active recipes somehow,
probably by setting a variable in them. We can then work out which
recipes have been looked at and which haven't which is the current
problem at the moment. Including a date in this variable might be good. 

One thing I did with Poky's autobuilder to improve QA was activating
world builds. We now have a list of known broken recipes in the
distro.conf file which excludes the problems from the world builds (with
reasons why). When people check anything further into Poky, we get to
know if it breaks anything "known to build" very quickly. Obviously I
aim to have a list of zero excludes eventually.

So, I guess what I'm saying is I'd like to see regular world builds of
OE with say Angstrom as a distro since it has the widest coverage and a
list of known failures created. Any new failures can then be identified
and both these and existing failures can be addressed over time.

I know angstrom is doing some kind of autobuilds but I don't know to
what extent or what policies govern what is built. I also know the nslu2
people maintain lists of packages to build and not to build. If we could
somehow pool this information that would be ideal.

I'm also giving serious consideration to expanding the suite of qemu
machines like qemuarm/qemux86 so even people without access to hardware
can run tests on the hardware QEMU supports. Poky uses the qemu machines
for the world builds on the basis that they make a good test target in
that if they build, most other things probably will too. The main thing
preventing me from doing this is time at the moment.

Cheers,

Richard




