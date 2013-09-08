Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6D2617A9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2013 14:52:23 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so4213559lbh.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2013 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RLzZrT6xpiP2caDhqzE4x/7W7l2ntfZgUOAONjq4BSU=;
	b=e5kvR8VDfkCyccHvmsgXFr861k9cxvV4XyQPvis6gU9P/gN9frXlbuaeePIz+JE2uN
	ZVs+c71WvfU9V+AMkz2EwC/mHiIAMB+watFymU8Ayt6/Tx4SjEBjJhCVRxUWRuGgKeJu
	c0h1XawmcAo9E+hl6+6+vDbwv8Xyl5x926q12U8qOtcfPSu1w6x3uFx7HHVcSE9r2B0h
	KrtayuQm9jP5ZZzNL1EgBMC1OpZhXElb6jLb5QAsIyRPEd3Cl7H+JEyiHm5RakOXUzKO
	FDGuqjGnybRwrBgq1aaV3UYqjhWrZewhxgdFnfzASJoKOFhXS/AiuERa2S9VSCfrF/CN
	xmjg==
X-Gm-Message-State: ALoCoQk4Cn7w9T0vpdUW9AO66fSd5N8iiNZtc1nkrIRV1eRvXjHFcnFZW6ucD0Udo+0h1liaUsfG
X-Received: by 10.152.10.99 with SMTP id h3mr12122954lab.13.1378651944996;
	Sun, 08 Sep 2013 07:52:24 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id zw2sm3628616lbb.14.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Sep 2013 07:52:24 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Sep 2013 17:52:12 +0300
Message-Id: <1378651932-25060-2-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1378651932-25060-1-git-send-email-fathi.boudra@linaro.org>
References: <1378651932-25060-1-git-send-email-fathi.boudra@linaro.org>
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
X-List-Received-Date: Sun, 08 Sep 2013 14:52:24 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-networking/recipes-support/fping/fping_3.5.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/fping/fping_3.5.bb

diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-networking/recipes-support/fping/fping_3.5.bb
new file mode 100644
index 0000000..fe88934
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
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
1.8.1.2


