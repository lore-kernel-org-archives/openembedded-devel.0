Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anandb@ti.com>) id 1QTDL6-0003A7-JG
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 15:26:01 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p55DMfIX000489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 08:22:43 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id p55DMdRS020206
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 18:52:40 +0530 (IST)
Received: from dbde02.ent.ti.com ([172.24.170.145]) by dbde70.ent.ti.com
	([172.24.170.148]) with mapi; Sun, 5 Jun 2011 18:52:39 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jun 2011 18:52:24 +0530
Thread-Topic: [PATCH] qt-4.6.3: update qt's powervr graphics driver plugin
	to work with SGX DDK v1.6
Thread-Index: AcwhJEyJvA4tXZ9tSvSIzYc0rfjPLwCXruFQ
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0375258FF2@dbde02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {790518E7-3C84-48C0-AA15-82E4BCC0899B}
x-cr-hashedpuzzle: C2c= ABkm ANRU ANyc DLiz EQIO EYGC E0zA GIOt Ggcr HQCv
	IPPT JiIk J4f7 LFp8 LIvb; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {790518E7-3C84-48C0-AA15-82E4BCC0899B};
	YQBuAGEAbgBkAGIAQAB0AGkALgBjAG8AbQA=; Sun,
	05 Jun 2011 13:22:24 GMT;
	UgBFADoAIABbAFAAQQBUAEMASABdACAAcQB0AC0ANAAuADYALgAzADoAIAB1AHAAZABhAHQAZQAgAHEAdAAnAHMAIABwAG8AdwBlAHIAdgByACAAZwByAGEAcABoAGkAYwBzACAAZAByAGkAdgBlAHIAIABwAGwAdQBnAGkAbgAgAHQAbwAgAHcAbwByAGsAIAB3AGkAdABoACAAUwBHAFgAIABEAEQASwAgAHYAMQAuADYA
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] qt-4.6.3: update qt's powervr graphics driver plugin to work with SGX DDK v1.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2011 13:26:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we include this patch in OpenEmbedded? This is a critical patch to enab=
le support for latest PowerVR drivers in Qt.

Regards,
Anand

-----Original Message-----
From: Balagopalakrishnan, Anand
Sent: Thursday, June 02, 2011 6:25 PM
To: 'openembedded-devel@lists.openembedded.org'
Subject: [PATCH] qt-4.6.3: update qt's powervr graphics driver plugin to wo=
rk with SGX DDK v1.6

From 9c65aba60dceec5c63f307369d09e465479b22a4 Mon Sep 17 00:00:00 2001
From: Anand Balagopalakrishnan <anandb@ti.com>
Date: Mon, 30 May 2011 18:57:37 +0530
Subject: [PATCH] qt-4.6.3: update qt's powervr graphics driver plugin to wo=
rk with SGX DDK v1.6

* The wsegl2 patch is required to build Qt with the latest SGX PowerVR driv=
ers
* Moved the wsegl2 patch from qt4/qt-4.7.3 to qt4/files
* Added the wsegl2 patch to qt-4.6.3

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 recipes/qt4/files/0001-wsegl2-support.patch    |  997 ++++++++++++++++++++=
++++
 recipes/qt4/qt-4.6.3.inc                       |    1 +
 recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch |  997 --------------------=
----
 3 files changed, 998 insertions(+), 997 deletions(-)
 create mode 100644 recipes/qt4/files/0001-wsegl2-support.patch
 delete mode 100644 recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch

diff --git a/recipes/qt4/files/0001-wsegl2-support.patch b/recipes/qt4/file=
s/0001-wsegl2-support.patch
new file mode 100644
index 0000000..ad61fe7
--- /dev/null
+++ b/recipes/qt4/files/0001-wsegl2-support.patch
@@ -0,0 +1,997 @@
+diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/w=
segl2/pvr2d.h qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl=
2/pvr2d.h
+--- qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/wsegl2/p=
vr2d.h       1970-01-01 00:00:00.000000000 +0000
++++ qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/pvr2d.h=
     2011-05-16 22:51:43.158564336 +0000
+@@ -0,0 +1,669 @@
++/**********************************************************************
++*
++* Copyright(c) Imagination Technologies Ltd.
++*
++* The contents of this file are subject to the MIT license as set out bel=
ow.
++*
++* Permission is hereby granted, free of charge, to any person obtaining a=
 copy
++* of this software and associated documentation files (the "Software"),
++* to deal in the Software without restriction, including without limitati=
on
++* the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
++* and/or sell copies of the Software, and to permit persons to whom the
++* Software is furnished to do so, subject to the following conditions:
++*
++* The above copyright notice and this permission notice shall be included
++* in all copies or substantial portions of the Software.
++*
++* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
++* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CL=
AIM,
++* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
++* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
++* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++*
++* This License is also included in this distribution in the file called
++* "COPYING".
++*
++*************************************************************************=
*****/
++
++
++
++/************************************************************************=
******
++Modifications :-
++$Log: pvr2d.h $
++
++ --- Revision Logs Removed ---
++*************************************************************************=
*****/
++
++#ifndef _PVR2D_H_
++#define _PVR2D_H_
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/* PVR2D Platform-specific definitions */
++#if defined (__linux__)
++#define PVR2D_EXPORT __attribute__((visibility("default")))
++#define PVR2D_IMPORT
++#else
++#define PVR2D_EXPORT
++#define PVR2D_IMPORT
++#endif
++
++/* PVR2D header revision */
++#define PVR2D_REV_MAJOR               3
++#define PVR2D_REV_MINOR               5
++
++/* Basic types */
++typedef enum
++{
++      PVR2D_FALSE =3D 0,
++      PVR2D_TRUE
++} PVR2D_BOOL;
++
++typedef void* PVR2D_HANDLE;
++
++typedef char             PVR2D_CHAR,  *PVR2D_PCHAR;
++typedef unsigned char    PVR2D_UCHAR, *PVR2D_PUCHAR;
++typedef int              PVR2D_INT,           *PVR2D_PINT;
++typedef unsigned int     PVR2D_UINT,  *PVR2D_PUINT;
++typedef long             PVR2D_LONG,  *PVR2D_PLONG;
++typedef unsigned long    PVR2D_ULONG, *PVR2D_PULONG;
++
++typedef void             PVR2D_VOID,  *PVR2D_PVOID;
++
++
++/* error codes */
++typedef enum
++{
++      PVR2D_OK =3D 0,
++      PVR2DERROR_INVALID_PARAMETER =3D -1,
++      PVR2DERROR_DEVICE_UNAVAILABLE =3D -2,
++      PVR2DERROR_INVALID_CONTEXT =3D -3,
++      PVR2DERROR_MEMORY_UNAVAILABLE =3D -4,
++      PVR2DERROR_DEVICE_NOT_PRESENT =3D -5,
++      PVR2DERROR_IOCTL_ERROR =3D -6,
++      PVR2DERROR_GENERIC_ERROR =3D -7,
++      PVR2DERROR_BLT_NOTCOMPLETE =3D -8,
++      PVR2DERROR_HW_FEATURE_NOT_SUPPORTED =3D -9,
++      PVR2DERROR_NOT_YET_IMPLEMENTED =3D -10,
++      PVR2DERROR_MAPPING_FAILED =3D -11
++}PVR2DERROR;
++
++/* 32 bit PVR2D pixel format specifier */
++typedef unsigned long PVR2DFORMAT;
++
++/* Standard PVR2D pixel formats */
++#define       PVR2D_1BPP                                              0x0=
0UL // 1bpp mask surface or palletized 1 bit source with 2x32 bit CLUT
++#define       PVR2D_RGB565                                    0x01UL // C=
ommon rgb 565 format
++#define       PVR2D_ARGB4444                                  0x02UL // C=
ommon argb 4444 format
++#define       PVR2D_RGB888                                    0x03UL // C=
ommon rgb 888 format (not supported)
++#define       PVR2D_ARGB8888                                  0x04UL // C=
ommon argb 8888 format
++#define       PVR2D_ARGB1555                                  0x05UL // C=
ommon argb 1555 format
++#define       PVR2D_ALPHA8                                    0x06UL // A=
lpha-only 8 bit per pixel (used with a constant fill colour)
++#define       PVR2D_ALPHA4                                    0x07UL // A=
lpha-only 4 bits per pixel (used with a constant fill colour)
++#define       PVR2D_PAL2                                              0x0=
8UL // Palletized 2 bit format (requires   4x32 bit CLUT)
++#define       PVR2D_PAL4                                              0x0=
9UL // Palletized 4 bit format (requires  16x32 bit CLUT)
++#define       PVR2D_PAL8                                              0x0=
AUL // Palletized 8 bit format (requires 256x32 bit CLUT)
++#define PVR2D_U8                                              0x10UL // m=
onochrome unsigned 8 bit
++#define PVR2D_U88                                             0x11UL // m=
onochrome unsigned 16 bit
++#define PVR2D_S8                                              0x12UL // s=
igned 8 bit
++#define PVR2D_YUV422_YUYV                             0x13UL // YUV 422 l=
ow-high byte order Y0UY1V
++#define PVR2D_YUV422_UYVY                             0x14UL // YUV 422 l=
ow-high byte order UY0VY1
++#define PVR2D_YUV422_YVYU                             0x15UL // YUV 422 l=
ow-high byte order Y0VY1U
++#define PVR2D_YUV422_VYUY                             0x16UL // YUV 422 l=
ow-high byte order VY0UY1
++#define PVR2D_YUV420_2PLANE                           0x17UL // YUV420 2 =
Plane
++#define PVR2D_YUV420_3PLANE                           0x18UL // YUV420 3 =
Plane
++#define PVR2D_2101010ARGB                             0x19UL // 32 bit 2 =
10 10 10
++#define PVR2D_888RSGSBS                                       0x1AUL
++#define PVR2D_16BPP_RAW                                       0x1BUL // 1=
6 bit raw (no format conversion)
++#define PVR2D_32BPP_RAW                                       0x1CUL // 3=
2 bit raw
++#define PVR2D_64BPP_RAW                                       0x1DUL // 6=
4 bit raw
++#define PVR2D_128BPP_RAW                              0x1EUL // 128 bit r=
aw
++
++#define       PVR2D_NO_OF_FORMATS                             0x1FUL
++
++/* Format modifier bit field (DstFormat and SrcFormat bits 16..23) */
++#define PVR2D_FORMAT_MASK                             0x0000FFFFUL    // =
PVR2D Format bits
++#define PVR2D_FORMAT_LAYOUT_MASK              0x000F0000UL    // Format l=
ayout (strided / twiddled / tiled)
++#define PVR2D_FORMAT_FLAGS_MASK                       0x0FF00000UL    // =
Surface Flags mask
++
++/* Layout */
++#define PVR2D_FORMAT_LAYOUT_SHIFT             16
++#define PVR2D_FORMAT_LAYOUT_STRIDED           0x00000000UL
++#define PVR2D_FORMAT_LAYOUT_TILED             0x00010000UL
++#define PVR2D_FORMAT_LAYOUT_TWIDDLED  0x00020000UL
++
++/*
++      PVR2D_SURFACE_PDUMP
++      This flag requests a surface pdump, to capture the pixel state afte=
r host writes.
++      Not needed if the surface state has resulted from previous SGX 2D/3=
D core writes.
++*/
++#define PVR2D_SURFACE_PDUMP                           0x00100000UL    // =
calls PVRSRVPDumpMem to capture the surface (pdump builds only)
++
++/*
++      Low level 3D format extension - for blts via the 3D core only.
++      If the top bit of the format field is set then PVR2D reads it as a =
PVRSRV_PIXEL_FORMAT.
++      The outcome is hardware dependant.
++      There is no guarantee that any specific PVRSRV format will be suppo=
rted.
++*/
++#define PVR2D_FORMAT_PVRSRV                           0x80000000
++
++/* wrap surface type */
++typedef enum
++{
++      PVR2D_WRAPFLAG_NONCONTIGUOUS =3D 0,
++      PVR2D_WRAPFLAG_CONTIGUOUS =3D 1,
++
++}PVR2DWRAPFLAGS;
++
++#define       PVR2D_CONTEXT_FLAGS_PRIORITY_MASK                       0x0=
0000003
++
++#define       PVR2D_CONTEXT_FLAGS_LOW_PRIORITY_CONTEXT        1
++#define       PVR2D_CONTEXT_FLAGS_NORMAL_PRIORITY_CONTEXT     0
++#define       PVR2D_CONTEXT_FLAGS_HIGH_PRIORITY_CONTEXT       2
++
++/* flags for control information of additional blits */
++typedef enum
++{
++      PVR2D_BLIT_DISABLE_ALL                                  =3D 0x00000=
000,   /* disable all additional controls */
++      PVR2D_BLIT_CK_ENABLE                                    =3D 0x00000=
001,   /* enable colour key */
++      PVR2D_BLIT_GLOBAL_ALPHA_ENABLE                  =3D 0x00000002,   /=
* enable standard global alpha */
++      PVR2D_BLIT_PERPIXEL_ALPHABLEND_ENABLE   =3D 0x00000004,   /* enable=
 per-pixel alpha bleding */
++      PVR2D_BLIT_PAT_SURFACE_ENABLE                   =3D 0x00000008,   /=
* enable pattern surf (disable fill) */
++      PVR2D_BLIT_FULLY_SPECIFIED_ALPHA_ENABLE =3D 0x00000010,   /* enable=
 fully specified alpha */
++      PVR2D_BLIT_ROT_90                                               =3D=
 0x00000020,   /* apply 90 degree rotation to the blt */
++      PVR2D_BLIT_ROT_180                                              =3D=
 0x00000040,   /* apply 180 degree rotation to the blt */
++      PVR2D_BLIT_ROT_270                                              =3D=
 0x00000080,   /* apply 270 degree rotation to the blt */
++      PVR2D_BLIT_COPYORDER_TL2BR                              =3D 0x00000=
100,   /* copy order overrides */
++      PVR2D_BLIT_COPYORDER_BR2TL                              =3D 0x00000=
200,
++      PVR2D_BLIT_COPYORDER_TR2BL                              =3D 0x00000=
400,
++      PVR2D_BLIT_COPYORDER_BL2TR                              =3D 0x00000=
800,
++      PVR2D_BLIT_COLKEY_SOURCE                                =3D 0x00001=
000,   /* Key colour is on the source surface */
++      PVR2D_BLIT_COLKEY_DEST                                  =3D 0x00002=
000,   /* Key colour is on the destination surface */
++      PVR2D_BLIT_COLKEY_MASKED                                =3D 0x00004=
000,   /* Mask enabled for colour key */
++      PVR2D_BLIT_COLKEY_OP_PASS                               =3D 0x00008=
000,   /* Colour key op =3D pass */
++      PVR2D_BLIT_COLKEY_OP_REJECT                             =3D 0x00010=
000,   /* Colour key op =3D reject */
++      PVR2D_BLIT_PATH_2DCORE                                  =3D 0x00100=
000,   /* Blt via dedicated 2D Core or PTLA */
++      PVR2D_BLIT_PATH_3DCORE                                  =3D 0x00200=
000,   /* Blt via 3D Core */
++      PVR2D_BLIT_PATH_SWBLT                                   =3D 0x00400=
000,   /* Blt via host software */
++      PVR2D_BLIT_NO_SRC_SYNC_INFO                             =3D 0x00800=
000,   /* Dont send a source sync info*/
++      PVR2D_BLIT_ISSUE_STATUS_UPDATES                 =3D 0x01000000,   /=
* Issue status updates */
++
++} PVR2DBLITFLAGS;
++
++/* standard alpha-blending functions, AlphaBlendingFunc field of PVR2DBLT=
INFO */
++typedef enum
++{
++      PVR2D_ALPHA_OP_SRC_DSTINV =3D 1,  /* source alpha : Cdst =3D Csrc*A=
src + Cdst*(1-Asrc) */
++      PVR2D_ALPHA_OP_SRCP_DSTINV =3D 2  /* premultiplied source alpha : C=
dst =3D Csrc + Cdst*(1-Asrc) */
++} PVR2D_ALPHABLENDFUNC;
++
++/* blend ops for fully specified alpha (SGX 2D Core only) */
++typedef enum
++{
++      PVR2D_BLEND_OP_ZERO =3D 0,
++      PVR2D_BLEND_OP_ONE =3D 1,
++      PVR2D_BLEND_OP_SRC =3D 2,
++      PVR2D_BLEND_OP_DST =3D 3,
++      PVR2D_BLEND_OP_GLOBAL =3D 4,
++      PVR2D_BLEND_OP_SRC_PLUS_GLOBAL =3D 5,
++      PVR2D_BLEND_OP_DST_PLUS_GLOBAL =3D 6
++}PVR2D_BLEND_OP;
++
++/* SGX 2D Core Fully specified alpha blend :  pAlpha field of PVR2DBLTINF=
O structure          */
++/* a fully specified Alpha Blend operation is defined as                 =
                                                     */
