Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10AED40CEB
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.30415.1730839001371319685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkdTPouc;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fc62b9fso51099067b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839000; x=1731443800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg0GCL/ExErAHwTRV+STNgGBhonZz5QJlELLFSOWuFw=;
        b=OkdTPouc0HETxKNvodWBEgo4GLUWA1GWkvH1cH3l1Qgwg2mryru7f/72aQnLiIq4xH
         omksQNOW4doWHWlM6GJ1lbIWF3X8TCI5zFdIxJocGnB+M3b0r/zuh4kkMZcJiq/25rmv
         j5/cN6THKujvZzT+6RpJjfaUiJUkeUXcckF4Dg79cJWsebI46bj/TVW7Yi8eYCeGvGzD
         DJVb7Vy94obGj+CaAWP1ftJHWxN2gQFwQdSdB6dajBkDhSqgHbGF3naoSBuukye50mjZ
         YXwjY1gj3wH55rQQ4JJJQBkmbUfntBUBDrcF8ERrMCHRcexbHkpPc9sHXs+rvoqoa2rQ
         366A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839000; x=1731443800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg0GCL/ExErAHwTRV+STNgGBhonZz5QJlELLFSOWuFw=;
        b=s6T+n1QkRG7ZMptfVE4v2wf3jLHNk7M9lg8BKkGYIHlZdO4G8Dr5cPIFZuHZuz9H/2
         THvoCJ4Pc0m7958DHRtWRK8NtSmtJ8EyizdExP6AhXHF4QuhprLOgIqb2jv9XPsfQbrk
         Bfpium5rOiP53T/Ops2v8TR4dLRZwruVrXFTgvrWVpZErXhbe1raJRq8kiapG47jVTW/
         sZ+K4oqJJlenn+TfaUmmvEUDSZXRUlF3FPSN6lqZCgEodI54VN09nW/2mrz5apiu/tbr
         CORBgYRb/kiJCxKh9fpOSzHQ9FbrGYBQ+7A5UqMeETBCRmulW/cicKPGviPJiCd83rSQ
         tK+Q==
X-Gm-Message-State: AOJu0YyxBXiLvfgtEbJQHtL/a38VDoCGU9BgRhrluiWvR0hyJHxxEXWT
	Dqu1SWQjpnn0Rc7YbbjQCCuj9PJEVB09HMZXh2YcWr7IoiWBU3sKgbH5lTVA
X-Google-Smtp-Source: AGHT+IHXYLPGbhWeOzVQdiOn/LcJxAE96FiJJHnTGT3FYlPV6peO/88U5xOWRcHHMbAMfdoCVlWcCA==
X-Received: by 2002:a0d:cdc4:0:b0:6ea:7c35:e2ab with SMTP id 00721157ae682-6ea7c35e56amr87417007b3.15.1730839000134;
        Tue, 05 Nov 2024 12:36:40 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:39 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 136/161] libtar: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:28:01 -0500
Message-ID: <20241105202827.3104-136-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113653

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
index c7501ac68..9be560196 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -24,7 +24,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
 
 S = "${WORKDIR}/${BPN}"
 
-SRC_URI[md5sum] = "6ced95ab3a4b33fbfe2dfb231d156cdb"
 SRC_URI[sha256sum] = "50f24c857a7ef1cb092e6508758b86d06f1188508f897f3e6b40c573e8879109"
 
 inherit autotools-brokensep
-- 
2.43.0


