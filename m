Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B58BA74579
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Oct 2018 01:30:39 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z17-v6so2223276pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ip5qQH+DkOWD71CZIm/l+y8vM2cUl8Q2DuB37i5ZL8Y=;
	b=DmRYb/XeyPEu8MXfDoxmnzv4sMVK7wmGZgyuzsZ3mcxkWfcvdAdR//Gh18KLbENSOK
	neDuQl+y6KooYJ0v+d/iBkFoah5xBy+6uT0hoVJ11lbar//4eafisCS+ilre0uw5aVeo
	cCJz2DHaSDFaNwgE2zyDZppeTt/84AZfclbd5QTzJYSC5QbWwYFHVxm7eIzTRJyTfwZP
	yZTYNiN8LR2k9XVgsLLvbz1pdeUECXjdRoEbyorX/N388kmP3D+acbYApHwYlS36nl8Y
	pR1VGH+2pd5J3DhM0Vw7BTQTPubTO99MajdHvoUc8c77pvtmdHZVD2mUbNSbZird0CaI
	RBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ip5qQH+DkOWD71CZIm/l+y8vM2cUl8Q2DuB37i5ZL8Y=;
	b=Xal3ziZYEMZBB8cmLBiP1xE2oxOL/cIek6CW9wmDQ8jOEdjbdYz8+J8WrHOsv7iFFx
	bVKv4/ImQZ+nJ/Hk2KxnWtnAaxOilWUKAYtMV6hrVUZHsE5noorRmKdaPCp6nBBnIZ98
	MDQXdFtX2FbhOilyekS7q/vqqaqrCgxoe8whuByZwREZStJU1mmJHSN1p/YEHDcHbnYF
	oU7rQxVHUuYgWv6CSogZf5iQfAoMqX2KnntwfgnnbUxOPn2cTqEQ0mvPnOo8vFm5CuIi
	2/o59BAiV7ePkO5fvHqZ49iEfEIbTX3/rKsDTcS4W1jN8HCKRf7X2Is+KFKUV3kq/pYj
	1q4g==
X-Gm-Message-State: AGRZ1gJbMRnrMKuiSBAMozWVfnrP1LEfzg9tutESxb46kLmHeGDJ0iM7
	SdGA3YKqu7VMfDTNPKzQeZY1H/BEOVw=
X-Google-Smtp-Source: AJdET5dbnHWmPU5WdQyCSD4Uuos3ObXdVXPIKvNB1PHAterFhl2Dypw8MolgUy+W61IaaS25kSGBCQ==
X-Received: by 2002:aa7:8348:: with SMTP id z8-v6mr6124125pfm.81.1540690240066;
	Sat, 27 Oct 2018 18:30:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2f5b])
	by smtp.gmail.com with ESMTPSA id
	11-v6sm24464475pfs.108.2018.10.27.18.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Oct 2018 18:30:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Oct 2018 18:30:29 -0700
Message-Id: <20181028013029.29734-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH] libssh: Do not use thumb-1 ISA on armv5
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
X-List-Received-Date: Sun, 28 Oct 2018 01:30:39 -0000
Content-Transfer-Encoding: 8bit

Fixes
TOPDIR/build/tmpfs/work/armv5te-yoe-linux-gnueabi/libssh/0.8.4-r0/git/src/channels.c:2632:1:
sorry, unimplemented: -fstack-check=specific for Thumb-1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/libssh/libssh_0.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.4.bb b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
index 8566741a3a..6040ec959e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
@@ -16,6 +16,8 @@ inherit cmake
 PACKAGECONFIG ??=""
 PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
 
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
-- 
2.19.1


