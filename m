Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LKM9S-0002pU-RY
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 01:20:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n070Dx99004500
	for <openembedded-devel@openembedded.org>; Wed, 7 Jan 2009 00:13:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04437-01 for <openembedded-devel@openembedded.org>;
	Wed,  7 Jan 2009 00:13:55 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n070DqdF004482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 7 Jan 2009 00:13:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <d2b9ea600901061251n67c641a4ie03b8a552f3c4990@mail.gmail.com>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
	<gjtg1m$rsd$1@ger.gmane.org>
	<d2b9ea600901061251n67c641a4ie03b8a552f3c4990@mail.gmail.com>
Date: Wed, 07 Jan 2009 00:14:26 +0000
Message-Id: <1231287266.5330.113.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native	and sdk recipes)
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
X-List-Received-Date: Wed, 07 Jan 2009 00:20:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2009-01-06 at 21:51 +0100, Esben Haabendal wrote:
> On Mon, Jan 5, 2009 at 6:29 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
> >> I'm sorry, but this seems like a dangerous way of starting confusion of terms.
> >> MACHINE in how I see OE is really the _TARGET_, ie. the small device this all
> >> is targeted at.
> >
> > MACHINE is where the generated stuff will _run_ on, so MACHINE=x86
> > SDKTARGET=armv5te would be more in line with what OE expects, but I agree it
> > can be confusing if you are thinking in autotools terms.
> 
> Exactly. Let's stick with the solution that applys best to the golden
> "Rule of Least Surprise",
> which I believe in the case of the average OE user would be as Koen suggests.

Well, someone has to take a step back and check whether what we're doing
is sane, extensible and in keeping with OE's global architecture. Sadly
I'm concluding that the sdk class does things incorrectly, even
dangerously and that the canadian stuff just compounds the error. The
canadian stuff is actually over complicated due to this.

The reason OE is successful, keeps growing and is so powerful/extensible
is down to the core architecture being clean and kept to strong
principles.

Also, for the record I've played a large part in developing the sdk and
meta-toolchain stuff so I'm at least partially responsible for the
current mess. I do now think I got that wrong though.

Having said this, the canadian stuff is valuable and I don't want that
work to get lost or its developers to get demotivated. It does fill a
current need too.

So I propose we allow the canadian stuff to merge on the understanding
that its doing things the wrong way and that we will most likely change
to the "right" way in due course even if its less intuitive. That change
may well break things but we're saying now this will happen and that
people shouldn't be surprised.

Is that reasonable?

As for the mechanics of merging the branch, I'd like this to go in
stages and will follow up with further email/discussion on that subject.
I'm under time pressures at the moment so this won't be until later this
week though. Sorry for the delay :(.

Also, people keep talking about building sdks for more than one machine
with one bitbake command and other similar things. This is a really
tricky idea and needs a lot of careful thought so as not to pull down
the whole architecture. It is not a trivial issue.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



