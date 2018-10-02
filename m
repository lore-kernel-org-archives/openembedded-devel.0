Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B383979368
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 16:25:49 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b7-v6so243000pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YLYhXF1zxoDpizgd+LOZZLdAh97Egluf0B1jf6h5Fbk=;
	b=EPTmZOtNTKb5B+X+shPNp7FekJsIp+xFkO/mMDevJ4udyxpKtl6jmhDuWF22zjb2cP
	TXmm7YlB0Qy1EtCIjf8U+2dGSq1hoL7jQnbeKJLohzzKHQUq1E3oXhGEDFOucXPcKToI
	ogJ59v50HGQ3Gm85PbmYBs3VuDNEmYEUAsxhRY1ls/xgVFKCdGF1BBkeGEZ6EqjTgCCV
	kSwQhIeJ8SokwmmxHwbf4PXoC4OtRyikeSL6cwB8Jf9tCPkG9m3FOUUIRoU1tQ+4x1Bt
	kc9gdbkfd/x61tqlUWDqVy8ra9MCjVyQLvkPk5Tk42GhdUN5/TBtCTRvm7ihr4kyatgc
	NMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YLYhXF1zxoDpizgd+LOZZLdAh97Egluf0B1jf6h5Fbk=;
	b=ImCsTyiX4h/JdG5iLo9Zx8h6I+kFNNd0op7fh4dwsGSseWJNoNMX5J89TZlFmr7nE0
	+mbtQkE88jHHJdihWI4YnTPHrdUYgkRXeIfnDIU1c+jc4QTBNa+j8khwfs121WVdSf0E
	A5+edYBOGHilzw1Tkjcsgv1XQqmx9AmEN3k+GnPJHLQOZwlZE0EMI3oWJDKdyovO7SfS
	GwEQSCWWcAKJOmq/cEUWIPzffQdWwkGUjcZ0hyuuVyzIfVJA+Mrd8Puy+T7GUYlJcHLc
	SAVkpiFIvUyiA/zh2oHD3oBrXOXG5nyFsDb9eJjqKFiAE0VAYTxaTwnkIMTykMgia3jW
	bnbQ==
X-Gm-Message-State: ABuFfoiDsGnszw1fvQx6Rc4gI0+0sb7pwZy5vrIc9McRCWMhOdqqpxAq
	UpwYGdZKUu+MV2CVsGko6F7TDtuC
X-Google-Smtp-Source: ACcGV60Jt1iB+HgC86wVCo9tTlh8eK94B7oCcnNhIYM7fyoMJioCMuqFw1Aa46wC2iCy3n8XtV+JcQ==
X-Received: by 2002:a62:178f:: with SMTP id
	137-v6mr15633657pfx.215.1538497550267; 
	Tue, 02 Oct 2018 09:25:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	74-v6sm15706476pfx.182.2018.10.02.09.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 09:25:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 09:25:41 -0700
Message-Id: <20181002162542.42865-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] tsocks: Link with libc_nonshared.a
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
X-List-Received-Date: Tue, 02 Oct 2018 16:25:49 -0000
Content-Transfer-Encoding: 8bit

Link step uses -nostdlib which means all defaults from gcc spec file are
not used and it results in errors when using stack protector options

e.g.
in function `send_socksv5_connect':
| /usr/src/debug/tsocks/1.8beta5-r0/tsocks-1.8/tsocks.c:954: undefined reference to `__stack_chk_fail_local'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index 72913579af..725ba189c6 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863
 inherit autotools-brokensep
 
 LIBS_append_libc-musl = " -lssp_nonshared"
+LIBS_append_libc-glibc = " -lc_nonshared"
 
 S = "${WORKDIR}/tsocks-1.8"
 
-- 
2.19.0


