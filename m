Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B95D6EC15
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 21:46:27 +0000 (UTC)
Subject: Multilib in yocto: I am enabling Multilib ,lib32-gcc, lib32-gfortran support in x86 #error
To: openembedded-devel@lists.openembedded.org
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
X-Originating-Location: Plano, Texas, US (161.69.80.205)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 13:04:07 -0800
Message-ID: <2m7A.1732914247129958345.Bk9r@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mkSpyzwxFM9F1TJz9FJ7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 21:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114124

--mkSpyzwxFM9F1TJz9FJ7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have an x86-based board, and I am trying to enable lib32-gcc, lib32-gfort=
ran, and multilib support.
I followed the guidelines provided in the multilib example configuration.
reference:
*https://git.openembedded.org/openembedded-core/tree/meta-skeleton/conf/mul=
tilib-example.conf?h=3Dscarthgap*

In my *local.conf* , I added the following configuration:

*MACHINE =3D "Creter"*
*require conf/multilib.conf*
*MULTILIBS =3D "multilib:lib32"*
*DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"*
*IMAGE_INSTALL:append =3D " lib32-gcc lib32-gfortran"*

However, I am encountering the following error during the build process:
*Build error:*
ERROR: glibc-2.39+git-r0 do_package: ExecutionError('/media/nvme1/umesha/ka=
mal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/wo=
rk/zen2-oe-linux/glibc/2.39+git/temp/run.stash_locale_package_cleanup.41207=
57', 1, None, None)
ERROR: Logfile of failure stored in: /media/nvme1/umesha/kamal-scarthgap/po=
ky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux=
/glibc/2.39+git/temp/log.do_package.4120757
| rmdir: failed to remove '/media/nvme1/umesha/kamal-scarthgap/poky-amd-sca=
rthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc/2.3=
9+git/package/usr/lib': Directory not empty
| WARNING: exit code 1 from a shell command.

*Additionally, I noticed that the lib32 folder is not being generated under=
 the root filesystem:*

umesha@yocto-server-2:/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthga=
p/build-weston-crater-scarthgap/tmp-glibc/work/crater-oe-linux/xen-image/1.=
0/rootfs/usr$ ls
*bin =C2=A0games =C2=A0include =C2=A0lib =C2=A0libexec =C2=A0sbin =C2=A0sha=
re =C2=A0src =C2=A0x86_64-oe-linux=C2=A0 =C2=A0=3D> here lib32 should show*
Do I need to make any specific changes on the kernel side to enable multili=
b support? If so, could you please guide me on what needs to be configured?
Thank you in advance for your assistance!

--mkSpyzwxFM9F1TJz9FJ7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>I have an x86-based board, and I am trying to enable lib32-gcc, lib32-=
gfortran, and multilib support.</div>
<div>I followed the guidelines provided in the multilib example configurati=
on.</div>
<div>reference:<br /><strong>https://git.openembedded.org/openembedded-core=
/tree/meta-skeleton/conf/multilib-example.conf?h=3Dscarthgap</strong></div>
<div><br />In my<strong> local.conf</strong>, I added the following configu=
ration:</div>
<div><br /><strong>MACHINE =3D "Creter"</strong><br /><strong>require conf/=
multilib.conf</strong><br /><strong>MULTILIBS =3D "multilib:lib32"</strong>=
<br /><strong>DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"</strong><br />=
<strong>IMAGE_INSTALL:append =3D " lib32-gcc lib32-gfortran"</strong></div>
<div><br />However, I am encountering the following error during the build =
process:</div>
<div><strong>Build error:</strong></div>
<div>ERROR: glibc-2.39+git-r0 do_package: ExecutionError('/media/nvme1/umes=
ha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-gli=
bc/work/zen2-oe-linux/glibc/2.39+git/temp/run.stash_locale_package_cleanup.=
4120757', 1, None, None)<br />ERROR: Logfile of failure stored in: /media/n=
vme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthga=
p/tmp-glibc/work/zen2-oe-linux/glibc/2.39+git/temp/log.do_package.4120757<b=
r />| rmdir: failed to remove '/media/nvme1/umesha/kamal-scarthgap/poky-amd=
-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc=
/2.39+git/package/usr/lib': Directory not empty<br />| WARNING: exit code 1=
 from a shell command.</div>
<div>&nbsp;</div>
<div><br /><strong>Additionally, I noticed that the lib32 folder is not bei=
ng generated under the root filesystem:</strong></div>
<div>&nbsp;</div>
<div>umesha@yocto-server-2:/media/nvme1/umesha/kamal-scarthgap/poky-amd-sca=
rthgap/build-weston-crater-scarthgap/tmp-glibc/work/crater-oe-linux/xen-ima=
ge/1.0/rootfs/usr$ ls<br /><strong>bin &nbsp;games &nbsp;include &nbsp;lib =
&nbsp;libexec &nbsp;sbin &nbsp;share &nbsp;src &nbsp;x86_64-oe-linux&nbsp; =
&nbsp;=3D&gt; here lib32 should show</strong><br />Do I need to make any sp=
ecific changes on the kernel side to enable multilib support? If so, could =
you please guide me on what needs to be configured?</div>
<div>Thank you in advance for your assistance!</div>
</div>

--mkSpyzwxFM9F1TJz9FJ7--

