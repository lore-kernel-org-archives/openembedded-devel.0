Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B44106F310
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:15:39 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v2] image_types_sparse: switch ext* conversion to ext2simg_android
To: openembedded-devel@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: IN (1.7.105.116)
X-Originating-Platform: Windows Edge 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 02:15:30 -0700
References: <20260323091500.1196198-1-git-patches@bmwtechworks.in> <1c0a5fcf-f673-47ba-a989-adcf5691fdbc@gmail.com> <534956.1774332632649907279@lists.openembedded.org> <561924.1774347640737667744@lists.openembedded.org>
In-Reply-To: <561924.1774347640737667744@lists.openembedded.org>
Message-ID: <17335.1774516530230049372@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fqvMfR005bHbLqqSwcS3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125641

--fqvMfR005bHbLqqSwcS3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy / Maintainers / Members,

I tried getting the android-tools in meta-oe and was able to get complete f=
unctionality tweaked accordingly
1) Should i send an RFC to move android-tools out from dynamic-layer to met=
a-oe seprately now?
2) I did below quick check locally :
a) Checked by running the native-binary on host
b) Also checked if selinux is linked to these binary using LDD , below are =
the log
- Is there any other check you want me to do before sharing the patch (or a=
ndroid-tools RFC as per suggestion )

If upstream accepts RFC to move android-tools from dynamic to meta-oe/recip=
es-devtool , i can rework the e2fsprogfs using PACKAGECONFIG
So effectively we will have:
meta-oe/recipes-devtools/e2fsprogs-ext4sparse/
meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
meta-oe/classes/image_types_sparse.bbclass

Please feel
Thanks,
Ashish

Summary :-

* Able to compile the higher version of / *android-tools-native/29.0.6.r14*=
 **=C2=A0without selinux dependency
* Cross checked using ldd is selinux dependency in final binary

Logs :-

