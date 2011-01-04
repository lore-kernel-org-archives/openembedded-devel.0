Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1Pa8zg-00013q-2s
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 16:40:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p04Fdqkh031558;
	Tue, 4 Jan 2011 15:39:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31246-05; Tue,  4 Jan 2011 15:39:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p04FdiDt031552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 4 Jan 2011 15:39:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <AANLkTi=YuEBqPtCGnutaW_-JF0F=ZwmT8OS8rCmr9886@mail.gmail.com>
References: <1293763348.17519.11220.camel@rex>
	<1293805474.18787.366.camel@eha> <1293911357.17519.17117.camel@rex>
	<AANLkTi=YuEBqPtCGnutaW_-JF0F=ZwmT8OS8rCmr9886@mail.gmail.com>
Date: Tue, 04 Jan 2011 15:39:29 +0000
Message-ID: <1294155569.17519.21577.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Tue, 04 Jan 2011 15:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-04 at 07:56 -0700, Chris Larson wrote:
> On Sat, Jan 1, 2011 at 12:49 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The split between the code in general in bitbake is in general ever
> > improving in my opinion. Chris has some some really great work on
> > bitbake recently, particularly making it more pythonic. Some of the
> > changes just before the holidays, particularly the UI changes on the
> > cooker to UI relationship make me uncomfortable, particularly if they
> > mean the xmlrpc client/server code no longer works. My concern is that
> > they cross the boundary into what I'd class as regressing an API
> > boundary, particularly one that is only in the early stages of being
> > properly established and that we very much need. I don't know if this is
> > an API you use or not but its the kind of thing we need to be careful
> > about. FWIW, its independent of the parallel parsing code and other
> > changes which is partly why I'm so concerned it was merged as is :(.
> 
> Unless you think parallel parsing is the only work I've done on
> bitbake, I fail to see what it being independent of parallel parsing
> has to do with anything.  Of course it's independent.  It's entirely
> different work for an entirely different purpose, done on different
> branches, and trying to compare them is pointless and means nothing.

I'd implied it might have been related in a previous email and I was
correcting that implication, nothing more, nothing less.

Trying to establish whether the threading code in the parallel parsing
is related or unrelated to the threading code for the UI is a perfectly
reasonable technical question. It is possible there were
interdependencies, it turns out there aren't.

This kind of response from you is frustrating. Trying to ask any
question results in a response like this and I don't think its
productive or helpful.

Cheers,

Richard




