Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80C9D40CEC
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.30371.1730838897952122671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iG/sVJqU;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea07d119b7so48393397b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838897; x=1731443697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7waxS0Y/WaQTyDvR194UCjEKWBnURTERm52OqN2Lk6s=;
        b=iG/sVJqUd4d1arbm33SVO+z3TDfzaFpmIMWpa1q8wCz/p2P40sr/IlHS7NSD+Vm5+r
         AloADn/byGQtICkikktuiysp1v31RBiL6J+Ru1Q1k6HSPZilqJzAxJr/JPWlhdVMG650
         I+LtiMMoU+HhhTH++fmOZsqrTRwIN0aMArxS6DYzqhnkujan0U4/aedOFzATTQvj5QsI
         R1sdfKlRtWyZN3g4MxUszfp04fkgBXxRNXnXn7jduXkDdySafGSivoPEYGbstI0rQ+Ke
         TmH3/j+MjNEKCdCjoGkH1VF6czXsAm5nQYQX7nIYbBjVYp57uES4uAvaoMAroJs3ZAC1
         qIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838897; x=1731443697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7waxS0Y/WaQTyDvR194UCjEKWBnURTERm52OqN2Lk6s=;
        b=RpFcdvkdpFC1HTI6o4yRkBFGyEg8bFXaVg96VGfiw69WDr9mjX/kAJfKPyEWKD9tCw
         so8BZTn0JIU7Ig/9ruFw3Qo5scRgYsTWncLa1bNpXQ5X6xkttRkCDqM98skkmRz6ufi0
         m34g0pk83sKO1WrZFuAnysjuZEiAtCgRC3yWQ8suKfRW4+GMEIorbof2YP5XB1qPTNav
         oKDEMXKLxzokyj8PhkJ2e/rbZw49kqf7vkD/w9vJjkxNxxyBMEzircHjIVG6e5AOwvrC
         NY3roMy6Gsz4lZar/h+hpyqiuieKUIsxsg5vgKELGz4WdyCABDdYXQyiChn3sINdnFPu
         ojcQ==
X-Gm-Message-State: AOJu0YwEhZkYwrSPjSJbjEXcvz5mLfW6pMPRn8Yd4SAjT+q5PAH6Eo4a
	CITfvmS0omMwYIzsm0mfAXqvUkQ2yNS/PHD77WwGFq3YuAICLTfbNB6QjPkK
X-Google-Smtp-Source: AGHT+IF8TvJ7geUwGHB8GqghVCKJFHpOSTVW2f6FCr+g3eejCbdNqp+OOU5WN4CFd3sr45z4/I68bw==
X-Received: by 2002:a05:690c:1e:b0:6e7:e76e:5852 with SMTP id 00721157ae682-6ea3b96aaa6mr308000247b3.32.1730838896591;
        Tue, 05 Nov 2024 12:34:56 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:34:56 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 123/161] espeak: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:48 -0500
Message-ID: <20241105202827.3104-123-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113640

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 147a8069f..b4812d59d 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
            file://0002-tr_languages-cast-string_ordinal-init-values.patch \
            file://0001-Drop-using-register-keyword-for-storage-classifier.patch \
 "
-SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
 
 S = "${WORKDIR}/espeak-${PV}-source"
-- 
2.43.0


