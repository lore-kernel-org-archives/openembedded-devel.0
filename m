Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NexGL-0006Dm-BP
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:04:52 +0100
Received: by fxm25 with SMTP id 25so6328593fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2KijIJKd25NKOdjMfC/eBg9SOv3O6rhu1KS25xDkBMA=;
	b=nFKS0DPWqiYI2iheT69WNnS+cNmmXjD+lgrlbcNVmNS6L/Aa+F9RRV3J/ljBglqo+6
	umNyJ0JIK23NqCLr1uiEo0G3KABHbMbAgX65tQmMiGClL8X1+z7ndTPCOw/lIBO1Wx7O
	vDezRvQgtyzjJX7o6Hh+NYmTh7ZUXvlZ/FBrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TU72lYdHzvgzmR1XYS3FF7DIMcmXcj651Pv3EjQgam7QgBgPELhaW4j6R6HZywuPWN
	OF/XUTrfvktSICJs0b7FD6tdR5vY2CtyuzEi7LECssK8kZPBLKiTXMVxYLUHxrnp3EKp
	AfqfT0z4hkTowBAbny/rc1B5shiLwXEcFR8Hw=
Received: by 10.223.14.89 with SMTP id f25mr7247469faa.15.1265749335793;
	Tue, 09 Feb 2010 13:02:15 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 14sm283150fxm.7.2010.02.09.13.02.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Feb 2010 13:02:14 -0800 (PST)
Date: Tue, 9 Feb 2010 13:02:08 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209210208.GB3142@gmail.com>
References: <1265736322.3731.23.camel@gnutoo-desktop>
MIME-Version: 1.0
In-Reply-To: <1265736322.3731.23.camel@gnutoo-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: oe's GDB 7.0 doesn't load symbols for me(csl does)
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
X-List-Received-Date: Tue, 09 Feb 2010 21:04:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/02/10 18:25), GNUtoo wrote:
> Hi,
> Here's my setup:
> 
> htcdream.conf
> shr.conf
> org.openembedded.dev branch at afc0667965549d0ac1cc5cd93a30c2aa8e47dc28
> bitbake gdb-cross
> 
> I did the following:
> the following 3 devices are implicated:
> *1 build laptop
> *1 desktop
> *1 htcdream
> The htcdream is connected to the desktop which is on the same network
> than the laptop.
> 
> Openssh(not dropbear) is runing on the htcdream.
>  
> So I do that on the target:
> gdbserver 127.0.0.1:8022 Xorg
> 
> And that on the desktop:
> iptables -t nat -A PREROUTING -p tcp --dport 22 -i wlan0 -j DNAT --to
> 192.168.0.202:22
> 
> And that on the laptop:
> # sshfs root@desktop:/ /mnt/NFS

this will mount / on desktop as /mnt/NFS on your laptop.

> # source
> ~/oetmp/deploy/addons/arm-oe-linux-gnueabi-shr-htcdream-devshell
> # ./arm-oe-linux-gnueabi-gdb
> [OE::arm-oe-linux-gnueabi-shr-htcdream]:~$ arm-oe-linux-gnueabi-gdb
> GNU gdb (GDB) 7.0
> Copyright (C) 2009 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying"
> and "show warranty" for details.
> This GDB was configured as "--host=i686-linux
> --target=arm-oe-linux-gnueabi".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) set sysroot /mnt/NFS
> (gdb) file /mnt/NFS/usr/bin/Xorg 
> Reading symbols from /mnt/NFS/usr/bin/Xorg...Reading symbols
> from /mnt/NFS/usr/bin/.debug/Xorg...done.
> (no debugging symbols found)...done.
> 
> 
> And on my desktop with codesourcey:
> 
> # sshfs root@desktop:/mnt/embedded_rootfs

the above command seems to be incomplete 

Make sure that you are loading same symbol files in both cases

> # cd .../arm-2009q3/bin
> # ./arm-none-linux-gnueabi-gdb
> GNU gdb (Sourcery G++ Lite 2009q3-67) 6.8.50.20090630-cvs
> Copyright (C) 2009 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying"
> and "show warranty" for details.
> This GDB was configured as "--host=i686-pc-linux-gnu
> --target=arm-none-linux-gnueabi".
> For bug reporting instructions, please see:
> <https://support.codesourcery.com/GNUToolchain/>.
> (gdb) set sysroot /mnt/embedded_rootfs/
> (gdb) file /mnt/embedded_rootfs/usr/bin/Xorg 
> Reading symbols from /mnt/embedded_rootfs/usr/bin/Xorg...Reading symbols
> from /mnt/embedded_rootfs/usr/bin/.debug/Xorg...done.
> done.
> 
> Note that codesourcey corrupt the frames but not the oe gdb
> so oe's gdb is usable...in assembly...
> 
> Denis.
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


