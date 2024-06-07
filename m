Return-Path: <NewTimothyL@JohnDeere.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A08FC27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 20:52:13 +0000 (UTC)
Subject: devtool failing to build-image #error #oe
To: openembedded-devel@lists.openembedded.org
From: "Tim New" <NewTimothyL@JohnDeere.com>
X-Originating-Location: US (136.226.113.74)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 07 Jun 2024 13:52:10 -0700
Message-ID: <ZdH4.1717792934247982167.3fD4@lists.openembedded.org>
X-Old-Date: Fri, 07 Jun 2024 13:51:09 -0700
Content-Type: multipart/alternative; boundary="zCA3AmZQNO70W039bUaa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 20:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110770
Message-ID: <20240607205210.vSfR59iMdCGZFJ6kUY1HWptVLn6K1Dl_KUxowwulf2U@z>

--zCA3AmZQNO70W039bUaa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I posted this on the NXP forum but maybe this is more appropriate https://c=
ommunity.nxp.com/t5/i-MX-Processors/devtool-build-image-does-not-work/m-p/1=
883127/highlight/false#M224670

( https://community.nxp.com/t5/i-MX-Processors/devtool-build-image-does-not=
-work/m-p/1883127/highlight/false#M224670 )

When I try to build `pokyuser@92da2e39ecdd:$ *devtool build-image* `

I get the following failures:

Parsing of 5594 .bb files complete (0 cached, 5594 parsed). 8682 targets, 1=
176 skipped, 0 masked, 0 errors.
ERROR: No recipes in default available for:
/layers/meta-freescale/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bbap=
pend
/recipes-bsp/imx-atf/imx-atf_%.bbappend
/recipes-bsp/imx-mkimage/imx-boot_1.0.bbappend
/recipes-bsp/imx-mkimage/imx-mkimage_git.bbappend
/recipes-bsp/scfw-deere-display/imx-sc-firmware_%.bbappend
No recipes in ngpd2 available for:
/layers/meta-freescale/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bbap=
pend
/imx-atf_%.bbappend
/imx-boot_1.0.bbappend
/imx-mkimage_git.bbappend
/imx-sc-firmware_%.bbappend

I know why those errors occur, when i run the sdk install .sh script not al=
l the directories in the mete-freescale layer are copied. I'm not sure why.

This is what the meta-freescale layer has in my normal build. You can see t=
he recipes-downgrade directory. The missing .bb recipe is included there.

tn70742@wdx24n1rn3:~/$ ls -ll
total 140
drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 classes
drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 conf
-rw-rw-r-- 1 tn70742 tn70742 1035 Jun 5 12:17 COPYING.MIT
drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 custom-licenses
drwxrwxr-x 13 tn70742 tn70742 4096 Jun 5 12:17 dynamic-layers
-rw-r--r-- 8 tn70742 tn70742 43342 Mar 9 2018 EULA
-rw-rw-r-- 1 tn70742 tn70742 495 Jun 5 12:17 LICENSE
-rw-rw-r-- 1 tn70742 tn70742 1006 Jun 5 12:17 README
drwxrwxr-x 34 tn70742 tn70742 4096 Jun 5 12:17 recipes-bsp
drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-connectivity
drwxrwxr-x 5 tn70742 tn70742 4096 Jun 5 12:17 recipes-core
drwxrwxr-x 8 tn70742 tn70742 4096 Jun 5 12:17 recipes-devtools
*drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-downgrade*
drwxrwxr-x 6 tn70742 tn70742 4096 Jun 5 12:17 recipes-dpaa
drwxrwxr-x 8 tn70742 tn70742 4096 Jun 5 12:17 recipes-dpaa2
drwxrwxr-x 17 tn70742 tn70742 4096 Jun 5 12:17 recipes-extended
drwxrwxr-x 4 tn70742 tn70742 4096 Jun 5 12:17 recipes-fsl
drwxrwxr-x 22 tn70742 tn70742 4096 Jun 5 12:17 recipes-graphics
drwxrwxr-x 7 tn70742 tn70742 4096 Jun 5 12:17 recipes-kernel
drwxrwxr-x 14 tn70742 tn70742 4096 Jun 5 12:17 recipes-multimedia
drwxrwxr-x 4 tn70742 tn70742 4096 Jun 5 12:17 recipes-security
drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-support
drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 SCR
drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 scripts
drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 wic

When I look at the equivalent directory in the sdk environement, there is n=
o recipes-downgrade directory.

pokyuser@92da2e39ecdd:~$ ls -ll
total 88
drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 classes
drwxrwxr-x 3 pokyuser pokyuser 4096 Jun 6 21:19 conf
-rw-rw-r-- 1 pokyuser pokyuser 1035 Jun 6 21:19 COPYING.MIT
drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 custom-licenses
drwxrwxr-x 13 pokyuser pokyuser 4096 Jun 6 21:19 dynamic-layers
-rw-rw-r-- 1 pokyuser pokyuser 495 Jun 6 21:19 LICENSE
-rw-rw-r-- 1 pokyuser pokyuser 1006 Jun 6 21:19 README
drwxrwxr-x 3 pokyuser pokyuser 4096 Jun 6 21:19 recipes-connectivity
drwxrwxr-x 5 pokyuser pokyuser 4096 Jun 6 21:19 recipes-core
drwxrwxr-x 8 pokyuser pokyuser 4096 Jun 6 21:19 recipes-devtools
drwxrwxr-x 6 pokyuser pokyuser 4096 Jun 6 21:19 recipes-dpaa
drwxrwxr-x 8 pokyuser pokyuser 4096 Jun 6 21:19 recipes-dpaa2
drwxrwxr-x 17 pokyuser pokyuser 4096 Jun 6 21:19 recipes-extended
drwxrwxr-x 4 pokyuser pokyuser 4096 Jun 6 21:19 recipes-fsl
drwxrwxr-x 22 pokyuser pokyuser 4096 Jun 6 21:19 recipes-graphics
drwxrwxr-x 7 pokyuser pokyuser 4096 Jun 6 21:19 recipes-kernel
drwxrwxr-x 14 pokyuser pokyuser 4096 Jun 6 21:19 recipes-multimedia
drwxrwxr-x 4 pokyuser pokyuser 4096 Jun 6 21:19 recipes-security
drwxrwxr-x 3 pokyuser pokyuser 4096 Jun 6 21:19 recipes-support
drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 SCR
drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 scripts
drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 wic

I'm not sure why the r *ecipes-downgrade* directory is not being copied int=
o the sdk environment.

--zCA3AmZQNO70W039bUaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I posted this on the NXP forum but maybe this is more appropriate&nbsp; <a =
href=3D"https://community.nxp.com/t5/i-MX-Processors/devtool-build-image-do=
es-not-work/m-p/1883127/highlight/false#M224670" target=3D"_blank" rel=3D"n=
ofollow noopener">https://community.nxp.com/t5/i-MX-Processors/devtool-buil=
d-image-does-not-work/m-p/1883127/highlight/false#M224670<br /><br /></a><b=
r /><br /><br />
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">When I try to build `pokyuser@92da2e39ecdd:$<span>&nbsp;</span><=
strong>devtool build-image</strong>`</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">I get the following failures:&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;"><span style=3D"font-size: xx-small;">Parsing of 5594 .bb files c=
omplete (0 cached, 5594 parsed). 8682 targets, 1176 skipped, 0 masked, 0 er=
rors.</span><br /><span style=3D"font-size: xx-small;">ERROR: No recipes in=
 default available for:</span><br /><span style=3D"color: #ff0000; font-siz=
e: xx-small;">/layers/meta-freescale/recipes-graphics/vulkan/vulkan-loader_=
1.2.182.0.bbappend</span><br /><span style=3D"color: #ff0000; font-size: xx=
-small;">/recipes-bsp/imx-atf/imx-atf_%.bbappend</span><br /><span style=3D=
"color: #ff0000; font-size: xx-small;">/recipes-bsp/imx-mkimage/imx-boot_1.=
0.bbappend</span><br /><span style=3D"color: #ff0000; font-size: xx-small;"=
>/recipes-bsp/imx-mkimage/imx-mkimage_git.bbappend</span><br /><span style=
=3D"color: #ff0000; font-size: xx-small;">/recipes-bsp/scfw-deere-display/i=
mx-sc-firmware_%.bbappend</span><br /><span style=3D"font-size: xx-small;">=
No recipes in ngpd2 available for:</span><br /><span style=3D"color: #ff000=
0; font-size: xx-small;">/layers/meta-freescale/recipes-graphics/vulkan/vul=
kan-loader_1.2.182.0.bbappend</span><br /><span style=3D"color: #ff0000; fo=
nt-size: xx-small;">/imx-atf_%.bbappend</span><br /><span style=3D"color: #=
ff0000; font-size: xx-small;">/imx-boot_1.0.bbappend</span><br /><span styl=
e=3D"color: #ff0000; font-size: xx-small;">/imx-mkimage_git.bbappend</span>=
<br /><span style=3D"color: #ff0000; font-size: xx-small;">/imx-sc-firmware=
_%.bbappend</span></p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">I know why those errors occur, when i run the sdk install .sh sc=
ript not all the directories in the mete-freescale layer are copied. I'm no=
t sure why.&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">This is what the meta-freescale layer has in my normal build. Yo=
u can see the recipes-downgrade directory. The missing .bb recipe is includ=
ed there.&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;"><span style=3D"font-size: xx-small;">tn70742@wdx24n1rn3:~/$ ls -=
ll</span><br /><span style=3D"font-size: xx-small;">total 140</span><br /><=
span style=3D"font-size: xx-small;">drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5=
 12:17 classes</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x =
3 tn70742 tn70742 4096 Jun 5 12:17 conf</span><br /><span style=3D"font-siz=
e: xx-small;">-rw-rw-r-- 1 tn70742 tn70742 1035 Jun 5 12:17 COPYING.MIT</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 2 tn70742 tn70742 =
4096 Jun 5 12:17 custom-licenses</span><br /><span style=3D"font-size: xx-s=
mall;">drwxrwxr-x 13 tn70742 tn70742 4096 Jun 5 12:17 dynamic-layers</span>=
<br /><span style=3D"font-size: xx-small;">-rw-r--r-- 8 tn70742 tn70742 433=
42 Mar 9 2018 EULA</span><br /><span style=3D"font-size: xx-small;">-rw-rw-=
r-- 1 tn70742 tn70742 495 Jun 5 12:17 LICENSE</span><br /><span style=3D"fo=
nt-size: xx-small;">-rw-rw-r-- 1 tn70742 tn70742 1006 Jun 5 12:17 README</s=
pan><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 34 tn70742 tn7074=
2 4096 Jun 5 12:17 recipes-bsp</span><br /><span style=3D"font-size: xx-sma=
ll;">drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-connectivity</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 5 tn70742 tn70742 =
4096 Jun 5 12:17 recipes-core</span><br /><span style=3D"font-size: xx-smal=
l;">drwxrwxr-x 8 tn70742 tn70742 4096 Jun 5 12:17 recipes-devtools</span><b=
r /><span style=3D"font-size: xx-small;"><strong>drwxrwxr-x 3 tn70742 tn707=
42 4096 Jun 5 12:17 recipes-downgrade</strong></span><br /><span style=3D"f=
ont-size: xx-small;">drwxrwxr-x 6 tn70742 tn70742 4096 Jun 5 12:17 recipes-=
dpaa</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 8 tn70742 =
tn70742 4096 Jun 5 12:17 recipes-dpaa2</span><br /><span style=3D"font-size=
: xx-small;">drwxrwxr-x 17 tn70742 tn70742 4096 Jun 5 12:17 recipes-extende=
d</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 4 tn70742 tn7=
0742 4096 Jun 5 12:17 recipes-fsl</span><br /><span style=3D"font-size: xx-=
small;">drwxrwxr-x 22 tn70742 tn70742 4096 Jun 5 12:17 recipes-graphics</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 7 tn70742 tn70742 =
4096 Jun 5 12:17 recipes-kernel</span><br /><span style=3D"font-size: xx-sm=
all;">drwxrwxr-x 14 tn70742 tn70742 4096 Jun 5 12:17 recipes-multimedia</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 4 tn70742 tn70742 =
4096 Jun 5 12:17 recipes-security</span><br /><span style=3D"font-size: xx-=
small;">drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-support</span=
><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 2 tn70742 tn70742 40=
96 Jun 5 12:17 SCR</span><br /><span style=3D"font-size: xx-small;">drwxrwx=
r-x 2 tn70742 tn70742 4096 Jun 5 12:17 scripts</span><br /><span style=3D"f=
ont-size: xx-small;">drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 wic</spa=
n></p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">When I look at the equivalent directory in the sdk environement,=
 there is no recipes-downgrade directory.&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;"><br /><span style=3D"font-size: xx-small;">pokyuser@92da2e39ecdd=
:~$ ls -ll</span><br /><span style=3D"font-size: xx-small;">total 88</span>=
<br /><span style=3D"font-size: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4=
096 Jun 6 21:19 classes</span><br /><span style=3D"font-size: xx-small;">dr=
wxrwxr-x 3 pokyuser pokyuser 4096 Jun 6 21:19 conf</span><br /><span style=
=3D"font-size: xx-small;">-rw-rw-r-- 1 pokyuser pokyuser 1035 Jun 6 21:19 C=
OPYING.MIT</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 2 po=
kyuser pokyuser 4096 Jun 6 21:19 custom-licenses</span><br /><span style=3D=
"font-size: xx-small;">drwxrwxr-x 13 pokyuser pokyuser 4096 Jun 6 21:19 dyn=
amic-layers</span><br /><span style=3D"font-size: xx-small;">-rw-rw-r-- 1 p=
okyuser pokyuser 495 Jun 6 21:19 LICENSE</span><br /><span style=3D"font-si=
ze: xx-small;">-rw-rw-r-- 1 pokyuser pokyuser 1006 Jun 6 21:19 README</span=
><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 3 pokyuser pokyuser =
4096 Jun 6 21:19 recipes-connectivity</span><br /><span style=3D"font-size:=
 xx-small;">drwxrwxr-x 5 pokyuser pokyuser 4096 Jun 6 21:19 recipes-core</s=
pan><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 8 pokyuser pokyus=
er 4096 Jun 6 21:19 recipes-devtools</span><br /><span style=3D"font-size: =
xx-small;">drwxrwxr-x 6 pokyuser pokyuser 4096 Jun 6 21:19 recipes-dpaa</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 8 pokyuser pokyuse=
r 4096 Jun 6 21:19 recipes-dpaa2</span><br /><span style=3D"font-size: xx-s=
mall;">drwxrwxr-x 17 pokyuser pokyuser 4096 Jun 6 21:19 recipes-extended</s=
pan><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 4 pokyuser pokyus=
er 4096 Jun 6 21:19 recipes-fsl</span><br /><span style=3D"font-size: xx-sm=
all;">drwxrwxr-x 22 pokyuser pokyuser 4096 Jun 6 21:19 recipes-graphics</sp=
an><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 7 pokyuser pokyuse=
r 4096 Jun 6 21:19 recipes-kernel</span><br /><span style=3D"font-size: xx-=
small;">drwxrwxr-x 14 pokyuser pokyuser 4096 Jun 6 21:19 recipes-multimedia=
</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 4 pokyuser pok=
yuser 4096 Jun 6 21:19 recipes-security</span><br /><span style=3D"font-siz=
e: xx-small;">drwxrwxr-x 3 pokyuser pokyuser 4096 Jun 6 21:19 recipes-suppo=
rt</span><br /><span style=3D"font-size: xx-small;">drwxrwxr-x 2 pokyuser p=
okyuser 4096 Jun 6 21:19 SCR</span><br /><span style=3D"font-size: xx-small=
;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 scripts</span><br /><spa=
n style=3D"font-size: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 =
21:19 wic</span></p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">&nbsp;</p>
<p style=3D"color: #333f48; font-family: Arial, sans-serif; font-size: 16px=
; font-style: normal; font-weight: 300; text-align: left; background-color:=
 #ffffff;">I'm not sure why the r<strong>ecipes-downgrade</strong><span>&nb=
sp;</span>directory is not being copied into the sdk environment.&nbsp;</p>

--zCA3AmZQNO70W039bUaa--

