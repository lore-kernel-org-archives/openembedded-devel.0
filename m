Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id E9C4560F1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:58:28 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so3235360lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 14:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OSUgX2IdzQF8m8x+c4yyYJIWx00bY+ipPqwsMioLFb8=;
	b=hcH0dTPUhen78XkjfuegRYhZU0zGkrx2EvDvgb+lx5z4uS0Kui0ajbBubIFwVvLQAG
	h0bFHupH8AmQTFjFO/5FO7rfBRAH9DHPxXCEdCag60ufbog4qKGVmOCfRfZaHZGhAKcw
	we/XZtr4ZOTr7S4gMx938YpYPJ49KpELINODdcOAf9sctfK8gwqGdau80n59qZuB/L6N
	FpvRziazgfLNGNhwLbepBS6qmElR+2IPY/BagPyjUNdyO9uMVVa2f+3reTMrCVRCqeND
	MccI65x24hf6T1jLXf/kbS8L50AB+HV18Dl/qP1L7OLRn+2e3XFlNDa5D41GS8BF+78q
	/JTQ==
X-Gm-Message-State: ALoCoQnH5zBX0NEl34/nI+poSgJrePCMwRQ4c2eNY3m6gwO8VBpQl39JPN2gX/tgVG4FiuKBedJu
X-Received: by 10.152.26.72 with SMTP id j8mr4016158lag.19.1378504709681;
	Fri, 06 Sep 2013 14:58:29 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id vx8sm112359lbb.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 14:58:29 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2013 00:58:12 +0300
Message-Id: <1378504692-3593-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: [meta-networking][PATCH V2] fping: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 21:58:29 -0000

 V1->V2
 drop PR
 use PACKAGECONFIG for ipv6
 drop COMPATIBLE_HOST

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-networking/recipes-support/fping/fping_3.5.bb | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/fping/fping_3.5.bb

diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
new file mode 100644
index 0000000..064c630
--- /dev/null
+++ b/meta-networking/recipes-support/fping/fping_3.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "sends ICMP ECHO_REQUEST packets to network hosts"
+DESCRIPTION = "fping is a ping like program which uses the Internet Control \
+Message Protocol (ICMP) echo request to determine if a target host is \
+responding. fping differs from ping in that you can specify any number of \
+targets on the command line, or specify a file containing the lists of \
+targets to ping.  Instead of sending to one target until it times out or \
+replies, fping will send out a ping packet and move on to the next target \
+in a round-robin fashion."
+HOMEPAGE = "http://www.fping.org/"
+SECTION = "console/tools"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=09d77789fe32be35acde9637a5ee39b1"
+
+SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
+SRC_URI[md5sum] = "2e17cb655aa4eb59b5a4a38a89e746ed"
+SRC_URI[sha256sum] = "09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a"
+
+S = "${WORKDIR}/fping-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-ipv4"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
1.8.1.2


