Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6B97822B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b9so10294896wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pbMQiuVk8zFyQ1WC5tHC2mVlbtvlqVVblKP8pJN3K7c=;
	b=RXk7S/YSr+/0q7u+DU1Sx1/yRhl8tw4a63dmo5k6F3dv2KeOHXfo76qv5TfGIT2/AG
	9auS+eayCgCTR8HtJ0mHQ4quo8L+VkUnRlC0kYLgsHMmwNUD6VQIevbofTZHYluArO61
	jb758AWbycXmppFITCONtZYIxEHRhT8L5ls0TQFxv7eBDKYAqvN2lQtsXU1/el93PHhd
	wQfW64Lr5SwJ6sJPgp2k43HQYGbIZZlaTblGpZrLhcnGplWsv/MU+fHWuVjbWlh6kdrt
	puVDivMfN2nEs+5J7Z7eutwW2EaGgCGYCjYGn9tTojjveaPYaj8Xg4upx9U6L+aD//7x
	sm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pbMQiuVk8zFyQ1WC5tHC2mVlbtvlqVVblKP8pJN3K7c=;
	b=Xju4n0+FtLcrH1PzB/bns/y274rAQQtMj9eD3S4MGYF073jMweffvUdiT1Ot94REzS
	1QQRP+AzQMsX4qOR9/cUkg5YCISlmkL7FSqaYGyuLOyHtDVZ3ahB5aNfPSJeIfZ1qUWl
	3WB+BP3u20Bb4ghRwhZRd7Cc4QRxzeC67mUnkjlS0g9yZNbq5S5rt/lchjD2sj93Idcg
	V4V4G0FTI1mH9HeSd0FPwQPxRPdBogMcY9WhOwuHCshpXoXEbV4UlbFuEzeW+0BJn4/7
	FsBwi86no4lfkUM3wui0DJq0ioloU6AAO5xL4oQXfzhD4ZdFO2xV9WYl7mTIek3h9txL
	cnYA==
X-Gm-Message-State: AMCzsaWV7zk7bh8tPk7GgT3sIh9+/3fE9hin5czEmwbwMxGFFyCs8yxm
	QmI0qYJISOeeqle4qINUgz3u3g==
X-Google-Smtp-Source: ABhQp+T1CgPydqkFwZmAiuscWDpOvtUSp37Vk5jp9Sp0zxTmhCiZkEwNB/NVEiqqYa59r7FbeHyT4A==
X-Received: by 10.28.141.194 with SMTP id p185mr1271600wmd.149.1509618719345; 
	Thu, 02 Nov 2017 03:31:59 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:29 +0100
Message-Id: <20171102103129.3703-11-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] gparted: update 0.28.1 -> 0.30.0
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
index 83ab6f2..cea0e3a 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "ab72464a3ab2137664d9df8462befd3f"
-SRC_URI[sha256sum] = "76891f14394754f7d6ecceba2af0e585bf89f9d780c389a255dcd41a2f45d333"
+SRC_URI[md5sum] = "09b12d3831e91b26ec8726b00eecd43d"
+SRC_URI[sha256sum] = "d31193effe058bdaeb2a4cd4b514ec753191179a0bc3abefda68a2b7975ecf4a"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.9.5


