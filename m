Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ucstj-0007PT-PO
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 09:46:50 +0200
Received: by mail-da0-f43.google.com with SMTP id u7so1499523dae.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2013 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=KVsShrHiAPAuqDLnjKvsbqgyA6SWCjGHzsonhLTrVaI=;
	b=aBnvOjZBbojd2ed/oMUWSs09kHG7NVUTxJUT6djwlTveiDsh1DAIII9gmYR9feGkBS
	XFitT4snP2Scet3AfPgaGLHYK110wYjx+yhJn7RpsunEN6B/jcd6H/0hHWHlnC2clCQb
	k5kk3vwWJv/9NCj6I+H13W8Hr81mZ6kYmPzVjDt9ffumWgM/X6+O8rprzFysxZh6gj3h
	FeArO3gGdbpo+uRR5SGS2O0UhXx5MbWr8v3qU6t0QKqdnoZXKvNQhvnbVRlnpFJajtSd
	Yj1yWfnhaeG9T4j9vh+17CseLieISCKXaLD1QEpcMguJh3UxaAWwb7fCfmgMyHuEGe7O
	x3hg==
X-Received: by 10.68.176.37 with SMTP id cf5mr42017178pbc.173.1368689313289;
	Thu, 16 May 2013 00:28:33 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id uv1sm5771352pbc.16.2013.05.16.00.28.32
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 00:28:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2013 00:26:49 -0700
Message-Id: <1368689209-26886-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-browser][PATCH] nss: Build on mips64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 07:46:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have mips64 qemu support in OE-Core
this started to fail to build. So lets fix it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Eric Bénard <eric@eukrea.com>
CC: Denis Carikli <denis@eukrea.com>
CC: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-support/nss/nss_3.13.3.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index fbab6ee..ac77547 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -25,6 +25,8 @@ TD = "${S}/tentative-dist"
 PARALLEL_MAKE = ""
 
 USE64BIT_x86-64 = "USE_64=1"
+USE64BIT_mips64 = "USE_64=1"
+USE64BIT_mips64el = "USE_64=1"
 USE64BIT ?= ""
 
 do_compile() {
-- 
1.7.9.5



