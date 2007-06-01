Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Hu7OJ-0001Xw-Pd
	for openembedded-devel@openembedded.org; Fri, 01 Jun 2007 15:42:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l51DeGnf020256
	for <openembedded-devel@openembedded.org>;
	Fri, 1 Jun 2007 14:40:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20102-04 for <openembedded-devel@openembedded.org>;
	Fri,  1 Jun 2007 14:40:13 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l51DeAXM020249
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 1 Jun 2007 14:40:10 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
Date: Fri, 01 Jun 2007 14:40:09 +0100
Message-Id: <1180705209.6390.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Fri, 01 Jun 2007 13:42:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-05-30 at 19:42 -0300, Rodrigo Vivi wrote:
> Some days ago I was using the bitbake1.6 to build my packages and it
> was working fine, but someday without any apparently reason it stopped
> to work.
> 
> Then, after a big looser fight I've decided to change to bitbake1.8
> and the problem was apparently solved... I was seeing the packages
> being build...
> But in the end, for my surprise, I've noticed that a lot of depends
> wasn't build!
> 
> Since my task file is not under official repository yet I'm sending in
> this email.
> 
> Does any body have any idea?

I was puzzled by this when I first read it as I didn't understand the
problem. If people explain problems clearly, you're more likely to get
answers...

Based on this in irc:

13:14:36] <koen> vivijim: it looks like the problem florian had, RP had
a patch for it iirc
[13:14:56] <koen> something to force do_package_write to run when
building tasks
[13:15:06] <vivijim> when I use bitbake bash it calls every function
including do_package_write but when I use bitbake task-mamona it call
do_package but not do_package_write...

I think I realise the problem - wrong expectations of task-mamona. 

A task package's sole purpose is to build a set of packages with
appropriate dependencies.

A meta package causes all its sub package to build. Have a look at some
of the meta-*.bb files and create a meta-mamona.bb, probably inheriting
meta.bbclass. You can always have the meta package refer to the task
package.

Cheers,

Richard



