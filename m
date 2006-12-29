Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H06ag-0000vH-TA
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 02:31:22 +0100
Received: by nf-out-0910.google.com with SMTP id l24so5274665nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2006 17:30:45 -0800 (PST)
Received: by 10.49.41.18 with SMTP id t18mr17532464nfj.1167355845637;
	Thu, 28 Dec 2006 17:30:45 -0800 (PST)
Received: from CUBE ( [82.193.96.233])
	by mx.google.com with ESMTP id x1sm68564125nfb.2006.12.28.17.30.45;
	Thu, 28 Dec 2006 17:30:45 -0800 (PST)
Date: Fri, 29 Dec 2006 03:30:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1525806921.20061229033051@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <459403F2.4080102@dominion.kabel.utwente.nl>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Fri, 29 Dec 2006 01:31:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, December 28, 2006, 7:50:42 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> CC: to the OE list

> Paul Sokolovsky schreef:
>> Hello angstrom-distro-devel,
>> 
>>   Thanks for providing pre-holiday 20061219 snapshots for testing.
>> They don't provide separate zImages, but well, that's ok - they are in
>> the images, after all.
>> 
>>   Well, not for hx4700, for example. Because:
>> 
>> ======== linux-handhelds-2.6.inc =====
>> FILES_kernel-image_hx4700 = ""
>> ALLOW_EMPTY_hx4700 = "1"
>> FILES_kernel-image_htcuniversal = ""
>> ALLOW_EMPTY_htcuniversal = "1"
>> ======================================
>> 
>>   Oops. Sources of such a special treatment of hx4700 and htcuniversal
>> would be unclear to outsider, but people who deal with (mis)features
>> of "ipaqs" know, that hx4700 has one (sic!, even if the most popular)
>> bootloader which doesn't use zImage in the image, but instead requires
>> adhoc means to install kernel, ditto for Universal, though bootloader
>> is another.
>> 
>>   So, what is tried here is to "save space". But there're few issues:

> Those lines should go, but not before we have a way to exclude 'kernel-image' from the
> rootfs *and* kernel-module-foo doesn't depend kernel-image anymore.

  Well, so am I right with assumption above that the only reason for
that is to "save space"? If yes, then we should fix it the right
place. So, if we want to be able to remove zImage file (not
kernel-image package, actually, as indeed modules depend on it, and do
that rightfully) from rootfs, we should do just that. We already
[have ability to] postprocess rootfs in a number of ways, like: remove
root password, make sure that /sbin/init is a real file, not a link,
make sure a /boot/zImage is a relative symlink. So, in that vein, I've
made a patch, submitted as http://bugs.openembedded.org/show_bug.cgi?id=1719
. Tested. Please review.

> regards,

> Koen

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



