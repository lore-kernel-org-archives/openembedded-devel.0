Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84FFCCD1A5
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.706.1760895435443662895
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZeCUCJf;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3b27b50090so642559366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895434; x=1761500234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsnsRXaL75Cgo9AOpGzyp0u/PVUjYYDHgboMg6kOofM=;
        b=XZeCUCJfyoKbf49zc64bM5dmhoDCFCgg2R8i2S+i8tV8NAsx7R6MrhjCcqN7jYdOCO
         AEe9e/etI1kmyI05BFUxn/tSJswS2zCn18AdcyoeDuTfSmE36HhZztN3Gke9Idv3NjF/
         DTO4bvVfL1C8RokRncGcZ4Hfd5UIe7ecCUURjJggttFGqo6DZ1+2Rqqs7bp675NZX4Gj
         rr2HeNYF/BamSe04p8wjKCC9bv0ffm6129QxmkxIQ+MKYcktFcxJXp++9tanZsUvMo9A
         IdzhO7ITVJcqwhjox379W5x0o9TcNwXUbqYZxAL4OUtaU1zfIW4XFqNvqPOpxgv5ySpZ
         rVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895434; x=1761500234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsnsRXaL75Cgo9AOpGzyp0u/PVUjYYDHgboMg6kOofM=;
        b=b+exQFCcm/Ni2z3+x448JnyCtzAI6k3NlPyaExKqge6cS7N2XR19HcQOyw/N/vvhV4
         Wxg2T1Q/SjkZ0P6GjyBPcba7P0ShARtSya1gBcYu9fGhvrvhS5SjanIrlxAOXuCnMS8Z
         N33kYsecN2Ppe2e/PUMvmNgAw0OWqQ5+qfv2ZfIA7fvTSMVW0eKgGjWFUz9Npp/Oddr4
         aD4euiR9jjlTC05oG1M9qHAcYxMIyZZrvIyBYXOwFZDqQQRekmT2pL7cvNos6gIQIvK2
         CciCBu/hDK42kbgRHx/sc8WekhD+KR/8uPW2gIWgfnDTd2tSBS4dGzMO4yJfEumiUHwS
         YZWg==
X-Gm-Message-State: AOJu0YyR/JopnKLsSe1MkwvM0nK7ij6J9neHV49TPOPh0EllD5wxvCd2
	aQKjQA9TFdhWtup/qjPp7bknJ7PM2JT/E08dirzlJAvPy2igPdvgwk6qbj0UNQ==
X-Gm-Gg: ASbGncvshtXf+V7eKSznuunukaf/YFc+ehMzaizPh638XicPfluUmJFQ9fls6xkZ7ZX
	lz714cQ3242d1vsE92Yd/mlxyl8cYYN42qWXZBAKc+ddaxV7DL22YJyMWxYzhfgjtMBRA+I9G9h
	nvbf88FyenJBXD5+FnB716nrwMqAvnLigWrEp52acCwgvRSmaL4aBiVo7/UBREyUY01pZGHi2U2
	W+J4cvrc0GC/1wseKksHL1Hy42MqM3BhpfHAXRO81azSax/He2QJo/nDRAXY65ZAEJGw69QmZn9
	x7erX94/+KxkIT/pjjLW5WvFE6KtBzfPLd1KHiUVsTVrcqkB5FUUo5sHP+ytGcLBiC8LKwSMpqX
	SOM/43Li0R8d2zKJAOuaH7yjc2GgK+kVqpojPHi1jssV6+KQmPq6Nhgh0/fRqHaPKg/XrcLNJUQ
	==
X-Google-Smtp-Source: AGHT+IFGVfOvfC3qP2KVz7N+dNDjvi4U1vvDBWQCIZaOMqJb3fA1SHKleD42zwsXACNdG0RC5PsOCA==
X-Received: by 2002:a17:907:7f1a:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b6474b36036mr1112627266b.40.1760895433535;
        Sun, 19 Oct 2025 10:37:13 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 0/5] emacs cve fixes
Date: Sun, 19 Oct 2025 19:37:07 +0200
Message-ID: <20251019173712.1460844-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120802

v1: https://lists.openembedded.org/g/openembedded-devel/message/120285
    This series only applied to class-target.

v2: https://lists.openembedded.org/g/openembedded-devel/message/120796
    This was identical to v1, but tried to apply the patches on native
    builds also. However accidentally duplicated the patches in the SRC_URI -.- 
    Mea culpa.

v3: The patches are the same as previously, but the SRC_URI should not
    duplicated anymore, and the patches should be applied for both
    native and target builds.

---

Gyorgy Sarvari (5):
  emacs: patch CVE-2024-30202
  emacs: patch CVE-2024-30203
  emacs: patch CVE-2024-30204
  emacs: patch CVE-2024-30205
  emacs: patch CVE-2024-39331

 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  5 ++
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++
 ...nts-Consider-all-remote-files-unsafe.patch | 38 ++++++++++
 ...w-Add-protection-when-untrusted-cont.patch | 60 ++++++++++++++++
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 ...et-templates-Prevent-code-evaluation.patch | 47 ++++++++++++
 6 files changed, 248 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch


