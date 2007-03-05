Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HOA6o-000676-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 11:07:58 +0100
Received: by nz-out-0506.google.com with SMTP id m22so1355760nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2007 02:07:57 -0800 (PST)
Received: by 10.35.93.1 with SMTP id v1mr2288802pyl.1173089277249;
	Mon, 05 Mar 2007 02:07:57 -0800 (PST)
Received: from cube ( [82.193.98.6])
	by mx.google.com with ESMTP id 38sm8589137nzf.2007.03.05.02.07.55;
	Mon, 05 Mar 2007 02:07:56 -0800 (PST)
Date: Mon, 5 Mar 2007 12:07:53 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1598867211.20070305120753@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200703050912.44261.openembedded@hrw.one.pl>
References: <407130732.20070227223500@gmail.com>
	<1173051658.5832.26.camel@localhost.localdomain>
	<45EBBF38.4020704@dominion.kabel.utwente.nl>
	<200703050912.44261.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Mon, 05 Mar 2007 10:07:58 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hello Marcin,

Monday, March 5, 2007, 10:12:43 AM, you wrote:

> Dnia poniedzia³ek, 5 marca 2007, Koen Kooi napisa³:
>> Richard Purdie schreef:
>> > On Mon, 2007-03-05 at 01:30 +0200, Paul Sokolovsky wrote:

>> > You only ask for screen size but I can guarantee that wouldn't be the
>> > last request. I'm dead set against this.

>> Me too, since you will get something like this:

> -1 from me too

>> application_1.4.5-r5_bigscreen.ipk
>> application_1.4.5-r5_ppc603e.ipk
>> application_1.4.5-r5_armv5te.ipk
>> application_1.4.5-r5_smallscreen.ipk

>> Now Marcin wants to install 'application' on his webpad and it doesn't
>> run. Why? Because 'application_1.4.5-r5_bigscreen.ipk' secretly is ARM
>> instead of x86.

> And what is bigscreen? VGA? SVGA? XGA? or maybe 1680x1050 which I use 
> under OE/x86 chroot system?

> Instead of using crypto names like smallscreen/bigscreen we should use
> MACHINE_ namespace instead:

> MACHINE_SCREEN_RESOLUTION = "vga/svga/qvga/xga/wxga/hvga" etc
> MACHINE_SCREEN_DPI = "100/280/75"

  I spelled my IMHO on this already too:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-February/001539.html


  Let me factor it out if that mail was too long:

"IMHO, "smallscreen" and "bigscreen" heuristic designators we use now
are the best thing we could have in our situation. There were
proposals on adding absolute screen properties, but IMHO, that
wouldn't give us much use, because 1) for most machines values will be
still approximate at best, and 2) we'd quickly decide that it's cool that
we have that info now, but bitbake sucks, and it's too inefficient to
actually use those info, so we shouldn't use it.
  And besides, simple "smallscreen" vs "bigscreen" dichotomy
corresponds to what packages actually provides in real life - mostly,
just 2 sets of icons, etc."

  So, why I'm personally proponent of using objective parameters
whenever possible, in this case, using subjective, heuristic values
like "smallscreen" and "bigscreen" will save us from interpretation
complexities.



  As for definition of what "smallscreen" and "bigscreen", it must be
simple and just capture what we already have:

"There're guidelines (see appendix 1) of choosing
smallscreen/bigscreen for a given display device, plus, as usual, new
devices should be consistent with already existent assignments. But
ultimately, the selection is upon machine maintainer's choice and
consciousness.

Appendix 1:
1. If display device has relatively low DPI resolution, "smallscreen"
is a good choice regardless of actual pixel dimensions, as that will
allow to save screen real estate for more user information.
2. If display device has relatively low (sub-VGA) pixel dimensions,
use "smallscreen" as it is just too small to use bigger fonts, icons,
etc.
3. If display device has relatively high DPI resolution, use
"bigscreen" to save users' health.
4. If display device has relatively pixel dimensions, and following
guideline #1 will lead to awkward usability (like, easily
distinguishable for eyes icons, but which still can be lost in big
screen space), use "bigscreen"
"


> Because Neo1973 is smallscreen (2.8") but VGA (so bigscreen). I do not
> feel good with using full AbiWord on it but probably AbiWord embedded 
> will be OK.

  So, this is more or less subjective already (as full AbiWord could
be run on VGA, and some people would vote for "fullness"). But if
we'll try to express this subjectiveness in terms of the absolute
parameters, we'll at first will get mess and inconsistency, and long
time will be required to establish sane guidelines.




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



