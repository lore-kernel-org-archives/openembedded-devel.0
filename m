Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE539C61DCB
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.278.1787962277060662444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RHwN3SmV;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3968e063f84so1236729a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962276; x=1788567076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKdIka6qdDHV/Tji0blIkajQUP9IKX7UNqQDfxaPsew=;
        b=RHwN3SmVelrl6qHpe3BDUMDTeZoHVkQd23lUdiolgVo1E1PmqDfpt0n70tiBHSrsNI
         6RDP/GxS0wsIVmNDXFe+OB6R+Ohz40rVsZnJXKvLGeH9htMO5RsCKtSQtG1dF6tWOvxy
         h6AzPsvEaQVo5zSqAP6xaFJSUx4wkPE2IikRNu6avh/pjwM4p2PLlYPS4wEfNlkgA3i/
         kvqGxsbCL5NMRxgvnXvh1Bh0qnfAcZO5fOZvTGxlHShrNnq4dXQ34d7zs6XKk30DSJHg
         RDFSyD9hn5lBI6wsGIjj0O9nFifSXBsfCnq+INf8hFRSVbU2psMAkX1jwz5RsGapw9td
         EsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962276; x=1788567076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKdIka6qdDHV/Tji0blIkajQUP9IKX7UNqQDfxaPsew=;
        b=C4TA1HYIB0eTZyPDsRnNUWuXUtcvXtzrycEkqGo7PET4lDkQ50Y8lupN9xNa1JxE3v
         oZBhgQmzOI4HmVMrURiwTE8PuovafrqMycQV2lBT96vGSST78ZWu2LW11Ucyqe8ilyeD
         SbvzRNlnhz8TV834Efn5oRLP+EYvp77GNSn/Rj+2GRFIE49DyT4S0MHIreGZ6YSX2FQW
         kIubhLdxlag4f6fJvl3XOpj3WXtcfLLrF/0egTXD6fWFIQHUgprJjHjlqet6q8dKWw/Y
         Eb4R2rRWykQDExKw02X4naTdvZFQTUa0rZ+0c/UadA1H1KHrCBWSJh/kGTo0xSPlu1C0
         okTQ==
X-Gm-Message-State: AFuF++kXvkk5EaLNQfBBsoYmT5LuWTgDGic8Xr5QQnctViQUCvVq++7Q
	QxVWwclgGZ74bUMrKGLK/8mcPkYCARwtoT+gnXJutqu7PCrOTeCHPGUEFJqIqg==
X-Gm-Gg: AYBFou218o/gs0V7PHjayzxuVxDs2W8OlpyjOFA24D5P4PZqUIAdS0eyysouEL516Mp
	jV1ckC/lrtsfH29D0EXiiBBjTaEv7E/V01T5GTOadZMPv+8gJEXRpSHTx1Ztx//Z27yn4UnfzXz
	wzFJO1eNhvrD1h3EQQi4wYopEfqOf7F1bKXaaWOnfUDNB8cIcPZxd1zOCM9LLYGIeZEWqvG/9ga
	8PtisBqUdSC82G5Np72fNJxigbshTHntKoWelKZviiCsTGwNpGdADh2FE2QBQLtyniFfHjvKngq
	b15sX2MATz6P/dyOdbZc1Hd8VpT+PmW01RmGzdVHvQj1rdVsfdgo16EM83YAnBXlOL6VskSb25S
	r+wvVSTn4zsQtOjN0uwS6fOsTbuYeINNteoqb7+Acy7GFUWLuC/ix0TfaPMHWqByfXBA74L2T7q
	4c2zrYJvwSktnVERuhzWY6ttWQgPQx+yWBZ7RtZmkrPu09q9ZzK5IzGKr2QT5Q4Z5Gc0XgnXcSh
	ez1RJiGHJSt9X2YFqjPMW+8+YNMPB8haRrzo4DBDec5rK51ajOFOHCvJWwN/OO0CyoJr3RoZVym
	nj8lBzKTDmZKZEiwEIhIHmJFYJvIfte9R9ZN8NDYzd6FR9gVmjL7judUyAoLzlaXbt8Ba2Zeso3
	MIcEirazUNTc8KXVeCJLtZ1nPZaKE3OOLl9Lfur9vs0W91A==
X-Received: by 2002:a17:90b:52c8:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-3989bd13874mr4289201a91.21.1787962276368;
        Fri, 28 Aug 2026 17:11:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 04/16] python3-orjson: skip OOM-prone/unrelated tests on memory-constrained target
Date: Fri, 28 Aug 2026 17:10:55 -0700
Message-ID: <20260829001108.559544-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129563

From: Khem Raj <raj.khem@gmail.com>

test_dict_empty round-trips a 4096x4096 nested structure through JSON,
materializing ~16.7M real dict objects on loads() (~900MB+ RSS), which
gets OOM-killed on the memory-constrained qemu ptest target.

test_fake.py instantiates Faker with 9 locales at once, pulling in a
similarly large amount of locale provider data, for what is a
Unicode-robustness smoke test rather than core JSON logic.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-orjson_3.11.9.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
index 2e9392fab9..1b49a76b9f 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
@@ -29,6 +29,15 @@ do_install_ptest:append() {
     cp -rf ${S}/data/* ${D}${PTEST_PATH}/data/
     install -d ${D}${PTEST_PATH}/test
     cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+    # test_dict_empty round-trips a 4096x4096 nested structure through JSON,
+    # materializing ~16.7M real dict objects on loads() (~900MB+ RSS) which
+    # gets OOM-killed on the memory-constrained qemu ptest target.
+    # test_fake.py instantiates Faker with 9 locales at once, pulling in a
+    # similarly large amount of locale provider data, for what is a
+    # Unicode-robustness smoke test rather than core JSON logic.
+    sed -i \
+        -e "/--automake/ s/$/ --ignore=test\/test_fake.py -k 'not test_dict_empty'/" \
+        ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN}-ptest += "\

