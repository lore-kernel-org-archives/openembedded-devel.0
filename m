Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6ECE7BDBA
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:04:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18864.1771247034223165332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9tiQSti;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43767807cf3so2330017f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 05:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771247032; x=1771851832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bevcRx9MYcqwtHD9DxsTAilCBfZC6hUp1242RN42Fmo=;
        b=B9tiQStiEoEW3GqubGcKFFe+iUBRXDmUDhDSH0vI5/iQJ6PMAff8Hu3RFSXV2d1+Jy
         W5qC3lDk+wnxec73IarKIIHJ2SCVzLcmSp7eewTi9xfu8Vj0ltNgxeadBXWqswExRH8c
         L5oH77FrDMYOA0blbP5ttvvz+z6wCUKh4uOYy0buiqu3PEwYufwG3qrVZZx70AJ1DJWU
         Tbmy94vMJz9tp8u9rceFadTdqOqPWy9KxcPFyNfXp/i5UXBnVYer8FeOT5FDVdWp5Pqy
         SgsOlUQQ1MGgflR6nsPtsYV4HKQVkS3HPSSO0/4pL3MG8MNZXYz/fglf7GKQkbxhdJWl
         bOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771247032; x=1771851832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bevcRx9MYcqwtHD9DxsTAilCBfZC6hUp1242RN42Fmo=;
        b=dn5RWy4JufgtfHPSutGbSaMfJ5sXRnwgdLNzLwALDsYR3uno0N1QjdT9n39zVlG6vn
         kMB4GnGRj5B+rQcbQY1hYVHiHdXIp5hK/QfmuhnR8Pd5TzII++6fI+2c7iZG008e63nJ
         je9vkOCiGsGeRbt6SDfWpWVwdzkeP4C9VquJeNZtmwlPBqJ6s1rrKw5OzF+yYRIVsBgr
         G37O1ies0rcvhouZwCn5paA2fOhKQUiuauVm+EIaeqvlga6amL6TECB44MmKY+51SCG2
         qdShmvxqom2Np8xUmcS37dQ42y41hvyul9jDDHDEZu6i7ESx0DcHSxjEQC6hQS16mL0C
         79Yw==
X-Gm-Message-State: AOJu0Yxb0Z+KsRk+kWW7llprOBdlObnFfzLu1Q834rUdzh2FBA0kTwFg
	0Airtp42VdSufS+p3uZrEVAI9BGyiqr+hpq7kjBBKdfXa15H8/VtDwn+4BHa7A==
X-Gm-Gg: AZuq6aKhFZAIhRdfH1Fz5THIOdLzZG9d1G+fxhAR9kzj4lgX6za8sXavRYL2kyCjdNy
	jnmgfiAd/bi/i4FX3ua+4E+2ct32EanM1FpcDMtLVULcNV/BVBGUlqRYvtWvSCIj6ta9XCobv6I
	8hlWdKxugrb0ZyDir0Ac+SoORvhxb//Ckp9c4R5O7jTBGcKnpSnFgJVAHHBqg6wdSn08TIoSEVg
	HA3btKeNT/NdeP+DtTC3NGaI62pX9JoGLAdNm9jKND9Uja/SN+01hLT1QXqIdM4ikthshWgBSSR
	CQrdrRFaaeOKsGM0DtYjY6bMIlsAp9AyYgCUy45bdFY/pDiCanropNC9IKmfYbeJ3VX4LiBqorn
	6WiFdylLi3vFocdJjGAX9tVTOd6gOGc5e3ON2rpFLuL3jblaUiJeH3rymVuRqpVr2dAXv2a6qoI
	jYQct8uGR/5OqGEi3tdUr9
X-Received: by 2002:a05:6000:40c7:b0:437:6c9c:5d57 with SMTP id ffacd0b85a97d-4379dba7566mr14041425f8f.58.1771247032220;
        Mon, 16 Feb 2026 05:03:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm30386491f8f.19.2026.02.16.05.03.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:03:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] yelp: add opengl to REQUIRED_DISTRO_FEATURES
Date: Mon, 16 Feb 2026 14:03:50 +0100
Message-ID: <20260216130350.259336-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 13:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124423

webkitgtk3 requires this feature.

Also add wayland as an optional required feature, to match the
requirements of webkitgtk3.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 14986f2650..e1c9324940 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -7,7 +7,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features_check mime-xdg
 
 # for webkitgtk
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "opengl"
+ANY_OF_DISTRO_FEATURES = "wayland x11"
 
 SRC_URI[archive.sha256sum] = "a2c5fd0787a9089c722cc66bd0f85cdf7088d870e7b6cc85799f8e5bff9eac4b"
 

