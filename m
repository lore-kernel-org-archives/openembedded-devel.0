Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A633E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 08:06:43 +0000 (UTC)
Subject: [RFC_V2] [meta-oe]: Improving ext* sparse image generation: migrating from img2simg to ext2simg_android for ext* filesystem
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (1.7.105.116)
X-Originating-Platform: Windows Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Feb 2026 00:06:33 -0800
Message-ID: <rGsP.1771488393837852960.eVnE@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="1ifeTG6SbtqnroeenN8K"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 08:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124499

--1ifeTG6SbtqnroeenN8K
Content-Type: multipart/alternative; boundary="JCLPOTkt1npfbpuOtJXh"

--JCLPOTkt1npfbpuOtJXh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Community Members,

I would like to propose a change to how we handle sparse image generation f=
or ext* file-systems in OpenEmbedded,
specifically moving away from the generic img2simg tool toward the speciali=
sed ext2simg_android in the e2fsprogs [contrib/android]

*1) Problem*
Currently, image_types_sparse.bbclass uses img2simg for all file-system typ=
es.
img2simg is a=C2=A0 tool that reads the raw image to find zero-filled block=
s.
For ext* file-systems, this is inefficient compared to=C2=A0 ext2simg from =
e2fsprogs [contrib/android]
which understands the file-system structure and uses the block bitmap to de=
termine sparse areas.

*2) History*
Previously, 'ext2simg' was bundled within android-tools (v5.1 and older).
The utility has since migrated to the e2fsprogs project (contrib/android).
However, upstream e2fsprogs does not provide a build system for this tool,
and it requires libsparse from android-tools to compile.

*3) Proposed Changes*
To implement this , below approach is proposed for feedback:

a. meta-oe (android-tools):
Export libsparse, libbase, and liblog headers and libraries to the sysroot.=
 Currently, these are often internal to the build.
Reorganise header installation to ${includedir}/sparse to match the expecte=
d include paths for e2fsprogs contrib tools.

b. =C2=A0meta-oe (ext2simg_android )
Have created an fresh recipe which focus only on getting ext2simg.c compile=
d with andorid sparse.h
(as per suggestion on first RFC
openembedded-core@lists.openembedded.org | [RFC] Improving ext* sparse imag=
e generation: migrating from img2simg to ext4sparse for ext* filesystem ( h=
ttps://lists.openembedded.org/g/openembedded-core/topic/rfc_improving_ext_s=
parse/117715350 )
)
This would link against the exported libsparse from android-tools-native.

c. meta-oe (image_types_sparse.bbclass):
Update CONVERSION_CMD:sparse to detect ext* types.
Use=C2=A0 ext2simg from the e2fsprogs [contrib/android] for these types whi=
le falling back to img2simg for others (like f2fs).

*4) Points for Discussion / Feasibility*
I am seeking feedback on the following:

*a. Build Integration:*
In my PoC, I've used a manual ${CC} call in do_compile:append.
Would it be preferred to patch the e2fsprogs Makefile to handle this "contr=
ib" tool more natively?

*b. Library Handling:*
To ensure the native binary finds libsparse at image creation time, I am cu=
rrently using LD_LIBRARY_PATH in the class.
I suspect a better approach would be ensuring proper RPATH during the e2fsp=
rogs build.
If members can help for any better way of doing this

*c. I have a working proof of concept using RPI4 build*
Attached along are the patch 001-meta-oe-image_types_sparse-use-ext2simg_an=
droid-for-.patch

*5) Logical layout of current POC*
This commit bridges the gap between these two recipes:
1. android-tools:
- Updated to v29.0.6 and masked v5.1.1 to provide modern libraries.
- Modified do_install to export libsparse, libbase, and liblog headers and =
libraries to the sysroot, enabling external linking.

2. image_types_sparse.bbclass:
- Updated CONVERSION_CMD to branch by filesystem type, calling ext2simg_and=
roid specifically for ext* images.
- Exported LD_LIBRARY_PATH to the native sysroot to ensure the ext2simg_and=
roid binary can locate its shared dependencies at runtime.

3. Layer Configuration:
- Updated layer.conf to support dynamic-layers for SELinux and synchronized=
 BBMASK entries to prioritize the updated tools.

*6) Benefit :*
This reduces the time and cost involved while flashing Android RFS / Fastbo=
ot etc
Even in CI/CD , which all adds to ease of usage and have monetary benefit i=
nvolved with continous CI/CD

Looking forward to thoughts / feedback from community members

Please do let me know if any specific platform or group needs to be address=
ed to have such discussion
If there is any specific meeting involved where i can join and explain, ple=
ase do let me know
I can connect to team members and works as per suggestion from community to=
 fine tune / rework if any specific changes community suggest

Thanks ,
Ashish Kumar Mishra

--JCLPOTkt1npfbpuOtJXh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Hello Community Members,&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">I would like to propose a change to how we hand=
le sparse image generation for ext* file-systems in OpenEmbedded,&nbsp;</di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">specifically moving away from the generic img2s=
img tool toward the specialised ext2simg_android in the e2fsprogs [contrib/=
android]</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">1) Problem</strong></di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Currently, image_types_sparse.bbcl=
ass uses img2simg for all file-system types.&nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>img2simg is a&nbsp; tool that read=
s the raw image to find zero-filled blocks.&nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>For ext* file-systems, this is ine=
fficient compared to&nbsp; ext2simg from e2fsprogs [contrib/android]</span>=
</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>which understands the file-system =
structure and uses the block bitmap to determine sparse areas.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">2) History</strong></di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Previously, 'ext2simg' was bundled=
 within android-tools (v5.1 and older).</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>The utility has since migrated to =
