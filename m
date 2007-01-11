Received: from [65.24.5.138] (helo=ms-smtp-04.ohiordc.rr.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.james.barr@gmail.com>) id 1H53tG-0003n8-KL
	for openembedded-devel@openembedded.org; Thu, 11 Jan 2007 18:39:02 +0100
Received: from r51.oakcourt.dyndns.org (cpe-65-24-47-209.columbus.res.rr.com
	[65.24.47.209])
	by ms-smtp-04.ohiordc.rr.com (8.13.6/8.13.6) with SMTP id
	l0BHb3bD016136 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2007 12:37:03 -0500 (EST)
Received: by r51.oakcourt.dyndns.org (sSMTP sendmail emulation);
	Thu, 11 Jan 2007 12:37:03 -0500
From: Andrew Barr <andrew.james.barr@gmail.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <1168532784.21840.4.camel@localhost>
References: <1168532784.21840.4.camel@localhost>
Date: Thu, 11 Jan 2007 12:37:02 -0500
Message-Id: <1168537022.8701.10.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2.1 
X-Virus-Scanned: Symantec AntiVirus Scan Engine
Subject: Re: Nokia 770, GPE, Angstrom
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
X-List-Received-Date: Thu, 11 Jan 2007 17:39:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-01-11 at 11:26 -0500, Andrew J. Barr wrote:
> Hi,
> 
> I have flashed my Nokia 770 with a self-built rootfs using
> "angstrom-2007.1" as the DISTRO and "nokia770" as the MACHINE. Target
> was 'gpe-image', branch was org.openembedded.dev. I flashed it using
> Nokia's version 3 flasher:
> 
> ./flasher-3.0 -f -k zImage -r rootfs.bin
> 
> I applied the patch to sysvinit mentioned here[0].
> 
> It goes successfully. The device starts up to the Nokia logo (NOLO
> bootloader I assume) but the screen fades to white. According to the
> document linked below, the initial startup takes a while. Am I just
> being impatient or am I doing something wrong? I notice there's no
> initfs built by OE, not sure if this is needed.

It does not boot after about half hour. I think I know why:

I forgot that I had hacked the nokia770 build to use plain
xserver-kdrive instead of xserver-kdrive-omap. This is because it does
not build; the configure script fails because it is missing the
pkg-config file xextensions.pc. Searching the ML archives I see
pre-modular-X stuff has been removed from OE. Does updated, plain Kdrive
support the OMAP / Nokia 770 graphics or do I need to figure out how to
build (or file a bug against) the old Xomap server to run OE on my 770?

Regards,
Andrew Barr

> Regards,
> Andrew Barr
> 
> [0] http://downloads.kernelconcepts.de/maemo-oe.txt


