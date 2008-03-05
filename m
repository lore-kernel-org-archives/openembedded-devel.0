Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JX0BQ-00034K-8Q
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 21:26:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KOOJR016024
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:24:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15812-05 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 20:24:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KOD1w016008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:24:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
References: <1204740661.8110.135.camel@dax.rpnet.com>
	<c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
Date: Wed, 05 Mar 2008 20:24:15 +0000
Message-Id: <1204748655.8110.174.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Wed, 05 Mar 2008 20:26:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-05 at 20:06 +0100, Leon Woestenberg wrote:
> On Wed, Mar 5, 2008 at 7:11 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> >  What do I propose as a solution? I think the simplest thing is to would
> >  be to do some/all of:
> >
> >  a) revert my sdk.bbclass changes
> >  b) continue with our build == host assumption for gcc-cross-sdk for now
> >  c) rename sdk.bbclass cross-sdk.bbclass
> >  d) add a "real" sdk.bbclass
> >
> Before a), I would like to see a description of what we expect the
> different classes to do, simply because I have lost track. I
> understood we never  supported building Canadian cross-compilers, BTW.

The 'normal' situation for OE is:

  build = "build system"
  host = target = "set by machine config"

cross.bbclass: 

  build = host = "build system"
  target = "set by machine config"

native.bbclass:

  build = host = target = "build system"

sdk.bbclass (previously)

  build = host = "build system"
  target = "set by machine config"

sdk.bbclass (previously)

  build = "build system"
  host = "build system with modified vendor"
  target = "set by machine config"

> There are other projects that focus on the correctness of building
> cross toolchains*, canadian or non-canadian, and if we have clear
> requirements for each of our classes, I would like to see if I can
> understand what we do (correctly or not).

So sdk.bbclass did become a kind of Canadian cross but only with a
different vendor part of the triplet. I'd not realised this had changed
what gcc-cross-sdk was doing so drastically since it still worked!

"gcc" is a normal package, "gcc-initial" and "gcc-cross" are cross
packages, gcc-cross-sdk is an sdk package.

We could support building canadian cross if we wanted, Id propose a new
class for it though (sdk-canadian?). Does that cover what you wanted?

Cheers,

Richard