the e2fsprogs project (contrib/android).</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>However, upstream e2fsprogs does n=
ot provide a build system for this tool,</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>and it requires libsparse from and=
roid-tools to compile.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">3) Proposed Changes</st=
rong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">To implement this , below approach is proposed =
for feedback:</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>a. meta-oe (android-tools):</span>=
</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Export libsparse, libbase, and lib=
log headers and libraries to the sysroot. Currently, these are often intern=
al to the build.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Reorganise header installation to =
${includedir}/sparse to match the expected include paths for e2fsprogs cont=
rib tools.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>b. &nbsp;meta-oe (ext2simg_android=
 )<br />Have created an fresh recipe which focus only on getting ext2simg.c=
 compiled with andorid sparse.h&nbsp;<br />(as per suggestion on first RFC&=
nbsp;<br /><a href=3D"https://lists.openembedded.org/g/openembedded-core/to=
pic/rfc_improving_ext_sparse/117715350">openembedded-core@lists.openembedde=
d.org | [RFC] Improving ext* sparse image generation: migrating from img2si=
mg to ext4sparse for ext* filesystem</a>&nbsp;<br />)</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>This would link against the export=
ed libsparse from android-tools-native.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>c. meta-oe (image_types_sparse.bbc=
lass):</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Update CONVERSION_CMD:sparse to de=
tect ext* types.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Use&nbsp; ext2simg from the e2fspr=
ogs [contrib/android] for these types while falling back to img2simg for ot=
hers (like f2fs).</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">4) Points for Discussio=
n / Feasibility</strong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp; &nbsp; &nbsp;I am seeking feedback on th=
e following:</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;"><span style=3D"box-sizi=
ng: border-box; overflow-wrap: break-word !important;"><span style=3D"box-s=
izing: border-box; overflow-wrap: break-word !important;"></span>a. Build I=
ntegration:&nbsp;</span></strong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>In my PoC, I've used a manual ${CC=
} call in do_compile:append.&nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>Would it be preferred to patch the=
 e2fsprogs Makefile to handle this "contrib" tool more natively?</span></di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;"><span style=3D"box-sizi=
ng: border-box; overflow-wrap: break-word !important;">b. Library Handling:=
&nbsp;</span></strong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; To ensure the native binary=
 finds libsparse at image creation time, I am currently using LD_LIBRARY_PA=
TH in the class.&nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; I suspect a better approach=
 would be ensuring proper RPATH during the e2fsprogs build.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; If members can help for any=
 better way of doing this&nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;"><span style=3D"box-sizi=
ng: border-box; overflow-wrap: break-word !important;">c. I have a working =
proof of concept using RPI4 build&nbsp;</span></strong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;Attached along are th=
e patch <span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', =
Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emo=
ji'; font-size: 14px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial; display: inline !important=
; float: none;">001-meta-oe-image_types_sparse-use-ext2simg_android-for-.pa=
tch&nbsp;</span></span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 14px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial; dis=
play: inline !important; float: none;">&nbsp; &nbsp;</span></span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp; &nbsp;</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">5) Logical layout of cu=
rrent POC&nbsp;</strong></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>This commit bridges the gap betwee=
n these two recipes:</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>1. android-tools:</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;- Updated to v29.0.6 =
and masked v5.1.1 to provide modern libraries.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;- Modified do_install=
 to export libsparse, libbase, and liblog </span><span style=3D"box-sizing:=
 border-box; overflow-wrap: break-word !important;"><span style=3D"box-sizi=
ng: border-box; overflow-wrap: break-word !important;"></span>headers and l=
ibraries to the sysroot, enabling external linking.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>2. image_types_sparse.bbclass:</sp=
an></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;- Updated CONVERSION_=
CMD to branch by filesystem type, calling ext2simg_android </span><span sty=
le=3D"box-sizing: border-box; overflow-wrap: break-word !important;">specif=
ically for ext* images.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;- Exported LD_LIBRARY=
_PATH to the native sysroot to ensure the ext2simg_android </span><span sty=
le=3D"box-sizing: border-box; overflow-wrap: break-word !important;">binary=
 can locate its shared dependencies at runtime.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>3. Layer Configuration:</span></di=
v>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><span style=3D"box-sizing: border-box; overflow=
-wrap: break-word !important;"><span style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important;"></span>&nbsp; &nbsp;- Updated layer.conf =
to support dynamic-layers for SELinux and </span><span style=3D"box-sizing:=
 border-box; overflow-wrap: break-word !important;">synchronized BBMASK ent=
ries to prioritize the updated tools.</span></div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;"><strong style=3D"box-sizing: border-box; font-w=
eight: bold; overflow-wrap: break-word !important;">6) Benefit :</strong></=
div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp; &nbsp; This reduces the time and cost in=
volved while flashing Android RFS / Fastboot etc&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp; &nbsp; Even in CI/CD , which all adds to=
 ease of usage and have monetary benefit involved with continous CI/CD&nbsp=
;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Looking forward to thoughts / feedback from com=
munity members</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Please do let me know if any specific platform =
or group needs to be addressed to have such discussion&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">If there is any specific meeting involved where=
 i can join and explain, please do let me know&nbsp;<br style=3D"box-sizing=
