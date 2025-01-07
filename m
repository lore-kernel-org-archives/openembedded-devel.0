Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6060FE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 21:30:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3959.1736285406464638112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 13:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CpatFaLP;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso18980363a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736285405; x=1736890205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AHe4/G6nwHMSZdMnz+k/FGEpANPvOP8eUPkFlr0N3o=;
        b=CpatFaLPXE9onhiXYo4mICapS79jLG9PuxsbO/chbgSo+klFYpUKnxYRH8L2dBzH2r
         Z7bjRkW8vcMyHbrgx+xQhlnaK5W7Tpi7YTltsD4tqFSytfiUgBt5rVTaIZVpLwlkzoQa
         Ge7Oob1higaS3/vF28CO8hd631XTe8NVSeHwygi08mursyBfE0radWSCcShH9NPhHMvq
         hTNedbHvoxVjFDsYPHjFOyQDNl/Z8nQV0jeMFaoD1Z38rd+xMa54iSYivCG59py+xE9r
         Xd6q0kqJlLpykaZ3inet2tyv9FMj5ErIl781NgS6BIzuk3kJUpJ/M0QFiYEq0XQYnwLR
         p8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285405; x=1736890205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AHe4/G6nwHMSZdMnz+k/FGEpANPvOP8eUPkFlr0N3o=;
        b=R3A9SwFdgyhqaZTSDdWV6aKrqjrWsgVC9DkacbD9IGYzKQ+QwdD5/gJWfkJHa5RuP7
         2QQjHk9cYwzyK1KqVq+/LqHPC4dx7SNoSBePqcWFd/4MyyCuzboz1ylWqW4k9J0hkc4W
         E8p2MK711nlXQdvLHnMu2W2CN3aw9R01GCWl1jbYGrVWunSQawKvwI5INyNDp52wNwx0
         frekJ5oKLOfzR4A5exi6aD575f0nyRD490NQCoprnnR7x3lnd+kccqgnVpLVsvyJ7vbH
         88kBh9/UPMBZm6mUyHNvx84NlrrAcOksuDIIkLTGKpfmo70DrlwS2jIFQ53AQoIDzv1z
         +f/g==
X-Gm-Message-State: AOJu0YyCgvTpyylqMyv/EOrat8DBJqNB9X1+THY8T0boiDwPKZ3d3qB7
	bKjLkSC+X/acnhdNXdMdPrykWlwV+xihcQd837Hi4yZWmfv/UgzYNk80xg==
X-Gm-Gg: ASbGncv3WV7yGQCNNbaYOZbLBWHpPoutgI5lYtwL4pn9bj35cAI5Y1c5uYVOz5HFjLK
	rx2QXPCQANpSMUZtDK5QF+5/DSYKYBrbowjo3lJ0r47hNZ5LZDMQHN4v8yEpLeFMl79awK1t83g
	mm8azRp2dygRnjjN2mO9z1TAPTgR8NiDC9rJrBJSNcbWARu3qHUuazX6+YpJ3blIY07VbKCShq+
	m8Cqv4UnGgK5JjapwYXUBvY0cami7tem5IYln99qvDkiD06
X-Google-Smtp-Source: AGHT+IHr6nqLrwO/gLnMICwMk5HvErvvYrgRvSLCbaL2bf+pVkh7OmONJgBNtN7DzTd0ES4p5/w6bw==
X-Received: by 2002:a05:6a00:4485:b0:71e:16b3:e5dc with SMTP id d2e1a72fcca58-72d21fd8b84mr654349b3a.19.1736285405220;
        Tue, 07 Jan 2025 13:30:05 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8157e3sm25877847b3a.26.2025.01.07.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 13:30:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] x265: Re-add -DENABLE_PIC=ON
Date: Tue,  7 Jan 2025 13:30:00 -0800
Message-ID: <20250107213002.1443331-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114728

Its needed on architectures like aarch64 and riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
index 176774e359..268ccec167 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/x265_${PV}/source"
 
 inherit lib_package cmake pkgconfig
 
-EXTRA_OECMAKE += "-DENABLE_SHARED=ON -DENABLE_CLI=ON"
+EXTRA_OECMAKE += "-DENABLE_PIC=ON -DENABLE_SHARED=ON -DENABLE_CLI=ON"
 
 do_generate_toolchain_file:append() {
    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake

