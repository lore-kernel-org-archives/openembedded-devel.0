Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C320C7EE2C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.69135.1683477205695705061
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=H8CdQMai;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55b7630a736so55062707b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477208; x=1686069208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egVh3+/7sqR9x0dlvvNPRFH5mNMUqOOMi6mxy0BZ+dM=;
        b=H8CdQMaidLksCF7KdF8cUt5n5Fv6wmD9xGi1Aj2hwIaxwUT6Gu5Q9MUMCuapknnaFC
         8vXRBA2ObeU9XKl6AgO2CifVknejAH3X2QWRAjFiKN68WVD+Xjsj1XTSbeoyHzdKT8Fa
         TXctTHXHDTXmGRL1gYsvO6CP9FRUfgfuxsZ85sN2t7brVAbgGDObM4nClhs1+ZeqsG9A
         wZWVUkCktidOyM/wA6bMXlM7I1siHtKJTaFCbVyZYXq7lmwMNfBrm8AX1OBM1Q80W4ZU
         bEoqbIausz3CKcedHNdDVuuYTFJUzf9Vj5osDy/ubt8r7ggn0a0LrDKOrJoCkWX3ib41
         dl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477208; x=1686069208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egVh3+/7sqR9x0dlvvNPRFH5mNMUqOOMi6mxy0BZ+dM=;
        b=XteNZjT0Oul4tgubD/ppigef6NuibabvTzlv2SHUjRUyaqSeGOJvvTrn4L6ssuMElN
         1cIJ+q4HXy6bHmTGfagbP9KesAH5HmMqco3L/1PY/wLX/iUEjEpgKjCCvTs3vCAaSaMQ
         z/N7N9oHjT6syVAG/NkdCAP4f1vbInmXGFxhcES8AoMMDT29S1gMhJyzJDT7AKUQvNxH
         UJNbv57/DFC0C5fK2oJJDRqqyvNRr/4bQLNF9s/R0/jofRnMQoXs1isrBn4OFWcIKB2b
         DHb9bzQ5lZqIsMpAmCrDaEWHDfpyOv2/MAct702mdFi3KsGqEIKJzz734a1Fr25PHp9J
         GHGQ==
X-Gm-Message-State: AC+VfDwpq2Lmo4PMEu7guQp3dn8bPDQwt7al+Ue+EOKFIiEiaqmnm8dk
	+nLwhpnePO0M0dFSQni7PfVYfWYp1GA=
X-Google-Smtp-Source: ACHHUZ6A9G8cKGbzvkmagdhCF+1hZeAa/r50zpv936AQW4iKAdNtJy9hTKn4lT2RXBQWPRm/uipCzQ==
X-Received: by 2002:a81:a116:0:b0:55a:6080:9882 with SMTP id y22-20020a81a116000000b0055a60809882mr8510352ywg.25.1683477208416;
        Sun, 07 May 2023 09:33:28 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 20/29] ttf-lklug: Point SRC_URI to a working location
Date: Sun,  7 May 2023 12:32:56 -0400
Message-Id: <20230507163305.3261044-20-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102350

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f37833fc636dbd1b93cbf625af1d5f57a0e1a266)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
index 8a7c1f333b..3951647337 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
@@ -5,9 +5,8 @@ HOMEPAGE = "http://rpms.famillecollet.com/rpmphp/zoom.php?rpm=lklug-fonts"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://dl.fedoraproject.org/pub/fedora/linux/releases/24/Everything/source/tree/Packages/l/lklug-fonts-0.6-14.20090803cvs.fc24.src.rpm;extract=lklug-20090803.tar.gz"
-SRC_URI[md5sum] = "3341dfb997043d234ab3f6e5a965e759"
-SRC_URI[sha256sum] = "f54c1f3b4df08995982657fed290b562556191fee2a0386afd9e8bf228f72b1a"
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/lklug-fonts/lklug-20090803.tar.gz/b6e0daaf8cf41208fd2a7bc04fb23f84/lklug-20090803.tar.gz"
+SRC_URI[sha256sum] = "de5750f7048973f851961050f76b8b58e9bda400d5007c3078d9317fbe2ff5fd"
 
 DEPENDS = "fontforge-native"
 
-- 
2.25.1


