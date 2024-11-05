Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87365D3E789
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.30319.1730838724954530459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uhb831E7;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea053b5929so49036867b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838724; x=1731443524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOcjld49qsOQiQfVYjENAkODC8D6fbLZXO6ctaRZbdk=;
        b=Uhb831E7SdoWZ3U8Y9lFU8hdbu4u3QcG5o5Hxb0/gDc05Mb2Fd9AOvNVj3K6V/9NuG
         p97XlDSV+ivdRlZEOJ+P/LbYZUX9GCizm/4TDNie/TYHTKrw64GDHnmm6YofnDlg5v4T
         LewvzMQWTnQXDj+2NEWySJ02SzdCl0U5weoqkmNH3dW+bN1CwhPleMwqRl+aRzWODEvB
         pwDsD2Qx2thVYsUS27Yxott+E+YkaPGOaVRWsfcphABwg43GY2zNfrzj5OOyTsGycfAm
         Wag2WchAo84IpE2FSm27VO6S+mIR2bJaTip3Fnhm9rY62MMH4IQ1+HIdiuyJPrcmMkQI
         PLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838724; x=1731443524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOcjld49qsOQiQfVYjENAkODC8D6fbLZXO6ctaRZbdk=;
        b=SIhzVeTTQn8f5LSeAsuqAjxLdNzb9aC2WQSgEUx29wIpjERR0kNcI9Gf2mFOyjTXNa
         ExbqSMjy52mSjot6BKU3aaCXYpLo3JsfoJARdNovX60qw8HYj5Jhy6h1Xu5lmEH9aNpo
         PZNtUZzCq7zrmYQjDh9KAiSnEG2XoVJdXfd2E0nFrkWkr+EvIsPAm5Qev6JHuC7HMf3Z
         RiCoijONObOx5iB6+r1Xo9H0vs6bnSQIyL6Z7cTFCYChKykGlj6nDVdOcxw/UA36ra2/
         Iu9HxuV9HqvpdC45tgZttg/rVvKYfXdPSrM+RVTJ7hTZz76Jox+eSRCaQNxecY3MqF5y
         DPpw==
X-Gm-Message-State: AOJu0Yw5BQkTuI9cf0AlX/CSFjgm7mIs4ZBzxyBlJmUnjETMBuhWEsKT
	QyjTka1ApMfQkyqs0IVDpyl08cbMXt1H4jOTG2rJu62/YGQMoqemihSI2vRh
X-Google-Smtp-Source: AGHT+IGjYHxAaLcW1Kt/Coc6OHBsr0KSMEeuDvs39jIBYoPfmpcoU/sx8RsyUl6Hwc2uyS5Fyx9O7A==
X-Received: by 2002:a05:690c:7482:b0:6d3:be51:6d03 with SMTP id 00721157ae682-6ea64b27563mr167985297b3.23.1730838723555;
        Tue, 05 Nov 2024 12:32:03 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:32:03 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 111/161] xsp: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:36 -0500
Message-ID: <20241105202827.3104-111-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113628

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 32f7bae0d..437e346fd 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -11,7 +11,6 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
 
 CVE_STATUS[CVE-2006-2658] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue."
-- 
2.43.0


