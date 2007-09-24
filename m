Received: from [64.251.82.10] (helo=mail.tranzeo.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <DWatkins@tranzeo.com>) id 1IZpJN-0005oT-Of
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 16:53:26 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 24 Sep 2007 07:48:54 -0700
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F1639@tranzeo-mail2.12stewart.tranzeo.com>
In-Reply-To: <46F587F7.4060501@balister.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] How should OE be used?
Thread-Index: Acf9YVJsWHrZJvR1Qmi0D23oAd9PcQBTGxIg
References: <46F587F7.4060501@balister.org>
From: "Darcy Watkins" <DWatkins@tranzeo.com>
To: <openembedded-devel@openembedded.org>
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 14:53:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>How do people use OE?
>
>  * Basic install image and user adds packages
>  * Install image that user does not change, part of a "product"

A colleague of mine at a different site took an April snapshot of OE and
used this as the basis of a toolchain and linux distro for an embedded
product.  They use the snapshot and have placed it into their own
version control system.  This approach, although it gives them control
and stability, obviously isolates them from the upstream.

I tried using OE, but could not get it to complete a build for PowerPC
405 (neither uclibc or glibc - both failed but in different ways.
Uclibc gets cross compiler badness errors - I think it is part of this
powerpc vs ppc stuff in Linux).  After days of frustration, I had to
bail out and use buildroot for this particular project instead.
Obviously OE has lots of ARM and x86 users, but the PPC support falls
behind because it isn't as popular.  I'll check back for a later
project.

Nevertheless, our approach is:
  - Need the host system to build the entire romable image
  - Target does NOT support any form of package install scheme
  - Upgrade is whole image rather than individual packages
  - Config NV database is stored separate from the firmware image
    (so that it doesn't get lost during upgrades)
  - We do allow some flash to have a jffs2 filesystem for data
    files and log storage as needed (not part of upgrade scheme).

>Why is it important work effectively with third party developers
>
>  * Enhance projects (both OE and third parties)
>  * Create jobs for OE devs (that want them)
>  * Reduce friction
>  * Eliminate FUD

I agree with the suggestion that corporate sponsored development should
primarily be driven by vendors (i.e. mainly the CPU vendors and board
vendors).  This especially applies to chip families that don't enjoy as
wide a manufacturing base as ARM (e.g. Coldfire, PPC, AVR32).

I'd like to see a minimalist distro as an alternate to Angstrom, one
that has an objective to cleanly build for all supported chip families.
I think it is easier to get someone in my position to fix a port for an
add on package for my favorite CPU if I have a working basic system to
start with, but if I can't even build a basic system within a typical
evaluation timeframe, then I have no choice but to move on (in my case,
for the project at hand, I moved on to buildroot - but to be fair,
buildroot couldn't build its own linux kernel for PPC405 out of the box
either, even though I was able to get it to build the Linux / Xenomai
combo from DENX source RPMs).

I hope my frustrations and "giving up for now" is construed more as a
suggestion and challenge for the OE project team rather than as FUD.
:-)

Ultimately, once I get past the first hurdles, I'd like to have a distro
a bit more than minimalist, basically what it would take to implement
secure appliances and network infrastructure.
  - Real time enhanced kernel
  - SSL, SSH, login authentication better than the basic in busybox
  - HTTPS, PHP5 and Python capable web server (e.g. appWeb)
  - Client and server support for certificates
  - Drivers for WiFi and WiMax

I have no need for graphics or any of that GUI jazz stuff (because I am
interested in infrastructure boxes not handheld devices), but I do see
need for some elements of web 2.0 technology, templates support and
internationalization / localization support (which is why I consider
PHP, python and SQLite support as important).


>Basic issues for third party users of OE to build systems:
>
>  * What is OE? A distribution, or a distribution creation tool?
>  * Need to build product with a stable base.
>  * A way to keep proprietary content separate from OE.
>  * How do software developers use OE to write/debug code?
>  * What is the right way to support hardware?

I see two opportunities here.
1.  OE could be a toolchain / distro maintenance tool for our products.
2.  We could sell the HW for our products to OEMs in which case, OE
could be the basis of what we would want to provide to our customers.
(At this point, we would come under the category of a board vendor).

Proprietary content appears to be a fact of life, especially when it
comes to software defined radio.  If you choose to have OE support
proprietary content, it becomes important to point out such dependencies
to the user while picking and choosing packages rather than having the
build fail because an attempt to retrieve a tarball gets an
access-denied.  OE could provide a framework or even just a
philosophical approach to handle proprietary add-ons - but leave the
implementation to the vendors who will profit from them.

I see proprietary add-ons mainly being in the area of support for
specific types of hardware.  In an almost ideal world, we would see
proprietary add on drivers being temporary from the point a vendor
introduces a new device until the time they feel that it is safe to
release the driver code as FOSS (i.e. once the market edge has been
realized and they don't fear that it would give instant gratification to
a competitor).  Wireless hardware support is an area where you could see
lots of this happening.


>Issues for OE developers:
>
>  * Third parties need to feed bug fixes and new work into .dev.
>  * How to not overwhelm OE devs with support requests.
>  * How does OE scale to large numbers of users?

Perhaps the project needs to be partitioned into sub-projects for:
  - toolchain and framework
  - minimalistic systems for all supported platforms
  - distributions (each one a project in its own right)
  - some major areas of related packages (e.g. graphics/GUI, wireless,
    security, etc) likely to be included all-or-none in a distro.

Also, from the point of view of someone who may want to market products
based on an OE toolchain and distro, it is not acceptable to have OE be
broken.  There needs to be a QA process that focuses the project into a
development phase, then a fix and cleanup phase, then a release and
maintenance phase.  There would need to be multiple branches (e.g.
org.oe.dev, org.oe.beta.v3, org.oe.stable.v2, org.oe.stable.v1).

Someone should be able to lock into a stable branch with some sort of
expectation that it will work (at least as documented - i.e. cases of
known issues to be fixed only in a next version is a fact of life).
They also need to be able to trust that updates to the stable branches
will be according to a conservative maintenance policy.  Otherwise they
will just implement their own branch (which could be an approach in
itself if the OE project chooses to be concerned only with development
and leave QA / maintenance as a value-add service for downstream vendors
to provide and even charge for).


Regards,

Darcy



