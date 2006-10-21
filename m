Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GbFnx-0005zj-2w
	for openembedded-devel@openembedded.org; Sat, 21 Oct 2006 14:18:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9LCB29R024417;
	Sat, 21 Oct 2006 13:11:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22091-09; Sat, 21 Oct 2006 13:10:59 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9LCAtWt024410
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sat, 21 Oct 2006 13:10:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <eh4kc9$63q$1@sea.gmane.org>
References: <eh4jbk$29v$1@sea.gmane.org>  <eh4kc9$63q$1@sea.gmane.org>
Date: Sat, 21 Oct 2006 13:10:55 +0100
Message-Id: <1161432655.6643.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Rob Kramer <robk@starhub.net.sg>
Subject: Re: Bitbake-1.6 crashes on 'which'.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 12:18:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-10-18 at 15:19 +0800, Rob Kramer wrote:
> Rob Kramer wrote:
> 
> > I had to patch 1.6 as below, copied from trunk/bitbake.
> 
> Or not; this dies elsewhere. Am I supposed to use 1.6 branch in the first
> place? I'll try trunk for now..

The patch in 1.7 is for a different problem. I've just updated the 1.6
branch with the correct fix (add import bb to the top of shell.py).

Thanks for reporting it.

Cheers,

Richard



