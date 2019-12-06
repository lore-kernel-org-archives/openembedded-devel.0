Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id F18DE7FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b11so5964464wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RRppTIk91pPG0b/VdfZSMY59rk2qmKdPT8s0HJBaj94=;
	b=RbHx2umScrYqWwHwGphbqxy1w8iskr62BiEguI6w7o1QO8NWjiwX+Ge9vPy73ffScu
	pdtdA6zxbVG55YrOhjQp+PV+xYHj1liVqV2U3+Qw7FWuYs6FEnda9v6rmOlgaB49lFwk
	slelBZNrIWNBfLSVpWbCYTJc7DK/K79FhLzbXYY0nfPaPa88PtxzzwHU34fIz0YA0rsu
	ZI5hbup/XeFSl7D2fql8/1RjLe32FSBjoU5cGc5a9jfwQzPT5RaYyz3pcg3JwsLS+B7q
	RPdcOQFRsXYlDnr3l4C0pleTTzWhXBOwm5M1OwMTUaACMaBj6zpZoveUeD3sGOFvTrWk
	vJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RRppTIk91pPG0b/VdfZSMY59rk2qmKdPT8s0HJBaj94=;
	b=DrsQkh6gN4CWXbX2nTaY8FZt/oHL948GWTBag49GJRy23Ro0LTliYzWchSXD3ZtSSB
	gIf0VtJlaVI2g1xpOJnyBrhHDVwrCiin2nuzU7Y6NpEvsTCDZWdWzsMG2twhQ91y1vm9
	4q95RKtaD4Q9V0x68tHZ7cNf89pzU+WqfYExi8zZHZIjtDY07+FxKSERgrgja07TxPBb
	Tgkf83//1NOwVeHasJyb3MX7yQtgkSN+F4zn11ssU9cvmCHFTQUQBvMe6NlAQlx6Doo/
	geNl3PurBbTcEIVt1s/UFAYKx7mAj1gAhKJ3vUckpsNwlv3ZilIQHuLKxb3PoR083l78
	YLWw==
X-Gm-Message-State: APjAAAXoPsXxEMQlsDzqazFDy9a6fykYIv5182nSqDkDP9uhWQYCD8WB
	a+cfQM+xJtxN5wWqYDr9L+a7ZYm0
X-Google-Smtp-Source: APXvYqxUNRpgwijUiUrPwjJ1XRFRIFGi7HPAtsWVgPR9/8VHx+zElYIC34iJ48TE2Nqj7tMFa7Myxw==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr4751711wma.5.1575590978499; 
	Thu, 05 Dec 2019 16:09:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:05 +0100
Message-Id: <20191206000912.19841-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/21] gsound: initial add 1.0.2
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

yet another dependency for gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb

diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
new file mode 100644
index 000000000..e4478e14a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Small gobject library for playing system sounds"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=447b837ae57f08b7060593ac6256163f"
+
+DEPENDS = " \
+    glib-2.0 \
+    libcanberra \
+"
+
+inherit gnomebase gettext gobject-introspection vala
+
+SRC_URI[archive.md5sum] = "c26fd21c21b9ef6533a202a73fab21db"
+SRC_URI[archive.sha256sum] = "bba8ff30eea815037e53bee727bbd5f0b6a2e74d452a7711b819a7c444e78e53"
-- 
2.21.0


