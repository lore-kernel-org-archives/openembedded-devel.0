Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id B0C2F6B804
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:19 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so184619eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=yBT4KHN0c03btRK5dcpEq56m7BGIGHt7Prr5URhCBwU=;
	b=Pge6h3VDNeGWCVOVpkbgnMF+HduDRI9k3i4z5V/ae6dHKdIoDf0AddhD74mPxBMxnX
	pJ1le4sIzBUQoSX/kVktq+/Mr9+rhxG5prrARbWMruFWwb0zXXKZSQnQUwvdt9rJvqH2
	J6nzfqiQ8Mpi7lEdQ+Wzw22w27dwz10nmpwZEwz0RGxz4xXHpPyHkNMWWs8FDQXIfo3e
	60R6T8QVk+x5QdcPRT+wJinXkYzvhxaJ4bNQ7uBl4o+7DF9+O5edym7OYUac36KEvFtT
	nqDrnkmDDfV/QsswEYaus8a/pBkIjhQSt+V1VCCxHMSJzfZFR+KoWkpuqosmzk0QyQsM
	7rHg==
X-Received: by 10.14.210.8 with SMTP id t8mr20521147eeo.39.1376551160160;
	Thu, 15 Aug 2013 00:19:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm81933003eem.1.2013.08.15.00.19.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:00 +0200
Message-Id: <77cbd921fdfa83d023dba80a8c94c4e4a036e8b7.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 20/60] f2fs-tools: add util-linux dependency
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:20 -0000

---
 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
index e5b5439..7755a7f 100644
--- a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
+++ b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -4,6 +4,9 @@ HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=15667d9b3cb737b57471c148b7c50734"
 
+# to provide libuuid
+DEPENDS = "util-linux"
+
 SRCREV = "da59f6146c37e727bb83ae4922ca56d42958e61c"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;protocol=git"
 S = "${WORKDIR}/git"
-- 
1.8.3.2


