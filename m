Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JevjJ-0000YE-Nh
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 18:17:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RHHXDX012849
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 17:17:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12803-02 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:17:29 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RHHRMl012843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 17:17:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 27 Mar 2008 17:17:29 +0000
Message-Id: <1206638249.4514.57.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 27 Mar 2008 17:17:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The core team has been discussing various issues at length. On the
opkg/ipkg issue the official position is that:

a) the commit was badly thought out
b) we need to document procedures for making changes
c) there should be no more infrastructure changes until documentation on
   the process is written and agreed[1]
d) the commit won't be reverted due to the reasons below
e) we agree some method is needed to select between ipkg and opkg ASAP
   to fix the damage that was done. 

Why not outright disapprove the revision?:

* Its been in too long, we needed to have acted quicker, now we'd need 
  some setup to handle reverting it properly and safely.
* The changes to meta-toolchain and packaged-staging.bbclass 'ok'
* rwhitby added now added a partial solution to address some of the 
  issues (thanks!)

Where do we go from here?

I think Marcin has a nogpg version opkg he will commit so people don't
have any issues with the increased size of ipkg. Does that and rwhitby's
symlink fix address everyone's concerns? If not can we document the
remaining issues and then hopefully address them.

Do we need something to select between opkg and ipkg or is everyone ok
with the symlinks?

OE management is more than aware there is a problem. The underlying
issue is we can't even seem to agree on how we make decisions :(.
Various topics are under discussion but until we solve that one I doubt
we can move forwards on anything else...

[1] There is work still in progress on packaged staging and I'd like to
propose that we see the packaged staging changes through to completion.
Off the top of the head there are the following remaining changes:

* Adding do_deploy to packaged-staging's knowledge. This is best done
with the patch for kernel.bbclass that thesing was been working on. I've
made some suggestions for tweaks (looking at the version already in
poky) and suggested he commits it after that.
* Fixing the problem with autotools_stage_all and multiple libraries of
the same name. We know what the problem is, we're just not sure of the
best way to fix it. This isn't any disagreement, just us (mainly me) not
wanting to change anything too much more in case it breaks again...

Regards,

Richard (on behalf of the majority of the core team)




