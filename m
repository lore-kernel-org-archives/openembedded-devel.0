Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD762E65266
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:04:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29955.1769954664156006033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kMYYZDR2;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so35873305e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769954662; x=1770559462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DG5vE3VkNkkiber2+vNrjPwXOoTt1/YxNVr9exI+RA=;
        b=kMYYZDR2e2NYVHfMnuJHlNUuye4C5PK0kNQ/T3Qj4o+xB8JJOphW20LDwBAAvBH0A1
         a2AFrPZCnc8Az8jvWj33Ona9ZnuGLXwVLMV2qcr1EunlP4C6n8sEhzAWOaJ5Rw1358vk
         gaWCI/smbi6FYsuYIlbrwvr0Wta4pdXxYJlR/SvDX+3f7Y6nrLdAdGSmRwiizBZFHaNt
         r5LVniScgXSi8+MCd24ZwgHeGpwm1PxyuuFjzcMobywuxgdqyFpaqYOSdgwIdqOdSqRs
         ilK2XSZhQDxVR9cNK1k9TarIV3WUwIDFdaQLtVwOI6ll/tVELvjXNV95Ifu8Vl8g7AIT
         VvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769954662; x=1770559462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DG5vE3VkNkkiber2+vNrjPwXOoTt1/YxNVr9exI+RA=;
        b=qZgUuc5mTzMr/mMcC3MtrqYRGUCr829Unfi4bx+p3/l1c1A1ux5ccYrKwidGu/UXC7
         NVDIX95bxAJIloxxAIsOavirA+TxFvBT2p6UQHd33TKK/T1jiizQ7AhlMGXP617Z3cSE
         JFJKrEl45VOCZ7t5Dfbzl2IxtevE87D4XYg31RBlbmbUYPLLordf0SIv9IyUT8VUQHc6
         BZ9uiU5I5Qe0xhfr0YWr8wjVDxCCr29mXCHU2iI95X+SNBXKBf29Qzk4WYmcPkitYqiK
         FtVPUCqZeML1rnwha7+b61ferO6sEmTtogXz2Eompwdhf9w18hX19NCvuCHepz5rV78v
         JLXw==
X-Gm-Message-State: AOJu0YxkMrjZwkmsV2NXW3yO+VqpVWRxNJMqmIUUkfXNcUrlVv5ivRP0
	rTGt6lO6uq2aPIO7TOk9prrIZ1RnSOTHzRzfAJjdGIFPG/PnESllwoX1Sc3BVg==
X-Gm-Gg: AZuq6aJ/2iuZgFzhtngT33s5+ZHSy+foeb3wLOPBGshmM7itGZX/gPaCyoyBo454+5S
	wtgupgKtURQUAmHb3Lf8TlZgHBpS+PnHixGJGSJRMZe88kkowfo4eB/MOwIfi9RaiFzKkykshmQ
	dxXK5XCfP1eOSpwaq+34MVsCzlxOMnoimsS1XWEJt7hakR1quFe5Z666GfzexpXzgJn8iRiIZNw
	oI9by6kIjBisaHZ5aUGNhc5Rz9O8I64vFFmUAnZtn7Sam6gJypzs4f/23T4qMEPDjxlHTpHtuzq
	9qXW93cRRutKK/arjJAdcQSqDBjrwidD1PsaXc2leViIR+qmJRJf16rGdCj7UY/1fMPado5hOzu
	YgJ31Nshj3PEZEJzONfVbhUDZ++slwHizURW9Gzkt0NxgjK0kXwoDsTNqx1x8TXfpdB3ilkmkPu
	piXlxC8F5gjdiEQNbhixI=
X-Received: by 2002:a05:600c:6092:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-482db4592cdmr110105855e9.1.1769954662224;
        Sun, 01 Feb 2026 06:04:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm307984695e9.7.2026.02.01.06.04.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:04:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 0/5] TigerVNC CVEs - alternative version
Date: Sun,  1 Feb 2026 15:04:16 +0100
Message-ID: <20260201140421.768419-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124032

This is an alernative fix for a previous series[1] fixing the outstanding CVEs
for TigerVNC. This series brings the xserver component in sync with oe-core,
now they use the same version.

xserver 21 support however was only added to TigerVNC two versions later, in
verison 1.13. The first commit contains patches to support this verison of
xserver. I was able to compile and connect to a VNC session successfully
from core-image-sato using these patches.

The rest of the cherry-picks just ignore the CVEs that are fixed in this
version of xserver.

[1]: https://lists.openembedded.org/g/openembedded-devel/message/123940

---

Gyorgy Sarvari (5):
  tigervnc: sync xserver component with oe-core
  tigervnc: ignore CVE-2014-8241
  tigervnc: ignore CVE-2023-6377
  tigervnc: ignore CVE-2023-6478
  tigervnc: ignore CVE-2025-26594...26601

 ...ncrease-supported-Xorg-version-to-1..patch | 29 ++++++
 ...server21.1.1.patch-Add-Xorg-21-patch.patch | 95 +++++++++++++++++++
 .../files/0001-xvnc-adapt-for-1.21.patch      | 46 +++++++++
 .../tigervnc/tigervnc_1.11.0.bb               | 45 +++++----
 4 files changed, 192 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch


