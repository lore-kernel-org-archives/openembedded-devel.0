Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7E46BDCB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2013 02:38:25 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so2077217lab.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JLvhrRPyPHFgO6QYE9eOuNgDiOoJYYRpf70mxkoeE4Y=;
	b=JQsw8J3yZGetX7RGDd+CkJchhuAFkmOP5Zq6qZAPClildn1XA4CFIsd+RjbipBd2/g
	OL4xpF8yLAErSZt9r6AEPr4Zbv97WLbYnX761bxEhxcV26bn4jiidUB8cfRF9/5MBUeP
	J672SXI62x08w890l+XQ8R5R58+nP6e8+4dwDmZIFLVA/k2WTCHhT5qYcYNTGCMkCiMt
	rJwbnDJmw7saSiQ/zKpEvBgI07SxILl9Ck2rffdMxLcd1s66YQlHKnJ2HXoF5cKZTyW/
	333E64RxSppvxinzgdR+uIc2cmoWgbH0KUkMHzcnBj24lWmQ/n3k3eMF5tJZrN4x1lVR
	swqA==
MIME-Version: 1.0
X-Received: by 10.112.168.35 with SMTP id zt3mr10309074lbb.11.1377916705188;
	Fri, 30 Aug 2013 19:38:25 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 30 Aug 2013 19:38:25 -0700 (PDT)
In-Reply-To: <D43CA667-1051-4FBC-8E12-D140F94AFAFC@gmail.com>
References: <D43CA667-1051-4FBC-8E12-D140F94AFAFC@gmail.com>
Date: Fri, 30 Aug 2013 22:38:25 -0400
Message-ID: <CADkTA4P5wz+wdro57OW1-b2tbfPaSwhW6KNAdtSU3GCVgpwtHw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Adding support for additional qemu machine configurations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Aug 2013 02:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 5:54 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> Hi,
>      I'd like to put forward a proposal for adding support for additional=
 qemu machine configurations, either by way of creating a new meta-qemu lay=
er, or adding additional machine configurations to the oe-core, targetting =
a future release (say 1.6 or 1.7).
>

I'm all for more machine emulations, I'll repeat a few things that
I've mentioned before,
since I think half of my email were bouncing.

If the goal is oe-core, at some point, taking the conversation to the
oe-core list makes
sense. Since getting a machine into oe-core brings with it a set of QA
standards and
resources requirements that a few organizations and people need to agree to=
.

But enough of that boring stuff, onto more interesting things.

As I've mentioned before, I've poked and booted many of the system
platforms in the
past .. searching for options to either quickly debug problems or just
try things out. So
i can lend a hand in knowing what pitfalls are lurking, and making
sure that a valid
kernel and set of features can be counted on to work on a given board.


> Proposed qemu machine configurations, not currently included in oe-core, =
are as follows:
>
> - qemuarmv7 (useful for emulating TI OMAP 3 based platforms)
> - qemuarma9 (useful for emulating TI OMAP 4 and Freescale i.MX6 platforms=
)
> - qemuarmv8 (for AArch64 platforms)
> - qemumips64

qemumips64 is fully in oe-core now, I have the bugs and maintenance
scars to show
for it :) Khem and I collaborated on the toolchain, userspace and
kernel work to get it to
a point where it was fairly easy to get into the core, following a
similar model here would
probably work as well.

A better addition to the list would be a more modern ppc plaform, I've
off and on looked
at the freescale boards, but most of the FSL based qemu support needs
KVM backing.
Which isn't a dig at the support, it just doesn't make it an option
for a system emulated
and supported board.

The existing qemuarm support in oe-core is based on the rusty old
arm_versatile_926ejs
board. And it's showing its ago now. Witness the long drawn out
conversations that have
been going on in the arm kernel mailing list and crossing into the
kernel summit about
the interrupt swizzling and other issues that we've had to deal with
in supporting the
emulated platform. I'd be happy to upgrade and update the support to a
newer arm variant,
but we'd want to do it for a real advantage. The point being, that
maintaining the boards
over time, isn't always as simple as it seems, and definitely not as
simple as getting
that first boot to work.

The question you need to answer for each board would be, something like:

  - Is it based on a h/w BSP, and can that same h/w BSP be used on the
emulated plaform
    as well as the hardware. i.e. I always thought it was cool to boot
the same images on
    hardware and sim, and IIRC with the right qemu upstreams you can
do that for boards
    like the beagleboard and I know you can do it for the zynq.

  - Make sure it has a decent set of peripherals and supported
devices. Graphics, disk and
    network boot are the obvious front runners for a good choice. With
those, you can boot
    easily from ext3 images, transfer files to and from it easily and
test graphical support
    via sato or other interfaces. USB and other buses are another
thing to consider.

 - Do you keep the platform the same, and simply change the cpu, and
if so that's an
   easier route to the support you mention above. That would mean that
you can test
   userspace tuning and builds, as well as the generic kernel for the
tuning, but you
   aren't testing device drivers or anything targeted to a particular
platform/board. This
   is also fine .. just something to state up front in the goals of
offering variants within
   a particular architecture.

And then make sure the value of the variants are valuable enough and
try and drive a one
or two into the core.

>
> As a first step, I can contribute support for qemuarmv7, qemuarma9 and qe=
muarmv8.

And I'm happy to help with configs and a consistent kernel base for
them, which in the
process will only help them into the core, and iron out any clunky
parts of the process.

We'd also want to work on getting runqemu hooks and extensibility
changes ready so they
could be easily maintained in a layer, which helps everyone that has
emulated boards
in layers.

Sorry for the long winded email, this is one of my favourite topics :)

Cheers,

Bruce

>
> Thanks and do let me know your thoughts on this.
>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

