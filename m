Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXkL0-0006YW-P4
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 23:47:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXkJi-0007aC-Td
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 22:45:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 22:45:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 22:45:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 23:45:47 +0100
Message-ID: <gn28qr$aac$1@ger.gmane.org>
References: <20090210204817.GH11815@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <20090210204817.GH11815@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Thu, 12 Feb 2009 22:47:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-02-09 21:48, Tom Rini wrote:
> Hey all.  I'd like to commit the following patch.  This will add support
> for generating single image UBI volumes as well as fix creating ubifs
> images.  Going backwards here, the problem with ubifs images right now
> is that you must pass in -m -e -c -r and -o args in order to get an
> image to come out and only -r / -o are not flash part specific.  To fix
> this, on ubifs images, pass in ${MKUBIFS_ARGS}.  Why not just
> ${EXTRA_IMAGECMD} ? That's because making a UBI volume requires a
> different set of mandatory arguments too.  And as there's no way (today)
> to have IMAGETYPE=foo require IMAGETYPE=bar to be built previously, we
> need to use a separate mechanism here (similar to ext2/3 and blocksize).
> To pass in the ubinize args we then go and set UBINIZE_ARGS and then we
> get our 1 image UBI volume to come out if mtd-utils-native=1.2.0+git is
> being used.
>
> As an example, on a board we have with a Samsung K9F2G08U0M we do:
> # Make 256MiB/128KiB
> MKUBIFS_ARGS = "-m 2048 -e 126976 -c 2047"
> UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"

To get the values for these params:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=76af265d0f1a9ed377dbaba7be03fe23643910fe

# do ubiattach /dev/ubi_ctrl -m 4
# From dmesg:
# UBI: smallest flash I/O unit:    2048
# UBI: logical eraseblock size:    129024 bytes
# from ubiattach stdout:
# UBI device number 0, total 1996 LEBs
MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"

# do ubiattach /dev/ubi_ctrl -m 4
# from dmesg:
# UBI: smallest flash I/O unit:    2048
# UBI: physical eraseblock size:   131072 bytes (128 KiB)
# UBI: sub-page size:              512
UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"

regards,

Koen



