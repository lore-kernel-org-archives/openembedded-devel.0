Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JENSW-0003WP-5R
	for openembedded-devel@openembedded.org; Mon, 14 Jan 2008 12:26:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JENS2-0005sR-N4
	for openembedded-devel@openembedded.org; Mon, 14 Jan 2008 11:25:58 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 14 Jan 2008 11:25:58 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 14 Jan 2008 11:25:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 14 Jan 2008 12:25:53 +0100
Message-ID: <fmfgs1$7ip$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: [Fwd: Re: mtn disapprove]
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
X-List-Received-Date: Mon, 14 Jan 2008 11:26:28 -0000
X-Groupsio-MsgNum: 3892
Content-Type: multipart/mixed; boundary="------------070602030504010705080905"

--------------070602030504010705080905
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

the OE mailing list was experiencing some hickups, it seems, so I am
resending this mail from Saturday.

Regards

Rolf

--------------070602030504010705080905
Content-Type: message/rfc822;
 name="Re: [oe] mtn disapprove.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: [oe] mtn disapprove.eml"

Date: Sat, 12 Jan 2008 16:44:16 +0100
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded
Subject: Re: [oe] mtn disapprove
References: <c67f1650801111257g286daeb5xfdec6550eca69dc6@mail.gmail.com>	<fma5ih$5k5$2@ger.gmane.org> <1200138079.5288.2.camel@localhost.localdomain>
In-Reply-To: <1200138079.5288.2.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard, thank you for your comments.

Richard Purdie schrieb:
>> -# This is needed for the ramdisk script to work
>> -MACHINE_EXTRA_RDEPENDS += "e2fsprogs-mke2fs"

> What happened to this? It looks wrong, I just want to make sure the
> underlying problem was fixed...

The suggestion came from hrw.  I would not know what it was needed for
so I looked through "mtn log".  It was imported from bitkeeper so I have
no way to find out who originally added this line.

>> -TARGET_CC_ARCH = "-march=armv4 -mtune=xscale"
>> +TARGET_CC_ARCH ?= "-march=armv4 -mtune=strongarm1100"
>> +TARGET_CC_ARCH_collie = "-march=armv4 -mtune=strongarm1110"
> 
> We should really have tune-strongarm1100.inc and
> tune-strongarm1110.inc...

I almost agree.  But since strongarm1110.inc would only be used by
collie and the file is a simple one-liner after all. I'd rather rename
tune-strongarm.inc to tune-strongarm1100.inc and replace the inclusion
of tune-strongarm.inc for collie with the correct one-liner.  One would
also add an explanation to tune-strongarm1100.inc that it is not
suitable for strongarm 1110 as used in the collie.

The following files would be affected by a renaming of tune-strongarm.inc

$ rgrep tune-strongarm conf/|grep inc|grep -v '#'|cut -b 6-
machine/collie.conf:require conf/machine/include/tune-strongarm.inc
machine/h3600.conf:require conf/machine/include/tune-strongarm.inc
machine/jornada56x.conf:require conf/machine/include/tune-strongarm.inc
machine/jornada7xx.conf:require conf/machine/include/tune-strongarm.inc
machine/simpad.conf:require conf/machine/include/tune-strongarm.inc
machine/shark.conf:require conf/machine/include/tune-strongarm.inc
machine/htcwallaby.conf:require conf/machine/include/tune-strongarm.inc

Since the patch is becoming quite big and starting to touch things
outside the scope of collie, I have made this into a separate patch and
committed it in 4989371c8e7cec943a964b459ec3e71c0f547204.

>> +PACKAGE_EXTRA_ARCHS ?= "armv4 armv4t armv5e armv5te"

> No need for the ?= here...
[...]
> or here...

OK, just wanted to be safe.  I'll remove the ?.  Thanks.  Diff is
updated again.

Regards

Rolf


--------------070602030504010705080905--
