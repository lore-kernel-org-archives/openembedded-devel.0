Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 143CC609A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:57:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3T00ILJR24FW80@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	10 Apr 2014 11:56:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 435A72016D; Thu,
	10 Apr 2014 12:56:26 -0400 (EDT)
Date: Thu, 10 Apr 2014 12:56:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140410165626.GQ3370@denix.org>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
	<CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
	<li6b0g$9m6$1@ger.gmane.org>
	<CAFZh4h8oAnNZfswMF+6tf5Byxxc+B0weLLNMQeudLpcdRtmyUg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h8oAnNZfswMF+6tf5Byxxc+B0weLLNMQeudLpcdRtmyUg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: udev auto-mount not doing fsck
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
X-List-Received-Date: Thu, 10 Apr 2014 16:57:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 10, 2014 at 11:12:22AM -0400, Brian Hutchinson wrote:
> On Thu, Apr 10, 2014 at 10:48 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Brian Hutchinson schreef op 10-04-14 15:10:
> > > OK an update.  I decided to stub the automount.rules for the moment to
> > > try and get things working the old way and I'm seeing some curious
> > > behavior. The target is running Yocto 1.5 so it is a fairly recent
> > > distro.
> > >
> > > I made an entry in /etc/fstab for my eUSB with the sixth column set to
> > > 2. On reboot fsck doesn't run.  Hmmm, curious.  I still see the:
> > >
> > > EXT4-fs (sda1): warning: maximal mount count reached, running e2fsck is
> > > recommended EXT4-fs (sda1): mounted filesystem with ordered data mode.
> > > Opts: (null)
> > >
> > > ... messages at boot.
> > >
> > > So I do touch /forcefsck and reboot.   Same result. shutdown -rF ... same
> > > result.
> > >
> > > I can't figure out why none of these methods is checking my eUSB drive.
> >
> > To ask the obvious question: is fsck.ext{2,3,4} present on your system?
> >
> >
> Hey Koen,
> 
> Yes, I have the complete e2fsprogs package in the rootfs so I have e2fsck
> etc.
> 
> I just did some tests where I modified the existing mount.sh to run fsck
> first (which busybox passes through and calls the real e2fsck) an so using
> udev rules with some ENV{ID_} type commands to identify my eUSB and then
> call my "special" mount script via RUN appears to work so I guess I'll have
> to continue going that route .... which is in keeping with the new udev way
> of doing things.
> 
> I was just kind of puzzled as to why the older methods didn't work ... not
> that I have ran into this kind of thing before.  Usually I'm using a raw
> NOR or NAND and with a filesystem that deals with the FTL ... this is my
> first time using a mass storage device that handles all the ECC, leveling
> etc. behind the scenes and pretends to be a disk.

Brian,

Be careful, with your eUSB storage device cold-plugged (available on boot) 
you may run into a race condition, if you initially mount your rootfs in 
read-only mode and then re-mount in read-write mode during boot. One of the 
proposed solutions:

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/50124

-- 
Denys

