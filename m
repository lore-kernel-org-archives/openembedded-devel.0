Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 32DFD7F8C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 19:12:24 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id kx11so1989177pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=43JEOLfWIWKbflvPxy9Dh9loH6XrXyFJXszljPnaD+8=;
	b=QTt7CrnYihOoxqvppL/cFlwJzc1xp0Bc7zteYvMggnZ7qiqxF0+OycPZkKCRSKcg3x
	5/npJg+jvXnBiorj6W1wVpnrIOKIhSazqZG7jTr4mJTYRRsFTcJP6iDB28223p9VbWc2
	oL87CD8HOmR9EVnTKOtmhLzJ7TiFA/jyWbJdYT7tnATiKA+z3Dqwru+CV3A+xVj36i1K
	J2xt1UdHaRpeVXk1RSXuJG8xNtx82lCleQrTcJaxG4tErgHvB2XPc94lLeolbsTudysX
	ezuwbC/CtsxGCNNPbebonvAsmQuHMZRKi2Byv8SHpCXyWJ4ryGx9lGe9yR83WQ0NQcHG
	6fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=43JEOLfWIWKbflvPxy9Dh9loH6XrXyFJXszljPnaD+8=;
	b=Tr+5xX76KcAQbK463K4HM/OD4plfnSPKacaoH1upZH08HCaF6JlwTsQPm895ZwH23M
	f6R9nZwF9qPfesaKXbeuxeTCKDTn4p5WyMbiPXvR8SbDCDvNFs/yzsYzvHgWqMzfQutT
	h0vMxfW6uEvwkvmyo6Atj8DyJLTiNflU1FESUxNRXrRcWUVt2uPuWtPKfOqZ/wCw9JtQ
	8JIVudmlED9CLiCsAAtCBPMACYEyCaBF0SB+zpyIMUOBWq9xUBXrsk2uVkmw5oofHCaK
	m5iGpV7hYBGW24wzu7zIVOZmu1GA/a1h6IPcx8xdHWJM0n+2dcor20sTDAC4Z8G8S8dx
	r20A==
X-Gm-Message-State: APjAAAVyTrINlDnTByWcXYmMMmu0hazwQt+wh3AekbDg43RYOu4Hbo+F
	kUo3ySDtBXI8h9bov1l66EVRPHb5ZLI=
X-Google-Smtp-Source: APXvYqxdkJBi32sf1Ud22AqfNt8oLzwY3TluOyt4WOJ1bmntqjp9mkt4EB8sY54rF79bglkFx52Xsg==
X-Received: by 2002:a17:90a:22e7:: with SMTP id
	s94mr848977pjc.12.1579201944759; 
	Thu, 16 Jan 2020 11:12:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l10sm4539199pjy.5.2020.01.16.11.12.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 11:12:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 11:12:18 -0800
Message-Id: <20200116191218.2768160-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116191218.2768160-1-raj.khem@gmail.com>
References: <20200116191218.2768160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] mozjs: extend --with-intl-api=build to ppc
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
X-List-Received-Date: Thu, 16 Jan 2020 19:12:24 -0000
Content-Transfer-Encoding: 8bit

This fixes mozjs crash, in launching js in qemu during gjs build

    Fixes
    |
    | (process:606857): Gjs-ERROR **: 02:02:06.039: Could not initialize Javascript

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index f52bcca735..389bcac92e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -57,6 +57,7 @@ EXTRA_OECONF = " \
 
 # Without this, JS_Init() will fail for mips64.
 EXTRA_OECONF_append_mipsarch = " --with-intl-api=build"
+EXTRA_OECONF_append_powerpc = " --with-intl-api=build"
 
 EXTRA_OECONF_append_mipsarch = " --disable-ion"
 EXTRA_OECONF_append_riscv64 = " --disable-ion"
-- 
2.25.0


