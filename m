Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA6D6B7DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 07:19:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n32so19304023qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 23:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QSn4eUsfmgGorK3gU7rUwhhpHEiLCQ9VNS4wqRRWJPo=;
	b=dilQWgVxh6YZV8VE7pO/to6W9JBkXON0LIPWYC6BaEqF1mD96UDyX1PgYJGoz+NAQe
	+LkLo5LRJ9Gwd2xsNDz7QpU5wXlbh6m9mJFjF/kqiZMntm3Hwx/e19l18+lw6az9bN+I
	OpB4/Ye8q0hqjtmG0ZzcY7UoiP9HeDaAwow5yPmAycEwVP9HNPQlC1pwv5cbXJIc+7dR
	YRrrlejAIK17RxIuubANSAP7VzdPYIPOW5qsyISeI9dK5nbdo/XVA6mzYugwxQtTNLaX
	pKEQGytW6NNQf44QGS+DhnS7axby8M70FYC+WuK6AoWl/iCyNntvGip1fNCRr4QuOwVJ
	Zctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QSn4eUsfmgGorK3gU7rUwhhpHEiLCQ9VNS4wqRRWJPo=;
	b=S+8r+5G5TOpxmcYpreb/2o6R+iH+gEBWLwLYaGMHmr2EVd7pXo37rGN1MOPJJlcXlD
	IEl+e6XW/w4Enu3B7NMbHxrqmAzNYRESe94VoVJS/915JYFlEuoSrXCUw2Im1z14Rw2V
	WIzjmPinI3aHDLaHVosLvbmODpBKUX40/ZKbDdxs/kueUVUWdGWG12frE+qmndWShc+O
	jGBVn6neT7H2g3PifK6bCh18gt12VEtQ0k3YhhLUyIJEPPd1N50DsGCXmer259RKl5tp
	Riv+FjyMMans7N+yalWCwoVClLuwwEeROeQ3kv9y5k/JZySt05Yooc8Cu31GapN6bNEW
	7Gng==
X-Gm-Message-State: AJcUukdI1hHZkDAmnzcitnse4EodMwIG5ELnH9o1Bzryc9TNt98+i6nd
	JvmlSFJi9b/s0P041L55Thm7VYqoBsGZ6cMp2XQ=
X-Google-Smtp-Source: ALg8bN5PozzH07emppsOYRTx4XSNxVs6wXeATi4flfKZhqqQqJKMik+si6OtffebNwCHoSaGOFe/fJzwi2ayOul9QPU=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr20771998qtc.236.1545895151795;
	Wed, 26 Dec 2018 23:19:11 -0800 (PST)
MIME-Version: 1.0
References: <1545726268-30773-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1sqqNB5H2FTszWnA2B7_TSHmYcoS3yvjgg8f9F6q-VaLdQ@mail.gmail.com>
	<CAM_RqkPXmvWxtgqbs6BgRMwyRMMBire38JGSQu3cFjNeU8cDkg@mail.gmail.com>
