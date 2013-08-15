Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 673E96B7C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:57 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so180488ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=42u4pfSy+TvwmOC8/gQjswxhAqnPnffnY7XJchyMxlA=;
	b=YzZT82fqo1yEF9wK3cyg4UQNZqD7ZJm3kgzLlcwufK6wJlgIe6aY+vIF7Ziy/Blg/A
	D5hnN72gD9+ytJ9pC4TXHAHJL5ylb/d1L7/TuazIMVHfvwnNkPl+dMQtZbD/jn+hjI4M
	HBfgnRMAiYW4xpXMhQc+8ia+QOyxgj1Ylkh5sSGR7yMMNN/NQN/Ar/9PPQRU/xCov02y
	IKjKanBdOC9qUUnArMID1O0MeMrIEAGyfJ6zycx+gmR6CDPq3f6a3hYl04rwRawnZuFy
	Mt8KTxOJOceEZIQTh7ebnAR7JnDl5y0Dc8zAK17Zva3IEuY/5iEK8u3VNrIyIJhuHCEW
	qepQ==
X-Received: by 10.14.38.14 with SMTP id z14mr20901369eea.49.1376551137365;
	Thu, 15 Aug 2013 00:18:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81928053eex.2.2013.08.15.00.18.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:43 +0200
Message-Id: <07df1db6c13dcf9ef59a1b2793b849fd9c735d0d.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 03/60] python-feedparser: Changed from distutils to setuptools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:18:58 -0000

From: Mihai Prica <mihai.prica@intel.com>

This package uses setuptools not distutils.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
index 38cd53f..92d5568 100644
--- a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
+++ b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab54337b95
 
 S = "${WORKDIR}/feedparser-${PV}"
 
-inherit distutils
+inherit setuptools
 
-- 
1.8.3.2


