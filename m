Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4BCCAC5AC
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 19:46:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.35832.1758483987664387493
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 12:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXNxRTzr;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso4340535a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483985; x=1759088785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r44VENNR9ClpTWfBFP/DfPXljWxJk2O9bIYyNeMAWSk=;
        b=kXNxRTzr2M60dbwTRPgag2G8weHXduv9qbx067+5y7rtUFR5tkKhQbn4GW4wKnZsVN
         SFCek3RJTtYfc98Cd595s8IdYq2I3QN24nthBQOKkLHLJ5JnMomYlWyaN7l2AuPMjx5u
         VosV7UyycXcH7p3IwZMyVkHzt/Y+YQz3NXUj+uR4i1lVApXDlRpxkWgNZW79a1unvfsi
         vKE4MJ4KohDRAWxjlrN2nBTsu5lGXIYPpSSkRsyaFWa2QaZtJijK7RMfP2tFDr08JWal
         FsqV1HqJlFoDmQrOZEz9i/hZa9GUlDCCNvXyTreKdB+GDI9l8wjRyTqbkrNCG3621NxL
         PVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483986; x=1759088786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r44VENNR9ClpTWfBFP/DfPXljWxJk2O9bIYyNeMAWSk=;
        b=fIlKlIkS/OH4Hev6XAI5DJBBYLHX+OCnJRw6V6/0xJvgUfbI02u5TvlD0PX8pSsUYV
         9X+gfxv0K5PxuiueN2dP4Txnb4iqyGMVcAzzvZMMeswg7fsVz74646YcryvdQSdT+/of
         eDruftYEpqSo1pWmMH1+H3qUfAe5meTFe6c8xqAIoGYkWVsE6pmWaZ+c00Hi5KMaADpl
         WVRUpZyI3mwWRfWhey6g+lpZ1VqJW101iUiLHCaMERmjk6E8z0q7219MGZWDyXP0QTRS
         xi4BtDR90aNTi2fMvprhuhytPFiROq+qTqAa20XamduK5ENsvNyM9HOqoD3yc9hhUBP+
         hq+g==
X-Gm-Message-State: AOJu0YyjlZ/PPxcaqIKAJpGvVENXIs5T2fmuKKaqEkPQw5DhaLsmdHvg
	brzcMcjrbadpm/Dnbijjx0iRpQixGb+T+5PbbEyFK2RCzaFVFuvNj71ixrwUjNgF
X-Gm-Gg: ASbGncvjzDLZCcnNpTdwVLzjHNzU652jn31OXJq8g0PxEG48urw8rzkiTXsJAD51Vem
	QCq+k6n8XpwihsTRhlKHf1/nzyoHE2HubRIuFXIzsttaSTxjl0vSrPB8WOPcBI12paoHarI2SG0
	aCtu8AzU8+gXniNBW5cPR6VxYKhfkvyATlIoYfUM4FuQ9yL7Nh3mp9jMjcnfOafIMWHAS1FHj9y
	/YXwtlI0oZncE48uq4X7kbYuFWX5gbLmpwSBmJxKeKVR+qb6azvs2Kd2FVvoz+RYHZjwM8KNul6
	wS8M5621pqEWCovXXo4RM1OIWYhUaOuHam5sYtgr3el3IsbBMm5SORALBth0NsspEfeWF03wvCI
	fhWpGHBBUzWXCsKgJHHs0ifz4WTrGKyOykhoF1awZiK3F+EG6vNtsK0NrFHroJVgSbaL/NK5aDY
	UTkN2C7U9toBegj7XNNPZHcBL+Nv3k16wp
X-Google-Smtp-Source: AGHT+IFEFmvICj4j1q5VsHoTaVCfdgg0e+c7kvHbfmfwbWqrqOqH5Chd1ly9ZvG2I3SC/k2AkTfsYw==
X-Received: by 2002:a17:907:6091:b0:b2d:d73:de59 with SMTP id a640c23a62f3a-b2d0d73e945mr35978766b.9.1758483985318;
        Sun, 21 Sep 2025 12:46:25 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29abf51da3sm315549566b.75.2025.09.21.12.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:46:24 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-pytest-xdist: 3.7.0 -> 3.8.0
Date: Sun, 21 Sep 2025 21:46:01 +0200
Message-ID: <20250921194602.1207268-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
References: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 19:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119635

---
 ...hon3-pytest-xdist_3.7.0.bb => python3-pytest-xdist_3.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.7.0.bb => python3-pytest-xdist_3.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
index 17ab67c279..7b340e8920 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fbae836e16c18f4b220f7db6564e8f61"
 
-SRC_URI[sha256sum] = "f9248c99a7c15b7d2f90715df93610353a485827bc06eefb6566d23f6400f126"
+SRC_URI[sha256sum] = "7e578125ec9bc6050861aa93f2d59f1d8d085595d6551c2c90b6f4fad8d3a9f1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


