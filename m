Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GzzPe-0001K4-Fz
	for openembedded-devel@openembedded.org; Thu, 28 Dec 2006 18:51:30 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBSHokLr015479; Thu, 28 Dec 2006 18:50:47 +0100
Message-ID: <459403F2.4080102@dominion.kabel.utwente.nl>
Date: Thu, 28 Dec 2006 18:50:42 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <53610736.20061228191750@gmail.com>
In-Reply-To: <53610736.20061228191750@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific messing with kernel packages
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
X-List-Received-Date: Thu, 28 Dec 2006 17:51:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

CC: to the OE list

Paul Sokolovsky schreef:
> Hello angstrom-distro-devel,
> 
>   Thanks for providing pre-holiday 20061219 snapshots for testing.
> They don't provide separate zImages, but well, that's ok - they are in
> the images, after all.
> 
>   Well, not for hx4700, for example. Because:
> 
> ======== linux-handhelds-2.6.inc =====
> FILES_kernel-image_hx4700 = ""
> ALLOW_EMPTY_hx4700 = "1"
> FILES_kernel-image_htcuniversal = ""
> ALLOW_EMPTY_htcuniversal = "1"
> ======================================
> 
>   Oops. Sources of such a special treatment of hx4700 and htcuniversal
> would be unclear to outsider, but people who deal with (mis)features
> of "ipaqs" know, that hx4700 has one (sic!, even if the most popular)
> bootloader which doesn't use zImage in the image, but instead requires
> adhoc means to install kernel, ditto for Universal, though bootloader
> is another.
> 
>   So, what is tried here is to "save space". But there're few issues:

Those lines should go, but not before we have a way to exclude 'kernel-image' from the
rootfs *and* kernel-module-foo doesn't depend kernel-image anymore.

regards,

Koen

> 1. See concern in the beginning of the message.
> 2. It's pretty weird to do such hack on a package level. Kernel
> package supposed to contain kernel, period. If there's some pressure
> to not have kernel in image, that's from where it should be removed.
> 3. Keywords in the description why this being done above are "a
> bootloader" and "currently". Sooner or later all this adhockery will
> be gone, and existing generic, machine-independent solutions, like
> LAB, will be adopted, which boot from the filesystem, and thus adhere
> to idea of complete system maintenance via packaged install
> (including, for kernel). For the multimachine distribution like
> Angstrom, supporting hacks like above is already pain in the neck, as
> the case above shows.
> 
> 
>   So, my proposal is to remove the lines quoted above. People who
> under pressure to have an extra MB and don't shudder to steal it from
> the kernel, can do that manually ;-).
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFlAPyMkyGM64RGpERAm9wAJ9zlE192Y6AZ6wT1jQbq/P3Cg6S5wCghO1f
KIQjN4BTSU+eRiWa2Aga/qM=
=EOjP
-----END PGP SIGNATURE-----


