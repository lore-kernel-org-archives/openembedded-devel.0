Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DC80B7706C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:38:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i204so1220640wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ihT9Kl1XCkrLRley85CfkEVcq4SQyGB0ZiaWd/j8TNk=;
	b=x5GJMkb6Hz372jLXADA7bew16jzmIZxSiU2cjq1UQ9jdIncZrzvn7pjl+EzW8bT8DC
	l+HjPbPfmhHWdJKxNnhcfec14UGIK6uib1IJS5D+2oB2P4vn+eOEVOEjxyEMQyfztMXY
	bizpRF0+QPp5Lj67ZwA2jarfhvipMghw72vZmjmcMtK0efCps6jHYDZsFmO8q+4rPzJX
	BknmU4avFPOiZp5TFMuWB+ZuqYNc1S/KTKGQCm2z1VYBJN0UUzqOu1456ZHBA2Hcj5yD
	FrLYO8E+qfDvhIVLKePd3XoOKPt5PoH5yXeGONkJqnD3zashBqeVv14eDazbj8+M6w0K
	wX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ihT9Kl1XCkrLRley85CfkEVcq4SQyGB0ZiaWd/j8TNk=;
	b=eKJGhUGPBKRWHxmczN70/EIhW1mTqMdtaWWI9OrWKQPUnRoAg2YiA9TiiXhL7KJsxt
	KmPx7kYLXxuLXgvhAcDvUc5H/fso5i3JmwAk3acFVq+ODWvgYqa7ALqvZjmKS5Qe9kiY
	kld3oD3KpT1pnUN3QXJ5qW9P82a3yu+M/EWEo463uMW9N7A1QPPWioaS0MoX2m8k9D9i
	oX8Df40Sm5Jf+f0Qx1ZDWBUEi5LkEOXCrpEXREgR2LOLkN3pf1x+ePtpPWDuGXeSLg3b
	KY9QAUQjMqEjG/JDJ25Zg/EY8PbxrTlDYVpKy+n2FmZ+6lXmy9FzKOLiuk4yy8hkyBXp
	ct/A==
X-Gm-Message-State: AD7BkJIaIQZGCUf+mTM/N/aDUU2ulXWyA4nnT5+ZaJkqOcRlV+6Fb5StQJLcISKJQVU14w==
X-Received: by 10.28.125.2 with SMTP id y2mr15688555wmc.90.1459834739305;
	Mon, 04 Apr 2016 22:38:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.38.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:38:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:11 +0200
Message-Id: <1459834720-17165-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 02/31] qtwayland-native: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:38:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b164a67..a094419 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
-- 
2.5.5


