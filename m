Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7800D7455F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:05:56 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g20-v6so5106522plo.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SqKigxt92AY4646bnlsqMVpbJgDoGvewMvevhgCf5R8=;
	b=VHKDg6jgGIvtUELX7+2nC2bQ0fF9jExGAk4a61X+wpz6vHjv5/BYovR0hajcbLxtBn
	20rsBrGCdqnUklsiJE2TWBsgs+B627t9lqWuUvQOIfAZN8tdM8A107KnjitUf4frk56s
	8Bbtx1w+gF/4DKWw9nBeMyB6EbLPStFpvNLflFHPqcc3mJbpfIDpfR5wkxK59svymW4d
	KrXVCy7ZaOpOcOFstt9YAmFUlHuK5UJMoO3IZ+IP7d4hSsrUDpO7cJsOQW9L6BXdm6b1
	NpCYtUWF65PJ0/oQ00RJ/bv+EhwaoAQoU8dRdHqym3xPTVBKj3mxGw6FFKT48/puT+Qt
	GJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SqKigxt92AY4646bnlsqMVpbJgDoGvewMvevhgCf5R8=;
	b=hlf6BVfjfp2XbWzLS0tytVSD6+lhc17WiCL4s7U2cT2vLFGzbQ1h8LK2QYu7gUkVsl
	nRuS38viN2SoE828S3tvfpSkOhGyKYbPXd40224DjBib/35qAwLJtm5A/czQzqIjGtA+
	zr117+fR0FCc5OiozRhSvULJjlvCrJmSloMO3CrCZBe6KsN9E0rbKGY5z88CEGhfQ1VH
	8ahvDX9vDLXhauduN5VRaFlmeic19frjAWKVV9dWTo2L59mcBXznBGrLtDwsW5N0hWsh
	b4hHETT32XiB3ZsN7uITg/lZ9E7dkSAgG+e7j7vopMzlVHZayrzUMt5VLQz9IezZB0Z2
	CmgA==
X-Gm-Message-State: AElRT7Gqf6s1ne8tEjBARH7nDkUHMokQzb/7asVKa+DYHG2ARQezLuNx
	rjd1QKXaatPpFkhJl8SxiT+5Fg==
X-Google-Smtp-Source: AIpwx4+cmbvzl+nTuetuUfOexfpWhop7nAnX7VDkWHKoqZNnnVyR0/9RwQjMSOszv6buwBzs2WjYyw==
X-Received: by 2002:a17:902:206:: with SMTP id
	6-v6mr10778101plc.376.1522692357228; 
	Mon, 02 Apr 2018 11:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:05:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:43 -0700
Message-Id: <20180402180546.38078-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180402180546.38078-1-raj.khem@gmail.com>
References: <20180402180546.38078-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] zeromq: Upgrade to 4.2.5
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
X-List-Received-Date: Mon, 02 Apr 2018 18:05:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/zeromq/{zeromq_4.2.3.bb => zeromq_4.2.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.2.3.bb => zeromq_4.2.5.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
index 6cad3353d..356348b43 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
@@ -9,8 +9,8 @@ PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c4e18bd0584ccd34213f152c11f54d6c"
-SRC_URI[sha256sum] = "8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0"
+SRC_URI[md5sum] = "a1c95b34384257e986842f4d006957b8"
+SRC_URI[sha256sum] = "cc9090ba35713d59bb2f7d7965f877036c49c5558ea0c290b0dcc6f2a17e489f"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.16.3


