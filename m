Received: from [209.85.211.193] (helo=mail-yw0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MhVAr-0003lG-EC
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 23:09:25 +0200
Received: by ywh31 with SMTP id 31so4094938ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 13:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=U1IlFocmy1XHEI7G7Pt4nJV87x/9L93ygS027x4sO1k=;
	b=VTXCMtvDKombEIBosauly7Zlw8HcfI1C+G2eh9VilA+syjeFG0CqhNAw8HTYenbDE1
	iSEhQl423rrB8yx8IhD88dtm8vfnyF1y8J2Ts31yJZ7P6sVo7ypc5Wx3KywUOOZzr8Ys
	zqLmmuRVGVLcUR71o9i/CKBxJbDbXi3aNQwuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RUtx1jPpJfPmwJZWJ1eF3yzWMX/ne91d/AAzojvyy8wHj4t3Y2e9qzjrfvcafYp5fF
	K9DYW8wTjVdY6qxbpKq7hh10z2eXU51L8HblzHYNafS3iUZaqVnbCKJqDzGZ+LlfAcWP
	ErSfZmkoj9NaBV5kFZMf4iRzb3HfUZ237vBGw=
MIME-Version: 1.0
Received: by 10.150.244.6 with SMTP id r6mr5096268ybh.117.1251579064319; Sat, 
	29 Aug 2009 13:51:04 -0700 (PDT)
Date: Sat, 29 Aug 2009 16:51:04 -0400
Message-ID: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: getting back to < 2MB rootfs with mtd-utils
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
X-List-Received-Date: Sat, 29 Aug 2009 21:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have been experimenting with small images again trying to get a
uclibc initramfs image with mtd-utils around 1MB.  So far I've
learned:

- minimal-image is not all that minimal any more
- micro-image is better
- micro-base-image is slightly smaller (1.6MB vs 1.7MB) yet as it uses
mdev instead of udev
- micro distro builds eglibc and is about 6MB for micro-base-image
- micro-uclibc distro does not build for cm-x270

micro-base-image is currently 1.6MB for cpio.gz, which is much larger
than the 1MB uclibc images I built about a year ago, but that would be
acceptable.

However, adding mtd-utils to the image which I need for system update
functionality bloats it up to 4MB.

diff -urN installed-package-sizes.txt installed-package-sizes-with-mtd-utils.txt
--- installed-package-sizes.txt 2009-08-29 16:27:43.000000000 -0400
+++ installed-package-sizes-with-mtd-utils.txt  2009-08-29
16:29:17.000000000 -0400
@@ -1,11 +1,17 @@
+1304   KiB /armv5te/gettext_0.17-r2.3_armv5te.ipk
+828    KiB /armv5te/libiconv_1.12-r1.3_armv5te.ipk
+548    KiB /armv5te/libgettextlib_0.17-r2.3_armv5te.ipk
 368    KiB /armv5te/busybox_1.13.2-r22.1.3_armv5te.ipk
+328    KiB /armv5te/mtd-utils_1.2.0+git-r3.3_armv5te.ipk
 296    KiB /armv5te/libgnutls26_2.4.2-r4.3_armv5te.ipk
 272    KiB /cm-x270/uclibc_0.9.30-r7.3_cm-x270.ipk
 228    KiB /armv5te/libgcrypt11_1.4.1-r0.3_armv5te.ipk
 148    KiB /armv5te/udev_141-r11.3_armv5te.ipk
 128    KiB /armv5te/libcurl4_7.19.5-r0.3_armv5te.ipk
+108    KiB /armv5te/libgettextsrc_0.17-r2.3_armv5te.ipk
 84     KiB /armv5te/libopkg0_0.1.6+svnr215-r14.3_armv5te.ipk
 56     KiB /armv5te/udev-utils_141-r11.3_armv5te.ipk
+56     KiB /armv5te/liblzo1_1.08-r14.3_armv5te.ipk
 44     KiB /armv5te/libz1_1.2.3-r5.3_armv5te.ipk
 32     KiB /armv5te/sysvinit_2.86-r57.3_armv5te.ipk
 24     KiB /armv5te/sysvinit-utils_2.86-r57.3_armv5te.ipk
@@ -14,6 +20,7 @@
 12     KiB /armv5te/base-passwd_3.5.20-r1.3_armv5te.ipk
 8      KiB /cm-x270/base-files_3.0.14-r88.3_cm-x270.ipk
 8      KiB /armv5te/opkg-nogpg_0.1.6+svnr215-r14.3_armv5te.ipk
+8      KiB /armv5te/libuuid1_2.16-r7.3.3_armv5te.ipk
 8      KiB /armv5te/libgpg-error0_1.4-r6.1.3_armv5te.ipk
 4      KiB /cm-x270/sysvinit-inittab_2.86-r57.3_cm-x270.ipk
 4      KiB /armv5te/sysvinit-pidof_2.86-r57.3_armv5te.ipk

So I need to figure out why mtd-utils is pulling in so much stuff.
Also, it would be nice to remove opkg.  These are mostly just notes as
I work through this, but if anyone has good ideas, they are welcome
:-)

Cliff


