Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJ61v-0007lM-Qp
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2008 12:50:32 +0100
Received: by fg-out-1718.google.com with SMTP id 22so1487659fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2008 03:50:37 -0800 (PST)
Received: by 10.82.186.5 with SMTP id j5mr7604302buf.12.1201434637247;
	Sun, 27 Jan 2008 03:50:37 -0800 (PST)
Received: from widy.lan ( [88.231.90.74])
	by mx.google.com with ESMTPS id i7sm11544269nfh.18.2008.01.27.03.50.34
	(version=SSLv3 cipher=OTHER); Sun, 27 Jan 2008 03:50:35 -0800 (PST)
Date: Sun, 27 Jan 2008 14:02:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <259787717.20080127140202@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1201393407.4717.30.camel@localhost.localdomain>
References: <fnchem$8v4$1@ger.gmane.org>
	<200801260151.13034.mickey@vanille-media.de>
	<1201355021.4717.16.camel@localhost.localdomain>
	<1201393407.4717.30.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: strip "-native" from $S for native packages automatically (bug 1856)
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
X-List-Received-Date: Sun, 27 Jan 2008 11:50:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Sunday, January 27, 2008, 2:23:27 AM, you wrote:

> On Sat, 2008-01-26 at 13:43 +0000, Richard Purdie wrote:
>> On Sat, 2008-01-26 at 01:51 +0100, Michael 'Mickey' Lauer wrote:
>> > If we really want to have that (I'm -0 on that), I would rather propose
>> > 
>> > S = ${@"%s/%s" % ( bb.data.getVar("WORKDIR", d, 1), bb.data.getVar("P", d, 1).replace( "-native", "" ) ) }
>> 
>> Would it be worth adding syntax to bitbake for this kind of operation,
>> something like:
>> 
>> S *= "${S}-native"
>> 
>> ?

> This syntax doesn't solve the original problem of course.

> People have requested -= and I've been wondering if we should add that
> as a search and remove operator. To match the existing language that
> would have to work on space delimited lists though so its of no use to
> this use case. We could pair this with a *= or operator which worked the
> same way without the space delimiter like .= does...

> S *= "-native"

> ?

> maybe ~= would be a better pairing with -=?

  I personally don't like this operator obfuscation, which becomes
just that once obscure symbol combinations are used or well-known
operators from other languages are reused with different semantics.
All that will lead to very that Perl's $@#%&* stuff.

> Having syntax which allowed variable reuse like the original example
> above could also be useful:

> S = "foo"
> S *= "${S}-native"
> print bb.data.getVar("S", d, 1)
>     foo-native

> Does anyone have any other language enhancement requests for bitbake
> while I'm thinking about it (or any thoughts on the above)?

  Yes, I have. Those 'bb.data.getVar("S", d, 1)' looks quite
unaesthetically and brings thought that Python expression support is a
quick hack. Instead, it should be something like:

d2.get("S")
d2.get("S", expand = 0)

  Note the default for expanded grounded in common use.

  Stuff above could be then:

d2.get("S").replace("-native", "")

> Cheers,

> Richard


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



