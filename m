Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 888DC777FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x64so4758146wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=taD0pHZjZ9iJZ5FYADziNKm/jTqMcMmdoVTcLZxvIDs=;
	b=TejY8hl7Cpez7+bcJXmGd9ZvL52ToXU/r5AMOYYB/LGTdpPFGSoAuwC3+UiuugD+zh
	xTiOrMjhEHisEOcQiLvD0yGXghTWwlSF/WM+j1HmBNeGkRMQ9lmv/7lULKMwMlnkY4bT
	Ad+CcRWVStXMPgmbBMqXId6/TptdyG+ZXNvH1z+tym8rxmBfALi8x84thrNv8QSZNMha
	Lf7J7iP1x0wrvt3KHK7gvEJjKJ1Jq2dfpoLdhJj197vxwBicmAr9Pm+GCL1OAOnF8fFK
	+kKTqYQXSLb+mMahtJBujfRha0whYnq5OFR/I0AwohfkW1dvXBiiYsPLFNTGiq8GJF3I
	ldJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=taD0pHZjZ9iJZ5FYADziNKm/jTqMcMmdoVTcLZxvIDs=;
	b=cfnnNPQpsZqqOYX+fuG014aaYqZQ8SefzxQA7KkkkO0mJ0Ug1Gjp4CYTc+EGdyUD0+
	Sp8+PhgTWGIZANVnVwTKfWCIBVHZuipFow30mdPk7xseOc2w70wj5H1VcV4vGWBy4fHI
	ieprmCOiPnjTtl8TmJzJETequwfB3mlZV63mzW5qs4SjXIoNUGqM8uLyrK1f9d+cA1lq
	ph1XNbLfszutl5akKMOYuKvxaHxtRaFSE1IjfTZ4Y14YS6e9BsHCkW2+0KGusXuHFcE0
	xCbbuznV7E5u4C4pwpcQa926HywVz2FeHyE8qU3jm5Oa3CRcuIAdfMGXzN9CMKZXaaiF
	Z6IQ==
X-Gm-Message-State: AHYfb5gkqYmSrx3c5BuLaydIu9XiD+yGFh3/uP8klpKedRQOBqmSvCgw
	iVxYf7fLV7H8oCB9
X-Received: by 10.28.45.198 with SMTP id t189mr4355713wmt.72.1502228318229;
	Tue, 08 Aug 2017 14:38:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:17 +0200
Message-Id: <20170808213821.17561-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] xfce4-clipman-plugin: update 1.4.1 -> 1.4.2
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-clipman-plugin_1.4.1.bb => xfce4-clipman-plugin_1.4.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.1.bb => xfce4-clipman-plugin_1.4.2.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
index aa6a5bc..96bdf0e 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.1.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
@@ -8,8 +8,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xproto libxtst"
 
-SRC_URI[md5sum] = "5a5c01c347f4503c58902977e671ea09"
-SRC_URI[sha256sum] = "341cce9665a89e5930e754ef3e27ff97594da22b82b1403099ebcf5c18a5351f"
+SRC_URI[md5sum] = "9169140af7c9d3fddd8a5c9e0efb5a61"
+SRC_URI[sha256sum] = "cf2b45e327e67cc187dcb99a6ef6d95570463045accd24540e17172f005189b3"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.9.4


