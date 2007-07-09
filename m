Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I80zk-00082D-FO
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 23:42:14 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1233733ugd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 14:36:35 -0700 (PDT)
Received: by 10.78.168.1 with SMTP id q1mr1841517hue.1184016994644;
	Mon, 09 Jul 2007 14:36:34 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id e9sm46872866muf.2007.07.09.14.36.33
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 14:36:34 -0700 (PDT)
Date: Tue, 10 Jul 2007 00:36:22 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1404299021.20070710003622@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <f6u5bq$ht5$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
	<f6u5bq$ht5$1@sea.gmane.org>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 09 Jul 2007 21:42:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, July 9, 2007, 11:21:14 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Dr. Michael Lauer schreef:
>> To summarize:
>> 
>> It looks like we can agree to adding information to the
>> MACHINE_DISPLAY_ namespace.
>> 
>> However, we're undecided regarding the semantics. Some of think the
>> physical hardware information need to be there, some of us want the
>> logical (including kernel-level gfx hardware rotation), some of us
>> want a high-level meaning.

> and how about linux kernel 2.4 and 2.6 (or even 2.6.ancient and 2.6.recent) having
> different opinions on rotation, or maybe worse, having rotation specified via CMDLINE?

> I think OE should specify the hardware (since it's in the MACHINE namespace anyway) and
> have userspace deal with rotation and stuff.

> The main question remains: what are people going to (ab)use this for? If it's just for
> opie backgrounds I don't see why adding 3 or more lines to each and every machine is less
> work than adding one machine override to the background .

  Hopefully not just for OPIE. And it is still paradigmatic question -
where is the proper place for such information. With this change, we
move towards having machine-specific information in ... well, machine
config itself, not spread around the codebase, and that's apparently the
right direction of changes.

>> This is Poky version of that part XServer script - no machine related code
>> at all. Of course it support only machines with formfactor defines.
> 
> So you have the exact same problem, but in a different place. And as a side-effect, the
> image can't be shared between machines anymore, since only one config is present in
> formfactor.

  As if we had too good multi-machine shareability before... And it's
still about doing the right abstraction in the right place. It's only
one step from current formfactor implementation which uses build-time
file override to one which keeps DB of machine configs and dispatches
on them. And both these implementations can be used as needed,
transparently to the rest of system. And in general, it removes adhoc
case dispatches from different places, putting them in one clean
place.

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



