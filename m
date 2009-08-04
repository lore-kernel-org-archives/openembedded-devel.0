Received: from [209.85.211.182] (helo=mail-yw0-f182.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bill.shui@gmail.com>) id 1MYJ8X-0002KG-0U
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 14:29:01 +0200
Received: by ywh12 with SMTP id 12so4905676ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=kSoBj+lRdMO3+aJdAbi+BmDMHQBJstjbEPlphl9WtQo=;
	b=rg3Pmra1rh6AGtHk66SCGKk1X5TTh15N9YXrFsYzPVQMvLJMo4koveMHcwbNAkr3YR
	dtkf+UgdpIzQHmaGQSYWD/s9nN8hl5eB9EZqvbMKIqifo6ZCX+rSuxFKMogU5wrXRjOn
	6WD6gvjz2m+5aWDdL6nYyInAK4/VDD2g7KRvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VvUPISDWSSUyTWEGH05yvfwvJS+K/H5rqR3+0tA57g7uYyugFPOJW6Cpo7NRg2zan5
	9wJ+glIrwkYRdDU09vprb3pvR/rTVAt5NwB22g8/tz1g0SxLfpMi2hAduYRzsmVmjXem
	nEMHn3piOWgldOyhALFyImnA19pB6gmjgPHD8=
MIME-Version: 1.0
Received: by 10.150.51.6 with SMTP id y6mr13174017yby.11.1249388006463; Tue, 
	04 Aug 2009 05:13:26 -0700 (PDT)
Date: Tue, 4 Aug 2009 22:13:26 +1000
Message-ID: <5cc04f210908040513k262b0coddc0be51c22c3bb4@mail.gmail.com>
From: Bill Shui <bill.shui@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Qemu on gumstix-x11-image
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
X-List-Received-Date: Tue, 04 Aug 2009 12:29:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I have a Gumstix GS400K-XMBT-EINK Basix 400xm-bt motherboard.

I am trying to install the latest version of gumstix open embedded
(from the svn repository) with a newer version of kernel (2.6.30)

But before this, I wanted to try it out on Qemu first, just using the
standard packages.

I have a debian lenny amd64 running default kernel image and I have
qemu 0.9.1 installed.

This is what I did (in desktop gnome).

1) I sourced gumstix-oe/extra/profile to set up all the variables.
2) I modifed gumstix-oe/build/conf/auto.conf by commenting out the
default verdex build and uncommented
MACHINE = "gumstix-custom-basix"

3) I modified gumstix-oe/org.openembedded.snapshot/packages/curl/curl_7.16.4.bb
and added a line "--without-libssh2 \"

I did this because I have had problem building this before as
curl-native alwas complained that it could not link to libssh2

4) bitbake gumstix-x11-image


5) I waited until I encounter an error when building gmp-native
(complaining multiple definitions)

6) I edited gumstix-oe/tmp/work/x86_64-linux/gmp-native-4.2.1-r2/gmp-4.2.1/Makefile
by adding "-Wl,--allow-multiple-definition," to line 307, starting
with "LDFLAGS ="

7) I continued with bitbake gumstix-x11-image

8) all went well.

I then proceeded to build a flash.img by doing the following:

copying gumstix-oe/tmp/deploy/gumstix-x11-image-gumstix-custom-basix.jffs2
and uImage-2.6.21-r1-gumstix-custom-basix.bin

to a new temp directoty

in the same temp directory, wget the new u-boot-connex-400-r1604.bin

dd of=flash.img bs=128k count=128 if=/dev/zero
dd of=flash.img bs=128k conv=notrunc if=u-boot-connex-400-r1604.bin
dd of=flash.img bs=128k conv=notrunc seek=2
if=gumstix-x11-image-gumstix-custom-basix.jffs2
dd of=flash.img bs=128k conv=notrunc seek=120
if=uImage-2.6.21-r1-gumstix-custom-basix.bin


Now, here' s the problem.

I try to run it in qemu as currently I am waiting for my gumstix board
to be sent back to me from Gumstix (a reflashing service).

I did the following:

qemu-system-arm -M connex -cpu pxa255 -std-vga -pflash flash.img


But nothings happens apart from the initial new window popping up with
the gumstix logo, then changed to please wait: booting....

The console returned the following:

pflash_write: Unimplemented flash cmd sequence (offset 00000000,
wcycle 0x0 cmd 0x0 value 0xf0


That was it. nothing happened after this.



I am new to this and not sure what I did wrong there.


Any help is much appreciated.


