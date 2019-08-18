Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id B90997CF98
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z23so1350020wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Y7krPcJPry9oQCca3ebVKBH9x121PcCXgoXQBTzcsIw=;
	b=rg6LTm+dRnHViG37wPWt2rqm1wWRbLCjuFLZdbDsggC1+Om//+5d2YomFCy6uD7RUU
	YSpshe6ia7SAg+6Vw78X0pB6dYx3msymiGc8IQCrvyKfAXIC5pJ73Wvo1Xt3u16gV4UV
	ocAST41qQvVjUBedutlXfZVD6+L9ALnNGRGXxucTE6czcDxqO0w/lKGF8yxnUrJB4aG7
	oJEMVEd75CBYxlg2IUqWHnkvVRPraJnybl/aL/nbGtu6wrXW1ktqMqxZn2OLEKaVMf7k
	SonUwYTVSJx01zerwk0QyGdAQBZx3oVpZEXf6Q6lH8He4heLJL8BNXX5Cdri/c0hX9t/
	W9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y7krPcJPry9oQCca3ebVKBH9x121PcCXgoXQBTzcsIw=;
	b=f+aaDkjNF578w/fLY3VPBEBHvfgsBK9bMPf0XofjEVhIKu31td3CyRmRWu07iCB7GU
	1AzMuBCiR26r8fYj+QJrys5n0jPWwFNJmWGp5Rn7q3y+IxOnuuUsRjlF8iS0kqwG41sD
	Q8ZLq1n1tw8HoTV9dH0GCcnSO0QS65PIRdKE8q2s3DBdVExpbm9Xgx768T/Tyw17d04K
	4LujdMKoussZ9qm9BZjPu8W1Pu0AaC27M69eocXGGxestDj/D9onpRxCzCd9TL346/xb
	S1afj0PkT/OXYpa+XgSDRnWnCMIMQkdB/LCB0yOaLxYfxSg1x4sr8HbOpC9HS252XTEY
	Qbrw==
X-Gm-Message-State: APjAAAVZD6ml6YQDq/b8UdebFuHWZD33LfuZ+4SPFFKbKBKI7ye4eQVC
	ieBswdAkt8dz6ufFhEriXhJF319O
X-Google-Smtp-Source: APXvYqxLEzR/9i32hj33laK2YIPkCGooIvx9iCG6UAsMz5xU+x0+zjObUTxsTPOLAQjMY2s919JdsQ==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr16642124wmd.22.1566167617006; 
	Sun, 18 Aug 2019 15:33:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:07 +0200
Message-Id: <20190818223316.19772-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 01/10] xfce4-time-out-plugin: upgrade 1.0.2 -> 1.0.3
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugix/layout/translation release (still GTK2)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e-out-plugin_1.0.2.bb => xfce4-time-out-plugin_1.0.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.2.bb => xfce4-time-out-plugin_1.0.3.bb} (48%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
similarity index 48%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
index facbb0d86..4218c0c50 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
@@ -1,10 +1,10 @@
 SUMMARY = "This plugin makes it possible to take periodical breaks"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "d7d743794a766ba1b00647828a099053"
-SRC_URI[sha256sum] = "c69fb7218c685e516454810291c5245c49a80d774a6bded59c645a1af427c4e5"
+SRC_URI[md5sum] = "81e1a961032c7b87d672bed09c681a73"
+SRC_URI[sha256sum] = "7f9cd4694e83d9cc5e41140d174dcc5ffe00fd546f2706f619031039ad7e0f6b"
-- 
2.21.0


