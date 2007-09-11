Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVDA3-000487-Em
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 23:20:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BLHdpR028375
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:17:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28148-06 for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:17:35 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BLHWrL028357
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:17:32 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
Date: Tue, 11 Sep 2007 22:17:32 +0100
Message-Id: <1189545452.6163.65.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Tue, 11 Sep 2007 21:20:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've covered USE flags in a different mail so I'm ignoring that in this
reply.

On Tue, 2007-09-11 at 19:37 +0200, Leon Woestenberg wrote:
> The TASK-* and *FEATURES approach looked good at first instance, but I
> have reverted from using it, as it still results in a major cloud of
> package (build) dependencies.

This is the same issue Marcin wants to address.

> My current approach is maintaining an overlay with copied and adapted
> options and dependencies but I would rather see this supported within
> OpenEmbedded.

Is this overlay public? Even if we can't use it directly a summary of
what you find unacceptable of the current approach in OE would be useful
to see. Personally, I don't think there are that many dependency issues
but I'd be interested to see how much of OE you needed to patch. Perhaps
you could write a quick summary?

We're never going to manage something that works for everyone perfectly
out the box but I think things can certainly be improved from where they
are now.

Also keep in mind the task-base I checked in was very much a first
draft, it has evolved since and I'm fully expecting it to evolve again
in the future! :)

Cheers,

Richard



