Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA46D7DDC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 09:27:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 198so6706346wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nU11JkvYUkMxN2k1CK0/kHXDaMUAepljJRfNdC5B3ig=;
	b=HuwfjE9aemay6/QFzDqrV+pU/5+v2wb3OwLon7KTx6vuE7EZEoH+uJeP357PGz+/BR
	5VkbnxD9pbNEyZmYHvDCF+1qZ2pHW1OydLHFJYXl22HmXBxH6cVlnZ2sHfpdrMV6B/Vj
	vufDHyWHeU9pCVi+UFvmocH/rhLVFXtdffJsmwqDVOR1A8rzyIDnO0VpacqY/4sNoPdO
	gYvDlYc5H4LxpJl3WqjJ/88kajm4J8vSZdLGWynrQtYuuQUPRRSkRWuG5jbnQUbFy2hC
	aCAZXjOnxl0tp5CBnmSw6oYpAkklgJinN9ENLRntljX8As0gDZBK6MLEcUhwdnV8Lbzn
	JCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nU11JkvYUkMxN2k1CK0/kHXDaMUAepljJRfNdC5B3ig=;
	b=tSvaSxnOBdamUHtMYfaXEpGd3Pgkv4pBHaZQfJlcCU/MQVmmDJOGnardMrDKYVQ4ZJ
	aOiar54EB15n2wFBLOF+mXk6S1MnCVJYZZklOKe6TurW726Paj6qOaZfXmhWuRrXjOG/
	zHwA788rlbxYW1+7SpjryoEhtIlZn4ECn0wcyKk+PWhHSgKGVXtlUIxJmEnrZ52wZhmF
	ocCFZ4M+NYn5JlvWJdziKrK+o/QicpbWW1L2e7JwLVWkMxHMyFpzTf024NcVo+bt8oHF
	YKnqPu+a6JtCIU3bdDQFbq113dYIwA80gbAeNfbWtW5s+LeNa0tGHQGxAqnQDTAXhEeD
	kbPA==
X-Gm-Message-State: APjAAAWijuhaa9xx3R/RDhzvQAhhJ0UL2Dl8eQZ4b9qfqSOlN8o/EOxe
	itTLyMqMJCtxglu5uDm04plOvoiQvmvehQ==
X-Google-Smtp-Source: APXvYqyOVUzoBY3hI329R+RE6nhmJMpvlC8rN3GGRWFEHSSpv/mdmTKuh9W4Z9uO/fR9EHA3IR76Pw==
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr5653415wmh.7.1557480459085; 
	Fri, 10 May 2019 02:27:39 -0700 (PDT)
Received: from localhost.localdomain
	(aputeaux-684-1-15-234.w90-86.abo.wanadoo.fr. [90.86.218.234])
	by smtp.gmail.com with ESMTPSA id u14sm3477199wrr.1.2019.05.10.02.27.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 02:27:38 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 11:27:26 +0200
Message-Id: <20190510092726.23574-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] bpftool: remove LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 10 May 2019 09:27:39 -0000
Content-Transfer-Encoding: 8bit

bpftool is a 'special' recipe since it does "inherit kernelsrc", like
perf in oe-core or cpupower in meta-oe.

they don't have their own sources, but reuse the kernel source tree,
from virtual/kernel recipe. As such, checking the license file does
not seem relevant, since the fetching (and license check) is deferred
to the virtual/kernel recipe.

Remove LIC_FILES_CHKSUM like it is done in perf and cpupower.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index f75ac6f81..39c478a95 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -2,7 +2,6 @@ SUMMARY = "Inspect and manipulate eBPF programs and maps"
 DESCRIPTION = "bpftool is a kernel tool for inspection and simple manipulation \
 of eBPF programs and maps."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "binutils elfutils"
 PROVIDES = "virtual/bpftool"
 
-- 
2.20.1


