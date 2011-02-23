Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickael.chazaux@gmail.com>) id 1PsE9q-0000Bm-Hc
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:49:30 +0100
Received: by vxd7 with SMTP id 7so3326988vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 04:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=Nlh/2mgogqM5RzQoiE3NWZSfTeaLeuheHG1X7MNphek=;
	b=iQrtSMnSmd1lxsuwR0JIdcwvEIlB9t6uI8Ehlv2oJXv1CPRYmLJwWAnNldB7Cm/8os
	F92yQ3g00kuROqAOSXBv5AOpVTa67pcsfkPn5EeI3ohjE30ZDZH23K2mSI1VRRCJ9k5Q
	gI+6If4+CqnOTjMMsrrWxmAbaqcPc4HHdJ+Xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=D6LA4woj/gwBcXMd829lOsgJ+3/KqKiHxtxhlo0eOyQxUBW9CW4iEXqANeuZWPbqzN
	djEXiZmFXP5wZawf6jCJutukjhqG2sjXpQDCiMP/LCvoZBYEjpE3eDmcOoA2l49iNTxr
	DpmzWU9FHGuZDvjQejH+majdsOWiuiS7HtVWc=
MIME-Version: 1.0
Received: by 10.52.157.70 with SMTP id wk6mr5936945vdb.219.1298465290380; Wed,
	23 Feb 2011 04:48:10 -0800 (PST)
Received: by 10.220.180.7 with HTTP; Wed, 23 Feb 2011 04:48:10 -0800 (PST)
Date: Wed, 23 Feb 2011 13:48:10 +0100
Message-ID: <AANLkTinD5vHUrhcuB1McLOkG4M+K7T5zAvCX276Xti8a@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: VMware disk image type
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
X-List-Received-Date: Wed, 23 Feb 2011 12:49:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I see there is a vmware.conf in conf/machine, but it does not generate
vmdk (vmware virtual disk files) files. Here are the steps I take to
do that:

- create an empty file the size wanted (with dd),
- format it to ext3 (mkfs.ext3 myfile)
- mount it loopback (mount -o loop myfile /mnt)
- untar the OE-generated rootfs in /mnt
- create a /boot/extlinux.conf [1],
- install extlinux in /boot (extlinux -i /mnt/boot)
- umount,
- convert to vmdk (using qemu-img -O vmdk myfile myfile.vmdk)
- boot it in vmware.

Is it possible to add a "vmdk" image to openembedded to do this automatically?

Regards,

Mickael

[1]
/boot/extlinux.conf contents :

label a
kernel /boot/bzImage
append root=/dev/sda rw


