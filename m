Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8BCCA0EF1
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 16:50:41 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.31050.1694537434441910053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 09:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mHQxCTa7;
 spf=pass (domain: baylibre.com, ip: 209.85.167.51, mailfrom: pidge@baylibre.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-502a7e1bdc7so5828669e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694537432; x=1695142232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDBNAd5ESZ4WYY/LfyO4pluiNUN2OcfbRSWdY/U7Td8=;
        b=mHQxCTa7G3fP0qQDtxGCBmrmjN3h4JmpDYi6KyuhCELtyEgyKXejR1n1oWcq/xUd1Y
         0XQAs/MQeKOpNBg4vlSDoDHmfKL0fi//F37xPrXvI1oaZpMRbN5g5wohLyk/UdIDeiua
         BJo0DmcBsOwTV8xNZKUaXYe/uJ3J4pzcqiYIpFHdBl9adODgSgzDCKjhzeUPun9RtLXH
         4h6h3Kks7m2tjnBwCz8M5A0kQGOkEOpq6urw2j5YOsHwDKwo8vheVzbwz59AcVhtrj+l
         p/Ndn1C4LszWsl1mdUn6/xQLnAUel0CidnXDw5f7AxG9LYv1Azdra9D4dygjJOy8tSke
         RXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694537432; x=1695142232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDBNAd5ESZ4WYY/LfyO4pluiNUN2OcfbRSWdY/U7Td8=;
        b=ZqNPJZAZafABtQg6bwgagooHq5b0WM85jWOtMzAKkcA4Ohg+zgKdrAOJpLJwPNc1CC
         iiiWNJYafMeQCoZSyHrvqNqB/NEI4yjCai+vu8hiSqlSUolj8ToIwYBoMHpOGjU/fexa
         qoo3Boh5SZwocdbHAczQSq8ImAu52GNWqsoClnmy6HcKQ3DpqEzwp0gA9VWuIPOJw2B0
         3DU+1uF5m0IOFCePFth6Y9w3K55ogtmwi3IqZAPmje8HdYXRnBvtHXHDHubbaft0Ep8Z
         q+QY3Arcrw/P7JjhLS+C4FDJtZ6lierqlWRlYuTtu9f3RUeABXiijUE4GstIOYXlfhry
         zoQw==
X-Gm-Message-State: AOJu0YzxgSX/4uQX5hBwUGXtsLuS0Q94kv2tQob1bko4GFJCxDTrpaQt
	nhhKEcwZZgKjXmsrFHJv9ynSM6cE5X+aW0Q4r/5l+w==
X-Google-Smtp-Source: AGHT+IEBfydBQu4WUxLvZG374lSoxx4E8DIHLdgG4Vl5emJVmaXP6o00ULvMSPEzUsadjgoCWHhlJg==
X-Received: by 2002:ac2:4d8c:0:b0:4fe:2d93:2b51 with SMTP id g12-20020ac24d8c000000b004fe2d932b51mr105707lfe.27.1694537432243;
        Tue, 12 Sep 2023 09:50:32 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7c6c7000000b0052328d4268asm6157436eds.81.2023.09.12.09.50.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 09:50:31 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core 0/2] Ensure sdk.py knows about nativesdk-intercepts
Date: Tue, 12 Sep 2023 16:50:22 +0000
Message-Id: <cover.1694535904.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 16:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104848

This patch series ensures that do_populate_sdk knows about
nativesdk-intercepts. It also ensures that debian builds work with
update_mandb.

Eilís 'pidge' Ní Fhlannagáin (2):
  lib/oe/package_managegment: Add nativesdk-intercept PATH
  update_mandb: deb fails due to missing man cache

 meta/lib/oe/package_manager/deb/sdk.py   | 5 +++++
 meta/lib/oe/package_manager/ipk/sdk.py   | 5 +++++
 meta/lib/oe/package_manager/rpm/sdk.py   | 5 +++++
 scripts/postinst-intercepts/update_mandb | 2 ++
 4 files changed, 17 insertions(+)

-- 
2.34.1


