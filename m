Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6967F4AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q139so6700558pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uIyKb4BkgBXHd7ZDyqibYPNtaCz/tmB52GjeIsEPHGI=;
	b=mwJpuOee4uo/YjSe7B6oA5ouo+LNE5ABWAsl4OHNYcg6DA342D/mJWLiNnzP/rjTNL
	Wnx42DpdLRY0oKIBTtRmMWcTCMK4bRA65Ro+ma259Es2GwEyLS303x5J4u8dE674Q1wf
	rwokT2VUDl2b9pEIN6dxnGtuL+ezFV6In4m8hxx0QdGLB3nH/ATy0hUQBpd+Nz2pMuv/
	JN2MtciHOocM75pWruoQnePj6dOovIrLtCdK20m7zkHm5pbZfnBrAMFhvGNOKYkYPFEZ
	7Di62qzlp7Gw2MXhPwyF2v5h96aSDqDIsfCPFDUM81PgQTtTXsvkUT61OcohONTzwhQG
	DV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uIyKb4BkgBXHd7ZDyqibYPNtaCz/tmB52GjeIsEPHGI=;
	b=QwKomfEKi5DU+Y9etA0en1Ge8IWZBMpI8FjyHIRPKB4BjCrWWuWUbweWUer2RVbxnS
	oiPkyG5IBW3DX7bltWR51/u6yenhshLoPj9zxHHlDmHjWdRfg8F61mD9OmmwIsHgs+8n
	OHV3btOsLXNdEQ5zdRC2VAgI0e32RfCqEuzGnsrUBKiXK2xvZcmE+UOtz16MhS1OKkkA
	nS/7V5QlGc5guppFRavuBKq+/ijWEFEIvwlCBbmE1EYGva8b4KmwtLz7wL6J5Gp+s3u/
	oVFxOFJoIT+9uJ7v79I/dcCdCsu8wbhtNaGIKNxslKuKCYcrga6iTEjM7Yaxh8P1Jrhs
	OPBg==
X-Gm-Message-State: APjAAAU0mpKdFIWdVy0XGfic9UW+QdxlpaKUz1ahC8lHqLKUzO5pUjlA
	IFye5lhFJbeQeBsnFM+nur2RxKxE
X-Google-Smtp-Source: APXvYqy0m+qDy1C/yskOHd0NiR7lCiaqL4oO0wLE+WSlpUpj5RNr6rSoUsF5Hip7JCMDdjWkrwrjQw==
X-Received: by 2002:a62:34c4:: with SMTP id
	b187mr26823593pfa.161.1567287110099; 
	Sat, 31 Aug 2019 14:31:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:23 -0700
Message-Id: <f0d7e8334aa71860da858f9d204488fef717c7f4.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 02/23] fuse: upgrade 2.9.8 -> 2.9.9
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:49 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Note: This is a maintenance release from the 2.9 branch of libfuse.]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb} (94%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
similarity index 94%
rename from meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index caa75c7..c83e7f6 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse.conf \
 "
-SRC_URI[md5sum] = "f365e848a82504edb0b7a33df790ca78"
-SRC_URI[sha256sum] = "5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3"
+SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
+SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
 
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
-- 
2.7.4


