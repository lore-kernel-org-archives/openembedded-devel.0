Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94F8C6B06E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 08:24:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t13so6341328ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T1fau2g3io2lra57eLncdntf0/lf+mME/xWaSHHZMXY=;
	b=OzJA8//YGyvdkFvOrQyGUtNs3dO4PwKFuIgJbEphePn87rm55zbQVtJhLpaJi+0D5/
	bXi9JjBMjlmtyzSeWDVKTMa5HQVA80A4p0IXk8vzLmpdyD+yMfYvCgjD2Opf0BD9Onfk
	QgoxIFH+HNpY9vC7SCfeRrzRi8mb5s42xb/czzgR0VJtUPcuJt/fV9vqsj7TzJOV2lHU
	l+C+5up4+diPccQwSxzSuXHr7DIJrU6rg2F1aAFIOYCr1DqTQqTS9N6Q+BJyOYVmiBXg
	Z2TJLlrdYcxU1tR/Upo6NtcSaZS06KmhRpi6fXkudY8woTr28OrHxhN57rJ8rR3N9Ywt
	aN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T1fau2g3io2lra57eLncdntf0/lf+mME/xWaSHHZMXY=;
	b=ccbsNJJN6H5OKB2x5HUQYd9dlC5X3iijncpC/+rTt/9loM6/adOH/EMkSpj33XHBCq
	iPeA40nlazlCSGUvmnJ49LPdumdrZ2qgdefp8IgpHTmVDr8zbXRUY6La7GjtkEb+AS0T
	PMDowAxepCwfJMFHYeD7r0pXBWGZ5tNdaDHB24f8DyFxEEyFF0kMEJNqs8H2IrUrYgIj
	HufWcGVBXHrLic0T8i4By0svYlVCf2GZfayVt8S+hvcnhgXsV5IwtXgUTNxaXVVGFggQ
	U5qdbqDJFhnxVuvuTCSQTi/3MmZrtWV+2Ksencx3q7OpQ6WU+J1xA+B9/YsLm1w+hFVn
	wdSQ==
X-Gm-Message-State: AJcUukcpWUoK7Ni/jRp/OIylpHnSvX6Ttf5GkJKxjbBvu+HCXFIsUqxA
	99aKZ6KfFTvPEQG0Gbyexx9ajNmOYcRb4hNX1GPdYTq5
X-Google-Smtp-Source: ALg8bN662u1PLNlkszerzMauHx3l0JV3K0omvXGZ2SqxcierWsm7kdl4Q6hanM1jpBfLl2il7Y2naPv5mEJDRFudcVc=
X-Received: by 2002:a17:902:b112:: with SMTP id
	q18mr15756200plr.255.1545726280540; 
	Tue, 25 Dec 2018 00:24:40 -0800 (PST)
MIME-Version: 1.0
References: <1545681656-20728-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1spWgu=4An9_yb=CAXqbijm26eQC3Rqq2r1HVj5w5VJRcw@mail.gmail.com>
In-Reply-To: <CAMKF1spWgu=4An9_yb=CAXqbijm26eQC3Rqq2r1HVj5w5VJRcw@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 25 Dec 2018 13:54:28 +0530
Message-ID: <CAM_RqkMwaDnQTzNeUs99AqBsrLfPi1YinLAg8EvYQB3=7apSnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] wifi-test-suite: Initial recipe for wifi test suite.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Dec 2018 08:24:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Tue, Dec 25, 2018 at 1:10 PM Khem Raj <raj.khem@gmail.com> wrote:

> http://errors.yoctoproject.org/Errors/Details/213654/


submitted v3 patch.
Regards, Ankit

