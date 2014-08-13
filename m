Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A620465CB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:30:26 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so88301wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ne3BKvFlr3uLZ61av+Ci/7UmxcxQe6W8tu110HXWwhU=;
	b=MNOUeaB2ERZfDYgFK4GpCztqD08hzKjfIXdjCG/LvIR0KXfneLG5so/yJwOEbgJXja
	ExVSacdooGiWJySD2KGxWn3qk99IEOpJEeP1F/NMIQojTgjsKDNbGeOccEsqVswlUoJt
	ONs0nRLMCjTiF+B9xoMGeA55lBd9cscI6v1PrDlamECZyyF31Zk4NVVwBqX4u7XDSHZ+
	qlc6qqhlDG5a7Ro+bv+Ut52JL9Uzd68lbI22sTxi02oQglVZkWa1N86hIxsvjn6iWdyj
	/iybXA0lUEycsniqvaHXJhuWIT6TgLVG4pc7AoEja0GgS/JROif2nbJIcw+7K3YeZdUh
	N4LA==
MIME-Version: 1.0
X-Received: by 10.180.37.241 with SMTP id b17mr2115830wik.70.1407893426756;
	Tue, 12 Aug 2014 18:30:26 -0700 (PDT)
Received: by 10.194.164.165 with HTTP; Tue, 12 Aug 2014 18:30:26 -0700 (PDT)
In-Reply-To: <CADJ8CoM1iHzedFROL50wR0GQfZnSeL8sUn_gFb=wdYz8nmChvA@mail.gmail.com>
References: <CADJ8CoM1iHzedFROL50wR0GQfZnSeL8sUn_gFb=wdYz8nmChvA@mail.gmail.com>
Date: Tue, 12 Aug 2014 18:30:26 -0700
Message-ID: <CAOLEWZX3tZtEo5BYsDgdMiujGAsY47hZgvpyaVEph7PLYKt_9g@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Doubts regarding the final Image file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Aug 2014 01:30:32 -0000
Content-Type: text/plain; charset=UTF-8

I'm not the TI guru-dude, but the beaglebone machines (white or black)
don't seem to use the image bbclass, but should at least produce the rootfs
tarballs and kernel/u-boot files to make a card (in your deploy
directory).  The TI sdcard and u-boot stuff is documented all over, but
essentially you format the sdcard as a vfat boot partition and ext* root
partition, copy MLO first, then the u-boot.bin file to the boot partition,
then untar (with -p) the rootfs to the root partition.  The kernel image
could go either place, depending on the u-boot config (but is probably in
the rootfs under /boot).  If the root part is ext2/3 then u-boot should be
able to load kernel image from there with the right config.  This way is
the "old" way and unfortunately has many variations depending on versions
of u-boot and vendor.  There should be some TI people listening who know
more, but if you just try it and it fails, you could try a serial console
to get a u-boot prompt.  Then you can display the u-boot environment and
see how it's configured.

Steve


On Tue, Aug 12, 2014 at 4:07 PM, Amey Patil <amey.patil@sjsu.edu> wrote:

> Hi,
> I am a beginner in this Yocto stuff.
>
> My objective: Angstrom operating system with built in Qt5 libraries on
> Beaglebone Black.
> My source:
>
> http://www.ics.com/blog/beaglebone-black-low-cost-embedded-platform-part-3#.U-lfAv7fEew
>
> I was expecting when I do "bitbake" (the final step), I will get a image
> file which I will copy to a memory card and flash the on board eMMC of
> Beaglebone black with it.
> But I dont see an image. :(
>
> Please guide.
>
> Sincere Regards,
> Amey Patil
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

