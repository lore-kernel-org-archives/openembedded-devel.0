Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7uUx-0006im-TC
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:45:59 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1160489ugd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 07:40:24 -0700 (PDT)
Received: by 10.82.178.11 with SMTP id a11mr8335709buf.1183992018274;
	Mon, 09 Jul 2007 07:40:18 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id y2sm55405310mug.2007.07.09.07.40.16
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 07:40:17 -0700 (PDT)
Date: Mon, 9 Jul 2007 17:40:03 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <716172870.20070709174003@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20070709142544.GF2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
	<13810026301.20070709155245@vanille-media.de>
	<20070709140338.GE2336@p3n3tr4t0r.internal>
	<4310707680.20070709161925@vanille-media.de>
	<20070709142544.GF2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Cc: "Dr. Michael Lauer" <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 09 Jul 2007 14:46:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Graeme,

Monday, July 9, 2007, 5:25:44 PM, you wrote:

> On Mon, Jul 09, 2007 at 04:19:25PM +0200, Dr. Michael Lauer wrote:
>> > Maybe a MACHINE_DEFAULT_ROTATION is also needed.
>> 
>> I don't think so. What applications care about is if portrait or
>> landscape is the common default and this is already encoded in HEIGHT
>> and WIDTH.
>> 
> Applications do care, a short snippet of /etc/X11/Xserver

>         "SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
>                 ARGS="$ARGS -dpi 200 -rgba rgb" ;;
>         "SHARP Spitz" | "SHARP Akita" | "SHARP Borzoi")
>                 ARGS="$ARGS -dpi 200 -rgba rgb -screen 480x640@270" ;;

> Why restrict yourself to the simple usecase of opie backgrounds when
> the information could be used in far better ways.

  So you see, why I was so enthusiastic about that formfactor thingy,
right? ;-)


> If this information was taken from MACHINE_ variables then a large chunk
> of this case statement could be removed. But the way you want to do it
> the information is in machine.conf, xserver-common somwhere, and a variety
> of other places. And all because you refuse to use real information but
> some pre-parsed info that is narrowly defined for one application.

  That's common problem of community discussions - they become
ontological arguments. And we discussed matter of screen size in
particular and other machine feature in general many times already.
Time to start with something, that's idea here ;-). I strongly believe
that we won't stop there, but go on.

  As for xserver-common, it's pretty simple, not we (OE) maintain it,
but GPE project, and they should be consulted if there're ready to
give away hardware param detection to standalone hardware
detection script. So again, not all can happen immediately, but I
really glad people care about this (because it was pain in the neck
for me all the time).


> Graeme


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



