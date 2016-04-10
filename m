Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3F1771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a140so16802210wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RCkFR61qoqDI7zUFkU3+1IJKv0PtswoGLLvvbxPQvRE=;
	b=SrNAS5aCRQVPkaWj1m0fSAEFmK5E9imEP8oYWeAl3fajZL83dtE84X2x49nNkdjOtY
	OSb6G/jtYt4yPIUGEgY2+ENeeMJFfOtqNq/mgXdYbeT0y6kwIPlroXQLpNbouBoF213p
	ympfaE0oiUDKYaDU582bWq71y+25TzunjVwaA+9jBE3mKbMWQVHAjhZ8LJxweSD/4PLw
	HIarygu8lMcKiK8EhpdgT5P1cu6xsFc802P2i2FJZsqaFg36/OHcTJoF4vCrfjBWcQIx
	0HyHVfW9QF91IVYl2lut1Ki1gI2sk92h+b28z2EiUTdA/PAafY1zneWg/PnNtYGJUNQt
	Fv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RCkFR61qoqDI7zUFkU3+1IJKv0PtswoGLLvvbxPQvRE=;
	b=mowhYrwM/SKUWXxE5hk+RUwp3N8kyYj+B46FDEacmZ5dQ1cjRbDPLKHufkMk/3sqHk
	TR+i8u1xHwnYrYm8x570e2eFvxCW/qvZ0+nGiDy5adILyADKcu1LqqRLhA1pKs2JCNS0
	qUuHQZ6/JApeYl0ujqtLji7lHyWOdkduif6xS7dn+Co2c0xC9zNHYOhXgjRy98Xud500
	om/N5C3d1JLySTH0njJiYs429jI0hGRtvP/NdRcG815oZRe6Xy1OvMwlLSQkwUiFhn1+
	ltfCL6tiqtrMRva981ppIwjUrYdU9rfZZtQXGxn4VajkZjQLoW2eS6l4Lf1Lzd7zP1zg
	NTEw==
X-Gm-Message-State: AD7BkJKHpGU1BuhxMDmoo27RwMRyTO0MdiQ2KyvNB+/D1VI1kNjnpSA9IhkS6LeGVxoT+Q==
X-Received: by 10.195.12.162 with SMTP id er2mr19992763wjd.39.1460317320258;
	Sun, 10 Apr 2016 12:42:00 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:16 +0200
Message-Id: <1460317290-4787-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 17/31] qtwebkit-examples: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:59 -0000
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


