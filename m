Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 075127751C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 23:13:13 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f84so10567656pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 16:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=b5ZCvBKWOEq/CM4fvMmk0GAv5bsjmeDjFgl7ifEu2Ic=;
	b=fNT88+N8nHRtgp+bxaFPCGG59657Fzya9ITgT2AA1m/JbOHf0VweLzpzx+0GiBtJhQ
	M658B/GqXwSa0ezFlYzaFbzdeYIjwNn4Gv1jAp04S1wrYDA2yaGjqvrS7Ns0R+pRojui
	g9TcRNokr21NaGzmjYT94c0Y+KVJ99jR+8j8kHaOC7aiDv31wPvZzq5APFYEcCVzkrvt
	je3O+cWqtuQ0QNHZ55tHxftNUcmzJHGki+f7+v6UTsUmNnZwUYtn2vvfuO/UT5RcBvV/
	d6HTqQyttyPAGxMH2NcPCgfiwbaM0M2r+bS/+SLG7Xnuv1dYY8srFxBwwDpkVZnlD1oJ
	0oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b5ZCvBKWOEq/CM4fvMmk0GAv5bsjmeDjFgl7ifEu2Ic=;
	b=dMvanGWHRqIGjRGh+lnxOS7Rtjo04oKLkUfIFOopymy2CPEWyb/9yaMRbaqO6acBjv
	BJdfe708VtQ34ZkRaJ43MziBYeTYWE5HLbcb0kSV5ex/9s8raLnqHma0POII/w1AUb24
	+G9QnWV9UNP7RsUligmK1q8UVLJO9/oTbr+y1VAI0LZhf1vowm34YeGuVhLrRKVSMaDd
	7TclqEMIDL3RyEVa6jFG0qL1Zs8bBSlmv9YABduCizrbY3C438ZipDc0X1OrcS7mcRn/
	wIz47nRV9UML54c6ko3khBv8ieuwj5bxkt6Cb/qnInHmTRKaarb1QMp3COFXL7OR1nzC
	PE2w==
X-Gm-Message-State: AMCzsaXMKdUOiH7f6c0jJqnr0yuUQIavtEVb/6Dt9td4AzWaOKS4lr1H
	jSkUssCrvPM3lTIvUH/PNm9Yjg==
X-Google-Smtp-Source: AOwi7QBPzlmfmpIQYmmnlZEHITpYk625oRR1hQMa4HR0tYeUwsx+qdFX/lA8xFZCsUTp4tn0c0ytOg==
X-Received: by 10.98.6.3 with SMTP id 3mr4143777pfg.282.1507072394952;
	Tue, 03 Oct 2017 16:13:14 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e76sm23195155pfd.149.2017.10.03.16.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 16:13:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 16:13:08 -0700
Message-Id: <1507072388-8080-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] breakpad: fix typo ( minidump_cpu_arm.h -> minidump_cpu_arm64.h )
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
X-List-Received-Date: Tue, 03 Oct 2017 23:13:14 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index a17759e..5f6d82c 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -80,7 +80,7 @@ do_install_append() {
         install -m 0644 ${S}/src/google_breakpad/common/minidump_format.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_format.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_amd64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_amd64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm.h
-        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm64.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_mips.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_mips.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc.h
-- 
1.9.1


