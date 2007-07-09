Received: from [66.249.90.178] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7uGv-0006Jq-O4
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:31:30 +0200
Received: by ik-out-1112.google.com with SMTP id c30so556210ika
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 07:25:53 -0700 (PDT)
Received: by 10.78.146.11 with SMTP id t11mr1604971hud.1183991152947;
	Mon, 09 Jul 2007 07:25:52 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id g1sm62124572muf.2007.07.09.07.25.51
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 07:25:52 -0700 (PDT)
Date: Mon, 9 Jul 2007 17:25:37 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <15110327374.20070709172537@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20070709140338.GE2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
	<13810026301.20070709155245@vanille-media.de>
	<20070709140338.GE2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 14:31:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Graeme,

Monday, July 9, 2007, 5:03:38 PM, you wrote:

> On Mon, Jul 09, 2007 at 03:52:45PM +0200, Dr. Michael Lauer wrote:
>> Heh, it's not just Opie. Eventually we may want to ship prerendered png's for
>> UI elements. We better know about the size and dpi of the displays to
>> get sane defaults. There's a whole lot of packages which could use the
>> MACHINE namespace to improve targetting the platforms specifics at
>> build time.
>> 
> I just worry what happens to machines without screens but that can have
> gfx cards added. By the current level of thought behind these variables
> a divide by zero is inevitable.

  Where is division here at all?

> It also triggers my gut feeling of "this is the wrong way to crack the nut"

  Oh, let me say it *again*. *All* software should be made to adapt to
different screen sizes (including small) and other params dynamically,
at runtime. What will we patch today?

>> What makes you worry so much about adding more (imho necessary)
>> information to the MACHINE_ capability namespace?
>> 
> Nothing, but these variables seem little thought out and seem to be being
> rushed into use for one use case (opie backgrounds).

  Background in general to start with. I don't know exactly how
theming is handled for X, but we don't want to ship backgrounds of
800x600 sizes for QVGA devices there too, even if X would scale them.
Or at least, we may want to optimize. Second, I gave 2 usecases, not
1. And other participants gave more (though I can't say if those
usecases would better be handled in runtime right away).

  Otherwise, I indeed use otherwise pretty static (and needing cleanup
anyway) OPIE as a testbed for ideas on how we can minimize device
dependency and improve support and maintainability. I'm sure results
will be worthy more general application.

> And if it is neccessary then it should be the "correct" information,

  Please add correct, sure. There're guidelines for semantics, but
eventually details are up to device maintainer and users.
  
>  like
> for spitz the screen is 480x640 by default. Deal with it in packages that
> wish to use rotation correctly. Not just this value makes it easy for my
> magic background generator.

  Maybe your generator can use fbset right away?

> Maybe a MACHINE_DEFAULT_ROTATION is also needed.

  And many more others! But again, ultimate usefulness of resolution
is too allow to optimize install size (a random background is say 40k,
there's a difference if we install 40k or 5*40k, right). What would we
gain with specifying a default rotation? Only ability to preconfigure
device to be in user-expectable orientation instead of what its LCD
hardware has (which is good aim, btw ;-) ).

> Graeme




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