++/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (ALPHA_3 * DST (ALPHA))     =
                                               */
++/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (ALPHA_4 * DST (RGB))         =
                                                       */
++/* if the pre-multiplication stage is enabled then the equations become t=
he following:                */
++/* PRE_MUL     =3D ((SRC(A)) * (Global Alpha Value))                     =
                                                               */
++/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (PRE_MUL * DST (ALPHA))     =
                                               */
++/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (PRE_MUL * DST (RGB))         =
                                                       */
++/* if the transparent source alpha stage is enabled then a source alpha o=
f zero forces the    */
++/* source to be transparent for that pixel regardless of the blend equati=
on being used.               */
++typedef struct _PVR2D_ALPHABLT
++{
++      PVR2D_BLEND_OP  eAlpha1;
++      PVR2D_BOOL              bAlpha1Invert;
++      PVR2D_BLEND_OP  eAlpha2;
++      PVR2D_BOOL              bAlpha2Invert;
++      PVR2D_BLEND_OP  eAlpha3;
++      PVR2D_BOOL              bAlpha3Invert;
++      PVR2D_BLEND_OP  eAlpha4;
++      PVR2D_BOOL              bAlpha4Invert;
++      PVR2D_BOOL              bPremulAlpha;                   /* enable p=
re-multiplication stage */
++      PVR2D_BOOL              bTransAlpha;                    /* enable t=
ransparent source alpha stage */
++      PVR2D_BOOL              bUpdateAlphaLookup;             /* enable a=
nd update the 1555-Lookup alpha table */
++      PVR2D_UCHAR             uAlphaLookup0;                  /* 8 bit al=
pha when A=3D0 in a 1555-Lookup surface */
++      PVR2D_UCHAR             uAlphaLookup1;                  /* 8 bit al=
pha when A=3D1 in a 1555-Lookup surface */
++      PVR2D_UCHAR             uGlobalRGB;                             /* =
Global Alpha Value for RGB, 0=3Dtransparent 255=3Dopaque */
++      PVR2D_UCHAR             uGlobalA;                               /* =
Global Alpha Value for Alpha */
++
++} PVR2D_ALPHABLT, *PPVR2D_ALPHABLT;
++
++
++/* surface memory info structure */
++typedef struct _PVR2DMEMINFO
++{
++      PVR2D_VOID                      *pBase;
++      PVR2D_ULONG                     ui32MemSize;
++      PVR2D_ULONG                     ui32DevAddr;
++      PVR2D_ULONG                     ulFlags;
++      PVR2D_VOID                      *hPrivateData;
++      PVR2D_VOID                      *hPrivateMapData;
++
++}PVR2DMEMINFO, *PPVR2DMEMINFO;
++
++
++#define PVR2D_MAX_DEVICE_NAME 20
++
++typedef struct _PVR2DDEVICEINFO
++{
++      PVR2D_ULONG             ulDevID;
++      PVR2D_CHAR              szDeviceName[PVR2D_MAX_DEVICE_NAME];
++}PVR2DDEVICEINFO;
++
++
++typedef struct _PVR2DISPLAYINFO
++{
++      PVR2D_ULONG     ulMaxFlipChains;
++      PVR2D_ULONG     ulMaxBuffersInChain;
++      PVR2DFORMAT     eFormat;
++      PVR2D_ULONG     ulWidth;
++      PVR2D_ULONG     ulHeight;
++      PVR2D_LONG      lStride;
++      PVR2D_ULONG     ulMinFlipInterval;
++      PVR2D_ULONG     ulMaxFlipInterval;
++
++}PVR2DDISPLAYINFO;
++
++
++typedef struct _PVR2MISCDISPLAYINFO
++{
++      PVR2D_ULONG ulPhysicalWidthmm;
++      PVR2D_ULONG ulPhysicalHeightmm;
++      PVR2D_ULONG ulUnused[10];
++
++}PVR2DMISCDISPLAYINFO;
++
++
++typedef struct _PVR2DBLTINFO
++{
++      PVR2D_ULONG             CopyCode;                       /* rop code=
  */
++      PVR2D_ULONG             Colour;                         /* fill col=
our */
++      PVR2D_ULONG             ColourKey;                      /* colour k=
ey argb8888 (see CKEY_ defs below) */
++      PVR2D_UCHAR             GlobalAlphaValue;       /* global alpha ble=
nding */
++      PVR2D_UCHAR             AlphaBlendingFunc;      /* per-pixel alpha-=
blending function */
++
++      PVR2DBLITFLAGS  BlitFlags;                      /* additional blit =
control information */
++
++      PVR2DMEMINFO    *pDstMemInfo;           /* destination memory */
++      PVR2D_ULONG             DstOffset;                      /* byte off=
set from start of allocation to destination surface pixel 0,0 */
++      PVR2D_LONG              DstStride;                      /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
++      PVR2D_LONG              DstX, DstY;                     /* pixel of=
fset from start of dest surface to start of blt rectangle */
++      PVR2D_LONG              DSizeX,DSizeY;          /* blt size */
++      PVR2DFORMAT             DstFormat;                      /* dest for=
mat */
++      PVR2D_ULONG             DstSurfWidth;           /* size of dest sur=
face in pixels */
++      PVR2D_ULONG             DstSurfHeight;          /* size of dest sur=
face in pixels */
++
++      PVR2DMEMINFO    *pSrcMemInfo;           /* source mem, (source fiel=
ds are also used for patterns) */
++      PVR2D_ULONG             SrcOffset;                      /* byte off=
set from start of allocation to src/pat surface pixel 0,0 */
++      PVR2D_LONG              SrcStride;                      /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
++      PVR2D_LONG              SrcX, SrcY;                     /* pixel of=
fset from start of surface to start of source rectangle */
++                                                                         =
     /* for patterns this is the start offset within the pattern */
++      PVR2D_LONG              SizeX,SizeY;            /* source rectangle=
 size or pattern size in pixels */
++      PVR2DFORMAT             SrcFormat;                      /* source/p=
attern format */
++      PVR2DMEMINFO    *pPalMemInfo;           /* source/pattern palette m=
emory containing argb8888 colour table */
++      PVR2D_ULONG             PalOffset;                      /* byte off=
set from start of allocation to start of palette */
++      PVR2D_ULONG             SrcSurfWidth;           /* size of source s=
urface in pixels */
++      PVR2D_ULONG             SrcSurfHeight;          /* size of source s=
urface in pixels */
++
++      PVR2DMEMINFO    *pMaskMemInfo;          /* mask memory, 1bpp format=
 implied */
++      PVR2D_ULONG             MaskOffset;                     /* byte off=
set from start of allocation to mask surface pixel 0,0 */
++      PVR2D_LONG              MaskStride;                     /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
++      PVR2D_LONG              MaskX, MaskY;           /* mask rect top le=
ft (mask size =3D blt size) */
++      PVR2D_ULONG             MaskSurfWidth;          /* size of mask sur=
face in pixels */
++      PVR2D_ULONG             MaskSurfHeight;         /* size of mask sur=
face in pixels */
++
++      PPVR2D_ALPHABLT pAlpha;                         /* fully specified =
alpha blend (2DCore only) */
++
++      PVR2D_ULONG             uSrcChromaPlane1;       /* mem offset from =
start of source alloc to chroma plane 1 */
++      PVR2D_ULONG             uSrcChromaPlane2;       /* mem offset from =
start of source alloc to chroma plane 2 */
++      PVR2D_ULONG             uDstChromaPlane1;       /* mem offset from =
start of dest alloc to chroma plane 1 */
++      PVR2D_ULONG             uDstChromaPlane2;       /* mem offset from =
start of dest alloc to chroma plane 2 */
++
++      PVR2D_ULONG             ColourKeyMask;          /* 32 bit colour ke=
y mask, only valid when PVR2D_BLIT_COLKEY_MASKED is set */
++
++}PVR2DBLTINFO, *PPVR2DBLTINFO;
++
++typedef struct _PVR2DRECT
++{
++      PVR2D_LONG left, top;
++      PVR2D_LONG right, bottom;
++} PVR2DRECT;
++
++typedef struct
++{
++      PVR2DMEMINFO    *pSurfMemInfo;          /* surface memory */
++      PVR2D_ULONG             SurfOffset;                     /* byte off=
set from start of allocation to destination surface pixel 0,0 */
++      PVR2D_LONG              Stride;                         /* signed s=
tride */
++      PVR2DFORMAT             Format;                         /* format *=
/
++      PVR2D_ULONG             SurfWidth;                      /* surface =
width in pixels */
++      PVR2D_ULONG             SurfHeight;                     /* surface =
height in pixels */
++
++} PVR2D_SURFACE, *PPVR2D_SURFACE;
++
++typedef struct
++{
++      PVR2D_ULONG             uChromaPlane1;          /* YUV multiplane -=
 byte offset from start of alloc to chroma plane 1 */
++      PVR2D_ULONG             uChromaPlane2;          /* YUV multiplane -=
 byte offset from start of alloc to chroma plane 2 */
++      PVR2D_LONG              Reserved[2];            /* Reserved, must b=
e zero */
++
++} PVR2D_SURFACE_EXT, *PPVR2D_SURFACE_EXT;
++
++typedef struct
++{
++      PVR2D_ULONG             *pUseCode;                                 =
     /* USSE code */
++      PVR2D_ULONG             UseCodeSize;                            /* =
usse code size in bytes */
++
++} PVR2D_USECODE, *PPVR2D_USECODE;
++
++typedef struct
++{
++      PVR2D_SURFACE                   sDst;                           /* =
destination surface */
++      PVR2D_SURFACE                   sSrc;                           /* =
source surface */
++      PVR2DRECT                               rcDest;                    =
     /* destination rectangle */
++      PVR2DRECT                               rcSource;                  =
     /* source rectangle */
++      PVR2D_HANDLE                    hUseCode;                       /* =
custom USE code (NULL implies source copy) */
++      PVR2D_ULONG                             UseParams[2];           /* =
per-blt params for use code */
++
++} PVR2D_3DBLT, *PPVR2D_3DBLT;
++
++typedef struct
++{
++      PVR2D_SURFACE                   sDst;                              =
             /* destination surface */
++      PVR2DRECT                               rcDest;                    =
                     /* destination rectangle; scaling is supported */
++      PVR2D_SURFACE                   sSrc;                              =
             /* source surface */
++      PVR2DRECT                               rcSource;                  =
                     /* source rectangle; scaling is supported */
++      PPVR2D_SURFACE                  pSrc2;                             =
             /* optional second source surface (NULL if not required) */
++      PVR2DRECT*                              prcSource2;                =
                     /* optional pSrc2 rectangle */
++      PVR2D_HANDLE                    hUseCode;                          =
             /* custom USSE shader code (NULL implies default source copy) =
*/
++      PVR2D_ULONG                             UseParams[2];              =
             /* per-blt params for usse code */
++      PVR2D_ULONG                             uiNumTemporaryRegisters;   =
     /* no. of temporary registers used in custom shader code */
++      PVR2D_BOOL                              bDisableDestInput;         =
             /* set true if the destination is output only */
++      PPVR2D_SURFACE_EXT              pDstExt;                           =
             /* Extended format params for dest */
++      PPVR2D_SURFACE_EXT              pSrcExt[2];                        =
             /* Extended format params for source 1 and 2 */
++      PVR2D_LONG                              Reserved[4];               =
             /* Reserved, must be zero */
++
++} PVR2D_3DBLT_EXT, *PPVR2D_3DBLT_EXT;
++
++
++#define MAKE_COPY_BLIT(src,soff,dest,doff,sx,sy,dx,dy,sz)
++
++typedef void* PVR2DCONTEXTHANDLE;
++typedef void* PVR2DFLIPCHAINHANDLE;
++
++
++// CopyCode field of PVR2DBLTINFO structure:
++// the CopyCode field of the PVR2DBLTINFO structure should contain a rop3=
 or rop4 code.
