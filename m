Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQ6XQ-0004X9-Va
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 23:24:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 05C615074BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:11:42 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22254-10 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 12 Jul 2009 17:11:41 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DB1255061E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:11:41 -0400 (EDT)
Date: Sun, 12 Jul 2009 17:11:41 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247428960.24399.6.camel@port4>
Message-ID: <Pine.LNX.4.64.0907121710150.3621@juice.ott.cti.com>
References: <1247149089-23480-1-git-send-email-msmith@cbnco.com>
	<1247428960.24399.6.camel@port4>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] openssh.inc: cleanup
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
X-List-Received-Date: Sun, 12 Jul 2009 21:24:49 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 12 Jul 2009, GNUtoo wrote:

> On Thu, 2009-07-09 at 10:18 -0400, Michael Smith wrote:

> > Tested with 5.2p1.

> Did you test it at runtime?
> if so maybe we should remove that line(that was added because I didn't
> have time to test it extensively I only tested the ssh client...):
> DEFAULT_PREFERENCE = "-1" 
> in 5.2p1

Yes, I've been using the client, server, keygen and scp on x86.

I needed the second patch from here to remove some whining about 
setlogin() from syslog.

http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/glibc_tweaks/

Mike


