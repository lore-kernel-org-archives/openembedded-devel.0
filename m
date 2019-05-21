Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id F1D217E12C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id f25so1290132pgv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b/XHHB7UPMW2XmzLBFCzU7seiR/apgv33OkinmzeQvw=;
	b=PMZCCxIXZsZRRySaTdFjw2xpUXieLvjB7jsrJnV7Hp4MSxkLdlgIeHl/Ii4kJcEZJV
	NHyzG61y/icsHitq58MWxItTNMEpouL2CYs2RJkJo6rwlf9z7hNBCDbhnQ7/5nUF0CHf
	GpnV4GLhAlzcsiGLPSjOLxJ8SszxPvv3mrkpAQbFRdYaYeeawaqXMPpz7W0iPmYh9ZDC
	n5d7iHAKFLCgBmeRF46jGLLDjERwOMKFqna5a0qPKo+QRHaYbpKO+apwoPwMr3EV156Y
	XEzwDdRFiGapYAjmNIteSmVWeOmN03sWPgJWiI0arczVPE5Pnww51Hu7k3u4/x1kpf2I
	akLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b/XHHB7UPMW2XmzLBFCzU7seiR/apgv33OkinmzeQvw=;
	b=NFdS61H6yxuDvIAzPYQGhhGEnd3DNbIQepq1AHP8QZ6hSL8nxHw0Kwej30wsPI4kLR
	NPHNJGWU4Jvq3DlCRBb4QXXXWC6fkZ3ZDmQdaBEBCxYrIRmzFyzLRP1YQDM8fxJznWOs
	U887NOGcFK8UKfk8dZgBjUdGzPAeJVtQK4yBJw1ueaCfeRWQ1vhIuEnlzAcw8qmnEehm
	Xn+gils5SdjsehoW6P0MzwxKfKCyiq4dgRR9ggfbtO7Dsxnkmfjg2BOU1po8rdaX00CW
	OGKik1LhJ636571tUGQb0M9MZo9eJ07FuSzUyvZUdCQ79sLiymTLPtjf5I659givOYcz
	Q5Ww==
X-Gm-Message-State: APjAAAVcb15ZnWqh8puTj9Ac/CBCj83s1bRWZRrNCMVbSkCQTAUTGNhE
	89Q0YJHgiYEB4sj9L49agbb2d9Bx
X-Google-Smtp-Source: APXvYqxTP+b6VhXf1nDIKMEHIzJHAj9LgdC3YN8SqeLa7UQ2L6Q/M6xUY76VUwNWXPxUVu4V953Hcg==
X-Received: by 2002:a62:5f42:: with SMTP id t63mr42105379pfb.83.1558411006712; 
	Mon, 20 May 2019 20:56:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:10 -0700
Message-Id: <997b25b618364d683161ab2bffd74e9a7351ff68.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 10/34] opusfile: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 21 May 2019 03:56:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
index 189dc87..3f6dbb8 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "libogg openssl libopus"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ac22b992dde6a891f8949c3e2da8576"
 
-SRC_URI = "https://downloads.xiph.org/releases/opus/${PN}-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
 SRC_URI[md5sum] = "ab3f7d15d766f5b36b0951ee435f9ebf"
 SRC_URI[sha256sum] = "48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f"
 
-- 
2.7.4


