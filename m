Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E263A6B07E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 07:40:01 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r71so7885501qkr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 23:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j8WVeTpBb1aathxprYimilxnFLsSjhWyqEnTWVBtiUE=;
	b=Qi4K5ySk/BCin89cpr2uMppReiq7g1AezA/Nc6i6s1jg12lGVmNAiCmpP/PgvPTk19
	FUZWcUbdDo64NBnhElpN7GnBmfdtBIXqdNazyHol2p6P3ryCH+B/REdWZY9rh81H8FI8
	kr87nPiWDtUCpVC586AvoMJw4Qc42DGz9RukELHxW3YsgCyZQkWNyATTGlfniUsZc7JP
	86UwfKeCRUGWcxOL54Ny4SsbwKX5PF3IpWLyWurF9F9Q3wtAHidjAH2HZTCiHMnzEsy0
	OsTfzrLt7peg+DZqZ8zmSu5sDNtSn1L46uTvrXph+QMu2oUtX2/pJMc1pH91628OoNGR
	hxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j8WVeTpBb1aathxprYimilxnFLsSjhWyqEnTWVBtiUE=;
	b=Zz2iF2saGWPs26B0KaFLUtq+fPNzsVIMx4i3nOb8UZcBO7C0Bva/qMO+w1lT5KXxnD
	DD5ezCqYT7pI42uzg4OvSyhAJ/bcTlPawlLk67kSee43IPOOvqo0lFoU9xaV50wSi6+/
	CJXS8mi+BS86z+L8tS9BDAbo5CAwuPtKKaacOfG9ng4iD8HzLyyqsLyCDTBWhkLcs33o
	HpQcgSSYMoo0q7CPkIP/VXi+WrpPX05+QRGCoxRnDNjmkoL9AWp2epN5GdQd9k3SmaHl
	cqjfg+pW6U24KYm03vsf1aqcDk6Ta+gtaygV6cUW9MJtr0TIfacyDjTCxiTEtydlOAyH
	NUxQ==
X-Gm-Message-State: AJcUukdOx4jPO7ESOchdQyB3qilhnFaOgivCdF9gF9pRBlTWLv79Ejee
	WDbP1Upy4fUnmc51PskU7EAfZ+dqp0qtxTjIIJl1yQ8++iY=
X-Google-Smtp-Source: ALg8bN46QHrGMLekEZ7oSCKMj0uUaUIsqvoVcC1/f1UxN/JS5DHK5lHvdSEyhOC9Korm73feCk8IGMQwdWKDh/33ibk=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr14615690qke.2.1545723602132; 
	Mon, 24 Dec 2018 23:40:02 -0800 (PST)
MIME-Version: 1.0
References: <1545681656-20728-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545681656-20728-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Dec 2018 23:39:36 -0800
Message-ID: <CAMKF1spWgu=4An9_yb=CAXqbijm26eQC3Rqq2r1HVj5w5VJRcw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
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
X-List-Received-Date: Tue, 25 Dec 2018 07:40:02 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/213654/

