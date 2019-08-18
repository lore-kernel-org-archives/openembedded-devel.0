Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id CBBAF7F27E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v15so1358756wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fJaa7qt5Emc0QD0RZHGDQwrq8jZ+JxABRxnCfCyUupM=;
	b=cVyESx82LD+p2bo7hidBnOEVSpDXnF+EXvtTWeLfJ6cz9PlipMp3B+uGV4MohqJUdO
	qkhuW4PAR0KvjYONcNaPJJXbGVFb28c7gGXMCe8ayiempoHqx6OAXYRha0O+AtJqP2fV
	JnIotg3vMyLbQmlIgO24zw8fqJJ4oBXzDCUSUWkqIKaeakWBKbx83oD/EgiVczTLQfBN
	tNt6u8i1fNDRe3QQN0mbP6tQaeuFqfBLvtErrgzG84nPG8a0qrmRvmjJLj5CKO6HpzEr
	gj3pCrNvYhC3WmkASMOhX8zzFv7TTD58eCDM/CF5FvzYyWoI7kotuxWSnZhN1kOt6Mrw
	zEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fJaa7qt5Emc0QD0RZHGDQwrq8jZ+JxABRxnCfCyUupM=;
	b=SxlHUpvwJOukeULpMIGIknrBPJ3MqweLQ2HfhQRYKweMv9rsM/bkKMz6wehLdXtaTm
	SnUNupkrjACyZkhn2craHvOzRQnL0omgfoohN1LzqkFva84G2lOXNJUiNdppYm1ehVdy
	6kIGx0hZKZZFOtV9OMjjYiwP15C6sKyo6DpIOnIgLDdxk0/RKE041sQjv6O/U0xojWWc
	vlCLZAhia1bJZnBNDgTI9aJkxy934zBP6cd+dySIUPuGhQeNMRCaWmeniHpP5QUl/nTV
	W7gldzC+xMxLr2/2WjV5fKJUbPBTS60TtzKbcAXaPhF1Aj2q80lacHM/+M3EKcP+shgf
	T+dg==
X-Gm-Message-State: APjAAAUQzYyuJYazxLtYa78gVNJdktngyLlLqXgJl4tQNPpf6Jp7RDOl
	p/EgZaVdH/HmVVE6qle6LHaY6/57
X-Google-Smtp-Source: APXvYqwKQof7kqYQsagH95llEsn+eLdg8vyasJv+DDoueB1Xg8CMb1Q4zDry38NgRF5gE9gmRhXyXg==
X-Received: by 2002:a05:600c:145:: with SMTP id
	w5mr16856315wmm.75.1566167620339; 
	Sun, 18 Aug 2019 15:33:40 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:10 +0200
Message-Id: <20190818223316.19772-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 04/10] xfce4-wavelan-plugin: upgrade 0.6.0 -> 0.6.1
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Layout, bugfixes & translation release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...avelan-plugin_0.6.0.bb => xfce4-wavelan-plugin_0.6.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.0.bb => xfce4-wavelan-plugin_0.6.1.bb} (45%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
similarity index 45%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
index 0c94f3c4b..6ffa35aad 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "b163b22f8543e5e5767a68af35c9028e"
-SRC_URI[sha256sum] = "4d5bd6654cfd077f3432b08d296f7bd052e765e51b77c629886a9542f4e5ecdc"
+SRC_URI[md5sum] = "e4e3d5240297253d242464e77f6145df"
+SRC_URI[sha256sum] = "f41f81ea063ae3c7d7904e1ee647a6b5efafc7436f47caed662ee417038eed17"
-- 
2.21.0