++// a rop3 is an 8 bit code that describes a blt with three inputs : sourc=
e dest and pattern
++// rop4 is a 16 bit code that describes a blt with four inputs : source d=
est pattern and mask
++// common rop3 codes are defined below
++// a colour fill blt is processed in the pattern channel as a constant co=
lour with a rop code of 0xF0
++// PVR2D_BLIT_PAT_SURFACE_ENABLE defines whether the pattern channel is a=
 surface or a fill colour.
++// a rop4 is defined by two rop3 codes, and the 1 bit-per-pixel mask surf=
ace defines which is used.
++// a common rop4 is 0xAAF0 which is the mask copy blt used for text glyph=
s.
++// CopyCode is taken to be a rop4 when pMaskMemInfo is non zero, otherwis=
e it is assumed to be a rop3
++// use the PVR2DMASKROP4 macro below to construct a rop4 from two rop3's
++// rop3a is the rop used when mask pixel =3D 1, and rop3b when mask =3D 0
++#define PVR2DROP4(rop3b, rop3a)                       ((rop3b<<8)|rop3a)
++
++/* common rop codes */
++#define PVR2DROPclear                         0x00       /* 0 (whiteness)=
 */
++#define PVR2DROPset                                   0xFF       /* 1 (bl=
ackness) */
++#define PVR2DROPnoop                          0xAA       /* dst (used for=
 masked blts) */
++
++/* source and  dest rop codes */
++#define PVR2DROPand                                   0x88       /* src A=
ND dst */
++#define PVR2DROPandReverse                    0x44       /* src AND NOT d=
st */
++#define PVR2DROPcopy                          0xCC       /* src (used for=
 source copy and alpha blts) */
