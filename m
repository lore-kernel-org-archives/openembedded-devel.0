Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71ABD36129
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.27873.1730831929486327166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PojVB4gz;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea7c9227bfso12407567b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831928; x=1731436728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBSPyyjIyEi0nXe81cGU8H8boKuqi45oi7qPYc6lUZ4=;
        b=PojVB4gz1MHFLopOtxfu69LcTpjsOHq8oLfuRiRg1odlqQ8n+HdxjZpa+TN7ld687t
         1OsbZYp2fKitug+hFT0aUMK5bY9KBWw2uZYLrs9AytG2yeDntZfynQBLKLI87JL0I6ik
         aZvwTBw0C7wOft08pt1H/0ePp2vHIvlDu80N0EiDs2iIChpYNkHrU3kUdLE7829Sd0XZ
         4329VKn6oGC1u6dMWJzG938O8MJKlNjD0rmEidWmPpsVolmvv025sBorLw3LkhuL1jeh
         kebPH9OMR+d/yI3MDzkmqBDNdOWmA3WcMvjRwamzx2wFigGvVnHyrQI0K9xpnQ5d5uok
         e/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831928; x=1731436728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBSPyyjIyEi0nXe81cGU8H8boKuqi45oi7qPYc6lUZ4=;
        b=urRK5ODhzlgbITAdyB+esmTJ4mwznxp8mgpDHn7Htimbiu6/fwkW4Qakzd/Pu3KKdV
         4Uyl3j52r+DN12KKrdzQN5gFLeGVIBu/qzqmBq6GLIr2TlXoLoHi1YOwRLB4Htpx911D
         njNEcv9ZBSb+rEMkja5rQIJjQ2Ys1bcbNCC73gX5bV/Bdl5t70ZgerbkV+UKH0K8Lfvc
         94RgoevreyaBXEOvQmI7CLikORIxstl+zwFhMY0fEYEQVJ2RVM8A24kxrqYlrNDJBAxM
         YmdqUr0qi5rOC41yssw3iX4Z9ksot+McYK2owkmp6JOJCwCq/4I4Pe3e4oXG2/rNWrXZ
         yC6Q==
X-Gm-Message-State: AOJu0Yxh38QACqy93UJPIdN10zIbXL5cEPnL42zKimGK41jmwwOuv0Ig
	eR788JrppzBsYnw10WRXj+XfI+KaGsuFrHBIIbnUScQozn4RiGJteyKTAAVy
X-Google-Smtp-Source: AGHT+IEe3mWWgW+tqMvLaF4/kvKNpK6gU1obzqWbkfzkYCc86shnryUsDJF5nLahRAti3iFcv/dQnw==
X-Received: by 2002:a05:690c:660c:b0:6db:d572:aa7d with SMTP id 00721157ae682-6e9d8a21a52mr353038157b3.19.1730831928166;
        Tue, 05 Nov 2024 10:38:48 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:47 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 061/161] libsigrokdecode: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:37 -0500
Message-ID: <20241105183658.34982-63-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113576

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
index 24091bcf9..4ea2287e4 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
@@ -13,5 +13,4 @@ SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${P
            file://0001-configure.ac-add-py-3.10-support.patch \
            "
 
-SRC_URI[md5sum] = "7ba4ed4ef1f06ae96979751e096c2821"
 SRC_URI[sha256sum] = "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
-- 
2.43.0


