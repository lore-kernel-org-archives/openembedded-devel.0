Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id CA5CA7889F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:59 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id i6so8117461plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CU2RpNW6IgtR2ugw3wbajq6n4t/NFIAkRXNhZAbygTM=;
	b=ROQ7QmTDFAXAjrd5SJFaIr+Lv8LEmde9FyR5qwDlNZCTktFsQdCUcQ8TLz7jYZt/ER
	3INCij3ZIfxUsCvF+TAi/Yy3CbTFp38SREOgPRs0+gjcEIf679mp5RdgSYCufzv3RIgf
	MWKYVqM3pruBfHYzuFCogXyE32MT7iW6sSAPjVdUSx53nO4S8lr3du0v1lShdKNFz1vy
	H71OC334tYRTFXV6YkXkkwJKwXdKXgR7x2dbgGxIlyx4GmGGboIMTYCvYsJxtTLlwdcW
	HMPDcRqzisan21Zh3oxwZoUHICWiyieeVNX2lGCUmF0WL25wb9TDwxFyu73YAovu1oCZ
	RbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CU2RpNW6IgtR2ugw3wbajq6n4t/NFIAkRXNhZAbygTM=;
	b=lCcpR9SY5vITbSA+SPgqwntf4/pFs3e2TvWq9v+gZFBlXl9zruXzgwnVrCvBVoR6VY
	qkTnbEtejye2iDJ+QzMqe7cd/csCSy/jPx/4PKdAO5ir9PrNownpKp78T2mGOf3vDh43
	abLsjTgGylKZmBVZKUr8qHhPBx6HVBw1+mCaXODjN01iL36SYBjCJpyB3869bcdB12b2
	UjSD7C3wfEmpvYH2PAHrFMOpPuB3kYQDjw3LYJCmsQGQM2kivdMoYc62ydaJaM4bLNUC
	jhmteF7xupesjNKf0qLu4iMywQOH8E+QEEkFp6cqLrbkyk598iRTgDd/nkPFnZXN14SX
	lPWQ==
X-Gm-Message-State: APf1xPCT9XWjpe0NNXqH/udscOailO/DSt5eF4WLbO0uAvngBMfZL4RS
	V96TPawlpOCUv6Lhk68bU+xVFw==
X-Google-Smtp-Source: AH8x227C/vxRdr2PwA5KiiY2r2W/sKkfh92JQtxLUEvCkZE9whK+2fLJUZ4pqmcutCUGB42/6ckj/Q==
X-Received: by 2002:a17:902:594c:: with SMTP id
	e12-v6mr8614593plj.323.1519594440789; 
	Sun, 25 Feb 2018 13:34:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:34:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:22 -0800
Message-Id: <1519594406-24490-32-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 32/36] rocksdb: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:34:00 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-extended => recipes-bsp}/rocksdb/rocksdb_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/rocksdb/rocksdb_git.bb (100%)

diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb
similarity index 100%
rename from meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
rename to meta-oe/recipes-bsp/rocksdb/rocksdb_git.bb
-- 
2.7.4


