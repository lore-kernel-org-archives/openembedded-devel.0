Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1Ix3aH-0005qT-BZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 17:46:53 +0100
Received: by nf-out-0910.google.com with SMTP id h3so885338nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 08:44:01 -0800 (PST)
Received: by 10.82.190.2 with SMTP id n2mr10862220buf.1196176648494;
	Tue, 27 Nov 2007 07:17:28 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.91.6])
	by mx.google.com with ESMTPS id w6sm1746529gvf.2007.11.27.07.17.18
	(version=SSLv3 cipher=OTHER); Tue, 27 Nov 2007 07:17:27 -0800 (PST)
Date: Tue, 27 Nov 2007 17:19:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1868947900.20071127171928@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1196175943.6780.46.camel@localhost.localdomain>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
	<1712551091.20071127161727@gmail.com>
	<1196175943.6780.46.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Build-time vs run-time virtuals, was: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 16:46:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, November 27, 2007, 5:05:42 PM, you wrote:

> On Tue, 2007-11-27 at 16:17 +0200, Paul Sokolovsky wrote:
>> > On Tue, 2007-11-27 at 15:43 +0200, Paul Sokolovsky wrote:
>> > A proper use for RPROVIDES is for something like gtk+-directfb to
>> > RPROVIDE gtk+. If an app linked against one, it should be able to run
>> > against the other (I'm assuming thats the case, if its not there
>> > shouldn't be an RPROVIDES).
>> 
>> > Does that help explain things?
>> 
>>   Ok, in other words, you say that OE's, build-time, virtuals, are
>> completely different thing than package manager's Provides facilities,
>> also common called virtuals? 

> Yes.

[]

> Indeed. Thinking about this stuff makes my head hurt :).

> PROVIDES + virtual/* = good
> RPROVIDES + virtual/* = nightmare + bug

> My point was that any of the latter will never do what people want/need
> and should be removed. If we ever do that, we should use a namespace
> other than "virtual" too.

  Yes, thought about namespace came to my mind too. I wonder, if
there're any ideas regarding that. Indeed, reusing "virtual-" prefix
while being familiar, would be confusing ;-(. Any ideas about another
standard prefix, or there would be adhoc naming conventions? From the
examples given, at least sometimes it makes sense to use prefix-less
Provides names:

gtk+ - real package, also implicitly provides gtk+
gtk+-directfb - real packages, Provides gtk+

Or infamous libxine. I envision it should be:

libxine-x11, Provides libxine
libxine-qpe, Provides libxine

(The problem here is that actually built package will be linked
against real package, and thus would apparently pull its name via
shlib dependencies).

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



