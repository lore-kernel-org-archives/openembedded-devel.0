Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GbhOM-0002r5-4t
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 19:45:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9MHcNhU031091
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:38:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30736-07 for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:38:08 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9MHc6nA031075
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Oct 2006 18:38:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <453AA142.4070002@dominion.kabel.utwente.nl>
References: <453AA01B.5040300@dominion.kabel.utwente.nl>
	<453AA142.4070002@dominion.kabel.utwente.nl>
Date: Sun, 22 Oct 2006 18:38:07 +0100
Message-Id: <1161538687.5545.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Fwd: [oe-commits] org.oe.dev package.bbclass: Fix	split_locales to	remove spurious references to -dbg packages.
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
X-List-Received-Date: Sun, 22 Oct 2006 17:45:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-10-22 at 00:37 +0200, Koen Kooi wrote:
> > Should we bump PR on affected packages if this fix works?
> 
> That would be these:
> 
> koen@bitbake:~/OE/monotone/org.openembedded.dev/packages$ grep do_split_pac . -rn | awk
> '{print $1}' | awk -F_ '{print $1}' |  awk -F: '{print $1}' | uniq
[snip]

Its worse than that. Anything using do_split_locales was affected so
that's anything with locales :-(. I don't think bumping PR is therefore
realistic.

On a kind of related topic, I did a build from scratch in poky and I'm
quite disappointed with the number of .debug or other packaging errors
present and OE .dev probably has the same issues. I also seem to have a
load of .debug directories in images but that is perhaps as poky isn't
quite as much in sync with OE as I'd like.

Cheers,

Richard

btw, I won't be around much if at all until next Saturday.




