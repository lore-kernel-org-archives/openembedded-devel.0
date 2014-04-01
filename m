Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9F84B6F923
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:40:26 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id to1so8646806ieb.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7qVyYzLvCUkce8/YEshmEvWE9nxKkY2vGYKEBkPv/+k=;
	b=Jy+Ds830/+erXQL8N6+IDRu7RS0NSkTg6xHZzOsPeLz+CtkgG8bgx94n39pJDKu9uT
	r1qvvCpF2jFuqy0v/6FwDnuM42CIXz0eG/m+vs2n405A7mKwYp9WWhGw55vAoM7nlL/e
	PmZD2/+3UXCpHFTonEyQm6UBLCn6Bh4J97NipbnFoXARvL4MviU2JvonXxWtM0YLJLcC
	+iKcx0Hol8h9YJQ/gE2gG5KYaR6fDmCA6lqyLaXBZ8YNeZQe6kdfwyOIjT3RyelN64gt
	PCwgQ9DuLdB9dpoAsXdg1sk4+bKU5B4Vd8OvJsWnctKQwU+J8sn0rGtihg6c+IMlf/4s
	KrOw==
X-Gm-Message-State: ALoCoQkZptwzANoV3In3YtrmXgNEd1wqM1M+JTbZtvjOqbrECZ4cJjJ0jRvjIh253TKBiJdDTRg6
X-Received: by 10.42.200.7 with SMTP id eu7mr32822083icb.47.1396323628037;
	Mon, 31 Mar 2014 20:40:28 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gd5sm29556295igd.5.2014.03.31.20.40.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 20:40:27 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:39:25 -0400
Message-Id: <1396323568-18135-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 1/4] gtkmathview: fix B!=S
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
X-List-Received-Date: Tue, 01 Apr 2014 03:40:27 -0000

This package does not support building out of a separate directory from the
source.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index f53e931..954dc9a 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
 SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299"
 SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
 
-inherit autotools 
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--disable-binreloc"
 
-- 
1.9.0


