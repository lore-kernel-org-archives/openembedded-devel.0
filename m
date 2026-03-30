Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833C8FC97E2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:41:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46626.1774860114711056952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nMxrC91O;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: nmjain23@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2688379b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860114; x=1775464914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhzZSlYIH+FVgTIiOWsL9y3m/tLsxC6wRji8FMtPTpQ=;
        b=nMxrC91OzIjtNWl5OVROoRG3+I2dsMltwIkB0PM2TVASXMsIwgPHoZS1brW9qP6dWG
         fmykV0ffsG4iXxi3Xz4gGjqC14ozRXOHQ8sVNX2eGOveudbxmusjwfKzW8YbP1umW70a
         L5cGDwyHJPZ7X3POzgIbD6TV4u84WPVGl30lPGNy3gtPZM5GE2uBpir8eziEPO3Hbe2w
         JW5lwyS2Aeo6DZne+p+WOeX8hwghE1JpS/v7OtElGzEPQ6YytTpd7ufvxYE629is8JnN
         I5xkyvvOw/iMT2iw7a8Bst829gKtzX4g3bSTaaxDHr3ReuLb8ET555uyc36E4ZZGN9NK
         dnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860114; x=1775464914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhzZSlYIH+FVgTIiOWsL9y3m/tLsxC6wRji8FMtPTpQ=;
        b=r6pmgiBQ93+CkoRkdJoQFT+mfDbElZp6nMq2Zhf8JDO6tjn+/w/GgHof9jzGFCTw3k
         3+ync+6bO0vGaYT9Lr/oSA8uFn2jgNxt92mDniNa5kV1ZdkkVXV/D37/DD1311ayf2HG
         ykb3v8VL2RfkLZQ8iZSTxmkQCZMnacTXf0UWRLVusVZ3Q5r0XiFQCzDDB4Nl8BcBKdFH
         hzCd7DRmtg+RxVhFkcKAy0WbW5Gu1o/tI8J1mEdXuwzQQvfkghhJWxpef0wMovjB+Rga
         5srjE/qEaQekkWDKPxlSZNz83nhojDG62j243y7/1LysVYQFpvk1KHflab+4iVKYlloY
         FeAw==
X-Gm-Message-State: AOJu0YxP8S4KwEr//zoCgZegtohxZpmAWepz8bma/Pu5ROUAzSTELJCQ
	VhCB5YVMMYGJUrSSLj2LfSj5T240gzllR2+ntDGg2F3Ivn8OnBJioLAjKgpM2A==
X-Gm-Gg: ATEYQzy4xsPED4Bjk86I2VfEYXY91Qi9GcEt1RBAwfEaZZFc5KqBFS8vHNfHMrr14tZ
	aSbQ5lPCGy6H6RjiKM3aVtEDtXo0im2jIWfFhPa5PxNcq5NKVKWu/p5oS1+gnPOZa0V6JshcVUW
	1y+TsQU+O4gkxFKKZ6RRXeuHB/0/9mmW03rq6pdQrZwBr8VciaWvyMRsk40WOIt7Y2sOljJSoQ6
	ldk0HRY0hPvnMQFWr4DjFSHMtLndT3gs+So7J1tIvJAw0L/Cf8hmznlJnHOUZvbiRa9FmhL988O
	uc/5MVTyXTXL6fhwJ1/9GJgRAshtwFRL9mXy0o/YKdIKpouTgq0DK8Q9wlC+H4SCXT8O+MKQtfT
	k/d+U9n3VUXBFXzlhLveozkCOM45k462hg9JdWn3p+CGURBorme0+R2NrsDp9Ve5JzKDD2oxglr
	K3xCz8IOaYJZUuN6mS/82MjkGSRVm5WgBIAoxVoMZF+iZML2QouZrFWl56elkVSZ46mmcpDPsa
X-Received: by 2002:a05:6a00:1823:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82c95d3a683mr11265534b3a.19.1774860113765;
        Mon, 30 Mar 2026 01:41:53 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.197.75.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d019dsm7746256b3a.29.2026.03.30.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:41:53 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Subject: [meta-oe][scarthgap][PATCH 0/1] imagemagick: upgrade 7.1.1-47 -> 7.1.2-15
Date: Mon, 30 Mar 2026 14:11:18 +0530
Message-Id: <20260330084119.3008435-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125838

From: Naman Jain <namanj1@kpit.com>

Hi,
 
This patch upgrades ImageMagick from 7.1.1-47 to 7.1.2-15 to address multiple security vulnerabilities.
Do note that there are 50+ open vulnerabilities in current imagemagick version. It include 5+ CVEs with critical score. It will be very challanging to
backport all the CVE fixes.

Reference: https://lists.openembedded.org/g/openembedded-devel/message/125827?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cimagemagick%3A+cve%2C20%2C2%2C0%2C118574723
 
Along with the version upgrade, relevant upstream oe-core changes between these versions have been incorporated to maintain alignment and avoid regressions.
 
Key points:
 
Removal of jp2 PACKAGECONFIG
The jp2 option (previously backed by jasper) has been removed upstream and replaced by openjpeg. JPEG2000 functionality remains available via openjpeg, so there is no loss of feature.
 
Addition of 'magick' to update-alternatives
The 'magick' binary is the primary CLI interface in ImageMagick 7. This change ensures it is properly exposed via update-alternatives. This is a packaging fix that applies across ImageMagick 7 versions and avoids missing /usr/bin/magick.
 
PACKAGECONFIG additions (raw, jxl, heic)
These options are added upstream but are not enabled by default, so they do not change existing behavior.
 
All changes are derived from upstream oe-core commits within the upgraded version range and have been verified to build successfully without functional regression.
 
Please let me know if any further clarification is needed.
 
Thanks,
Naman Jain

Naman Jain (1):
  imagemagick: upgrade 7.1.1-47 -> 7.1.2-15

 .../imagemagick/CVE-2025-53014.patch          |  25 ---
 .../imagemagick/CVE-2025-53015.patch          |  51 ------
 .../imagemagick/CVE-2025-53019.patch          |  26 ---
 .../imagemagick/CVE-2025-53101.patch          |  54 ------
 .../imagemagick/CVE-2025-55004.patch          |  65 -------
 .../imagemagick/CVE-2025-55005.patch          |  34 ----
 .../imagemagick/CVE-2025-55154.patch          |  79 ---------
 .../imagemagick/CVE-2025-55160.patch          | 159 ------------------
 .../imagemagick/CVE-2025-55212.patch          |  29 ----
 .../imagemagick/CVE-2025-57803.patch          |  60 -------
 .../imagemagick/CVE-2025-57807.patch          |  45 -----
 .../imagemagick/CVE-2025-62171.patch          |  26 ---
 .../imagemagick/CVE-2025-65955.patch          |  25 ---
 .../imagemagick/CVE-2025-66628.patch          |  27 ---
 ...agick_7.1.1.bb => imagemagick_7.1.2-15.bb} |  39 ++---
 15 files changed, 15 insertions(+), 729 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1.bb => imagemagick_7.1.2-15.bb} (94%)

-- 
2.34.1


