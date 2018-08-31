Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 945A8795DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 15:25:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so5749357wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sLvqV2HUYd1+pKuqcoBfz5zAeGpPGXoF9HnDzNE8vUk=;
	b=jR5DwqvyKf7Dz7WVa7H8Z+SoCyVnqBY5LCEHjqvktWePrJGCWShBrDHUZukQC57LSr
	HXhomnuL5x/lB+eknOOkZK9w82Jwrnupoo7hgzfbbkbeH7U66Q/uv/9p/cshpA3pL7TM
	ozYscFPyufphq+PhfrckCKKAx1GXkvgladR7DtCpBN3K1qhX0I4QIECPqhuIT+LOxp28
	2Sq8Eme1hIhWb+doBjZnGfjCK4lou7gmkhbhUcrbB/2JgaCrmOb81K+dAeI46sf496BH
	Z+7Ixu+er7KaSWr4iifyujDU9ALzLfXgYb6vv1ygsq7LDtMh4xGFKBDC8/5F/YjcA2sN
	nWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sLvqV2HUYd1+pKuqcoBfz5zAeGpPGXoF9HnDzNE8vUk=;
	b=crn3cXCiunvGiLzvdSISfQ9EIR/rszoSXfmgx64hFvpp5IoU147MaBc4y1iCmmCGbQ
	dV4cCK39i5/VagX1gqpR4AxeXY/Tdm7K2h8SqYGeqU7xamaGqpuJZYjEqajWS2mStrhK
	lgoYDpPEeO5Z1XyD4XVSXzwkHIY/OlSvxXqhsHdmhk9CR1o2RxeJcvvgZIOr8evA6M7Q
	GR/neWE3PegEOb/Lbxn1QnZuFabOnUyeZYRkmXEy1GrGStD3JK4Q1morm9ZILE2NU9R1
	plyZxOI8u1EgeG99MMcMwieH5xJF4Eque9RSsyP+aieEbmfpqA3943qCANZ4ySrWBA4/
	8VvA==
X-Gm-Message-State: APzg51A67/EAAFaToV6JgSlqbk0RfRUXK0E6P0v/ppC6uX6NmxJs9arh
	/r/JP4a08FFWfUQZukhQecrX1nX2
X-Google-Smtp-Source: ANB0VdY03zp+43SBMgxGdxUNxe12ZGPBZRt1RgP0aNWBLp7ccudW/WSsV2Ml5nLBf9gANdYbIZlp6Q==
X-Received: by 2002:a1c:e70b:: with SMTP id
	e11-v6mr4863216wmh.22.1535729125103; 
	Fri, 31 Aug 2018 08:25:25 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	d22-v6sm9958808wra.80.2018.08.31.08.25.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 08:25:24 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 17:25:18 +0200
Message-Id: <1535729118-6542-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: package vmcore-dmesg-klibc
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
X-List-Received-Date: Fri, 31 Aug 2018 15:25:25 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index d5f6738..7558b57 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -84,9 +84,10 @@ do_compile_prepend() {
     done
 }
 
-PACKAGES =+ "kexec-klibc"
+PACKAGES =+ "kexec-klibc vmcore-dmesg-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
+FILES_vmcore-dmesg-klibc = "${sbindir}/vmcore-dmesg"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.7.4


