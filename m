Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBE4CCF2C4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31587.1768811347273343618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8dURQlQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a58f2e514eso25514985ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811346; x=1769416146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI2Bsfx/8DVsUo5xtJC8tH4+HAEK+amIRSLEwx72Pck=;
        b=g8dURQlQXKFJuyhWjcsDwaQ01CzjP+YGOo5EWl7wz6zdgAdQfk6zou74ukqXljsIpN
         1TRUL4xBlvFVU2Ao+V/uknIxpgGM7cbxKNrA6lTqXP9/Tq3G9FKGpqyMmRlsIZGU1/37
         o20kCi97Aav8QtQoy9FEAWaCFYCwUJldn3jAfekE5k/u+o/pRVSmUydgmARi7+6RwFtn
         FKUtwleYaahZfDqWisxiXE4rCl2Iu0zSRhWUaHNBTOIJpP/B7mc6lN+i8EfG5nRp75U5
         abHj9V7FZ5mgxMpiSRK9BF3mlCWROOeCctCJZddqqohTfVbZpeYiAhxobg+UjkFFVqZl
         eXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811346; x=1769416146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vI2Bsfx/8DVsUo5xtJC8tH4+HAEK+amIRSLEwx72Pck=;
        b=sJA1heBOhTUZU7BOH2noVYt7MbA5nPj61Z40r2arr0h7mp3mfZdhn/pugxq5WbDhHs
         LXmtthhf08wvklZx1fMGTRmEpO9/UBc5Qz1JRazgoLMlHiwINQbdVdwUcpBWUb8hrNKS
         FjWs7FwCo2o1jz4+0dKWkFfFtYtKVQ9HWkfDwBYAZSXewOpza+2TN5j1FC9efbMlACwW
         DoEM0EfFgj7KzDqp+Dtz10nsRKFsmpO1gzF4tX4RmlWIRAYs46UDa+iMwvQcbbGYcibx
         nBRqImUi6A/HKBrsq5sI7VjbpHxKndf7VtHzaWDDJNLsUgTS0fAG4jycr9OJ6k3bQBwc
         2b7g==
X-Gm-Message-State: AOJu0Yx8TZcCergRG0uDh7I8Zttg6ZoxQYSVTGufrFefDuat8uXCHaRA
	GovktZztctIhKmTBFwnkf/ImfBc45r/kgGHO74i4FpU1hHl1one7HgUiBG4Mzg==
X-Gm-Gg: AZuq6aIDJZBP1WfTLcsHiMdQwzKzzFz/3Cb38ktfojZdJ+O/MYy4ms5M7PUTvhkCC55
	cg76pvxyasMvcwWfCAR/K7iobLpE0ArPuveWnHAlbyHoMVOq4GQ/I3xfu8Mj+YOdtA5UNRCIfP5
	TdJe2NToPGe20m9AW6EcBAXsfSaH1FgGVeOw8djy1jJ7yyaWJAE8v3ngfqDmx33WQtU2XLo7pyr
	qMrB2qQ0RkgK3tLUOMoCfhQQe7EmIVg5oe9ADlqKLWGtHo4GXrLoPu0KNs19IHsy6g00eBbscUH
	/fBprZ+ZxP7EoEfSiP+zUxiYcKom/QwOTmInslnfKiLzWa0W2jJgGEkysBZ5wJ20GTqtbxoOn8X
	uZ00ovDzytbdyU1pXwAL8/LvHT42mirDj1idlNuaGLF4fqA6Qof4KsQy7ZWMD8iRKKm93/PhWpt
	XIee1KCoC0vRm8bqYLCIcfXGM=
X-Received: by 2002:a17:903:ac7:b0:2a0:da38:96d8 with SMTP id d9443c01a7336-2a7188a2b7bmr93997755ad.25.1768811346452;
        Mon, 19 Jan 2026 00:29:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 25/28] influxdb: ignore CVE-2024-30896
Date: Mon, 19 Jan 2026 21:27:47 +1300
Message-ID: <20260119082752.4120991-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123619

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As mentioned in the comment[1], vulnerability is in
/api/v2/authorizations API which only exists in 2.x, 1.x is not affected.

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30896

[1] https://github.com/influxdata/influxdb/issues/24797#issuecomment-2514690740

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2f1d7a8597596d8e51a6f6f3b62e7e5f153f6e73)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 5dd5644c4c..d8279492ac 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -70,3 +70,4 @@ RDEPENDS:${PN} = "bash"
 RDEPENDS:${PN}-dev = "bash"
 
 CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
+CVE_STATUS[CVE-2024-30896] = "not-applicable-config: vulnerability only exists in version 2.x"

