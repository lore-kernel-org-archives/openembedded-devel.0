Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0677677142
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:11 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b205so154798814wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SuQjSZSm/ULn1mENo8Y/edmkueSk983F+KDWDBnfnaE=;
	b=FrsTKswhD2x553v9WKSuTpaLZcItoswOW5cF+eOobiEipqTAStJDXP4VNivu9w9FZZ
	dlX7sP+YXrxjEJRndfg/kaUPAIzz/Mh+ervK/WmouiYExIcEa4K9bfYxeh3Vh9MFmTsi
	ZS4mbcQGzTkvDSLwlto10QF5ReOPqEOY1au9oy1iAt26hul5ndfdT7iSjK9j3+CmGIjP
	91SNo6JgFP+GU8pUCAUhyCfaRYSnF27uCzsZLLzjiDxu/mhwV89uH9p3lMh0kyIkJi2C
	/9UqaNL0ZR2nVMEsvphoP8D5yVw9jzAVHjymVMrwHyvWtWY+x2XrtNWhcAgA1EDkXAjK
	pNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SuQjSZSm/ULn1mENo8Y/edmkueSk983F+KDWDBnfnaE=;
	b=TmpZ0uhT73DbcfTL4mUwRWDsD5nB8qhuJTUiwd/j/+OuUdRIQ+0XPx65GV1CfemNel
	aWlcp1J4OrO3szywK7/bCFQ7R1R8WdvA0isevAIUxzaXzFNuassvDGvNnh64gIOmzV5h
	7FcV6OAFN0BEq469wdN+ouZrDwqPFcrNbsPnigkDnvpfMTqvjtVy/OcVZpFLNppzKuqU
	xO0vcJVhXlpGG6O/TxXKFe0MCvFRBC21OyNpsH6JyEqR6ZQih7WTWPp8VsJWOm4yMEqT
	fWCgEGzOJIbNe2yQxdR3U7JVTlZF0t8N/8r7z4H6iH0NU9gBVrqKLZ2dYBL++wazGnrb
	Ba4w==
X-Gm-Message-State: AG10YORFJqsnjiXlAJhywtqq7xyHkxbAv+ez3Wu8YBx6RPHgmU1wd1bmMCV/EFlnHYDrlQ==
X-Received: by 10.28.187.134 with SMTP id l128mr11863594wmf.61.1456146551677; 
	Mon, 22 Feb 2016 05:09:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm1836849wjb.33.2016.02.22.05.09.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:51 +0100
Message-Id: <1456146596-6976-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 05/10] xerces-c: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
index 165cb55..6e870dd 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
@@ -39,3 +39,6 @@ FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
 FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Details/35144/
+PNBLACKLIST[xerces-c] ?= "BROKEN: QA Issue: xerces-c.pc failed sanity test (tmpdir)"
-- 
2.7.1


