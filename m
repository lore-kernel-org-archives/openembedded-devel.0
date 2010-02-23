Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Njz1q-0008A1-4Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:58:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1NHtrfE024625
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 17:55:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24165-09 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 17:55:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1NHtj4R024619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 17:55:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51002201719jc6e694fudbd3eaacb47df0b2@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl>
	<b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com>
	<1266512303.6436.1199.camel@rex>
	<b6ebd0a51002191739r245abeafq23de526308a29bab@mail.gmail.com>
	<1266706695.2134.23.camel@dax.rpnet.com>
	<b6ebd0a51002201719jc6e694fudbd3eaacb47df0b2@mail.gmail.com>
Date: Tue, 23 Feb 2010 17:55:43 +0000
Message-ID: <1266947743.1714.521.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 23 Feb 2010 17:58:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-02-20 at 18:19 -0700, Chris Larson wrote:
> > I disagree but its pointless to take this further and spoil what
> > otherwise is a useful patch, we'll just add the default behaviour you
> > describe.
> 
> I see a few problems here.  First, there's more to a notion of priority than
> just 'prepend' and 'append'.  It's unlikely that a given layer will either
> way to override everything else, or be overridden by everything else.

I assume s/way/want/ above?

I agree there is more to it than that but you're arguing for a simple
default case which is just "prepend" or "append" effectively. I expect
most layers do want to override the preceding layer.

>  Second, the final resulting BBPATH will end up depending upon ordering
> anyway, because the prepend/appends will be applied based on the order of
> the parsing of the bblayer.conf files.

Most likely BBPATH and optionally BBFILE_COLLECTIONS will be appended or
prepended to which seems reasonable and BBFILES it doesn't matter.

>   Third, you seem to be retaining the
> separation between configuration file / class priority (BBPATH) and
> collection priority (BBFILE_COLLECTIONS, priority number).  Users see a
> layer/overlay/collection as a single entity, not two components whose
> interactions with everyone else may vary.

Well, the default case where there is no layer.conf file just needs to
become more complex and append to BBFILE_COLLECTIONS too then. You're
the one arguing for it :).

The default case should make them function as one I agree but where
there is a layer.conf I'd argue its up to that file to setup the righr
variables.

> If you're going to use a priority numbering scheme or something similar,
> defined by the layer, then everything should obey it, in my opinion, and
> BBPATH_prepend/append is not sufficient to reflect that priority scheme.

I propose no numbering scheme, just a convention for priorities e.g.:

Core metadata: 100
Supplementary metadata: 500
User metadata: 1000

So a user overlay would override supplementary metadata and so on
(assuming I have my numbers going the right way, I never can remember).


Take a step back again - we want a system where each overlay contains
data about what it contains and sets up bitbake's variables and any OE
specific variables to match the setup. The layer.conf in this case does
that well.

What it does badly is let the conf files know about each other so they
can fight over who does what, or let that be controlled from the
bblayers.conf file other than through ordering the BBLAYERS variable.
I'm open to ideas on how to work this better but think what I'm
proposing has ways of meeting all real world use cases?

Better ideas more than welcome!

Cheers,

Richard





