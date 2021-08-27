Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.5534.1630053837333600377
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 01:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=BYidHI6q;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJXSs-0002nV-6d; Fri, 27 Aug 2021 10:43:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+7XsWd0IYJdbTuUp9ZKSd99zfhRSucVzU4KT9svxFO8=; b=BYidHI6qv7ryaNjDlgvTY0rngM
	e4ZWCYCDnN8/HWxtPbYdwadWQ7MGVDBNYjUN3DdriWe/zo8K9xDPKVFB86pxpC1DySoe+zkYr0ZXO
	UgdxHemYmtRw/uFlkEjwPlxVmzEhmbMmDunjpF7mZo7bewc90NKIZyO//vS4P1uNW1RHrTF7oQeRd
	QrgNzbNi5a94k54cT5wPFtkARRR/ydD8wWvwA/LEBuNZengptjpjHgVH3+pl/Ss/PZpYO0fpQ18Zr
	Cj+FxRzD9BH/hyR6m0nZd0xzkoVk/XZUXAWYx4FlO4597ePdMd4QUjt5HWdoA3dy8mZKu88CTyl85
	kkmVki2Q==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJXSo-0007iN-91; Fri, 27 Aug 2021 10:43:52 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [meta-gnome][PATCH] metacity: Use autotools-brokensep
Date: Fri, 27 Aug 2021 10:43:46 +0200
Message-Id: <20210827084346.2770947-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: 179ef3736e309226eac6e039e192467d
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210827084352Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

The split build directory causes a make error because
build/src/core is not created during the build but generated
sources are moved to it which fails.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
index a5c704740..969fe13dd 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
@@ -21,6 +21,8 @@ DEPENDS = " \
 # depends on startup-notification which depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+GNOMEBASEBUILDCLASS = "autotools-brokensep"
+
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
 SRC_URI[archive.sha256sum] = "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
-- 
2.31.1

