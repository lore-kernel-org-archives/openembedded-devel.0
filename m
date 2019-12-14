Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD057DE74
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 20:43:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p27so2709561pli.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5FwgZbDjj/93JNojMgX4fh5ExLpdvlpj9vA8y3jCHaY=;
	b=FwEINCKEKS37r+gukShhetRKEjNeYU25kcC7dcEbvDwsA0AAneJL0PeuswpUAde0sn
	z8HzGPu/4+QaVotINXX4IUesi3vAlYAwC3bXX2ZJOYjG9XwQr9Oq/4of5QrmM94ZnfAd
	QC/EvVOKOjSzRRoOqHXRMTXdSxXEhTUCeK+vqA7LvNsVbSx2NsWaxae4wFYb0oO6cwp+
	+FO5nVw1uFs1/C7QXaczl8CuWJq4z13zSo+zsQmktnEDcOJo24282TDUHc3dMaeymWHK
	+nU5ypYlCHGg17lZqRJe5YuD4xrFuHgwR8GWnuEA4bZJai7y4nQjPCRvRLIN/YmI/Om5
	/Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5FwgZbDjj/93JNojMgX4fh5ExLpdvlpj9vA8y3jCHaY=;
	b=SKOROorIbCZ5PEz6t+tbEuXWJ3EdZh3PAKjV2xHnPvoPPt+ySzMTomGMuXQ7BmE0lk
	keur9foft1ItmB/n/TPhS2I4ACe8f4y0RU7oj1HO91qwKRZyM0PbQ37dvMgxhvjMGEfe
	xYE8yVvDrzs9x0/TE6K2y1U3ZaCH2PwdMFC9PpEehvHxLji5jFVFhsaTFqVFvL+G9TOp
	4wtI6MH9YK7/6ezRoicDs2gWske1QON/NLoAZwNHWkY7UyyJzZ6VssUVr/gR3bqKjaQV
	lLe/NPjfToOL5GKeudQOLd+xfQOG7xiY0VXylAnzVmvx8IyTkKuWZpMPlxlUDWGT7jel
	EFSQ==
X-Gm-Message-State: APjAAAXzHQ3prWdxZ9tBJMmpqdwV2K5RThcjzJqYsa6nxybXS0xCNyb6
	PRP2NVdy7b0CWP8uFswy8iNGep58FqQ=
X-Google-Smtp-Source: APXvYqx5dSuVVhZDLHCvThx8U3lq8bfSNvc7e00MOBz8SThGfJYtJ4q70sXrV2JwSBB/MrM+zPO0nw==
X-Received: by 2002:a17:902:bd46:: with SMTP id
	b6mr2604732plx.239.1576356184747; 
	Sat, 14 Dec 2019 12:43:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:5d00:41dd:14a4:c696])
	by smtp.gmail.com with ESMTPSA id
	z30sm16814688pff.131.2019.12.14.12.43.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Dec 2019 12:43:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Dec 2019 12:43:02 -0800
Message-Id: <1576356182-16473-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] gtkwave: add the libtirpc dependence and config
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
X-List-Received-Date: Sat, 14 Dec 2019 20:43:04 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Since the oe-core commit "libtirpc: create the symbol link for rpc
header files" create the symbol link of header files, so during
checking it will find the related header files, then it will use
the old PRC_LDADD value "-lrpc" other than "-ltirpc".
So we add the option "--with-tirpc" to the configure command and
add the dependence.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 26fdb6f16869744b9e9ce717dffd2f89170d51e9)

Fixes build issue:

TOPDIR/tmp/work/core2-64-poky-linux/gtkwave/3.3.98-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/9.2.0/ld: vzt_write.o: in function `vzt_wr_emit_value_double':
/usr/src/debug/gtkwave/3.3.98-r0/build/src/helpers/../../../gtkwave-3.3.98/src/helpers/vzt_write.c:1637: undefined reference to `xdrmem_create'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index 310c410..68b5ad8 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} = "tk-lib"
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.7.4


