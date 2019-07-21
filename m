Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD757EEBE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l21so16489653pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=un225yXiEccnUOPZbyl40haiwLurSnpPdX5DQZdfbso=;
	b=R1pR2oIj6cX/csHxMJfTQdR4HqA8CvDA21UsfHUfP/ki/GNjA61eYbwzwzqVdqNqb3
	9FkJaaho8Bf5K3aypPXwuyZCBL56jOH/hC3Tcgux+AYYSQEHa3N3V929OB3lLjXs5P3c
	lNm7IWez5u/Obg8/hu8fp+keK+MUpXJbftnedZ3CrnfsqxGClGRPJ8dkLotKQGrqYNzR
	CAQL8JU7Gm4dUYA1fPtp2nRZfShQMq904W/8dpRjKzHCeuogQmvKIZUBW5ncRjcYxEcc
	am631elwlr1rphhqVO+RIxsKtI8LmZ5uxH8herp77Q4/8kg/eEDKm9p/wLjQ+A2kTcXx
	9U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=un225yXiEccnUOPZbyl40haiwLurSnpPdX5DQZdfbso=;
	b=Y08OdlPpUOUGHzdHKWkXBQUH9kaZPUq1C8L1/CEOTqGT2wNDCvJcnGL2ncgiwwIsKx
	jb+J3dI8RihHMMrWKB8f8NqdwU825gdN2uFBVvnoAT25nVknaL6o/rhU0h6Ix9rlzuGX
	KL1AUlc8TbTbcxOaUGONbEUMsjkRPDN4ir3FmA6oyiIWbwS7pZPum14J6M3vPw53kAeb
	6mgkMOijAUllq/2DcqexcK5vLK4ZY7R3bboxYueYfn4HmkoXPtX4AixcCe+OW/onEz0b
	JN+2pPwDCIdfqNhguOynEvtlgd6Gk90JvcclPjNajYpi7kXu03KX8dtMBJya1nOOEK6I
	QyJw==
X-Gm-Message-State: APjAAAWBoNxBzRNRqHuOe+HvSSKWg+mIWx8LckNoFTc6rZ9RJEmFoQDZ
	t/U5OjBbOjX/0AC8UDSy4o+AxvEkUXw=
X-Google-Smtp-Source: APXvYqzdBK/+q9eSKWqZP/4IZn/YQ/JqUy9z7OLRO7Px/qBSjvZ08pC+P1oZUAtGIDwh2X3ZZPTVVQ==
X-Received: by 2002:a65:448a:: with SMTP id l10mr42446002pgq.327.1563727178192;
	Sun, 21 Jul 2019 09:39:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:18 -0700
Message-Id: <20190721163919.32659-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/14] pmdk: Fix libdir which is multi-lib aware
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:37 -0000
Content-Transfer-Encoding: 8bit

OE use 'lib' even on x86_64 when building with multilib support disabled
and used 'lib64' with multilib

This fixes packaging errors e.g.

pmdk-1.6: pmdk: Files/directories were installed but not shipped in any package:
  /usr/lib64/libpmem.so.1.0.0
  /usr/lib64/libpmemblk.so.1.0.0
  /usr/lib64/libpmemlog.so.1.0.0
  /usr/lib64/libpmemobj.so.1.0.0
  /usr/lib64/libvmem.so.1.0.0
....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
index a5096fdad2..c20bdf6d1e 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
@@ -26,7 +26,7 @@ inherit autotools-brokensep pkgconfig
 # | If you meant to cross compile, use `--host'.
 #
 # Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
-EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=lib64"
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=${baselib}"
 
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
-- 
2.22.0


