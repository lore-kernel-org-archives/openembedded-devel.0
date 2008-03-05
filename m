Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JWy6R-00049b-45
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 19:12:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25IB7Qc007432
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 18:11:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06976-10 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 18:11:03 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25IAx8x007421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 18:10:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 05 Mar 2008 18:11:01 +0000
Message-Id: <1204740661.8110.135.camel@dax.rpnet.com>
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
Subject: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Wed, 05 Mar 2008 18:12:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been banging my head against a wall with the rather strange things
gcc-cross-sdk is doing in OE.dev. I will write down my thoughts since I
will forget and others may find this useful in future.

I think most of the problem comes from people having different
expectations from the sdk classes. Our current sdk class is really a
"cross-sdk" and is not suitable for building sdk packages. What's the
difference?

qemu is a good example of an sdk package, it runs in /usr/local/foo/...
but doesn't have anything to do with the target.

gcc-cross-sdk is a good example of a "cross-sdk" package since it runs
in /usr/local/foo/... but is target specific.

When we build gcc-cross, our build triplet is made to equal the host
triplet. In this configuration, gcc takes a shortcut and uses its own
internal compiler to do the compiling (xgcc). If build != host, we're
into the situation where we have a Canadian cross and we need a separate
cross compiler. If gcc-cross is in staging already, we have this and it
does work but it is a fundamental change in behaviour to who things were
'designed'.

One of the changes I made to sdk.bbclass was to make the HOST_VENDOR =
TARGET_VENDOR to avoid problems with pollution of native staging when
building things like qemu-sdk and its dependencies. This meant that
build != host and caused the above problem. gcc-cross is not depended on
by gcc-cross-sdk but would work if it was present in staging. OE.dev is
therefore working from some people but since the dependencies aren't
setup to ensure gcc-cross builds first, it doesn't work for everyone.

gcc is filled with "build == host" checks. When that is the case it
makes assumptions which turn out to be dangerous since it assumes that
it can look in exec_prefix for things. Using build == host for
gcc-cross-sdk therefore makes me very nervous as whilst it works, its
likely to break

I don't doubt the usefulness of being able generate standalone compilers
with OE and the ability to add tools like pkgconfig and qemu to them.
Poky and its SDK has already shown how well these can work and its
hacked sdk class does remarkably well. 

I have to wonder how we should generate things properly though.
Currently our SDK approach can only generate SDK tools which will run on
the same architecture as it was built on. If we go for the Canadian
cross approach we should be able to support building an SDK for a
different arch (e.g. build i686 on x86_64 and vice versa). You then
start to wonder if there shouldn't be a machine/distro to do this
instead since its cross compiling although the idea doesn't quite fit.
You then start to wonder about automating sdk/native/whatever flavours
of packages at the bitbake level too.

There are also some other issues to do with ARCH_FLAGS_FOR_TARGET but I
won't complicate this with them.

What do I propose as a solution? I think the simplest thing is to would
be to do some/all of:

a) revert my sdk.bbclass changes
b) continue with our build == host assumption for gcc-cross-sdk for now
c) rename sdk.bbclass cross-sdk.bbclass
d) add a "real" sdk.bbclass

These aren't major changes, shouldn't cause much "fallout" and means OE
could still have Poky style sdk tool generation. We need to give the
whole thing some careful thought beyond this though...

Cheers,

Richard




