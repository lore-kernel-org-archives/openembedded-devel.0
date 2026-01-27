Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AADDD2F013
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10483.1769518880562978477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSFggHsS;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359108fd24so3350818f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518879; x=1770123679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEOIZ3N338ny+dtaRv6L/urHlk6g3a5zTgbmUdufVMk=;
        b=OSFggHsSeQwWo+ZWGfUFiEu752hioLiCtACEE0Zdh0CnC0iX3LE3tGY8KXKqdzkp8h
         AqkfYdqy2pZjKfmj4Oti+/5LCpcqFRweiEtbca7aEVrukfBnSgtmn1Wgkx6SZuQCarSR
         GxX0aX/9muwm7a0j5QAjdF8Cl3ozbcxlkiBhQYkuzCF2fytIa2Z5H+fpYBWZGwD34YRh
         F6L4ba0DKb5FHDOKSJ+HEpH5q6oNVKL/Le3wmOlVY/MWY/Fs8LfWa0nlTmc5CZee6NDD
         ko72SfmMsoWBTtJbfR02AA38jnhMtAjfXmQuMabL9oZS2fgECnojUvPg1eiZIe0ho1z9
         Cxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518879; x=1770123679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEOIZ3N338ny+dtaRv6L/urHlk6g3a5zTgbmUdufVMk=;
        b=Snfzog7WyfDPjH8miHMArHA7SJUbRbmrOO0NKaPQp9lBdPe7VXCRAcuKDcRzlk83ty
         Maf0o7t4Xv8rwzj09MDDeQ2eOWXmQO3d28zMBxi47wbe2oXKiPHfzjIVNaZ2h67hCiIP
         2RoP/sNc+MdsiOccKfTMmCRERebeqAQW2MjDjzbjJ0qUBmYyAhu8gWLiXJfpObxWppgB
         XSGEx3jE7N5C+9TaGpptksIqPmxCUnCH/hDSZMuH5QwDhSjsNPAwG/4nw8P/6CCQBMGm
         E2n7UmSSUP804H7tipuuZbfBzyljk7I0N2YqYIsAmWqQd19t/8oHwWmjDSI0mkvIXS3k
         vYPw==
X-Gm-Message-State: AOJu0Yx2/ye5Wu0C64CmOAcNyNbFSjHuwedtaMJ+e165m5NmkVm4+unz
	j0fzdmQQiZ99WcUa3B8GG+rshlO9HH7UjOMk9FenUoIsx/qoKRF3CDoYHldyCA==
X-Gm-Gg: AZuq6aLhjfO+MA7wvGbjt2Qw5n6KVez15ZGppqXVst0l4gARJr7MHY9ntoupDPZOvG5
	yRMNzCtKaQoO7XIVD6wl/CKdFPTzefTdzxkVq+r5oQ52GPyBFVaqgQ2yLeYdXJTpEwcApJWpAFU
	4M+FfRkZSgoUkIkQ8Iu0JH3vKStgRLULIISz2bQ3Lhk6z3Oji5e02wVF2pqtSx8svRXm9RXdoQ0
	bpXhI/ngW8dP+tDkXjf+FQ03TYHcPBGBW0cxuNYN9IkVXOuex1rIQsh7Rtd9jxyCc7jNLQXwOeR
	rPg/eAHC+ZORHaz3ScCK1p5fDCylbLXA2y0V5Ahn2roqY0+BHYIebdSiwv24i4JHbJCYfjwlmju
	X0RiJGMR8rlLFVMz1Qm/mOxzkkxjPAQImzBHipyTE8fWYyqJLzPmsVtGSZyIDFEc4SehXOGIo8M
	UaJ51Sb99Q
X-Received: by 2002:a05:6000:18a4:b0:435:9bf7:c6b9 with SMTP id ffacd0b85a97d-435dd030782mr2201858f8f.24.1769518878210;
        Tue, 27 Jan 2026 05:01:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 00/14] TigerVNC CVEs
Date: Tue, 27 Jan 2026 14:01:00 +0100
Message-ID: <20260127130116.1902238-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123940


This patch-series looks straightforward, but unfortunately this is not the case,
at least policy-wise.

Trying to be short. TigerVNC compiles its own Xserver, not the one from oe-core.

This series:
-Update xserver to latest dot release of 1.20.x series
-Add patches to all outstanding CVEs that are associated with TigerVNC
-There are unpatched CVEs which are not associated with TigerVNC
-This xserver version is different from the one in oe-core
-Complies with stable-branch policy

Alternative:
-Cherry-Pick some patches from master[1]
-The xserver version jump would be a major one (1.20.x -> 21.x)
-It would get TigerVNC's xserver in sync with oe-core's xserver
-Have all known xserver fixes without carrying patches
-One might argue that this ship has sailed when Scarthgap was branched off

The same problem is present in Kirkstone also - whatever happens in Scarthgap 
will be cherry-picked in Kirkstone also.

Anyone has any input on this? I'm especially hoping that some TigerVNC users 
will see this, but I'm happy for all feedback.

Thank you

[1]: https://git.openembedded.org/meta-openembedded/log/meta-oe/recipes-graphics/tigervnc - patches between 2025-11-24 and 2025-12-25

--
Gyorgy Sarvari (14):
  tigervnc: upgrade xorg-server component
  tigervnc: ignore CVE-2014-8241
  tigervnc: patch CVE-2023-6377
  tigervnc: patch CVE-2023-6478
  tigervnc: patch CVE-2024-0408
  tigervnc: patch CVE-2024-0409
  tigervnc: patch CVE-2025-26594
  tigervnc: patch CVE-2025-26595
  tigervnc: patch CVE-2025-26596
  tigervnc: patch CVE-2025-26597
  tigervnc: patch CVE-2025-26598
  tigervnc: patch CVE-2025-26599
  tigervnc: patch CVE-2025-26600
  tigervnc: patch CVE-2025-26601

 .../tigervnc/files/CVE-2023-6377.patch        |  80 +++++++++++
 .../tigervnc/files/CVE-2023-6478.patch        |  65 +++++++++
 .../tigervnc/files/CVE-2024-0408.patch        |  65 +++++++++
 .../tigervnc/files/CVE-2024-0409.patch        |  47 ++++++
 .../tigervnc/files/CVE-2025-26594-1.patch     |  60 ++++++++
 .../tigervnc/files/CVE-2025-26594-2.patch     |  53 +++++++
 .../tigervnc/files/CVE-2025-26595.patch       |  67 +++++++++
 .../tigervnc/files/CVE-2025-26596.patch       |  51 +++++++
 .../tigervnc/files/CVE-2025-26597.patch       |  48 +++++++
 .../tigervnc/files/CVE-2025-26598.patch       | 122 ++++++++++++++++
 .../tigervnc/files/CVE-2025-26599-1.patch     |  69 +++++++++
 .../tigervnc/files/CVE-2025-26599-2.patch     | 131 +++++++++++++++++
 .../tigervnc/files/CVE-2025-26600.patch       |  70 +++++++++
 .../tigervnc/files/CVE-2025-26601-1.patch     |  73 ++++++++++
 .../tigervnc/files/CVE-2025-26601-2.patch     |  87 ++++++++++++
 .../tigervnc/files/CVE-2025-26601-3.patch     |  54 +++++++
 .../tigervnc/files/CVE-2025-26601-4.patch     | 134 ++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  27 +++-
 18 files changed, 1299 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6377.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6478.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0408.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0409.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-2.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26595.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26596.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26597.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26598.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-2.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26600.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-2.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-3.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26601-4.patch


