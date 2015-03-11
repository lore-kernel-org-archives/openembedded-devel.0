Return-Path: <ridishonline@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id DCBF07399A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 17:40:05 +0000 (UTC)
Received: by yhai57 with SMTP id i57so5279560yha.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2mcSqagPjzYs9Pglf5hvOu8q1uSmBP8vYvi6wcNtLy0=;
	b=AlEquPob96SAc7vYSRiF6BP/+0uau0gXU9Wf68O0Yh0prgU0IVzXzRdnzaV5AXCABQ
	Rb5Q5Fb8mI3ifNQ7rkNDAMv3OLaaEcOJ/g1V2OqCGppCq4T/XE8Y6MJn55qV3UiEr1f6
	l7j04xB35f39PrGer4I1cX9X4bJBXMYfY+JHiiVtePXplNfsmGyiWDeLk7UrSnz8umDx
	MjtYu2OYr93XAU3mnXQAES65Y7E/wMxNnOAVsR/p0sTx0dcrncLsPPAwQAxh3UhyCzlJ
	jDUjtjCdS/5vCN3cCjanMwj51o5zzbnSW/68iAGvu9Q5/8iFc7NDqYcOIfKknK0X8hgT
	uA9g==
MIME-Version: 1.0
X-Received: by 10.236.208.36 with SMTP id p24mr37875064yho.1.1426095606572;
	Wed, 11 Mar 2015 10:40:06 -0700 (PDT)
Received: by 10.170.166.198 with HTTP; Wed, 11 Mar 2015 10:40:06 -0700 (PDT)
In-Reply-To: <1426089592-16955-1-git-send-email-raj.khem@gmail.com>
References: <1426089592-16955-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 11 Mar 2015 10:40:06 -0700
Message-ID: <CAMHavc+PBUWD3Hkj7hj4nQnxVjSf-AYmrys3hEd626kFVXnpjA@mail.gmail.com>
From: Ridish Rema Aravindan <ridishonline@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH V2] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 17:40:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

Yes this is a welcome change.

Ridish

On Wed, Mar 11, 2015 at 8:59 AM, Khem Raj <raj.khem@gmail.com> wrote:

> - Do not mount /var/volatile to be tmpfs always only when generating
>   readonly rootfs
> - Generate var-volatile.mount unit when using system in readonly-rootfs
>   to mount /var/volatile as tmpfs
> - for sysvinit, mount /var/volatile to be tmpfs if its not already
>   mounted so
> - Use RequiresMountsFor instead of After=, so systemd figures out the
>   needed dependencies for making /var/volatile accessible for journald
>   and not us.
>
> Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/image.bbclass                                             |
> 1 +
>  meta/recipes-core/base-files/base-files/fstab                          |
> 1 -
>  meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh |
> 2 +-
>  meta/recipes-core/systemd/systemd/journald-volatile.conf               |
> 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 89eb5f3..818af86 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -228,6 +228,7 @@ read_only_rootfs_hook () {
>         fi
>
>         if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true",
> "false", d)}; then
> +           sed -e 's#/tmp#/var/volatile#g'
> ${IMAGE_ROOTFS}/lib/systemd/system/tmp.mount >
> ${IMAGE_ROOTFS}/lib/systemd/system/var-volatile.mount
>             # Update user database files so that services don't fail for a
> read-only systemd system
>             for conffile in
> ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf
> ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>                 [ -e $conffile ] || continue
> diff --git a/meta/recipes-core/base-files/base-files/fstab
> b/meta/recipes-core/base-files/base-files/fstab
> index 739b844..56b14d7 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -5,7 +5,6 @@ proc                 /proc                proc
>  defaults              0  0
>  devpts               /dev/pts             devpts     mode=0620,gid=5
>  0  0
>  usbdevfs             /proc/bus/usb        usbdevfs   noauto
>   0  0
>  tmpfs                /run                 tmpfs
> mode=0755,nodev,nosuid,strictatime 0  0
> -tmpfs                /var/volatile        tmpfs      defaults
>   0  0
>
>  # uncomment this if your device has a SD/MMC/Transflash slot
>  #/dev/mmcblk0p1       /media/card          auto
>  defaults,sync,noauto  0  0
> diff --git
> a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> index 1a0328d..3ff39f4 100644
> ---
> a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> +++
> b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> @@ -29,7 +29,7 @@ is_on_read_only_partition () {
>
>  if [ "$1" = "start" ] ; then
>         if [ `is_on_read_only_partition /var/lib` = "yes" ]; then
> -               grep -q "tmpfs /var/volatile" /proc/mounts || mount
> /var/volatile
> +               grep -q "tmpfs /var/volatile" /proc/mounts || mount -t
> tmpfs -o strictatime tmpfs /var/volatile
>                 mkdir -p /var/volatile/lib
>                 cp -a /var/lib/* /var/volatile/lib
>                 mount --bind /var/volatile/lib /var/lib
> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf
> b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> index b11e160..9356a4e 100644
> --- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> @@ -3,4 +3,4 @@
>  # /var/log -> /var/volatile/log. And if the journal starts before the
> mount
>  # happens, the journal will appear empty until restarted.
>  [Unit]
> -After=var-volatile.mount
> +RequiresMountsFor=/var/volatile
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

