Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H01w1-0006G7-C3
	for openembedded-devel@openembedded.org; Thu, 28 Dec 2006 21:33:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBSKWScQ006611;
	Thu, 28 Dec 2006 20:32:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06022-08; Thu, 28 Dec 2006 20:32:26 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBSKWPJg006602
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 28 Dec 2006 20:32:25 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <459403F2.4080102@dominion.kabel.utwente.nl>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
Date: Thu, 28 Dec 2006 20:32:26 +0000
Message-Id: <1167337946.5596.77.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific	messing with kernel packages
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
X-List-Received-Date: Thu, 28 Dec 2006 20:33:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-12-28 at 18:50 +0100, Koen Kooi wrote:
> Paul Sokolovsky schreef:
> > Hello angstrom-distro-devel,
> > 
> >   Thanks for providing pre-holiday 20061219 snapshots for testing.
> > They don't provide separate zImages, but well, that's ok - they are in
> > the images, after all.
> > 
> >   Well, not for hx4700, for example. Because:
> > 
> > ======== linux-handhelds-2.6.inc =====
> > FILES_kernel-image_hx4700 = ""
> > ALLOW_EMPTY_hx4700 = "1"
> > FILES_kernel-image_htcuniversal = ""
> > ALLOW_EMPTY_htcuniversal = "1"
> > ======================================
> > 
> >   Oops. Sources of such a special treatment of hx4700 and htcuniversal
> > would be unclear to outsider, but people who deal with (mis)features
> > of "ipaqs" know, that hx4700 has one (sic!, even if the most popular)
> > bootloader which doesn't use zImage in the image, but instead requires
> > adhoc means to install kernel, ditto for Universal, though bootloader
> > is another.
> > 
> >   So, what is tried here is to "save space". But there're few issues:
> 
> Those lines should go, but not before we have a way to exclude 'kernel-image' from the
> rootfs *and* kernel-module-foo doesn't depend kernel-image anymore.

The accepted approach is to make the kernel-image file empty which
solves both those problems. This is the same as the Zaurus which also
requires an external zImage file (and this code is handled in
linux-rp.inc in the same way as the above but for all machines).

Arguably, the machine files should perhaps set this...

The only other solution probably involves a nasty anonymous function
acting on a setting of EXTERNAL_KERNEL_IMAGE = "1" in kernel.bbclass.

Richard



