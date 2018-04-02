Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98B5972EF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:05:53 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s24-v6so5113022plq.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KFoqGOfPiV8yn9FhzPZONqS0sZyquoEQ8ZsxVPVS7u4=;
	b=tbJU95UqwGuwhFR+vO7AqKFeV/U5rM5TNyWWVBxbJ3TYSmoJE/efwTheRRLL0Zi7BY
	sXVpv6ODU//pLnyasibzx4+FYVEDOS97Y387oTW6laHpkqY3r/5tDst8WzT4RjIfOegm
	wsohUu5W77qCVvN/26twFANbVJIW+l/v7xUgZKweA4jxb9wSyTETnI8QAR1A1KAhR36L
	3DKZ1OyXsqdDSYQ0n9vqh6zwmBWprG2wXf72LAvC2UKDvgAPfzPzb+MqoNCPWVIh007Z
	4I+1/QC9uzpv8W1NvTl6BRGeuHds+8BVc+KaPHt/n0ravvqeoWLKsnLnkzJEmszgwfqn
	3tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KFoqGOfPiV8yn9FhzPZONqS0sZyquoEQ8ZsxVPVS7u4=;
	b=J54jmmCIqEDUS5t/iBeL5w09lP44YqmfOfYMFRWW9jj5qpNwuaRnIdO4cWgVzpfbA8
	nBGbJ4Fc5nxF/aHDir9vxw6VSJBjCYGuBLR9CyshjA2DMJ1QlhExGo5fIhga/QTiuxVk
	gCqlQtCHVixE1EsyCFvVsYqtXgTJXoqsJt8D4O+3JinUJpL0TwYXO9ejf/WlfCWzLZvP
	6P6dRdWcCPavMy75rrx0XPogauviAcnRZwcz5zfRhDlnybwiHbCRN1RWBNqtSXbJx7mJ
	u1NrWIjmJ5P4o+eFoZ/6jd1EK5zhnEooUM98waYAexcc1/SkzXEAe+jYqOOCbRnU8A/N
	yWIg==
X-Gm-Message-State: AElRT7FDD4+qQit3utIelzAnU4NKyxreIzyIy2i3bR6hNei+qOIxz1zi
	+HQvf7tRJhatTIA5M73BDn6VMA==
X-Google-Smtp-Source: AIpwx4/vgrVYY0VTi5cXYP5yDgcmMT8/EgJLPLyX7L2hkk9SiPRDfaUu+j0OvPmlqWPKPyY9iCd4zA==
X-Received: by 2002:a17:902:b494:: with SMTP id
	y20-v6mr9042200plr.234.1522692354174; 
	Mon, 02 Apr 2018 11:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:05:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:41 -0700
Message-Id: <20180402180546.38078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [meta-networking][PATCH 1/6] wpan-tools: Add recipe
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
X-List-Received-Date: Mon, 02 Apr 2018 18:05:53 -0000

lowpan-utils should be removed in favor of this package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/wpan-tools/wpan-tools_git.bb       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb

diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb b/meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb
new file mode 100644
index 000000000..b6d2f6923
--- /dev/null
+++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Userspace tools for Linux IEEE 802.15.4 stack"
+HOMEPAGE = "http://wpan.cakelab.org/releases/"
+DESCRIPTION = "This is a set of utils to manage the Linux WPAN stack via \
+netlink interface. This requires recent kernel with nl802154 interface."
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cfd939b1d7e6aba9fcefb7f6e2fd45d"
+
+DEPENDS = "libnl"
+
+PV = "0.8+git${SRCPV}"
+SRC_URI = "git://github.com/linux-wpan/wpan-tools \
+           "
+SRCREV = "3f473f5136f89773997cb4fff2d8ed647734e2f5"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.16.3


