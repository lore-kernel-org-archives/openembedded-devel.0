Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CA91277980
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:43 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 20so47626625pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=348BhKU3fyYv1QrOVv9GZpRcd74va1HZqoMl50R1mvI=;
	b=NjGlWIuibOBmqyqkQF2JUxc30eDtmVM5OGhWERAO0JSFHIOeu9gVWbK7ruBl5jgUIr
	hYsQTGmcJFdkslLfjCT/l/CfUgaI8KWo6uBo8m2IH89W37xOWHrgnTeOr/+evQqUoIaA
	vtdaMhwqsl5kAZLp9gS3puCttrzi7b0sV/Gv5+T1EsGEyzpsOU4hb6w71kc7S4utBiS0
	RIA9vFsyGaZxvruAHZNPC/BCuiiX7hDN6rJPmn3dIDyPHNfVC21lkO+3wTOONvIXwhpH
	/NBnbtNFY90R3UyeQtx9bzd1mD65aXbksXzMeBcCgS4B4W2NwEQry9af0yUde92kMEaZ
	1KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=348BhKU3fyYv1QrOVv9GZpRcd74va1HZqoMl50R1mvI=;
	b=QD5sMFIRpyICAiD2OdiyFJmtvNFXEadxc8D4JUQ1sjTLfCIaR9w0VHK7x/m2jrFRTg
	5jim9tKJ/0Idn+6ImIi/Snh+8NANRDZw0vD1iuvJoK1K+HVpyjrNMAJP0C0wYLGYTVtQ
	F8sWhfzLCP4y5LfNl51mFNOE8ZYQdsAlVD4vCmD5I5QXNAAhEMLRN8iZB66Yxwt8D02X
	fHcA3U7eRMCgmblPU0Ou34K1uDJHcBe/7gxpOdH9P6dJK5HA81fIgYiXxww40I5A3tyU
	OYtmw6tqySyr7PeK+pZ4jyK5dmTJs3LHtPApb7rw0VE49Ku13H2XMB2fXSY+H2k6p219
	rlzg==
X-Gm-Message-State: AFeK/H2Knu5yHjTYJhQkJ977bhZPenBz9OXrx8BC6APfqVotdB/Q9cV6LpPcJbLmSi9yGA==
X-Received: by 10.84.214.129 with SMTP id j1mr58112454pli.23.1490208344607;
	Wed, 22 Mar 2017 11:45:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:25 -0700
Message-Id: <20170322184533.6501-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/10] netcat-openbsd: Fix build and whitelist
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:46 -0000

pkgconfig is used so we need to inherit pkgconfig
secondly, base64 support is added for it to work
with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bundle-own-base64-encode-decode-functions.patch | 379 +++++++++++++++++++++
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |  22 +-
 meta-networking/recipes-support/netcat/netcat.inc  |   2 +-
 3 files changed, 395 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
