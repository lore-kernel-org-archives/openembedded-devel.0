Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 641147F302
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 207so2463660wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=19wvcvhRBQkG2OBImPzpyzMKoCG0+ZAojMkkIt9H2B8=;
	b=Eni1abcEZ+3drG0uvydP3AaWWGm/jbnkU8cD7XqJT/U1Du76IcEz/n7sn+g+4BM+4u
	TCoAGG83VO8Mg3VXLoeGOHv+Vv4L6gzFo2gQC8NoW/VZoyuKi+05Q+JlATjJYEEP4WX+
	gNZwBakbnq+FUnzq6nzYdeYErqYB16lz3cnBllIVF21pfCducI1XQN2smJPywVD6fJ8j
	WDKcx2TjvNcum2yMXIpAgx6RG5/b7+x9cSlJJ0C5PbLZl6V+YZ8yOL+uzwMmhUOT5WXI
	uMF8ChIfssinGzvepPUutC/mZ0s+DE77TP52OY7aqdZL+ndw6iSnO7OyB1nM6ajg6mbz
	gv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=19wvcvhRBQkG2OBImPzpyzMKoCG0+ZAojMkkIt9H2B8=;
	b=XkJqaIoiWBM9lSp29cZJEe6hsCCfx5iTbZv4GZm867SP0DqZLGy5IEMGuTZ8udf8F9
	hnGJYAxuvS/IfLUPQsCK4D+ma9bHKPIIwh6xl3O9LMlIBbyn3/zuGXhVmYRMF67i+Atb
	RlIM1y4r5Mfue1qMzqb29nauR82Ih6UsW/FStdNTNLLTVcbsOLb3tj0ob68xvbXzUYfx
	g3wjLvAcs6tsm82tsICxmz0/RmPWsC0aBQ7p+3Pw5/StiOS0jdBxA2AW8NTZNGQVnCMD
	EqEkdPmfyL3rnqW6EmvlweJoW1h+YEVj7HWqBPkhCSbbMOxU1xubBcaIaYdSJPUpBoJc
	mWdA==
X-Gm-Message-State: APjAAAUQvtRvgR/N98KRKDF3mxHY3kdBrWXv3kxbngFHi1va5nv4mAxU
	4inuSEs9mE8yGRTNfCGkv0f1CPLO
X-Google-Smtp-Source: APXvYqxVT9mr1HfShSYNVFwPANCUJ1MKXSKqP9DKdKD31DG6zyK93GiutgGyHW+0434fiVSN5zPhcw==
X-Received: by 2002:a05:600c:2486:: with SMTP id
	6mr4677576wms.80.1565906186678; 
	Thu, 15 Aug 2019 14:56:26 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:04 +0200
Message-Id: <20190815215605.19600-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] xfce4-places-plugin: 1.8.0 -> 1.8.1
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

a bugfix release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-places-plugin_1.8.0.bb => xfce4-places-plugin_1.8.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.8.0.bb => xfce4-places-plugin_1.8.1.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
index 698152bae..c88e8439e 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Menu for quick access to folders, documents and removable media"
 DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents and removable media"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "e3a306d927befb8afcb5212f8ab0b8c9"
-SRC_URI[sha256sum] = "7ba3f46f88c2845cbf413efeefaed29157f8b98571856c6e2bf35e4de5d8ecce"
+SRC_URI[md5sum] = "bde92cbd08f129d517524784e5060816"
+SRC_URI[sha256sum] = "f211219f03c9260f624370e18c79e4176c9d35a8247158e77e5d811327610ab2"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.21.0


