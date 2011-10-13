Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RESNU-0002QW-0R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 22:59:44 +0200
Received: (qmail invoked by alias); 13 Oct 2011 20:54:00 -0000
Received: from p4FDF0ED5.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.14.213]
	by mail.gmx.net (mp016) with SMTP; 13 Oct 2011 22:54:00 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2Nltj5wb2WmcABhf2wPF2e80G9237TzDHD/lz+W
	8qZY5r0slQFpxR
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:58:27 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
In-Reply-To: <4E974E38.5050807@mlbassoc.com>
MIME-Version: 1.0
Message-Id: <201110132258.27380.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Can't build libcgroup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 20:59:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, October 13, 2011 10:46:48 PM Gary Thomas wrote:
> On 2011-10-13 14:44, Khem Raj wrote:
> > On Thu, Oct 13, 2011 at 1:42 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
> >> On 2011-10-13 14:33, Khem Raj wrote:
> >>>
> >>> On Thu, Oct 13, 2011 at 11:57 AM, Gary Thomas<gary@mlbassoc.com>    wrote:
> >>>>
> >>>> On 2011-10-13 12:48, Khem Raj wrote:
> >>>>>
> >>>>> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>
> >>>>>   wrote:
> >>>>>>
> >>>>>> On 2011-10-13 08:16, Kridner, Jason wrote:
> >>>>>>>
> >>>>>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>
> >>>>>>>   wrote:
> >>>>>>>
> >>>>>>>> Trying to follow the Angstrom instructions directly.
> >>>>>>>>
> >>>>>>>> OE Build Configuration:
> >>>>>>>> BB_VERSION        = "1.13.3"
> >>>>>>>> TARGET_ARCH       = "arm"
> >>>>>>>> TARGET_OS         = "linux-gnueabi"
> >>>>>>>> MACHINE           = "beagleboard"
> >>>>>>>> DISTRO            = "angstrom"
> >>>>>>>> DISTRO_VERSION    = "v2011.10-core"
> >>>>>>>> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> >>>>>>>> TARGET_FPU        = "vfp-neon"
> >>>>>>>> meta-angstrom     = "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
> >>>>>>>> meta-oe
> >>>>>>>> meta-efl
> >>>>>>>> meta-gpe
> >>>>>>>> meta-gnome
> >>>>>>>> meta-xfce         = "master:1e5d73ec4f44200104de085838f04e31a49435da"
> >>>>>>>> meta-ti           = "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
> >>>>>>>> meta              = "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
> >>>>>>>>
> >>>>>>>> Fails with this error:
> >>>>>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
> >>>>>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
> >>>>>>>> -mfpu=neon
> >>>>>>>> -mtune=cortex-a8 -mthumb-interwork -mno-thumb
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> --sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
> >>>>>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
> >>>>>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
> >>>>>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory
> >>>>>
> >>>>> Does this happen with lastest angstrom on oe-core ? or classic oe.dev
> >>>>> I am unable to reproduce it on my end
> >>>>
> >>>> Latest angstrom with layers as above.
> >>>
> >>> strange, I have it working well for qemuarm and I cant imagine how C++
> >>> headers could be broken for beagle
> >>
> >> Maybe you could try it using the Angstrom tools?  Here's the [documented]
> >> sequence I used:
> >>   % MACHINE="beagleboard" ./oebb.sh config beagleboard
> >>   ... adjust conf/site.conf for my local DL_DIR
> >>   ... adjust conf/local.conf to include MACHINE=beagleboard, set parallel
> >> build flags, etc
> >>   ... removed all meta-intel repos from conf/bblayers.conf (to avoid xorg-dri
> >> issues)
> >>   % . ~/.oe/environment-oecore
> >>   % bitbake systemd-image
> >>
> >
> > needless to say thats what I have done
> > but for qemuarm
> 
> Just making sure :-)  I'll try qemuarm here with the same setup.
> 
> 
Hmm few days ago I had unexplainable effects about iostream [1] which could be cleaned by rebuild (and I swear I have seen same for string before)

Some race / parallel install issue?

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010869.html

Andreas


