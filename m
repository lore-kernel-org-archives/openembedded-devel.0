Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id C50A47F89E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d73so8766358wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=68WX9J99YRFLP1UXRp7QWq7yj0sednWncCfUMSiwDac=;
	b=seUOf536gqPXzLhhMhc6NVhxPGGPKApjYe39r2PQ55225cBHz5ggM2QF4c+txo9YIm
	RnHOoSlj44wXQ0mDOEuKVcTrO3dj36qxkUPWBzepQKLMWF2kYpMiY19Y+bWYj8/37sRv
	5uVk0iZkng99i59tC7lBhK7Cw/6BJ4/Z8GW6sBsg83SgKayU6f6vMIBj015eaunXdnmF
	jhY1LAUXpbNmQqgQFiAYTPhtmbMiRMWpcse/MlEeQQMX73PMMP2z+nk7PChne5kTMeAt
	BeFh8wWEZ0UJa6xq3fUmSd0p/AfoO4MXhRBfXm222mbkzuxYrLUm4bFKnPr3C3Tc6KyO
	jZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=68WX9J99YRFLP1UXRp7QWq7yj0sednWncCfUMSiwDac=;
	b=OtDAS6xG+0rBwfPjMP+x81PJlnQhuED1Kx0qsqS2EqsyexSHrDRmhSu3/NxrDoyk7I
	0nLoF9aunrABvedkKrIxnXVAuSwAE8SLrrRYQPiFj5nFK/qa4PFjDV0E7/QTf2AiDfzY
	125ZblCRa0q870umWW0ZF7z4m9lGLDaGKZsTqk/5wh8WjwMUr12gOBsFQleVBTiGZzhj
	ZPiCSYUZUKSHQPht+GOlhg1crYhKiWHns/esWjNUgstC8CrjqkB23LlF39RpesgPNOZp
	g8w0pmPn2LJ6XIlrl6mF6WK5vHdIO8BKpaUKpkLgPpY/qJrH7TV91dzAWsYDBjW+nKxD
	sRRw==
X-Gm-Message-State: APjAAAXDz+vqKuYPkNvNd/dsM3ZvU4rbYWh1DbYfFt3m7DgZOgJgSMvc
	0q1B08PPue0c6AbT2wNFgjg=
X-Google-Smtp-Source: APXvYqwu49fgo+Jy5VeBMwLsFJlySIxjoQffYzdnsca4ZsoSn6NQv9qT39yfHp6Van1ZjPLPuAzieg==
X-Received: by 2002:a05:600c:2c53:: with SMTP id
	r19mr6620749wmg.39.1579296392572; 
	Fri, 17 Jan 2020 13:26:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:07 +0100
Message-Id: <20200117212615.32526-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] xfce4-panel: upgrade 4.14.2 -> 4.14.3
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.3
========================
Please note: This release replaces 4.14.2 (bad release tarball)
- Fix build: Always provide files for vala binding in dist tarball

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.14.1.bb => xfce4-panel_4.14.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.14.1.bb => xfce4-panel_4.14.3.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
index 88ce7f46c..76abef054 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3323588f1c18f04891e013243da1e355"
-SRC_URI[sha256sum] = "9c3c78b49ddfac7d42a804e6a6ad9d22ad64ec60bbe17d8724bc52d3e3f6d114"
+SRC_URI[md5sum] = "177818d4a84633c1d489f703fffe905d"
+SRC_URI[sha256sum] = "ef22324d26e5af735134bb10f85b6e16525ac9f48be8d2f6b634142fbfcabbc9"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.21.0