: border-box; overflow-wrap: break-word !important;" />I can connect to tea=
m members and works as per suggestion from community to fine tune / rework =
if any specific changes community suggest&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Thanks ,&nbsp;</div>
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Ashish Kumar Mishra&nbsp;</div>

--JCLPOTkt1npfbpuOtJXh--

--1ifeTG6SbtqnroeenN8K
Content-Type: application/octet-stream; name="0001-meta-oe-image_types_sparse-use-ext2simg_android-for-.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-meta-oe-image_types_sparse-use-ext2simg_android-for-.patch"

RnJvbSAyOGJiMDQwOWIyMWI2NGQ2ZGQ0MzlhMzhkNDE0MzZlYTIyYTY5NGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2hpc2hLdW1hciBNaXNocmEgPGFzaGlzaGt1bWFyLm1pc2hy
YUBibXd0ZWNod29ya3MuaW4+CkRhdGU6IFRodSwgMTkgRmViIDIwMjYgMTM6MTQ6MjIgKzA1MzAK
U3ViamVjdDogW1BBVENIXSBtZXRhLW9lOiBpbWFnZV90eXBlc19zcGFyc2U6IHVzZSBleHQyc2lt
Z19hbmRyb2lkIGZvciBleHQqCiBpbWFnZSBjb252ZXJzaW9uCgpVcGRhdGUgdGhlIHNwYXJzZSBp
bWFnZSBjb252ZXJzaW9uIHByb2Nlc3MgZm9yIGV4dCogZmlsZXN5c3RlbXMgdG8gdXNlCmV4dDJz
aW1nX2FuZHJvaWQgKGV4dDJzaW1nKSBpbnN0ZWFkIG9mIHRoZSBnZW5lcmljIGltZzJzaW1nIHRv
b2wuCgpVbmxpa2UgaW1nMnNpbWcsIHdoaWNoIHRyZWF0cyBhbGwgemVyby1ibG9ja3MgaWRlbnRp
Y2FsbHksIGV4dDJzaW1nX2FuZHJvaWQKbGV2ZXJhZ2VzIGUyZnNwcm9ncyBrbm93bGVkZ2Ugb2Yg
dGhlIGZpbGVzeXN0ZW0uClRoaXMgYWxsb3dzIGl0IHRvIG1hcmsgemVyby1ibG9ja3Mgb3V0c2lk
ZSBvZiB0aGUgZXh0LWZpbGVzeXN0ZW0gYXMKImRvbid0IGNhcmUiIChza2lwIGNodW5rcykgcmF0
aGVyIHRoYW4gImZpbGwtd2l0aC16ZXJvcyIgKHJhdyBjaHVua3MpCnJlc3VsdGluZyBpbiBtb3Jl
IG9wdGltaXplZCBhbmQgc21hbGxlciBzcGFyc2UgaW1hZ2VzLgoKUHJldmlvdXNseSwgJ2V4dDJz
aW1nJyB3YXMgYnVuZGxlZCB3aXRoaW4gYW5kcm9pZC10b29scyAodjUuMSBhbmQgb2xkZXIpLgpU
aGUgdXRpbGl0eSBoYXMgc2luY2UgbWlncmF0ZWQgdG8gdGhlIGUyZnNwcm9ncyBwcm9qZWN0IChj
b250cmliL2FuZHJvaWQpLgpIb3dldmVyLCB1cHN0cmVhbSBlMmZzcHJvZ3MgZG9lcyBub3QgcHJv
dmlkZSBhIGJ1aWxkIHN5c3RlbSBmb3IgdGhpcyB0b29sLAphbmQgaXQgcmVxdWlyZXMgbGlic3Bh
cnNlIGZyb20gYW5kcm9pZC10b29scyB0byBjb21waWxlLgoKVGhpcyBjb21taXQgYnJpZGdlcyB0
aGUgZ2FwIGJldHdlZW4gdGhlc2UgdHdvIHJlY2lwZXM6CjEuIGFuZHJvaWQtdG9vbHM6CiAgIC0g
VXBkYXRlZCB0byB2MjkuMC42IGFuZCBtYXNrZWQgdjUuMS4xIHRvIHByb3ZpZGUgbW9kZXJuIGxp
YnJhcmllcy4KICAgLSBNb2RpZmllZCBkb19pbnN0YWxsIHRvIGV4cG9ydCBsaWJzcGFyc2UsIGxp
YmJhc2UsIGFuZCBsaWJsb2cKICAgICBoZWFkZXJzIGFuZCBsaWJyYXJpZXMgdG8gdGhlIHN5c3Jv
b3QsIGVuYWJsaW5nIGV4dGVybmFsIGxpbmtpbmcuCgoyLiBpbWFnZV90eXBlc19zcGFyc2UuYmJj
bGFzczoKICAgLSBVcGRhdGVkIENPTlZFUlNJT05fQ01EIHRvIGJyYW5jaCBieSBmaWxlc3lzdGVt
IHR5cGUsIGNhbGxpbmcKICAgICBleHQyc2ltZ19hbmRyb2lkIHNwZWNpZmljYWxseSBmb3IgZXh0
KiBpbWFnZXMuCiAgIC0gRXhwb3J0ZWQgTERfTElCUkFSWV9QQVRIIHRvIHRoZSBuYXRpdmUgc3lz
cm9vdCB0byBlbnN1cmUgdGhlCiAgICAgZXh0MnNpbWdfYW5kcm9pZCBiaW5hcnkgY2FuIGxvY2F0
ZSBpdHMgc2hhcmVkIGRlcGVuZGVuY2llcyBhdCBydW50aW1lLgoKMy4gTGF5ZXIgQ29uZmlndXJh
dGlvbjoKICAgLSBVcGRhdGVkIGxheWVyLmNvbmYgdG8gc3VwcG9ydCBkeW5hbWljLWxheWVycyBm
b3IgU0VMaW51eCBhbmQKICAgICBzeW5jaHJvbml6ZWQgQkJNQVNLIGVudHJpZXMgdG8gcHJpb3Jp
dGl6ZSB0aGUgdXBkYXRlZCB0b29scy4KClRoaXMgaXMgdmVyMiBpbXBsZW1lbnRhaW9uIGJhc2Vk
IG9uIHN1dWdlc3Rpb24gb24gUkZDCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3RvcGljL3JmY19pbXByb3ZpbmdfZXh0X3NwYXJzZS8xMTc3MTUzNTAK
ClVwc3RyZWFtLVN0YXR1czogUGVuZGluZwoKU2lnbmVkLW9mZi1ieTogQXNoaXNoS3VtYXIgTWlz
aHJhIDxhc2hpc2hrdW1hci5taXNocmFAYm13dGVjaHdvcmtzLmluPgotLS0KIG1ldGEtb2UvY2xh
c3Nlcy9pbWFnZV90eXBlc19zcGFyc2UuYmJjbGFzcyAgICB8IDI4ICsrKystLS0KIG1ldGEtb2Uv
Y29uZi9sYXllci5jb25mICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrLQogLi4uL2FuZHJv
aWQtdG9vbHMvYW5kcm9pZC10b29sc18yOS4wLjYucjE0LmJiIHwgNTEgKysrKysrKysrKysrCiAu
Li4vZTJmc3Byb2dzLWV4dDRzcGFyc2VfMS4wLmJiICAgICAgICAgICAgICAgfCA4MCArKysrKysr
KysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE2MiBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZTJm
c3Byb2dzLWV4dDRzcGFyc2UvZTJmc3Byb2dzLWV4dDRzcGFyc2VfMS4wLmJiCgpkaWZmIC0tZ2l0
IGEvbWV0YS1vZS9jbGFzc2VzL2ltYWdlX3R5cGVzX3NwYXJzZS5iYmNsYXNzIGIvbWV0YS1vZS9j
bGFzc2VzL2ltYWdlX3R5cGVzX3NwYXJzZS5iYmNsYXNzCmluZGV4IDU0MTZjMmEwMTkuLjMwYzgw
MmI1ZDEgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvY2xhc3Nlcy9pbWFnZV90eXBlc19zcGFyc2UuYmJj
bGFzcworKysgYi9tZXRhLW9lL2NsYXNzZXMvaW1hZ2VfdHlwZXNfc3BhcnNlLmJiY2xhc3MKQEAg
LTEyLDEyICsxMiwyMiBAQCBDT05WRVJTSU9OVFlQRVMgKz0gInNwYXJzZSIKIERFTEVURV9SQVdJ
TUFHRV9BRlRFUl9TUEFSU0VfQ01EID8/PSAiMCIKIAogQ09OVkVSU0lPTl9DTUQ6c3BhcnNlID0g
IiBcCi0gICAgdHJ1bmNhdGUgLS1uby1jcmVhdGUgLS1zaXplPSUke1NQQVJTRV9CTE9DS19TSVpF
fSAiJHtJTUFHRV9OQU1FfS4ke3R5cGV9IjsgXAotICAgIGltZzJzaW1nIC1zICIke0lNQUdFX05B
TUV9LiR7dHlwZX0iICIke0lNQUdFX05BTUV9LiR7dHlwZX0uc3BhcnNlIiAke1NQQVJTRV9CTE9D
S19TSVpFfTsgXAotICAgIGlmIFsgIiR7REVMRVRFX1JBV0lNQUdFX0FGVEVSX1NQQVJTRV9DTUR9
IiA9ICIxIiBdOyB0aGVuIFwKLSAgICAgICAgcm0gLWYgJHtJTUFHRV9OQU1FfS4ke3R5cGV9O1wK
LSAgICAgICAgYmJ3YXJuICJSYXcgZmlsZSAke0lNQUdFX05BTUV9LiR7dHlwZX0gcmVtb3ZlZCIg
O1wKLSAgICBmaTtcCi0gIgotCi1DT05WRVJTSU9OX0RFUEVORFNfc3BhcnNlID0gImFuZHJvaWQt
dG9vbHMtbmF0aXZlIgorICAgIHRydW5jYXRlIC0tbm8tY3JlYXRlIC0tc2l6ZT0lJHtTUEFSU0Vf
QkxPQ0tfU0laRX0gJyR7SU1BR0VfTkFNRX0uJHt0eXBlfSc7IFwKKyAgICBjYXNlICcke3R5cGV9
JyBpbiBcCisgICAgICAgIGV4dCopIFwKKyAgICAgICAgICAgIGV4cG9ydCBMRF9MSUJSQVJZX1BB
VEg9JyR7U1RBR0lOR19MSUJESVJfTkFUSVZFfToke0xEX0xJQlJBUllfUEFUSH0nOyBcCisgICAg
ICAgICAgICBcCisgICAgICAgICAgICBiYndhcm4gJ1J1bm5pbmcgZTJmc3Byb2dzLWRlcml2ZWQg
ZXh0MnNpbWdfYW5kcm9pZC4uJyA7IFwKKyAgICAgICAgICAgIGV4dDJzaW1nX2FuZHJvaWQgJyR7
SU1BR0VfTkFNRX0uJHt0eXBlfScgJyR7SU1BR0VfTkFNRX0uc2ltZycgfHwgYmJlcnJvciAnZXh0
MnNpbWdfYW5kcm9pZCBmYWlsZWQnIFwKKyAgICAgICAgICAgIDs7IFwKKyAgICAgICAgKikgXAor
ICAgICAgICAgICAgYmJ3YXJuICdHZW5lcmF0aW5nIHNwYXJzZSBpbWFnZSBmb3Igbm9uLWV4dCBm
aWxlc3lzdGVtLi4uJzsgXAorICAgICAgICAgICAgaW1nMnNpbWcgLXMgJyR7SU1BR0VfTkFNRX0u
JHt0eXBlfScgJyR7SU1BR0VfTkFNRX0uJHt0eXBlfS5zcGFyc2UnICR7U1BBUlNFX0JMT0NLX1NJ
WkV9OyBcCisgICAgICAgICAgICA7OyBcCisgICAgZXNhYzsgXAorICAgIGlmIFsgJyR7REVMRVRF
X1JBV0lNQUdFX0FGVEVSX1NQQVJTRV9DTUR9JyA9ICcxJyBdOyB0aGVuIFwKKyAgICAgICAgcm0g
LWYgJyR7SU1BR0VfTkFNRX0uJHt0eXBlfSc7IFwKKyAgICBmaTsgXAorIgorQ09OVkVSU0lPTl9E
RVBFTkRTOnNwYXJzZSA9ICJhbmRyb2lkLXRvb2xzLW5hdGl2ZSBlMmZzcHJvZ3MtZXh0NHNwYXJz
ZS1uYXRpdmUiCitkb19pbWFnZV9leHQ0W2RlcGVuZHNdICs9ICJlMmZzcHJvZ3MtZXh0NHNwYXJz
ZS1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCIKZGlmZiAtLWdpdCBhL21ldGEtb2UvY29uZi9s
YXllci5jb25mIGIvbWV0YS1vZS9jb25mL2xheWVyLmNvbmYKaW5kZXggMTg2ZmY5YTQ4OC4uOWNl
MmNkYjY2YyAxMDA2NDQKLS0tIGEvbWV0YS1vZS9jb25mL2xheWVyLmNvbmYKKysrIGIvbWV0YS1v
ZS9jb25mL2xheWVyLmNvbmYKQEAgLTEyLDcgKzEyLDE2IEBACiBCQlBBVEggLj0gIjoke0xBWUVS
RElSfSIKIAogIyBXZSBoYXZlIGEgcmVjaXBlcyBkaXJlY3RvcnksIGFkZCB0byBCQkZJTEVTCi1C
QkZJTEVTICs9ICIke0xBWUVSRElSfS9yZWNpcGVzLSovKi8qLmJiICR7TEFZRVJESVJ9L3JlY2lw
ZXMtKi8qLyouYmJhcHBlbmQiCisjIEFkZGluZyBkeW5hbWljIGxheWVycyByZWNpcGVzCitCQkZJ
TEVTICs9ICJcCisgICAgJHtMQVlFUkRJUn0vcmVjaXBlcy0qLyovKi5iYiBcCisgICAgJHtMQVlF
UkRJUn0vcmVjaXBlcy0qLyovKi5iYmFwcGVuZCBcCisgICAgJHtMQVlFUkRJUn0vZHluYW1pYy1s
YXllcnMvc2VsaW51eC9yZWNpcGVzLSovKi8qLmJiIFwKKyAgICAke0xBWUVSRElSfS9keW5hbWlj
LWxheWVycy9zZWxpbnV4L3JlY2lwZXMtKi8qLyouYmJhcHBlbmQgXAorIgorCisjIE1hbnVhbGx5
IHJlbW92aW5nIGRlZmF1bHQgYW5kcm9pZC10b29scyByZWNpcGVzCitCQk1BU0sgKz0gIm1ldGEt
b3BlbmVtYmVkZGVkL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hbmRyb2lkLXRvb2xzL2FuZHJv
aWQtdG9vbHNfNS4xLjEucjM3LmJiIgogCiBCQkZJTEVfQ09MTEVDVElPTlMgKz0gIm9wZW5lbWJl
ZGRlZC1sYXllciIKIEJCRklMRV9QQVRURVJOX29wZW5lbWJlZGRlZC1sYXllciA6PSAiXiR7TEFZ
RVJESVJ9LyIKQEAgLTQwLDYgKzQ5LDggQEAgQkJGSUxFU19EWU5BTUlDICs9ICIgXAogICAgIHBl
cmwtbGF5ZXI6JHtMQVlFUkRJUn0vZHluYW1pYy1sYXllcnMvcGVybC1sYXllci9yZWNpcGVzLSov
Ki8qLmJiYXBwZW5kIFwKICAgICBzZWxpbnV4OiR7TEFZRVJESVJ9L2R5bmFtaWMtbGF5ZXJzL3Nl
bGludXgvcmVjaXBlcy0qLyovKi5iYiBcCiAgICAgc2VsaW51eDoke0xBWUVSRElSfS9keW5hbWlj
LWxheWVycy9zZWxpbnV4L3JlY2lwZXMtKi8qLyouYmJhcHBlbmQgXAorICAgIHNlbGludXgtbGF5
ZXI6JHtMQVlFUkRJUn0vZHluYW1pYy1sYXllcnMvc2VsaW51eC9yZWNpcGVzLSovKi8qLmJiIFwK
KyAgICBzZWxpbnV4LWxheWVyOiR7TEFZRVJESVJ9L2R5bmFtaWMtbGF5ZXJzL3NlbGludXgvcmVj
aXBlcy0qLyovKi5iYmFwcGVuZCBcCiAiCiAKICMgVGhpcyBzaG91bGQgb25seSBiZSBpbmNyZW1l
bnRlZCBvbiBzaWduaWZpY2FudCBjaGFuZ2VzIHRoYXQgd2lsbApkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9keW5hbWljLWxheWVycy9zZWxpbnV4L3JlY2lwZXMtZGV2dG9vbC9hbmRyb2lkLXRvb2xzL2Fu
ZHJvaWQtdG9vbHNfMjkuMC42LnIxNC5iYiBiL21ldGEtb2UvZHluYW1pYy1sYXllcnMvc2VsaW51
eC9yZWNpcGVzLWRldnRvb2wvYW5kcm9pZC10b29scy9hbmRyb2lkLXRvb2xzXzI5LjAuNi5yMTQu
YmIKaW5kZXggNzQ5MjhlZDE3MS4uMGE4NTE4YTFkZCAxMDA2NDQKLS0tIGEvbWV0YS1vZS9keW5h
bWljLWxheWVycy9zZWxpbnV4L3JlY2lwZXMtZGV2dG9vbC9hbmRyb2lkLXRvb2xzL2FuZHJvaWQt
dG9vbHNfMjkuMC42LnIxNC5iYgorKysgYi9tZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL3NlbGludXgv
cmVjaXBlcy1kZXZ0b29sL2FuZHJvaWQtdG9vbHMvYW5kcm9pZC10b29sc18yOS4wLjYucjE0LmJi
CkBAIC0xOTAsMyArMTkwLDU0IEBAIEZJTEVTOiR7UE59LWZzdG9vbHMgPSAiXAogRklMRVM6JHtQ
Tn0gKz0gIiR7bGliZGlyfS9hbmRyb2lkICR7bGliZGlyfS9hbmRyb2lkLyoiCiAKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIgorCithbmRyb2lkX3Rvb2xzX2VuYWJsZV9kZXZtb2RlKCkgeworICAg
IHRvdWNoICR7SU1BR0VfUk9PVEZTfS9ldGMvdXNiLWRlYnVnZ2luZy1lbmFibGVkCit9CisKK1JP
T1RGU19QT1NUUFJPQ0VTU19DT01NQU5EXyR7UE59LWFkYmQgKz0gIiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCJVU0JfREVCVUdHSU5HX0VOQUJMRUQiLCAiMSIsICJhbmRyb2lkX3Rvb2xzX2VuYWJsZV9k
ZXZtb2RlOyIsICIiLCBkKX0iCisKKyMgZTJmc3Byb2dzIGV4cGVjdGluZyBoZWFkZXJzIGluIHNw
YXJzZS8gc3ViZGlyZWN0b3J5Citkb19pbnN0YWxsOmFwcGVuZCgpIHsKKyAgICAjIHRvIHJlc29s
dmUgdGhlICJNdWx0aXBsZSBzaGxpYiBwcm92aWRlcnMiIGNvbmZsaWN0LgorICAgIHJtIC1mICR7
RH0ke2xpYmRpcn0vYW5kcm9pZC9saWJzcGFyc2Uuc28qCisgICAgcm0gLWYgJHtEfSR7bGliZGly
fS9hbmRyb2lkL2xpYmJhc2Uuc28qCisgICAgcm0gLWYgJHtEfSR7bGliZGlyfS9hbmRyb2lkL2xp
YmxvZy5zbyoKKworICAgIGlmIFsgLWQgIiR7U30vc3lzdGVtL2NvcmUvbGlic3BhcnNlL2luY2x1
ZGUvc3BhcnNlIiBdOyB0aGVuCisgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7aW5jbHVkZWRpcn0v
c3BhcnNlCisgICAgICAgIGNwIC1yICR7U30vc3lzdGVtL2NvcmUvbGlic3BhcnNlL2luY2x1ZGUv
c3BhcnNlLyogJHtEfSR7aW5jbHVkZWRpcn0vc3BhcnNlLworICAgIGVsc2UKKyAgICAgICAgYmJl
cnJvciAiU3BhcnNlIGhlYWRlcnMgbm90IGZvdW5kIGluICR7U30vc3lzdGVtL2NvcmUvbGlic3Bh
cnNlL2luY2x1ZGUvc3BhcnNlIgorICAgIGZpCisKKyAgICBpbnN0YWxsIC1kICR7RH0ke2xpYmRp
cn0KKyAgICBmb3IgbGliIGluIGxpYnNwYXJzZSBsaWJiYXNlIGxpYmxvZzsgZG8KKyAgICAgICAg
aWYgWyAtZiAiJHtTfS9kZWJpYW4vb3V0L3N5c3RlbS9jb3JlLyR7bGlifS5zbyIgXTsgdGhlbgor
ICAgICAgICAgICAgYmJ3YXJuICJJbnN0YWxsaW5nICR7bGlifSB0byBzeXNyb290IgorICAgICAg
ICAgICAgaW5zdGFsbCAtbSAwNzU1ICR7U30vZGViaWFuL291dC9zeXN0ZW0vY29yZS8ke2xpYn0u
c28gJHtEfSR7bGliZGlyfS8ke2xpYn0uc28uMAorICAgICAgICAgICAgbG4gLXNmICR7bGlifS5z
by4wICR7RH0ke2xpYmRpcn0vJHtsaWJ9LnNvCisgICAgICAgIGZpCisgICAgZG9uZQorCisgICAg
aW5zdGFsbCAtZCAke0R9JHtsaWJkaXJ9L2FuZHJvaWQKKyAgICBmb3IgbGliIGluIGxpYnNwYXJz
ZSBsaWJiYXNlIGxpYmxvZzsgZG8KKyAgICAgICAgaWYgWyAtZiAiJHtEfSR7bGliZGlyfS8ke2xp
Yn0uc28uMCIgXTsgdGhlbgorICAgICAgICAgICAgbG4gLXNmIC4uLyR7bGlifS5zby4wICR7RH0k
e2xpYmRpcn0vYW5kcm9pZC8ke2xpYn0uc28uMAorICAgICAgICAgICAgbG4gLXNmIC4uLyR7bGli
fS5zbyAke0R9JHtsaWJkaXJ9L2FuZHJvaWQvJHtsaWJ9LnNvCisgICAgICAgIGZpCisgICAgZG9u
ZQorfQorCitGSUxFUzoke1BOfS1kZXYgKz0gIiBcCisgICAgJHtpbmNsdWRlZGlyfS9zcGFyc2Ug
XAorICAgICR7bGliZGlyfS9saWIqLnNvIFwKKyAgICAke2xpYmRpcn0vYW5kcm9pZC9saWIqLnNv
IFwKKyIKKworRklMRVM6JHtQTn0gKz0gIiBcCisgICAgJHtsaWJkaXJ9L2xpYiouc28uKiBcCisg
ICAgJHtsaWJkaXJ9L2FuZHJvaWQvbGliKi5zby4qIFwKKyIKKworU1lTUk9PVF9ESVJTOmFwcGVu
ZDpjbGFzcy1uYXRpdmUgPSAiICR7aW5jbHVkZWRpcn0gJHtsaWJkaXJ9IgpkaWZmIC0tZ2l0IGEv
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy1leHQ0c3BhcnNlL2UyZnNwcm9ncy1l
eHQ0c3BhcnNlXzEuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MtZXh0
NHNwYXJzZS9lMmZzcHJvZ3MtZXh0NHNwYXJzZV8xLjAuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uYWZlNzRlYTI3OQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MtZXh0NHNwYXJzZS9lMmZzcHJvZ3MtZXh0NHNwYXJz
ZV8xLjAuYmIKQEAgLTAsMCArMSw4MCBAQAorcmVxdWlyZSBlMmZzcHJvZ3MtZXh0NHNwYXJzZS5p
bmMKKworaW5oZXJpdCBuYXRpdmUKKworU1JDX1VSSSArPSAiZmlsZTovL3JlbW92ZS5sZGNvbmZp
Zy5jYWxsLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL21rZGlyX3AucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vMDAwMS1taXNjLWNyZWF0ZV9pbm9kZS5jLUZpeC1mb3ItZmlsZS1sYXJnZXIt
dGhhbi0yR0IucGF0Y2ggXAorICAgICAgICAgICAiCitTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIFwKKyAgICAgICAgICAgZmlsZTovL2UyZnNwcm9ncy1maXgtbWlzc2luZy1jaGVjay1m
b3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vcXVpZXQtZGVi
dWdmcy5wYXRjaCBcCisgICAgICAgICAgICIKKworU1JDUkVWID0gImRhNjMxZTExN2RjZjg3OTdi
ZmRhMGY0OGJkYWEwNWFjMGZiY2Y3YWYiCisKK0VYVFJBX09FQ09ORiA9ICIgXAorICAgIC0tbGli
ZGlyPSR7YmFzZV9saWJkaXJ9IFwKKyAgICAtLXNiaW5kaXI9JHtiYXNlX3NiaW5kaXJ9IFwKKyAg
ICAtLWVuYWJsZS1lbGYtc2hsaWJzIFwKKyAgICAtLWVuYWJsZS1sYXJnZWZpbGUgXAorICAgIC0t
ZGlzYWJsZS1saWJ1dWlkIFwKKyAgICAtLWRpc2FibGUtbGliYmxraWQgXAorICAgIC0tZGlzYWJs
ZS11dWlkZCBcCisgICAgLS1kaXNhYmxlLWZ1c2UyZnMgXAorICAgIC0td2l0aC1jcm9uZC1kaXI9
bm8gXAorIgorCitERVBFTkRTICs9ICJ1dGlsLWxpbnV4LW5hdGl2ZSIKKworIyBGaXggZTJmc3By
b2dzLW5hdGl2ZSBkb19jb21waWxlIGVycm9yIHdpdGggb2xkIGtlcm5lbCBzdWNoIGFzIDUuMTAK
K0NBQ0hFRF9DT05GSUdVUkVWQVJTOmNsYXNzLW5hdGl2ZSA9ICJhY19jdl9oZWFkZXJfbGludXhf
ZnN2ZXJpdHlfaD1ubyIKKworZG9faW5zdGFsbCAoKSB7CisgICAgYmJ3YXJuICI9PT09PT09PT09
PT09PT0gREVCVUcgPT09PT09PT09PT09PT09PT09PT09PT0iCit9CisKKworUkRFUEVORFM6JHtQ
Tn0gPSAiIgorUlJFQ09NTUVORFM6JHtQTn0gPSAiIgorQUxURVJOQVRJVkU6JHtQTn0gPSAiIgor
CitQQUNLQUdFUyA9ICIke1BOfSIKK0ZJTEVTOiR7UE59ID0gIiR7YmluZGlyfS9leHQyc2ltZ19h
bmRyb2lkIgorRklMRVM6JHtQTn06Y2xhc3MtbmF0aXZlICs9ICIke2JpbmRpcn0vZXh0MnNpbWdf
YW5kcm9pZCIKKworREVQRU5EUzphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBhbmRyb2lkLXRvb2xz
LW5hdGl2ZSAiCisKK2RvX2NvbXBpbGU6YXBwZW5kOmNsYXNzLW5hdGl2ZSgpIHsKKyAgICBiYndh
cm4gIj09PT09PT09PT09PT09PSBDT01QSUxFX0FQUEVORDogREVCVUcgU1RBUlQgPT09PT09PT09
PT09PT09PT09PT09PT0iCisgICAgYmJ3YXJuICJDb21waWxpbmcgZXh0MnNpbWcuYyB3aXRoIG5h
dGl2ZSB0b29sY2hhaW4iCisKKyAgICAjaW5jbHVkZSA8ZXh0MmZzL2V4dDJmcy5oPgorICAgICNp
bmNsdWRlIDxldC9jb21fZXJyLmg+CisgICAgb2VfcnVubWFrZSAtQyAke0J9L2xpYi9ldAorICAg
IG9lX3J1bm1ha2UgLUMgJHtCfS9saWIvZXh0MmZzCisKKyAgICAjIFNvdXJjZSBkaXJlY3Rvcnkg
Zm9yIGV4dDJzaW1nLmMgaW4gdGhlIGUyZnNwcm9ncyB0cmVlCisgICAgU1JDX0VYVDJTSU1HPSIk
e1N9L2NvbnRyaWIvYW5kcm9pZCIKKworICAgIElOQ0xVREVTPSItSSR7U30vbGliIC1JJHtCfS9s
aWIgLUkke1NSQ19FWFQyU0lNR30vbGliIgorCisgICAgIyBTVEFHSU5HX0xJQkRJUl9OQVRJVkU6
IHdoZXJlIGFuZHJvaWQtdG9vbHMtbmF0aXZlIGluc3RhbGxlZCBsaWJzcGFyc2UKKyAgICBMSUJT
PSItTCR7Qn0vbGliIC1MJHtTVEFHSU5HX0xJQkRJUl9OQVRJVkV9IC1sc3BhcnNlIC1sZXh0MmZz
IC1seiAtbGNvbV9lcnIiCisKKyAgICAke0NDfSAke0NGTEFHU30gJHtMREZMQUdTfSAtbyAiJHtC
fS9leHQyc2ltZ19hbmRyb2lkIiAiJHtTUkNfRVhUMlNJTUd9L2V4dDJzaW1nLmMiICR7SU5DTFVE
RVN9ICR7TElCU30KKyAgICBiYndhcm4gImV4dDJzaW1nX2FuZHJvaWQgY29tcGlsYXRpb24gZmlu
aXNoZWQiCisgICAgYmJ3YXJuICI9PT09PT09PT09PT09PT0gQ09NUElMRV9BUFBFTkQ6IERFQlVH
IFNUT1AgPT09PT09PT09PT09PT09PT09PT09PT0iCit9CisKK2RvX2luc3RhbGw6YXBwZW5kOmNs
YXNzLW5hdGl2ZSgpIHsKKyAgICBiYndhcm4gIj09PT09PT09PT09PT09PSBJTlNUQUxMX0FQUEVO
RDogREVCVUcgU1RBUlQgPT09PT09PT09PT09PT09PT09PT09PT0iCisKKyAgICBiYndhcm4gIldl
IGhhdmUgRCBhcyAke0R9IgorICAgIGJid2FybiAiV2UgaGF2ZSBiaW5kaXIgYXMgJHtiaW5kaXJ9
IgorICAgIGJid2FybiAiV2UgaGF2ZSBiYXNlX2JpbmRpciBhcyAke2Jhc2VfYmluZGlyfSIKKyAg
ICBpbnN0YWxsIC1kICR7RH0ke2JpbmRpcn0KKyAgICBpbnN0YWxsIC1tIDA3NTUgJHtCfS9leHQy
c2ltZ19hbmRyb2lkICR7RH0ke2JpbmRpcn0vZXh0MnNpbWdfYW5kcm9pZAorCisgICAgYmJ3YXJu
ICI9PT09PT09PT09PT09PT0gSU5TVEFMTF9BUFBFTkQ6IERFQlVHIFNUT1AgPT09PT09PT09PT09
PT09PT09PT09PT0iCit9Ci0tIAoyLjM0LjEKCg==

--1ifeTG6SbtqnroeenN8K--

