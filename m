Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PZ7Se-0004WI-Kk for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 20:49:56 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01JpAwr018397; Sat, 1 Jan 2011 19:51:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F9KbRkigR0eb; Sat,  1 Jan 2011 19:51:10 +0000 (GMT)
Received: from [192.168.1.42] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01Jp41Q018393
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 1 Jan 2011 19:51:06 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293805474.18787.366.camel@eha>
References: <1293763348.17519.11220.camel@rex> <1293805474.18787.366.camel@eha>
Date: Sat, 01 Jan 2011 19:49:17 +0000
Message-ID: <1293911357.17519.17117.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Sat, 01 Jan 2011 19:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-12-31 at 15:24 +0100, Esben Haabendal wrote:
> While I do not and cannot be considered a maintainer in any form, I do
> have a special use for BitBake.  I use an (almost) upstream BitBake as
> part of the OE-lite project, and as such has rather strong investment in
> BitBake.
> 
> I do not use BitBake as a command, but as a Python module, as OE-lite
> has a different dependency and runqueue/cooker model.  Because of this I
> hope to find some time improve the separation between the parser, data
> and cooker in BitBake, but I will surely notice and have to do something
> about it if BitBake is regressed with regards to this.

I know we've talked about your use of bitbake and I'm aware of it at
least.

The split between the code in general in bitbake is in general ever
improving in my opinion. Chris has some some really great work on
bitbake recently, particularly making it more pythonic. Some of the
changes just before the holidays, particularly the UI changes on the
cooker to UI relationship make me uncomfortable, particularly if they
mean the xmlrpc client/server code no longer works. My concern is that
they cross the boundary into what I'd class as regressing an API
boundary, particularly one that is only in the early stages of being
properly established and that we very much need. I don't know if this is
an API you use or not but its the kind of thing we need to be careful
about. FWIW, its independent of the parallel parsing code and other
changes which is partly why I'm so concerned it was merged as is :(.

> As for merging with sstate, OE-lite uses a completely different staging
> model (simple per-recipe package based), and I would be very unhappy if
> merging sstate into BitBake will make it impossible for OE-lite to use
> upstream BitBake.  I haven't looked enough into the sstate
> implementation with regards to this yet though.

To put your mind at rest, there is no "policy" enforced by bitbake on
the way staging works in sstate. You might find the checksums useful and
you might be able to use them in your code but its all opt in. I'm
therefore not worried about this breaking OE-lite. If there are
problems, please just let us/me know and we'll see how we can fix that
but since everything is backwards compatible, it shouldn't be an issue.

> Most of all, I would like to stress that there actually are other users
> of BitBake than OE and Poky. I hope this is considered a good thing seen
> from a BitBake perspective, and not a disturbance.

Its what the bitbake developers have always wanted/intended. It doesn't
mean bitbake won't change as the need for functionality appears but we
will do our best to keep things backwards compatible within reason
(although replaced functionality will still get phased out over time if
nobody needs it).

I would suggest it would be time well spent for you to find a way to be
able to use a standard upstream bitbake rather than requiring any patch
set as it will then be easier to understand what functionality and APIs
are being used and what impact changes to bitbake have.

> If possible, perhaps we could have a small BitBake meeting at FOSDEM,
> trying to coordinate the way forward?

I think I will be at FOSDEM and as always, am happy to talk :). I don't
think Chris is likely to be there based on previous FOSDEMs but I could
be wrong.

Cheers,

Richard



