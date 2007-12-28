Received: from [80.12.242.27] (helo=smtp20.orange.fr)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <c.romain@laposte.net>) id 1J8Et0-0006Ln-HP
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Dec 2007 14:04:26 +0100
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2009.orange.fr (SMTP Server) with ESMTP id A56EC1C000A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2007 13:58:30 +0100 (CET)
Received: from [192.168.2.2] (AToulouse-157-1-94-86.w86-213.abo.wanadoo.fr
	[86.213.85.86])
	by mwinf2009.orange.fr (SMTP Server) with ESMTP id 5EBC71C0008F;
	Fri, 28 Dec 2007 13:58:30 +0100 (CET)
X-ME-UUID: 20071228125830388.5EBC71C0008F@mwinf2009.orange.fr
Message-ID: <4774F459.5010100@laposte.net>
Date: Fri, 28 Dec 2007 14:04:25 +0100
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 2.0.0.9 (X11/20071208)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
References: <4774C182.20501@gmail.com> <4774C9AA.8050705@student.utwente.nl>
In-Reply-To: <4774C9AA.8050705@student.utwente.nl>
Subject: Re: [Angstrom-devel] Tosa kernel bloat
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
X-List-Received-Date: Fri, 28 Dec 2007 13:04:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Junqian Gordon Xu schreef:
> > Tosa kernel is bloated with the recent patch and change to
> defconfig-tosa
>
> Is that also the case in the angstrom stable branch?
Yes.
This is the case for linux-rp-2.6.23-r12 (angstrom stable branch) and
linux-rp-2.6.23-r14: (angstrom dev branch)
The tosa kernel compiled fine with linux-rp-2.6.23-r10 (metadata from
december, 8th)

To cut the kernel size down, some of the following built-in features may
be set as modules instead:

-------8<---------8<---------
CONFIG_USB_ETH_RNDIS=y
CONFIG_MSDOS_PARTITION=y
CONFIG_USB_GADGET_SELECTED=y
CONFIG_USB_GADGET_PXA2XX=y
CONFIG_USB_EZUSB=y
CONFIG_USB_HIDINPUT=y
CONFIG_VIDEO_V4L1=y
CONFIG_VIDEO_V4L1_COMPAT=y
CONFIG_VIDEO_V4L2=y
CONFIG_NET_RADIO=y
CONFIG_SCSI_MULTI_LUN=y
-------8<---------8<---------

Regards,

  -- cyril




