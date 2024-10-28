Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B74D5B84B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.1003.1730142297283581827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mUUMh9dE;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e8063533b5so45264117b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142296; x=1730747096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd1/yKDF5MuwPNH7yy/zgGTir/0MODzmfHy7m217AJ0=;
        b=mUUMh9dEpNO8zk4l+B/GgkKMjZi+nmettawGbO2tmmRkjQcZRTtcZXkpmSVFGlQL5i
         4/M75A78s7aruan74tkQi0nJU/yOwZEZ//7qAog7YJEPp3pAG35XjAwfQt8gYAdLxEFf
         Hy007egn+McShuxefAsJZ9Uf3T8Ww+gWrb+dircbnD6UYEFV1mOj4c/kEfWU8t1bOFwe
         bxlbua9VkAxogay6+895GP+BZomWN+pjW/8YVAnBsZOh4fE/FzDB8qp9OxTXUYueTOBl
         dEPWT06/amlCPMWIz0jX31D/1krATbUhrjtfd8obZCFqIDSxQ9FBFeQHtXW90jZEpOhK
         +yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142296; x=1730747096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd1/yKDF5MuwPNH7yy/zgGTir/0MODzmfHy7m217AJ0=;
        b=m+GzZGKKbNh4zPN0FklAC4zUJsZUiVhRtK4eadYL0ui8em6U83Hr0RGZxStgbpOT3O
         cO5WhlghMlMFziDhMGKdcgMfEAZXyujuFzMHS9Za5lR3iIezRCuN5DoYoGS8flk51tQV
         Evdm/eFhtU1f03PMqL2pyaRS49z9eBfB6GSCT6xtmZR5r+ejVppi5sIrFKEXLiZgulU6
         a1oeP4o3SkiI9IYAGbbi/dbN5RhLqSkeNOZULvlRwgNjSrVJkiU42PKjFw4szPCUo69K
         xhGtD6c1Ddr1i2rIE7+5tv/vnJl4dvrBT+kv9MZTsO9L8/oIRUrmhzf3f8+l3cDGhi0w
         ur6w==
X-Gm-Message-State: AOJu0YyYlr8qe+7F1YlW7mgS0ZK8wlFq2Pu3dJUDp8LMdzf2z/XpYaQg
	vaNzGQqBfpwVHcsm+RpEh386N4+DLB3Q/irCDyZMNLGtFjSHUHIT3rDU3Q==
X-Google-Smtp-Source: AGHT+IFBwNFYZYLtyPKYwzaQTrA2Dx3wVgF4HY2PfaR1GK/M0cxR0GJpu7q3nwDSWDsXFfh0sTG3mQ==
X-Received: by 2002:a05:690c:4b93:b0:6e3:2630:2a0c with SMTP id 00721157ae682-6e9d8a6ffe0mr97346137b3.26.1730142295748;
        Mon, 28 Oct 2024 12:04:55 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:55 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 04/22] libdata-hexdump-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:40 -0400
Message-ID: <20241028190444.10522-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113295

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 25483bf35..f52d0034f 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=215;endline=217;md5=bf1
 
 DEPENDS = "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
 SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
-- 
2.43.0


