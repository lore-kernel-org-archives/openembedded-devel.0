Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HM9GB-0007XU-I4
	for openembedded-devel@openembedded.org; Tue, 27 Feb 2007 21:49:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1RKnEvo028624;
	Tue, 27 Feb 2007 20:49:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28411-05; Tue, 27 Feb 2007 20:49:09 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1RKn0LI028577
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 27 Feb 2007 20:49:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <407130732.20070227223500@gmail.com>
References: <407130732.20070227223500@gmail.com>
Date: Tue, 27 Feb 2007 20:49:01 +0000
Message-Id: <1172609341.28406.169.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Tue, 27 Feb 2007 20:49:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-27 at 22:35 +0200, Paul Sokolovsky wrote:
> This code was committed, as it doesn't affect any existing aspect of
> OE. Please feel free to tweak it, and of course use!

So its not really a RFC, is it? ;-)

I think base_conditional was added but left pretty dumb since we worried
that if it was too generic it might get too many users. Inline python in
the variables hits bitbake and parsing hard and its not something I'd
like to encourage. Holger might have more specific comments. There are
usually better ways to achieve the end result in a more bitbake like
way. Also, personally I find the inline python really hard to read too.

If we are going to do it, I'd prefer to see a set functions in their own
class inherited by base.

Yes, I realise I was guilty of adding a couple of these functions with
task-base. They're mainly used in a couple of specific .bb files rather
than the core classes and hopefully their usefulness outweights any
speed penalty though...

Cheers,

Richard 




