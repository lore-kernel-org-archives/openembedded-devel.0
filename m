Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JCEHo-0001aZ-GB
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 14:14:32 +0100
Received: by fg-out-1718.google.com with SMTP id 22so4053080fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2008 05:07:33 -0800 (PST)
Received: by 10.86.84.5 with SMTP id h5mr21230638fgb.49.1199796138536;
	Tue, 08 Jan 2008 04:42:18 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm30022619fkx.11.2008.01.08.04.42.16
	(version=SSLv3 cipher=OTHER); Tue, 08 Jan 2008 04:42:17 -0800 (PST)
Date: Tue, 8 Jan 2008 14:48:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1327107593.20080108144808@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1199790856.4659.9.camel@localhost.localdomain>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
	<1199738665.4680.66.camel@localhost.localdomain>
	<1199742459.4680.69.camel@localhost.localdomain>
	<582475286.20080107235236@vanille-media.de>
	<1199790856.4659.9.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: Metadata Q/A (was: Another weird case of PACKAGES_DYNAMIC and task deps, it seems)
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
X-List-Received-Date: Tue, 08 Jan 2008 13:14:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, January 8, 2008, 1:14:16 PM, you wrote:

> On Mon, 2008-01-07 at 23:52 +0100, Michael 'Mickey' Lauer wrote:
>> Richard Purdie wrote:
>> > On Mon, 2008-01-07 at 20:44 +0000, Richard Purdie wrote:
>> >> My money is on:
>> >> 
>> >> DEPENDS_collie += "bc-native"
>> >> 
>> >> in linux-rp.inc. Try removing that...
>> 
>> > Confirmed and fixed in 00610b176af0e4f4563f78fb71dc1219c777d13e.
>> 
>> > Let me stress once again, += and overrides do not do what you expect. It
>> > adds "bc_native" to the variable named "DEPENDS_collie", not "DEPENDS".
>> 
>> > DEPENDS_append_collie = " bc-native" 
>> 
>> > is a very different thing and corrects this problem...
>> 
>> Can we
>> 
>> a) forbid variable assignment to foo_bar in general (when bar is not
>> in {append, prepend, <override>} ?

> Like SRC_URI = "" ?

> We have a lot of variables with _ in the names since it generally looks
> better than SRC-URI. I think we do need a policy on this though since it
> will:

> a) Bite us at some point
> b) It slows bitbake down (although I've never confirmed that)

> I actually have a idea rolling around the back of my head here. All our
> overrides are lowercase (I think). A lot of our variable names are upper
> case. I'm wondering if we'd get a speedup from allowing only lowercase
> overrides since bitbake could tell from inspection that "URI" would
> never be an override.

> This lets us keep the large number of uppercase variables with _ in the
> name and we can conceivably rename the lowercase ones since there are a
> lot less of them.

  Like module_autoload. Has been on my list for a long time. The
problem, it (ab)uses override-like syntax to do something completely
different. It actually tries to emulate dictionary with sh-like
syntax. So, when it says

module_autoload_evdev = "evdev"

, in developed language it would be module_autoload["evdev"] = "evdev".

  So, it's kinda special case, that's why I didn't get around to doing
something about it, but we probably should, because it's inconsistent.

>> b) have an extra Q/A class that scans the metadata for those kinds of
>> problems?

> If and only if we have some rules that tell us what the valid cases are.
> We'd probably need an exhaustive list of permitted overrides too.

  I also think that such tests are not really effective...

> Cheers,

> Richard




> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



