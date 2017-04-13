Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D079577E92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i5so12625929pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u4M/6hBl8yG4WgYIpd6f633ip8+xCOcbofCtRH+G1LA=;
	b=rTq84EfQR8C3aUdCZSxXtOs+OBrRoPhLkXfHu9xgdoCxoU6T91Jd2Egy3mdiVndVv/
	UWBcCcsA5PIbUl8XVF01lz8UYbmIqSOrrcFQz4hfoe3YpSjOOUNkrOKO9vB6t23A6i9Z
	urqvcno6elXiMSau/1Z4fSXavPullatsJGBb3WAuE/2LxUaO0YP8T+2roRaDvXn9nWYf
	4PfH6FXCx3AtjaPirekorr+46GzL/Ob72oG9SRnwcCDvfNGFZdlLIVVHf0UxTzrSyu6f
	NAAT6aHgyLs2aGEeR15waE8e+HbCQt4ZSYUihWX7NHuOEwvKIgb/Kpj9mOvBmptpkF2U
	g+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u4M/6hBl8yG4WgYIpd6f633ip8+xCOcbofCtRH+G1LA=;
	b=EOwupg/vDDyRmIbbVN4ux78ybxJXi1NE0hmduYfpbBqNDtoWYk1vDn/z0eKuyJ9hlV
	YrEDpSSoNe9zRCO5h+HoMWPW6ODW09VLFIcRWHX8j1JcMrL5mFRy3BNKNIpGewW6+tV3
	9/JmEwRFkCZvmfQE85x6JOU7aMPv0BLf1AQAUurDXGH0ajxtZiJQ5mYMossjKAZSUS5H
	gjQ86Doz6v5tUInIZxQmLuLFxlJeIiUbxMPku2OYDpAlyWVLUV3fLEMHRU/hFGU2x+aI
	+ZocO6OhjDiLFKmbUgWrrUICVNM6QLqLO3mWokRjQAmKXzBazlM095GZ/mgJSWmANPxS
	EIAw==
X-Gm-Message-State: AN3rC/7znswuiQ2Mwv9uxW+v/BlXj0hCsMMy7Cus4VlQQ3II523u+JQz
	vBNh6M3tyVYzIg==
X-Received: by 10.98.163.201 with SMTP id q70mr4317193pfl.217.1492116117519;
	Thu, 13 Apr 2017 13:41:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:03 -0700
Message-Id: <20170413204106.30679-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 26/29] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
index e4d5b69bc..9fc8435ee 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
@@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
 SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
-SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
+SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
+SRC_URI[sha256sum] = "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
 
 inherit autotools pkgconfig
 
-- 
2.12.2


