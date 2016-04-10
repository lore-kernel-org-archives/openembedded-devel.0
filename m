Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF7FE771FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y144so16736205wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3jHE3z95Stb5pwFS3YevqWGX2/mQzVJeru2oh1/+FJo=;
	b=lkH3iT2wGQuAzMGjlb5rQ6SGeHA1ukUG25LO3ubgSD01TT7OvU1SiAsQyNMsux/iZb
	CQUI4JzHqszq3EWsV9l487RDF4YZ/+k+4IoldcYPUXXjlZc7xbKqRH8AyWnEwnoNxHqA
	q78MaUKy49RbZrsaxEClSMauzw9w2kxjkl7UhAgpzmdb5lWCrHjDcWiJ777/4Kj9UMqn
	yk4tZhi0ku0Wp41YeD/zx8BTxZRAzJ/0UVJGuBrarRYHsJNJ6FdXt5KSpu0syODxYi8w
	jDNTu050d0Xqc6uTuoBKb2wriZjrrHyXNcEtzDnYLqfNDK5OtipKAUQ3dC4XqhvXdvau
	8LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3jHE3z95Stb5pwFS3YevqWGX2/mQzVJeru2oh1/+FJo=;
	b=lwIWe3AjsdVlfOT+eSaHVAt7NnS7Nb4CSMhyMjVW7aUemdMmgXKV85+46Ko5OR4MEu
	shIKptOTf6LfeHyv+K0ZzUrsQSczsgEed6dEiJ1Y8+ZnDWTCvGidREXNJ0+XqgSLPJtL
	YUtG3zJ8cT1sI27gAPxqxRE5R7jgPVw0bCO4IClNLM6Zm1o2PbYbpRMqdu4Cvn5KDlIW
	BAj+1zR/jOZaFQouwYhyi8taEuasQ2E5KC88tVlwagUDwi/Jc48eoe4IlXYsPP2cRM0M
	/chBe6EH+KGMvqgsB8kkvvtc3JgyDL6/i0p/03fte8GLcy0pxR11qLg+Ss4QherYY7I3
	lgXg==
X-Gm-Message-State: AOPr4FVTY1Eb/P9tga2uSKMH6T2y154tEH7dZu+3WUN6spYRxQv1AXw8QegDBjRJxW0yrw==
X-Received: by 10.28.1.85 with SMTP id 82mr364178wmb.58.1460317329391;
	Sun, 10 Apr 2016 12:42:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:28 +0200
Message-Id: <1460317290-4787-30-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 29/31] qtquick1: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LICENSE.LGPLv3: I checked git repository. To be honest: I have no idea what
caused checksum change.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquick1_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e0a264d..32b9aba 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,7 +7,7 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
+SRCREV = "dcc5e5c01c28b227f0e5e5e4976a9d26e8a45295"
-- 
2.5.5


