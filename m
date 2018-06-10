Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4BD770FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:56 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r15-v6so10493233wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cCYp4oj04pk0EymD0VtqztAVVFIR3iW+B5j6Q3peAKg=;
	b=Qr32XIrKXxQx9JlercD86P0EcCrt+uqJPf1DQLWnCZa27YZk77tNYtegbpIerYfv3P
	yOQTv33Q2taKLAk/U6Kn4rckTq5vi2oDrt2/c2Ixl4aQ0M6urJtP33Gi6E4M8Ml84wL7
	HsJBpQB+ejqk+YShYSR0tPjsZO+zDszYjuITaxSNIx7pKe+sK9YsFvVBsRkJ73amm9BY
	97CeeOzjWI/lZGqnnsPc+t5wNu2+VGvX76p7uPP+4OfB0CcrxWf1IL6V2lQMWWc3mc7G
	kC8qUdZLBniS9vRjQZTeYlZRh8jxO5xvl895FB39fz8m8Au+36/MAyPHT7hHFB1++cw4
	RmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cCYp4oj04pk0EymD0VtqztAVVFIR3iW+B5j6Q3peAKg=;
	b=hIVss9JxMQ3tULKkSQNFGlHAuHupZUUxlrDKW49L9Z7hS+oRX5leSpLvhA7QVwk/8z
	X1jsQAOUKW2cf7mJ/G1NkJrVoaZSingaFiMDpFwpD6uYzthrDSZiwFKhPRuQaOkJBAK/
	GyvmMbfHISVwA0QtHZbNQ/xLpz3iph4BuD+EIQ75WFl8q+Rdw5SRZ9vwy/WTkoCTHA81
	4LNNpuKFuWYvWiW6S/D4wGKCTTzk7xqQcwZPkJQNwQ9/c4gxw3D34FaP92kDNYoh/Cvf
	tOk7pm7HwkKpc5jZcT5f1IzFIfCc1rQXO/ZCOYLcr4SmPWh8CT6Keywd3ngDjqP7joej
	Zukg==
X-Gm-Message-State: APt69E1enlmOqhY7uRlFIqnDoSdvB+v6a1xMOlHz6t++FsCtoHAKYIim
	zmsauD8CSBxcpBZ9QvQLXzz23A==
X-Google-Smtp-Source: ADUXVKJgqaxJsx2q6ulhU7IddyVZblnW4N/NQm/LH3Q8xUfjEIfMlGe130N1sUTJ9+UX94qA2HUFow==
X-Received: by 2002:a1c:1143:: with SMTP id
	64-v6mr5756449wmr.100.1528643337001; 
	Sun, 10 Jun 2018 08:08:57 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:16 +0200
Message-Id: <20180610150821.9536-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 14/19] mousepad: upgrade 0.4.0 -> 0.4.1
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/mousepad/{mousepad_0.4.0.bb => mousepad_0.4.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.0.bb => mousepad_0.4.1.bb} (81%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
similarity index 81%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
index 4ca21a6bc..d122bfe37 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-na
 
 inherit xfce-app gsettings
 
-SRC_URI[md5sum] = "f55314c5dda6323883241e6cf01550a7"
-SRC_URI[sha256sum] = "60114431eac8db6bb6ce18bd38f1630cccb684375b97a445a1b6fd619848d132"
+SRC_URI[md5sum] = "fb85c23bcb096a46aee9ec22b4e4fdf5"
+SRC_URI[sha256sum] = "39a7379b929d964665299c385b2cf705e32e8760698ccc34f91c990bb733518b"
 
 # we have no gtksourceview 3.x around
 EXTRA_OECONF = "--disable-gtk3"
-- 
2.14.3


