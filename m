Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IOAyx-0002RH-8e
	for openembedded-devel@openembedded.org; Thu, 23 Aug 2007 13:36:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7NBZ1c0012716
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Aug 2007 12:35:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12585-04 for <openembedded-devel@openembedded.org>;
	Thu, 23 Aug 2007 12:34:57 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7NBYsNC012710
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Aug 2007 12:34:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46CD69E3.707@whitby.id.au>
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>
	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>
	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
	<46CD69E3.707@whitby.id.au>
Date: Thu, 23 Aug 2007 12:34:54 +0100
Message-Id: <1187868894.6210.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Thu, 23 Aug 2007 11:36:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-08-23 at 20:35 +0930, Rod Whitby wrote:
> yakov.zaytsev@gmail.com wrote:
> > ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
> > 
> > --
> > /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> > cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
> > command not found
> 
> You've been bitten by the "build crosses midnight GMT" bitbake bug.
> 
> Rebuild the affected package using "make rebuild-package-binutils-cross"
> if this occurs.  See Mickey's other email on the subject.

Surely that only affects packages with floating dates in the versions?

Richard



