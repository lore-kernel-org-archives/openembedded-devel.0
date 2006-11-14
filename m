Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GjnpR-0005Lh-VV
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 03:15:14 +0100
Received: by nf-out-0910.google.com with SMTP id l24so92853nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2006 18:13:12 -0800 (PST)
Received: by 10.48.142.8 with SMTP id p8mr378844nfd.1163470391524;
	Mon, 13 Nov 2006 18:13:11 -0800 (PST)
Received: from CUBE ( [82.193.96.239])
	by mx.google.com with ESMTP id r34sm698033nfc.2006.11.13.18.13.10;
	Mon, 13 Nov 2006 18:13:10 -0800 (PST)
Date: Tue, 14 Nov 2006 04:13:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1924023543.20061114041312@gmail.com>
To: Bernhard Rosenkraenzer <bero@arklinux.org>
In-Reply-To: <200611121700.28434.bero@arklinux.org>
References: <200611121700.28434.bero@arklinux.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: PDA Hardware recommendations?
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
X-List-Received-Date: Tue, 14 Nov 2006 02:15:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Bernhard,

Sunday, November 12, 2006, 6:00:28 PM, you wrote:

> Hi,
> we're looking for a PDA for a small scale project - unfortunately, we're
> extremely low on funding, so we can't just try out loads of different 
> hardware or put lots of work into porting the OS.

> Any recommendations for the best PDAs to run Linux (2.6) on?

> Requirements for our project:
> - Must be able to run Linux/OE
> - It must be possible to completely kill off Windoze CE (preferrably it
>   shouldn't be on there in the first place, we hate throwing money at M$
>   as much as everyone else -- but that would limit choice quite a bit...)

    Yep ;-) Maybe not the choice, but (so far), affordability for sure.
So, you can either wait for the nice affordable Linux hardware, or
turn your politics the other way around - they can do it whatever - it
still will run Linux ;-)

> - Built-in GPS receiver (alternatively, working bluetooth port for use
>   with a bluetooth GPS receiver)
> - Built-in WLAN
- Decent CPU (>>= 300 MHz)
> - CF- and/or SD card reader+writer
> - Affordable price
> Nice to have, but not 100% required:
> - GPRS and/or UMTS for internet access
> - bootable from CF/SD card

  GPS, Bluetooth, WiFi, and GSM builtin? What would be "affordable"
for you for this? ;-) Sub-$1000? You'll fit ;-I. But having all that
stuff builtin is current hot spot fo the industry, and by definition
can't be effordable.

  Anyway, some ideas. I'm not sure about the state of native Linux
devices like Zauri (see above about affordability, plus accessibility
in some places of world), so I watch only PocetPC/Palm realm. And
here's the status:

1. WLAN: there's no device with perfectly working builtin WiFi.
There's at least one which "just" works.
2. There's no device with perfectly working GSM functionality,
especially voice. There're some (more than one AFAIK) which do GPRS
more or less well.
3. I didn't hear of elaborated port of any GPS-builtin device at all.

  Regardings specific recommendations, let me start with shameless
plug regarding iPaq h4000, port of which I maintain - nice
small-factor device with BT and WiFi. Both not supported yet ;-I. But
drivers exist, need "just to adjust" them to device. Consider it ;-).

  If that didn't work, well, hx4700 is the most advanced device and
port made by handhelds.org. People use it to do commercial projects.
That's exactly the device which has builtin WiFi working (h4000 uses the
same chipset, so...). Caveat: doesn't go as "affordable" for me. Even
being out of production, stays pretty expensive, being nicely packaged
device (did I mention it's VGA)?

  If you want something cheaper but still well supported, h2200 is
there. Lacks WiFi, there's CF for it.

  Finally, if you really can't live without GSM, h6300 is GSM+BT+WiFi,
and being one of the first iPaq smartphones and apparently out of
production, surprisingly cheap. Hardware is not perfectly supported
yet, though.


  All of these 4 mentioned devices are supported well in OE, and
already have snaphsot images built regularly for Angstrom:
http://www.angstrom-distribution.org/unstable/images/20061109/


  Get better idea of what people ever scratched:
http://handhelds.org/moin/moin.cgi/SupportedHandheldSummary

  Get idea what's inside:
http://handhelds.org/moin/moin.cgi/HandheldHardwareXref

(For example, TI's TNETW1100 aka ACX100 WiFi chipset is known to be
used in 12(!) PDAs already. So, if you choose to hack on its driver,
you'll help sizable share of community.)


> Of course any modifications we make to OE/Opie/... and any extra apps (with
> one possible exception -- that will contain 3rd party code where we don't
> have a lot of influence on the license) will be given back to the community
> instantly.

> Thanks,
> bero


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



