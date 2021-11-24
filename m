Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E41BC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 16:36:33 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.376.1637771792670184455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 08:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+N3agS7;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y8so2310628plg.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 08:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=sa/7Kqm3Ikhqtc5s6q16LPopngczx9bmVUpuTc10lD0=;
        b=p+N3agS7GP5WICsaCvVddJA5mYjxrX1qmD2ZFM7WhtlpJ4mxc1P+fp4UG8DjgEvmlZ
         Gdef8fiCz0n61bHd/iR85xk6Xe+fRG8QvK8RKlkQAiZqbNzlwzhNSWiiB5Js7/H2WdtS
         RaTjdCZzsLYha0PRYnh8tavtKbuXojX7fYYeuGNfJLg7UTVT7BlgTNcq/h5bGlIRjcXz
         02lSisX6xfgVpAjmPUR85+xT3KHkilueLWl70yIg7xe7Bpp29+sSktgPG0Xg898zQYTE
         0gt2M8hCbQ/OO1ZDGHQp/0O/Q74+iPuibQHaF/kA/0f3d5tCCI2DXAJvXaQNdx7m/nrF
         w/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=sa/7Kqm3Ikhqtc5s6q16LPopngczx9bmVUpuTc10lD0=;
        b=QRisoG+7wOKJ+jtPhOj80h2bJFvMKU6hEbrtBMK3f9s1HAJYX+pSc+GByFAAFkY7rW
         bEZxMfZV3We/Po4qnnxvZ3Kb+S9O9gRogrY1uFAZHvnkiTZ+y/ZJaTh89X06ad4h+Ayw
         0BU2bPIcXqigZcI+fgD6tF+FMBvprgMNiysczfEd0vbPvX7MI1ozpmMwrcbCFumab9IG
         WEqSXVZaPtSeRAJV97AdBKJUlz8PTNWDbbWf0rHHkhuWE65tXDeqCLf/y/zZiVt/j567
         u5e4nzZ6pCZnkqAni7MY3PYtHvA1436TerbvVEuxzSmxzUnvIXXXmHN0uXpqB13VBJGu
         mPRA==
X-Gm-Message-State: AOAM532YNuNCktkM+zrKFptIQ7lxQzk/6UoFU3MnoRZ+dzp8MK/sNdp2
	2w8UmHGDIVto6TUR/30DF9M=
X-Google-Smtp-Source: 
 ABdhPJxZCDP02Fo5AJzoByC3DFvwytZNkuMfHyICgxsxaLHL1m4IKeI/r+0TKyParp/SR08ISRAs8A==
X-Received: by 2002:a17:903:2082:b0:142:7dff:f7dc with SMTP id
 d2-20020a170903208200b001427dfff7dcmr20311458plc.46.1637771792029;
        Wed, 24 Nov 2021 08:36:32 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:19f4:f2e5:efb1:d8bf?
 ([2601:646:9200:a0f0:19f4:f2e5:efb1:d8bf])
        by smtp.gmail.com with ESMTPSA id
 s6sm237022pfu.137.2021.11.24.08.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:36:31 -0800 (PST)
Message-ID: <6ebbed6e-540e-5e33-fa49-ee1a5f6f7af0@gmail.com>
Date: Wed, 24 Nov 2021 08:36:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [oe] [RFC]: wic: Fix issue when building image with multiple
 partitions and swap
Content-Language: en-US
To: Marek Belisko <marek.belisko@gmail.com>,
 OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
References: 
 <CAAfyv34URex-eHs1s7cM6iU-6fg9oOOc51sizeHWGV74NUs0ZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAAfyv34URex-eHs1s7cM6iU-6fg9oOOc51sizeHWGV74NUs0ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Nov 2021 16:36:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94115



On 11/24/21 5:28 AM, Marek Belisko wrote:
> Hi,
> 
> I've posted something similar on yocto mailing list but no response so
> far so trying here as wic comes from open-embedded.
> 

Please send it to openembedded-core mailing list too. Looks a sane 
approach to me.

> With wks file like this:
> echo '### Contents of wks file ###'
> | ### Contents of wks file ###
> | + cat /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
> | part --source rawcopy
> --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/uboot.env"
> --ondisk "mmcblk0" --align 8192 --no-table
> | part --source rootfs --rootfs-dir
> /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> --ondisk "mmcblk0" --fstype=vfat --label boot --align 8192
> --fixed-size 16 --active
> | part --source rawcopy
> --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> | part --source rawcopy
> --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
> --ondisk "mmcblk0" --align 8192 --fixed-size 172032k
> | part swap --ondisk "mmcblk0" --fstype=swap --label swap --align 8192
> --size 512
> | part --source rawcopy
> --sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.dataimg"
> --ondisk "mmcblk0" --align 8192 --fixed-size 128
> |
> | bootloader --ptable msdos
> | + echo '### End of contents of wks file ###'
> | ### End of contents of wks file ###
> 
> I'm seeing issue like:
> 
> | INFO: Creating image(s)...
> |
> | Traceback (most recent call last):
> |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 542, in <module>
> |     sys.exit(main(sys.argv[1:]))
> |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 537, in main
> |     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
> subcommands)
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/help.py",
> line 83, in invoke_subcommand
> |     subcmd[0](args, usage)
> |   File "/home/marek/projects/kas-test/poky/scripts/wic", line 219,
> in wic_create_subcommand
> |     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/engine.py",
> line 190, in wic_create
> |     plugin.do_create()
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> line 96, in do_create
> |     self.create()
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> line 180, in create
> |     self._image.prepare(self)
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
> line 354, in prepare
> |     part.prepare(imager, imager.workdir, imager.oe_builddir,
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/partition.py",
> line 182, in prepare
> |     plugin.do_prepare_partition(self, srcparams_dict, creator,
> |   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/source/rootfs.py",
> line 112, in do_prepare_partition
> |     copyhardlinktree(orig_dir, new_rootfs)
> |   File "/home/marek/projects/kas-test/poky/meta/lib/oe/path.py",
> line 121, in copyhardlinktree
> |     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> line 411, in check_output
> |     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
> |   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
> line 512, in run
> |     raise CalledProcessError(retcode, process.args,
> | subprocess.CalledProcessError: Command 'cd
> /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg;
> find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C
> /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
> -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*'
> -xhf - -C /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4-20211115212420-sdimg/tmp.wic.1oe9hwjw/rootfs2'
> returned non-zero exit status 2.
> 
> After some debugging spent by adding following issue seems to be fixed:
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> index 7e1c1c0..d37ecee 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
>           updated = False
>           for part in self.parts:
>               if not part.realnum or not part.mountpoint \
> -               or part.mountpoint == "/":
> +               or part.mountpoint == "/" or part.mountpoint == "swap":
>                   continue
>               if part.use_uuid:
> 
> Does it make any sense or is it just a hack? I'm not a wic expert at all.
> 
> Thanks and BR,
> 
> marek
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94113): https://lists.openembedded.org/g/openembedded-devel/message/94113
> Mute This Topic: https://lists.openembedded.org/mt/87280766/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

