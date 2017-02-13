Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9049A73200
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:32:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v77so3092841wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1Nn0G6XHiGx6BSHv9+1I2dhYSzaShy+ao41Lnx2DSMw=;
	b=ppg/641nQ6ItoerMD08hEjPzsOcqJxvsGPU8VjkTQxzKb1iZ9qAO+2uemP7NLJ92W8
	JQWsC23wI9KwpUf7YzTwf/nYJ5JMX7+SMt3a5+Mfsb4zo48ry1Bd7lgzlP9pxMy6pt2Y
	M/xpfFhB9pcXw5WmoPNdawqB7oDa1NARj+q/uggb5a/jXQ+kWdZRRkFdSfOOVcqvRTqn
	FoPG0xrEZaDbVi9xu9qFl0djqI6JK4PIJ2WAlEW6DoR4BFpreQht4Kj3XZoiVpNMU2LH
	W1sRru3L4a95S7mMys5rSdNGM2tIOS6gv1MlkmKVBMUdtnviHAtroFPr2s/7JuiPFhhX
	7OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Nn0G6XHiGx6BSHv9+1I2dhYSzaShy+ao41Lnx2DSMw=;
	b=AgBkKn1yGpqDGyHIoJfVxTyZIseLB9PrPD0s36JIj1AUEH4Heem6QeMIuxwcAFs19r
	C4vX6uaJFxq9jreYggbFR6KK7rdp2ablxA64X7BUSpp2GM+eWJTcc3jD3u9NoIdYv7BA
	OhmQKCOVQVdWgTOeUkd4ui+B5bbVTjaE5g5s2VN6ZLTDTdrR7LLSPuQzRuzCKKP/QyQA
	cNTj18sJt3hmdmp6y9Jz6Hsiqyd7/EM5yhrNqaYexkfuYsHRB8/ul4Ms9NsNlDDNpqkr
	RKLdibzLF7MiWddHwtZjcxO3Bh3op5DGrcrh9vAtBAbtMyU3z6w8LIOe9HzRMuXZFl+X
	t7kw==
X-Gm-Message-State: AMke39lQzcl82TwWfWx6fFFHilyeq99AmNFLWMBuEJ+M0/s9uvvUi0iIzJ/8r9B7YgBT9g==
X-Received: by 10.28.62.144 with SMTP id l138mr466977wma.50.1487025168213;
	Mon, 13 Feb 2017 14:32:48 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:32:47 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:34 +0100
Message-Id: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH 0/9] fixes after Recipe Specific Sysroot
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
X-List-Received-Date: Mon, 13 Feb 2017 22:32:49 -0000

This patchset adds fixes to the klcc-cross recipe which was not behaving
after rebuild from sstate for multimachine build (machines of the same arch).

There are small improvements to the recipe as seen in libtool-cross in oe-core.

Other than this we do remove the blacklisting for the recipes in meta-initramfs.

Andrea Adami (9):
  klcc-cross: fixes for recipe specific sysroot
  klcc-cross: disable packaging using appropriate
  klcc-cross: restrict scope of SSTATE_SCAN_FILES
  klcc-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
  ubi-utils-klibc_1.5.1: remove blacklisting
  kexecboot(-klibc)_0.6: remove blacklisting
  initramfs-kexecboot-klibc-image: remove blacklisting
  klibc-utils_2.0.4: remove blacklisting
  kexec-tools-klibc_2.0.2: remove blacklisting

 .../images/initramfs-kexecboot-klibc-image.bb      |  2 --
 .../recipes-bsp/kexecboot/kexecboot_0.6.bb         |  3 --
 .../recipes-devtools/klibc/klcc-cross_2.0.4.bb     | 32 +++++++++-------------
 .../recipes-devtools/klibc/klibc-utils_2.0.4.bb    |  2 --
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb  |  2 --
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  2 --
 6 files changed, 13 insertions(+), 30 deletions(-)

-- 
2.7.4


