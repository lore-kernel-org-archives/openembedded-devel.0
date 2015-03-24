Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id DBB5F73C06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 20:26:20 +0000 (UTC)
Received: by obcjt1 with SMTP id jt1so3577195obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 13:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LAFkgX1AlhR8G6MokPXj9D1FBu6If7O5O5F7I+2NZu4=;
	b=erIQ76+OTdrX4iALyd11qybp1pW/yp3CVomGb8amCdw9vIFG8zOwg+arReEKZz3deX
	zPSgpwmhWQyC5LfDuPWJzelXA3b/5wopg615TNI8cyZvpX8IR/h1Y+BJOWntdPgtcM7t
	x1L9t1262FOvRNI/bgguPcAkwFgCHETD0wLUVeE/4z02dLLX4zRvOEyyw2erLkf/0Q1F
	A6X0G3bwKlg7vciatagF36KTg7ccL+kpTvC/yxe2EYR/RQPEZYUu4XgPE7lTG3ppy5/e
	i4pDnlNTTJmkpThBAx6T8o5SbqCdinBLKYqz+YsyigYFp+0b6TsGYXJ/Y/o/sa8HHZZL
	0nqg==
X-Gm-Message-State: ALoCoQkm1hZe8McStK2VlsMAq6t1qbEOAm/O1NLr4nxWAT2ozTeIH7lSQ//AQLVZu0dBFmcPbkLc
X-Received: by 10.202.184.70 with SMTP id i67mr4485817oif.68.1427228781030;
	Tue, 24 Mar 2015 13:26:21 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id z142sm227821oig.22.2015.03.24.13.26.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 13:26:19 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Mar 2015 15:24:36 -0500
Message-Id: <1427228676-28169-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427228676-28169-1-git-send-email-gary.robertson@linaro.org>
References: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
	<1427228676-28169-1-git-send-email-gary.robertson@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH V2] libhugetlbfs: Add i586 to list of compatible hosts
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
X-List-Received-Date: Tue, 24 Mar 2015 20:26:23 -0000

COMPATIBLE_HOST included support for x86_64 but not for
32-bit x86 architectures - added i586 arch name to cover qemux86, etc.

Upstream Status - not applicable - recipe change only

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 4ce6a19..6fe5dce 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -24,7 +24,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
+COMPATIBLE_HOST = "(i586|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
-- 
1.9.1


