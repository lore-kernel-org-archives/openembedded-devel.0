Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C4C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:22:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.57441.1720030959059513689
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=VnHqLQV6;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.180, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f9b52ef481so31118985ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720030958; x=1720635758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNlAuyEREhh4Slt4p/uJDwNGKn5bfTjGp08/qBeGuIc=;
        b=VnHqLQV63A5BfqJgIGT3fEpHIFnxCyGAww8qTtlaQploZodbjtZoj7HE6yncEa3fwb
         THxPWqSq80A7EnGiSAbkDGeuEFBwwK74dHaAF79z1flYxvvBK8OSXaPBOjf0y7CktKF9
         WiUr4bdqOTjty5/jtskRVSPvNMYHkjkInh2fwe8GZIDDQtTtjjrFD14iw8JNDErZR9ut
         7TQlAutrSbCePnfZz64Bax1YpJDfIOA27vjqsx2RxvvI5yTOSpOvBZvUTnw6sRK/BGX7
         CqRZExihMkZ3tkdP8wkdDcoHtMSR0gyk3UnLiv+II8u2uQwdqBB9+cRWZIjNwezxjB1V
         CgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720030958; x=1720635758;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNlAuyEREhh4Slt4p/uJDwNGKn5bfTjGp08/qBeGuIc=;
        b=IWHNhoVzbIOQbXTib1a0oeaHzPSMwP/Xb9PevJOnPYRAVpjwjtTZYfraZfUNqxiaO4
         R2Yk55B3Zlr2vxK0VJMbxft+9Kb7bk692t983LHp6T2xYGy+66ukqItmEoKOOgOQ71kb
         BCAoOgBJY3aA/zIZ3gaZT2e9sHRPDJAXygDjVd29ku0bpzjBV4jdPr7kEEZPq5wwy601
         wxQQBXuMOdqZoZlFxYPoEpMB22CNpD4YszcM7onCnVAJeH6zb0+A3Rhd8LiZcZAl5pfP
         DYNZb5WIU1WuAhjLMqMMoTuM4c2CnlddAFcQsIl5gUyJdHSQxkPuOn4xyF1fl8F+vtPZ
         1hkQ==
X-Gm-Message-State: AOJu0Yy3OmKQEMrCyfp9mVhQjTGzrWWeLrcXegpm5gszarOZnyThYQCf
	pkeJpiai4FDhTfrPYOqYbRuMq369s9zCwWXgpW2uP1G3VAddZ9Ldfm5qu1/BVQ0mwQSxajryQz/
	g
X-Google-Smtp-Source: AGHT+IG1WqyMUl4hYa7WU7sNzDBbAmlrrql8RFXeCAgme95KB0ZueKZmobXsmFZ4mQX2I54Dm0QCtA==
X-Received: by 2002:a17:902:c401:b0:1f9:f3d3:bb2a with SMTP id d9443c01a7336-1fadbc7384fmr102847835ad.9.1720030958374;
        Wed, 03 Jul 2024 11:22:38 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8d8esm106344135ad.47.2024.07.03.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:22:38 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 0/1] redis: Update status for CVE-2022-3734
Date: Wed,  3 Jul 2024 11:22:34 -0700
Message-ID: <20240703182235.2087-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111243

CVE only applies for Windows.

Ninette Adhikari (1):
  redis: Update status for CVE-2022-3734

 meta-oe/recipes-extended/redis/redis_7.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0


