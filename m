Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD376FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:20 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k67so26344363wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fLtV04aUPL+JuGcGt2HnCMyQ37gttjwKKK7c/XNOvLc=;
	b=CwiwoiP0dQmKkWsNGY/Ut3frw6bs+M9IMRp7k1ikIT/YZ+KPiYMVQhhhRlw6Ebid8p
	4WIk8PbkUTxB/3EJcA+OOzlxajG32vg7QR44VyFX0WIBquwRLoLgy6HhfUcxanHvk9ep
	qOgi30g2s6MglMQyabEc5C44NG5gY/Gdt8m8DWvIkiC1MiVvVPPpS95/GUH4Nm7WUKhE
	3y7eZ6FzsFnSMMC235+qA01YvzF0pmX7JpLHQsb9bP9a1gHAMocNcfUMu2OO26yKIuQI
	QsyYcPWnT7UoZ8WfTp5hqjXIL1BKqVANfFSU+nhZBBsFnIna/hj7dlbW0Yc0RFcr91HR
	CVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fLtV04aUPL+JuGcGt2HnCMyQ37gttjwKKK7c/XNOvLc=;
	b=lW4l+ILwSf8Vtyrj5ff1G806x5apGS7LhLBHFRuuJeCzikSaWjV87JtqycMVFJPIQi
	2PPpKNn2iEgZjo3vqQgpubhUVHo88bNuuAwtLYKQ+ZWNiT5SrGd1jhrsysByLxLi/LGr
	a79RY/tdNT+wVsGZRm5e68NlPTZnNWQbEOtSfQB8ye3skuKVAcAiqJjs25WVFzgliqym
	3+UkJKpQp8UxoizaaxeGf41sbC4tzUfxbE+Tl7lNFXctLvkbA9PoHZiQLfMb58J5W7TQ
	XSVjXjkhqzPEMii0uOq6z7Ce3xChSAccMKYdhcENMpprC0xzMFZMdCidKFtkAV/KGdBs
	9A/Q==
X-Gm-Message-State: AIVw113IXOt7kDc1Rwa++7/9N3B3jH0SnyVbTyn5GS+0MlQy62YgWu5u
	kC2rnFLHuSpzs/42
X-Received: by 10.223.131.99 with SMTP id 90mr8350672wrd.123.1499708121228;
	Mon, 10 Jul 2017 10:35:21 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:05 +0200
Message-Id: <20170710173507.3843-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170710173507.3843-1-schnitzeltony@googlemail.com>
References: <20170710173507.3843-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] gparted: update 0.27.0 -> 0.28.1
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
X-List-Received-Date: Mon, 10 Jul 2017 17:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/gparted/{gparted_0.27.0.bb => gparted_0.28.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.27.0.bb => gparted_0.28.1.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
index c921065..83ab6f2 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "726f539f774b442670028af656f270bd"
-SRC_URI[sha256sum] = "208cf60c061b86bee4f658d568a3b5d843dce3ab9847f66b452298268799e7bd"
+SRC_URI[md5sum] = "ab72464a3ab2137664d9df8462befd3f"
+SRC_URI[sha256sum] = "76891f14394754f7d6ecceba2af0e585bf89f9d780c389a255dcd41a2f45d333"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.9.4


