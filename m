Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2665787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:53 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b25so1452030pfd.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7WIul3KOOetlFd6D/DDz/FnpxuclgFvmRvzXt/J4NhI=;
	b=Nj0EF664DLygvXeNjyofxln+MC9cJ1GqaYstzfKAlEEQvRpKA53fr5d71l2oEF6Hop
	RezplEGC2LdknK3AUbG2pqQ6f/8sjusaMyP6w4kM5e3kfmVOWwbi6OY0IB+nJe6ShIl1
	/ZKPHHR1WmJGa4OnA1u+u4TegGF+3GO9Buj9Nee5d6Ej/98OCLGc/M6Qux0/Z2cvQ675
	OnhrziktUS4tb+FlKl6BxBwZFCwHAOs+JxnFbYn/WeQGwwLoCOnzFGAhVOs/GsWYusOo
	n3aWduZLzSD6xbT2yweJWXLSy54uWWZuFLCnqiEiTsIkICYpDCLiod82W7TdQnp/B+vO
	BijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7WIul3KOOetlFd6D/DDz/FnpxuclgFvmRvzXt/J4NhI=;
	b=Gpc4emvYz/uaiW4GmXgx9yhWCPiGQVurdPiBBkF4US7X/uRS0+LuUAbv69HQHtgPf+
	3D63INPWC7McmAALPzEYzYD5z5XoTj3MpzIzi1c4xPWtuWMF8pIsyZN7+YqGDOyW/3RT
	PuanIr2wpB6w1kqlhNV0mUXnrKzH6ypquv7qOda3O0xu9Qx/iaWkwv7rKkbSl84LNisW
	2zPP+naKGOOLYV52ro6lueH8rOPsaaG+wJfXZyT2LZ9ZXC4S8bNnnWatW24tcpsNkcLt
	ba5K2GUosH8k9r8/TQ73lsCwUdzL06cZB3EdhE7krI9R8Hetn0cdFkAEZb1kkvUON5Jl
	h6pQ==
X-Gm-Message-State: AKwxytcrVJi02z4GgzO9ApCcZD3tEPnC1q1ldJJ4WX0AsnnN3fXJo1eI
	S5glcPMzXS6z2Bx1y8cNeYHdSQ==
X-Google-Smtp-Source: AH8x226HkIoUZqYe6KPr2o6kUBpAB5x/WLBLhwngQ6UySUb1i8CM7ffWstOUunp7c0vZae8nJ9ux1w==
X-Received: by 10.101.87.195 with SMTP id q3mr16726312pgr.428.1517023495516;
	Fri, 26 Jan 2018 19:24:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:15 -0800
Message-Id: <9ce9cf982ac9b4aadb7e6505bb799ac538580094.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 15/36] postgresql: Update to 9.4.14
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:54 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

1) Upgrade pcsc-lite from 9.4.13 to 9.4.14.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit f6c74fba0d0f8883b8abea581780741a2a757c49)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/{postgresql_9.4.13.bb => postgresql_9.4.14.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.13.bb => postgresql_9.4.14.bb} (67%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
similarity index 67%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
index bf97cad..5a78ea3 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
@@ -11,5 +11,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "dbdb9fbe1b9a394b9ac19d3113b73944"
-SRC_URI[sha256sum] = "0080f55d65194de8b96a2dab153443f8248ff2b2b10e6ab4cda2dcadcac7f2ab"
+SRC_URI[md5sum] = "2b7e2a2b0232063b68b3f8a0a01902bd"
+SRC_URI[sha256sum] = "8e7df23a104b057b360d03180ebcb67f645e198a4a0bee94bf56b2bc9505ec6b"
-- 
2.7.4


