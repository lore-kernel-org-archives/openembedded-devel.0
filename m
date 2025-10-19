Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1FACCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.192.1760893660132898973
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UCGjaCH+;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so5553019a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893658; x=1761498458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki212c3J8RLUuDIvybycH511cZ7v4yZV3ytIXFfVaEc=;
        b=UCGjaCH+AwU5r8A2x3Bk/GAOipl4d5RiJyzHwZ3K9kQj/Ti+hhwb1gXqWvOms83K7u
         hq4ow1FP7+zfntOU18snNh8MCr1kgQNa4r8YBeMnCTbyuvfmLcT4XJ2l1Y0WeOirwNYY
         8al57RcffgqetSJnhWaY72pv0Je5etMseNHN1ROGP4h/ooFGdstylyypSh3as1XR9rcD
         BB2W1/nBAarfPn5rm1q+1jRAiNBY7creeOwpOrrrrjzAMFXhsgQlJviuKej//g+Gm5aH
         DqogGWeQLgtHCKMoZ6FQuk3yHXp8vpNVvwOXyyecal93YDk3ItaBgCSHmemFR07n5yOs
         BIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893658; x=1761498458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki212c3J8RLUuDIvybycH511cZ7v4yZV3ytIXFfVaEc=;
        b=xKCGLfrw54RhjNx4By7KKr3O0hSDP67dS88/UqfWEZYEnj6A1R4eobzGtCs2qVjaNi
         2vSQUZXc7doOlbqUcmLQ89NNmwb777Nu1H6EvZRR1aLBdNMCcY52Xvecu+iOCcd3S7mR
         jCPDHy8LiSi+vtJu6dZcnFKBw9szNV52uqy5BO8lApo2IqfIPJ0B3mOK0yOCfAvuoHes
         mm7VB2RVGU8unVVJW1WULkVs20Br7AOvJ9M6yW0k4tf/Huqozkrx6ZB4LPpwUv7XWdr1
         UauAl6W1rM6JwZEFZumHGIsJw9NBitHeTa2/4+zeCzzQXfOWyfNjOxh/akC6rqrBFtxW
         uR7w==
X-Gm-Message-State: AOJu0Ywi++tBIer2NPO504peynxdUJETxcQOKhBaK7r0fyUWNf2wZO1m
	R+G+NtlWNIIQfkt09mgjd9zISndDX+3aF4FrWmQb7vqA+kGJYXIqUQbtsQ9cQg==
X-Gm-Gg: ASbGncsbZ5kk1ds3WQ+JZV+u6ppvyyj4PLUfS31SMwrAc9VE1dItSs3QUASFXsI55yH
	UOUXAUGWFX/eldM1XhQuDCkR+2mafmC6BNqeGEngqX1AEi7rmxpGTse8m/Oy/O14OabP/RZ/HCZ
	YkWTlx/NsY6m5kuYgihg6HW5CwDLZMryZlZm6BlcnXV5JDUMDT3BpnjpgckLSwGAAKC9dC5rPm6
	LowGuonVH4zKEvxAsT039hCshKZ0aI+t0ciN+0i95iuKKoQzBewr9IHdnA9eqXj6AiE9kIPtShQ
	TDbtZp0YrT0rMJuO0Z4xCI3xSLsxcsrtPuLfSgL6hFtgtV+WR4jztwIYPCxNrqYL+UkmC3hsbHX
	e0G/xl5IyB1on5NrvCvOO7+0ntpDPTeRDA+zA8wSZPlNq2VBqWW+viXrkaq3D/3RW2Fw7aQKJ7A
	==
X-Google-Smtp-Source: AGHT+IFqV024MWuhC4rvpKPRdYzdUpkxC+YEqjw7DypaN9rR2tyDxMdcEFVc/FReVhVR49Ed3PkFhg==
X-Received: by 2002:a17:907:86a6:b0:b40:2873:a61a with SMTP id a640c23a62f3a-b6472d5bb62mr1036472966b.6.1760893658160;
        Sun, 19 Oct 2025 10:07:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 0/5] emacs cve fixes
Date: Sun, 19 Oct 2025 19:07:32 +0200
Message-ID: <20251019170737.1311808-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120796

This series is identical to v1, except that the patches are added to SRC_URI
instead of SRC_URI:class-target - this way the vulnerabilities are 
fixed in the native build also.

---

Gyorgy Sarvari (5):
  emacs: patch CVE-2024-30202
  emacs: patch CVE-2024-30203
  emacs: patch CVE-2024-30204
  emacs: patch CVE-2024-30205
  emacs: patch CVE-2024-39331

 meta-oe/recipes-support/emacs/emacs_29.1.bb   | 10 +++
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++
 ...nts-Consider-all-remote-files-unsafe.patch | 38 ++++++++++
 ...w-Add-protection-when-untrusted-cont.patch | 60 ++++++++++++++++
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 ...et-templates-Prevent-code-evaluation.patch | 47 ++++++++++++
 6 files changed, 253 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch


