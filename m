Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JPzDR-0003Qq-Ts
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 12:58:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FBwMVZ031706;
	Fri, 15 Feb 2008 11:58:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31357-08; Fri, 15 Feb 2008 11:58:18 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FBwGOJ031695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Feb 2008 11:58:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080215133238.7d8f7887@widy.localdomain>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
Date: Fri, 15 Feb 2008 11:58:15 +0000
Message-Id: <1203076695.8636.30.camel@dax.rpnet.com>
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
Cc: openembedded-devel@openembedded.org
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Fri, 15 Feb 2008 11:58:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sorry, I am aware of the thread but I haven't had time to respond
much :(.

On Fri, 2008-02-15 at 13:32 +0200, Paul Sokolovsky wrote:
> python package_do_package () {
> []
> }
> do_package[dirs] = "${D}"
> 
> Note sure how such declarative stuff can be converted to imperative
> style like above. Also, do_package is only part of the picture.
> Important thing is package_write. And the way it is implemented now,
> do_package_write is just a dummy anchor task. Subclasses do not
> implement it, but instead anchor using it in task sequence:
> 
> addtask package_write_ipk before do_package_write after do_package
> 
> This is weird. Richard, was it done this way? It makes impossible to
> imperatively call package writeout task ;-((.

This is deliberate. Its so if you have "deb" packaging enabled and then
switch to "ipk", everything just works since bitbake realises which
stamps are missing and builds the missing parts.

> Otherwise, regarding producing initramfs'ed kernel, I switched to the
> solution a-la initramfs-image-ipk - instead of trying to plug into
> existing kernel.bbclass task sequence, I made a separate task which
> builds kernel with initramfs included. Of course, that's not ideal -
> package with non-initramfsed kernel already written by that time, so
> new package would need to overwrite it ;-\. If package writing were
> possible at all, but it's not due to the above.
> 
> My current idea is to write package in separate recipe at all, stealing
> PV from the file.

I'm not sure this recursive bitbake calling is something we want to
encourage as its going to cause massive support nightmares and just
confuse people. What I'd prefer to see is a sequence like:

bitbake initramfs-image
bitbake initramfs-kernel

The initramfs-kernel recipe complains if it can't find a compatible
initramfs image and provides instructions on what you need to do to
create one.

Whilst this means the user has to run two commands, it also means they
see and understand what is going on.

Cheers,

Richard




