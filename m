Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5039273CB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 16:04:48 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so134969173obb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 09:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eYflZYobOe0hPO6kv1wLyRPFvCqclUwP0wH1Nq7qtuw=;
	b=b7b2NQOkDBZ5lA7Vj55QpjzFNUhyY/zi48r+rNB3juefRvOZEr4ax0sACqbqo8MQCs
	Gg77jK2/5U5MS20mhr1vXE4NMI4BzjvModKvfS/tKsHQ6a0DlPqPReLQzzYmkoX5PPzs
	XwQAClhQjwBoSHLLcu6d7Va8vdmLbTPl72n2YKNxlrJzMQjRw0+gReRCCav8D5awE8b/
	crZgcnWLr7FnMymQ6ZYfY99cDIyKolHnhfxLOQJSNAhRJRA0smoev2ejXFvJBZNNYCR/
	XbhtTvxkTO4AaILpPjfNzC74yiO7FBunDhSvfLEaAAxjv1jaPLFzRfx2ErVGumRfIhYd
	ek7Q==
X-Gm-Message-State: ALoCoQm9xHIpx/9QkPj0BEu9Il572MsBHdDWIiR0ByEem0wDLEo9xV3KNjkKgFR7DOES0llF6+oX
X-Received: by 10.182.121.225 with SMTP id ln1mr47797401obb.65.1427990688749; 
	Thu, 02 Apr 2015 09:04:48 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id ds7sm4711356obc.3.2015.04.02.09.04.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Apr 2015 09:04:47 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu,  2 Apr 2015 11:04:03 -0500
Message-Id: <1427990643-16120-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427990643-16120-1-git-send-email-gary.robertson@linaro.org>
References: <CAP9ODKpdtB_kq173kcoURafhoNGTmQqU2i-RabmG9fJro6KOOg@mail.gmail.com>
	<1427990643-16120-1-git-send-email-gary.robertson@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH V4] libhugetlbfs: Add i586 to list of compatible host architectures
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
X-List-Received-Date: Thu, 02 Apr 2015 16:04:51 -0000

COMPATIBLE_HOST included support for x86_64 but not for
32-bit x86 architectures - added i586 arch name to cover qemux86, etc.

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


