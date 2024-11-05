Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3CDD33A59
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.27717.1730831882734103468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hUsk55iq;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e390d9ad1dso47718467b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831881; x=1731436681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCv9339jhhaMuayoietqwK4UlQpdJJyaUZpWYJRql9s=;
        b=hUsk55iqgoNkp0NX5Q0+ZwMQNIa6jITLldo5YQB0AhbFKRJq9qJ/6mQ+3JfVbfCQTW
         auphjkoBS5wixfAz/rcR9zCSqtXESsRm/rdflgBvCCqea/ccbNymjUW2vmLNy7oXbnJC
         xnUXOqshyznaBnO1J0+DtbkwCvApn9zqzc9TeGtkFyHKGBSdMqSIJyErlgUOLC0VBmFZ
         yWV640aBk9ZcYw8UFS+edeTRoZtoSxSEoZmRo9G1b9AnGDnAO1hds431g+Kx39gIar1B
         VUGcBvQ+mYRXWkAAtb6Wg2Wyos9jZCJdSXxd5+bsopjPLNBwhKoi9c40kUVxq03zlPIf
         q3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831881; x=1731436681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCv9339jhhaMuayoietqwK4UlQpdJJyaUZpWYJRql9s=;
        b=DTvltwmkPP4eCNePmA72axYEyt1M5RhpIKenKEX4ldtIyPSA7N8nCw/VYGHiQ4RvvK
         16yBkmnHE/1u2Q2TufudaDJ5Xc4bON9qOL3rKeL/UeffRb9bODR19xD0w7kfRhSzalgp
         CLwOOOSwwiY00lBp6XTIZV7TJ0ROgMXQdVqncSPIcyW2GZfhYgz21hwPayPSX4Oe1nl3
         DpZG4Z4jifu4pvwzPNL/IQyiVOxm3ti26UFO8a9fOSKgE+EvT31glwGP9GPYa3AkVvxX
         hBj4Irm6Ooprtu4pzHKLYYuT8smYNzOvkYRjS2xzLapD8afOEmQzffBBKkiHodkKgruo
         Hu8g==
X-Gm-Message-State: AOJu0YyQTUpfbQahpJLRt2rl9NwYIXLvELyFgPNUXjFfv72BgVE90MJr
	fKHRK7ROr8YjT78EgKmFAi24zGXJK0IeAU/+JC03O3wXNYnlZu9tY6XxpQSI
X-Google-Smtp-Source: AGHT+IF7etNcEkPk8+ZpwGqNB0F3EITWBaYaT3ctxW/B5oVIJTy87GgnrhpBeeiEhxKgW7eEL6YjUA==
X-Received: by 2002:a05:690c:d1a:b0:6e0:447:f257 with SMTP id 00721157ae682-6ea524cbfc1mr205696797b3.22.1730831881165;
        Tue, 05 Nov 2024 10:38:01 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:00 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 005/161] iperf2: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:41 -0500
Message-ID: <20241105183658.34982-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113520

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 86e5fef53..7b3d23a53 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -8,7 +8,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
            file://0001-Detect-bool-definition-considering-stdbool.h-being-p.patch \
 "
 
-SRC_URI[md5sum] = "31ea1c6d5cbf80b16ff3abe4288dad5e"
 SRC_URI[sha256sum] = "c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad"
 
 S = "${WORKDIR}/iperf-${PV}"
-- 
2.43.0


