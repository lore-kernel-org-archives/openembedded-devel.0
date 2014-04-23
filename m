Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id A214060782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:22:25 +0000 (UTC)
Received: from ad.chargestorm.se (2.71.147.210) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 23 Apr 2014 10:22:24 +0200
Date: Wed, 23 Apr 2014 10:22:22 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140423082222.GD7075@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAFeBWL69KhpCShJsMnd+Vu0nd5wp5u9KZ_+3Sjd9z0Kyhx96Xw@mail.gmail.com>
	<CAFeBWL6bneKQgZ2XX3mZjqJXuDbG0y7rLNOWskLAerUsXDV57w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL6bneKQgZ2XX3mZjqJXuDbG0y7rLNOWskLAerUsXDV57w@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: xfce4-dev-tools fails to build on master-next
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
X-List-Received-Date: Wed, 23 Apr 2014 08:22:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Adam Lee <adam.yh.lee@gmail.com> [140423 01:01]:

> It looks like autotools bbclass began doing out of tree build. Switching to
> Poky's 'daisy' branch, which contains a couple of autotools related
> commits, fixed this issue.

Yes, the autotools bbclass has been switched to doing out of tree builds
as the default. (For several good reasons).

The best thing would of course be to adapt the receipt in question. The
intermediate solution is to switch the recipe from 
inherit autotools
to 
inherit autotools-brokensep

This will restore the old, build in tree, behaviour.

Cheers,

Anders

> On Mon, Apr 21, 2014 at 10:56 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> > I noticed my XFCE image is blocked due to the following:

> > DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']

> > DEBUG: Executing shell function do_compile

> > NOTE: make -j 4

> > Making all in m4macros

> > make[1]: Entering directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'

> > make[1]: Nothing to be done for `all'.

> > make[1]: Leaving directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'

> > Making all in scripts

> > make[1]: Entering directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'

> > make[1]: *** No rule to make target `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/xfce4-dev-tools-4.11.0/scripts/xdt-autogen.in', needed by `xdt-autogen'.  Stop.

> > make[1]: Leaving directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'

> > make: *** [all-recursive] Error 1

> > ERROR: oe_runmake failed

> > WARNING: exit code 1 from a shell command.

> > ERROR: Function failed: do_compile (log file is located at /media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/temp/log.do_compile.22389)

> > I can only see xdt-autogen.in.in (not xdt-autogen.in) in the scripts
> > directory. This is the same with the previous version however.

> > Has anyone else seen this? Thanks!

> > Adam
-- 
Anders Darander
ChargeStorm AB / eStorm AB

