Return-Path: <joe@deserted.net>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 091F4780F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 13:23:45 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id i38so5981304iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=3yIh9502llfGa1nJuQpQPfj4/rUKeLUkCkVRrZwkc9k=;
	b=MzcH7j1IDaqr+HHaoXmrmM7a8h+vHdLQtHTDMrYif4LfFvJvAVBvwgwGhwTPlYHEd8
	TJXjUkH8B0+CptE3/2klYlmru/Ri2JNT6SsWErepaepYCr2quHoggGd5hyRRkHPmcxwl
	15G/izQcG7cLRVXB/bkZ9m7wkCgNrXfgztN5q45vJ2GUReisN1ZytTniBJ4DN9N7AF3j
	jraSqBoFheIIB631+alszWBAVUwBHZfm+1IvrBSr+27u4t0EmxmDlTPkgIA4P+5eVYrY
	h0GtxHAGuM3/NxJi05PRsTgdGWNUki2kzQogRJQTQCrpNO5PZP6UdUkAfSQQpayH7WRx
	jaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=3yIh9502llfGa1nJuQpQPfj4/rUKeLUkCkVRrZwkc9k=;
	b=MDRMNB23c1YJrf/LOH4gQBv7wh29kJOZUvabE9VHqQY3ylyzQ5NRfH8dtqk26M/JaK
	m2nyJ//52d0ocNqqKeAurgmmzF9f6Ivc8HySUb7jpfRIqXs2dFE4M4SqAXl7KHEKNAYM
	QbsQ/7pPyXtfdcJvtncA6CKQG94yYlIk2LimldWZyDi+Pvg7LHj8/9vZE6atscSpIdos
	xM4fX5eF0/mBAk8Sh0kIXlJU8C7+uS89yAKmP7QUBYlZPgHUJw4YIlevmDi4GUTXos3y
	dlw3ngXnzrgCzYvWbxERY3/wSoxBBO5RqfUdumUfRz64aBT5IfX7qto9kytuaFzoST6n
	AuJA==
X-Gm-Message-State: AMCzsaVoDxgeoF4wibIQehIM2t+ve77uKO8z+RXUCEuVjd3Qhao7IHhc
	QEHjrx8FL0oj/VrjlEiZPvSWjau7
X-Google-Smtp-Source: ABhQp+Qe/4528B7NemGVVcEKAkBWKKWuE6ou7BI0KeZVqZ5YdiQAm4vHitoAPWL/hsIpaTM19+qc3Q==
X-Received: by 10.107.200.6 with SMTP id y6mr6888653iof.123.1509542626598;
	Wed, 01 Nov 2017 06:23:46 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	d129sm256232ioe.1.2017.11.01.06.23.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 06:23:46 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 09:23:38 -0400
Message-Id: <1509542622-20015-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH v2 2/6] lksctp-tools: update and remove from blacklist
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
X-List-Received-Date: Wed, 01 Nov 2017 13:23:46 -0000

Switching lksctp-tools to build from the upstream git repository rather
than a source tarball.  At the same time we'll un-blacklist it since it
appears the gold-as-ld issue has been resolved underneath us, probably
related to a Debian bug of the same form that was also resolved with a
binutils update.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../lksctp-tools/lksctp-tools_1.0.17.bb             | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
index 11c43ff..121cc99 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
@@ -8,22 +8,19 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
+SRCREV = "736b91d340e3f2519714f2930ed63b164d363511"
+
+PV .= "+git${SRCPV}"
+LK_REL = "1.0.17"
+
+SRC_URI = " \
+    git://github.com/sctp/lksctp-tools.git \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
 "
 
-SRC_URI[md5sum] = "68e9b8fa4d4e331029b247b72d46d7a5"
-SRC_URI[sha256sum] = "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c0a8ca9b10533aa15"
-
-#| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/connectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .libs/recvmsg.o    -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-script=/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o .libs/libsctp.so.1.0.16
-#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
-#| collect2: error: ld returned 1 exit status
-#| make[4]: *** [libsctp.la] Error 1
-PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
-
-S = "${WORKDIR}/${BP}"
+S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 
@@ -37,7 +34,7 @@ do_install_ptest () {
     done
 }
 
-SOLIBVERSION="${PV}"
+SOLIBVERSION="${LK_REL}"
 SOLIBMAJORVERSION="1"
 
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
-- 
2.7.4


