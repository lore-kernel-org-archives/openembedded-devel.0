Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF1478F72
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 02:30:31 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x7so380355pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 18:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=84dpquysXvAv3b1RpoGIxLAOn+gGdS1kMKgr2odPGgM=;
	b=enC35JV08HuK227FyOynVQ6pLZHZCecTbCYf0IkPgsjTbFsX3MKoB3vk3MJ6LQaIIc
	xoJse3bVRZR0a6gt+pgpbC8YgfHWubvudhz6gXqtC7UTAt4ltAX0gOvj9lfBZX2wZjl3
	hsiCLFz2i7oPp7XLz1QxGpHgdnzNl+qdiWEeFb/J6rVFe676F6RWcVIisVzy0d5co1QA
	XPA4fvvrHtHzUzpPv/ow+nERCZVfuk9RCCyHstMzgH3O+K9QCFkX5LJ/eX0Z7S7EvCID
	B8LDci6ed6HnEJTW5ew/r/Z7YgDZdHQU+f0YFaCRbvffpoZcy3YXAL41Gk4z5IzS8h4W
	jIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=84dpquysXvAv3b1RpoGIxLAOn+gGdS1kMKgr2odPGgM=;
	b=U4sHW3e2kcGkG/A1TxnfusoYBGd0UKHhGvaar8LigmP4DcVuly139cDg2Le8cewjWh
	BTocT1dRy50qQL4jwNAPhYQWJFSj4uMm+6i0zTnlnQC/JfyojJwy0LxxBRg8LZCYmaYx
	L4QxGcHDVuyoiN5KxCQBJknzOY1yRFYV9lPvCbbOk9/mxIPIFuzTXQ41hUSO+RENOOnd
	QIGgmycUtNQyAkBCAZDAYxxUtruIPKC9qxHlj4R7nMbnfdKspBDTsHWTEWNmhN4w/lJF
	88OIGIc5PdskJYISzJzq3i1oHVkVt7k5+NceXwGnTxSX1Pbat6gGmfTBsm4oRQe4Nn4h
	DwMg==
X-Gm-Message-State: APjAAAWxOJ51YMUtxriXtFs7BBnuAE9naCO4PFt9bdAcvfMdx5JzT8SX
	kAueSTNYn55LdbBTYeJ2eaA+g/J1hm8=
X-Google-Smtp-Source: APXvYqxbEimbW/0O/VxQ55AmwcqGtFXcj9x5TK7qBD+KsSXMupIMpIzRPb2RdQ6bpgFpYa/g+mKXrA==
X-Received: by 2002:a63:fc01:: with SMTP id j1mr3278718pgi.220.1576290631632; 
	Fri, 13 Dec 2019 18:30:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6d2c])
	by smtp.gmail.com with ESMTPSA id
	m45sm10849838pje.32.2019.12.13.18.30.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 18:30:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Dec 2019 18:30:15 -0800
Message-Id: <20191214023015.632747-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: extend --with-intl-api=build to all mips
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
X-List-Received-Date: Sat, 14 Dec 2019 02:30:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes mozjs crash, in launching js in qemu during gjs build

Fixes
|
| (process:606857): Gjs-ERROR **: 02:02:06.039: Could not initialize Javascript

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index 41a79daf4c..f52bcca735 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -56,7 +56,7 @@ EXTRA_OECONF = " \
 "
 
 # Without this, JS_Init() will fail for mips64.
-EXTRA_OECONF_append_mips64 = " --with-intl-api=build"
+EXTRA_OECONF_append_mipsarch = " --with-intl-api=build"
 
 EXTRA_OECONF_append_mipsarch = " --disable-ion"
 EXTRA_OECONF_append_riscv64 = " --disable-ion"
-- 
2.24.1


