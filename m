Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 645BE7F87A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2020 20:53:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so3021540plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2020 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=szjV55aj6BOhNZtuEIwctmdm+wFYftxgxW/IFjReZcY=;
	b=rhh09D04lIBnb8ASqBGw8diSTw+d9pg0cp3Xo397rCYRvv1l2WaUCaOdWoLEPINVcE
	TWaLdwbUM9/kEro8SfmfhMiMahL+UbRXKQ7j2br6CkacHdHHTpuokIaWnIPfgnUqQIt7
	6P5RZPnvQpvEXYhqvH76XpoEWX5FbGadIcasahMYRRqtxQdKUq4dT3KWok6V8Gu75OnV
	aCSGXUhKYeti2JB1ADEkf9Heu5UIAGZymUFZT8GY/3f6upNveKVRBMgRec65gdhxk9Z1
	rmUSey8NnYd1TTvZlvkZ8jyX4/HSFwiHWfPkQ9JbKXXcyBJz0oZFxg0/5YXZ6JZYruSm
	9bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=szjV55aj6BOhNZtuEIwctmdm+wFYftxgxW/IFjReZcY=;
	b=DoPSCkUm3RbtqTIfaX+hx9TePF3qIbcDAL3so4fBFbYE89K9cfgRz76REYz6wG+TjB
	VYxhmhkZ2PM0aXGMbiFOls+vfP+NBKwHRtj/cIiPoFupabH/6t22SA9I/pzg6eCw4BJi
	DI3D6Ws/QQ261D2rQ/SWUqas+bOBFg5kIsbu2Yn+nkag6I2xtwB3uEdlOWedpH4BhcaW
	tIEfD6jxtq1c9LOHWe9mlzCiE+qBY7yewKIgBfXN/yN4JC+4ZykhFycMg1nAbcGObaV7
	5I/ppTXS3fRAbreck3Mkk7sI3xekW6J/sDq4wpwenXH6XaJ9tmu6JqfkMOnrUazOqLRA
	w/9g==
X-Gm-Message-State: APjAAAXwf0caQnl8pmdjys5BC1TJbpSnN+SRlzlvOrim3h82VzRGL3KV
	mLIKKWIMPvGEVEpYbQcU3X74Ue2m5ZM=
X-Google-Smtp-Source: APXvYqyT5w/XXjHNqM4Tvkn2URAOyGhAKPB0mSl6tMfBjjxLYrpJP90VbIpVJAlZD0fTRbVV3U1YDA==
X-Received: by 2002:a17:902:b083:: with SMTP id
	p3mr10684184plr.141.1578862426769; 
	Sun, 12 Jan 2020 12:53:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id
	x197sm11469383pfc.1.2020.01.12.12.53.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 12:53:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Jan 2020 12:53:44 -0800
Message-Id: <20200112205344.959970-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libspatialite: Workaround proj_api.h deprecation in proj 6.0.0
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
X-List-Received-Date: Sun, 12 Jan 2020 20:53:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
index a3f09036c2..b33f5a31e4 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
@@ -14,6 +14,7 @@ SRC_URI[sha256sum] = "88900030a4762904a7880273f292e5e8ca6b15b7c6c3fb88ffa9e67ee8
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-freexl=no"
+CFLAGS += "-DACCEPT_USE_OF_DEPRECATED_PROJ_API_H"
 
 # package plugins for SQLite3
 PACKAGES += "${PN}-plugin"
-- 
2.24.1


