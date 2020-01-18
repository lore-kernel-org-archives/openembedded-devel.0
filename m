Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21A1A7FCA4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q6so24955191wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3PhUwaCuhWEXwPVw8U2vob+UXg9iX10G3aigbzU5YfI=;
	b=kLP0RA7XTtlnkRcZ8rZksda83oR3+Cay2yHdLSmbw6pz7zjWRiR/nSXtK8k8rw4Jru
	+LJngLWXgGPAiV9ojEk1nQkwKK/S68N2ex5yMInvViwDED+l332nWbUbyrhSTFUztj95
	9P8spanYbT9rnZEOjGhlLaYCiArpFqDHmI5XGXKd76pcgnbzt0OG3DQmP8COWEj3jjiw
	VWFZ8Ds8AKiP7RxICrv8TvW0fCPq07duK/97e56buSo1FpkqDL5AgHo3fbExVcFbuU9y
	yN2QgY1pMnavC+bEH4cxhV3DJCTUOzRTso+7mgXMzIvrtjmEOoZcnO7bzzgWtCJ1TgIo
	83qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3PhUwaCuhWEXwPVw8U2vob+UXg9iX10G3aigbzU5YfI=;
	b=eWNrYMcGijlXJJZVE8rDW1+Jd2udl9D3lHdA5JQc15aoEpK3KFeDUO2VPnFT3qtysc
	8yNcOo28WzV8HqTaxdAbCIE0a3qHvAGj1EIwZp6Bu4TFwXvUj+N1F2V4oCxywwjnCQQq
	ZdN1AE4mwGeyqQttxltMwLH0UZmw8qEzLKBiPh7P82wG3tMEbawBdlr/CTgqn6Xir3w9
	oCQtIFfBmvH4UtXU1/EYTpKdZzGZG+8rMfqOyS0VdJuY5nVLAQlO7u+vfRCcw9zg/XPd
	yE5B9ZRDcnNc0La+OslIuiZzsw73fwpJ2vImAjcJX8iNXFlEPRePM+CKrXX6zzu341Ng
	ggIw==
X-Gm-Message-State: APjAAAVVDoITMaAYQXRpzG/dld2NFXUYLCffke14nswDpZQPHdEJVt6N
	JFmhARRxdg5svtHgAGxInN700BcAsck=
X-Google-Smtp-Source: APXvYqyyu53g1ZaU/vacbkaBIdu4NxHv/pHjmRkqLMYpeRvyJUHtnR+hfZt6+WJnLFiisPoDi/TyLQ==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr7621455wru.427.1579346897586; 
	Sat, 18 Jan 2020 03:28:17 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:47 +0100
Message-Id: <20200118112757.5287-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/23] xfce4-panel: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
index 677d07c8a..76abef054 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
-inherit xfce gtk-doc gobject-introspection features_check remove-libtool
+inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


