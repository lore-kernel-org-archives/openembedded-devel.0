Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 57CF36BCDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:00:57 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so2748227lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 07:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nJnmRj8VusGdGq0mdEv2ESbxRCwCy+mYZ5HViVjzoxc=;
	b=JEXoSoOWILiaplV681f0PrxHknH1mkxV/Wc1jtUBdWpT2lw98aVizooJvRy316ezUC
	9ua3/oz/SGOyrFoMF47tFPIQ78ACL1DR2nAE6vy3qZ20INYfK5hNfR9WLOx+uns+O/I2
	aTxvPM713/ReBdH13jLFC2CkBACX6BfrnKXxSEswYsvLtIPPZCfR9TfPBidkcfvEZLuk
	oOGoToDytRxo3KR0kJFnrVndBPeCmisJfCsjKbg4f1Lkoii6QqFVtt+Gqxm5p4KwESlI
	dgrceZ94nNQm+6cPsIQJy/6hm4eZQ2KAYHL6WGocw5A8Hbj+dU+mUqNt+z3EU1NUy+V3
	6/lA==
X-Gm-Message-State: ALoCoQm3YgJJ5wAreRCON0fo/nzrmDMwJjQtHWuMZlKEwmXQwLBvQ66w6c+mMciML/uKTGxvEykm
X-Received: by 10.152.2.74 with SMTP id 10mr1621693las.36.1378476058422;
	Fri, 06 Sep 2013 07:00:58 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id zc3sm1520191lbb.2.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 07:00:58 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2013 17:00:45 +0300
Message-Id: <1378476045-17681-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: [meta-networking][PATCH 1/1] fping: add recipe
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
X-List-Received-Date: Fri, 06 Sep 2013 14:00:58 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-networking/recipes-support/fping/fping_3.5.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/fping/fping_3.5.bb

diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
new file mode 100644
index 0000000..de41797
--- /dev/null
+++ b/meta-networking/recipes-support/fping/fping_3.5.bb
@@ -0,0 +1,25 @@
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
+PR = "r0"
+
+SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
+SRC_URI[md5sum] = "2e17cb655aa4eb59b5a4a38a89e746ed"
+SRC_URI[sha256sum] = "09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a"
+
+S = "${WORKDIR}/fping-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-ipv4 --enable-ipv6"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-- 
1.8.1.2


