Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LL5jg-0005LR-AT
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 02:00:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n090sISb026209
	for <openembedded-devel@openembedded.org>; Fri, 9 Jan 2009 00:54:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26111-02 for <openembedded-devel@openembedded.org>;
	Fri,  9 Jan 2009 00:54:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n090sCu0026203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 9 Jan 2009 00:54:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1230858713.10424.4.camel@dax.rpnet.com>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
Date: Fri, 09 Jan 2009 00:54:50 +0000
Message-Id: <1231462490.6467.85.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Fri, 09 Jan 2009 01:00:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-01-02 at 01:11 +0000, Richard Purdie wrote:
> I just had a look through the trini/canadian-sdk branch and there are
> bits I like and bits I dislike. I'll try and provide some feedback in
> due course with a view to getting the less controversial bits merged. I
> have some tweaks in poky to do with dynamic library extension handling
> for example (from playing with darwin targets) where it would pay us to
> find a common solution.

Sorry for the delayed feedback, what I've looked at so far follows
below. It was easiest to extract some patches from your tree and make
some commits of my own so these are in:

http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/rpurdie/canadian-sofar

Basically I wanted to particularly review the changes to the existing OE
core classes/bitbake.conf. The changes in that branch are versions I'm
happy with. I had two concerns there:

1. I don't want to see ${HOST_EXEEXT} everywhere but I know why you 
   need it and this was something OE would inevitably face. As a 
   compromise I propose adding:

   EXEEXT = "${HOST_EXEEXT}"

   and using ${EXEEXT} which is fractionally less ugly for all common 
   uses. Could you update your patch to use ${EXEEXT} please assuming 
   we all agree on this. Its the same dilemma as the SOLIBS stuff I 
   have with Darwin :/

2. All the bb.data.inherits_class() stuff is ugly as sin and totally 
   unreadable. My series has a better patch.

Moving on to the rest of the code, I don't see a problem merging any of
the totally new files. How about the following merge process:

a) We push my tree into OE

b) You rebase onto my tree's changes and adjust the EXEEXT stuff.

c) You add changes which add the EXEEXT changes only to existing 
   recipes and commit that.

d) The checksums.ini changes are a no brainer.

e) You start adding the totally new files to OE directly in a logical 
   sequence of something like:

   i) Add canadian core classes (classes/canadian*)
   ii) Add mingw new recipes
   iii) Add misc support recipes (gmp/mprf-canadian)
   iv) Add new binutils recipes
   v) Add new gcc recipes

f) You make a diff of the remaining changes that are needed and we 
   review those.

Hopefully this reduces the overhead of the branch, lets you make
progress and then helps us review the remaining code.

Does that seam reasonable?

Things I've noticed in the rest of the patches are:

* The amount of code duplication in meta-toolchain/canadian-sdk - we 
  really need to think about refactoring that code. 
* I'm also not keen on the SDK_PREFIX -> SDK_PATH change. Why? It 
  breaks things for people. In fact please back this out before merging 
  anything above, I don't see a good reason for it.
* The choice of OVERRIDE you're using worries me as sdk- is far to much 
  of a generic expression. You don't use the overrides much and only 
  for DEFAULT_PREFERENCE. Can we not find a better way to do this and 
  avoid adding overrides? The fact these are there suggests something 
  with the PROVIDES and DEPENDS logic you're using is broken as it 
  should be fairly magic (and a lot of effort went into that for the 
  standard toolchains) :/

Also, this is all on the understanding I've previously mentioned that we
will need to rewrite and break this stuff at some point sooner or later.

Cheers,

Richard




