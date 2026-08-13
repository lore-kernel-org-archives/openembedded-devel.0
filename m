Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C7C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27790.1786651776338944264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=epiAhtKL;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedda4c154so185084a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651776; x=1787256576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ksYEzXmBm+GWP2lHAj4jSvHX0S8eGTsgy4LnqOmJMo=;
        b=epiAhtKLv1Y7ItxBulIDerl3amiWkr5nm+WILn3VIqSF5b5aqymfuGYtdNm7bEuH1r
         DW60wxTntYMIqILLNWoyRJeN0ExGu4sMc/omyd04Ej0zS+fNlCXQ0hLe8DmEyyfxum59
         Gy2VYWV2mkA/qO/cmIl02OSqe/kOmDxZnLVQ0qpN8VmDydQZdfH6HNz7otUD+Hq9KZ+F
         GLUV/YrlNpVhO+5TWip/DvlKeRydXfZt8NFAmch4VtS05xelinU4Y7tipS1IZzuwOcP4
         CxC9UJppGMXC6UHH/VUKbLt72RqywStBnzcWMYTYrSn7r1aAumu3sMrcd39QGoXoKtTN
         x3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651776; x=1787256576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ksYEzXmBm+GWP2lHAj4jSvHX0S8eGTsgy4LnqOmJMo=;
        b=Qlcz5lWtowOiCjAL779GVdMOhF6WA6WkZGoigaPVS5+TuQS2Xa/5STdqOmIMyiEAin
         qLZ2xa6rcWQu4aqd6OQqUWbf2Hk3sMkHmUiG9JHVzpwsUb5IztlRd3BG9bru0Bbe1Xze
         bESM93dyb41BukBBMmCGuIiYMj82RhpoQ9sVZZ3QYpchRQ9298rd4dWnuI9agVKRzk4E
         P04/nCLJWY0aWyW8Q/ArxB1u9uM3G/868KpTM/E889zmyX8Np8xopw5oDJnmMnTSVjuc
         URH/0mZkzsy9JkToaVgAAmu6H70eoDMUR3MH2EYvTd3ffXXuB60kH5IKT76jj69MbkB7
         ScaQ==
X-Gm-Message-State: AOJu0YzbZHrokp4dZkrgS4Ayt4nzPWIh9NCFhswXfAvSmAh0BX2wp1W6
	gapp4Aex/PjYlNBjlZP71vhdA7P0KNNImm3ms72Oeqxi2Y4YbNQdPjY+dckz+FSZ
X-Gm-Gg: AR+sD12P0QjA3AtT2vLdpN2zFONyvLt3qkUUFTJxXlxpDS3RwYNRf7Kwu9VJc/BPCLs
	2zN5bmNgshASj3JELwCaK1cZ7j/eAQ7Cx8rZjF0VKNAiGnFjgrd5OyZCtaPGdbNIQuveJAyPUEV
	Pzxy02R+R3IfQ608L2hDKBFFCzl4lY/dIRtkAvqavfko9tdPlzD3J/6C09A+zfCz9RbfUYMYWS6
	U7VXw/B0GJEkJo6hid85NxHo2WcF1WLI8JKDSH5nwyN5Y1fFFL9se6Afl53/WlTf2pFFbgx0Gem
	cpgL75UL/xoux36k0QGLZ1BNUr3T52VZ4OCACCNO3vFSfEJV9WkFs3x/ZK9syb3x+DFO/0gyy25
	j6b31nyqxKxBT4Y5w6k4KEZcRClKhshZpBTJlFP/qIpJLti1rJ/5SL8jsD9LeHkXTgnMrkzbwR3
	6bgywT+jsDAqnecS1ZBFDBUZrdkVlF8faj18RXVgd54h/PalMwZeaQ8kfOqhjh2dUQukidRyv1v
	1nygqPqgKGZd61yAfQN1tpAzC1+SusJ6KAQaS6+J59GFRPDMTdwrH0OvbK3oGSJEeIQHYFDvz0S
	s82lHCE/7PTayKLOwnqYx0HGLX1zspXPU5tXiBr3Pt0/agceVDEfN2V0vITjkEsDgdq4momdi94
	ywdGGmm2p1DR+aA7vfuj8cK5NOKPazUFX9VzqKdgTGlm7gQ==
X-Received: by 2002:a05:6a21:6e8e:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3cc71a8a583mr389998637.13.1786651775559;
        Thu, 13 Aug 2026 13:09:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 32/80] python3-icu: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:46 -0700
Message-ID: <20260813200834.1302829-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128976

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-icu_2.16.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
index ca7cca4457..95e4aa79af 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
@@ -16,6 +16,8 @@ SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
 inherit pkgconfig pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 # it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
 S = "${UNPACKDIR}/pyicu-${PV}"
 