new file mode 100644
index 000000000..0966b6580
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
@@ -0,0 +1,379 @@
+From ccd166b73eaae4dd1e1785c63ceb9b303568ed46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Mar 2017 11:30:49 -0700
+Subject: [PATCH] bundle own base64 encode/decode functions
+
+Not all libc implementations provide it.
+as an aside libresolv is no longer needed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile |   4 +-
+ base64.c | 313 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ netcat.c |   2 +
+ socks.c  |   3 +
+ 4 files changed, 320 insertions(+), 2 deletions(-)
+ create mode 100644 base64.c
+
+Index: netcat-openbsd-1.105/Makefile
+===================================================================
+--- netcat-openbsd-1.105.orig/Makefile
++++ netcat-openbsd-1.105/Makefile
+@@ -1,9 +1,9 @@
+ #       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $
+ 
+ PROG=	nc
+-SRCS=	netcat.c atomicio.c socks.c
++SRCS=	netcat.c atomicio.c socks.c base64.c
+ 
+-LIBS=  `pkg-config --libs libbsd` -lresolv
++LIBS=  `pkg-config --libs libbsd`
+ OBJS=  $(SRCS:.c=.o)
+ CFLAGS=  -g -O2
+ LDFLAGS=  -Wl,--no-add-needed
+Index: netcat-openbsd-1.105/base64.c
+===================================================================
+--- /dev/null
++++ netcat-openbsd-1.105/base64.c
+@@ -0,0 +1,313 @@
++/*
++ * Copyright (c) 1996-1999 by Internet Software Consortium.
++ *
++ * Permission to use, copy, modify, and distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISCLAIMS
++ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
++ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ */
++
++/*
++ * Portions Copyright (c) 1995 by International Business Machines, Inc.
++ *
++ * International Business Machines, Inc. (hereinafter called IBM) grants
++ * permission under its copyrights to use, copy, modify, and distribute this
++ * Software with or without fee, provided that the above copyright notice and
++ * all paragraphs of this notice appear in all copies, and that the name of IBM
++ * not be used in connection with the marketing of any product incorporating
++ * the Software or modifications thereof, without specific, written prior
++ * permission.
++ *
++ * To the extent it has a right to do so, IBM grants an immunity from suit
++ * under its patents, if any, for the use, sale or manufacture of products to
++ * the extent that such products are used for performing Domain Name System
++ * dynamic updates in TCP/IP networks by means of the Software.  No immunity is
++ * granted for any product per se or for any other function of any product.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL WARRANTIES,
++ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
++ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY SPECIAL,
++ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE, EVEN
++ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
++ */
++
++#if !defined(LINT) && !defined(CODECENTER)
++static const char rcsid[] = "$BINDId: base64.c,v 8.7 1999/10/13 16:39:33 vixie Exp $";
++#endif /* not lint */
++
++#include <sys/types.h>
++#include <sys/param.h>
++#include <sys/socket.h>
++
++#include <netinet/in.h>
++#include <arpa/inet.h>
++#include <arpa/nameser.h>
++
++#include <ctype.h>
++#include <resolv.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++#define Assert(Cond) if (!(Cond)) abort()
++
++static const char Base64[] =
++	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
++static const char Pad64 = '=';
++
++/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
++   The following encoding technique is taken from RFC 1521 by Borenstein
++   and Freed.  It is reproduced here in a slightly edited form for
++   convenience.
++
++   A 65-character subset of US-ASCII is used, enabling 6 bits to be
++   represented per printable character. (The extra 65th character, "=",
++   is used to signify a special processing function.)
++
++   The encoding process represents 24-bit groups of input bits as output
++   strings of 4 encoded characters. Proceeding from left to right, a
++   24-bit input group is formed by concatenating 3 8-bit input groups.
++   These 24 bits are then treated as 4 concatenated 6-bit groups, each
++   of which is translated into a single digit in the base64 alphabet.
++
++   Each 6-bit group is used as an index into an array of 64 printable
++   characters. The character referenced by the index is placed in the
++   output string.
++
++                         Table 1: The Base64 Alphabet
++
++      Value Encoding  Value Encoding  Value Encoding  Value Encoding
++          0 A            17 R            34 i            51 z
++          1 B            18 S            35 j            52 0
++          2 C            19 T            36 k            53 1
++          3 D            20 U            37 l            54 2
++          4 E            21 V            38 m            55 3
++          5 F            22 W            39 n            56 4
++          6 G            23 X            40 o            57 5
++          7 H            24 Y            41 p            58 6
++          8 I            25 Z            42 q            59 7
++          9 J            26 a            43 r            60 8
++         10 K            27 b            44 s            61 9
++         11 L            28 c            45 t            62 +
++         12 M            29 d            46 u            63 /
++         13 N            30 e            47 v
++         14 O            31 f            48 w         (pad) =
++         15 P            32 g            49 x
++         16 Q            33 h            50 y
++
++   Special processing is performed if fewer than 24 bits are available
++   at the end of the data being encoded.  A full encoding quantum is
++   always completed at the end of a quantity.  When fewer than 24 input
++   bits are available in an input group, zero bits are added (on the
++   right) to form an integral number of 6-bit groups.  Padding at the
++   end of the data is performed using the '=' character.
++
++   Since all base64 input is an integral number of octets, only the
++         -------------------------------------------------
++   following cases can arise:
++
++       (1) the final quantum of encoding input is an integral
++           multiple of 24 bits; here, the final unit of encoded
++	   output will be an integral multiple of 4 characters
++	   with no "=" padding,
++       (2) the final quantum of encoding input is exactly 8 bits;
++           here, the final unit of encoded output will be two
++	   characters followed by two "=" padding characters, or
++       (3) the final quantum of encoding input is exactly 16 bits;
++           here, the final unit of encoded output will be three
++	   characters followed by one "=" padding character.
++   */
++
++int
++b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize) {
++	size_t datalength = 0;
++	u_char input[3];
++	u_char output[4];
++	size_t i;
++
++	while (2 < srclength) {
++		input[0] = *src++;
++		input[1] = *src++;
++		input[2] = *src++;
++		srclength -= 3;
++
++		output[0] = input[0] >> 2;
++		output[1] = ((input[0] & 0x03) << 4) + (input[1] >> 4);
++		output[2] = ((input[1] & 0x0f) << 2) + (input[2] >> 6);
++		output[3] = input[2] & 0x3f;
++		Assert(output[0] < 64);
++		Assert(output[1] < 64);
++		Assert(output[2] < 64);
++		Assert(output[3] < 64);
++
++		if (datalength + 4 > targsize)
++			return (-1);
++		target[datalength++] = Base64[output[0]];
++		target[datalength++] = Base64[output[1]];
++		target[datalength++] = Base64[output[2]];
++		target[datalength++] = Base64[output[3]];
++	}
++
++	/* Now we worry about padding. */
++	if (0 != srclength) {
++		/* Get what's left. */
++		input[0] = input[1] = input[2] = '\0';
++		for (i = 0; i < srclength; i++)
++			input[i] = *src++;
++
++		output[0] = input[0] >> 2;
++		output[1] = ((input[0] & 0x03) << 4) + (input[1] >> 4);
++		output[2] = ((input[1] & 0x0f) << 2) + (input[2] >> 6);
++		Assert(output[0] < 64);
++		Assert(output[1] < 64);
++		Assert(output[2] < 64);
++
++		if (datalength + 4 > targsize)
++			return (-1);
++		target[datalength++] = Base64[output[0]];
++		target[datalength++] = Base64[output[1]];
++		if (srclength == 1)
++			target[datalength++] = Pad64;
++		else
++			target[datalength++] = Base64[output[2]];
++		target[datalength++] = Pad64;
++	}
++	if (datalength >= targsize)
++		return (-1);
++	target[datalength] = '\0';	/* Returned value doesn't count \0. */
++	return (datalength);
++}
++//libresolv_hidden_def (b64_ntop)
++
++/* skips all whitespace anywhere.
++   converts characters, four at a time, starting at (or after)
++   src from base - 64 numbers into three 8 bit bytes in the target area.
++   it returns the number of data bytes stored at the target, or -1 on error.
++ */
++
++int
++b64_pton(char const *src, u_char *target, size_t targsize) {
++	int tarindex, state, ch;
++	char *pos;
++
++	state = 0;
++	tarindex = 0;
++
++	while ((ch = *src++) != '\0') {
++		if (isspace(ch))	/* Skip whitespace anywhere. */
++			continue;
++
++		if (ch == Pad64)
++			break;
++
++		pos = strchr(Base64, ch);
++		if (pos == 0) 		/* A non-base64 character. */
++			return (-1);
++
++		switch (state) {
++		case 0:
++			if (target) {
++				if ((size_t)tarindex >= targsize)
++					return (-1);
++				target[tarindex] = (pos - Base64) << 2;
++			}
++			state = 1;
++			break;
++		case 1:
++			if (target) {
++				if ((size_t)tarindex + 1 >= targsize)
++					return (-1);
++				target[tarindex]   |=  (pos - Base64) >> 4;
++				target[tarindex+1]  = ((pos - Base64) & 0x0f)
++							<< 4 ;
++			}
++			tarindex++;
++			state = 2;
++			break;
++		case 2:
++			if (target) {
++				if ((size_t)tarindex + 1 >= targsize)
++					return (-1);
++				target[tarindex]   |=  (pos - Base64) >> 2;
++				target[tarindex+1]  = ((pos - Base64) & 0x03)
++							<< 6;
++			}
++			tarindex++;
++			state = 3;
++			break;
++		case 3:
++			if (target) {
++				if ((size_t)tarindex >= targsize)
++					return (-1);
++				target[tarindex] |= (pos - Base64);
++			}
++			tarindex++;
++			state = 0;
++			break;
++		default:
++			abort();
++		}
++	}
++
++	/*
++	 * We are done decoding Base-64 chars.  Let's see if we ended
++	 * on a byte boundary, and/or with erroneous trailing characters.
++	 */
++
++	if (ch == Pad64) {		/* We got a pad char. */
++		ch = *src++;		/* Skip it, get next. */
++		switch (state) {
++		case 0:		/* Invalid = in first position */
++		case 1:		/* Invalid = in second position */
++			return (-1);
++
++		case 2:		/* Valid, means one byte of info */
++			/* Skip any number of spaces. */
++			for ((void)NULL; ch != '\0'; ch = *src++)
++				if (!isspace(ch))
++					break;
++			/* Make sure there is another trailing = sign. */
++			if (ch != Pad64)
++				return (-1);
++			ch = *src++;		/* Skip the = */
++			/* Fall through to "single trailing =" case. */
++			/* FALLTHROUGH */
++
++		case 3:		/* Valid, means two bytes of info */
++			/*
++			 * We know this char is an =.  Is there anything but
++			 * whitespace after it?
++			 */
++			for ((void)NULL; ch != '\0'; ch = *src++)
++				if (!isspace(ch))
++					return (-1);
++
++			/*
++			 * Now make sure for cases 2 and 3 that the "extra"
++			 * bits that slopped past the last full byte were
++			 * zeros.  If we don't check them, they become a
++			 * subliminal channel.
++			 */
++			if (target && target[tarindex] != 0)
++				return (-1);
++		}
++	} else {
++		/*
++		 * We ended by seeing the end of the string.  Make sure we
++		 * have no partial bytes lying around.
++		 */
++		if (state != 0)
++			return (-1);
++	}
++
++	return (tarindex);
++}
+Index: netcat-openbsd-1.105/netcat.c
+===================================================================
+--- netcat-openbsd-1.105.orig/netcat.c
++++ netcat-openbsd-1.105/netcat.c
+@@ -169,6 +169,9 @@ static int connect_with_timeout(int fd,
+         socklen_t salen, int ctimeout);
+ static void quit();
+ 
++int	b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
++int	b64_pton(char const *src, u_char *target, size_t targsize);
++
+ int
+ main(int argc, char *argv[])
+ {
+Index: netcat-openbsd-1.105/socks.c
+===================================================================
+--- netcat-openbsd-1.105.orig/socks.c
++++ netcat-openbsd-1.105/socks.c
+@@ -53,6 +53,9 @@
+ #define SOCKS_DOMAIN	3
+ #define SOCKS_IPV6	4
+ 
++int	b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
++int	b64_pton(char const *src, u_char *target, size_t targsize);
++
+ int	remote_connect(const char *, const char *, struct addrinfo);
+ int	socks_connect(const char *, const char *, struct addrinfo,
+ 	    const char *, const char *, struct addrinfo, int,
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index bb21e0cfe..bb4e36c0a 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -2,20 +2,21 @@ require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
 
 DEPENDS += "glib-2.0 libbsd"
+do_patch[depends] = "quilt-native:do_populate_sysroot"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
+           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch;subdir=${PN}-${PV} \
+           file://0001-bundle-own-base64-encode-decode-functions.patch \
+           "
 
 SRC_URI[netcat.md5sum] = "7e67b22f1ad41a1b7effbb59ff28fca1"
 SRC_URI[netcat.sha256sum] = "40653fe66c1516876b61b07e093d826e2a5463c5d994f1b7e6ce328f3edb211e"
 SRC_URI[netcat-patch.md5sum] = "e914f8eb7eda5c75c679dd77787ac76b"
 SRC_URI[netcat-patch.sha256sum] = "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a2c9d037bbc8f882b363"
 
-S = "${WORKDIR}/${BPN}-${PV}"
-
 EXTRA_OEMAKE += "'LDFLAGS=${LDFLAGS}'"
 
 do_configure[noexec] = "1"
@@ -23,9 +24,18 @@ do_configure[noexec] = "1"
 netcat_do_patch() {
     cd ${S}
     quilt pop -a || true
-    QUILT_PATCHES=${WORKDIR}/debian/patches QUILT_SERIES=${WORKDIR}/debian/patches/series quilt push -a
+    if [ -d ${S}/.pc-netcat ]; then
+            rm -rf ${S}/.pc
+            mv ${S}/.pc-netcat ${S}/.pc
+            QUILT_PATCHES=${S}/debian/patches quilt pop -a
+            rm -rf ${S}/.pc ${S}/debian
+    fi
+    QUILT_PATCHES=${S}/debian/patches quilt push -a
+    mv ${S}/.pc ${S}/.pc-netcat
 }
 
+do_unpack[cleandirs] += "${S}"
+
 python do_patch() {
     bb.build.exec_func('netcat_do_patch', d)
     bb.build.exec_func('patch_do_patch', d)
@@ -42,5 +52,3 @@ do_install() {
     install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "60"
-
-PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130673/"
diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
index 91a24a106..15441645b 100644
--- a/meta-networking/recipes-support/netcat/netcat.inc
+++ b/meta-networking/recipes-support/netcat/netcat.inc
@@ -9,7 +9,7 @@ connection you would need and has several interesting built-in \
 capabilities."
 
 SECTION = "net"
-inherit update-alternatives gettext
+inherit update-alternatives gettext pkgconfig
 
 ALTERNATIVE_${PN} = "nc"
 
-- 
2.12.0


