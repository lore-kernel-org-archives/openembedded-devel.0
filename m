Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B2A6B60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j11so3467623pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RJmY45/gaVUA/EwYd1etKNUKiONOuga6GvgJbXioi7g=;
	b=M+NOYi5iUZIHQ8qyKcVVoW57gxqQkgFaJbHRweSf90fUJw0WH6gKM5+wzUIHkQQ5Ea
	+bQN/HaLXhBAPU27YoCd0bC4NpN+l61lEUg2n9BxMfihLn+eMtHDPoA1SdRqR4Jb24/P
	bnK3uH7k9McPkMFXkbQdapYB1GFkVVP/tRK8j77b3Ssx5CLM329KeXcAlmizLhTRCdOC
	KK8FmfIvxZm7W0o5T2qGddTDv6GLdsfVh6GhC33TaT6+2j3Tlnl/z4Vi6GSi4lPEOi4t
	6RvAEZHGN3zuj3N1BJVqvcGzlqeYJs8s8Yfifxe/IE2k/iG3LOFNuDlgcJ8vZ2hew4lN
	srSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RJmY45/gaVUA/EwYd1etKNUKiONOuga6GvgJbXioi7g=;
	b=dtIo8gKpIwZjxAe5Lyxl5/ClhKLGXLr/7q1Lz0N8YsLIHs1LTT/SbOZcjEcVfvfk6J
	Jr7/W1A/7vT/c//6tICZqWx33tMxwlFfNn/3QDycy8zztZbHd4wudfekiWfraijCukx4
	Nj/wWgydWUKnoz3lIxRqCCF4eJTvetrugybN8miUJfwmGbIkKbZYSBrGIoEUXnHtu3SW
	u8W+zE5PWvpNo5JKzJgic9d2Sf29XjJGPjyG8vc9Ck3ycp4SQPNCl1fodLjy+ja8pJOH
	UGj802pCZRZcYiqQfBjUw/GiWoyii71Ke/RJyCvi7BUie7itJVRoNd/WHgMjSQwSKJ0f
	wspQ==
X-Gm-Message-State: ALQs6tDlKGY7W4tULH+lKgNC/bAh2/C/1s/6bW69TFwZDTTZkVD9i2S1
	b0uz2bTLJmDBU3+wntw9WQCIjQ==
X-Google-Smtp-Source: AIpwx48w7wrKRjJo0Sog39GkMNFLA1wBRh/Wbx78qUlgtvB9AGuUhG24vsmJIhVCfagZ+ppcBFHSsQ==
X-Received: by 10.98.236.220 with SMTP id e89mr3637527pfm.33.1523858505436;
	Sun, 15 Apr 2018 23:01:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:32 -0700
Message-Id: <20180416060134.26291-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416060134.26291-1-raj.khem@gmail.com>
References: <20180416060134.26291-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] ctdb: Call gnu-configize for getting new config.* files
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:44 -0000

Architecture support for riscv64 needs new config.guess

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index b5a60645c..2ca781bf5 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -35,6 +35,7 @@ LDFLAGS_append_libc-musl = " -ltirpc"
 RDEPENDS_${PN} += "procps"
 
 do_configure() {
+    gnu-configize --force ${S}
     oe_runconf
 }
 
-- 
2.17.0


