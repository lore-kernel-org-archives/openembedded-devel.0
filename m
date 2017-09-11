Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 593E871BE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q76so5009725pfq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j9vF0n2Qp6HT51pPCNob1PsKj9u8fsDSMwFc5Zedp1o=;
	b=YzljYtyx2Ncaibb0jH2q4hJz0j6BL170xK+WH/zMewNC30NNVc4rooSaiJuNEVPZtA
	ANXFcvFToJTs2+hZekARnSkaK/cfZZoWyOl4T7zUUS8OxfWXo4D5ACURCnTcFUtKQ24M
	ohGkVJpX1N8BLQKLTXudoy8PQp52Y8eC8mfd5YZvl4fUW2fU1R/Db3IkaV1lqlD8onQr
	X8x9QAIfPAUDgL67daFhX2sWotesDIA8dorCdvm+78IL/z03ORj0RoKptd+ZJh2WxBJ4
	kjQdguQLxS4OKP1EgOWSW3E1aidQ9DXfZTnHMvZv9K+8xAw1T/Ep4XsLKV6a5WMvfcFi
	WPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j9vF0n2Qp6HT51pPCNob1PsKj9u8fsDSMwFc5Zedp1o=;
	b=UY+OQ4TE+MbFvkcfSFQ+RNRd0VQEK9VbsAqkLvSanFEsbC/W5gXtpa+UWO6Cua8pYj
	x+Ou4pxGN+htmJVXv31Z/XC5G9IQFZGqLaYDsirkqCBkjSZ2lPK9VrBKJpmTITPb5YdN
	zEyiewrexy5OYlT+K7In5HyhQPgySmLPt98o1ZgANVKHv7ZiQHdFpxbaaA47CitNS/dW
	87wCkM6+qkK8sghhQuqcGpm3QwNLBTJiUs7bCfa/GRdZRJq0mjpOgNwIFp+TkkHLE/SP
	jvmnxhYU+LkiEDz98JaEVDgHjH28HwaYaccCaDza+slPJplz8vlFELsfl9JvAwSzJpnY
	oVZw==
X-Gm-Message-State: AHPjjUjOg0IDl71CasDQCkMUMe3E5syWzeWxo1uPeo4ZhlVam4opVY9a
	/QFyfWqJGK7jqTSd
X-Google-Smtp-Source: ADKCNb7qVkcm2EgvMoU/sc8kdCazvRyPuLJLvAOTnvJFuAgwAWdzVpN3dd+WIJXlS5mqOsU854LGNQ==
X-Received: by 10.98.103.89 with SMTP id b86mr11916082pfc.319.1505142665320;
	Mon, 11 Sep 2017 08:11:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm4374067pfx.145.2017.09.11.08.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:11:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 08:10:52 -0700
Message-Id: <20170911151056.4577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-initramfs][PATCH 1/5] klibc: Edit out gcc hardcoding in do_compile
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
X-List-Received-Date: Mon, 11 Sep 2017 15:11:04 -0000

This is needed when building klcc-cross and klcc-cross
does not have do_configure, therefore stick this just before
do_compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index ed15b2e1e..dec3d3704 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -50,7 +50,7 @@ do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
 
-do_configure_prepend_toolchain-clang() {
+do_compile_prepend_toolchain-clang() {
     sed -i -e 's#$(KLIBCROSS)gcc#$(KLIBCROSS)clang#g' ${S}/Makefile
 }
 
-- 
2.14.1


