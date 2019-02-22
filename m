Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 673C67C85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 21:19:33 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id b8so4153277qtr.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 13:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=xknJ4cPdJ+Z1isHOexYwdMJ7QLKcu6G5hYUKSauFuP0=;
	b=tm9rEdR+WJhKr56aK0DAF0Nf0UaH7FKEaoDwXsnqnWYFUpjDIAiPbMeo9UlEfimbzt
	aIJjVILJBA4lqNjRTdYB1mVgb/2gUUZl1MWk+uWLSyxm612fF8KcbvT58UPQ4J/nDWau
	tYfk9NWQB85DQ6KDuQG7t/c+2W3EGCqLg4ZVuyMFvw9TxVykdtixep/i63BFd1sxeiN4
	u5IKspRCAacqp4VTPJrvWWvTeX+HOdLecMkuvsUGRSrbUe/bzkohZkGiCiNhWGJYVNp1
	8MsIP5pQ4HeeaLXlYO5dpXo5VgZvtuIutABV3EhphNyhm31axr79RTU0FI2IEKl+pJ/O
	ktcw==
X-Gm-Message-State: AHQUAuZSq5hp9SFb1r4UqZIP1ipqtKEG4QJeKwbYRWiX85IGM0ffSf8i
	/Hop90VCHJy/cgM61OeAfZ0cxyNx
X-Google-Smtp-Source: AHgI3IYi+lQ39bZQgHYN100S2rCauEoaDHUtr+2cqk1OqsP+/A6ZGLWx5UPuJBg01ng7QOorJFOxTw==
X-Received: by 2002:a0c:d0b6:: with SMTP id z51mr4693810qvg.20.1550870374049; 
	Fri, 22 Feb 2019 13:19:34 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id q8sm1394784qkj.58.2019.02.22.13.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Feb 2019 13:19:32 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 22 Feb 2019 18:19:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Feb 2019 18:19:25 -0300
Message-Id: <20190222211926.19877-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Fri, 22 Feb 2019 21:19:33 -0000
Content-Transfer-Encoding: 8bit

The chmod was removing the executing bit from the directory and then
the native version was failing to build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-idna.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 436b58606..519812ddc 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -16,7 +16,3 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-do_install_append() {
-    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
-}
\ No newline at end of file
-- 
2.20.1


