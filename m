Return-Path: <george.mccollister@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id D14186C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 14:25:44 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id w11so802778ywj.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jYd/kyAPgbPmXhK8qw69aV8F33JUhMxMnW0PuluV2bI=;
	b=HCWg7siNQzrY68Hxl8zj9vY8CiN7rDZwdanAUkW5PF0Y7wG0mBGRlb8zO0klQfZb/S
	QAa9THHDaeE5Sj18CkUaW/GuX9P+BIjAciBpItLhr7mIjCBaac3n1DHg3sd7h/tDz+T2
	jJuDtCe5Ctw59tmYE/Ft7QlpWkVfsra0V0XWRRUnnGMOvr8fcuYOFziC17c3mp9oBDLs
	Sq9z8hP/vFZmJUm2q3H8C5An0K/UILSrLSgRgxDaLKkW0lWoxmw6cQ3eqsRMcdWDuQJd
	kvpHY3FCiJwStAtBuzqH3kFJ1wb2VLcKBMDWU6M2pKUpYcDeTMeXJmmO7Qud9NvLjplx
	OWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jYd/kyAPgbPmXhK8qw69aV8F33JUhMxMnW0PuluV2bI=;
	b=Q7aou6bYRbwTCSiBTqL/PazsuJMzMz4iBG4xw6KMDjOcU3ZvMXNbQPpMgc5VF2RQUu
	CFePrb2gnxxUO52f+Vl4gte6l2od8RjHrAqMslygmnRcZgc8INBMUNvcbxa+HbIhnRo/
	GqrdtV1I/t3TzOZcg145sg+iJ4CMZhVYBqPUp5v8T/VUzIyIYMzqq1JLWAa+L/CdtnzL
	ZAtUjx4MBim7br8qX5DlDy3jYXUt87a4zjC75LAe7q3AZfEcQGxgGXEm3yB7bJ+9Im4d
	pRCJCIqRrzRrOcikqBBrziPgtVJdsHR+lpGqBEPmdvlicRuCHvFVUvvZLg1QRmY/oP+i
	kCWA==
X-Gm-Message-State: APjAAAUePhFIVgvkn36jXY/A+9xetl0QoodQPAPRnfqXuaPMBsSXs2J4
	ig4o4cnkjyi6XhUAMM8eJpJM07U=
X-Google-Smtp-Source: APXvYqwYZbMGObsYkJ6XLQNqxZ39cG+KofjtnjiGtUTNd0EU3MYi/rOU7+T3gFyciCIAQxk9dFffZg==
X-Received: by 2002:a81:1289:: with SMTP id 131mr4582270yws.74.1576160745419; 
	Thu, 12 Dec 2019 06:25:45 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	k23sm2604487ywa.69.2019.12.12.06.25.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2019 06:25:44 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2019 08:25:13 -0600
Message-Id: <20191212142513.112829-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [warrior][meta-networking][PATCH] wireshark: fix qt5 build
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
X-List-Received-Date: Thu, 12 Dec 2019 14:25:45 -0000

Add qttools-native to PACKAGECONFIG[qt5] DEPENDS to resolve missing
Qt5LinguistTools build error.

Add qtmultimedia to PACKAGECONFIG[qt5] DEPENDS to resolve missing
Qt5Multimedia build error.

Add qtsvg to PACKAGECONFIG[qt5] DEPENDS to resolve missing Qt5Svg build
error.

Inherit cmake_qt5 when qt5 is in PACKAGECONFIG to resolve
get_target_property() called with non-existent target "Qt5::qmake"
build error.

Automatically add qt5 to PACKAGECONFIG when meta-qt5 is in the build
since adding qt5 via a .bbappend won't satisfy the conditional inherit
cmake_qt5. The poppler recipe does exactly this.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry-picked from b750c405c7d291a885b8ceb197fe59b2ce125d11, already in
zeus)
Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
index efcd5e42e..7bb9e23c3 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
@@ -21,7 +21,7 @@ inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
-PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
 
@@ -43,7 +43,9 @@ PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.11.0


