Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49D9671AE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 18:06:51 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id a29so32636067qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 10:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1rQBOu0tRybb5Mg5UTtsAcBLNBtNoaEBn2TMif/PFn8=;
	b=oOhvYYYpQph6HlET74xZnlV2uCvfSZZBt22iwuEOHvWXi8sUvEOMtJ6E9QifHWjgcd
	hqIjRLkaXE/S3i5+C6sFe9N5DHendS+S8CZWps8LL6UhzHKAqlb2TKovQAAXu5hJtXNA
	UFj8nYCQQfC/4Q36qyaWcn3ql7zfxWE0ffh1Rb6hD7PsfJL15sFloUKYABkt3wvt1pWQ
	C3qyn5ZmrOEzXg3FqEk3iWTDaz7cL9EPF0o9Atjfmmvgdpg67AcKNrQHk8iAIPjeIg4N
	hCJd+VxKgVMc/UV7PGS77pmvsax7IwH7PeXj6cuZ6vlzNWqlnAtnsOl28F3gQ0xyh/+R
	fIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1rQBOu0tRybb5Mg5UTtsAcBLNBtNoaEBn2TMif/PFn8=;
	b=JPy6+KqxZflIliVhnxHjbsH/oiciQX88TgjRnTiy6qeYeNsHLkjDiKWh729GaMVi9s
	1XMQKRjdI75NyPnXDvqI1ZmGaTy+7zRBfFoLsYFUtCjzNANA+n3CgEwfMOHLDSNW2bFf
	LLwHGbXuhBSpsuTnda3/wVRqCpD40eXsc75UxNzIJke5hNxv7jIgBzSDIdTPE56GTBwb
	aMNjHj8moWgKr2mhlCHKJO0po8xYlVIMenS72gs1Lvpf6igOGYZfsdKy/ci3C3j42542
	gjU0GHSHYMOb+1VvAOL0iyJvSttKIx0yIwvm5Z4y6mnkeNafFw60s/vb2HWHBs/QIeKH
	Dbvg==
X-Gm-Message-State: AIkVDXIaa+DALRKgjavhzy7uTJD+FM5AXsBo2lW/N2En2syP6UWJcvK4zca8ZkGVluikQQ==
X-Received: by 10.237.53.77 with SMTP id b13mr36622121qte.151.1485367612243;
	Wed, 25 Jan 2017 10:06:52 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67])
	by smtp.gmail.com with ESMTPSA id 140sm924624qkj.19.2017.01.25.10.06.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 10:06:50 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:06:42 -0500
Message-Id: <1485367604-27736-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-cffi: Fix build for per-recipe sysroot.
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
X-List-Received-Date: Wed, 25 Jan 2017 18:06:52 -0000

Reverse the include and inherit to prevent the DEPENDS= in .inc from
overwriting the one from inherit.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-cffi_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
index 1d2d241..3cd62d1 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
@@ -1,2 +1,2 @@
-inherit pypi setuptools
 require python-cffi.inc
+inherit pypi setuptools
-- 
2.7.4


