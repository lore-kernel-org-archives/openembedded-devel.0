Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A0CC96F09E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:31:13 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id bj1so4137278pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xH29s8DoVp/dXxApaBJbroMDaCpsuHkkMwkRIizOmT4=;
	b=k2/xC+5SOxcHU2Obq2BQP7Ysd9QPGVXqnGu8cXiJtKuAPr2LOzANj8ehB0BxxCI6K2
	R/5bYeg2vYpng62fn50EZckCCmLSgvVgxT9lCLYnaadk1kDFA4EbjZjTcRLCWKQJFOyU
	jfcRXiu3h4VNV+vX2DH2n7mERvjs4q0B1SXiUJjUbYN2sRWmVqTIozBXRBGuPVw9+99b
	FnWQzonMrmVb5UQWUXWkdw3irjvIbCOmdc4P24HgL7OfyXZxi2SMzKks5PbXabdDjDyE
	QWxzYgydGeOKYav+VJxI0uV5VM6Zrqp1AmgzE6Xp2+PUUwcj4OgUrpo/cDESlgDK4pBO
	ElXQ==
X-Received: by 10.68.171.193 with SMTP id aw1mr16522208pbc.117.1394919074525; 
	Sat, 15 Mar 2014 14:31:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id f5sm46811954pat.11.2014.03.15.14.31.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 14:31:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Mar 2014 14:32:40 -0700
Message-Id: <1394919160-28076-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-systemd][PATCH] dhcp, util-linux: User wildcard in bbappend names
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
X-List-Received-Date: Sat, 15 Mar 2014 21:31:13 -0000

These are simple bbappends for systemd compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend => dhcp_%.bbappend} | 0
 .../util-linux/{util-linux_2.23.2.bbappend => util-linux_%.bbappend}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bbappend => dhcp_%.bbappend} (100%)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.23.2.bbappend => util-linux_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
rename to meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
-- 
1.9.0


