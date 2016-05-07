Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8BE738AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 14:13:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y7so12397663pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=eD1GDiyqtLTY+jWb7nZXagw0uAM0vuEKtcmeEl4r700=;
	b=IZGsY0Udqpfa7IYZbDWFMJoHFIqRcITeT0CF6bbMo4m4sAuCf+QLlAJCnGlIMHaUPm
	eqA82CTFfGwCUIrYJGiJUtronatW0jPFkkyo5VDxXd3N+gW8gW2EWFRC2Lgu1wT63lFd
	jMBcMkuhRg4Quq/cHQOyjHkz5xmHIAO5tlTLj/oZH532w6kLWnWymxg/8rJg6zku5Hj9
	/isYqPT1hCmKcHoUuzrEwQTQSPGxtumYpNVPrp5SDn0NiF9Z+NbGIUOJ//CpVKoC8ifN
	qHXjkAZrRtGOmaogoalPQupnBMN8doZNa0cEMrlrvrgxy8jUoJ/1ZsVDTuLxOtgQBI++
	XTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eD1GDiyqtLTY+jWb7nZXagw0uAM0vuEKtcmeEl4r700=;
	b=Lzj9Mi81fCkuhthsIAZP8U1i7o9MQJnGB0UKcrS2T/qqBnGTUgdxN1OrpQwQQmgbwC
	O20m8UM8/YQCAzQI4q2n0ROvGM83/xH0Ognvf4LW0r5mmiYlvwwVpQiC/FnXZIC2OsUF
	4z2rKT1YP2eJ4fKcMF7XfAJl68RMWQaoEEqG9BsEaQz/M2xbxbs6r6g2xoB0tzvplYhE
	vdOF8ZK1QN8YLJ0qnHQmrYHdw8V5TR2QnDyxanPmx2kjVe9IMB9dVbiy4owElvmjTV/5
	5N2lmh2nqanWEe/4yIJ2kVr9VGd1cGAxRMCd9x8YHNxRPo1VNDBGYJFqadhMAawF6D8t
	5m0A==
X-Gm-Message-State: AOPr4FXvzp9ixqV+edPhfAUdZA7GVb3j48Y3g1yZMMkP3WfSZkgXLBNNceL1C9opQv8XkA==
X-Received: by 10.98.55.129 with SMTP id e123mr36500879pfa.4.1462630402104;
	Sat, 07 May 2016 07:13:22 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	71sm28586299pfy.32.2016.05.07.07.13.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 May 2016 07:13:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2016 07:13:20 -0700
Message-Id: <1462630400-1562-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: Fix new QA Error
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
X-List-Received-Date: Sat, 07 May 2016 14:13:24 -0000

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'libepoxy' (but /oss/maint/mylayers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb DEPENDS on or otherwise requires it)
ERROR: libepoxy was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)

add DISTRO_FEATURES check for opengl to enable gtk3

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
index b264e67..76cb30a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
@@ -18,11 +18,12 @@ inherit autotools pkgconfig
 ARM_INSTRUCTION_SET = "arm"
 
 # Works with either gtk+ or gtk3.
-WHICH_GTK = "gtk3"
+WHICH_GTK = "gtk+"
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
-PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${WHICH_GTK}  graphics", "", d)}"
+PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+#PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
 
 PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
 PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
-- 
2.3.5


