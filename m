Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D004E7CE69
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:26:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id h8so10326410pgp.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 21:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VNbFAielFZiqPG7AuU/W91YU7lWIn6axq8YCQ7YhSq0=;
	b=tbpcPgltRU/uxtZ8eqIQAVFlRePYmVkeEmFWvgVqnm+PAVXdZoeC6s43hpqVNhi/pR
	+uNKPzHitqKj59f9BNIxV9mFyBJVC5wYONT3sn06kjUXWeLjSXbWXKFTE6qqn8cmX3Nc
	Lig3VvKmsnuv15LiRQDULf/6YGStjez4K0lvoUVeToK7ezF07sBVsuOU6vpme1T943nX
	WzoxqrBTBKVwgusAxmGLzt+KySnEHHweBBI6rDU+RKjaXXm5vWtYLikQxsbImhEiolnj
	F+zKKrZlvdgoX4ipWRqXWU1e9YxHJHUfXMQoI5VlYiKjTwixWmF9XukZlJOj5YphxlpG
	5ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VNbFAielFZiqPG7AuU/W91YU7lWIn6axq8YCQ7YhSq0=;
	b=IDRdxuiK9rkpFU+Rj2UReP1H319rTLs8S/Qxavi2FgrsovOPRYLlYdtMl6GhBc3Wv4
	wcI5MGgNzNYJiNRqbQ4gDbeSTn9UUx7JHuRmJ/ekJIZXiA+kALqL5UxXJGNOXjAbEbgR
	iEwOESbNNeWCmO0xlI3u8C67DgSxAuG9IYLpYdEZyNfMc/Sp+riPO9gQ8tcam4ZwgoyR
	g6Mxru5lUqezctVL4WiaTohXDM/JreGNtL+s+plNREK91pU6EKsQMoh/u4I77hmHoGSN
	9adCcsvGwTrUhfu4K07OXpl9ZapgHTLWQ3IhhFakNurM/1eQUTQASsaaPLtS3+nPdz6X
	K4aw==
X-Gm-Message-State: APjAAAWw0wJP5PLkeSC0fjLVHk3WKQzWeu6E6MBbtDlXJQTVyHEV+YKA
	Cv6dEmt/NivQsqbpwmCQLBSIa+ag
X-Google-Smtp-Source: APXvYqyM4e+W9CylTe/G0u+KesWWNTOYaRREMGD41gt2USRKzm64W+f3ZjFPzgdgToTeUv/kQUVJUg==
X-Received: by 2002:a17:902:8f81:: with SMTP id
	z1mr11208401plo.265.1551936404470; 
	Wed, 06 Mar 2019 21:26:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	11sm4617531pfh.131.2019.03.06.21.26.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 21:26:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:26:28 -0800
Message-Id: <20190307052628.38454-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307052628.38454-1-raj.khem@gmail.com>
References: <20190307052628.38454-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/2] vlc: Add -pthread on riscv
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
X-List-Received-Date: Thu, 07 Mar 2019 05:26:44 -0000
Content-Transfer-Encoding: 8bit

Fixes missing atomic symols during linking e.g.

vlc-3.0.6/src/misc/picture_pool.c:201: undefined reference to `__atomic_fetch_add_2'
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
index 95b6779fde..1ae213ff32 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
@@ -3,6 +3,8 @@ require ${BPN}.inc
 # work around build failure
 EXTRA_OECONF += " --enable-libxml2=no"
 
+LDFLAGS_append_riscv64 = " -pthread"
+
 SRC_URI += " \
             file://0002-glibc-does-not-provide-strlcpy.patch \
             file://0005-libpostproc-header-check.patch \
-- 
2.21.0


