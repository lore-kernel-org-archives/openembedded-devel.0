Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GlF33-00058T-7r
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 02:31:13 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1591529nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 17:28:47 -0800 (PST)
Received: by 10.49.41.12 with SMTP id t12mr2924030nfj.1163813327677;
	Fri, 17 Nov 2006 17:28:47 -0800 (PST)
Received: from CUBE ( [82.193.96.239])
	by mx.google.com with ESMTP id d2sm7866546nfe.2006.11.17.17.28.46;
	Fri, 17 Nov 2006 17:28:47 -0800 (PST)
Date: Sat, 18 Nov 2006 03:28:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <649148844.20061118032845@gmail.com>
To: Erik Hovland <erik@hovland.org>
In-Reply-To: <20061117194106.GA25171@mage.jpl.nasa.gov>
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
	<74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
	<d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
	<455DF8E8.4060801@dominion.kabel.utwente.nl>
	<20061117194106.GA25171@mage.jpl.nasa.gov>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: A note about familiar-instable, was: Re[2]: Problem building dbus-glib-0.72
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
X-List-Received-Date: Sat, 18 Nov 2006 01:31:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Erik,

Friday, November 17, 2006, 9:41:06 PM, you wrote:

> On Fri, Nov 17, 2006 at 07:01:12PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>> 
>> Andrew Paulsen schreef:
>> >> I think dbus-glib 0.72 needs dbus >= 0.94.
>> >> The dbus-1.0 in the include path only denotes the protocol version.
>> >>
>> >> regards
>> >> Philipp
>> >
>> > Ok, I'll rephrase my question then.  How do I change the package
>> > versions that are being built?
>> >
>> > Again, my local.conf contains:
>> > MACHINE = "compulab-pxa270"
>> > DISTRO = "familiar-unstable"
>> >
>> > and I'm trying to "bitbake gpe-image"
>> 
>> Familiar is unmaintained in OE, so your error messages don't surprise us.

> I try to keep up, but I am afraid I have too many chores to keep
> familiar as fresh as I would like in OE.

  Well, the exact situation with "familiar-unstable" is that, taking
into account that Familiar development was forked into separate tree,
familiar-unstable.conf as it is in OE, has no relation to the Familiar
distro, because it does not build packages compatible with any
existing Familiar release. Again, as future release planning of
Familiar happens outside of mainline OE, it cannot be said that
familiar-unstable represents any future Familiar version.

  That is, "familiar-unstable" is just a random unmaintained distro,
nothing more.

  I was interested to make OE build Familiar-0.8.4 compatible
packages, and I actually made a distro config which does exactly that,
at least on few packages I tried. But for me, it was mostly a learning
exercise, testing how well OE keeps to its promise of easily
supporting different distros, consisting of different package
versions. Well, I knew it does, I was interested how much effort it
will take to do that for some real-world case. And while bitbake
latency makes this a bit of chore, it's more than doable.

  However, after communicating with OE maintainers, I decided not to
submit this config for mainline inclusion, nor even announce it
publicly on Familiar lists. The motivation was the anticipation that
such action may cause another coil of argument between Familiar and OE
teams, and that would be the last thing I personally wanted.

  Instead, I semi-privately contacted few persons I knew who might be
interested in that config, for example, for maintaining an updated
local feed. I got zero response, and this message is essentially a
last call, whether someone wants it. Note that while I initially
wanted to make more or less maintainable config, possibly with bitbake
external collection for packages already removed from OE.dev, I didn't
finish this due to the described lack of interest, so the only thing I
can offer is familiar-0.8.4-unstable.conf, which has
PREFERRED_VERSIONs for *some* of packages required by Familiar 0.8.4.
As OE.dev progresses rapidly, and old versions of packages are
removed, it may be the case that this config won't any longer work
OOB, and would need some tweaking before it will work.
  


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



