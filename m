Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id BE8DA7E66A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 20:55:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id k18so17631612ljc.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=skfSe83N5v4hTej11J+cJXV3Ga4JoPT1GFmdCpMp3vQ=;
	b=Gf64LF8yp9KM6OYMhEgj6z3QbjyfP5QaIBuYu0+NQnJYLKgloYxoLeDa/KMM682K5i
	9UP5uXCg7MWWDRSHlxmMMeijz7I1iePHFX76pJnCpf/sG5Akv/vYOmh4vTODGIM+b/ze
	QJ89CNjN0KKctATwRwnxFPuppCzL0mj595xg85r/Xvoa1A65F8xsBvWKBKhBHImXcA8i
	CeZm5BuFJRnsSEw4h2mnywSRc7UJ94XYcqad+XPzRTiWIhVS8HQ3GcjS+wriTEA7squF
	jqVC8noV6Xl6WXKPte6PzKkM1YStMXS1IXMduw0VRzx3OefmUeLnuib9oMUkQNyARdIn
	mlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=skfSe83N5v4hTej11J+cJXV3Ga4JoPT1GFmdCpMp3vQ=;
	b=rNrHY+NPBXPDzFzJAmYuZiW5by+IjSuzx1U1bXqUcG5v7OhKlfJFRO2OYFT+ynodhQ
	X6KL/4BZS3aH46e5Slps4KmDFAaX0TOdJeh7XAqV8iaMk7sgsZ0Ax2Ee4QptxBHOVwOY
	A6ztMVUfgMxjRXl4dYQG+7lgwszolbKR2oNYETrX7KubcKSQl9KnW3SvNA6lgSjfKUBv
	71t6//ZAjeYUQrG5CscjMEshdo27tQ7eQq1fr0YKcBASeAltGgjp7esENAcyoX4JHAUs
	BizKbwZqVlMfER1l13eDu4kWYubQIIfKtFxkn/nmQ/2K3ZJpjN5RJ/J1R/SWQQ3GQKw1
	vNfg==
X-Gm-Message-State: APjAAAVhj60WROoQRDkcuKVtLYGDwYJ2cqIimt+O7kH7z02v6oumJ3W2
	C3WCmlZeviAOpAlKSgNv4tDRlpm1lSA=
X-Google-Smtp-Source: APXvYqzlTb7L17kSY06phZQ+VgTYo+nQwjQRopFmEXxkvcC0KoqNoFajjK42lHPsU5xypz2kt1oSEQ==
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr366408ljj.0.1561496118730;
	Tue, 25 Jun 2019 13:55:18 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id t4sm1290186ljh.9.2019.06.25.13.55.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 13:55:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 22:55:16 +0200
Message-Id: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Tue, 25 Jun 2019 20:55:19 -0000

udev is now enabled by default and is always requested.

License checksum changed due to modified copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index 84c3db7a5..e2759f47a 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
-SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
-
 SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
+SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
 
 inherit autotools-brokensep
 
-PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-- 
2.17.1


