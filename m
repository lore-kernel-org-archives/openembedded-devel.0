Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EFE1E77071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 20so1204905wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RCkFR61qoqDI7zUFkU3+1IJKv0PtswoGLLvvbxPQvRE=;
	b=dbBAPAQac0x9qgWlWxYx+1HpahTr+wqcR2lCxtHAOJO1HsV9SvSg7irSATBk7DQSGa
	YcpnNSEmIOAMQUe7yJpx+M8L9ZYH/kffDX8ov84HLS2UlEdsA/tDw29LpZTcMpo9LHfE
	AUEOGXDIwBvOrwnE8BxL7xRvBmyc8N05899zgzB9S1qCK67C23irz3R0+2ftdA8r+vN5
	6WZf+dwvPxcr/SllLiezcwaK/aL4dBIAdeszQdUpNGLUSBc8kQHdAqbY7kdRE3UQlr2l
	nojtEEY35obR3uJIi+ky7LUyDiCQnRsgi1KHa5ki1ZLnOnmy8K+Ioyjs+GhUz6KyDnwR
	8KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RCkFR61qoqDI7zUFkU3+1IJKv0PtswoGLLvvbxPQvRE=;
	b=I5vZDV/Mh8/q0g1oZah32onT2/QUmd73fzhFk0MBwDYSjwosNEC4tMF6zpsB6h42FP
	RzLGHZxT2zKuVVSCh4U4HcOAJ8+NpGzaSOj9BkEWsYvgV4ZwFQZeOjD7hxbXS69JbShZ
	rdFp/wquu+iHM69iJWXS4j/fM2oNdYR3XKTZLHtYzTi9dXH1MGzBWtHgO4KQA0GgRBJI
	2/k/M3PUME3PWcO6MnArxS0Wz9tBwlMgjU35bx2vGwHp5IoEfGwtOHeo6p1DmlpZmdLC
	doXhvqR7UpTrYPaRg22NP6UlM+Xq83mZ1+S5srhZcsOGAs02RBngUeKTrMh6Oo9lYVwD
	JGbw==
X-Gm-Message-State: AD7BkJLTOVqzDF965asVKUYBkhFjtEXn4A5W7eP/RV6X+KEc5snVtfzvY1RMoGYMa/19Eg==
X-Received: by 10.194.95.73 with SMTP id di9mr11859962wjb.152.1459834750584;
	Mon, 04 Apr 2016 22:39:10 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:26 +0200
Message-Id: <1459834720-17165-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 17/31] qtwebkit-examples: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebkit-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 63d02fa..a0d4e9f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
+SRCREV = "7988aecdbcb07f3a214c2c804a39db3fc5617844"
-- 
2.5.5


