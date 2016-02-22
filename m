Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA75770EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:09 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a4so161837735wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEFRUOMxyI39ZFspCtTuzTY1q3V5XxTxfHmy8X4Hbd0=;
	b=IHJ631qBuJVE9X6/cbUFiL1azyLVZYb76LfjbAD8xG9Gt9lMlKtJdxlIHWgnjP/OVy
	fU2OwJNkyLt9GFxvrIBenMWWFw6rPXPLMBkEb6wjC2l4GDWcQ8IkDsbjmOzDpNlsdRLB
	oaBTp3k+DHOKz53DBi90jhVYmy1HpBz+XcnGY2OpWpUk5JdZgN4hvu1QqqvaCvsG6/Sz
	ewnLyJ7BHTd4LmGaIa6KZR7qGNpA0ZsGX+Tkea+sh71bUwBpuO+6+Ja6Xy7ypkGZ3xJo
	yr+FMXCwXqIcKY+7XyqsvHjmPQPT36ADooYnErLqqDzYTMcBi82A5yqtSxUSwMg2hSyj
	nPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEFRUOMxyI39ZFspCtTuzTY1q3V5XxTxfHmy8X4Hbd0=;
	b=B7wzrcvEOvJkc3w7qp1RKG9nsyiWEL4wrX9ExT5DJqEkukfEbWhZxDyRFOHX+uF1e0
	vtmVcJaefZg0Ldlkj3KSTLpwjmiVA8K/OakVu4NH9tYJliDTWfJ13cXytx5DFu8BhEHl
	AsRfnoU4bjYZl6SAZRZTKk9+ZIbJBYmePmTtb7a37UKpAaKKbkc1vZMkiU15CkDJvpqL
	c+hz2mVSfkfpgc1mYOKFhnDHYepsmp1kalbGW2+tn+TOU7up2U/fcx2GMbPuEKg9lSKu
	Ap30aaE8yGLZYoWLhiyjQ+D6LDtemCZQS1VO8EXl0YCE0OpY32D2GiDRnzE6is6IYAko
	umCA==
X-Gm-Message-State: AG10YOQVRcPrzUxx45CVSrYnEshI7nqRpaWIipizmcxIIYlcJbW2fzdOCyofl03p3X4ofg==
X-Received: by 10.194.120.229 with SMTP id lf5mr31275978wjb.151.1456146550186; 
	Mon, 22 Feb 2016 05:09:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lc3sm24698694wjb.7.2016.02.22.05.09.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:50 +0100
Message-Id: <1456146596-6976-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 04/10] mpich: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
index 2434a42..7d00906 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -34,3 +34,6 @@ do_configure_prepend() {
     oe_runconf
     exit
 }
+
+# http://errors.yoctoproject.org/Errors/Details/35146/
+PNBLACKLIST[mpich] ?= "BROKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc failed sanity test (tmpdir)"
-- 
2.7.1


