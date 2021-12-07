Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC3FC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 10:22:37 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web12.65232.1638872556008339294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 02:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SWyg2f9S;
 spf=pass (domain: gmail.com, ip: 209.85.219.169,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id e136so39516587ybc.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9ZZ4f911coUOWOC0/YRtTH+AGspIOHOVpHU2jNRRIs=;
        b=SWyg2f9SbUSiSmIyAaODwE14eXYGhz18LNk4RhSZRVNGroKVl0HFUQVQPn2GuHirTc
         pYfJ81YdqnwGL54UJJu4F+CRoBq6QeyJ4SKibht9kEEBpDL75ycM2rmxvCw7Rl4we+LZ
         bTH1uoAnvfeT3X4Ix2dCgGtAhjL09+2T6BKTqUwkBWVSs46ByuxIccwB6uAnhSDJN5pH
         x5hLxAyrZbm+HKFf/T5OuDteFmnao6ER7DXqouDmU08JKIwgobl1XlN62qbdUr99CpRQ
         EKM4qi0kvQ/d8G/qYxDp4OFjhGV9u4i3++Ie7zyh8l4vvILO+7Ykzrq0oQkzeTIbUqWv
         0oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9ZZ4f911coUOWOC0/YRtTH+AGspIOHOVpHU2jNRRIs=;
        b=1OJag62boajy1vSii9qspXefMIAq1zG8/9z+k0N3xqOwMQ3mbXUs0VcyS9ie/+3YtN
         uTmTkatuRcSr1SSm+1qWX7Y8eal9GA5FZB7CJSNZthBQrGTBLGICcYkI7RbEJtKaGFTa
         nZ7CcAUTloC3zX2sjDhgDQsaY6gpaSlLtJn/6Xu/Vznr2GeRQ96h4bb1XTnXnWAWreX+
         C/whYyypH0tTU8l8It6DHFcOLgUyVTorPG1949wc5TUzDxE6F7QXsMvOgOHZjbOkJjs6
         +NWJwfB5Cdd8QUkJRBUi+XA/KbvHpRNgv6LUOFtcA5fxEka/aYjTV9lXFe8cxW6k2z1J
         tF/g==
X-Gm-Message-State: AOAM533oP3tIe0a27cU2h5LofWKrMjQYy1l4kBXingL/CZRQqAhIYyda
	mfzruUGusx8+odhHn0C3lIZHZ9KHHmVK/SB2xgY=
X-Google-Smtp-Source: 
 ABdhPJzfH8xvcHMaOftoPSItPJNXRkuGhDyg25A1OP4dogKUcfumbo+2ax4I5URLPI/S1RIyd2aB3IEeIsMADvn6JJM=
X-Received: by 2002:a25:38cb:: with SMTP id
 f194mr52212328yba.446.1638872555099;
 Tue, 07 Dec 2021 02:22:35 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAfyv34URex-eHs1s7cM6iU-6fg9oOOc51sizeHWGV74NUs0ZA@mail.gmail.com>
 <6ebbed6e-540e-5e33-fa49-ee1a5f6f7af0@gmail.com>
In-Reply-To: <6ebbed6e-540e-5e33-fa49-ee1a5f6f7af0@gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 7 Dec 2021 11:22:24 +0100
Message-ID: 
 <CAAfyv36F79KhG=9auCZLcn0iSjtNtqhNFdui08-VtXT4Zj5hfQ@mail.gmail.com>
Subject: Re: [oe] [RFC]: wic: Fix issue when building image with multiple
 partitions and swap
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 10:22:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94226

On Wed, Nov 24, 2021 at 5:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 11/24/21 5:28 AM, Marek Belisko wrote:
> > Hi,
> >
> > I've posted something similar on yocto mailing list but no response so
> > far so trying here as wic comes from open-embedded.
> >
>
> Please send it to openembedded-core mailing list too. Looks a sane
> approach to me.
Seems fix is already present in actual poky master:
37b4fa7a102f1212843411bd1d97202ba9da0e19 can it be backported to
dunfell pls? Thanks.
>
> > With wks file like this:
> > echo '### Contents of wks file ###'
> > | ### Contents of wks file ###
> > | + cat /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> > | part --source rawcopy
> > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/uboot.env"
> > --ondisk "mmcblk0" --align 8192 --no-table
> > | part --source rootfs --rootfs-dir
> > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> > --ondisk "mmcblk0" --fstype=vfat --label boot --align 8192
> > --fixed-size 16 --active
> > | part --source rawcopy
> > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> > --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> > | part --source rawcopy
> > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> > --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> > | part swap --ondisk "mmcblk0" --fstype=swap --label swap --align 8192
> > --size 512
> > | part --source rawcopy
> > --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.dataimg"
> > --ondisk "mmcblk0" --align 8192 --fixed-size 128
> > |
> > | bootloader --ptable msdos
> > | + echo '### End of contents of wks file ###'
> > | ### End of contents of wks file ###
> >
> > I'm seeing issue like:
> >
> > | INFO: Creating image(s)...
> > |
> > | Traceback (most recent call last):
> > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 542, in <module>
> > |     sys.exit(main(sys.argv[1:]))
> > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 537, in main
> > |     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
> > subcommands)
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/help.py",
> > line 83, in invoke_subcommand
> > |     subcmd[0](args, usage)
> > |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 219,
> > in wic_create_subcommand
> > |     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/engine.py",
> > line 190, in wic_create
> > |     plugin.do_create()
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > line 96, in do_create
> > |     self.create()
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > line 180, in create
> > |     self._image.prepare(self)
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> > line 354, in prepare
> > |     part.prepare(imager, imager.workdir, imager.oe_builddir,
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/partition.py",
> > line 182, in prepare
> > |     plugin.do_prepare_partition(self, srcparams_dict, creator,
> > |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/source/rootfs.py",
> > line 112, in do_prepare_partition
> > |     copyhardlinktree(orig_dir, new_rootfs)
> > |   File "/home/marek/projects/kas-test/poky/meta/lib/oe/path.py",
> > line 121, in copyhardlinktree
> > |     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> > |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> > line 411, in check_output
> > |     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
> > |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> > line 512, in run
> > |     raise CalledProcessError(retcode, process.args,
> > | subprocess.CalledProcessError: Command 'cd
> > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg;
> > find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C
> > /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> > -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*'
> > -xhf - -C /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4-20211115212420-sdimg/tmp.wic.1oe9hwjw/rootfs2'
> > returned non-zero exit status 2.
> >
> > After some debugging spent by adding following issue seems to be fixed:
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > b/scripts/lib/wic/plugins/imager/direct.py
> > index 7e1c1c0..d37ecee 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
> >           updated = False
> >           for part in self.parts:
> >               if not part.realnum or not part.mountpoint \
> > -               or part.mountpoint == "/":
> > +               or part.mountpoint == "/" or part.mountpoint == "swap":
> >                   continue
> >               if part.use_uuid:
> >
> > Does it make any sense or is it just a hack? I'm not a wic expert at all.
> >
> > Thanks and BR,
> >
> > marek
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#94113): https://lists.openembedded.org/g/openembedded-devel/message/94113
> > Mute This Topic: https://lists.openembedded.org/mt/87280766/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