++#define PVR2DROPandInverted                   0x22       /* NOT src AND d=
st */
++#define PVR2DROPxor                                   0x66       /* src X=
OR dst */
++#define PVR2DROPor                                    0xEE       /* src O=
R dst */
++#define PVR2DROPnor                                   0x11       /* NOT s=
rc AND NOT dst */
++#define PVR2DROPequiv                         0x99       /* NOT src XOR d=
st */
++#define PVR2DROPinvert                                0x55       /* NOT d=
st */
++#define PVR2DROPorReverse                     0xDD       /* src OR NOT ds=
t */
++#define PVR2DROPcopyInverted          0x33       /* NOT src */
++#define PVR2DROPorInverted                    0xBB       /* NOT src OR ds=
t */
++#define PVR2DROPnand                          0x77       /* NOT src OR NO=
T dst */
++
++/* pattern rop codes */
++#define PVR2DPATROPand                                0xA0       /* pat A=
ND dst */
++#define PVR2DPATROPandReverse         0x50       /* pat AND NOT dst */
++#define PVR2DPATROPcopy                               0xF0       /* pat (=
used for solid color fills and pattern blts) */
++#define PVR2DPATROPandInverted                0x0A       /* NOT pat AND d=
st */
++#define PVR2DPATROPxor                                0x5A       /* pat X=
OR dst */
++#define PVR2DPATROPor                         0xFA       /* pat OR dst */
++#define PVR2DPATROPnor                                0x05       /* NOT p=
at AND NOT dst */
++#define PVR2DPATROPequiv                      0xA5       /* NOT pat XOR d=
st */
++#define PVR2DPATROPinvert                     0x55       /* NOT dst */
++#define PVR2DPATROPorReverse          0xF5       /* pat OR NOT dst */
++#define PVR2DPATROPcopyInverted               0x0F       /* NOT pat */
++#define PVR2DPATROPorInverted         0xAF       /* NOT pat OR dst */
++#define PVR2DPATROPnand                               0x5F       /* NOT p=
at OR NOT dst */
++
++/* common rop4 codes */
++#define PVR2DROP4MaskedCopy              PVR2DROP4(PVR2DROPnoop,PVR2DROPc=
opy)         /* masked source copy blt (used for rounded window corners etc=
) */
++#define PVR2DROP4MaskedFill              PVR2DROP4(PVR2DROPnoop,PVR2DPATR=
OPcopy)      /* masked colour fill blt (used for text) */
++
++/* Legacy support */
++#define PVR2DROP3_PATMASK                     PVR2DPATROPcopy
++#define PVR2DROP3_SRCMASK                     PVR2DROPcopy
++
++/* pixmap memory alignment */
++#define PVR2D_ALIGNMENT_4                     4                       /* =
DWORD alignment */
++#define PVR2D_ALIGNMENT_ANY                   0                       /* =
no alignment    */
++#define PVR2D_ALIGNMENT_PALETTE               16                      /* =
16 byte alignment is required for palettes */
++
++/* Heap number for PVR2DGetFrameBuffer */
++#define PVR2D_FB_PRIMARY_SURFACE 0
++
++#define PVR2D_PRESENT_PROPERTY_SRCSTRIDE      (1UL << 0)
++#define PVR2D_PRESENT_PROPERTY_DSTSIZE                (1UL << 1)
++#define PVR2D_PRESENT_PROPERTY_DSTPOS         (1UL << 2)
++#define PVR2D_PRESENT_PROPERTY_CLIPRECTS      (1UL << 3)
++#define PVR2D_PRESENT_PROPERTY_INTERVAL               (1UL << 4)
++
++#define PVR2D_CREATE_FLIPCHAIN_SHARED         (1UL << 0)
++#define PVR2D_CREATE_FLIPCHAIN_QUERY          (1UL << 1)
++#define PVR2D_CREATE_FLIPCHAIN_OEMOVERLAY   (1UL << 2)
++#define PVR2D_CREATE_FLIPCHAIN_AS_BLITCHAIN (1UL << 3)
++
++/* Colour-key colour must be translated into argb8888 format */
++#define CKEY_8888(P)          (P)
++#define CKEY_4444(P)          (((P&0xF000UL)<<16) | ((P&0x0F00UL)<<12) | =
((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
++#define CKEY_1555(P)          (((P&0x8000UL)<<16) | ((P&0x7C00UL)<<9)  | =
((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
++#define CKEY_565(P)                   (((P&0xF800UL)<<8)  | ((P&0x7E0UL)<=
<5)   | ((P&0x1FUL)<<3))
++#define CKEY_MASK_8888                0x00FFFFFFUL
++#define CKEY_MASK_4444                0x00F0F0F0UL
++#define CKEY_MASK_1555                0x00F8F8F8UL    /* Alpha is not nor=
mally included in the key test */
++#define CKEY_MASK_565         0x00F8FCF8UL
++
++/* Fill colours must be translated into argb8888 format */
++#define CFILL_4444(P)         (((P&0xF000UL)<<16) | ((P&0x0F00UL)<<12) | =
((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
++#define CFILL_1555(P)         (((P&0x8000UL)<<16) | ((P&0x7C00UL)<<9)  | =
((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
++#define CFILL_565(P)          (((P&0xF800UL)<<8)  | ((P&0x7E0UL)<<5)   | =
((P&0x1FUL)<<3))
++
++/* PVR2DCreateDeviceContext flags */
++#define PVR2D_XSERVER_PROC                    0x00000001UL            /*!=
< Set for the Xserver connection */
++
++/* PVR2DMemAlloc flags */
++#define PVR2D_MEM_UNCACHED                    0x00000000UL    /* Default =
*/
++#define PVR2D_MEM_CACHED                      0x00000001UL    /* Caller m=
ust flush and sync when necessary */
++#define PVR2D_MEM_WRITECOMBINE                0x00000002UL
++
++/* Functions that the library exports */
++
++PVR2D_IMPORT
++int PVR2DEnumerateDevices(PVR2DDEVICEINFO *pDevInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DCreateDeviceContext(PVR2D_ULONG ulDevID,
++                                                                      PVR=
2DCONTEXTHANDLE* phContext,
++                                                                      PVR=
2D_ULONG ulFlags);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DDestroyDeviceContext(PVR2DCONTEXTHANDLE hContext);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetDeviceInfo(PVR2DCONTEXTHANDLE hContext,
++                                                        PVR2DDISPLAYINFO =
*pDisplayInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetMiscDisplayInfo(PVR2DCONTEXTHANDLE hContext,
++                                                        PVR2DMISCDISPLAYI=
NFO *pMiscDisplayInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetScreenMode(PVR2DCONTEXTHANDLE hContext,
++                                                        PVR2DFORMAT *pFor=
mat,
++                                                        PVR2D_LONG *plWid=
th,
++                                                        PVR2D_LONG *plHei=
ght,
++                                                        PVR2D_LONG *plStr=
ide,
++                                                        PVR2D_INT *piRefr=
eshRate);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetFrameBuffer(PVR2DCONTEXTHANDLE hContext,
++                                                         PVR2D_INT nHeap,
++                                                         PVR2DMEMINFO **p=
psMemInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DMemAlloc(PVR2DCONTEXTHANDLE hContext,
++                                               PVR2D_ULONG ulBytes,
++                                               PVR2D_ULONG ulAlign,
++                                               PVR2D_ULONG ulFlags,
++                                               PVR2DMEMINFO **ppsMemInfo)=
;
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DMemExport(PVR2DCONTEXTHANDLE hContext,
++                                               PVR2D_ULONG ulFlags,
++                                               PVR2DMEMINFO *psMemInfo,
++                                               PVR2D_HANDLE *phMemHandle)=
;
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DMemWrap(PVR2DCONTEXTHANDLE hContext,
++                                              PVR2D_VOID *pMem,
++                                              PVR2D_ULONG ulFlags,
++                                              PVR2D_ULONG ulBytes,
++                                              PVR2D_ULONG alPageAddress[]=
,
++                                              PVR2DMEMINFO **ppsMemInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DMemMap(PVR2DCONTEXTHANDLE hContext,
++                                              PVR2D_ULONG ulFlags,
++                                              PVR2D_HANDLE hMemHandle,
++                                              PVR2DMEMINFO **ppsDstMem);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DMemFree(PVR2DCONTEXTHANDLE hContext,
++                                              PVR2DMEMINFO *psMemInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DBlt(PVR2DCONTEXTHANDLE hContext,
++                                      PVR2DBLTINFO *pBltInfo);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DBltClipped(PVR2DCONTEXTHANDLE hContext,
++                                                 PVR2DBLTINFO *pBltInfo,
++                                                 PVR2D_ULONG ulNumClipRec=
ts,
++                                                 PVR2DRECT *pClipRects);
++
++PVR2D_EXPORT
++PVR2DERROR PVR2DSet1555Alpha (PVR2DCONTEXTHANDLE hContext,
++                                                        PVR2D_UCHAR Alpha=
0, PVR2D_UCHAR Alpha1);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DQueryBlitsComplete(PVR2DCONTEXTHANDLE hContext,
++                                                                 const PV=
R2DMEMINFO *pMemInfo,
++                                                                 PVR2D_UI=
NT uiWaitForComplete);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DSetPresentBltProperties(PVR2DCONTEXTHANDLE hContext,
++                                                                         =
     PVR2D_ULONG ulPropertyMask,
++                                                                         =
     PVR2D_LONG lSrcStride,
++                                                                         =
     PVR2D_ULONG ulDstWidth,
++                                                                         =
     PVR2D_ULONG ulDstHeight,
++                                                                         =
     PVR2D_LONG lDstXPos,
++                                                                         =
     PVR2D_LONG lDstYPos,
++                                                                         =
     PVR2D_ULONG ulNumClipRects,
++                                                                         =
     PVR2DRECT *pClipRects,
++                                                                         =
     PVR2D_ULONG ulSwapInterval);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DPresentBlt(PVR2DCONTEXTHANDLE hContext,
++                                                 PVR2DMEMINFO *pMemInfo,
++                                                 PVR2D_LONG lRenderID);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DCreateFlipChain(PVR2DCONTEXTHANDLE hContext,
++                                                              PVR2D_ULONG=
 ulFlags,
++                                                              PVR2D_ULONG=
 ulNumBuffers,
++                                                              PVR2D_ULONG=
 ulWidth,
++                                                              PVR2D_ULONG=
 ulHeight,
++                                                              PVR2DFORMAT=
 eFormat,
++                                                              PVR2D_LONG =
*plStride,
++                                                              PVR2D_ULONG=
 *pulFlipChainID,
++                                                              PVR2DFLIPCH=
AINHANDLE *phFlipChain);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DDestroyFlipChain(PVR2DCONTEXTHANDLE hContext,
++                                                               PVR2DFLIPC=
HAINHANDLE hFlipChain);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetFlipChainBuffers(PVR2DCONTEXTHANDLE hContext,
++                                                                      PVR=
2DFLIPCHAINHANDLE hFlipChain,
++                                                                      PVR=
2D_ULONG *pulNumBuffers,
++                                                                      PVR=
2DMEMINFO *psMemInfo[]);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DSetPresentFlipProperties(PVR2DCONTEXTHANDLE hContext,
++                                                                         =
      PVR2DFLIPCHAINHANDLE hFlipChain,
++                                                                         =
      PVR2D_ULONG ulPropertyMask,
++                                                                         =
      PVR2D_LONG lDstXPos,
++                                                                         =
      PVR2D_LONG lDstYPos,
++                                                                         =
      PVR2D_ULONG ulNumClipRects,
++                                                                         =
      PVR2DRECT *pClipRects,
++                                                                         =
      PVR2D_ULONG ulSwapInterval);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DPresentFlip(PVR2DCONTEXTHANDLE hContext,
++                                                      PVR2DFLIPCHAINHANDL=
E hFlipChain,
++                                                      PVR2DMEMINFO *psMem=
Info,
++                                                      PVR2D_LONG lRenderI=
D);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DGetAPIRev(PVR2D_LONG *lRevMajor, PVR2D_LONG *lRevMinor);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DLoadUseCode (const PVR2DCONTEXTHANDLE hContext, const PVR=
2D_UCHAR     *pUseCode,
++                                                                      con=
st PVR2D_ULONG UseCodeSize, PVR2D_HANDLE *pUseCodeHandle);
++PVR2D_IMPORT
++PVR2DERROR PVR2DFreeUseCode (const PVR2DCONTEXTHANDLE hContext, const PVR=
2D_HANDLE hUseCodeHandle);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DBlt3D (const PVR2DCONTEXTHANDLE hContext, const PPVR2D_3D=
BLT pBlt3D);
++
++PVR2D_IMPORT
++PVR2DERROR PVR2DBlt3DExt (const PVR2DCONTEXTHANDLE hContext, const PPVR2D=
_3DBLT_EXT pBlt3D);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* _PVR2D_H_ */
++
++/************************************************************************=
******
++ End of file (pvr2d.h)
++*************************************************************************=
*****/
+diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/w=
segl2/wsegl.h qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl=
2/wsegl.h
+--- qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/wsegl2/w=
segl.h       1970-01-01 00:00:00.000000000 +0000
++++ qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/wsegl.h=
     2011-05-16 22:51:52.702601769 +0000
+@@ -0,0 +1,285 @@
++/**********************************************************************
++*
++* Copyright(c) Imagination Technologies Ltd.
++*
++* The contents of this file are subject to the MIT license as set out bel=
ow.
++*
++* Permission is hereby granted, free of charge, to any person obtaining a=
 copy
++* of this software and associated documentation files (the "Software"),
++* to deal in the Software without restriction, including without limitati=
on
++* the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
++* and/or sell copies of the Software, and to permit persons to whom the
++* Software is furnished to do so, subject to the following conditions:
++*
++* The above copyright notice and this permission notice shall be included
++* in all copies or substantial portions of the Software.
++*
++* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
++* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CL=
AIM,
++* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
++* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
++* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++*
++* This License is also included in this distribution in the file called
++* "COPYING".
++*
++*************************************************************************=
*****/
++
++
++
++#if !defined(__WSEGL_H__)
++#define __WSEGL_H__
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++// WSEGL Platform-specific definitions
++*/
++#if defined(__linux__)
++#define WSEGL_EXPORT __attribute__((visibility("default")))
++#define WSEGL_IMPORT
++#else
++#define WSEGL_EXPORT
++#define WSEGL_IMPORT
++#endif
++
++/*
++// WSEGL API Version Number
++*/
++
++#define WSEGL_VERSION 2
++#define WSEGL_DEFAULT_DISPLAY 0
++#define WSEGL_DEFAULT_NATIVE_ENGINE 0
++
++#define WSEGL_FALSE           0
++#define WSEGL_TRUE            1
++#define WSEGL_NULL            0
++
++#define       WSEGL_UNREFERENCED_PARAMETER(param) (param) =3D (param)
++
++/*
++// WSEGL handles
++*/
++typedef void *WSEGLDisplayHandle;
++typedef void *WSEGLDrawableHandle;
++
++/*
++// Display capability type
++*/
++typedef enum WSEGLCapsType_TAG
++{
++      WSEGL_NO_CAPS =3D 0,
++      WSEGL_CAP_MIN_SWAP_INTERVAL =3D 1, /* System default value =3D 1 */
++      WSEGL_CAP_MAX_SWAP_INTERVAL =3D 2, /* System default value =3D 1 */
++      WSEGL_CAP_WINDOWS_USE_HW_SYNC =3D 3, /* System default value =3D 0 =
(FALSE) */
++      WSEGL_CAP_PIXMAPS_USE_HW_SYNC =3D 4, /* System default value =3D 0 =
(FALSE) */
++
++} WSEGLCapsType;
++
++/*
++// Display capability
++*/
++typedef struct WSEGLCaps_TAG
++{
++      WSEGLCapsType eCapsType;
++      unsigned long ui32CapsValue;
++
++} WSEGLCaps;
++
++/*
++// Drawable type
++*/
++#define WSEGL_NO_DRAWABLE                     0x0
++#define WSEGL_DRAWABLE_WINDOW         0x1
++#define WSEGL_DRAWABLE_PIXMAP         0x2
++
++
++/*
++// Pixel format of display/drawable
++*/
++typedef enum WSEGLPixelFormat_TAG
++{
++      /* These must not be re-ordered */
++      WSEGL_PIXELFORMAT_RGB565        =3D 0,
++      WSEGL_PIXELFORMAT_ARGB4444      =3D 1,
++      WSEGL_PIXELFORMAT_ARGB8888      =3D 2,
++      WSEGL_PIXELFORMAT_ARGB1555      =3D 3,
++      WSEGL_PIXELFORMAT_ABGR8888      =3D 4,
++      WSEGL_PIXELFORMAT_XBGR8888      =3D 5,
++
++      /* These are compatibility names only; new WSEGL
++       * modules should not use them.
++       */
++      WSEGL_PIXELFORMAT_565           =3D WSEGL_PIXELFORMAT_RGB565,
++      WSEGL_PIXELFORMAT_4444          =3D WSEGL_PIXELFORMAT_ARGB4444,
++      WSEGL_PIXELFORMAT_8888          =3D WSEGL_PIXELFORMAT_ARGB8888,
++      WSEGL_PIXELFORMAT_1555          =3D WSEGL_PIXELFORMAT_ARGB1555,
++
++} WSEGLPixelFormat;
++
++/*
++// Transparent of display/drawable
++*/
++typedef enum WSEGLTransparentType_TAG
++{
++      WSEGL_OPAQUE =3D 0,
++      WSEGL_COLOR_KEY =3D 1,
++
++} WSEGLTransparentType;
++
++/*
++// Display/drawable configuration
++*/
++typedef struct WSEGLConfig_TAG
++{
++      /*
++      // Type of drawables this configuration applies to -
++      // OR'd values of drawable types.
++      */
++      unsigned long ui32DrawableType;
++
++      /* Pixel format */
++      WSEGLPixelFormat ePixelFormat;
++
++      /* Native Renderable  - set to WSEGL_TRUE if native renderable */
++      unsigned long ulNativeRenderable;
++
++      /* FrameBuffer Level Parameter */
++      unsigned long ulFrameBufferLevel;
++
++      /* Native Visual ID */
++      unsigned long ulNativeVisualID;
++
++      /* Native Visual */
++      void *hNativeVisual;
++
++      /* Transparent Type */
++      WSEGLTransparentType eTransparentType;
++
++      /* Transparent Color - only used if transparent type is COLOR_KEY *=
/
++      unsigned long ulTransparentColor; /* packed as 0x00RRGGBB */
++
++
++} WSEGLConfig;
++
++/*
++// WSEGL errors
++*/
++typedef enum WSEGLError_TAG
++{
++      WSEGL_SUCCESS =3D 0,
++      WSEGL_CANNOT_INITIALISE =3D 1,
++      WSEGL_BAD_NATIVE_DISPLAY =3D 2,
++      WSEGL_BAD_NATIVE_WINDOW =3D 3,
++      WSEGL_BAD_NATIVE_PIXMAP =3D 4,
++      WSEGL_BAD_NATIVE_ENGINE =3D 5,
++      WSEGL_BAD_DRAWABLE =3D 6,
++      WSEGL_BAD_MATCH =3D 7,
++      WSEGL_OUT_OF_MEMORY =3D 8,
++
++      /* These are compatibility names only; new WSEGL
++       * modules should not use them.
++       */
++      WSEGL_BAD_CONFIG =3D WSEGL_BAD_MATCH,
++
++} WSEGLError;
++
++/*
++// Drawable orientation (in degrees anti-clockwise)
++*/
++typedef enum WSEGLRotationAngle_TAG
++{
++      WSEGL_ROTATE_0 =3D 0,
++      WSEGL_ROTATE_90 =3D 1,
++      WSEGL_ROTATE_180 =3D 2,
++      WSEGL_ROTATE_270 =3D 3
++
++} WSEGLRotationAngle;
++
++/*
++// Drawable information required by OpenGL-ES driver
++*/
++typedef struct WSEGLDrawableParams_TAG
++{
++      /* Width in pixels of the drawable */
++      unsigned long   ui32Width;
++
++      /* Height in pixels of the drawable */
++      unsigned long   ui32Height;
++
++      /* Stride in pixels of the drawable */
++      unsigned long   ui32Stride;
++
++      /* Pixel format of the drawable */
++      WSEGLPixelFormat        ePixelFormat;
++
++      /* User space cpu virtual address of the drawable */
++      void                    *pvLinearAddress;
++
++      /* HW address of the drawable */
++      unsigned long   ui32HWAddress;
++
++      /* Private data for the drawable */
++      void                    *hPrivateData;
++
++
++} WSEGLDrawableParams;
++
++
++/*
++// Table of function pointers that is returned by WSEGL_GetFunctionTableP=
ointer()
++//
++// The first entry in the table is the version number of the wsegl.h head=
er file that
++// the module has been written against, and should therefore be set to WS=
EGL_VERSION
++*/
++typedef struct WSEGL_FunctionTable_TAG
++{
++      unsigned long ui32WSEGLVersion;
++
++      WSEGLError (*pfnWSEGL_IsDisplayValid)(NativeDisplayType);
++
++      WSEGLError (*pfnWSEGL_InitialiseDisplay)(NativeDisplayType, WSEGLDi=
splayHandle *, const WSEGLCaps **, WSEGLConfig **);
++
++      WSEGLError (*pfnWSEGL_CloseDisplay)(WSEGLDisplayHandle);
++
++      WSEGLError (*pfnWSEGL_CreateWindowDrawable)(WSEGLDisplayHandle, WSE=
GLConfig *, WSEGLDrawableHandle *, NativeWindowType, WSEGLRotationAngle *);
++
++      WSEGLError (*pfnWSEGL_CreatePixmapDrawable)(WSEGLDisplayHandle, WSE=
GLConfig *, WSEGLDrawableHandle *, NativePixmapType, WSEGLRotationAngle *);
++
++      WSEGLError (*pfnWSEGL_DeleteDrawable)(WSEGLDrawableHandle);
++
++      WSEGLError (*pfnWSEGL_SwapDrawable)(WSEGLDrawableHandle, unsigned l=
ong);
++
++      WSEGLError (*pfnWSEGL_SwapControlInterval)(WSEGLDrawableHandle, uns=
igned long);
++
++      WSEGLError (*pfnWSEGL_WaitNative)(WSEGLDrawableHandle, unsigned lon=
g);
++
++      WSEGLError (*pfnWSEGL_CopyFromDrawable)(WSEGLDrawableHandle, Native=
PixmapType);
++
++      WSEGLError (*pfnWSEGL_CopyFromPBuffer)(void *, unsigned long, unsig=
ned long, unsigned long, WSEGLPixelFormat, NativePixmapType);
++
++      WSEGLError (*pfnWSEGL_GetDrawableParameters)(WSEGLDrawableHandle, W=
SEGLDrawableParams *, WSEGLDrawableParams *);
++
++      WSEGLError (*pfnWSEGL_ConnectDrawable)(WSEGLDrawableHandle);
++
++      WSEGLError (*pfnWSEGL_DisconnectDrawable)(WSEGLDrawableHandle);
++
++
++} WSEGL_FunctionTable;
++
++
++WSEGL_IMPORT const WSEGL_FunctionTable *WSEGL_GetFunctionTablePointer(voi=
d);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __WSEGL_H__ */
++
++/************************************************************************=
******
++ End of file (wsegl.h)
++*************************************************************************=
*****/
+diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/plugins/gfxdrivers=
/powervr/QWSWSEGL/pvrqwswsegl.c qt-everywhere-opensource-src-4.6.3/src/plug=
ins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
+--- qt-everywhere-opensource-src-4.6.3-orig//src/plugins/gfxdrivers/powerv=
r/QWSWSEGL/pvrqwswsegl.c     2010-06-02 02:03:17.000000000 +0000
++++ qt-everywhere-opensource-src-4.6.3/src/plugins/gfxdrivers/powervr/QWSW=
SEGL/pvrqwswsegl.c   2011-05-16 23:08:51.618597097 +0000
+@@ -378,6 +378,20 @@ static WSEGLError wseglGetDrawableParame
+     return WSEGL_SUCCESS;
+ }
+
++/* Function stub for ConnectDrawable() */
++static WSEGLError wseglConnectDrawable(WSEGLDrawableHandle hDrawable)
++{
++    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
++    return WSEGL_SUCCESS;
++}
++
++/* Function stub for DisconnectDrawable() */
++static WSEGLError wseglDisconnectDrawable(WSEGLDrawableHandle hDrawable)
++{
++    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
++    return WSEGL_SUCCESS;
++}
++
+ static WSEGL_FunctionTable const wseglFunctions =3D {
+     WSEGL_VERSION,
+     wseglIsDisplayValid,
+@@ -391,7 +405,9 @@ static WSEGL_FunctionTable const wseglFu
+     wseglWaitNative,
+     wseglCopyFromDrawable,
+     wseglCopyFromPBuffer,
+-    wseglGetDrawableParameters
++    wseglGetDrawableParameters,
++    wseglConnectDrawable,
++    wseglDisconnectDrawable
+ };
+
+ /* Return the table of WSEGL functions to the EGL implementation */
diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
index 36c6a56..1d5df70 100644
--- a/recipes/qt4/qt-4.6.3.inc
+++ b/recipes/qt4/qt-4.6.3.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-everywh=
ere-opensource-src-${PV}.
            file://0010-no-simpledecoration-example.patch \
            file://fix-config-tests.patch \
            file://qt-config.patch \
+           file://0001-wsegl2-support.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch b/recipes/qt4/q=
t-4.7.3/0001-wsegl2-support.patch
deleted file mode 100644
index ad61fe7..0000000
--- a/recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch
+++ /dev/null
@@ -1,997 +0,0 @@
-diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/w=
segl2/pvr2d.h qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl=
2/pvr2d.h
---- qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/wsegl2/p=
vr2d.h       1970-01-01 00:00:00.000000000 +0000
-+++ qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/pvr2d.h=
     2011-05-16 22:51:43.158564336 +0000
-@@ -0,0 +1,669 @@
-+/**********************************************************************
-+*
-+* Copyright(c) Imagination Technologies Ltd.
-+*
-+* The contents of this file are subject to the MIT license as set out bel=
ow.
-+*
-+* Permission is hereby granted, free of charge, to any person obtaining a=
 copy
-+* of this software and associated documentation files (the "Software"),
-+* to deal in the Software without restriction, including without limitati=
on
-+* the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
-+* and/or sell copies of the Software, and to permit persons to whom the
-+* Software is furnished to do so, subject to the following conditions:
-+*
-+* The above copyright notice and this permission notice shall be included
-+* in all copies or substantial portions of the Software.
-+*
-+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-+* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
-+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-+* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CL=
AIM,
-+* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
-+* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
-+* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-+*
-+* This License is also included in this distribution in the file called
-+* "COPYING".
-+*
-+*************************************************************************=
*****/
-+
-+
-+
-+/************************************************************************=
******
-+Modifications :-
-+$Log: pvr2d.h $
-+
-+ --- Revision Logs Removed ---
-+*************************************************************************=
*****/
-+
-+#ifndef _PVR2D_H_
-+#define _PVR2D_H_
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/* PVR2D Platform-specific definitions */
-+#if defined (__linux__)
-+#define PVR2D_EXPORT __attribute__((visibility("default")))
-+#define PVR2D_IMPORT
-+#else
-+#define PVR2D_EXPORT
-+#define PVR2D_IMPORT
-+#endif
-+
-+/* PVR2D header revision */
-+#define PVR2D_REV_MAJOR               3
-+#define PVR2D_REV_MINOR               5
-+
-+/* Basic types */
-+typedef enum
-+{
-+      PVR2D_FALSE =3D 0,
-+      PVR2D_TRUE
-+} PVR2D_BOOL;
-+
-+typedef void* PVR2D_HANDLE;
-+
-+typedef char             PVR2D_CHAR,  *PVR2D_PCHAR;
-+typedef unsigned char    PVR2D_UCHAR, *PVR2D_PUCHAR;
-+typedef int              PVR2D_INT,           *PVR2D_PINT;
-+typedef unsigned int     PVR2D_UINT,  *PVR2D_PUINT;
-+typedef long             PVR2D_LONG,  *PVR2D_PLONG;
-+typedef unsigned long    PVR2D_ULONG, *PVR2D_PULONG;
-+
-+typedef void             PVR2D_VOID,  *PVR2D_PVOID;
-+
-+
-+/* error codes */
-+typedef enum
-+{
-+      PVR2D_OK =3D 0,
-+      PVR2DERROR_INVALID_PARAMETER =3D -1,
-+      PVR2DERROR_DEVICE_UNAVAILABLE =3D -2,
-+      PVR2DERROR_INVALID_CONTEXT =3D -3,
-+      PVR2DERROR_MEMORY_UNAVAILABLE =3D -4,
-+      PVR2DERROR_DEVICE_NOT_PRESENT =3D -5,
-+      PVR2DERROR_IOCTL_ERROR =3D -6,
-+      PVR2DERROR_GENERIC_ERROR =3D -7,
-+      PVR2DERROR_BLT_NOTCOMPLETE =3D -8,
-+      PVR2DERROR_HW_FEATURE_NOT_SUPPORTED =3D -9,
-+      PVR2DERROR_NOT_YET_IMPLEMENTED =3D -10,
-+      PVR2DERROR_MAPPING_FAILED =3D -11
-+}PVR2DERROR;
-+
-+/* 32 bit PVR2D pixel format specifier */
-+typedef unsigned long PVR2DFORMAT;
-+
-+/* Standard PVR2D pixel formats */
-+#define       PVR2D_1BPP                                              0x0=
0UL // 1bpp mask surface or palletized 1 bit source with 2x32 bit CLUT
-+#define       PVR2D_RGB565                                    0x01UL // C=
ommon rgb 565 format
-+#define       PVR2D_ARGB4444                                  0x02UL // C=
ommon argb 4444 format
-+#define       PVR2D_RGB888                                    0x03UL // C=
ommon rgb 888 format (not supported)
-+#define       PVR2D_ARGB8888                                  0x04UL // C=
ommon argb 8888 format
-+#define       PVR2D_ARGB1555                                  0x05UL // C=
ommon argb 1555 format
-+#define       PVR2D_ALPHA8                                    0x06UL // A=
lpha-only 8 bit per pixel (used with a constant fill colour)
-+#define       PVR2D_ALPHA4                                    0x07UL // A=
lpha-only 4 bits per pixel (used with a constant fill colour)
-+#define       PVR2D_PAL2                                              0x0=
8UL // Palletized 2 bit format (requires   4x32 bit CLUT)
-+#define       PVR2D_PAL4                                              0x0=
9UL // Palletized 4 bit format (requires  16x32 bit CLUT)
-+#define       PVR2D_PAL8                                              0x0=
AUL // Palletized 8 bit format (requires 256x32 bit CLUT)
-+#define PVR2D_U8                                              0x10UL // m=
onochrome unsigned 8 bit
-+#define PVR2D_U88                                             0x11UL // m=
onochrome unsigned 16 bit
-+#define PVR2D_S8                                              0x12UL // s=
igned 8 bit
-+#define PVR2D_YUV422_YUYV                             0x13UL // YUV 422 l=
ow-high byte order Y0UY1V
-+#define PVR2D_YUV422_UYVY                             0x14UL // YUV 422 l=
ow-high byte order UY0VY1
-+#define PVR2D_YUV422_YVYU                             0x15UL // YUV 422 l=
ow-high byte order Y0VY1U
-+#define PVR2D_YUV422_VYUY                             0x16UL // YUV 422 l=
ow-high byte order VY0UY1
-+#define PVR2D_YUV420_2PLANE                           0x17UL // YUV420 2 =
Plane
-+#define PVR2D_YUV420_3PLANE                           0x18UL // YUV420 3 =
Plane
-+#define PVR2D_2101010ARGB                             0x19UL // 32 bit 2 =
10 10 10
-+#define PVR2D_888RSGSBS                                       0x1AUL
-+#define PVR2D_16BPP_RAW                                       0x1BUL // 1=
6 bit raw (no format conversion)
-+#define PVR2D_32BPP_RAW                                       0x1CUL // 3=
2 bit raw
-+#define PVR2D_64BPP_RAW                                       0x1DUL // 6=
4 bit raw
-+#define PVR2D_128BPP_RAW                              0x1EUL // 128 bit r=
aw
-+
-+#define       PVR2D_NO_OF_FORMATS                             0x1FUL
-+
-+/* Format modifier bit field (DstFormat and SrcFormat bits 16..23) */
-+#define PVR2D_FORMAT_MASK                             0x0000FFFFUL    // =
PVR2D Format bits
-+#define PVR2D_FORMAT_LAYOUT_MASK              0x000F0000UL    // Format l=
ayout (strided / twiddled / tiled)
-+#define PVR2D_FORMAT_FLAGS_MASK                       0x0FF00000UL    // =
Surface Flags mask
-+
-+/* Layout */
-+#define PVR2D_FORMAT_LAYOUT_SHIFT             16
-+#define PVR2D_FORMAT_LAYOUT_STRIDED           0x00000000UL
-+#define PVR2D_FORMAT_LAYOUT_TILED             0x00010000UL
-+#define PVR2D_FORMAT_LAYOUT_TWIDDLED  0x00020000UL
-+
-+/*
-+      PVR2D_SURFACE_PDUMP
-+      This flag requests a surface pdump, to capture the pixel state afte=
r host writes.
-+      Not needed if the surface state has resulted from previous SGX 2D/3=
D core writes.
-+*/
-+#define PVR2D_SURFACE_PDUMP                           0x00100000UL    // =
calls PVRSRVPDumpMem to capture the surface (pdump builds only)
-+
-+/*
-+      Low level 3D format extension - for blts via the 3D core only.
-+      If the top bit of the format field is set then PVR2D reads it as a =
PVRSRV_PIXEL_FORMAT.
-+      The outcome is hardware dependant.
-+      There is no guarantee that any specific PVRSRV format will be suppo=
rted.
-+*/
-+#define PVR2D_FORMAT_PVRSRV                           0x80000000
-+
-+/* wrap surface type */
-+typedef enum
-+{
-+      PVR2D_WRAPFLAG_NONCONTIGUOUS =3D 0,
-+      PVR2D_WRAPFLAG_CONTIGUOUS =3D 1,
-+
-+}PVR2DWRAPFLAGS;
-+
-+#define       PVR2D_CONTEXT_FLAGS_PRIORITY_MASK                       0x0=
0000003
-+
-+#define       PVR2D_CONTEXT_FLAGS_LOW_PRIORITY_CONTEXT        1
-+#define       PVR2D_CONTEXT_FLAGS_NORMAL_PRIORITY_CONTEXT     0
-+#define       PVR2D_CONTEXT_FLAGS_HIGH_PRIORITY_CONTEXT       2
-+
-+/* flags for control information of additional blits */
-+typedef enum
-+{
-+      PVR2D_BLIT_DISABLE_ALL                                  =3D 0x00000=
000,   /* disable all additional controls */
-+      PVR2D_BLIT_CK_ENABLE                                    =3D 0x00000=
001,   /* enable colour key */
-+      PVR2D_BLIT_GLOBAL_ALPHA_ENABLE                  =3D 0x00000002,   /=
* enable standard global alpha */
-+      PVR2D_BLIT_PERPIXEL_ALPHABLEND_ENABLE   =3D 0x00000004,   /* enable=
 per-pixel alpha bleding */
-+      PVR2D_BLIT_PAT_SURFACE_ENABLE                   =3D 0x00000008,   /=
* enable pattern surf (disable fill) */
-+      PVR2D_BLIT_FULLY_SPECIFIED_ALPHA_ENABLE =3D 0x00000010,   /* enable=
 fully specified alpha */
-+      PVR2D_BLIT_ROT_90                                               =3D=
 0x00000020,   /* apply 90 degree rotation to the blt */
-+      PVR2D_BLIT_ROT_180                                              =3D=
 0x00000040,   /* apply 180 degree rotation to the blt */
-+      PVR2D_BLIT_ROT_270                                              =3D=
 0x00000080,   /* apply 270 degree rotation to the blt */
-+      PVR2D_BLIT_COPYORDER_TL2BR                              =3D 0x00000=
100,   /* copy order overrides */
-+      PVR2D_BLIT_COPYORDER_BR2TL                              =3D 0x00000=
200,
-+      PVR2D_BLIT_COPYORDER_TR2BL                              =3D 0x00000=
400,
-+      PVR2D_BLIT_COPYORDER_BL2TR                              =3D 0x00000=
800,
-+      PVR2D_BLIT_COLKEY_SOURCE                                =3D 0x00001=
000,   /* Key colour is on the source surface */
-+      PVR2D_BLIT_COLKEY_DEST                                  =3D 0x00002=
000,   /* Key colour is on the destination surface */
-+      PVR2D_BLIT_COLKEY_MASKED                                =3D 0x00004=
000,   /* Mask enabled for colour key */
-+      PVR2D_BLIT_COLKEY_OP_PASS                               =3D 0x00008=
000,   /* Colour key op =3D pass */
-+      PVR2D_BLIT_COLKEY_OP_REJECT                             =3D 0x00010=
000,   /* Colour key op =3D reject */
-+      PVR2D_BLIT_PATH_2DCORE                                  =3D 0x00100=
000,   /* Blt via dedicated 2D Core or PTLA */
-+      PVR2D_BLIT_PATH_3DCORE                                  =3D 0x00200=
000,   /* Blt via 3D Core */
-+      PVR2D_BLIT_PATH_SWBLT                                   =3D 0x00400=
000,   /* Blt via host software */
-+      PVR2D_BLIT_NO_SRC_SYNC_INFO                             =3D 0x00800=
000,   /* Dont send a source sync info*/
-+      PVR2D_BLIT_ISSUE_STATUS_UPDATES                 =3D 0x01000000,   /=
* Issue status updates */
-+
-+} PVR2DBLITFLAGS;
-+
-+/* standard alpha-blending functions, AlphaBlendingFunc field of PVR2DBLT=
INFO */
-+typedef enum
-+{
-+      PVR2D_ALPHA_OP_SRC_DSTINV =3D 1,  /* source alpha : Cdst =3D Csrc*A=
src + Cdst*(1-Asrc) */
-+      PVR2D_ALPHA_OP_SRCP_DSTINV =3D 2  /* premultiplied source alpha : C=
dst =3D Csrc + Cdst*(1-Asrc) */
-+} PVR2D_ALPHABLENDFUNC;
-+
-+/* blend ops for fully specified alpha (SGX 2D Core only) */
-+typedef enum
-+{
-+      PVR2D_BLEND_OP_ZERO =3D 0,
-+      PVR2D_BLEND_OP_ONE =3D 1,
-+      PVR2D_BLEND_OP_SRC =3D 2,
-+      PVR2D_BLEND_OP_DST =3D 3,
-+      PVR2D_BLEND_OP_GLOBAL =3D 4,
-+      PVR2D_BLEND_OP_SRC_PLUS_GLOBAL =3D 5,
-+      PVR2D_BLEND_OP_DST_PLUS_GLOBAL =3D 6
-+}PVR2D_BLEND_OP;
-+
-+/* SGX 2D Core Fully specified alpha blend :  pAlpha field of PVR2DBLTINF=
O structure          */
-+/* a fully specified Alpha Blend operation is defined as                 =
                                                     */
-+/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (ALPHA_3 * DST (ALPHA))     =
                                               */
-+/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (ALPHA_4 * DST (RGB))         =
                                                       */
-+/* if the pre-multiplication stage is enabled then the equations become t=
he following:                */
-+/* PRE_MUL     =3D ((SRC(A)) * (Global Alpha Value))                     =
                                                               */
-+/* DST (ALPHA) =3D (ALPHA_1 * SRC (ALPHA)) + (PRE_MUL * DST (ALPHA))     =
                                               */
-+/* DST (RGB)   =3D (ALPHA_2 * SRC (RGB)) + (PRE_MUL * DST (RGB))         =
                                                       */
-+/* if the transparent source alpha stage is enabled then a source alpha o=
f zero forces the    */
-+/* source to be transparent for that pixel regardless of the blend equati=
on being used.               */
-+typedef struct _PVR2D_ALPHABLT
-+{
-+      PVR2D_BLEND_OP  eAlpha1;
-+      PVR2D_BOOL              bAlpha1Invert;
-+      PVR2D_BLEND_OP  eAlpha2;
-+      PVR2D_BOOL              bAlpha2Invert;
-+      PVR2D_BLEND_OP  eAlpha3;
-+      PVR2D_BOOL              bAlpha3Invert;
-+      PVR2D_BLEND_OP  eAlpha4;
-+      PVR2D_BOOL              bAlpha4Invert;
-+      PVR2D_BOOL              bPremulAlpha;                   /* enable p=
re-multiplication stage */
-+      PVR2D_BOOL              bTransAlpha;                    /* enable t=
ransparent source alpha stage */
-+      PVR2D_BOOL              bUpdateAlphaLookup;             /* enable a=
nd update the 1555-Lookup alpha table */
-+      PVR2D_UCHAR             uAlphaLookup0;                  /* 8 bit al=
pha when A=3D0 in a 1555-Lookup surface */
-+      PVR2D_UCHAR             uAlphaLookup1;                  /* 8 bit al=
pha when A=3D1 in a 1555-Lookup surface */
-+      PVR2D_UCHAR             uGlobalRGB;                             /* =
Global Alpha Value for RGB, 0=3Dtransparent 255=3Dopaque */
-+      PVR2D_UCHAR             uGlobalA;                               /* =
Global Alpha Value for Alpha */
-+
-+} PVR2D_ALPHABLT, *PPVR2D_ALPHABLT;
-+
-+
-+/* surface memory info structure */
-+typedef struct _PVR2DMEMINFO
-+{
-+      PVR2D_VOID                      *pBase;
-+      PVR2D_ULONG                     ui32MemSize;
-+      PVR2D_ULONG                     ui32DevAddr;
-+      PVR2D_ULONG                     ulFlags;
-+      PVR2D_VOID                      *hPrivateData;
-+      PVR2D_VOID                      *hPrivateMapData;
-+
-+}PVR2DMEMINFO, *PPVR2DMEMINFO;
-+
-+
-+#define PVR2D_MAX_DEVICE_NAME 20
-+
-+typedef struct _PVR2DDEVICEINFO
-+{
-+      PVR2D_ULONG             ulDevID;
-+      PVR2D_CHAR              szDeviceName[PVR2D_MAX_DEVICE_NAME];
-+}PVR2DDEVICEINFO;
-+
-+
-+typedef struct _PVR2DISPLAYINFO
-+{
-+      PVR2D_ULONG     ulMaxFlipChains;
-+      PVR2D_ULONG     ulMaxBuffersInChain;
-+      PVR2DFORMAT     eFormat;
-+      PVR2D_ULONG     ulWidth;
-+      PVR2D_ULONG     ulHeight;
-+      PVR2D_LONG      lStride;
-+      PVR2D_ULONG     ulMinFlipInterval;
-+      PVR2D_ULONG     ulMaxFlipInterval;
-+
-+}PVR2DDISPLAYINFO;
-+
-+
-+typedef struct _PVR2MISCDISPLAYINFO
-+{
-+      PVR2D_ULONG ulPhysicalWidthmm;
-+      PVR2D_ULONG ulPhysicalHeightmm;
-+      PVR2D_ULONG ulUnused[10];
-+
-+}PVR2DMISCDISPLAYINFO;
-+
-+
-+typedef struct _PVR2DBLTINFO
-+{
-+      PVR2D_ULONG             CopyCode;                       /* rop code=
  */
-+      PVR2D_ULONG             Colour;                         /* fill col=
our */
-+      PVR2D_ULONG             ColourKey;                      /* colour k=
ey argb8888 (see CKEY_ defs below) */
-+      PVR2D_UCHAR             GlobalAlphaValue;       /* global alpha ble=
nding */
-+      PVR2D_UCHAR             AlphaBlendingFunc;      /* per-pixel alpha-=
blending function */
-+
-+      PVR2DBLITFLAGS  BlitFlags;                      /* additional blit =
control information */
-+
-+      PVR2DMEMINFO    *pDstMemInfo;           /* destination memory */
-+      PVR2D_ULONG             DstOffset;                      /* byte off=
set from start of allocation to destination surface pixel 0,0 */
-+      PVR2D_LONG              DstStride;                      /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
-+      PVR2D_LONG              DstX, DstY;                     /* pixel of=
fset from start of dest surface to start of blt rectangle */
-+      PVR2D_LONG              DSizeX,DSizeY;          /* blt size */
-+      PVR2DFORMAT             DstFormat;                      /* dest for=
mat */
-+      PVR2D_ULONG             DstSurfWidth;           /* size of dest sur=
face in pixels */
-+      PVR2D_ULONG             DstSurfHeight;          /* size of dest sur=
face in pixels */
-+
-+      PVR2DMEMINFO    *pSrcMemInfo;           /* source mem, (source fiel=
ds are also used for patterns) */
-+      PVR2D_ULONG             SrcOffset;                      /* byte off=
set from start of allocation to src/pat surface pixel 0,0 */
-+      PVR2D_LONG              SrcStride;                      /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
-+      PVR2D_LONG              SrcX, SrcY;                     /* pixel of=
fset from start of surface to start of source rectangle */
-+                                                                         =
     /* for patterns this is the start offset within the pattern */
-+      PVR2D_LONG              SizeX,SizeY;            /* source rectangle=
 size or pattern size in pixels */
-+      PVR2DFORMAT             SrcFormat;                      /* source/p=
attern format */
-+      PVR2DMEMINFO    *pPalMemInfo;           /* source/pattern palette m=
emory containing argb8888 colour table */
-+      PVR2D_ULONG             PalOffset;                      /* byte off=
set from start of allocation to start of palette */
-+      PVR2D_ULONG             SrcSurfWidth;           /* size of source s=
urface in pixels */
-+      PVR2D_ULONG             SrcSurfHeight;          /* size of source s=
urface in pixels */
-+
-+      PVR2DMEMINFO    *pMaskMemInfo;          /* mask memory, 1bpp format=
 implied */
-+      PVR2D_ULONG             MaskOffset;                     /* byte off=
set from start of allocation to mask surface pixel 0,0 */
-+      PVR2D_LONG              MaskStride;                     /* signed s=
tride, the number of bytes from pixel 0,0 to 0,1 */
-+      PVR2D_LONG              MaskX, MaskY;           /* mask rect top le=
ft (mask size =3D blt size) */
-+      PVR2D_ULONG             MaskSurfWidth;          /* size of mask sur=
face in pixels */
-+      PVR2D_ULONG             MaskSurfHeight;         /* size of mask sur=
face in pixels */
-+
-+      PPVR2D_ALPHABLT pAlpha;                         /* fully specified =
alpha blend (2DCore only) */
-+
-+      PVR2D_ULONG             uSrcChromaPlane1;       /* mem offset from =
start of source alloc to chroma plane 1 */
-+      PVR2D_ULONG             uSrcChromaPlane2;       /* mem offset from =
start of source alloc to chroma plane 2 */
-+      PVR2D_ULONG             uDstChromaPlane1;       /* mem offset from =
start of dest alloc to chroma plane 1 */
-+      PVR2D_ULONG             uDstChromaPlane2;       /* mem offset from =
start of dest alloc to chroma plane 2 */
-+
-+      PVR2D_ULONG             ColourKeyMask;          /* 32 bit colour ke=
y mask, only valid when PVR2D_BLIT_COLKEY_MASKED is set */
-+
-+}PVR2DBLTINFO, *PPVR2DBLTINFO;
-+
-+typedef struct _PVR2DRECT
-+{
-+      PVR2D_LONG left, top;
-+      PVR2D_LONG right, bottom;
-+} PVR2DRECT;
-+
-+typedef struct
-+{
-+      PVR2DMEMINFO    *pSurfMemInfo;          /* surface memory */
-+      PVR2D_ULONG             SurfOffset;                     /* byte off=
set from start of allocation to destination surface pixel 0,0 */
-+      PVR2D_LONG              Stride;                         /* signed s=
tride */
-+      PVR2DFORMAT             Format;                         /* format *=
/
-+      PVR2D_ULONG             SurfWidth;                      /* surface =
width in pixels */
-+      PVR2D_ULONG             SurfHeight;                     /* surface =
height in pixels */
-+
-+} PVR2D_SURFACE, *PPVR2D_SURFACE;
-+
-+typedef struct
-+{
-+      PVR2D_ULONG             uChromaPlane1;          /* YUV multiplane -=
 byte offset from start of alloc to chroma plane 1 */
-+      PVR2D_ULONG             uChromaPlane2;          /* YUV multiplane -=
 byte offset from start of alloc to chroma plane 2 */
-+      PVR2D_LONG              Reserved[2];            /* Reserved, must b=
e zero */
-+
-+} PVR2D_SURFACE_EXT, *PPVR2D_SURFACE_EXT;
-+
-+typedef struct
-+{
-+      PVR2D_ULONG             *pUseCode;                                 =
     /* USSE code */
-+      PVR2D_ULONG             UseCodeSize;                            /* =
usse code size in bytes */
-+
-+} PVR2D_USECODE, *PPVR2D_USECODE;
-+
-+typedef struct
-+{
-+      PVR2D_SURFACE                   sDst;                           /* =
destination surface */
-+      PVR2D_SURFACE                   sSrc;                           /* =
source surface */
-+      PVR2DRECT                               rcDest;                    =
     /* destination rectangle */
-+      PVR2DRECT                               rcSource;                  =
     /* source rectangle */
-+      PVR2D_HANDLE                    hUseCode;                       /* =
custom USE code (NULL implies source copy) */
-+      PVR2D_ULONG                             UseParams[2];           /* =
per-blt params for use code */
-+
-+} PVR2D_3DBLT, *PPVR2D_3DBLT;
-+
-+typedef struct
-+{
-+      PVR2D_SURFACE                   sDst;                              =
             /* destination surface */
-+      PVR2DRECT                               rcDest;                    =
                     /* destination rectangle; scaling is supported */
-+      PVR2D_SURFACE                   sSrc;                              =
             /* source surface */
-+      PVR2DRECT                               rcSource;                  =
                     /* source rectangle; scaling is supported */
-+      PPVR2D_SURFACE                  pSrc2;                             =
             /* optional second source surface (NULL if not required) */
-+      PVR2DRECT*                              prcSource2;                =
                     /* optional pSrc2 rectangle */
-+      PVR2D_HANDLE                    hUseCode;                          =
             /* custom USSE shader code (NULL implies default source copy) =
*/
-+      PVR2D_ULONG                             UseParams[2];              =
             /* per-blt params for usse code */
-+      PVR2D_ULONG                             uiNumTemporaryRegisters;   =
     /* no. of temporary registers used in custom shader code */
-+      PVR2D_BOOL                              bDisableDestInput;         =
             /* set true if the destination is output only */
-+      PPVR2D_SURFACE_EXT              pDstExt;                           =
             /* Extended format params for dest */
-+      PPVR2D_SURFACE_EXT              pSrcExt[2];                        =
             /* Extended format params for source 1 and 2 */
-+      PVR2D_LONG                              Reserved[4];               =
             /* Reserved, must be zero */
-+
-+} PVR2D_3DBLT_EXT, *PPVR2D_3DBLT_EXT;
-+
-+
-+#define MAKE_COPY_BLIT(src,soff,dest,doff,sx,sy,dx,dy,sz)
-+
-+typedef void* PVR2DCONTEXTHANDLE;
-+typedef void* PVR2DFLIPCHAINHANDLE;
-+
-+
-+// CopyCode field of PVR2DBLTINFO structure:
-+// the CopyCode field of the PVR2DBLTINFO structure should contain a rop3=
 or rop4 code.
-+// a rop3 is an 8 bit code that describes a blt with three inputs : sourc=
e dest and pattern
-+// rop4 is a 16 bit code that describes a blt with four inputs : source d=
est pattern and mask
-+// common rop3 codes are defined below
-+// a colour fill blt is processed in the pattern channel as a constant co=
lour with a rop code of 0xF0
-+// PVR2D_BLIT_PAT_SURFACE_ENABLE defines whether the pattern channel is a=
 surface or a fill colour.
-+// a rop4 is defined by two rop3 codes, and the 1 bit-per-pixel mask surf=
ace defines which is used.
-+// a common rop4 is 0xAAF0 which is the mask copy blt used for text glyph=
s.
-+// CopyCode is taken to be a rop4 when pMaskMemInfo is non zero, otherwis=
e it is assumed to be a rop3
-+// use the PVR2DMASKROP4 macro below to construct a rop4 from two rop3's
-+// rop3a is the rop used when mask pixel =3D 1, and rop3b when mask =3D 0
-+#define PVR2DROP4(rop3b, rop3a)                       ((rop3b<<8)|rop3a)
-+
-+/* common rop codes */
-+#define PVR2DROPclear                         0x00       /* 0 (whiteness)=
 */
-+#define PVR2DROPset                                   0xFF       /* 1 (bl=
ackness) */
-+#define PVR2DROPnoop                          0xAA       /* dst (used for=
 masked blts) */
-+
-+/* source and  dest rop codes */
-+#define PVR2DROPand                                   0x88       /* src A=
ND dst */
-+#define PVR2DROPandReverse                    0x44       /* src AND NOT d=
st */
-+#define PVR2DROPcopy                          0xCC       /* src (used for=
 source copy and alpha blts) */
-+#define PVR2DROPandInverted                   0x22       /* NOT src AND d=
st */
-+#define PVR2DROPxor                                   0x66       /* src X=
OR dst */
-+#define PVR2DROPor                                    0xEE       /* src O=
R dst */
-+#define PVR2DROPnor                                   0x11       /* NOT s=
rc AND NOT dst */
-+#define PVR2DROPequiv                         0x99       /* NOT src XOR d=
st */
-+#define PVR2DROPinvert                                0x55       /* NOT d=
st */
-+#define PVR2DROPorReverse                     0xDD       /* src OR NOT ds=
t */
-+#define PVR2DROPcopyInverted          0x33       /* NOT src */
-+#define PVR2DROPorInverted                    0xBB       /* NOT src OR ds=
t */
-+#define PVR2DROPnand                          0x77       /* NOT src OR NO=
T dst */
-+
-+/* pattern rop codes */
-+#define PVR2DPATROPand                                0xA0       /* pat A=
ND dst */
-+#define PVR2DPATROPandReverse         0x50       /* pat AND NOT dst */
-+#define PVR2DPATROPcopy                               0xF0       /* pat (=
used for solid color fills and pattern blts) */
-+#define PVR2DPATROPandInverted                0x0A       /* NOT pat AND d=
st */
-+#define PVR2DPATROPxor                                0x5A       /* pat X=
OR dst */
-+#define PVR2DPATROPor                         0xFA       /* pat OR dst */
-+#define PVR2DPATROPnor                                0x05       /* NOT p=
at AND NOT dst */
-+#define PVR2DPATROPequiv                      0xA5       /* NOT pat XOR d=
st */
-+#define PVR2DPATROPinvert                     0x55       /* NOT dst */
-+#define PVR2DPATROPorReverse          0xF5       /* pat OR NOT dst */
-+#define PVR2DPATROPcopyInverted               0x0F       /* NOT pat */
-+#define PVR2DPATROPorInverted         0xAF       /* NOT pat OR dst */
-+#define PVR2DPATROPnand                               0x5F       /* NOT p=
at OR NOT dst */
-+
-+/* common rop4 codes */
-+#define PVR2DROP4MaskedCopy              PVR2DROP4(PVR2DROPnoop,PVR2DROPc=
opy)         /* masked source copy blt (used for rounded window corners etc=
) */
-+#define PVR2DROP4MaskedFill              PVR2DROP4(PVR2DROPnoop,PVR2DPATR=
OPcopy)      /* masked colour fill blt (used for text) */
-+
-+/* Legacy support */
-+#define PVR2DROP3_PATMASK                     PVR2DPATROPcopy
-+#define PVR2DROP3_SRCMASK                     PVR2DROPcopy
-+
-+/* pixmap memory alignment */
-+#define PVR2D_ALIGNMENT_4                     4                       /* =
DWORD alignment */
-+#define PVR2D_ALIGNMENT_ANY                   0                       /* =
no alignment    */
-+#define PVR2D_ALIGNMENT_PALETTE               16                      /* =
16 byte alignment is required for palettes */
-+
-+/* Heap number for PVR2DGetFrameBuffer */
-+#define PVR2D_FB_PRIMARY_SURFACE 0
-+
-+#define PVR2D_PRESENT_PROPERTY_SRCSTRIDE      (1UL << 0)
-+#define PVR2D_PRESENT_PROPERTY_DSTSIZE                (1UL << 1)
-+#define PVR2D_PRESENT_PROPERTY_DSTPOS         (1UL << 2)
-+#define PVR2D_PRESENT_PROPERTY_CLIPRECTS      (1UL << 3)
-+#define PVR2D_PRESENT_PROPERTY_INTERVAL               (1UL << 4)
-+
-+#define PVR2D_CREATE_FLIPCHAIN_SHARED         (1UL << 0)
-+#define PVR2D_CREATE_FLIPCHAIN_QUERY          (1UL << 1)
-+#define PVR2D_CREATE_FLIPCHAIN_OEMOVERLAY   (1UL << 2)
-+#define PVR2D_CREATE_FLIPCHAIN_AS_BLITCHAIN (1UL << 3)
-+
-+/* Colour-key colour must be translated into argb8888 format */
-+#define CKEY_8888(P)          (P)
-+#define CKEY_4444(P)          (((P&0xF000UL)<<16) | ((P&0x0F00UL)<<12) | =
((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
-+#define CKEY_1555(P)          (((P&0x8000UL)<<16) | ((P&0x7C00UL)<<9)  | =
((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
-+#define CKEY_565(P)                   (((P&0xF800UL)<<8)  | ((P&0x7E0UL)<=
<5)   | ((P&0x1FUL)<<3))
-+#define CKEY_MASK_8888                0x00FFFFFFUL
-+#define CKEY_MASK_4444                0x00F0F0F0UL
-+#define CKEY_MASK_1555                0x00F8F8F8UL    /* Alpha is not nor=
mally included in the key test */
-+#define CKEY_MASK_565         0x00F8FCF8UL
-+
-+/* Fill colours must be translated into argb8888 format */
-+#define CFILL_4444(P)         (((P&0xF000UL)<<16) | ((P&0x0F00UL)<<12) | =
((P&0x00F0UL)<<8) | ((P&0x000FUL)<<4))
-+#define CFILL_1555(P)         (((P&0x8000UL)<<16) | ((P&0x7C00UL)<<9)  | =
((P&0x3E0UL)<<6)  | ((P&0x1FUL)<<3))
-+#define CFILL_565(P)          (((P&0xF800UL)<<8)  | ((P&0x7E0UL)<<5)   | =
((P&0x1FUL)<<3))
-+
-+/* PVR2DCreateDeviceContext flags */
-+#define PVR2D_XSERVER_PROC                    0x00000001UL            /*!=
< Set for the Xserver connection */
-+
-+/* PVR2DMemAlloc flags */
-+#define PVR2D_MEM_UNCACHED                    0x00000000UL    /* Default =
*/
-+#define PVR2D_MEM_CACHED                      0x00000001UL    /* Caller m=
ust flush and sync when necessary */
-+#define PVR2D_MEM_WRITECOMBINE                0x00000002UL
-+
-+/* Functions that the library exports */
-+
-+PVR2D_IMPORT
-+int PVR2DEnumerateDevices(PVR2DDEVICEINFO *pDevInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DCreateDeviceContext(PVR2D_ULONG ulDevID,
-+                                                                      PVR=
2DCONTEXTHANDLE* phContext,
-+                                                                      PVR=
2D_ULONG ulFlags);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DDestroyDeviceContext(PVR2DCONTEXTHANDLE hContext);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetDeviceInfo(PVR2DCONTEXTHANDLE hContext,
-+                                                        PVR2DDISPLAYINFO =
*pDisplayInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetMiscDisplayInfo(PVR2DCONTEXTHANDLE hContext,
-+                                                        PVR2DMISCDISPLAYI=
NFO *pMiscDisplayInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetScreenMode(PVR2DCONTEXTHANDLE hContext,
-+                                                        PVR2DFORMAT *pFor=
mat,
-+                                                        PVR2D_LONG *plWid=
th,
-+                                                        PVR2D_LONG *plHei=
ght,
-+                                                        PVR2D_LONG *plStr=
ide,
-+                                                        PVR2D_INT *piRefr=
eshRate);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetFrameBuffer(PVR2DCONTEXTHANDLE hContext,
-+                                                         PVR2D_INT nHeap,
-+                                                         PVR2DMEMINFO **p=
psMemInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DMemAlloc(PVR2DCONTEXTHANDLE hContext,
-+                                               PVR2D_ULONG ulBytes,
-+                                               PVR2D_ULONG ulAlign,
-+                                               PVR2D_ULONG ulFlags,
-+                                               PVR2DMEMINFO **ppsMemInfo)=
;
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DMemExport(PVR2DCONTEXTHANDLE hContext,
-+                                               PVR2D_ULONG ulFlags,
-+                                               PVR2DMEMINFO *psMemInfo,
-+                                               PVR2D_HANDLE *phMemHandle)=
;
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DMemWrap(PVR2DCONTEXTHANDLE hContext,
-+                                              PVR2D_VOID *pMem,
-+                                              PVR2D_ULONG ulFlags,
-+                                              PVR2D_ULONG ulBytes,
-+                                              PVR2D_ULONG alPageAddress[]=
,
-+                                              PVR2DMEMINFO **ppsMemInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DMemMap(PVR2DCONTEXTHANDLE hContext,
-+                                              PVR2D_ULONG ulFlags,
-+                                              PVR2D_HANDLE hMemHandle,
-+                                              PVR2DMEMINFO **ppsDstMem);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DMemFree(PVR2DCONTEXTHANDLE hContext,
-+                                              PVR2DMEMINFO *psMemInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DBlt(PVR2DCONTEXTHANDLE hContext,
-+                                      PVR2DBLTINFO *pBltInfo);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DBltClipped(PVR2DCONTEXTHANDLE hContext,
-+                                                 PVR2DBLTINFO *pBltInfo,
-+                                                 PVR2D_ULONG ulNumClipRec=
ts,
-+                                                 PVR2DRECT *pClipRects);
-+
-+PVR2D_EXPORT
-+PVR2DERROR PVR2DSet1555Alpha (PVR2DCONTEXTHANDLE hContext,
-+                                                        PVR2D_UCHAR Alpha=
0, PVR2D_UCHAR Alpha1);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DQueryBlitsComplete(PVR2DCONTEXTHANDLE hContext,
-+                                                                 const PV=
R2DMEMINFO *pMemInfo,
-+                                                                 PVR2D_UI=
NT uiWaitForComplete);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DSetPresentBltProperties(PVR2DCONTEXTHANDLE hContext,
-+                                                                         =
     PVR2D_ULONG ulPropertyMask,
-+                                                                         =
     PVR2D_LONG lSrcStride,
-+                                                                         =
     PVR2D_ULONG ulDstWidth,
-+                                                                         =
     PVR2D_ULONG ulDstHeight,
-+                                                                         =
     PVR2D_LONG lDstXPos,
-+                                                                         =
     PVR2D_LONG lDstYPos,
-+                                                                         =
     PVR2D_ULONG ulNumClipRects,
-+                                                                         =
     PVR2DRECT *pClipRects,
-+                                                                         =
     PVR2D_ULONG ulSwapInterval);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DPresentBlt(PVR2DCONTEXTHANDLE hContext,
-+                                                 PVR2DMEMINFO *pMemInfo,
-+                                                 PVR2D_LONG lRenderID);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DCreateFlipChain(PVR2DCONTEXTHANDLE hContext,
-+                                                              PVR2D_ULONG=
 ulFlags,
-+                                                              PVR2D_ULONG=
 ulNumBuffers,
-+                                                              PVR2D_ULONG=
 ulWidth,
-+                                                              PVR2D_ULONG=
 ulHeight,
-+                                                              PVR2DFORMAT=
 eFormat,
-+                                                              PVR2D_LONG =
*plStride,
-+                                                              PVR2D_ULONG=
 *pulFlipChainID,
-+                                                              PVR2DFLIPCH=
AINHANDLE *phFlipChain);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DDestroyFlipChain(PVR2DCONTEXTHANDLE hContext,
-+                                                               PVR2DFLIPC=
HAINHANDLE hFlipChain);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetFlipChainBuffers(PVR2DCONTEXTHANDLE hContext,
-+                                                                      PVR=
2DFLIPCHAINHANDLE hFlipChain,
-+                                                                      PVR=
2D_ULONG *pulNumBuffers,
-+                                                                      PVR=
2DMEMINFO *psMemInfo[]);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DSetPresentFlipProperties(PVR2DCONTEXTHANDLE hContext,
-+                                                                         =
      PVR2DFLIPCHAINHANDLE hFlipChain,
-+                                                                         =
      PVR2D_ULONG ulPropertyMask,
-+                                                                         =
      PVR2D_LONG lDstXPos,
-+                                                                         =
      PVR2D_LONG lDstYPos,
-+                                                                         =
      PVR2D_ULONG ulNumClipRects,
-+                                                                         =
      PVR2DRECT *pClipRects,
-+                                                                         =
      PVR2D_ULONG ulSwapInterval);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DPresentFlip(PVR2DCONTEXTHANDLE hContext,
-+                                                      PVR2DFLIPCHAINHANDL=
E hFlipChain,
-+                                                      PVR2DMEMINFO *psMem=
Info,
-+                                                      PVR2D_LONG lRenderI=
D);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DGetAPIRev(PVR2D_LONG *lRevMajor, PVR2D_LONG *lRevMinor);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DLoadUseCode (const PVR2DCONTEXTHANDLE hContext, const PVR=
2D_UCHAR     *pUseCode,
-+                                                                      con=
st PVR2D_ULONG UseCodeSize, PVR2D_HANDLE *pUseCodeHandle);
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DFreeUseCode (const PVR2DCONTEXTHANDLE hContext, const PVR=
2D_HANDLE hUseCodeHandle);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DBlt3D (const PVR2DCONTEXTHANDLE hContext, const PPVR2D_3D=
BLT pBlt3D);
-+
-+PVR2D_IMPORT
-+PVR2DERROR PVR2DBlt3DExt (const PVR2DCONTEXTHANDLE hContext, const PPVR2D=
_3DBLT_EXT pBlt3D);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* _PVR2D_H_ */
-+
-+/************************************************************************=
******
-+ End of file (pvr2d.h)
-+*************************************************************************=
*****/
-diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/w=
segl2/wsegl.h qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl=
2/wsegl.h
---- qt-everywhere-opensource-src-4.6.3-orig//src/3rdparty/powervr/wsegl2/w=
segl.h       1970-01-01 00:00:00.000000000 +0000
-+++ qt-everywhere-opensource-src-4.6.3/src/3rdparty/powervr/wsegl2/wsegl.h=
     2011-05-16 22:51:52.702601769 +0000
-@@ -0,0 +1,285 @@
-+/**********************************************************************
-+*
-+* Copyright(c) Imagination Technologies Ltd.
-+*
-+* The contents of this file are subject to the MIT license as set out bel=
ow.
-+*
-+* Permission is hereby granted, free of charge, to any person obtaining a=
 copy
-+* of this software and associated documentation files (the "Software"),
-+* to deal in the Software without restriction, including without limitati=
on
-+* the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
-+* and/or sell copies of the Software, and to permit persons to whom the
-+* Software is furnished to do so, subject to the following conditions:
-+*
-+* The above copyright notice and this permission notice shall be included
-+* in all copies or substantial portions of the Software.
-+*
-+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-+* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
-+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-+* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CL=
AIM,
-+* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
-+* OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
-+* OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-+*
-+* This License is also included in this distribution in the file called
-+* "COPYING".
-+*
-+*************************************************************************=
*****/
-+
-+
-+
-+#if !defined(__WSEGL_H__)
-+#define __WSEGL_H__
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/*
-+// WSEGL Platform-specific definitions
-+*/
-+#if defined(__linux__)
-+#define WSEGL_EXPORT __attribute__((visibility("default")))
-+#define WSEGL_IMPORT
-+#else
-+#define WSEGL_EXPORT
-+#define WSEGL_IMPORT
-+#endif
-+
-+/*
-+// WSEGL API Version Number
-+*/
-+
-+#define WSEGL_VERSION 2
-+#define WSEGL_DEFAULT_DISPLAY 0
-+#define WSEGL_DEFAULT_NATIVE_ENGINE 0
-+
-+#define WSEGL_FALSE           0
-+#define WSEGL_TRUE            1
-+#define WSEGL_NULL            0
-+
-+#define       WSEGL_UNREFERENCED_PARAMETER(param) (param) =3D (param)
-+
-+/*
-+// WSEGL handles
-+*/
-+typedef void *WSEGLDisplayHandle;
-+typedef void *WSEGLDrawableHandle;
-+
-+/*
-+// Display capability type
-+*/
-+typedef enum WSEGLCapsType_TAG
-+{
-+      WSEGL_NO_CAPS =3D 0,
-+      WSEGL_CAP_MIN_SWAP_INTERVAL =3D 1, /* System default value =3D 1 */
-+      WSEGL_CAP_MAX_SWAP_INTERVAL =3D 2, /* System default value =3D 1 */
-+      WSEGL_CAP_WINDOWS_USE_HW_SYNC =3D 3, /* System default value =3D 0 =
(FALSE) */
-+      WSEGL_CAP_PIXMAPS_USE_HW_SYNC =3D 4, /* System default value =3D 0 =
(FALSE) */
-+
-+} WSEGLCapsType;
-+
-+/*
-+// Display capability
-+*/
-+typedef struct WSEGLCaps_TAG
-+{
-+      WSEGLCapsType eCapsType;
-+      unsigned long ui32CapsValue;
-+
-+} WSEGLCaps;
-+
-+/*
-+// Drawable type
-+*/
-+#define WSEGL_NO_DRAWABLE                     0x0
-+#define WSEGL_DRAWABLE_WINDOW         0x1
-+#define WSEGL_DRAWABLE_PIXMAP         0x2
-+
-+
-+/*
-+// Pixel format of display/drawable
-+*/
-+typedef enum WSEGLPixelFormat_TAG
-+{
-+      /* These must not be re-ordered */
-+      WSEGL_PIXELFORMAT_RGB565        =3D 0,
-+      WSEGL_PIXELFORMAT_ARGB4444      =3D 1,
-+      WSEGL_PIXELFORMAT_ARGB8888      =3D 2,
-+      WSEGL_PIXELFORMAT_ARGB1555      =3D 3,
-+      WSEGL_PIXELFORMAT_ABGR8888      =3D 4,
-+      WSEGL_PIXELFORMAT_XBGR8888      =3D 5,
-+
-+      /* These are compatibility names only; new WSEGL
-+       * modules should not use them.
-+       */
-+      WSEGL_PIXELFORMAT_565           =3D WSEGL_PIXELFORMAT_RGB565,
-+      WSEGL_PIXELFORMAT_4444          =3D WSEGL_PIXELFORMAT_ARGB4444,
-+      WSEGL_PIXELFORMAT_8888          =3D WSEGL_PIXELFORMAT_ARGB8888,
-+      WSEGL_PIXELFORMAT_1555          =3D WSEGL_PIXELFORMAT_ARGB1555,
-+
-+} WSEGLPixelFormat;
-+
-+/*
-+// Transparent of display/drawable
-+*/
-+typedef enum WSEGLTransparentType_TAG
-+{
-+      WSEGL_OPAQUE =3D 0,
-+      WSEGL_COLOR_KEY =3D 1,
-+
-+} WSEGLTransparentType;
-+
-+/*
-+// Display/drawable configuration
-+*/
-+typedef struct WSEGLConfig_TAG
-+{
-+      /*
-+      // Type of drawables this configuration applies to -
-+      // OR'd values of drawable types.
-+      */
-+      unsigned long ui32DrawableType;
-+
-+      /* Pixel format */
-+      WSEGLPixelFormat ePixelFormat;
-+
-+      /* Native Renderable  - set to WSEGL_TRUE if native renderable */
-+      unsigned long ulNativeRenderable;
-+
-+      /* FrameBuffer Level Parameter */
-+      unsigned long ulFrameBufferLevel;
-+
-+      /* Native Visual ID */
-+      unsigned long ulNativeVisualID;
-+
-+      /* Native Visual */
-+      void *hNativeVisual;
-+
-+      /* Transparent Type */
-+      WSEGLTransparentType eTransparentType;
-+
-+      /* Transparent Color - only used if transparent type is COLOR_KEY *=
/
-+      unsigned long ulTransparentColor; /* packed as 0x00RRGGBB */
-+
-+
-+} WSEGLConfig;
-+
-+/*
-+// WSEGL errors
-+*/
-+typedef enum WSEGLError_TAG
-+{
-+      WSEGL_SUCCESS =3D 0,
-+      WSEGL_CANNOT_INITIALISE =3D 1,
-+      WSEGL_BAD_NATIVE_DISPLAY =3D 2,
-+      WSEGL_BAD_NATIVE_WINDOW =3D 3,
-+      WSEGL_BAD_NATIVE_PIXMAP =3D 4,
-+      WSEGL_BAD_NATIVE_ENGINE =3D 5,
-+      WSEGL_BAD_DRAWABLE =3D 6,
-+      WSEGL_BAD_MATCH =3D 7,
-+      WSEGL_OUT_OF_MEMORY =3D 8,
-+
-+      /* These are compatibility names only; new WSEGL
-+       * modules should not use them.
-+       */
-+      WSEGL_BAD_CONFIG =3D WSEGL_BAD_MATCH,
-+
-+} WSEGLError;
-+
-+/*
-+// Drawable orientation (in degrees anti-clockwise)
-+*/
-+typedef enum WSEGLRotationAngle_TAG
-+{
-+      WSEGL_ROTATE_0 =3D 0,
-+      WSEGL_ROTATE_90 =3D 1,
-+      WSEGL_ROTATE_180 =3D 2,
-+      WSEGL_ROTATE_270 =3D 3
-+
-+} WSEGLRotationAngle;
-+
-+/*
-+// Drawable information required by OpenGL-ES driver
-+*/
-+typedef struct WSEGLDrawableParams_TAG
-+{
-+      /* Width in pixels of the drawable */
-+      unsigned long   ui32Width;
-+
-+      /* Height in pixels of the drawable */
-+      unsigned long   ui32Height;
-+
-+      /* Stride in pixels of the drawable */
-+      unsigned long   ui32Stride;
-+
-+      /* Pixel format of the drawable */
-+      WSEGLPixelFormat        ePixelFormat;
-+
-+      /* User space cpu virtual address of the drawable */
-+      void                    *pvLinearAddress;
-+
-+      /* HW address of the drawable */
-+      unsigned long   ui32HWAddress;
-+
-+      /* Private data for the drawable */
-+      void                    *hPrivateData;
-+
-+
-+} WSEGLDrawableParams;
-+
-+
-+/*
-+// Table of function pointers that is returned by WSEGL_GetFunctionTableP=
ointer()
-+//
-+// The first entry in the table is the version number of the wsegl.h head=
er file that
-+// the module has been written against, and should therefore be set to WS=
EGL_VERSION
-+*/
-+typedef struct WSEGL_FunctionTable_TAG
-+{
-+      unsigned long ui32WSEGLVersion;
-+
-+      WSEGLError (*pfnWSEGL_IsDisplayValid)(NativeDisplayType);
-+
-+      WSEGLError (*pfnWSEGL_InitialiseDisplay)(NativeDisplayType, WSEGLDi=
splayHandle *, const WSEGLCaps **, WSEGLConfig **);
-+
-+      WSEGLError (*pfnWSEGL_CloseDisplay)(WSEGLDisplayHandle);
-+
-+      WSEGLError (*pfnWSEGL_CreateWindowDrawable)(WSEGLDisplayHandle, WSE=
GLConfig *, WSEGLDrawableHandle *, NativeWindowType, WSEGLRotationAngle *);
-+
-+      WSEGLError (*pfnWSEGL_CreatePixmapDrawable)(WSEGLDisplayHandle, WSE=
GLConfig *, WSEGLDrawableHandle *, NativePixmapType, WSEGLRotationAngle *);
-+
-+      WSEGLError (*pfnWSEGL_DeleteDrawable)(WSEGLDrawableHandle);
-+
-+      WSEGLError (*pfnWSEGL_SwapDrawable)(WSEGLDrawableHandle, unsigned l=
ong);
-+
-+      WSEGLError (*pfnWSEGL_SwapControlInterval)(WSEGLDrawableHandle, uns=
igned long);
-+
-+      WSEGLError (*pfnWSEGL_WaitNative)(WSEGLDrawableHandle, unsigned lon=
g);
-+
-+      WSEGLError (*pfnWSEGL_CopyFromDrawable)(WSEGLDrawableHandle, Native=
PixmapType);
-+
-+      WSEGLError (*pfnWSEGL_CopyFromPBuffer)(void *, unsigned long, unsig=
ned long, unsigned long, WSEGLPixelFormat, NativePixmapType);
-+
-+      WSEGLError (*pfnWSEGL_GetDrawableParameters)(WSEGLDrawableHandle, W=
SEGLDrawableParams *, WSEGLDrawableParams *);
-+
-+      WSEGLError (*pfnWSEGL_ConnectDrawable)(WSEGLDrawableHandle);
-+
-+      WSEGLError (*pfnWSEGL_DisconnectDrawable)(WSEGLDrawableHandle);
-+
-+
-+} WSEGL_FunctionTable;
-+
-+
-+WSEGL_IMPORT const WSEGL_FunctionTable *WSEGL_GetFunctionTablePointer(voi=
d);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __WSEGL_H__ */
-+
-+/************************************************************************=
******
-+ End of file (wsegl.h)
-+*************************************************************************=
*****/
-diff -Nurp qt-everywhere-opensource-src-4.6.3-orig//src/plugins/gfxdrivers=
/powervr/QWSWSEGL/pvrqwswsegl.c qt-everywhere-opensource-src-4.6.3/src/plug=
ins/gfxdrivers/powervr/QWSWSEGL/pvrqwswsegl.c
---- qt-everywhere-opensource-src-4.6.3-orig//src/plugins/gfxdrivers/powerv=
r/QWSWSEGL/pvrqwswsegl.c     2010-06-02 02:03:17.000000000 +0000
-+++ qt-everywhere-opensource-src-4.6.3/src/plugins/gfxdrivers/powervr/QWSW=
SEGL/pvrqwswsegl.c   2011-05-16 23:08:51.618597097 +0000
-@@ -378,6 +378,20 @@ static WSEGLError wseglGetDrawableParame
-     return WSEGL_SUCCESS;
- }
-
-+/* Function stub for ConnectDrawable() */
-+static WSEGLError wseglConnectDrawable(WSEGLDrawableHandle hDrawable)
-+{
-+    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
-+    return WSEGL_SUCCESS;
-+}
-+
-+/* Function stub for DisconnectDrawable() */
-+static WSEGLError wseglDisconnectDrawable(WSEGLDrawableHandle hDrawable)
-+{
-+    WSEGL_UNREFERENCED_PARAMETER(hDrawable);
-+    return WSEGL_SUCCESS;
-+}
-+
- static WSEGL_FunctionTable const wseglFunctions =3D {
-     WSEGL_VERSION,
-     wseglIsDisplayValid,
-@@ -391,7 +405,9 @@ static WSEGL_FunctionTable const wseglFu
-     wseglWaitNative,
-     wseglCopyFromDrawable,
-     wseglCopyFromPBuffer,
--    wseglGetDrawableParameters
-+    wseglGetDrawableParameters,
-+    wseglConnectDrawable,
-+    wseglDisconnectDrawable
- };
-
- /* Return the table of WSEGL functions to the EGL implementation */
--
1.7.4.1



