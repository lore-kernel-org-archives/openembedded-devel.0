Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GbhQw-0002to-DO
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 19:48:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9MHf4FI031231
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:41:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30923-06 for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:41:01 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9MHextB031218
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:40:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <ehemhq$f0s$1@sea.gmane.org>
References: <eh4jbk$29v$1@sea.gmane.org> <eh4kc9$63q$1@sea.gmane.org>
	<1161432655.6643.2.camel@localhost.localdomain>
	<ehemhq$f0s$1@sea.gmane.org>
Date: Sun, 22 Oct 2006 18:41:00 +0100
Message-Id: <1161538860.5545.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake-1.6 crashes on 'which'.
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
X-List-Received-Date: Sun, 22 Oct 2006 17:48:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-10-22 at 10:57 +0800, Rob Kramer wrote:
> Richard Purdie wrote:
> > The patch in 1.7 is for a different problem. I've just updated the 1.6
> > branch with the correct fix (add import bb to the top of shell.py).
> 
> Thanks for that, it works again now. I still got the crash below, but that
> was after a bunch of reparse commands, which might have upset bitbake a bit
> perhaps.

I can't seem to reproduce that. Can you give a sequence of commands
which result in the failure?

Mickey: I suspect this is some problem with the shell's internal state?

Thanks,

Richard



