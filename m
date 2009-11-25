Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NDJMb-0006qS-8l
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 16:01:04 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPEuCbK004533 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:56:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PnKpOqYEipH5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:56:12 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPEu7Ox004526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:56:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0911230831x44589834ga3fce8c59d29a45d@mail.gmail.com>
References: <1258645184.5229.46.camel@dax.rpnet.com>
	<c384c5ea0911230831x44589834ga3fce8c59d29a45d@mail.gmail.com>
Date: Wed, 25 Nov 2009 14:59:40 +0000
Message-Id: <1259161180.10321.211.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE.dev staging changes - Progress so far
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
X-List-Received-Date: Wed, 25 Nov 2009 15:01:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 17:31 +0100, Leon Woestenberg wrote:
> On Thu, Nov 19, 2009 at 4:39 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > d) Start removing legacy do_stage functions and convert exclusively to
> >   the new model
> >
> > Not really started yet. Poky has now converted all of its recipes to the
> > new model and has no legacy staging however so there are plenty of
> > examples out there.
> >
> Where is this work happening (branch?) and who is expected to work on this?

Its going to happen in org.openembedded.dev over the next few weeks as
far as I know.

I'd really like some help with this, I don't think I can do it alone.
I've converted Poky entirely which is hopefully proof it works and can
be done along with providing a ton of examples. 

> I would especially see the toolchain bits up-to-date, and would like
> to help, but this will certainly introduce breakage at some point.

I'm hoping most of that is behind us. Obviously if the conversion isn't
made correctly there is a risk of breakage but outside of the areas like
toolchains, it should be contained to small areas.

Cheers,

Richard




