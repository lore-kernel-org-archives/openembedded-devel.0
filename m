Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DCDC48297
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 00:59:38 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.4579.1707526768483174129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 16:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=nHusSxUa;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3b8rgzqmkafqiw62aa270.ya8@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b26845cdso2715479276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707526767; x=1708131567; darn=lists.openembedded.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/ykCYOly04KGh5nfWYyvRcsU02w42Id73etztk73eLQ=;
        b=nHusSxUauESE9i+XLuLsttgTtDka81RGni35E2UGeNRWJgq3ZPl0Idfvr9cAooJIXk
         SwMx+IGtBTthuhLa9IZojztZK9AhlFOTQfiAei7KzmJ+MnD2DOc3HJbEDUUb7/bAf725
         609zvAhX1YcPN4yAP7QXkDADONZ8OfmgEMGJnSSRwSNVgjLJaVDia94J1Rl1cQU7AbCa
         L35XiWx19xAOCQxbO5+56yG1jpsmmEFe72jMe4USMUatzB1/DUipQ8MnTFs2YxI+u/OB
         ZCBmvJ0HTTWOxdiv6HxA8pjqcDM8c9xcjx9wVh+VbPpfe6Wmn8yb9O1W4xq7qHt+/P8K
         lPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707526767; x=1708131567;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ykCYOly04KGh5nfWYyvRcsU02w42Id73etztk73eLQ=;
        b=cXSYAqF+PEErt2zB3ZmGoPaUrwLdDSmypONUeedQVCnbgEdoMLqYv4fanBIHogNENz
         ub/KUDb+YuDFFVLDQCRmSiZ1GusH8Pehx+ZrLx9dquSbGrKn+xgCwYl3y7vD54aEZSuL
         C7/lzlw1GPsvGbU77G6mZian1tHZM/MioqzLbIX2/QRFucb2/QlDrGKymkQqDxIjXND0
         98nWq+/+zG+Qhc6j7PLMwtyAlfFferLvZ7S9GHnv03bRdoQbK0NaUZ5A36pM1dvDMAZr
         rmzqy7j4KGCsiNSTDUK+AGxrzhR10IdBP3zoSzqMCQeWxSsTgki53FVXmLmC3IpxP4XP
         ddrg==
X-Gm-Message-State: AOJu0YzGMOaHA4iNr3Jde9uB/AiD0NQt2FhqpJazspaPLIF05W8LQQjR
	QuOue4az7G1zdeNjCHcxMULncUtkj6GtE3LgeGBPLNiOlLf+3XcdyaJqOv9qVQVI1O2MXWbhJmZ
	KMIvryhUJ8pwSg7Z8JiSDy6ttwxcWJ2QcmOYR0V/QNOIp1BfG14kQ6MTQiCd7e6G6WpogvGrnch
	gPQ66TsFGfcUf131eC1rBc4dPUIFgkQjlcknhp+ub2kg==
X-Google-Smtp-Source: AGHT+IF0LYJp6hXKd1fYwMt5fE4xl0Jfs9jIv/1qiS8wzdj7flvgjv5kClKIM4iTges9AbIFzpr6ZF0=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:cf74:ea8a:4909:577e])
 (user=wak job=sendgmr) by 2002:a25:abb4:0:b0:dc2:4d91:fb4b with SMTP id
 v49-20020a25abb4000000b00dc24d91fb4bmr205316ybi.9.1707526767410; Fri, 09 Feb
 2024 16:59:27 -0800 (PST)
Date: Fri,  9 Feb 2024 16:59:17 -0800
Message-Id: <20240210005921.1909326-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [meta-oe][PATCH 0/3] nanopb: Updates and package split
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 00:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108696

This change aims to bring nanopb up to date, and split the 2 distinct
components of codegeneration from the runtime. We maintain a
packagegroup for legacy users which have not yet migrated to the new
names.

William A. Kennington III (3):
  nanopb: Update 0.4.7 -> 0.4.8
  nanopb: Split into 2 packages
  nanopb-runtime: Enable shared library

 .../nanopb/nanopb-generator_0.4.8.bb          | 14 ++++
 .../nanopb/nanopb-runtime_0.4.8.bb            | 17 +++++
 .../recipes-devtools/nanopb/nanopb.bb         | 17 +++++
 .../recipes-devtools/nanopb/nanopb.inc        | 13 ++++
 ...llow-to-set-PYTHON_INSTDIR-from-outs.patch | 67 -------------------
 .../recipes-devtools/nanopb/nanopb_0.4.7.bb   | 33 ---------
 6 files changed, 61 insertions(+), 100 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.8.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb

-- 
2.43.0.687.g38aa6559b0-goog