>
>
> On Mon, Dec 24, 2018 at 11:59 AM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
> >
> > Add generic recipe for wifi test suite from wifi alliance.
> > Suite is to support certification program development and device
> certification.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  ...-Use-toolchain-from-environment-variables.patch | 92
> ++++++++++++++++++++++
> >  ...-include-removes-unnedded-stuff-and-add-n.patch | 59 ++++++++++++++
> >  .../0003-fix-path-to-usr-sbin-for-script.patch     | 35 ++++++++
> >  .../wifi-test-suite/wifi-test-suite_git.bb         | 32 ++++++++
> >  4 files changed, 218 insertions(+)
> >  create mode 100644
> meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> >  create mode 100644
> meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> >
> > diff --git
> a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> > new file mode 100644
> > index 0000000..9ee4a51
> > --- /dev/null
> > +++
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> > @@ -0,0 +1,92 @@
> > +From 6b822b36739222d0c864249992b5d28e3ff4d948 Mon Sep 17 00:00:00 2001
> > +From: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
> > +Date: Mon, 3 Sep 2018 17:58:27 +0200
> > +Subject: [PATCH] Use toolchain from environment variables
> > +
> > +Upstream-Status: Submitted [
> https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42]
> > +Signed-off-by: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > +---
> > + Makefile.inc         | 7 ++++---
> > + WTGService/Makefile  | 2 +-
> > + console_src/Makefile | 2 +-
> > + lib/Makefile         | 6 +++---
> > + 4 files changed, 9 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/Makefile.inc b/Makefile.inc
> > +index b0edf5a..0094bdf 100644
> > +--- a/Makefile.inc
> > ++++ b/Makefile.inc
> > +@@ -13,14 +13,15 @@
> > + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
> WITH THE
> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
> > + #
> > +-CC = gcc
> > ++CC ?= gcc
> > ++AR ?= ar
> > + LIB=lib
> > + DUT=dut
> > + CA=ca
> > + UCC=ucc
> > + CON=console_src
> > + WTG=WTGService
> > +-MAKE=make
> > ++MAKE?=make
> > +
> > + # This is for WMM-PS
> > + #for Ext TG
> > +@@ -46,7 +47,7 @@ CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
> > +
> > + DUTLIBS = ../lib/libwfa_dut.a -lpthread
> > + CALIBS = ../lib/libwfa_ca.a -lpthread
> > +-RANLIB = ranlib
> > ++RANLIB ?= ranlib
> > +
> > + LIBWFA_NAME_DUT = libwfa_dut.a
> > + LIBWFA_NAME_CA = libwfa_ca.a
> > +diff --git a/WTGService/Makefile b/WTGService/Makefile
> > +index 5312eb6..4855771 100644
> > +--- a/WTGService/Makefile
> > ++++ b/WTGService/Makefile
> > +@@ -13,7 +13,7 @@
> > + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
> WITH THE
> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
> > + #
> > +-CC=gcc
> > ++CC?=gcc
> > + CFLAGS= -Wall
> > + LIB=-lpthread
> > +
> > +diff --git a/console_src/Makefile b/console_src/Makefile
> > +index 8282283..d1098eb 100644
> > +--- a/console_src/Makefile
> > ++++ b/console_src/Makefile
> > +@@ -14,7 +14,7 @@
> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
> > + #
> > +
> > +-CC    = gcc
> > ++CC    ?= gcc
> > + CFLAGS        = -g -DWFA_DEBUG -pthread
> > +
> > + TARGETS = wfa_con
> > +diff --git a/lib/Makefile b/lib/Makefile
> > +index ffcef94..299b8d6 100644
> > +--- a/lib/Makefile
> > ++++ b/lib/Makefile
> > +@@ -17,9 +17,9 @@
> > + include ../Makefile.inc
> > +
> > + all:    ${LIB_OBJS}
> > +-              ar crv ${LIBWFA_NAME} $?
> > +-              ar crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
> > +-              ar crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
> > ++              $(AR) crv ${LIBWFA_NAME} $?
> > ++              $(AR) crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
> > ++              $(AR) crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
> > +               ${RANLIB} ${LIBWFA_NAME} ${LIBWFA_NAME_DUT}
> ${LIBWFA_NAME_CA}
> > +
> > + wfa_tg.o: wfa_tg.c ../inc/wfa_agt.h ../inc/wfa_types.h
> ../inc/wfa_rsp.h ../inc/wfa_tlv.h  ../inc/wfa_tg.h
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> > new file mode 100644
> > index 0000000..67400e9
> > --- /dev/null
> > +++
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> > @@ -0,0 +1,59 @@
> > +From 1025e4c68e93e6165810e9604666fbc7994c709b Mon Sep 17 00:00:00 2001
> > +From: Ankit Navik <ankit.tarot@gmail.com>
> > +Date: Tue, 25 Dec 2018 00:36:59 +0530
> > +Subject: [PATCH 2/2] Add missing include, removes unnedded stuff and
> add non
> > + glib rpc
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Reto Schneider <code@reto-schneider.ch>
> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > +---
> > + Makefile     | 2 +-
> > + Makefile.inc | 2 +-
> > + inc/wfa_tg.h | 3 +++
> > + 3 files changed, 5 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 2c41a17..5c4ad8c 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -15,7 +15,7 @@
> > + #
> > + include Makefile.inc
> > +
> > +-DIRS= ${LIB} ${DUT} ${CA} ${TC} ${WTG} ${CON}
> > ++DIRS= ${LIB} ${DUT} ${CA} ${TC}
> > +
> > + all:
> > +       for i in ${DIRS}; do \
> > +diff --git a/Makefile.inc b/Makefile.inc
> > +index 0094bdf..46f1864 100644
> > +--- a/Makefile.inc
> > ++++ b/Makefile.inc
> > +@@ -43,7 +43,7 @@ MAKE?=make
> > + #CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC
> -DWFA_PC_CONSOLE -DWFA_STA_TB -Wall -I../inc
> > +
> > + # This is for WPA2 as default
> > +-CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
> > ++CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc -I/usr/include/tirpc
> > +
> > + DUTLIBS = ../lib/libwfa_dut.a -lpthread
> > + CALIBS = ../lib/libwfa_ca.a -lpthread
> > +diff --git a/inc/wfa_tg.h b/inc/wfa_tg.h
> > +index 799bf9f..a1804dd 100644
> > +--- a/inc/wfa_tg.h
> > ++++ b/inc/wfa_tg.h
> > +@@ -24,6 +24,9 @@
> > + #ifndef _WFA_TG_H
> > + #define _WFA_TG_H
> > +
> > ++#ifndef _WINDOWS
> > ++#include <pthread.h>
> > ++#endif
> > + #include <sys/time.h>
> > +
> > + /* maximum number of streams to support */
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> > new file mode 100644
> > index 0000000..23dae6a
> > --- /dev/null
> > +++
> b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> > @@ -0,0 +1,35 @@
> > +From ee5ffceb8c29cb66f323158123c9103d47965184 Mon Sep 17 00:00:00 2001
> > +From: Ankit Navik <ankit.tarot@gmail.com>
> > +Date: Tue, 25 Dec 2018 01:12:32 +0530
> > +Subject: [PATCH 3/3] fix path to /usr/sbin for script
> > +
> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > +---
> > + lib/wfa_cs.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/lib/wfa_cs.c b/lib/wfa_cs.c
> > +index 6b1f5a2..2a18533 100644
> > +--- a/lib/wfa_cs.c
> > ++++ b/lib/wfa_cs.c
> > +@@ -319,7 +319,7 @@ int wfaStaGetIpConfig(int len, BYTE *caCmdBuf, int
> *respLen, BYTE *respBuf)
> > +     /*
> > +      * check a script file (the current implementation specific)
> > +      */
> > +-    ret = access("/usr/local/sbin/getipconfig.sh", F_OK);
> > ++    ret = access("/usr/sbin/getipconfig.sh", F_OK);
> > +     if(ret == -1)
> > +     {
> > +         ipconfigResp->status = STATUS_ERROR;
> > +@@ -2115,7 +2115,7 @@ int wfaStaPresetParams(int len, BYTE *caCmdBuf,
> int *respLen, BYTE *respBuf)
> > +           st = remove("/tmp/processid.txt");
> > +       }
> > +
> > +-      sprintf(cmdStr, "/usr/local/sbin/findprocess.sh %s
> /tmp/processid.txt\n", "wpa_supplicant");
> > ++      sprintf(cmdStr, "/usr/sbin/findprocess.sh %s
> /tmp/processid.txt\n", "wpa_supplicant");
> > +       st = system(cmdStr);
> > +
> > +       tmpfd = fopen("/tmp/processid.txt", "r+");
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> > new file mode 100644
> > index 0000000..c826f8a
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/
> wifi-test-suite_git.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
> > +DESCRIPTION = "Wi-Fi Test Suite is a software platform originally
> developed \
> > +by Wi-Fi Alliance, the global non-profit industry association that
> brings you \
> > +Wi-Fi, to support certification program development and device
> certification."
> > +HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
> > +LICENSE  = "ISC"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
> > +SECTION = "test"
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
> > +SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git
> \
> > +       file://0001-Use-toolchain-from-environment-variables.patch \
> > +
>  file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
> > +       file://0003-fix-path-to-usr-sbin-for-script.patch \
> > +"
> > +
> > +do_install () {
> > +       install -d ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> > +       install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
> > +       install -d ${D}${sbindir}
> > +       install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> > +       install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/*.sh ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> > +       install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> > +}
> > +
> > +INSANE_SKIP_${PN} = "ldflags"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

