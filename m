Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 447DF751AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 17:44:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z16-v6so6818875wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VRun80iGmCD4h38tAPZDJhkVlWxMnyUxwiW+rpeTK9A=;
	b=Y/90bFEVB1uWQc8Ee3ZpUNi1xOAoV0MJJ1kTbDoEd79caJL6SNnzop6cp6h/cPv+2H
	6gT4tM4LBSguQcNZsyb+6rCaoWjBl4qdxPtXuxzxK+SmnketcIwH7gvXsg/p1TRSH4XV
	kw0cJezJGXeiazCI0vKpl4nM69Nrcm5Fw+fo4wRaScyF96nTWxVFT+uRK7eoR2mALdlZ
	OsC3t7qwGrUtjKKmmtd8xKeLF8lba0OoPKWyUc5tjL8Ln6nCTvTM0jeOpM+BaQ/LZsEa
	D6pS7dNnxdVXiMghU9p19H7saQT+klP1+W8mN6lVQS2H7/imygGbz0oR0tN5qdbUFrqb
	TTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VRun80iGmCD4h38tAPZDJhkVlWxMnyUxwiW+rpeTK9A=;
	b=ITozjVHJnBW4R5wi84OcM0pdwbZqVTQdtPWoniX6leqLgy1VmhvDjZUwt3envxGn12
	cm7RWJ1pRRCVTKTunHag5CtVq8t6nPiwH60yov1zNnoNrXiuL2HjowkQDIQi/WwIARa3
	PeVTOmqVrodyh+ZOEkORwAmIBT38oSAIfnHK3pwdr7V1EZQHhW2IO66C34iX4lMpivPZ
	4c8pAfSWbhs4iLo9YjJ1Ay8MM+v0WmoNGDytqAXeBWVsInkE1/pk3zX0VLVKZ4b7AfFG
	XMVWaEDB6cHycGKaBFYQGiFqNk5E2EvjjmaXW+8bazt5dkPU3Q3reYd2Tfm3ryPRSdvI
	RURg==
X-Gm-Message-State: ABuFfojWYJIyQZvbjeQEb2BYtZYL0uq+lCRz1KxU7zscXlP0UVrJ9BjK
	KXdWy9fukLEPMr+MxSf5jwpRPU10
X-Google-Smtp-Source: ACcGV60K9ZipOSDgSVcHmV4/kpOQUk9/Rz1wz/IapFK/K9s+K+MBuVeDN8ojlnrlHUXfaT0hAI/zgg==
X-Received: by 2002:a1c:1eca:: with SMTP id
	e193-v6mr7893057wme.99.1538070263572; 
	Thu, 27 Sep 2018 10:44:23 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q16-v6sm2447478wrn.41.2018.09.27.10.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 10:44:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 17:44:23 +0000
Message-Id: <20180927174423.12350-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQc_+P8FZYGiZ-DNMWCBmk3XpKSUU6WhGpOs0USzPspD7g@mail.gmail.com>
References: <CA+chaQc_+P8FZYGiZ-DNMWCBmk3XpKSUU6WhGpOs0USzPspD7g@mail.gmail.com>
Subject: [meta-networking][PATCH] tsocks: use -lssp_nonshared also for glibc
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
X-List-Received-Date: Thu, 27 Sep 2018 17:44:23 -0000

* the issue is reproducible also in glibc builds
* fixes:
  | tsocks.c:954: error: undefined reference to '__stack_chk_fail_local'
  | tsocks.c:842: error: undefined reference to '__stack_chk_fail_local'
  | tsocks.c:339: error: undefined reference to '__stack_chk_fail_local'
  | tsocks.c:522: error: undefined reference to '__stack_chk_fail_local'
  | collect2: error: ld returned 1 exit status
  | Makefile:53: recipe for target 'libtsocks.so.1.8' failed
  | make: *** [libtsocks.so.1.8] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index 72913579af..790a6cc795 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
 
 inherit autotools-brokensep
 
-LIBS_append_libc-musl = " -lssp_nonshared"
+LIBS = "-lssp_nonshared"
 
 S = "${WORKDIR}/tsocks-1.8"
 
-- 
2.17.1


