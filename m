Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HTR47-0007w5-3v
	for openembedded-devel@openembedded.org; Tue, 20 Mar 2007 00:14:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2JNEvJf031715;
	Mon, 19 Mar 2007 23:14:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30426-10; Mon, 19 Mar 2007 23:14:54 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2JNEp7i031705
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 19 Mar 2007 23:14:51 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
Date: Mon, 19 Mar 2007 23:14:53 +0000
Message-Id: <1174346093.5824.89.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Epoch support for bitbake (was: Re: RFC: Xorg	Version Numbering)
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
X-List-Received-Date: Mon, 19 Mar 2007 23:14:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-01-31 at 16:40 +0100, pHilipp Zabel wrote:
> On 1/31/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> > Can anyone remember the specifics of the problem with bitbake? I guess
> > its easy enough to test and find out...
> >
> > /me adds looking at this to his todo list...
> > (unless anyone beats me to it ;-)
> 
> After some discussion on IRC, I came up with the attached patch.
> It adds support for a new integer variable PE (package epoch) in the
> version comparison code and bitbake cache.
> It also changes the code that handles PREFERRED_VERSION to optionally
> allow specifying PE (similar to how it is done with PR already).
> Especially the provider.py part is just a quick proof of concept. It
> always selects
> the package with the highest epoch first if the epoch is not
> explicitly mentioned
> in PREFERRED_VERSION.

Thanks for this, I just checked it in unchanged to bitbake trunk
(1.9.x). If people test it and are happy, I'm happy for it to be
backported for 1.8.2 too, at which point OE.dev can maybe start to rely
upon it.

Cheers,

Richard





