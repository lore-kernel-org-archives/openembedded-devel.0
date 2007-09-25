Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1Ia45W-0001ii-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2007 08:40:06 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1867124fks
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 23:35:43 -0700 (PDT)
Received: by 10.82.111.8 with SMTP id j8mr10574313buc.1190702142825;
	Mon, 24 Sep 2007 23:35:42 -0700 (PDT)
Received: by 10.82.119.6 with HTTP; Mon, 24 Sep 2007 23:35:42 -0700 (PDT)
Message-ID: <74d0deb30709242335g61947682m50a94dc5ca71c913@mail.gmail.com>
Date: Tue, 25 Sep 2007 08:35:42 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1IZwyx-0004wi-Cq@linuxtogo.org>
MIME-Version: 1.0
References: <E1IZwyx-0004wi-Cq@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev base-files: PocketPC machines: stop using random / mounts in fstab.
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
X-List-Received-Date: Tue, 25 Sep 2007 06:40:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/25/07, pfalcon commit <openembedded-commits@lists.openembedded.org> wrote:
> base-files: PocketPC machines: stop using random / mounts in fstab.
> * Instead, use rootfs mount, like most other devices do, which corresponds
> to the fact that such machines can be booted from a lots of sources.
>
> Author: pfalcon@openembedded.org
> Branch: org.openembedded.dev
> Revision: 9c8e8974a8d9ff7a8529f9274fe3f5f9a5dce475
> ViewMTN: http://monotone.openembedded.org/revision/info/9c8e8974a8d9ff7a8529f9274fe3f5f9a5dce475
> Files:
> 1
> packages/base-files/base-files/h2200/fstab
> packages/base-files/base-files/h3600/fstab
> packages/base-files/base-files/h3900/fstab
> packages/base-files/base-files/h5000/fstab
> packages/base-files/base-files/hx4700/fstab
> packages/base-files/base-files/jornada56x/fstab
> packages/base-files/base-files_3.0.14.bb
> Diffs:
>
> #
> # mt diff -r7c0d27ba90155e9d77912e44a4ad92b67c466954 -r9c8e8974a8d9ff7a8529f9274fe3f5f9a5dce475
> #
> #
> #
> # patch "packages/base-files/base-files/h2200/fstab"
> #  from [fd64d73f1f4c2fefc1082818a96788359f272700]
> #    to [baeeee1f897d8e94c694f72dbce5b501aa07415d]
> #
> # patch "packages/base-files/base-files/h3600/fstab"
> #  from [9dd86648269140db4acc837a298902ade4387ba4]
> #    to [2c0e0fdc2e39743d81e2ea432fa275e3f7da010a]
> #
> # patch "packages/base-files/base-files/h3900/fstab"
> #  from [336b2c1a2f3e70eec61c6c05c11fb80ac6369f8f]
> #    to [2c0e0fdc2e39743d81e2ea432fa275e3f7da010a]
> #
> # patch "packages/base-files/base-files/h5000/fstab"
> #  from [78c5e7cd17ce8853e38539b1e9dc52acea8cd190]
> #    to [c3c5ede38424945a5d0fa9ce2914f5fe99aedf49]
> #
> # patch "packages/base-files/base-files/hx4700/fstab"
> #  from [8913bf7229f7c689c52fe0ba7ebd9fb3aabd7c73]
> #    to [c03b2054bfd3ebc1f2b69c7387c4be0c1c38205f]
> #
> # patch "packages/base-files/base-files/jornada56x/fstab"
> #  from [6c7dc7d29fb38764d948924199a3d6bbdb05f057]
> #    to [608efd753e7773e00429286e63ae4b6265eb6210]
> #
> # patch "packages/base-files/base-files_3.0.14.bb"
> #  from [26083a7751f60fc116a9d07b00b6fa20ed63f4fc]
> #    to [0aedad643085a6d935deec6445e4e0926c4d9bf0]
> #
> ============================================================
> --- packages/base-files/base-files/h2200/fstab  fd64d73f1f4c2fefc1082818a96788359f272700
> +++ packages/base-files/base-files/h2200/fstab  baeeee1f897d8e94c694f72dbce5b501aa07415d
> @@ -1,4 +1,4 @@
> -/dev/mtdblock3 /               jffs2   defaults        1  1
> +rootfs         /               auto    defaults        1  1
>  proc            /proc          proc    defaults        0  0
>  sys             /sys           sysfs   defaults        0  0
>  tmpfs          /var/volatile   tmpfs   mode=0755       0  0
> ============================================================
> --- packages/base-files/base-files/h3600/fstab  9dd86648269140db4acc837a298902ade4387ba4
> +++ packages/base-files/base-files/h3600/fstab  2c0e0fdc2e39743d81e2ea432fa275e3f7da010a
> @@ -1,4 +1,4 @@
> -/dev/mtdblock4 /       jffs2   defaults        1  1
> +rootfs         /               auto    defaults        1  1
>  proc            /proc   proc    defaults        0  0
>  /dev/hda1      /media/cf       auto    defaults,noauto,noatime,user,exec,suid  0  0
>  /dev/mmc/part1 /media/card     auto    defaults,noauto,noatime,user,exec,suid  0  0
> ============================================================
> --- packages/base-files/base-files/h3900/fstab  336b2c1a2f3e70eec61c6c05c11fb80ac6369f8f
> +++ packages/base-files/base-files/h3900/fstab  2c0e0fdc2e39743d81e2ea432fa275e3f7da010a
> @@ -1,6 +1,4 @@
> -/dev/mtdblock/1        /       jffs2   defaults        1  1
> -#breaks h51xx
> -#/dev/mtdblock/2 /home   jffs2   defaults        1  1
> +rootfs         /               auto    defaults        1  1
>  proc            /proc   proc    defaults        0  0
>  /dev/hda1      /media/cf       auto    defaults,noauto,noatime,user,exec,suid  0  0
>  /dev/mmc/part1 /media/card     auto    defaults,noauto,noatime,user,exec,suid  0  0
> ============================================================
> --- packages/base-files/base-files/h5000/fstab  78c5e7cd17ce8853e38539b1e9dc52acea8cd190
> +++ packages/base-files/base-files/h5000/fstab  c3c5ede38424945a5d0fa9ce2914f5fe99aedf49
> @@ -1,4 +1,4 @@
> -/dev/mtdblock1 /       jffs2   defaults        1  1
> +rootfs         /       auto    defaults        1  1
>  #breaks h51xx
>  /dev/mtdblock2 /home   jffs2   defaults        1  1
>  proc            /proc   proc    defaults        0  0
> ============================================================
> --- packages/base-files/base-files/hx4700/fstab 8913bf7229f7c689c52fe0ba7ebd9fb3aabd7c73
> +++ packages/base-files/base-files/hx4700/fstab c03b2054bfd3ebc1f2b69c7387c4be0c1c38205f
> @@ -1,4 +1,4 @@
> -/dev/mtdblock2         /               jffs2   defaults                1  1
> +rootfs         /               auto    defaults                1  1
>  /dev/mtdblock3         /home   jffs2   defaults        1  1

Any idea what to do about this one? Mounting /dev/mtdblock3 on /home
should only be done if there isn't wince on flash anymore.

regards
Philipp


