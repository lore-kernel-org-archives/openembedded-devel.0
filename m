Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4336D7CA5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:00:21 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id o6so10502399qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 06:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=xknJ4cPdJ+Z1isHOexYwdMJ7QLKcu6G5hYUKSauFuP0=;
	b=Ojbkj/UPyGO4qqpKtOoAd3V5b4VLCBD0tO5KOzRUzaNXP6L5zJoKCcxfi698uGkk/K
	I/wOmM6LedxbwFC1cDAoa9vypH+wMuXM2UdjCm8nOOBtAu4zU/eHPPvsgrE3D+o8WAZB
	zTk5YulTuSwiqz0k5BkRn5Jz9JfD1zCcRVjDTZQN5Cdtph+IbFE6CVGaYexqY8TWg7Aj
	ZRxUnxivtSZlvHQpNDiCIbSWY3IO25+Lp02v/gkHxMOO1Ul/j9Qh2ml9Q3yL5TERVFd5
	91WzGfPUYsIT56uyg5qO6Tqjx0jpSG6WTHt4gJTCJwWTcE1UXQrOn7NWJRX3JeDmT59w
	1WWA==
X-Gm-Message-State: AHQUAuYpkwwIfON6vB1SAe4Yro4ZBHZ3ZatIbXhFC2hzZfn038AMnGDu
	6HDIlmYexhw6D2WBBnpIPcT1lLGX
X-Google-Smtp-Source: AHgI3IY2P6DLgBwFOCpReQ/z2cVlu/zxjlckanryU2qQx4EC55VqecK+Gmc/ZLSnnBZyGYz98mTFRA==
X-Received: by 2002:ac8:1aeb:: with SMTP id h40mr13703991qtk.309.1551103221738;
	Mon, 25 Feb 2019 06:00:21 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	c19sm3822451qkg.88.2019.02.25.06.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 06:00:20 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 25 Feb 2019 11:00:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 11:00:08 -0300
Message-Id: <20190225140010.19025-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 25 Feb 2019 14:00:21 -0000
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


