Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I8FKX-0006Xe-QE
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 15:00:51 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1336432ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 05:54:57 -0700 (PDT)
Received: by 10.86.59.3 with SMTP id h3mr102025fga.1184072097496;
	Tue, 10 Jul 2007 05:54:57 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id y2sm58527273mug.2007.07.10.05.54.55
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2007 05:54:55 -0700 (PDT)
Date: Tue, 10 Jul 2007 15:54:38 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <602819948.20070710155438@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1184064667.6435.45.camel@localhost.localdomain>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
	<126613333.20070709215755@vanille-media.de>
	<f6u4pj$fk0$1@sea.gmane.org> <f6ubg3$97c$1@sea.gmane.org>
	<309753579.20070710112118@vanille-media.de>
	<1184064667.6435.45.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: dbg packages
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
X-List-Received-Date: Tue, 10 Jul 2007 13:01:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, July 10, 2007, 1:51:07 PM, you wrote:

> On Tue, 2007-07-10 at 11:21 +0200, Dr. Michael Lauer wrote:
>> Rolf Leggewie wrote:
>> > Koen Kooi wrote:
>> >> Packaging is tedious, but let's not automate doing the wrong thing  
>> 
>> > I certainly agree with the general statement.  But I wonder if in this
>> > case it would not be OK to have just one big -dbg package per bb file
>> > even if there are more subpackages.  Going granular is certainly nice
>> > but I wonder if just having a dbg package suffices even if contains more
>> > than necessary.  I guess the -dbg packages should not be necessary most
>> > of the time.
>> 
>> > My vote would go for "bigger size" if it means "easier packaging right
>> > now instead of later" unless that entails "something breaks".
>> 
>> I totally agree. If I have to decide between slightly less granular
>> packaging of debug packages vs. tedious error-prone repetetive stating
>> of packaging for debug packages I gladly chose the first one.
>> 
>> For debugging, one or very few packages per recipe makes perfect sense to me.

> I also agree for what its worth, having one -dbg package per recipe
> isn't really a hardship since when you're debugging you usually have
> enough space not to worry about the slight extra space usage. In the
> past I've gone for the one -dbg package approach when packaging apps.

> Automating the debug package generation would be good. The best way to
> do it would probably be to allow full regexps in FILES rather than the
> existing rather limited python globs. Can we convert and maintain
> backwards compatibility?

  Let's add REFILES then? But mind empty dirs issue. Maybe for -dbg
it's worth to just add a specialized task? (REFILES are useful on their
own of course).

> Cheers,

> Richard




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



