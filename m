Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0FEC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:39:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.68480.1638891556935019187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VRT48ASD;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.45,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f45.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso2062909wml.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23RyixzATv8ozW9fNJdIUZ2y6X0g5xyCbm1luVBLY/Q=;
        b=VRT48ASDnEP7NJuG3YbmDdDqySAfi6Pwal8AHhLKritfffdZb0yva9dIn8CFBSqldh
         WM760Y4RtaLxJsHT/mYM6yr68588WJ7SNwDkHw6V2he8zlQkMC7gfKOLLLgSY5IbnLsS
         RwRflDNAPfKCbaN+VtApmM8zc+Ol6mNdUmO7gdjRdVNS1X9mCtz8BJAvLRNa3gR0HX+j
         kGk3DWpVq+ePBQH7VebmeBanXv5Hx2czp7ZXbt5l0aC3Ab9P7AsPN1inwLeWOeBmkOLZ
         q7aPBm+N0gzp7TlTo7lpC6XAo5UvPY6NpuJLfdaNpCaowM+4GNiRPb9njwHCvzvnqwn+
         /CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23RyixzATv8ozW9fNJdIUZ2y6X0g5xyCbm1luVBLY/Q=;
        b=4WljoP3w8JXGuD3OT4rhdBcH3MCaKK3I1DiuBE08fZnRGF65SrIQu9JbYh52piRyAD
         JOE1LGMl/zMLqXzXNNI3iTYtfUKTXPTHX/5yG9no/ABw+PKr7I7wli9kP8iXOoKOQgZ4
         GUNt53be2+ru7W9SFTIfAxRp+nz2NQS4jYQGldOgBBrOzW/ruleX3A/ZSAag9naRmlCM
         INWb+8JRiCT3Go8HPEHWrogcrBLCL4XMAX1SDjNSxvU4BXvil/kBkC4UR8gxGv62TCQG
         MgPUrn8r8AbnWu3mJb+hFhxkC0WNNInS00rKgcK9S90Q5L8jsp+4TVdIhKZKMUxF9bVn
         vOfA==
X-Gm-Message-State: AOAM533xaY35afiF2GZX7vJxeNUodB5MT4/aROLYjRjYCMDDGVowA93Q
	GXejicRb3A8wMf+XSjHBxJLbNFXSU5HaWbwoD5SRww==
X-Google-Smtp-Source: 
 ABdhPJze//xVuUAcD2SLnOhGrQIZgDRXUn1aJjWu0vMeUy22WFN5yx9BlU6Du7BE2B4NS+moN6yciULHx1jbAgre1fc=
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr7902375wmq.116.1638891555224;
 Tue, 07 Dec 2021 07:39:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAfyv34URex-eHs1s7cM6iU-6fg9oOOc51sizeHWGV74NUs0ZA@mail.gmail.com>
 <6ebbed6e-540e-5e33-fa49-ee1a5f6f7af0@gmail.com>
 <CAAfyv36F79KhG=9auCZLcn0iSjtNtqhNFdui08-VtXT4Zj5hfQ@mail.gmail.com>
In-Reply-To: 
 <CAAfyv36F79KhG=9auCZLcn0iSjtNtqhNFdui08-VtXT4Zj5hfQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 7 Dec 2021 05:39:04 -1000
Message-ID: 
 <CAOSpxdbYsekpq8A5Y3YWyg7zELv=fi15ku5-93QwgDVJh6bPPg@mail.gmail.com>
Subject: Re: [oe] [RFC]: wic: Fix issue when building image with multiple
 partitions and swap
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 15:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94237

