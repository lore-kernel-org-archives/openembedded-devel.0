Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5AED960068
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:49 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id b71so699135lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GEGWnU/aE859uCGgnHk3z79nKb9EPuowIsVGd0fybIU=;
	b=l0ixUWFN6gsiakfQpdrEZW9LAqArEoMksuaYdY/LuNELQhez8ZEi/Q6kMJ6WW99PTd
	ScoRSZx4spK7FtXMYFgrQ1NLKzUmM+XfWDr5JtTI1ZzZITz9ZKz5MpB2SZ1jTOhPKBrX
	tp0g4XlpmyoxhscmMhx8oyiVGYi5rloAaJ8Mv32qAO/JlXJiMEtrLn49Ef4yhp0Sqdle
	MVzA5z1xyxTNJ3nvl+XV23n29tES0so68dFBWGf6TDcEIMll9jHX1YPeY8PXyQro80KI
	+eDZ8Wax9IkKfj9fNH/tFQMEFjZX7xpxDbu9fBA+9VCJ9hfsW2m3DgX2a5NsnhCQgLM6
	SlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GEGWnU/aE859uCGgnHk3z79nKb9EPuowIsVGd0fybIU=;
	b=D8AI4XO5LBTB6s7Xd5cA0r1DaMDWaIrxwXg8UNjATO6pqXQ0789sF0SLMW52xP4sjn
	z5DtDztG6pKuvXuJLq0hekrMmRbZ0y9KBHjOyWtpU00qn55gDnXJeVDvCHXTOO4iifXt
	l2hEjkUdqeU50IhgdKhLSayZxl4vsHu0TFCgXMD8LPQXPMvype2CjJC5HUpfq5rig5MT
	SZ/CSUNw4vaLOL2FmuXM3nbbqPp8f41FvYaaGTlUlUCJiH1NMGugooN6QcbMmtkJpZuy
	a9ZRINKCviUefnU+yMpdYhsrVFzQTmJVUVgY77aZkopOLMbWBW9nugNp795Eq0RjXra5
	TxWA==
X-Gm-Message-State: AA6/9Rny5MgR6n8eWHh0PEzoBhaOBmo8kmSRbHNYXJbuQZyDk7LwF0WB4GovCYWNvEr2fg==
X-Received: by 10.28.45.214 with SMTP id t205mr1164558wmt.107.1474955750869;
	Mon, 26 Sep 2016 22:55:50 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:25 +0200
Message-Id: <1474955733-30185-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] xfce4-power-manager: update to 1.6.0
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-power-manager_1.4.4.bb => xfce4-power-manager_1.6.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.4.bb => xfce4-power-manager_1.6.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
index 2070db2..71df34c 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce
 
-DEPENDS += "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
-           libxrandr virtual/libx11 libxext xfce4-panel upower"
+DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
+           libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "e7d00548e58bf19229e727818184c1e0"
-SRC_URI[sha256sum] = "c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07"
+SRC_URI[md5sum] = "2e2e24a1a22912d6a561ba6155887503"
+SRC_URI[sha256sum] = "bde3157e06ab31ff23648d163d53ee5095f7819544a9f48d3a96d57829857f2b"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.5.5


