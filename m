Return-Path: <NewTimothyL@JohnDeere.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC68C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 20:42:23 +0000 (UTC)
Subject: devtool failing to build-image #error #oe
To: openembedded-devel@lists.openembedded.org
From: "Tim New" <NewTimothyL@JohnDeere.com>
X-Originating-Location: US (136.226.113.74)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 07 Jun 2024 13:42:14 -0700
Message-ID: <ZdH4.1717792934247982167.3fD4@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zCA3AmZQNO70W039bUaa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 20:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110770

--zCA3AmZQNO70W039bUaa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I posted this on the NXP forum but maybe this is more appropriate https://c=
ommunity.nxp.com/t5/i-MX-Processors/devtool-build-image-does-not-work/m-p/1=
883127/highlight/false#M224670

( https://community.nxp.com/t5/i-MX-Processors/devtool-build-image-does-not=
-work/m-p/1883127/highlight/false#M224670 )

When I try to build `pokyuser@92da2e39ecdd:~/oem-deere-display_sdk$ *devtoo=
l build-image* `

I get the following failures:

Parsing of 5594 .bb files complete (0 cached, 5594 parsed). 8682 targets, 1=
176 skipped, 0 masked, 0 errors.
ERROR: No recipes in default available for:
/home/pokyuser/oem-deere-display_sdk/layers/meta-freescale/recipes-graphics=
/vulkan/vulkan-loader_1.2.182.0.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-atf/imx-atf_%.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-mkimage/imx-boot_1.0.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-mkimage/imx-mkimage_git.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/scfw-deere-display/imx-sc-firmware_%.bbappend
No recipes in ngpd2 available for:
/home/pokyuser/oem-deere-display_sdk/layers/meta-freescale/recipes-graphics=
/vulkan/vulkan-loader_1.2.182.0.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-atf/imx-atf_%.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-mkimage/imx-boot_1.0.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/imx-mkimage/imx-mkimage_git.bbappend
/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-displ=
ay-oem/recipes-bsp/scfw-deere-display/imx-sc-firmware_%.bbappend

I know why those errors occur, when i run the sdk install .sh script not al=
l the directories in the mete-freescale layer are copied. I'm not sure why.

This is what the meta-freescale layer has in my normal build. You can see t=
he recipes-downgrade directory. The missing .bb recipe is included there.

tn70742@wdx24n1rn3:~/Projects/OEMBSP/oem-ref-BSP/sources/meta-freescale$ ls=
 -ll
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

pokyuser@92da2e39ecdd:~/oem-deere-display_sdk/layers/meta-freescale$ ls -ll
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
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I posted this on the NXP forum but maybe this is more appropriate&nbsp; <a =
href=3D"https://community.nxp.com/t5/i-MX-Processors/devtool-build-image-do=
es-not-work/m-p/1883127/highlight/false#M224670" target=3D"_blank" rel=3D"n=
oopener">https://community.nxp.com/t5/i-MX-Processors/devtool-build-image-d=
oes-not-work/m-p/1883127/highlight/false#M224670<br /><br /></a><br /><br /=
><br />
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
When I try to build `pokyuser@92da2e39ecdd:~/oem-deere-display_sdk$<span>&n=
bsp;</span><strong style=3D"box-sizing: border-box; font-weight: bold;">dev=
tool build-image</strong>`</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
I get the following failures:&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
<span style=3D"box-sizing: border-box; font-size: xx-small;">Parsing of 559=
4 .bb files complete (0 cached, 5594 parsed). 8682 targets, 1176 skipped, 0=
 masked, 0 errors.</span><br style=3D"box-sizing: border-box;" /><span styl=
e=3D"box-sizing: border-box; font-size: xx-small;">ERROR: No recipes in def=
ault available for:</span><br style=3D"box-sizing: border-box;" /><span sty=
le=3D"box-sizing: border-box; color: #ff0000; font-size: xx-small;">/home/p=
okyuser/oem-deere-display_sdk/layers/meta-freescale/recipes-graphics/vulkan=
/vulkan-loader_1.2.182.0.bbappend</span><br style=3D"box-sizing: border-box=
;" /><span style=3D"box-sizing: border-box; color: #ff0000; font-size: xx-s=
mall;">/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deer=
e-display-oem/recipes-bsp/imx-atf/imx-atf_%.bbappend</span><br style=3D"box=
-sizing: border-box;" /><span style=3D"box-sizing: border-box; color: #ff00=
00; font-size: xx-small;">/home/pokyuser/oem-deere-display_sdk/layers/meta-=
deere-oem/meta-deere-display-oem/recipes-bsp/imx-mkimage/imx-boot_1.0.bbapp=
end</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing=
: border-box; color: #ff0000; font-size: xx-small;">/home/pokyuser/oem-deer=
e-display_sdk/layers/meta-deere-oem/meta-deere-display-oem/recipes-bsp/imx-=
mkimage/imx-mkimage_git.bbappend</span><br style=3D"box-sizing: border-box;=
" /><span style=3D"box-sizing: border-box; color: #ff0000; font-size: xx-sm=
all;">/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere=
-display-oem/recipes-bsp/scfw-deere-display/imx-sc-firmware_%.bbappend</spa=
n><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border=
-box; font-size: xx-small;">No recipes in ngpd2 available for:</span><br st=
yle=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; co=
lor: #ff0000; font-size: xx-small;">/home/pokyuser/oem-deere-display_sdk/la=
yers/meta-freescale/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bbappen=
d</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: =
border-box; color: #ff0000; font-size: xx-small;">/home/pokyuser/oem-deere-=
display_sdk/layers/meta-deere-oem/meta-deere-display-oem/recipes-bsp/imx-at=
f/imx-atf_%.bbappend</span><br style=3D"box-sizing: border-box;" /><span st=
yle=3D"box-sizing: border-box; color: #ff0000; font-size: xx-small;">/home/=
pokyuser/oem-deere-display_sdk/layers/meta-deere-oem/meta-deere-display-oem=
/recipes-bsp/imx-mkimage/imx-boot_1.0.bbappend</span><br style=3D"box-sizin=
g: border-box;" /><span style=3D"box-sizing: border-box; color: #ff0000; fo=
nt-size: xx-small;">/home/pokyuser/oem-deere-display_sdk/layers/meta-deere-=
oem/meta-deere-display-oem/recipes-bsp/imx-mkimage/imx-mkimage_git.bbappend=
</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: b=
order-box; color: #ff0000; font-size: xx-small;">/home/pokyuser/oem-deere-d=
isplay_sdk/layers/meta-deere-oem/meta-deere-display-oem/recipes-bsp/scfw-de=
ere-display/imx-sc-firmware_%.bbappend</span></p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
I know why those errors occur, when i run the sdk install .sh script not al=
l the directories in the mete-freescale layer are copied. I'm not sure why.=
&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
This is what the meta-freescale layer has in my normal build. You can see t=
he recipes-downgrade directory. The missing .bb recipe is included there.&n=
bsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
<span style=3D"box-sizing: border-box; font-size: xx-small;">tn70742@wdx24n=
1rn3:~/Projects/OEMBSP/oem-ref-BSP/sources/meta-freescale$ ls -ll</span><br=
 style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box;=
 font-size: xx-small;">total 140</span><br style=3D"box-sizing: border-box;=
" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x=
 2 tn70742 tn70742 4096 Jun 5 12:17 classes</span><br style=3D"box-sizing: =
border-box;" /><span style=3D"box-sizing: border-box; font-size: xx-small;"=
>drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 conf</span><br style=3D"box-=
sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size: xx=
-small;">-rw-rw-r-- 1 tn70742 tn70742 1035 Jun 5 12:17 COPYING.MIT</span><b=
r style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box=
; font-size: xx-small;">drwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 custo=
m-licenses</span><br style=3D"box-sizing: border-box;" /><span style=3D"box=
-sizing: border-box; font-size: xx-small;">drwxrwxr-x 13 tn70742 tn70742 40=
96 Jun 5 12:17 dynamic-layers</span><br style=3D"box-sizing: border-box;" /=
><span style=3D"box-sizing: border-box; font-size: xx-small;">-rw-r--r-- 8 =
tn70742 tn70742 43342 Mar 9 2018 EULA</span><br style=3D"box-sizing: border=
-box;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">-rw-r=
w-r-- 1 tn70742 tn70742 495 Jun 5 12:17 LICENSE</span><br style=3D"box-sizi=
ng: border-box;" /><span style=3D"box-sizing: border-box; font-size: xx-sma=
ll;">-rw-rw-r-- 1 tn70742 tn70742 1006 Jun 5 12:17 README</span><br style=
=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-=
size: xx-small;">drwxrwxr-x 34 tn70742 tn70742 4096 Jun 5 12:17 recipes-bsp=
</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: b=
order-box; font-size: xx-small;">drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12=
:17 recipes-connectivity</span><br style=3D"box-sizing: border-box;" /><spa=
n style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 5 tn707=
42 tn70742 4096 Jun 5 12:17 recipes-core</span><br style=3D"box-sizing: bor=
der-box;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">dr=
wxrwxr-x 8 tn70742 tn70742 4096 Jun 5 12:17 recipes-devtools</span><br styl=
e=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font=
-size: xx-small;"><strong style=3D"box-sizing: border-box; font-weight: bol=
d;">drwxrwxr-x 3 tn70742 tn70742 4096 Jun 5 12:17 recipes-downgrade</strong=
></span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: =
border-box; font-size: xx-small;">drwxrwxr-x 6 tn70742 tn70742 4096 Jun 5 1=
2:17 recipes-dpaa</span><br style=3D"box-sizing: border-box;" /><span style=
=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 8 tn70742 tn70=
742 4096 Jun 5 12:17 recipes-dpaa2</span><br style=3D"box-sizing: border-bo=
x;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr=
-x 17 tn70742 tn70742 4096 Jun 5 12:17 recipes-extended</span><br style=3D"=
box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size=
: xx-small;">drwxrwxr-x 4 tn70742 tn70742 4096 Jun 5 12:17 recipes-fsl</spa=
n><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border=
-box; font-size: xx-small;">drwxrwxr-x 22 tn70742 tn70742 4096 Jun 5 12:17 =
recipes-graphics</span><br style=3D"box-sizing: border-box;" /><span style=
=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 7 tn70742 tn70=
742 4096 Jun 5 12:17 recipes-kernel</span><br style=3D"box-sizing: border-b=
ox;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwx=
r-x 14 tn70742 tn70742 4096 Jun 5 12:17 recipes-multimedia</span><br style=
=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-=
size: xx-small;">drwxrwxr-x 4 tn70742 tn70742 4096 Jun 5 12:17 recipes-secu=
rity</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizin=
g: border-box; font-size: xx-small;">drwxrwxr-x 3 tn70742 tn70742 4096 Jun =
5 12:17 recipes-support</span><br style=3D"box-sizing: border-box;" /><span=
 style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 2 tn7074=
2 tn70742 4096 Jun 5 12:17 SCR</span><br style=3D"box-sizing: border-box;" =
/><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 2=
 tn70742 tn70742 4096 Jun 5 12:17 scripts</span><br style=3D"box-sizing: bo=
rder-box;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">d=
rwxrwxr-x 2 tn70742 tn70742 4096 Jun 5 12:17 wic</span></p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
When I look at the equivalent directory in the sdk environement, there is n=
o recipes-downgrade directory.&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
<br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-b=
ox; font-size: xx-small;">pokyuser@92da2e39ecdd:~/oem-deere-display_sdk/lay=
ers/meta-freescale$ ls -ll</span><br style=3D"box-sizing: border-box;" /><s=
pan style=3D"box-sizing: border-box; font-size: xx-small;">total 88</span><=
br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-bo=
x; font-size: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 cl=
asses</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizi=
ng: border-box; font-size: xx-small;">drwxrwxr-x 3 pokyuser pokyuser 4096 J=
un 6 21:19 conf</span><br style=3D"box-sizing: border-box;" /><span style=
=3D"box-sizing: border-box; font-size: xx-small;">-rw-rw-r-- 1 pokyuser pok=
yuser 1035 Jun 6 21:19 COPYING.MIT</span><br style=3D"box-sizing: border-bo=
x;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr=
-x 2 pokyuser pokyuser 4096 Jun 6 21:19 custom-licenses</span><br style=3D"=
box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size=
: xx-small;">drwxrwxr-x 13 pokyuser pokyuser 4096 Jun 6 21:19 dynamic-layer=
s</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: =
border-box; font-size: xx-small;">-rw-rw-r-- 1 pokyuser pokyuser 495 Jun 6 =
21:19 LICENSE</span><br style=3D"box-sizing: border-box;" /><span style=3D"=
box-sizing: border-box; font-size: xx-small;">-rw-rw-r-- 1 pokyuser pokyuse=
r 1006 Jun 6 21:19 README</span><br style=3D"box-sizing: border-box;" /><sp=
an style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 3 poky=
user pokyuser 4096 Jun 6 21:19 recipes-connectivity</span><br style=3D"box-=
sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size: xx=
-small;">drwxrwxr-x 5 pokyuser pokyuser 4096 Jun 6 21:19 recipes-core</span=
><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-=
box; font-size: xx-small;">drwxrwxr-x 8 pokyuser pokyuser 4096 Jun 6 21:19 =
recipes-devtools</span><br style=3D"box-sizing: border-box;" /><span style=
=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 6 pokyuser pok=
yuser 4096 Jun 6 21:19 recipes-dpaa</span><br style=3D"box-sizing: border-b=
ox;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwx=
r-x 8 pokyuser pokyuser 4096 Jun 6 21:19 recipes-dpaa2</span><br style=3D"b=
ox-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size:=
 xx-small;">drwxrwxr-x 17 pokyuser pokyuser 4096 Jun 6 21:19 recipes-extend=
ed</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing:=
 border-box; font-size: xx-small;">drwxrwxr-x 4 pokyuser pokyuser 4096 Jun =
6 21:19 recipes-fsl</span><br style=3D"box-sizing: border-box;" /><span sty=
le=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr-x 22 pokyuser =
pokyuser 4096 Jun 6 21:19 recipes-graphics</span><br style=3D"box-sizing: b=
order-box;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">=
drwxrwxr-x 7 pokyuser pokyuser 4096 Jun 6 21:19 recipes-kernel</span><br st=
yle=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; fo=
nt-size: xx-small;">drwxrwxr-x 14 pokyuser pokyuser 4096 Jun 6 21:19 recipe=
s-multimedia</span><br style=3D"box-sizing: border-box;" /><span style=3D"b=
ox-sizing: border-box; font-size: xx-small;">drwxrwxr-x 4 pokyuser pokyuser=
 4096 Jun 6 21:19 recipes-security</span><br style=3D"box-sizing: border-bo=
x;" /><span style=3D"box-sizing: border-box; font-size: xx-small;">drwxrwxr=
-x 3 pokyuser pokyuser 4096 Jun 6 21:19 recipes-support</span><br style=3D"=
box-sizing: border-box;" /><span style=3D"box-sizing: border-box; font-size=
: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 SCR</span><br =
style=3D"box-sizing: border-box;" /><span style=3D"box-sizing: border-box; =
font-size: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun 6 21:19 scrip=
ts</span><br style=3D"box-sizing: border-box;" /><span style=3D"box-sizing:=
 border-box; font-size: xx-small;">drwxrwxr-x 2 pokyuser pokyuser 4096 Jun =
6 21:19 wic</span></p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 15px; color: #333f48; f=
ont-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 300; lette=
r-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
I'm not sure why the r<strong style=3D"box-sizing: border-box; font-weight:=
 bold;">ecipes-downgrade</strong><span>&nbsp;</span>directory is not being =
copied into the sdk environment.&nbsp;</p>

--zCA3AmZQNO70W039bUaa--

