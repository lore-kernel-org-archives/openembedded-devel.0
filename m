Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 61C7676F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:24 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10378363wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fVVmNRcpDHs+vgR/D2cFX4Ubgq2kWyH5VrKnUT9DlVg=;
	b=XdrSGHmHUv9+ehftILBuqsV/i0h++mRzsnSORYYMVSB8ieqZWBY4gqYG6L20yWGlY+
	kYYb7fECE19PcysVomxGBW4c/3PoRPUv0XsKrxZhHhsmgpffVSTtBAK0dIld2giFcZ4W
	QA2pXp6R3T5Fzo/VFTIDnWzOtnqX+YI4HyiLGM6eNfsz02jMn2ZvDjnhYGzM4UVM12fq
	5HnHDZOWTwwB7pUOD8ZNSemr9RiBsOcGuDzDN/5nFC9f7TKm383c2e+73rLfp27C+4Sg
	XT04ap9ic7YqF6rPUuaEeBFHdu7G0KeOS+64gZjKFgb/NxcrYTkw4jshtvljK3Sd/y6/
	6l1A==
X-Received: by 10.28.212.18 with SMTP id l18mr3302836wmg.93.1446207265025;
	Fri, 30 Oct 2015 05:14:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:42 +0100
Message-Id: <1446207225-15386-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] gnulib: add native extend
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fontforge-native will require it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/gnulib/gnulib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
index a064502..766e41a 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_git.bb
@@ -30,3 +30,5 @@ do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


