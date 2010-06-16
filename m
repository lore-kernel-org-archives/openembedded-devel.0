Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOorV-0005r7-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:24:48 +0200
Received: from guest198.ibr.cs.tu-bs.de ([134.169.35.198] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOon6-0003C9-SA by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:20:18 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OOon6-0004fZ-5m
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:20:12 +0200
Date: Wed, 16 Jun 2010 11:20:12 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616092012.GB20969@excalibur.local>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-5-git-send-email-stefan@datenfreihafen.org>
	<20100616082908.GA31860@merkur.sol.de>
MIME-Version: 1.0
In-Reply-To: <20100616082908.GA31860@merkur.sol.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 4/4] u-boot_git: Add bug20 support
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
X-List-Received-Date: Wed, 16 Jun 2010 09:24:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-06-16 at 10:29, Jens Seidel wrote:
> 
> a few useless remarks:

Review is never useless. :)

> On Tue, Jun 15, 2010 at 08:15:27PM +0200, Stefan Schmidt wrote:
> > From: Stefan Schmidt <stefan@buglabs.net>
>  
> > +diff --git a/board/ti/beagle/beagle.h b/board/ti/beagle/beagle.h
> > +index 7fe6275..a7e8593 100644
> > +--- a/board/ti/beagle/beagle.h
> > ++++ b/board/ti/beagle/beagle.h
> > +@@ -255,8 +255,8 @@ const omap3_sysinfo sysinfo = {
> > +	MUX_VAL(CP(HSUSB0_DATA7),	(IEN  | PTD | DIS | M0)) /*HSUSB0_DATA7*/\
> > +	MUX_VAL(CP(I2C1_SCL),		(IEN  | PTU | EN  | M0)) /*I2C1_SCL*/\
> > +	MUX_VAL(CP(I2C1_SDA),		(IEN  | PTU | EN  | M0)) /*I2C1_SDA*/\
> > +-	MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M4)) /*GPIO_168*/\
> > +-	MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M4)) /*GPIO_183*/\
> > ++	MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M0)) /*GPIO_168*/\
> > ++	MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M0)) /*GPIO_183*/\
> > +	MUX_VAL(CP(I2C3_SCL),		(IEN  | PTU | EN  | M0)) /*I2C3_SCL*/\
> > +	MUX_VAL(CP(I2C3_SDA),		(IEN  | PTU | EN  | M0)) /*I2C3_SDA*/\
> > +	MUX_VAL(CP(I2C4_SCL),		(IEN  | PTU | EN  | M0)) /*I2C4_SCL*/\
> > +@@ -268,6 +268,7 @@ const omap3_sysinfo sysinfo = {
> > +	MUX_VAL(CP(MCSPI1_CS0),		(IEN  | PTD | EN  | M0)) /*McSPI1_CS0*/\
> > +	MUX_VAL(CP(MCSPI1_CS1),		(IDIS | PTD | EN  | M0)) /*McSPI1_CS1*/\
> > +	MUX_VAL(CP(MCSPI1_CS2),		(IDIS | PTD | DIS | M4)) /*GPIO_176*/\
> > ++>>>>>>> 6ca9da4d42aeb43df5ef29f7d0518009df583b2f
> 
> Is this a conflict marker?

It is. Needs to get removed.

> > +@@ -507,9 +507,11 @@ unsigned char configure_mmc(mmc_card_data *mmc_card_cur)
> > + unsigned long mmc_bread(int dev_num, unsigned long blknr, lbaint_t blkcnt,
> > +			void *dst)
> > + {
> > ++  //printf("mmc_bread...\n");
> > +	omap_mmc_read_sect(blknr, (blkcnt * MMCSD_SECTOR_SIZE), &cur_card_data,
> > +				(unsigned long *) dst);
> > +-	return 1;
> > ++	//return 1;
> > ++	return blkcnt;
> 
> Don't commit such changes (comments), remove them!

Yeah, I need to poke our low level team to also check if this is fixed in
upstream u-boot.

> > +diff --git a/lib_arm/board.c b/lib_arm/board.c
> > +index e148739..f3c58ea 100644
> > +--- a/lib_arm/board.c
> > ++++ b/lib_arm/board.c
> > +@@ -291,7 +291,6 @@ void start_armboot (void)
> > +			hang ();
> > +		}
> > +	}
> > +-
> 
> Are you sure about this change :-?

Pretty sure, yes. ;)

Will cleanup the patch a little and will send out it in the next version after
some more comments.

Thanks for your review.

regards
Stefan Schmidt


