Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1386D545
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 23:56:03 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id v1so2777734pgi.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 16:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Uzi9irFIv3LV/kiIV/s5sepLPhyy1IDwBTakvrcTsrE=;
	b=ckWnNMgf51OPr1v3ubcaDMrsOxSoh1setju6S6moVheII1l4Lx9wXFANrMbaTasT5i
	P8IKUUB4rfPrTUPFlxDtn+DHvXdIkNSpLdwpmSEubvzIDfytOtkUJyp2rkfVZcTVYwzN
	0tZUldHJC7tSw6qAU/n4coVbUcZH/u3k52j2HDMZlO1T6KdLJvoouzoze/aMHBEAGPbA
	s0I04Q0YYlV6SYJ9GL25GHZDgu+AIRH2OsVMJbaf5h7dOcDDaEnKW6g6vdy5lRUEj+SV
	0qoIwCnAeZNFU9/Ws4U/QTSCm1QLLqYgJi7ioeRM/Rt5Agvr3jjTTxniaVagefX659ES
	GB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Uzi9irFIv3LV/kiIV/s5sepLPhyy1IDwBTakvrcTsrE=;
	b=kALOOIK/VLD7vVTiVq4tNrq56jfUH7qUnv7wS2E5XJ5eFoeBlUhQIEH/jnLd75Tn0w
	G+LwsJk6zL4ZQ7Msn5DZEu/6zfgKLYtpOpAZGRsFQMm9TWEUFq1JQQfrNFfvMjiinhaT
	1IpQ0ut3e9MCzVU6PNSiWUpQDVDhZwaeGaSPJ1iru9aRH978lLu4fYhjnIXyVl8LGIBU
	jq2417BO8U/5VG586QXK2NziSbvebT0+Zaz9mdx4tVbhSZ6f8VLwRN70jb9xw4QnHqJV
	/NRWlxJ3qPlohaQz71uZYJ4f/6j8XDUHXl1/nRsd76GsIv56DqCcfIev83JpPOm/3kuz
	sXqg==
X-Gm-Message-State: APjAAAWvtb2b8hZPxtbgqXywOF6jmn3Po5QgcdH72UQzYxjpsP5wQtv8
	wAJEvmJ0PUIEMJzWqyEZ64XO+KCw
X-Google-Smtp-Source: APXvYqwbuD5HftpoooSvklQ7CBoUzU1HiTcqXyCDiIzb3oupbq1+dI8QJcJC5gfQI5Dl6zWxuusqFA==
X-Received: by 2002:a63:594a:: with SMTP id j10mr5945148pgm.279.1552694164810; 
	Fri, 15 Mar 2019 16:56:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	d11sm7665255pfh.29.2019.03.15.16.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 16:56:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 16:55:56 -0700
Message-Id: <20190315235556.25781-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] klibc.bbclass: Add libc-klibc to overrides
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
X-List-Received-Date: Fri, 15 Mar 2019 23:56:04 -0000
Content-Transfer-Encoding: 8bit

We can use this to apply klibc specific patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index b7b72b728b..bba10f1b61 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -8,9 +8,9 @@ CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS
 CC_append_armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC_append_armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
-CPP_forcevariable = "${CC} -E"
-
 # klcc uses own optimizations by default. See klcc(1) man file.
 export CFLAGS="${TUNE_CCARGS}"
 export CPPFLAGS="${TUNE_CCARGS}"
 export LDFLAGS="${TUNE_CCARGS}"
+
+OVERRIDES =. "libc-klibc:"
-- 
2.21.0


