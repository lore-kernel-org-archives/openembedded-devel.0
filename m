Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA75CD3C914
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:17:03 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16398.1765376220752807810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GJ4oO5oI;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10547910b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376220; x=1765981020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCKSacaXSaIQ34r5TloUJX0qKM4hFaJclWwoCQUIOLE=;
        b=GJ4oO5oIlU72DgnqdgW3peuSF93yC4J3Fm6PxGKrbll7+hGEAZqIqfS0+wttEL0D3B
         s55q9lgtbEEyV76oXj4wIm2cnXDhnunJmwBAUwm0vYvuHR5yk9TicltEQNhM1tOS/H4e
         h1TVHpIbiIveYtuxkOBe0GG0IR+5WUtZDSQtaaOrkzCzblVg7STwVdflgm+oFXSRJOA1
         Q3NIdqmVjF1ivAG9PtESyGs6cl30i66oTe/48MjzzlmPHHmGZD8m7kdfS5vcn5/40s79
         lTh0eIDzAfjpxHx4CR+IKJdlYvCc66PtxqRlp89dNIP/DkTan8sDBMawsE/WtB1PwzVa
         N1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376220; x=1765981020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCKSacaXSaIQ34r5TloUJX0qKM4hFaJclWwoCQUIOLE=;
        b=DZiPFiYqCM/P2Hs8S4tO/z2jNImxm13KhdYV9dZ1YqPvTns200Ls79se0+89pyIOLF
         9abnfZ5CR4pc3OlRWbpe3yFC6YkeVFE5F/HvZdbo6siXA308auessIIN2N895U70bo+K
         JGjgVbjVgGdGggp3Bk2s49vQON2UiDAgd3VKxgQae7ke1UdV9aF/fTtTxKLOWfGVE0nZ
         Sj9oDOLveXv8vCejmTveQm7+X/2XKw70FZJbQiMgLQtIIGpCyTRXhIfs6HLXT9mdWtC4
         Ehdz1NEkPlGAMiVQgPwBfM/HzunNAu9+vRMcnD/joGoDwBFvbks7gDAUvKsl+1PyowKq
         njNg==
X-Gm-Message-State: AOJu0YwB85CQ/9GzwiDh4TSUrIQP+eORDjMSP8xlbtk0BSJONi8MKX8x
	kS7AGj/3RZC5NgmZ3Jw/48INcoCvJjChOYbgjAsV0770wkJAE81pFGVXgT4j7A==
X-Gm-Gg: ASbGncsw9r+SANDWXHIpJpYMgrnfwYH8hvctOvM6Xp9c58/vCUg6ulaQvxVnKJvM1wN
	o/tucLefvTM3aYoUeTLZc1r56bCkFzWl1a2s2muRx5YXBLeg/7gdXfoPnfL6w2ZN6UBO4U7bIYc
	NxNJUQ5R3aaM265tSTZ3g+m1QJiZqvVLry7Y/WUCrL8Ds9VXP92v3s1aGerJQRSjWk6L6cTqc86
	nPeroHea08kHFGhcgQpYlKvJwquOREE2QC+PsUaULGVvHiYGNCihTvJ/NcAkeJHOi1/OtJH/hJO
	nAIR0ILDHOOgdNAu9jG+EtDClF8wAtaIEyBqumuFQtD1DbB2KSG3GFZ0hKLZddey5EZccEOMg0x
	F91hr70v3SrUr1qOCtU/U+n9AIJxxbXa8SH+6VfzGRh9M+v+b5m7paafyVkc00mypl3JF3B2uDU
	RFOEeo/FhH2xGgKjF/1PP8nCC3ca0bAM/trg==
X-Google-Smtp-Source: AGHT+IG4FsPbXftgDtUfjlfLv1Q8vmva5EUruBTU8pHIuOV2uYMNYLdZku4j2XIlqljmEgJgjoFD9w==
X-Received: by 2002:a05:6a20:3d19:b0:366:14b0:1a3b with SMTP id adf61e73a8af0-366e33cd521mr2356191637.73.1765376219859;
        Wed, 10 Dec 2025 06:16:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 6/7] xdebug: upgrade 3.4.7 -> 3.5.0
Date: Wed, 10 Dec 2025 19:46:38 +0530
Message-ID: <20251210141639.1397030-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122554

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Change log:
https://xdebug.org/updates#x_3_5_0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 533a9ab48d0d13f92e10e814a83876c702847a87)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.7.bb => xdebug_3.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.7.bb => xdebug_3.5.0.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
index a3947a8801..b07546d521 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24"
+SRC_URI[sha256sum] = "f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"

