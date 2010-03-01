Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nm7xG-0005hC-MK
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:54:50 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E44651B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 15:53:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Mar 2010 16:51:37 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <20100301152627.GT3206@jama>
In-Reply-To: <20100301152627.GT3206@jama>
MIME-Version: 1.0
Message-Id: <201003011651.37372.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building ubi/ubifs images
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
X-List-Received-Date: Mon, 01 Mar 2010 15:54:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 01 March 2010 16:26:27 Martin Jansa wrote:

> NOTE: Running task 7195 of 7198 (ID: 10,
> /home/shr/shr-unstable/openembedded/recipes/images/shr-lite-image.bb,
> do_rootfs) *** glibc detected *** mkfs.ubifs: double free or corruption
> (!prev): 0x000000000060d0c0 *** ======= Backtrace: =========
> /lib/libc.so.6[0x2b4e55501948]
> /lib/libc.so.6(cfree+0x76)[0x2b4e55503a56]
> mkfs.ubifs[0x403bc4]
> mkfs.ubifs[0x4050ca]
> /lib/libc.so.6(__libc_start_main+0xe6)[0x2b4e554ac1a6]
>

In general it might be nice to build mkfs.ubifs with debug information and 
send the backtrace upstream and ask for help to resolve the issue?

z.


