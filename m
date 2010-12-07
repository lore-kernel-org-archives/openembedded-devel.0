Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PQ2zW-0003Cw-W7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 20:14:24 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LD200LSZO127XN0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Dec 2010 13:12:39 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4E2DE14AF64; Tue,
	07 Dec 2010 14:12:38 -0500 (EST)
Date: Tue, 07 Dec 2010 14:12:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101207191238.GB6510@denix.org>
References: <1291390869-14422-1-git-send-email-m-watkins@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329CC1EDC@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F080329CC1EDC@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Watkins, Melissa" <m-watkins@ti.com>,
	Melissa Watkins <mwatkins.ti@gmail.com>
Subject: Re: [PATCH 6/6] defconfig: Add omapl138 defconfig file
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
X-List-Received-Date: Tue, 07 Dec 2010 19:14:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Melissa,

I would suggest that you actually subscribe to this mailing list, so your 
patches can get through and people can review them (although Koen has already 
applied them).

-- 
Denys


On Fri, Dec 03, 2010 at 01:43:28PM -0600, Maupin, Chase wrote:
> My main comment here is that these patches might be better in a different 
> order.  Currently if they were applied one at a time they would fail because 
> of the dependency order.  I would suggest re-ordering the existing patches 
> into the following order:
> 
> 0005
> 0006
> 0004
> 0003
> 0002
> 0001
> 
> Sorry that I didn't notice this the first time I looked at these patches.
> 
> > -----Original Message-----
> > From: Melissa Watkins [mailto:mwatkins.ti@gmail.com]
> > Sent: Friday, December 03, 2010 9:41 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Watkins, Melissa; Maupin, Chase
> > Subject: [PATCH 6/6] defconfig: Add omapl138 defconfig file
> > 
> > * Add defconfig file for omapl138 machines
> > 
> > Signed-off-by: Melissa Watkins <m-watkins@ti.com>
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > ---
> >  recipes/linux/linux-davinci/omapl138/defconfig |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/linux/linux-davinci/omapl138/defconfig
> > b/recipes/linux/linux-davinci/omapl138/defconfig
> > index 8462139..ad52484 100644
> > --- a/recipes/linux/linux-davinci/omapl138/defconfig
> > +++ b/recipes/linux/linux-davinci/omapl138/defconfig
> > @@ -1383,6 +1383,7 @@ CONFIG_USB_MUSB_HDRC=y
> >  CONFIG_USB_MUSB_SOC=y
> >  CONFIG_USB_MUSB_HOST=y
> >  # CONFIG_USB_MUSB_PERIPHERAL is not set
> > +# CONFIG_USB_MUSB_DUAL_ROLE is not set
> >  # CONFIG_USB_MUSB_OTG is not set
> >  CONFIG_USB_MUSB_HDRC_HCD=y
> >  # CONFIG_MUSB_PIO_ONLY is not set
> > @@ -1557,7 +1558,12 @@ CONFIG_RTC_INTF_DEV=y
> >  CONFIG_RTC_DRV_OMAP=y
> >  # CONFIG_DMADEVICES is not set
> >  # CONFIG_AUXDISPLAY is not set
> > -# CONFIG_UIO is not set
> > +CONFIG_UIO=y
> > +# CONFIG_UIO_PDRV is not set
> > +# CONFIG_UIO_PDRV_GENIRQ is not set
> > +# CONFIG_UIO_SMX is not set
> > +# CONFIG_UIO_SERCOS3 is not set
> > +CONFIG_UIO_PRUSS=m
> > 
> >  #
> >  # TI VLYNQ
> > --
> > 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


