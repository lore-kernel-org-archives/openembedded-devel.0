Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB117C127
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:01:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a13so1959842ljm.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pBW8tjSvFVc0kCKbmjZ8zdUGlw9oxU7JZ+l8O2MjH7s=;
	b=p45NgLqT79xc3Q35y33Qy3ETrO4Drpii5H7PpJEwptmB0mpdZ94CuD4RBjLw/Afjb4
	hJF1PQrUPJyvcEwu0+4MLPVNEdyqWepvFn8nEFT3DfNV5IjhMoCW8P1qRd5oN9mNkKLx
	y7J/i8ojvn2OOXQklWi7CC8EEdCVvnkX9wZ4aOTPwfpfbCf0XzpLCXl6yXb4FWShghOV
	kC64sl+sGKJT5V1qxkFB3pFuTrpO9Ak0EOKSKFoOGiWSEXvded5dFy4PT6g32tMRQijv
	eY0Bv7/jpNXHtMtfKyGTNQpW37DbDMCh6o04qp6n9PbWmLS/tWmcFV93jUSGjDgGMy31
	X10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pBW8tjSvFVc0kCKbmjZ8zdUGlw9oxU7JZ+l8O2MjH7s=;
	b=NXC91KaVAMPUSELnY1Zaut9yM24E7gUv7JNOpTOhmrNlYuQP73DzCMHy7+KZ7kLBGL
	InZG7omTmuaOwhn9rnTdqEJXTQGBUgqlgxrHPG+2R/rRqqg0lTR50CMbHsc83cR8dEQe
	LfRM0DeyXu2nuwizJ0Pa9jwXdY1JR8qfhQMWJ27u2AvxzM0W5wPR8uTQbFTeb7rdUQMB
	53nQ0mRkZek0nWU17IlpWXFgExXT6RUFjeRug5P3exjp5ve3tN4EukJywET8sVsjjqRJ
	/WsIlF1ey3V91SUaW1wT6jWp3TdXNh1Lw8I1wY1RS65iMcHnQ/fKs1tnFt4uAY8Esbg6
	JF8Q==
X-Gm-Message-State: APjAAAWSIGbic5z8B/S0VpU5l4pUl5Hmio7GVbfFrkkLqC6WfEMXSrwi
	YN7U47jPnJlOjLvSRq0kUaaz9A/0
X-Google-Smtp-Source: APXvYqzgkpZUfLycbZjMSCsJnFyoGuzsi2f2DMiCuPhC6Q7BxWp/AMrrVv8SkwUcRCLWV4C4rmucvw==
X-Received: by 2002:a2e:9095:: with SMTP id l21mr5447030ljg.175.1576152071292; 
	Thu, 12 Dec 2019 04:01:11 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id d9sm2883026lja.73.2019.12.12.04.01.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 04:01:10 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2019 13:00:54 +0100
Message-Id: <20191212120054.3736-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] cacao: Use python3 in java wrapper script
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
X-List-Received-Date: Thu, 12 Dec 2019 12:01:11 -0000
Content-Transfer-Encoding: 8bit

OE-Core has dropped python2 so switch to using python3.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../cacao-1.6.1-do-not-rely-on-absolute-paths.patch           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch b/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
index 2b046cf..665377b 100644
--- a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
+++ b/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
@@ -27,8 +27,8 @@ index 0790f02..2118de7 100644
 +
 +# if this shell script is invoked through symlink, we get invalid paths. As getting the real path to this file is
 +# very painful using only /bin/sh, python is used instead.
-+PYTHON_STR="import os; print os.path.dirname(os.path.realpath(os.readlink(\"${CURRENT_DIR}/java\"))) if os.path.islink(\"${CURRENT_DIR}/java\") else \"${CURRENT_DIR}\""
-+REAL_DIR=`python -c "${PYTHON_STR}"`
++PYTHON_STR="import os; print(os.path.dirname(os.path.realpath(os.readlink(\"${CURRENT_DIR}/java\"))) if os.path.islink(\"${CURRENT_DIR}/java\") else \"${CURRENT_DIR}\")"
++REAL_DIR=`python3 -c "${PYTHON_STR}"`
 +
 +PARENT_DIR=`dirname ${REAL_DIR}`
 +
-- 
2.23.0