On Tue, Dec 7, 2021 at 12:22 AM Belisko Marek <marek.belisko@gmail.com> wrote:
>
> On Wed, Nov 24, 2021 at 5:36 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 11/24/21 5:28 AM, Marek Belisko wrote:
> > > Hi,
> > >
> > > I've posted something similar on yocto mailing list but no response so
> > > far so trying here as wic comes from open-embedded.
> > >
> >
> > Please send it to openembedded-core mailing list too. Looks a sane
> > approach to me.
> Seems fix is already present in actual poky master:
> 37b4fa7a102f1212843411bd1d97202ba9da0e19 can it be backported to
> dunfell pls? Thanks.

I'll add this backport to my dunfell testing queue.

Steve

> >
> > > With wks file like this:
> > > echo '### Contents of wks file ###'
> > > | ### Contents of wks file ###
> > > | + cat /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> > > | part --source rawcopy
> > > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/uboot.env"
> > > --ondisk "mmcblk0" --align 8192 --no-table
> > > | part --source rootfs --rootfs-dir
> > > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> > > --ondisk "mmcblk0" --fstype=vfat --label boot --align 8192
> > > --fixed-size 16 --active
> > > | part --source rawcopy
> > > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> > > --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> > > | part --source rawcopy
> > > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> > > --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> > > | part swap --ondisk "mmcblk0" --fstype=swap --label swap --align 8192
> > > --size 512
> > > | part --source rawcopy
> > > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.dataimg"
> > > --ondisk "mmcblk0" --align 8192 --fixed-size 128
> > > |
> > > | bootloader --ptable msdos
> > > | + echo '### End of contents of wks file ###'
> > > | ### End of contents of wks file ###
> > >
> > > I'm seeing issue like:
> > >
> > > | INFO: Creating image(s)...
> > > |
> > > | Traceback (most recent call last):
> > > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 542, in <module>
> > > |     sys.exit(main(sys.argv[1:]))
> > > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 537, in main
> > > |     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
> > > subcommands)
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/help.py",
> > > line 83, in invoke_subcommand
> > > |     subcmd[0](args, usage)
> > > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 219,
> > > in wic_create_subcommand
> > > |     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/engine.py",
> > > line 190, in wic_create
> > > |     plugin.do_create()
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > > line 96, in do_create
> > > |     self.create()
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > > line 180, in create
> > > |     self._image.prepare(self)
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > > line 354, in prepare
> > > |     part.prepare(imager, imager.workdir, imager.oe_builddir,
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/partition.py",
> > > line 182, in prepare
> > > |     plugin.do_prepare_partition(self, srcparams_dict, creator,
> > > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/source/rootfs.py",
> > > line 112, in do_prepare_partition
> > > |     copyhardlinktree(orig_dir, new_rootfs)
> > > |   File "/home/marek/projects/kas-test/poky/meta/lib/oe/path.py",
> > > line 121, in copyhardlinktree
> > > |     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> > > |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> > > line 411, in check_output
> > > |     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
> > > |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> > > line 512, in run
> > > |     raise CalledProcessError(retcode, process.args,
> > > | subprocess.CalledProcessError: Command 'cd
> > > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg;
> > > find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C
> > > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> > > -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*'
> > > -xhf - -C /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4-20211115212420-sdimg/tmp.wic.1oe9hwjw/rootfs2'
> > > returned non-zero exit status 2.
> > >
> > > After some debugging spent by adding following issue seems to be fixed:
> > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > > b/scripts/lib/wic/plugins/imager/direct.py
> > > index 7e1c1c0..d37ecee 100644
> > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > @@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
> > >           updated = False
> > >           for part in self.parts:
> > >               if not part.realnum or not part.mountpoint \
> > > -               or part.mountpoint == "/":
> > > +               or part.mountpoint == "/" or part.mountpoint == "swap":
> > >                   continue
> > >               if part.use_uuid:
> > >
> > > Does it make any sense or is it just a hack? I'm not a wic expert at all.
> > >
> > > Thanks and BR,
> > >
> > > marek
> > >
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#94113): https://lists.openembedded.org/g/openembedded-devel/message/94113
> > > Mute This Topic: https://lists.openembedded.org/mt/87280766/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

