Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JCGWL-0001V6-Fu
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 16:37:41 +0100
Received: by fg-out-1718.google.com with SMTP id 22so4074594fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2008 07:30:41 -0800 (PST)
Received: by 10.86.79.19 with SMTP id c19mr21327739fgb.31.1199802519055;
	Tue, 08 Jan 2008 06:28:39 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id b17sm30145614fka.4.2008.01.08.06.28.36
	(version=SSLv3 cipher=OTHER); Tue, 08 Jan 2008 06:28:37 -0800 (PST)
Date: Tue, 8 Jan 2008 16:34:29 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1133928457.20080108163429@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <47825896.7030301@kernelconcepts.de>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Tue, 08 Jan 2008 15:37:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Monday, January 7, 2008, 6:51:34 PM, you wrote:

> Hi,

> Paul Sokolovsky schrieb:
>>   I've prepared a patch to make GtkFileChooser, a
>> contemporary gtk's file open/save widget, to suite small, PDA-like
>> screens (including QVGA) better.

>>   The patch is available at
>> http://bugs.openembedded.org/show_bug.cgi?id=3634 , with extensive
>> description at
>> http://pfalcon-oe.blogspot.com/2008/01/smallscreen-mod-for-gtkfilechooser.html

> Looks pretty good. I like the patch because it is not that intrusive.
> If you could make all changes depend on the screen size it would be worth trying
> to get it upstream. This might save us a lot of work in future.

  As Ross Burton of OpenedHand commented in my blog, they make steps
to upstream their changes, but of course that doesn't go smooth, it
takes time, refactors, waiting for new versions, etc. So, I'd prefer
to leave that to big guys, knowing that they care to make the future
bright. With my little-guy-who-scratches-his-and-fellow-users'-itches
hat on, I care about present being bright too, and sustainability of
the whole Linux-on-PDA effort. So, here's small patch optimized for a
given criteria (size), and I can maintain it in OE for now, even if
eventually it will be replaced by something else. In the meantime, I
have lotsa other patches ready, or in work, and working on them and
their upstreaming would be more beneficial imho.

  (Oh, and if someone has free big-guy-from-the-industry's hat, please
let me know ;-) ).

>> . I'm glad I've written it in high detail, because Koen quickly
>> pointed me to similar patches in Poky:
>> 
>> http://svn.o-hand.com/view/poky?rev=3408&view=rev
>> http://svn.o-hand.com/view/poky?rev=2596&view=rev
>> 
>>   I didn't try them, but they appear to make more invasive changes to
>> gtk+, though apparently add more features (for good, bad, or for
>> vendor's requirements).

> Do we have a screenshot around to see how it looks? :)

  I still didn't try it due to the above. I'd like first a confirmation
from Poky people that merging those patches to OE will be of benefit
to them (for example, wider testing). Then we can review the
functionality. I do worry a bit about QVGA support, as all latest OH
workings seems to be not optimized for it (Sato, Pimlico).

> Greetings

> Florian




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



