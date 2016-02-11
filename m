Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A8F6C73180
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:01:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g62so13243557wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pYYtCZxgR2QPi9c8DnU9kVKBUwl/EF1JsSCnEakYdpU=;
	b=JVN+fHZIcamo4mLszEcjh/OIzDAGG86O1Yh5U3KLyfXOoySVXjjhp+rOxvuXfnYXjA
	lypYPXMknIrd6sTR+8+34M4NfaIW3yUzotDOTTjjDpj9/yYQXED+CJewRo0a6izqXSO2
	5Zna1cguoh2wb4fn0Vs1OLlp89Odx1zdTXvrBPEX7ReF/GjiZWcDPhqmkHGkYcROCUAa
	6h5QQZfoEGQsD4F8XfocOBKUjkoq5ZgwQTf7ksln0gAAyNJR5YKmwoehuPRapLX1ifCr
	c+MBiAnJAxMCk6fjVF+oCreGkeMmeROk1Sspi+MmpuhVfQPItmY9XdtVHq35xzQXU5fO
	RDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pYYtCZxgR2QPi9c8DnU9kVKBUwl/EF1JsSCnEakYdpU=;
	b=HR7TWhNmxpllyfF1JXiM9WqpxDR7prjmTAfTmEZJhES8P9sbOfoPkyG4rUbnSNi7ek
	zLJs/l6kr3+IDJkYkRPwx6pzKWdxgaH8MxIG/r9VnyLT4LeLcIicXpoMJe7/UH+a4k3A
	3FtPRw46hQE5e81A8dRqtSluegm9zXSbndXrRCcZmXqfZ+nS+83blgn9d4X4vCNEHNxR
	PNPmnnM5uDnuCz4aJ0uzZY2YcG+zQcYZ6VZS2nQ0tibLsAJTEY0rBvdvFXgv6EuEBK8C
	ECw7+D6gpqfknqzNpaVa1H8CTnS63uE2M4y87rtHZmnmGtqsuTYh3il8SJ2EsDHMTgcs
	a1PQ==
X-Gm-Message-State: AG10YOSWQqsocaaFVxxqtb/7khIlbdy9IUi6y5JnrZvhOfXEzwN+bpzfvmyKLAuauvtNjg==
X-Received: by 10.194.206.71 with SMTP id lm7mr48860554wjc.118.1455231683311; 
	Thu, 11 Feb 2016 15:01:23 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	yz5sm9520324wjc.36.2016.02.11.15.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 15:01:22 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2016 00:01:07 +0100
Message-Id: <cover.1455230414.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH 0/3] klibc_2.0.4 fixes
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
X-List-Received-Date: Thu, 11 Feb 2016 23:01:26 -0000

Kernel 4.4 exposed a build failure for qemux86.
The necessary fixes are present in the official klibc git tree: while waiting
for klibc_2.0.5 we move to the more recent tag.

do_package_qa is skipped for libklibc-dev: package contents are like in debian.

Andrea Adami (3):
  klibc_2.0.4: update to 4d1997d - Fix build for qemux86
  klibc_2.0.4: Silence QA Error about non-symlink so [dev-elf]
  klibc_2.0.4: Silence QA Warning about klibc-xxx-so already stripped

 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc                 | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.9.1


