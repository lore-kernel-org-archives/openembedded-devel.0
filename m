Return-Path: <dan.dedrick@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id B1D6D793E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 19:48:26 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id c23-v6so30273109itd.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I9QiBAlTxAyeCSK7qkiWQJsEtQoWKOopp0HPtym6gg4=;
	b=XFl9j0EPbs4G5PMoZ0wy9lPvfFeOPVFXyf+E2q4Mk7cvrytiq75RbRjx36IduaZ5XW
	maqvagGr7JDJJS5wB4HD0As1T3eFX3QO9eWm2DN1PBe4LU2zZuNpxfX6O50q22inFams
	+d3vdw8ivcr9s7a/fcze7b72E0LJwYX/QwVTfOCbHI+arrFW7zMplBFKK0JX/hiAGiQo
	69jgbKa9r+DN6k31C4cn8B529C/nVyGCPp893dGCGjuba8P20bvu/+PMMOfeDfoDNaYD
	WmQRI/cdofD6wYTbStv2rOYrB4iSH+pYOFXqHas7JECT3XiJcQXwktJO4YvLlykzcCF/
	pX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I9QiBAlTxAyeCSK7qkiWQJsEtQoWKOopp0HPtym6gg4=;
	b=holyTE5cTacUTlU9ygJi9jpoBhSXir4vCnC5FgJIYy0yq79MA+WqUJ51qYKKYw9MFJ
	0IyX1cldcXqPT62zlLeAv9gcr+StQt0XvX2BjFUykWDs9GRdzTWoVMSeaAgw0QK3cw4o
	kjefDRhPKzfWtAiv3ATOxzk0oqnMz+ls65gASQe3H5To2nIY4U6HL2Nlyzoz0Lvev2+L
	SqWFc402S5i11yAmgjAvUTqkh7EiS6tg6Of/I6GQJcvBDcINhieo6fNu5UOV2EgR9c6c
	pPq7Vy+cbcH6y4S3kXlIFMzljnFTrqIhdskP2dkH3Vs/PiH8gScq/baIjlFIGfH5cOpM
	wY5Q==
X-Gm-Message-State: ABuFfohKoIPyUaknBVKbRzRbJy4cjJXPXM1S7KV6XjoYZ26NmZUgei4F
	1YuHb2YBmORln8eRWIt9korpJuew
X-Google-Smtp-Source: ACcGV63IXCwLShnKckArjMxIVX18x1WTWoW4qManu6QNbS6Pb8ZYj57OcyB3vOinOXvwVvnGt42+Vw==
X-Received: by 2002:a24:65d5:: with SMTP id
	u204-v6mr13834666itb.173.1539632907352; 
	Mon, 15 Oct 2018 12:48:27 -0700 (PDT)
Received: from talyn.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	x21-v6sm5142769ita.6.2018.10.15.12.48.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 12:48:26 -0700 (PDT)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2018 15:48:19 -0400
Message-Id: <20181015194819.77945-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.17.1
Cc: Dan Dedrick <ddedrick@lexmark.com>
Subject: [meta-oe][PATCH] zlog: fix up library path for multilib
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
X-List-Received-Date: Mon, 15 Oct 2018 19:48:26 -0000

When using multilib the path for libraries might be something other than
/usr/lib. zlog defaults LIBRARY_PATH to 'lib' so we need to set this
appropriately so that cases where this isn't 'lib' it works properly.

Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
---
 meta-oe/recipes-extended/zlog/zlog_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zlog/zlog_git.bb b/meta-oe/recipes-extended/zlog/zlog_git.bb
index 86e6d30e2..de7516457 100644
--- a/meta-oe/recipes-extended/zlog/zlog_git.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
-EXTRA_OEMAKE = "CC='${CC}' LD='${LD}'"
+EXTRA_OEMAKE = "CC='${CC}' LD='${LD}' LIBRARY_PATH=${baselib}"
 
 do_install() {
     oe_runmake install PREFIX=${D}${exec_prefix} INSTALL=install
-- 
2.17.1


