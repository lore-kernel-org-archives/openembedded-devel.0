Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1N9yGP-0004EZ-QQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:52:52 +0100
Received: from w1043.wlan.rz.tu-bs.de ([134.169.204.27] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1N9yF3-0001Xc-Ry by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 10:51:28 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1N9yF2-0007h4-MI
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:51:24 +0100
Date: Mon, 16 Nov 2009 10:51:24 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116095124.GA7412@excalibur.local>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Mon, 16 Nov 2009 09:52:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-11-15 at 15:34, Alex Ferguson wrote:
> 
> Currently, the kernel comes from the Andromnia project, and uses their git
> repository to fetch the sources. They are the only ones who are actively
> working on a kernel, and working together should help speed up the process
> of porting the Linux kernel on the SGH-i900, no matter the userspace
> implementation.

That sounds good.

> The kernel requires the gspi8686 firmware images from Marvell for the WiFi
> adapter to work. Currently, the firmware files are copied into the kernel
> source tree under the directory "firmware" for static inclusion. That's
> because of certain constraints with Android.

Can you elaborate on this constraints? I would expect that even android loads
the firmware from /lib/firmware

BTW, you are bulding the kernel with OE, but using an android image?
Sounds strange to me.

> Question: I'd like to keep the same behavior, but I'm not certain of the
> exact way. I could DEPEND on the marvell-gspi-fw package and then have the
> kernel recipe copy the firmware files from STAGING_LIBDIR. But that seems
> like an error prone behavior.

It is, don't do it.

> Is there any other way, short of providing my
> own files in SRC_URI or not including the firmware in the kernel at all?

There should be a way to reference the same files in the SRC_URI as the marvell
firmware recipe does. That would at least avoid having the same firmware files
in the tree twice.

However I would like to understand the need for having it in the kernel tree
first.

regards
Stefan Schmidt


