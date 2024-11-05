Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4801DD36109
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.27894.1730831947718481289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJyCpXxA;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2974743675so4939769276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831947; x=1731436747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYIxVfqucV7rBQk9Tna0yqcs7/R1u0KT8MoCGhw3Bhs=;
        b=jJyCpXxABA1ox0Lj6snkCpmNrqcSM9lKDOFpWwqNtb6q6tMps1JhFt6ps/3oI2Lx//
         D3USDLQWRsbve32NRaNoACgYnY4ULEVvA1mhx5CfRmgK8IeoH9vZVLyPSCctXShPkbnC
         glwJsOAUAUgQuk/3FS4gL0n5W3BVqweRn8I2nVIQVqdK8djATscHpw61A9ZKGGmzox4c
         7b9HvH+ON0LRHJ5br57HqBEdpBGjaAXdUiv/q/Fbwvk3z5gyPgUaU7RSGvv3AZtUjnxG
         vibAjq0jIfEvByqW6WXCne6aTnUwwZFP9Yw6HJ5T0JuU6Xm/E4BmMhV07q8OV4NFPo8o
         lqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831947; x=1731436747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYIxVfqucV7rBQk9Tna0yqcs7/R1u0KT8MoCGhw3Bhs=;
        b=n7vEnWpd1zbW13PkDLXzL02vE08GFoyj2mdZlD4SrFdur8HM5DXtAOViGPBr4BKFDZ
         b6beL46PCnKecCY5jcU8zdd0ay/W1X6sEjNCINjA/qeOqP+z+5J/0KTH3PcNEuD8x8Wn
         S4G4QPUWpL6/OGnUs8OmVQ/FxTyobs4iLtEBMsOCfoQbDcT+R+a/IwAfMpZ0KEtcI7Nw
         S+xjFQdH9JaxREup/r96wXZhJJm40nRwaTv8qnnwJR3fOd24VqAbQxMs6YTkKNLYSVGs
         qGiC7mI3Yd5w98qp1nLAVP07cLtL+XBPtQNcmcATc5Sm5yQLggGQJVv8bj5muWO6nT5o
         2bbA==
X-Gm-Message-State: AOJu0YwS2LpJscC2zjmTDe8+sbfScomQx+zaqH7Eu8xQ1IcQycb7Tg6R
	p4f75VPr3uZH85mi4lED40AgJG/o1MUtRMJXmdFNRVYs1gznZ/9kLHrGjh+3
X-Google-Smtp-Source: AGHT+IFcgpmveJ93NtcRx8ELa3h5yn/4CZvVTNHt2nrG/pfkls6HIH7ZJJgzHkBMmjPe2AKPzgsKFA==
X-Received: by 2002:a05:690c:4982:b0:6e2:5d2:3421 with SMTP id 00721157ae682-6ea52356fbamr105878747b3.10.1730831946261;
        Tue, 05 Nov 2024 10:39:06 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:06 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 083/161] ttf-inconsolata: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:59 -0500
Message-ID: <20241105183658.34982-85-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113598

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 43b4614f0..85a64000e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -23,5 +23,4 @@ do_install:append() {
     install -m 0644 ${UNPACKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
 }
 
-SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
 SRC_URI[sha256sum] = "1561e616c414a1b82d6e6dfbd18e5726fd65028913ade191e5fa38b6ec375a1a"
-- 
2.43.0


