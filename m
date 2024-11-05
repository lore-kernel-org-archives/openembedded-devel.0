Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1638FD40CF3
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.30647.1730838983381686521
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKjqu1aC;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so5519250276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838982; x=1731443782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwhnarYDebgxmytuYfsYZzosdE2JKGbp6nGmNncMkR4=;
        b=HKjqu1aCezEudCQqhksxMBw7VX8i3HUf+FbeHpUmVuw/T+EsbR7Z3r9cindCPLTrT9
         WHA6gUqhQheC8HcYjB43awV+fGC3mo2sPnrl8X7thbhAsx3KpUAnO/qIMQ4dpbvDOTGL
         ItKty6cO5Ry5psWv48Fos9iOb0kQ2QyyzM6/qJI9hQBWDe8alerdaM7cNWQuAOVNuHKz
         3oT80SEmWxGRb0ng0kAy6nTGsoqR2HIkyy3cFnWnfCfcf6YYaxd25PUEmzNIrvwGA+GE
         WC/7r7fOSJECAey61tV5cddvfZul39RywR5y7EoHCPJ8bTzSh4PuPn+VM803L68QzP5k
         gcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838982; x=1731443782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwhnarYDebgxmytuYfsYZzosdE2JKGbp6nGmNncMkR4=;
        b=JvYySwJSpztWUkD7bm2tkrZFzx3lJAPLtArsw8drEa/qvdNrGnjbqrA3YYAYxzEACG
         +EJH9J6oaakFfilT4aWkN9QKBbBuMm3KZyhO1kfnJKXImP956VwMfyxZgTVTOcYg/GTO
         roCBThHS8f+WADSLrOVe59k0DzcNb29KOhwJ8YGtnQc+R5TJdSJ27hDc74hl8Mi9iR82
         LyEqGesaf+l3Ny4WMS71wKKAdoyUtz6ST5nT1jCkpn9nquYKwJdWdoXr1rqX20u/1Xn1
         g2fHlz5nvKBOfKbWA9eex79pWSzArL0suEe0+3YwpG7Q5E8hviOTTguZ2uVApVL1PaY1
         sAKA==
X-Gm-Message-State: AOJu0YwX75u44TVA00p1unctNL2362VJ+7mYAG6tVBDsG1c+OLoSgDFF
	OoLoCVRiEGIZjMKveRAkYAmLrPY+gzczj/VNIQWjx/Huf6t8/4ol02pbkAfQ
X-Google-Smtp-Source: AGHT+IGn/Sis6W+0hSwa7hin88ccMDspBJrQ91N2/iKheF2nHz0lnJybSO+xRyVMLamrBittc7B1Ng==
X-Received: by 2002:a05:690c:610c:b0:6e3:26dd:1bf5 with SMTP id 00721157ae682-6ea64b0f17emr162152577b3.20.1730838982030;
        Tue, 05 Nov 2024 12:36:22 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:21 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 133/161] liboop: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:58 -0500
Message-ID: <20241105202827.3104-133-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113650

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 7ad88b740..ba3fbf242 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -7,7 +7,6 @@ SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \
            file://tcl_dev.patch \
 "
 
-SRC_URI[md5sum] = "f2b3dff17355fd9a6e2229caca8993f0"
 SRC_URI[sha256sum] = "56af16ad65e7397dadc8268e37ff6f67431db390c60c75e21a33e12b0e0d17e0"
 
 PACKAGECONFIG ?= ""
-- 
2.43.0


