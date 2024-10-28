Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329CDD5B170
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.1057.1730142297940547777
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AVlH8R7p;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so42054197b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142297; x=1730747097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk7iHJtklacPxYSENFsGD8PU86mJOpmhoU86xiz5VXA=;
        b=AVlH8R7pFDCfpI26P+DODq66gDIPRt1fH9RN2/kDqm6MhATh6181tXMWk1sVLgWE9x
         6PsRdYY8W4IeItsYDrMz4inzwi/SWFr1XjL7I3MEhy/b/qryW2hsGl7CqzL+OzxeEc7+
         Ta/pImaYiE011KDpjRbSu4yZ7gUg2+HJW+GTeVuxf2TnOq1BBlJybEj/IeHBSet1z6rk
         HxdWkPwdRFjjXvAr6rZVW+Optsr3weAr3WuvGVwyUt5deWI3Mi6LmmoibExvXW+2SFqu
         fOg/JKwIXAY5DW83YTph0UuJMHn8x4ZVyyb2fuUVPn+SEjPmgWf4hBpoUUH9OTC1cCGL
         vkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142297; x=1730747097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bk7iHJtklacPxYSENFsGD8PU86mJOpmhoU86xiz5VXA=;
        b=O0TgiDiJhQJRK8tMTuGTIk9VTDKGZugTn5jAAHr5IYoa6RWqGGacEdFho7BG/JK4iF
         ZnircVWqJ3nyHKHawdFg//jz9M3G2fsLXPAYA7x0yr01kAb8qhoFQGpKHzmEbpdO0PxI
         WfiX8zzzrs8SSvYatfN0xG9WOM5FcWeoZUOgRxkBLaldwBvp+UY/fOHFUi8uXNG+IA50
         ewZuyr+yw4p1yD4ANSksovHfJHgy1dTG+srwCrDxg+ssC400srvfVqtGQua5SDDoLJNs
         f6Xp+bnW3yO5NVU6/NzErxCsnFWt1HoBK4Z1Hv4IBwtcYBc7FxiQ2frkwUgQoiqDHG+6
         pfhQ==
X-Gm-Message-State: AOJu0Yzrjuo6YFuaM18RPrKhPNBVWV0Ga6IFtAV48BuqJuePaV3oQF2h
	tdJP5LcuyiD5uSFEms+Gpz48tRnfFE23XPf2FsJmLXkuctgk9prYwnoSfg==
X-Google-Smtp-Source: AGHT+IGre6FJOH0M+gG4HYj2CGai9SgzJNOqgkQXyeG/xOhJZArBWO/5rca6F0wc1Po0QGo73Seobw==
X-Received: by 2002:a05:690c:628a:b0:6dc:7877:1ea3 with SMTP id 00721157ae682-6e9d893a84dmr96810547b3.17.1730142296431;
        Mon, 28 Oct 2024 12:04:56 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 05/22] libdigest-hmac-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:41 -0400
Message-ID: <20241028190444.10522-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113296

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
index 7b5980287..5bbabf24d 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=6;endline=9;md5=6321739e9ccbf74ee5dd
 
 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a"
-- 
2.43.0


