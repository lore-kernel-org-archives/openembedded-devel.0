Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1662E77E87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:54:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c24so17271270pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=12HmN0rOTvR2jScIQMfYPebbHnpYlM51RbunOKE+Kp8=;
	b=tURFy2hUI1ykn77VF4kW1dz+bOwdcEMGN+h+dIno/slQ2+8liCw1fH9bVO2NRLUlf8
	bRYcRf5LQ9+yaI3Bl1KSoWJMUVmNDRs//EFxQanexhrSohFvZoOGrnZ1JX3dW3YQeMUs
	aqJnAQw2J2klX4rNz/qLCJba0qa+jxWeDqBxfC0aJnLUi64eI5YGhgyGHx/VaknY6DpP
	wgBL5Kr+f7apdk1OjpgusaZjj2pfJous5sUPCK/JFKXxMgYHzFSpXSKJb7q6xbKgUFw6
	YZ+AN9EdPE6c1kYx6fi34pkRimX0H37RamLtDbdVeCAUMC5732elL5sa7VWXezlvTXCs
	1HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=12HmN0rOTvR2jScIQMfYPebbHnpYlM51RbunOKE+Kp8=;
	b=rhj1WKQ6+EqzdMJgVEFim3Fa72R3ezoBxzkH1kHHVV57vG1J5VgtZ4RxyawWgM8mlm
	OVfoCewx3C8ual7mJtgWl0AnzJtj4a7iqGoBhYA/uqnhIZeyXmaHuimp8fXeD8b2vqJq
	h2Ogd4T7Ff+BwYmdzn8nGE5Mh41TfZ8u40I0xavhkMeheogiWQNNm/BW1s5VwBctc+V5
	JW3HJkwuVeDUNGh2/D8j53j+fgVauCMNHoJ0GR58gv9vCVIICo1UUeR4Spw8E1uuou6E
	Zoqs0ZBKzE9sEr3vIiX5Qu1WiO58/RPNm1lK8jupC1o2l95QkWgd9AAoNf2KCbNdMBjN
	zF2Q==
X-Gm-Message-State: AIVw113hSQTPANDsuFqU5tnKxJWci7zwzHI67gBsPGZEfFhPrnjADBlN
	SffE7HlmXRUmoi1I
X-Received: by 10.84.232.135 with SMTP id i7mr21791697plk.300.1499748875993;
	Mon, 10 Jul 2017 21:54:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l85sm24947833pfi.53.2017.07.10.21.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 21:54:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:54:23 -0700
Message-Id: <20170711045423.21332-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170711045423.21332-1-raj.khem@gmail.com>
References: <20170711045423.21332-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
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
X-List-Received-Date: Tue, 11 Jul 2017 04:54:35 -0000

This is needed for hard float ABI selection options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
index 8ca1ca727..867407723 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc3
 S = "${WORKDIR}/git/"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+CFLAGS += "${TUNE_CCARGS}"
 
 do_install () {
 
-- 
2.13.2


