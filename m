Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D61C71AE7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 23:22:48 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id o2so5749733wje.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 15:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Ya4Wlgu75WCtfM5YwjJ6TPShxrtJ8OjYFgDWa2t6Mk=;
	b=Jq1msc4J5t0qRbEc2aI7XHp7W43jz7mLdi18CdiSiAi57QO1PydWJfe72zI0oC2jez
	y456hQriBXD74bN91/8SX2IgcArK/uK/7eNjSFv5oAZNzU3YjgQ9iGZeRfv3owDHGl3f
	Lh2OauiYlmwkL8WkscAYsUaVK3sR39/YbU4C1/YzKj+GU8tdSKuxo6urIYLX8mwIwAFa
	ceyRaagQeAlRxAJWoTz7fEgX9Cl5Rg3wayTddxbperKsEGNl75tU69psX1r+8cqWMayJ
	safTyzEuE8XIxQKp6QHT0nUA+wFY27KR494ZDIy6iicuY9ZEEfjxLztnxsVnAwQ7rwg1
	Rxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Ya4Wlgu75WCtfM5YwjJ6TPShxrtJ8OjYFgDWa2t6Mk=;
	b=h2mJY6NMxgvIrm9LJhxDbcyB1urwDmZM1AIgAPJSn+r2rRG6TTIjbCo2rGmwFuw6LH
	A5tH/secmumSgUQ3e4bYE92fS1dBrbMwz+JB0eXAASIJUrfpwKAV0Zk3WX0FYgqR6evX
	2gJQbz4r0ZMBNdqHRc2LxdIOXCMqlcOdAj7ysDaaKiwbEcQloBoPZpKrVBLG0RvNnTka
	2cozgomwKbIvz6Di+1CiyrAX8hN/Fg3PYqS/iugvCygCkVboYAVsfIcG8t6nlQypvweD
	99e245Gn0Zq3z9qdeGA5r6eCdKORIwcgXctRXj61EMKhw4Kj0ysOwB6WjTMnPI03qwFx
	8IQg==
X-Gm-Message-State: AKaTC00kq4IUeFUUsKXjzaVSKHMnMVbf/4X8EysJ/t+Yd0GcQBXX0wSU9haZYwIuI+thbg==
X-Received: by 10.194.104.65 with SMTP id gc1mr12967094wjb.164.1480202569283; 
	Sat, 26 Nov 2016 15:22:49 -0800 (PST)
Received: from localhost.localdomain (p579CEF63.dip0.t-ipconnect.de.
	[87.156.239.99]) by smtp.googlemail.com with ESMTPSA id
	e188sm20789891wma.21.2016.11.26.15.22.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Nov 2016 15:22:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Nov 2016 00:22:19 +0100
Message-Id: <1480202539-3411-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] xfce4-vala: fix build
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
X-List-Received-Date: Sat, 26 Nov 2016 23:22:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

follow oe-core's vala update

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 77fff63..c9eace8 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.32"
+EXTRA_OECONF = "-with-vala-api=0.34"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.5.5


