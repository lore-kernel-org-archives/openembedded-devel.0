Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC63C3ABCB
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 14:36:56 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.30212.1746974211088868815
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 May 2025 07:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VfoWEotf;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso348465b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746974210; x=1747579010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKyODUpEXWr2+UztFqdGcI5iVABU0JQ5SsjX3Pt6WPI=;
        b=VfoWEotfuwUv36F8teubVP7ww3TShfT+Dc7x7Q6ZAodeT2U1rdlJZM5WhJVGREqLFM
         puwEd4vt9K1p7oJyQMW02+oPbu4Q17tM5eiQmc5s5plOZPa0ck6aCpJtq0AEG/vinve8
         7EXsAqFDYakT9vDwmHodZjdgL+wp2W7UkCUbD+I7bE7EB/QUWlaTFLeD/pCWB8nSpso2
         tcFbUPjkvZefKG3znw/hqtRyKCNQmLX3o7En1DQRnjXgUweMLCa0IZAoSAB507osnviE
         a08LC3zSyp1lqv1ssayOGT2erwMvD98DQ2NPT85JAnT+kOIL8tehbYmB6ABjUhPY7xAW
         KWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746974210; x=1747579010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKyODUpEXWr2+UztFqdGcI5iVABU0JQ5SsjX3Pt6WPI=;
        b=rfglhveFN1ywXJVcC78r+EgjgoiPFt52D6WUBmqIC0mMqY7gBLpmTIbz9H/n231fsx
         aVF1Cju81Q1cFjXja0S4YVDdI/FBaNXzSK4vI+eBibiIMPw1z+KU6ZtRH3YZql7tqQMx
         92U09i4ytNXfOc2BZpB1/45rP9AFllOSegktH53ma076oIzrHfRs6nZJY5Cdonq3G8Jn
         NNt4qzMGwG0fIW5UZ9D+yd1OndO30ygxPrtD29O26TuWQqWm50LPeyv1sJ8GeDgadNJ/
         Yspqo5MBRMsVZ0ZRJzSM+ObIleN3rOky5E+i9odNpdJZpxFQXgLn0jtCxGtJ3jv57izk
         0OdQ==
X-Gm-Message-State: AOJu0Yz4Wt7ayaXOWQQPnr6e4U+3uSatOQfEZ//OqKkaFgVk2+iZhEKb
	Fbqm0hJQDRt74cn88zylGeCxPEFXZtu0muUNr1HWdjjB5eiFleB5+JrJNu0S
X-Gm-Gg: ASbGnctxIeg+4E1JgsYh94qQE1lIndZfLehOktQixDcajOLWIeMw0/TGMILehxaoFTa
	xTBz2CpHsFD060RUGNk6OKb+QeRhai/UNYgOU6jlr09rEAde8blFzGGBTOOEg8lWpXeic0w6qKk
	9bbKrw/6QVDZQrowTdIe1TNUvlBpe11ATGEytdx2hu14/Bzp0kvpEXyJ5n7etj19gQhU+qbovpq
	UzXcXp1WhmdlMfVLQMC4DxwO8tfLBrk9dutXYr29I54ojE++tgHmvDoKaq42bbOmYCAHIsFcGOZ
	iVz4HlrL162DxtbzQHmBKReDTp2SMu6tLPH1CQO8ulE=
X-Google-Smtp-Source: AGHT+IFPo6ZYS2hyVTjqtlUqpYiWVc0S1PsDlG13mJICniFTlvEY7eMmEfeG2N+naBb8MFAlNYanAw==
X-Received: by 2002:a05:6a21:998e:b0:206:a9bd:ad7b with SMTP id adf61e73a8af0-215ababd859mr15646552637.7.1746974210038;
        Sun, 11 May 2025 07:36:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::efc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3fae9sm4174945a12.38.2025.05.11.07.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 07:36:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gphoto2: Move the sed op on config.h to do_compile
Date: Sun, 11 May 2025 07:36:47 -0700
Message-ID: <20250511143647.3154068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 14:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117384

Current code still fails on some AB nodes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index 7b0f0df2e5..63993bfbeb 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -19,6 +19,6 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
-do_configure:append() {
-	sed -i -E "s/--sysroot=[^'\" ]+//g" ${B}/config.h
+do_compile:prepend() {
+	sed -i -e 's/--sysroot=[^ "]*//g' ${B}/config.h
 }