In-Reply-To: <CAM_RqkPXmvWxtgqbs6BgRMwyRMMBire38JGSQu3cFjNeU8cDkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Dec 2018 23:18:45 -0800
Message-ID: <CAMKF1sqDhdMgOcs_=Mxwh3D64QBP-q2GC-Q4_9ukEVxftmLOQA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Thu, 27 Dec 2018 07:19:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 26, 2018 at 11:13 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Raj,
>
> On Tue, Dec 25, 2018 at 11:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Hi Ankit
>>
>> I provided some additional comments inline
>>
>>
>> On Tue, Dec 25, 2018 at 12:23 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>> >
>> > Add generic recipe for wifi test suite from wifi alliance.
>> > Suite is to support certification program development and device certification.
>> >
>> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > ---
>> >  ...-Use-toolchain-from-environment-variables.patch | 92 ++++++++++++++++++++++
>> >  ...-include-removes-unnedded-stuff-and-add-n.patch | 45 +++++++++++
>> >  .../0003-fix-path-to-usr-sbin-for-script.patch     | 35 ++++++++
>> >  .../wifi-test-suite/wifi-test-suite_git.bb         | 35 ++++++++
>> >  4 files changed, 207 insertions(+)
>> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
>> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
>> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
>> >  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
>> >
>> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
>> > new file mode 100644
>> > index 0000000..9ee4a51
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
>> > @@ -0,0 +1,92 @@
>> > +From 6b822b36739222d0c864249992b5d28e3ff4d948 Mon Sep 17 00:00:00 2001
>> > +From: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
>> > +Date: Mon, 3 Sep 2018 17:58:27 +0200
>> > +Subject: [PATCH] Use toolchain from environment variables
>> > +
>> > +Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42]
>> > +Signed-off-by: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
>> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > +---
>> > + Makefile.inc         | 7 ++++---
>> > + WTGService/Makefile  | 2 +-
>> > + console_src/Makefile | 2 +-
>> > + lib/Makefile         | 6 +++---
>> > + 4 files changed, 9 insertions(+), 8 deletions(-)
>> > +
>> > +diff --git a/Makefile.inc b/Makefile.inc
>> > +index b0edf5a..0094bdf 100644
>> > +--- a/Makefile.inc
>> > ++++ b/Makefile.inc
>> > +@@ -13,14 +13,15 @@
>> > + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
>> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
>> > + #
>> > +-CC = gcc
>> > ++CC ?= gcc
>> > ++AR ?= ar
>> > + LIB=lib
>> > + DUT=dut
>> > + CA=ca
>> > + UCC=ucc
>> > + CON=console_src
>> > + WTG=WTGService
>> > +-MAKE=make
>> > ++MAKE?=make
>> > +
>> > + # This is for WMM-PS
>> > + #for Ext TG
>> > +@@ -46,7 +47,7 @@ CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
>> > +
>> > + DUTLIBS = ../lib/libwfa_dut.a -lpthread
>> > + CALIBS = ../lib/libwfa_ca.a -lpthread
>> > +-RANLIB = ranlib
>> > ++RANLIB ?= ranlib
>> > +
>> > + LIBWFA_NAME_DUT = libwfa_dut.a
>> > + LIBWFA_NAME_CA = libwfa_ca.a
>> > +diff --git a/WTGService/Makefile b/WTGService/Makefile
>> > +index 5312eb6..4855771 100644
>> > +--- a/WTGService/Makefile
>> > ++++ b/WTGService/Makefile
>> > +@@ -13,7 +13,7 @@
>> > + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
>> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
>> > + #
>> > +-CC=gcc
>> > ++CC?=gcc
>> > + CFLAGS= -Wall
>> > + LIB=-lpthread
>> > +
>> > +diff --git a/console_src/Makefile b/console_src/Makefile
>> > +index 8282283..d1098eb 100644
>> > +--- a/console_src/Makefile
>> > ++++ b/console_src/Makefile
>> > +@@ -14,7 +14,7 @@
>> > + # USE OR PERFORMANCE OF THIS SOFTWARE.
>> > + #
>> > +
>> > +-CC    = gcc
>> > ++CC    ?= gcc
>> > + CFLAGS        = -g -DWFA_DEBUG -pthread
>> > +
>> > + TARGETS = wfa_con
>> > +diff --git a/lib/Makefile b/lib/Makefile
>> > +index ffcef94..299b8d6 100644
>> > +--- a/lib/Makefile
>> > ++++ b/lib/Makefile
>> > +@@ -17,9 +17,9 @@
>> > + include ../Makefile.inc
>> > +
>> > + all:    ${LIB_OBJS}
>> > +-              ar crv ${LIBWFA_NAME} $?
>> > +-              ar crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
>> > +-              ar crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
>> > ++              $(AR) crv ${LIBWFA_NAME} $?
>> > ++              $(AR) crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
>> > ++              $(AR) crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
>> > +               ${RANLIB} ${LIBWFA_NAME} ${LIBWFA_NAME_DUT} ${LIBWFA_NAME_CA}
>> > +
>> > + wfa_tg.o: wfa_tg.c ../inc/wfa_agt.h ../inc/wfa_types.h ../inc/wfa_rsp.h ../inc/wfa_tlv.h  ../inc/wfa_tg.h
>> > +--
>> > +2.7.4
>> > +
>> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
>> > new file mode 100644
>> > index 0000000..43be917
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
>> > @@ -0,0 +1,45 @@
>> > +From 451b162c903a1ef070a75dc18171620f3beef7b3 Mon Sep 17 00:00:00 2001
>> > +From: Ankit Navik <ankit.tarot@gmail.com>
>> > +Date: Tue, 25 Dec 2018 00:36:59 +0530
>> > +Subject: [PATCH 2/3] Add missing include, removes unnedded stuff and add non
>> > + glib rpc
>>
>> typo here, I guess you mean glibc.
>>
>> > +
>> > +Upstream-Status: Inappropriate [embedded specific]
>> > +
>> > +Signed-off-by: Reto Schneider <code@reto-schneider.ch>
>> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > +---
>> > + Makefile     | 2 +-
>> > + inc/wfa_tg.h | 3 +++
>> > + 2 files changed, 4 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/Makefile b/Makefile
>> > +index 2c41a17..5c4ad8c 100644
>> > +--- a/Makefile
>> > ++++ b/Makefile
>> > +@@ -15,7 +15,7 @@
>> > + #
>> > + include Makefile.inc
>> > +
>> > +-DIRS= ${LIB} ${DUT} ${CA} ${TC} ${WTG} ${CON}
>> > ++DIRS= ${LIB} ${DUT} ${CA} ${TC}
>> > +
>> > + all:
>> > +       for i in ${DIRS}; do \
>> > +diff --git a/inc/wfa_tg.h b/inc/wfa_tg.h
>> > +index 799bf9f..a1804dd 100644
>> > +--- a/inc/wfa_tg.h
>> > ++++ b/inc/wfa_tg.h
>> > +@@ -24,6 +24,9 @@
>> > + #ifndef _WFA_TG_H
>> > + #define _WFA_TG_H
>> > +
>> > ++#ifndef _WINDOWS
>> > ++#include <pthread.h>
>> > ++#endif
>> > + #include <sys/time.h>
>> > +
>> > + /* maximum number of streams to support */
>> > +--
>> > +2.7.4
>> > +
>> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
>> > new file mode 100644
>> > index 0000000..23dae6a
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
>> > @@ -0,0 +1,35 @@
>> > +From ee5ffceb8c29cb66f323158123c9103d47965184 Mon Sep 17 00:00:00 2001
>> > +From: Ankit Navik <ankit.tarot@gmail.com>
>> > +Date: Tue, 25 Dec 2018 01:12:32 +0530
>> > +Subject: [PATCH 3/3] fix path to /usr/sbin for script
>> > +
>> > +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > +---
>> > + lib/wfa_cs.c | 4 ++--
>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>> > +
>> > +diff --git a/lib/wfa_cs.c b/lib/wfa_cs.c
>> > +index 6b1f5a2..2a18533 100644
>> > +--- a/lib/wfa_cs.c
>> > ++++ b/lib/wfa_cs.c
>> > +@@ -319,7 +319,7 @@ int wfaStaGetIpConfig(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
>> > +     /*
>> > +      * check a script file (the current implementation specific)
>> > +      */
>> > +-    ret = access("/usr/local/sbin/getipconfig.sh", F_OK);
>> > ++    ret = access("/usr/sbin/getipconfig.sh", F_OK);
>> > +     if(ret == -1)
>> > +     {
>> > +         ipconfigResp->status = STATUS_ERROR;
>> > +@@ -2115,7 +2115,7 @@ int wfaStaPresetParams(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
>> > +           st = remove("/tmp/processid.txt");
>> > +       }
>> > +
>> > +-      sprintf(cmdStr, "/usr/local/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
>> > ++      sprintf(cmdStr, "/usr/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
>> > +       st = system(cmdStr);
>> > +
>> > +       tmpfd = fopen("/tmp/processid.txt", "r+");
>> > +--
>> > +2.7.4
>> > +
>> > diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
>> > new file mode 100644
>> > index 0000000..164d5d6
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
>> > @@ -0,0 +1,35 @@
>> > +SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
>> > +DESCRIPTION = "Wi-Fi Test Suite is a software platform originally developed \
>> > +by Wi-Fi Alliance, the global non-profit industry association that brings you \
>> > +Wi-Fi, to support certification program development and device certification."
>> > +HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
>> > +LICENSE  = "ISC"
>> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
>> > +SECTION = "test"
>>
>> I see above that some scripts are calling wpa_supplicant, but its not
>> in RDEPENDS
>> probably that needs to be added here via RDEPENDS_${PN}
>>
>> > +
>> > +S = "${WORKDIR}/git"
>> > +SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
>> > +SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git \
>> > +       file://0001-Use-toolchain-from-environment-variables.patch \
>> > +       file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
>> > +       file://0003-fix-path-to-usr-sbin-for-script.patch \
>> > +"
>> > +
>> > +# Fix for non glib based rpc and to avoid host path QA error
>>
>> latest glibc uses tirpc too. so this comment should not call out glibc
>> host path QA could still be valid.
>>
>> > +CFLAGS += "-I${STAGING_INCDIR}/tirpc"
>> > +
>> > +do_install () {
>> > +       install -d ${D}${libdir}
>> > +       install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
>> > +       install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
>> > +       install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
>> > +       install -d ${D}${sbindir}
>> > +       install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
>> > +       install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
>> > +       install -m 0644 ${S}/scripts/*.sh ${D}${sbindir}
>>
>> scripts should be 0755
>>
>> > +       install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
>> > +       install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
>> > +       install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
>>
>> are these config files or scripts which are executed, in case of scripts
>> then 0755 is right mode
>>
>>
>> > +}
>> > +
>> > +INSANE_SKIP_${PN} = "ldflags"
>>
>> why do we need this ?
>
> There was an error " No GNU_HASH in the ELF binary" and  "didn't pass LDFLAGS? [ldflags]"
>

You might want to add

TARGET_CC_ARCH += "${LDFLAGS}"

to fix gnu hash errors.

> Regards, Ankit
>>
>>
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

