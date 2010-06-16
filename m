Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1OOoLt-0004WS-IO
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:52:06 +0200
Received: by fxm18 with SMTP id 18so406732fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=1TSH+ANgi3AH03iTgCfDH07BXN2vhdWTiYT0eld5NIM=;
	b=ZTmpSJGR3xWuDXHnxznxHTz/4YzaF7myPTEqYtdhNSC85tQ+0hm3kZP9lb/Sp+yzpG
	Eky1hZAgdLTvkcrC+Q13HG5DfYLuyump+JXsQdgGwisgdAPoXDuC1X3upafzUJgMWCoD
	sOX109jHHK95fUgJS77oGOyZqACW4b6K0t2m4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=CmPud8SIr0aNiftxmLsg9e5fA4s6Mi0WF05MVtcBehOqCLrLb+iLJZECnGFQKeKIOG
	T/ZZ4nf/hElbDT6qBok1TGDx6n01S8hDNZUa3J6OjclpTX8sX4XTeuK6D8OeL+iLN5C/
	DxoLLNRcHjbGTx+yZNpRHNMrzNu9EW1Z+ON9s=
Received: by 10.102.197.36 with SMTP id u36mr2857344muf.105.1276678056286;
	Wed, 16 Jun 2010 01:47:36 -0700 (PDT)
Received: from merkur.sol.de (p4FD70B46.dip0.t-ipconnect.de [79.215.11.70])
	by mx.google.com with ESMTPS id j10sm9720865mue.48.2010.06.16.01.47.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 16 Jun 2010 01:47:34 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1OOnzh-00007E-39
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:29:09 +0200
Date: Wed, 16 Jun 2010 10:29:09 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616082908.GA31860@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-5-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1276625727-22991-5-git-send-email-stefan@datenfreihafen.org>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Wed, 16 Jun 2010 08:52:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

a few useless remarks:

On Tue, Jun 15, 2010 at 08:15:27PM +0200, Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
 
> +diff --git a/board/ti/beagle/beagle.h b/board/ti/beagle/beagle.h
> +index 7fe6275..a7e8593 100644
> +--- a/board/ti/beagle/beagle.h
> ++++ b/board/ti/beagle/beagle.h
> +@@ -255,8 +255,8 @@ const omap3_sysinfo sysinfo = {
> +	MUX_VAL(CP(HSUSB0_DATA7),	(IEN  | PTD | DIS | M0)) /*HSUSB0_DATA7*/\
> +	MUX_VAL(CP(I2C1_SCL),		(IEN  | PTU | EN  | M0)) /*I2C1_SCL*/\
> +	MUX_VAL(CP(I2C1_SDA),		(IEN  | PTU | EN  | M0)) /*I2C1_SDA*/\
> +-	MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M4)) /*GPIO_168*/\
> +-	MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M4)) /*GPIO_183*/\
> ++	MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M0)) /*GPIO_168*/\
> ++	MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M0)) /*GPIO_183*/\
> +	MUX_VAL(CP(I2C3_SCL),		(IEN  | PTU | EN  | M0)) /*I2C3_SCL*/\
> +	MUX_VAL(CP(I2C3_SDA),		(IEN  | PTU | EN  | M0)) /*I2C3_SDA*/\
> +	MUX_VAL(CP(I2C4_SCL),		(IEN  | PTU | EN  | M0)) /*I2C4_SCL*/\
> +@@ -268,6 +268,7 @@ const omap3_sysinfo sysinfo = {
> +	MUX_VAL(CP(MCSPI1_CS0),		(IEN  | PTD | EN  | M0)) /*McSPI1_CS0*/\
> +	MUX_VAL(CP(MCSPI1_CS1),		(IDIS | PTD | EN  | M0)) /*McSPI1_CS1*/\
> +	MUX_VAL(CP(MCSPI1_CS2),		(IDIS | PTD | DIS | M4)) /*GPIO_176*/\
> ++>>>>>>> 6ca9da4d42aeb43df5ef29f7d0518009df583b2f

Is this a conflict marker?

> +@@ -507,9 +507,11 @@ unsigned char configure_mmc(mmc_card_data *mmc_card_cur)
> + unsigned long mmc_bread(int dev_num, unsigned long blknr, lbaint_t blkcnt,
> +			void *dst)
> + {
> ++  //printf("mmc_bread...\n");
> +	omap_mmc_read_sect(blknr, (blkcnt * MMCSD_SECTOR_SIZE), &cur_card_data,
> +				(unsigned long *) dst);
> +-	return 1;
> ++	//return 1;
> ++	return blkcnt;

Don't commit such changes (comments), remove them!

> +diff --git a/lib_arm/board.c b/lib_arm/board.c
> +index e148739..f3c58ea 100644
> +--- a/lib_arm/board.c
> ++++ b/lib_arm/board.c
> +@@ -291,7 +291,6 @@ void start_armboot (void)
> +			hang ();
> +		}
> +	}
> +-

Are you sure about this change :-?

> +	/* armboot_start is defined in the board-specific linker script */
> +	mem_malloc_init (_armboot_start - CONFIG_SYS_MALLOC_LEN,
> +			CONFIG_SYS_MALLOC_LEN);

Jens


