Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86D9D771FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y144so16735355wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Dusgw+PXlib4f8Hg5bqSK4AGdc/VxBIIah+fEwci/NY=;
	b=caVw2tKTZuaNGK8PNXn9niZ1DewW5YEuuB8Uz5Hb7gRN7Bx+BY1oh/+lbnUOfPwE19
	ifPt58IJQnQJvN8rrGSPGlMy5OLuKovVp4Anxb9QghlxNqxPXYdhzC9rSp8t6PwMVwlt
	ZzfGzxobu1LQR+qZperoa0MCWE81I0s+8IZmFlOxNJfPKh2aI2eatyd7XSYoTbfE2vrm
	mbxsESLLkseM+Tpqewy8vmKZLvmpLYeGiLfUbxH1++h34le+huA9HbZiaQHaiH9A9GcK
	7JapWIUvnlzp/fz3HdIdP8BNK/rfPwLeTgbl9/RKtWByVJTuW0Ey9IpVuE1JBSDWaVnD
	jSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dusgw+PXlib4f8Hg5bqSK4AGdc/VxBIIah+fEwci/NY=;
	b=kVB0+NoCjPuhTAMg8mQHxSlHA2XQVZU5tpUoH2KVYGylr+r9BK2fSV+YmjZlfl2tPC
	tPR7fotNylzz+N1TPvP8KQMTVq7hj+t8nwUgb9l9GZdE/G3bOpiNjzrm/7LjNZ7K9VE9
	FZLH4blzBcc5yyn95fLtcQMJ84nYmJilkj+8PrP3KLERd8iNI5zHG07uMSyaFiUrbnrD
	lU5Uhddt9gn0PXxkWG8x3vJU2mBNQspBP0vgTju2A4tKQ4TTiLuMpZZBKDGl5Bh5n3M6
	pHuS/b7hVHgPou2oiEYbAuSNGSnmky0MZJNtJE0PYOjW25JtjKZsx12xXd8UTdy+WiUC
	8cig==
X-Gm-Message-State: AD7BkJIkLk7CqVJEs1EnSsEkhosZlLc7oGqfgS97fj38Alm73bGd+7lUljFpNl7n3CB+pA==
X-Received: by 10.28.59.7 with SMTP id i7mr14944453wma.66.1460317315710;
	Sun, 10 Apr 2016 12:41:55 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:10 +0200
Message-Id: <1460317290-4787-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 11/31] qtenginio: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtenginio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5590abd..23b9417 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "60a135102aaa37d0d817883e4d6aed456372709d"
+SRCREV = "2a19257a5eef7a25a05d5cf7ea69ecc4184226f3"
-- 
2.5.5


