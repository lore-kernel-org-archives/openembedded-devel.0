Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17957CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 15:55:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web01.9180.1761753327694577990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TX84Hlq6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42421b1514fso5165654f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753326; x=1762358126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKWcoT7RabhJkLxxsI+ikgYI+zcuc1NK7SbUQqwiNMs=;
        b=TX84Hlq6+pBe5+f3Jumix2SCwKURJ7aBAoweqZ0d69/+W3gTQyQsEYaBGApiHHAyJm
         qWyvS3RVNckUtPLu5KW0wB3r9OnJUmvJq0T/iFkdwzEqjGoH+OlEdgyxvscu8c1K7zDn
         DFuLqNbRi5ff4+TiWsZSz3zYXDg0sY+TTAgj3j1hlSpUKII+SDF0MYhAbEme5QeCi0yI
         8L58AK7aFA09DlvFDfZN5BP/NcG6CBFbcBo1Ds6+ejFmReIGkCAZCaWXGrIZwBLOSRli
         t4Dm92Zbpw1ZvTu+rbrDoNF3oxM+rSr8A4k4YDJQASf43D35oesdXbJoPyetsDOoGYoP
         31Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753326; x=1762358126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKWcoT7RabhJkLxxsI+ikgYI+zcuc1NK7SbUQqwiNMs=;
        b=bjqXLJHOxsysuOx3iktbfpsIAqp21cRsLy2aKOjXroAw4izqax6a1nnU7xtVOUKie0
         iASo8rWVHBD2P48nUeGqLR3AEmMWvEKAAtRA0l8Wn7E+wXjAP8GXJbjyj+piZu057ODV
         R4l4+thvKOCFqRHTTl5pAOKxcXdxBpy9umyONanhELrtUM8nvJ7Z84eaUW+k75Sr0LCK
         0k4b0JrbzS8PQ2iULcfXilNpJmlNmcDhqE52FANXXlyIaGkBCpUylBS4AHZnFklschq/
         arPkv0TKKIPuTgQDjneMkK3YzDNYltbnuduZC7c6FzO3s/4NPwaUHSiBbpczhCUHl7E0
         ehUA==
X-Gm-Message-State: AOJu0Yzk87H3JYwPyBYAZBYVDbU6QRhHp+ADtssdRP1UPxf6jhsGz+Ul
	f1mQHNqfcjqXIYPvyDYQ5hm5YX6EbbW4H1FzDWw8jNWL5YVYyIvqtAr2r/nOuClG
X-Gm-Gg: ASbGncuwYxdMXYGePw8zG+DTtuwjrsKV7hGq0hWJFtJ2/oH6HwDvp0mBnnnFt5TnrzX
	LWFeUjxax8ebKWUkBIslQsR7y2reQK9YU0TbhYM1qQS2RmZFMxP+NBY8SMLZkThVczK4RqpN7xV
	WNEmJjnDg2WwR9ukDq8eaG9qPLIzCP/1E2oQtjwoJmgrewBq1Zjzov+7ldjaZ4NgcWkztFlTSNq
	kgRr7lEYrOuG0MTNH0NsiXSOusFDeY3TmSN++l2xNt8riActZ8arpNv41rhKwOuRvRN+Kj4z/f5
	nGQtshru7BdClIWYKHwgzIxbDN2xhK1qJNdvt5zZNa736KDhRRoWpgD6LJe8Lqy+2mgTeuT2+fb
	lj9OUDLtzbAFYDdkOToygZBFeYqFaZZN033cahAfLeFuJuz0JAR0MDhtgcunNyylnTG5GnGhbow
	==
X-Google-Smtp-Source: AGHT+IHJZJdNMGp039DDDmmdCezFM2Y8JW9uMAzXhPPWqyEUq2TjoXo06Kl8QW0FXOXyjyaAJufCHw==
X-Received: by 2002:a05:6000:2dc9:b0:427:809:f00b with SMTP id ffacd0b85a97d-429aefcaa36mr2678924f8f.50.1761753325889;
        Wed, 29 Oct 2025 08:55:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm27723334f8f.20.2025.10.29.08.55.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:55:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 1/4] libdbd-sqlite-perl: fix ptests
Date: Wed, 29 Oct 2025 16:55:21 +0100
Message-ID: <20251029155524.3550326-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 15:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121159

Install missing files.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
index c7baeab6be..48ef7fe400 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
@@ -40,6 +40,9 @@ do_install:append() {
 do_install_ptest() {
 	cp -r ${B}/MANIFEST ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
+	# the t/virtual_table/11_filcontent_fulltext tests load these files directly
+	cp -r ${S}/lib ${D}${PTEST_PATH}
+	cp -r ${S}/inc ${D}${PTEST_PATH}
 }
 
 RDEPENDS:${PN}-ptest += " \

