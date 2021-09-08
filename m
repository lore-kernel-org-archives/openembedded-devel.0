Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.11952.1631110810784665075
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BDsX2Ke2;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id t18so3658231wrb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NSiNo/otGVRc/E1bJte9lT73Cq8d3Y9xZaT+8XgBF0o=;
        b=BDsX2Ke2RGNHevQd99hRhxLBJBAND7kM8d3n9BNBKNJoNfJEXKcObllLKyCsBtkKgK
         vZ9nBg2s/cSkYtts99AhL+SRq0p2SCrbDhEZgP5e4TKcWV/azYbOtZXA8mzpHMMZyo5r
         iYdrsTY0ezh+4kBpKYoO9qmi8I1mwNXc1liaVy6qgjBdeAtYVXOImgC7O2QMXTJrkgy0
         7t3/gsmB3M52eizJthU9613IUhW5Ok55C0HicX/rnUGN9b9p/wA8HGHROO+urjgFWXlq
         Xvzf80GQh4yGlpgXo7yhX9/CScWRrEyf+tB79YBtS8fEwnNDfD/xwNRu/kCMBRwVLC4X
         SgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSiNo/otGVRc/E1bJte9lT73Cq8d3Y9xZaT+8XgBF0o=;
        b=8KP5rm/lZkVf6fHiRj0NlPzeUtPC6Pn2SO66el1up/6uX2Qrn4dbSX9qwMvyC2U7yt
         X1URwvnzchQfV6T5x27J9esarBeRwYEe+prA6TaywsGUUlk0BwUOoFgs759vCKKaiQt+
         WJLYMniRrSl6/wO4wLJ/E8o2WK2k0dXSXMDZiSbwFUTB35JnUY/NDzUy5UR/pjAXt6sJ
         ePeljYLb5TeoOz4cD6NUfaXftnSfaimsyDfIcXmK2rIi7eF/Sgo3CuxWy02uKrMVsxUV
         3E80liIh9sRn+kxz7fB7MepsGf29AEzfzoVCAJsYqI3yHNyhZE4ZJQSlMXNP7WMtFNhR
         4J9g==
X-Gm-Message-State: AOAM533MjftHm4/h0w735sG+MsEsxc1BEYz2ISkYYnx+INT6nKacNxDz
	hL77+a5AhZrVGyc5g51EqmH257VvOKw=
X-Google-Smtp-Source: ABdhPJyqeDuvctv/CWn7jIa5M0v4aYrwREMZR53YGZkqBI+HIP4vAD3DtyPv700DZugWgvnWxI8zOg==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr4412780wrm.284.1631110809394;
        Wed, 08 Sep 2021 07:20:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id t7sm2553710wrq.90.2021.09.08.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:20:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] spdlog: update 1.8.2 -> 1.9.2
Date: Wed,  8 Sep 2021 16:19:58 +0200
Message-Id: <20210908141958.866476-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908141958.866476-1-alex@linutronix.de>
References: <20210908141958.866476-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-support/spdlog/{spdlog_1.8.2.bb => spdlog_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.8.2.bb => spdlog_1.9.2.bb} (93%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
similarity index 93%
rename from meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
index 40ef4646b..c103c3493 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.8.2.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCREV = "de0dbfa3596a18cd70a4619b6a9766847a941276"
+SRCREV = "eb3220622e73a4889eee355ffa37972b3cac3df5"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=git;branch=v1.x; \
            file://0001-Enable-use-of-external-fmt-library.patch"
 
-- 
2.20.1

