Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id AECD9793F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:14:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p12-v6so9565701pfh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4tCg1YA+l9KFGn2pEpTwz6AlrK5jgM9r6adGC6UELKk=;
	b=EMyH6nyFG1jaU1Ne7j+u424RM82b+r9D/3hFt0TLlf///hBpfrM0AGTSRRX+2SQujS
	vuDhJykNvLqvR37ZFhLNv6EHj/R6uNvcKrFln7+E5LWTcD2fbwmFtWkuCpkAyGEuvX7x
	xdCrsDuPHPm1uUXqjTwGda1CUciwA9A77ODWEj002beIcbFN7OdfvuAvo+qV0FQXR8gA
	V+DML0CHJpfLIympqrTIUx3qf/pQ859kStqiA2n0RiIh4Qo2K3T3k4SWwfvObMJvSWrl
	dByVu6da/rzuePJdECex9y4KIkcX14O47XcKVlLv9DkmSjslzVuQCeHavRxnQDUigdIU
	XIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4tCg1YA+l9KFGn2pEpTwz6AlrK5jgM9r6adGC6UELKk=;
	b=ij1On7ifMA+9/fSWp8c0ZXczTljUJ4wjd5eiWRkVk32nB9slSol8e10HCRM+/e7vGQ
	DTjSKG/RMkJZJrjmfBAPUZ7Tx+gaPgjxIhqX//Zq3KauResGVGgCF0Eoy8442oIpNaVq
	o7aNS1GPXWaZV8gwXRFHL7KS4UqUn4Dd7cGbhanehYGyTUq9T9IuzYvDR05/lqjHRiZx
	WyF92azj982VGuO/fmQGCjYbuBipen7Imyin1+J596UUcjiFtCUAKFj1tmv9vCWnbhq3
	M7AC3RgGoGF6KFzmuDF1PE53d+5TSFofFJlYtlj5YHKM7qVzuMVauwcxEQ5fw00P3OSC
	/iIA==
X-Gm-Message-State: ABuFfohzTufJkaZmSHSHSu/bpRNMNV5cJRRfbJO3RE80b/JLE0FwRiUl
	KSwzq+1d5kq4rMOQ7+zVygtmAkAI
X-Google-Smtp-Source: ACcGV6358yezT8YYNnIxo+IrI9Bm48fVXmSkZvRhu4Ngt9IrHQBnFlIpaRekByosg/Vt5emhGzrRKA==
X-Received: by 2002:a63:d309:: with SMTP id b9-v6mr331126pgg.163.1537820096315;
	Mon, 24 Sep 2018 13:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	s195-v6sm176398pgs.76.2018.09.24.13.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 13:14:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 13:14:46 -0700
Message-Id: <20180924201447.2360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] tsocks: Add -lssp_nonshared to LIBS explicitly on musl
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
X-List-Received-Date: Mon, 24 Sep 2018 20:14:55 -0000
Content-Transfer-Encoding: 8bit

tsocks uses -nostdlib while linking shared library, which is not ideal
but instead of chasing that and assuming there is a reason for that, we
add -lssp_noshared to linker command at the end so it can build when
security flags are enabled

Fixes
tsocks.c:954: undefined reference to `__stack_chk_fail_local'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index b2757f6ddc..72913579af 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -18,11 +18,13 @@ SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
 
 inherit autotools-brokensep
 
+LIBS_append_libc-musl = " -lssp_nonshared"
+
 S = "${WORKDIR}/tsocks-1.8"
 
 FILES_${PN} = "${libdir}/* ${bindir}/tsocks"
 FILES_${PN}-dev = ""
 INSANE_SKIP_${PN} = "dev-so"
 
-EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}'"
+EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}' LIBS='${LIBS}'"
 
-- 
2.19.0


