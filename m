Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C53CA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:05:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4450.1791540311774527535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jPlq2wpG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: scott.murray@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48bbb06e746so3351063f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791540310; x=1792145110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qU8798GbavhUXfXhKoHnjO+1jpyVB75XZSqlHOJRlF4=;
        b=jPlq2wpGLTm9R9BD69usJx+VaUl139wvoJEJCcuccnLzK6zFcXP/EYQTktJxpPUxpe
         r10C7fR5UOa6WJRMnk/F617Ma2a1PBJE38XFMfoAkTxHbSYAzseUWoeI3NT4fGNem7GC
         ucE+H6ZVhQSvSbIA8FX9fo64gZrRLC7g1cq50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540310; x=1792145110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qU8798GbavhUXfXhKoHnjO+1jpyVB75XZSqlHOJRlF4=;
        b=WaFYGqb0lBPKgvdyD7Tsp/4gArnV/JsGrdoIkdSCKxHIaBT/USsgS+gmD9YYVL6B5b
         cdGwOOq7YHvcO++wHD3iR6lbsU5Z+14GxtaGA+YMo2pzvyVG7aPPqc4VzpGaIrEUp2+I
         jS9oB0WcBQeadElThKhTRS4cCGxqWVkljH0rJjZfcOZzDTKganwL1OdHKmPMvKi45idY
         Ihx4RWSBZZ46fgrKheKzl4kIL67eBBAsaieDJEceBp4Yok4zhnMcyxBU63d/IwGok5K/
         xWvIbC0K+t/hpE8yqU7UxP11tA7oS00jWq9qZAXjw9gte2o1ybd4y9a0S7u+PiXMCTFw
         mg+Q==
X-Gm-Message-State: AFq9FYKyo0YpmNyvD8nTj1viAbXUBggSaN9w0fZaGeJXEJA7YIloG2ql
	GlV9AOhlu02vcD0Hrk63c/Tcdh/ZoNqSuisuP2eaHPUKXBMDGFAVLVN+adzKHYDjc9ZVHJDBMoC
	ZzrlfWXcHVw==
X-Gm-Gg: AYBFou3mbN2a7wQyE035mgEDb0feEaeXH8nHzRCtLHJcvk13RulvBN/WKx+N8EojUUs
	iL6fng79CgpYt0GNRehAd86T2U5E1tFXOpNOwyB2wZQ+qsv1Yn18x9+0qyv5/x7s9AFFisGofPj
	eWXGv/6qGWo6g/V2ND4PKeRvWsQ3b1J2btdvi+yJtxzBk+VHJU1+569iuke5Rdm2r5yz/NlzbF+
	crLZDSMvtEbLU1b18YdHjX2g7FyjcyqRQvEoLXd9YW2ljRiYJ2YUFB6kv0zeM1lGl5Lvu2qv25g
	cJCx0Y2pFryDWXU0WLT9qflV3pXlkE5GdOPAvxCaG5sDlUO18E9TY+MQMaW93ErZgJIbduZ5ja5
	M9+8zSTW0XDOcttBOqcNSc65l3enGAmsomsrI/Z5lXQoB7G6WLvsqBVJmwKU09Ai7OFPPhVnKQk
	cDf6o1vDu744zEqt3EKD9oNmHGf54NakhuVzexdxdMfogZl1lO0VvdTfHpcoznJhteQchy1RZr4
	Hjq8cWNbu5fwvEKN1xr0zYalPQN21m38/rbm13JgwEC6g4Kp3t7uxDVUHFbEoPdVRJYhRl46ds=
X-Received: by 2002:a05:6000:29d6:b0:487:40d:af29 with SMTP id ffacd0b85a97d-48dba9dd94fmr1632631f8f.36.1791540309521;
        Fri, 09 Oct 2026 03:05:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf232sm3079996f8f.47.2026.10.09.03.05.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:08 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/2] Some updates for pypi.bbclass changes
Date: Fri,  9 Oct 2026 13:04:54 +0300
Message-ID: <cover.1791537542.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130682

Here are a couple of PYPI_PACKAGE_SDIST additions to work with
the updated pypi.bbclass, they fix failures I was seeing with
meta-security CI.

Changes:

Scott Murray (2):
  python3-systemd: Add PYPI_PACKAGE_SDIST
  python3-dateutil: Add PYPI_PACKAGE_SDIST

 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb | 1 +
 meta-python/recipes-devtools/python/python3-systemd_235.bb    | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.3


