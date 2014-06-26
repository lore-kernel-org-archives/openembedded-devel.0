Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA0D60703
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 18:10:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S00915FSJIE20@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	26 Jun 2014 13:10:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D90412018D; Thu,
	26 Jun 2014 14:09:54 -0400 (EDT)
Date: Thu, 26 Jun 2014 14:09:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140626180954.GG1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 18:10:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 25, 2014 at 08:45:50PM -0300, Diego Sueiro wrote:
> Hi Philip,
> 
> On Wed, Jun 25, 2014 at 8:27 PM, Philip Balister <philip@balister.org>
> wrote:
> 
> > On 06/25/2014 04:13 PM, Diego Sueiro wrote:
> > > Hi Denys,
> > >
> > > On Wed, Jun 25, 2014 at 3:55 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > >
> > >> http://cgit.openembedded.org/openembedded-core/tree/scripts/wic
> > >>
> > >> But indeed, better documentation would be most appreciated.
> > >
> > >
> > > I didn't have a chance to take a look and test wic tool.
> > > Do you know if it can be used to generate sdcard images for TI's Sitara
> > > SoCs?
> > > The _problem_ for creating a sdcard image for Sitara is the configuration
> > > of Heads, Sectors and Cylinders that should be passed to sfdisk and needs
> > > to be done as root.
> >
> > This isn't true.
> >
> > https://groups.google.com/forum/#!topic/beagleboard/ro5k5r4Cuq4
> >
> > I've avoided the CHS business for ages and haven't had trouble booting
> 
> 
> Thanks for the link.
> 
> About 3 yeas ago I have issues with this using an industrial 2GB uSD from
> Delkin Devices with am3517. And as far as I remember I just got it working
> with CHS configuration.
> 
> I'm going to test it again with a Sandisk uSD and am3359 to see if it
> remains. But I don't have a Delkin uSD and am3517 anymore :(

"CHS business", as Philip called it, was only partially required in the early 
days of OMAP3 SoCs few years ago, due to some "specific" FAT implementation of 
the BootROM. These days it's not required on modern Sitara SoCs.

-- 
Denys