On Mon, Dec 24, 2018 at 11:59 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for wifi test suite from wifi alliance.
> Suite is to support certification program development and device certification.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  ...-Use-toolchain-from-environment-variables.patch | 92 ++++++++++++++++++++++
>  ...-include-removes-unnedded-stuff-and-add-n.patch | 59 ++++++++++++++
>  .../0003-fix-path-to-usr-sbin-for-script.patch     | 35 ++++++++
>  .../wifi-test-suite/wifi-test-suite_git.bb         | 32 ++++++++
>  4 files changed, 218 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
>  create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> new file mode 100644
> index 0000000..9ee4a51
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
> @@ -0,0 +1,92 @@
> +From 6b822b36739222d0c864249992b5d28e3ff4d948 Mon Sep 17 00:00:00 2001
> +From: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
> +Date: Mon, 3 Sep 2018 17:58:27 +0200
> +Subject: [PATCH] Use toolchain from environment variables
> +
> +Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42]
> +Signed-off-by: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> +---
> + Makefile.inc         | 7 ++++---
> + WTGService/Makefile  | 2 +-
> + console_src/Makefile | 2 +-
> + lib/Makefile         | 6 +++---
> + 4 files changed, 9 insertions(+), 8 deletions(-)
> +
> +diff --git a/Makefile.inc b/Makefile.inc
> +index b0edf5a..0094bdf 100644
> +--- a/Makefile.inc
> ++++ b/Makefile.inc
> +@@ -13,14 +13,15 @@
> + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
> + # USE OR PERFORMANCE OF THIS SOFTWARE.
> + #
> +-CC = gcc
> ++CC ?= gcc
> ++AR ?= ar
> + LIB=lib
> + DUT=dut
> + CA=ca
> + UCC=ucc
> + CON=console_src
> + WTG=WTGService
> +-MAKE=make
> ++MAKE?=make
> +
> + # This is for WMM-PS
> + #for Ext TG
> +@@ -46,7 +47,7 @@ CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
> +
> + DUTLIBS = ../lib/libwfa_dut.a -lpthread
> + CALIBS = ../lib/libwfa_ca.a -lpthread
> +-RANLIB = ranlib
> ++RANLIB ?= ranlib
> +
> + LIBWFA_NAME_DUT = libwfa_dut.a
> + LIBWFA_NAME_CA = libwfa_ca.a
> +diff --git a/WTGService/Makefile b/WTGService/Makefile
> +index 5312eb6..4855771 100644
> +--- a/WTGService/Makefile
> ++++ b/WTGService/Makefile
> +@@ -13,7 +13,7 @@
> + # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
> + # USE OR PERFORMANCE OF THIS SOFTWARE.
> + #
> +-CC=gcc
> ++CC?=gcc
> + CFLAGS= -Wall
> + LIB=-lpthread
> +
> +diff --git a/console_src/Makefile b/console_src/Makefile
> +index 8282283..d1098eb 100644
> +--- a/console_src/Makefile
> ++++ b/console_src/Makefile
> +@@ -14,7 +14,7 @@
> + # USE OR PERFORMANCE OF THIS SOFTWARE.
> + #
> +
> +-CC    = gcc
> ++CC    ?= gcc
> + CFLAGS        = -g -DWFA_DEBUG -pthread
> +
> + TARGETS = wfa_con
> +diff --git a/lib/Makefile b/lib/Makefile
> +index ffcef94..299b8d6 100644
> +--- a/lib/Makefile
> ++++ b/lib/Makefile
> +@@ -17,9 +17,9 @@
> + include ../Makefile.inc
> +
> + all:    ${LIB_OBJS}
> +-              ar crv ${LIBWFA_NAME} $?
> +-              ar crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
> +-              ar crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
> ++              $(AR) crv ${LIBWFA_NAME} $?
> ++              $(AR) crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
> ++              $(AR) crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
> +               ${RANLIB} ${LIBWFA_NAME} ${LIBWFA_NAME_DUT} ${LIBWFA_NAME_CA}
> +
> + wfa_tg.o: wfa_tg.c ../inc/wfa_agt.h ../inc/wfa_types.h ../inc/wfa_rsp.h ../inc/wfa_tlv.h  ../inc/wfa_tg.h
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> new file mode 100644
> index 0000000..67400e9
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
> @@ -0,0 +1,59 @@
> +From 1025e4c68e93e6165810e9604666fbc7994c709b Mon Sep 17 00:00:00 2001
> +From: Ankit Navik <ankit.tarot@gmail.com>
> +Date: Tue, 25 Dec 2018 00:36:59 +0530
> +Subject: [PATCH 2/2] Add missing include, removes unnedded stuff and add non
> + glib rpc
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Reto Schneider <code@reto-schneider.ch>
> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> +---
> + Makefile     | 2 +-
> + Makefile.inc | 2 +-
> + inc/wfa_tg.h | 3 +++
> + 3 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 2c41a17..5c4ad8c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -15,7 +15,7 @@
> + #
> + include Makefile.inc
> +
> +-DIRS= ${LIB} ${DUT} ${CA} ${TC} ${WTG} ${CON}
> ++DIRS= ${LIB} ${DUT} ${CA} ${TC}
> +
> + all:
> +       for i in ${DIRS}; do \
> +diff --git a/Makefile.inc b/Makefile.inc
> +index 0094bdf..46f1864 100644
> +--- a/Makefile.inc
> ++++ b/Makefile.inc
> +@@ -43,7 +43,7 @@ MAKE?=make
> + #CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC_CONSOLE -DWFA_STA_TB -Wall -I../inc
> +
> + # This is for WPA2 as default
> +-CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
> ++CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc -I/usr/include/tirpc
> +
> + DUTLIBS = ../lib/libwfa_dut.a -lpthread
> + CALIBS = ../lib/libwfa_ca.a -lpthread
> +diff --git a/inc/wfa_tg.h b/inc/wfa_tg.h
> +index 799bf9f..a1804dd 100644
> +--- a/inc/wfa_tg.h
> ++++ b/inc/wfa_tg.h
> +@@ -24,6 +24,9 @@
> + #ifndef _WFA_TG_H
> + #define _WFA_TG_H
> +
> ++#ifndef _WINDOWS
> ++#include <pthread.h>
> ++#endif
> + #include <sys/time.h>
> +
> + /* maximum number of streams to support */
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> new file mode 100644
> index 0000000..23dae6a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
> @@ -0,0 +1,35 @@
> +From ee5ffceb8c29cb66f323158123c9103d47965184 Mon Sep 17 00:00:00 2001
> +From: Ankit Navik <ankit.tarot@gmail.com>
> +Date: Tue, 25 Dec 2018 01:12:32 +0530
> +Subject: [PATCH 3/3] fix path to /usr/sbin for script
> +
> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> +---
> + lib/wfa_cs.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/wfa_cs.c b/lib/wfa_cs.c
> +index 6b1f5a2..2a18533 100644
> +--- a/lib/wfa_cs.c
> ++++ b/lib/wfa_cs.c
> +@@ -319,7 +319,7 @@ int wfaStaGetIpConfig(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
> +     /*
> +      * check a script file (the current implementation specific)
> +      */
> +-    ret = access("/usr/local/sbin/getipconfig.sh", F_OK);
> ++    ret = access("/usr/sbin/getipconfig.sh", F_OK);
> +     if(ret == -1)
> +     {
> +         ipconfigResp->status = STATUS_ERROR;
> +@@ -2115,7 +2115,7 @@ int wfaStaPresetParams(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
> +           st = remove("/tmp/processid.txt");
> +       }
> +
> +-      sprintf(cmdStr, "/usr/local/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
> ++      sprintf(cmdStr, "/usr/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
> +       st = system(cmdStr);
> +
> +       tmpfd = fopen("/tmp/processid.txt", "r+");
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
> new file mode 100644
> index 0000000..c826f8a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
> +DESCRIPTION = "Wi-Fi Test Suite is a software platform originally developed \
> +by Wi-Fi Alliance, the global non-profit industry association that brings you \
> +Wi-Fi, to support certification program development and device certification."
> +HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
> +LICENSE  = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
> +SECTION = "test"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
> +SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git \
> +       file://0001-Use-toolchain-from-environment-variables.patch \
> +       file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
> +       file://0003-fix-path-to-usr-sbin-for-script.patch \
> +"
> +
> +do_install () {
> +       install -d ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> +       install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
> +       install -d ${D}${sbindir}
> +       install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> +       install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/*.sh ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> +       install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> +}
> +
> +INSANE_SKIP_${PN} = "ldflags"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