~/upstream-yocto/build/tmp/work/x86_64-linux/ *android-tools-native/29.0.6.=
r14/* image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-=
tools-native/29.0.6.r14/recipe-sysroot-native/usr/bin : ls
*adb =C2=A0fastboot =C2=A0img2simg =C2=A0simg2img*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *./fastboot --version*
*fastboot version -debian*
Installed as /home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/androi=
d-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/x=
86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/bin/f=
astboot
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *./img2simg --version*
*Usage: img2simg <raw_image_file> <sparse_image_file> [<block_size>]*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *./simg2img --version*
*Usage: simg2img <sparse_image_files> <raw_image_file>*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-to [=
0/1728] ve/29.0.6.r14/recipe-sysroot-native/usr/bin : *./adb --version*
*./adb: error while loading shared libraries: libbase.so.0: cannot open sha=
red object file: No such file or directory*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : ls
adb =C2=A0fastboot =C2=A0img2simg =C2=A0simg2img
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *ldd adb | grep selinux=
*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *ldd fastboot | grep se=
linux*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *ldd img2simg | grep se=
linux*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin : *ldd simg2img | grep se=
linux*
~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tool=
s-native/29.0.6.r14/recipe-sysroot-native/usr/bin :

--fqvMfR005bHbLqqSwcS3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Gyorgy / Maintainers / Members,&nbsp;</div>
<div>&nbsp;</div>
<div>I tried getting the android-tools in meta-oe and was able to get compl=
ete functionality tweaked accordingly&nbsp;</div>
<div>1) Should i send an RFC to move android-tools out from dynamic-layer t=
o meta-oe seprately now?<br />2) I did below quick check locally :</div>
<div>&nbsp; &nbsp; a) Checked by running the native-binary on host&nbsp;</d=
iv>
<div>&nbsp; &nbsp; b) Also checked if selinux is linked to these binary usi=
ng LDD , below are the log<br />&nbsp; &nbsp; - Is there any other check yo=
u want me to do before sharing the patch (or android-tools RFC as per sugge=
stion )&nbsp;<br /><br />If upstream accepts RFC to move android-tools from=
 dynamic to meta-oe/recipes-devtool , i can rework the e2fsprogfs using PAC=
KAGECONFIG&nbsp;<br />So effectively we will have:<br />&nbsp; &nbsp; &nbsp=
; &nbsp; meta-oe/recipes-devtools/e2fsprogs-ext4sparse/<br />&nbsp; &nbsp; =
&nbsp; &nbsp; meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r=
14.bb<br />&nbsp; &nbsp; &nbsp; &nbsp; meta-oe/classes/image_types_sparse.b=
bclass<br /><br />Please feel&nbsp;</div>
<div>Thanks,<br />Ashish&nbsp;<br /><br /><br /></div>
<div><br />
<p style=3D"margin: 0px; padding: 0px; color: #172b4d; font-family: -apple-=
system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'Fira Sans'=
, 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14px; font-style: =
normal; font-variant-ligatures: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: normal; background-color: #ffffff; text-decora=
tion-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial;"><ins>Summary</ins>:-</p>
<ul class=3D"alternate" style=3D"margin: 10px 0px 0px; color: #172b4d; font=
-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubu=
ntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: l=
eft; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; white-space: normal; background-color: #fff=
fff; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;" type=3D"square">
<li>Able to compile the higher version of /<strong>android-tools-native/29.=
0.6.r14</strong>&nbsp;**&nbsp;without selinux dependency</li>
<li>Cross checked using ldd is selinux dependency in final binary</li>
</ul>
<p style=3D"margin: 10px 0px 0px; padding: 0px; color: #172b4d; font-family=
: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'F=
ira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;"><ins>Logs</ins>:-</p>
<p style=3D"margin: 10px 0px 0px; padding: 0px; color: #172b4d; font-family=
: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, 'F=
ira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;">~/upstream-yocto/build/tmp/work/x86_64-linux/<stron=
g>android-tools-native/29.0.6.r14/</strong>image/home/ashish/upstream-yocto=
/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot=
-native/usr/bin : ls<br /><strong>adb &nbsp;fastboot &nbsp;img2simg &nbsp;s=
img2img</strong><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-linux/an=
droid-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/wo=
rk/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/b=
in :<span>&nbsp;</span><strong>./fastboot --version</strong><br /><strong>f=
astboot version -debian</strong><br />Installed as /home/ashish/upstream-yo=
cto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/image/home/=
ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0=
.6.r14/recipe-sysroot-native/usr/bin/fastboot<br />&nbsp;~/upstream-yocto/b=
uild/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/image/home/ashis=
h/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r1=
4/recipe-sysroot-native/usr/bin :<span>&nbsp;</span><strong>./img2simg --ve=
rsion</strong><br /><strong>Usage: img2simg &lt;raw_image_file&gt; &lt;spar=
se_image_file&gt;<span>&nbsp;</span><span class=3D"error">[&lt;block_size&g=
t;]</span></strong><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-linux=
/android-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp=
/work/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/us=
r/bin :<span>&nbsp;</span><strong>./simg2img --version</strong><br /><stron=
g>Usage: simg2img &lt;sparse_image_files&gt; &lt;raw_image_file&gt;</strong=
><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-nat=
ive/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux=
/android-to<span class=3D"error">[0/1728]</span>ve/29.0.6.r14/recipe-sysroo=
t-native/usr/bin :<span>&nbsp;</span><ins><strong>./adb --version</strong><=
/ins><br /><ins><strong>./adb: error while loading shared libraries: libbas=
e.so.0: cannot open shared object file: No such file or directory</strong><=
/ins><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools=
-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-l=
inux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/bin : ls<br =
/>adb &nbsp;fastboot &nbsp;img2simg &nbsp;simg2img<br />&nbsp;~/upstream-yo=
cto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/image/home/=
ashish/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0=
.6.r14/recipe-sysroot-native/usr/bin :<span>&nbsp;</span><strong>ldd adb | =
grep selinux</strong><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-lin=
ux/android-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/t=
mp/work/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/=
usr/bin :<span>&nbsp;</span><strong>ldd fastboot | grep selinux</strong><br=
 />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/=
29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/and=
roid-tools-native/29.0.6.r14/recipe-sysroot-native/usr/bin :<span>&nbsp;</s=
pan><strong>ldd img2simg | grep selinux</strong><br />&nbsp;~/upstream-yoct=
o/build/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/image/home/as=
hish/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-native/29.0.6=
.r14/recipe-sysroot-native/usr/bin :<span>&nbsp;</span><strong>ldd simg2img=
 | grep selinux</strong><br />&nbsp;~/upstream-yocto/build/tmp/work/x86_64-=
linux/android-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/buil=
d/tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-nati=
ve/usr/bin :</p>
</div>

--fqvMfR005bHbLqqSwcS3--

