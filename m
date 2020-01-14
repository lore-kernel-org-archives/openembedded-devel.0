Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0227FA23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:29:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so12170746wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BlAxb+iKPJ8Ye6+uziMpHttktqcu9H407FPEWz0k9U4=;
	b=srP8/fvEwRniaPNELvtxdMJrGe0EjvDT81o0cmkhjN5BI307j+Du+Knb5VB1WsXth9
	Yl81s9FgB6SBok6U/Ys7dYFoper++QeExg/Qjb2KYeOt0abucHvR0h5t61ptkUOqKYcp
	l4sJSd40Yfzz0gFxS05oADukb4OoBAbjckw/Hsq0s+RTrFvveZk67XJCwxzWJrVyAR9q
	BvwwWuCg2YlKF00SusXdJdx7isXvxP66zqHxQnrRXgysZIBRUrT+4KNDB04d++k1rf9V
	pV8ldY09TSUDy1suwgD7J5cSZ2U1or0w1ABN0Y+drd4jYAD8yIGCik3P8s6cequHYDqc
	5+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BlAxb+iKPJ8Ye6+uziMpHttktqcu9H407FPEWz0k9U4=;
	b=qC+0QBuGsaIV102wQVuNm0UR+g2L2XHPYrrJ4Zs/Uvtc+lX15ltJIU7OdyDTti3xek
	speunNxs3P5IbCd3R6hXTrk/K7YWPm0Zv2ytBpcvu3bWhf3YGPhaEyTwxuEZ7xxmu5Qq
	B3+DU4IxmFGyAeqhCTNFNv1+pzzLKER5hPvdXqVlEDjYV2uGTOAlAWTFL/j8FeqbDSMo
	rxJSC9zsS316STnqiGQP4oUGlpOoQaUiZEnVtPKwz37kYXnTDn/xC6jpJKsQLE9s7IrH
	1/idECtzv4dXJ+oy7j3ff6zsijIJOouVkQ6ygH7rBreyNaKCeVFo7NED3Xu+XEly9D1C
	Q/xg==
X-Gm-Message-State: APjAAAX2Kq1QJ+7KJVEgVKnf0QqgTt2JpYWmbwUeLnU6FYDMrXqFvgD2
	BrFJFT5veQWUIdudXiEvfnuDvqtD
X-Google-Smtp-Source: APXvYqwk42PrVhUJcu3scKGiKJf6iw2eCLC7xVHmweCHLTn1gCjw7YSY4Uk619Ve/+q77flxdnUM6g==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr24809664wrq.57.1579008587380; 
	Tue, 14 Jan 2020 05:29:47 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:e829:5d33:98c5:aa8f])
	by smtp.gmail.com with ESMTPSA id
	m3sm19005158wrs.53.2020.01.14.05.29.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 05:29:46 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:29:44 +0100
Message-Id: <20200114132944.29964-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] websocketpp: refresh clang patch
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
X-List-Received-Date: Tue, 14 Jan 2020 13:29:47 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
index 421789728..f1d037fae 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
@@ -18,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2d13117..c17354a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -148,7 +148,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+@@ -150,7 +150,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
          endif()
          set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
          set (WEBSOCKETPP_BOOST_LIBS system thread)
-- 
2.17.1


