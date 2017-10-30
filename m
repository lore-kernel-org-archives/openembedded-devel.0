Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6891471B2E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 101so29227977ioj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=H7CaSro78SoAaZePEgUy98QceJzRHHbhPe7TC9n4xhs=;
	b=do8OMkZPeOpccO6qoi5WS+jptZU/fwubEjVyEYLk2U8wer05ZDxBMHNXlRmEv88Kqa
	wZCooMO41IWy/jigtxvcfCrv/NCKwEVr3qiyH17Sr8YUtYSpetABWCmxiH6KBYXbVe6N
	NEYE1dFIOIihL76eobdUFlAv8jJaNnes/tc4c3JKN0FTPK4SgUOQekfU5VhFOzdLeITH
	bMS5M8cQd6xGUOBqMuE6H7PgLjX3QZx5zOkcXsqak5DZ7231U86lVcTTALAJaJEEvvXu
	rg3oXvQ2NajNfnWR/ABYu06iO1Z8oy+NH1MvqiOTXjYG+VZigr13kS4p4PyQJTVUVlz7
	+a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=H7CaSro78SoAaZePEgUy98QceJzRHHbhPe7TC9n4xhs=;
	b=QyQ7NsgVTDmYxoVlrB9/KXaMJNdv5Vdhg70QMioAH3MxBYbvB/PM+Svxr0OOerfRqj
	6KLVJVqe96V/i819u6QEG1RgeomguSZAM9L0g7XH82aI9d1V88GmHD3WvOAKeKi/GJ2J
	gzCu2yIKvkE+qIRGhE8uk2KYmOjW00KTZo5Npq3WLXeziZJdayaTiFIMBMStUyyeBPuP
	egLKrgNCsaQlz2bWLfaC7PMN4Jbu/rJBXkpoMMQwqmiu5gqOyaNR8QNPPNaoqWMoX6hB
	PL/Zob8SGLbjCe2msv0sutQtiolmulla6nixuqA3xIzz7pdh40R715oBngo6r4qk++CU
	OlUw==
X-Gm-Message-State: AMCzsaUZJHr3eUobOOlLfRpSByA9315jY3vTL9yqCjON/dafFR5AlvSM
	pilfjv4a/wZ4xWZKMPwvTvAPL2jI
X-Google-Smtp-Source: ABhQp+Qs5+hKT4zuL3MnxOlrTJ7rrAg7TTtJ21V0G3bqsXhR7DYF/R77thFFTMJOQHBG+ct23srftA==
X-Received: by 10.36.37.18 with SMTP id g18mr7017064itg.86.1509387079106;
	Mon, 30 Oct 2017 11:11:19 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:18 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:09 -0400
Message-Id: <1509387073-21934-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 2/6] lksctp-tools: update and remove from blacklist
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
X-List-Received-Date: Mon, 30 Oct 2017 18:11:18 -0000

Switching lksctp-tools to build from the upstream git repository rather
than a source tarball.  At the same time we'll un-blacklist it since it
appears the gold-as-ld issue has been resolved underneath us, probably
related to a Debian bug of the same form that was also resolved with a
binutils update.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb  | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
index 11c43ff..9166aa5 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
@@ -8,22 +8,16 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
+SRCREV = "736b91d340e3f2519714f2930ed63b164d363511"
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
 
-- 
2.7.4


