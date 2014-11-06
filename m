Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4AA7067B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 19:23:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id va2so1419445obc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 11:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ctpakGBH28mLVGGXI238n/4tWrwNuxm4gn1kCVHiD9c=;
	b=BCKLq6GVdQ7ix1QbciZJn0WpMqgkeQuUTJ/T3uA65+FhfE+ry+tHK2iGutGJ8RV3QO
	4BMYKBur06vmCUIxNjq00+hVJ9a0jpgqP/1letscfpLzMXqga51rm5detxH3zK+KJKtG
	zJGvGxJghPmJQrMPHK6mpdtyyK+Kj8Gi2l/9CwxR0QK/NWOJK3yvOO78RtEzLvo8s46y
	k9AnnWw+GI7jWQjsXCJhYEJfUNY0jVyhkib1QKekX+KzppdTeqKQjWYIlHVZYYFan+8C
	7b5x7N1ZonswWgDF/nVLLeCzxUO6CRnUtxLOIYUNGnetGLEfEVZ7q3K7auEF8TStUlHJ
	bDIQ==
X-Gm-Message-State: ALoCoQlo5dgMLBL9kRt0ONjQaN/CfP11jPYjtuRHa1okKeoT9tFcnlT8yhRSOy12s7daYBoYc019
X-Received: by 10.202.187.66 with SMTP id l63mr4974030oif.13.1415301818200;
	Thu, 06 Nov 2014 11:23:38 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id 2sm3016019obq.29.2014.11.06.11.23.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 11:23:37 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Nov 2014 13:23:01 -0600
Message-Id: <1415301783-5342-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
Subject: [PATCH 1/3] libhugetlbfs: Add i*86 to list of compatible host architectures
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
X-List-Received-Date: Thu, 06 Nov 2014 19:23:44 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index c2262ea..737acb9 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
1.7.9.5


