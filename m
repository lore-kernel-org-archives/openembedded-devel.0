Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1731C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 13:28:48 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.6091.1637760528294434935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 05:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S2QELY0I;
 spf=pass (domain: gmail.com, ip: 209.85.219.180,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 131so7306087ybc.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=iBxgo/pocU7RQGt8D/arprY+oQDUCGF8xs62XHeo3o8=;
        b=S2QELY0I6eBAd+MZK+MYkPvUCLT5gdln4jkn/0ACCXnb08uw7tX8Dw+pZVL5sd8uz2
         K0zDKbIdgJifLzPyd3uo9c/p0O1uhakFajmyMD44+jljB6PJ79wNkSfWdeiCsO3lku0A
         +uZV1ZXMAsdbdYPxdVk5LxWrKattd0sSX0ZfL24LEtgEyIcSc8/rQ6EGAnMGHH8JIyZk
         VO4fpRGMF66EBqPbC+eS5R41Gu5o/TMKJn9mNOMmu/hHm2rUVMruSkn7Qc0viOUL/Spb
         0yk2NuIeW6iJ0Bkeyuv8aMBe1sliw6dY5KYcEOq8xCmlOt1xbuKVKZ3y3EmDyXSCga2w
         hOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iBxgo/pocU7RQGt8D/arprY+oQDUCGF8xs62XHeo3o8=;
        b=omtCj4MraeQwfjQILaLVmDGrSpivdTzo7ilMc977iffmaK78Uhowl4IDRZjy/KJWSk
         On4xoaqyL9VM9+RvFi6ROEvRTAC984t8QGqtFD/83SGo5YVYHWvYlwib8vpB1jzl4D2X
         qUGB5h2BzG80bX61NcBkwdDd0qDRaN2Qt3Tfc81E5ksIHvkg3fx7ousAKp2ko8gc6qxy
         ZrZNg64HYkIsmJD0h6v6xaXgE1qU7YsrM88b1iSYQhjIgp17tCqjs3xoul9EumuRw7VY
         0jeyX+80TUlUU79kl8lUXQjygZzPYYzbq1PlxFbEiDsZ62R3cXcKa8akldYlNk9txI5q
         EZoA==
X-Gm-Message-State: AOAM530vpL3UMtd278f1ksmMfY1WRC7YbLOad9NdmUS98l+aoY/K6/d8
	+2kkgmcq1tQ426Z03tmQiYq7PLrAju6eK2FZvHQ4CAFAP8vang==
X-Google-Smtp-Source: 
 ABdhPJxk9txUx6cgjtuYR8VVm1V2jv4Q5uJPhYgGU+3/675AbTcotY7A2GDCcpYznhDL+e9KyTJ8xXmf+w4qGvS2OkE=
X-Received: by 2002:a25:330b:: with SMTP id
 z11mr16389342ybz.511.1637760527163;
 Wed, 24 Nov 2021 05:28:47 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 24 Nov 2021 14:28:36 +0100
Message-ID: 
 <CAAfyv34URex-eHs1s7cM6iU-6fg9oOOc51sizeHWGV74NUs0ZA@mail.gmail.com>
Subject: [RFC]: wic: Fix issue when building image with multiple partitions
 and swap
To: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Nov 2021 13:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94113

Hi,

I've posted something similar on yocto mailing list but no response so
far so trying here as wic comes from open-embedded.

With wks file like this:
echo '### Contents of wks file ###'
| ### Contents of wks file ###
| + cat /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
| part --source rawcopy
--sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/uboot.env"
--ondisk "mmcblk0" --align 8192 --no-table
| part --source rootfs --rootfs-dir
/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
--ondisk "mmcblk0" --fstype=vfat --label boot --align 8192
--fixed-size 16 --active
| part --source rawcopy
--sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
--ondisk "mmcblk0" --align 8192 --fixed-size 172032k
| part --source rawcopy
--sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.ext4"
--ondisk "mmcblk0" --align 8192 --fixed-size 172032k
| part swap --ondisk "mmcblk0" --fstype=swap --label swap --align 8192
--size 512
| part --source rawcopy
--sourceparams="file=/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4.dataimg"
--ondisk "mmcblk0" --align 8192 --fixed-size 128
|
| bootloader --ptable msdos
| + echo '### End of contents of wks file ###'
| ### End of contents of wks file ###

I'm seeing issue like:

| INFO: Creating image(s)...
|
| Traceback (most recent call last):
|   File "/home/marek/projects/kas-test/poky/scripts/wic", line 542, in <module>
|     sys.exit(main(sys.argv[1:]))
|   File "/home/marek/projects/kas-test/poky/scripts/wic", line 537, in main
|     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
subcommands)
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/help.py",
line 83, in invoke_subcommand
|     subcmd[0](args, usage)
|   File "/home/marek/projects/kas-test/poky/scripts/wic", line 219,
in wic_create_subcommand
|     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/engine.py",
line 190, in wic_create
|     plugin.do_create()
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
line 96, in do_create
|     self.create()
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
line 180, in create
|     self._image.prepare(self)
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/imager/direct.py",
line 354, in prepare
|     part.prepare(imager, imager.workdir, imager.oe_builddir,
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/partition.py",
line 182, in prepare
|     plugin.do_prepare_partition(self, srcparams_dict, creator,
|   File "/home/marek/projects/kas-test/poky/scripts/lib/wic/plugins/source/rootfs.py",
line 112, in do_prepare_partition
|     copyhardlinktree(orig_dir, new_rootfs)
|   File "/home/marek/projects/kas-test/poky/meta/lib/oe/path.py",
line 121, in copyhardlinktree
|     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
|   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
line 411, in check_output
|     return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
|   File "/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py",
line 512, in run
|     raise CalledProcessError(retcode, process.args,
| subprocess.CalledProcessError: Command 'cd
/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg;
find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C
/home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/bootfs.image_sdimg
-p --no-recursion --files-from - | tar --xattrs --xattrs-include='*'
-xhf - -C /home/marek/projects/kas-test/build/tmp/work/raspberrypi4-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-raspberrypi4-20211115212420-sdimg/tmp.wic.1oe9hwjw/rootfs2'
returned non-zero exit status 2.

After some debugging spent by adding following issue seems to be fixed:
diff --git a/scripts/lib/wic/plugins/imager/direct.py
b/scripts/lib/wic/plugins/imager/direct.py
index 7e1c1c0..d37ecee 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/":
+               or part.mountpoint == "/" or part.mountpoint == "swap":
                 continue
             if part.use_uuid:

Does it make any sense or is it just a hack? I'm not a wic expert at all.

Thanks and BR,

marek

