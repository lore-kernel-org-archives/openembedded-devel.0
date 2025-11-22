Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84928CFD2E7
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.965.1763839891260847102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hRlMn6+R;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b379cd896so1696752f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839890; x=1764444690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4QzV3cS47xcl7482gfg/MO2kRj1kt2AhYdcrQzdbc/M=;
        b=hRlMn6+R+014vfFGHrna7IunwMKzSLjmOYGcKiNNIQftOTb9N0HKDEsEe0LdgQYdsT
         b9m5/W+xO5sW3j00FECg7Dqyo/qVrh8rBsx9NJvtv9Ih4v+qAqAoM0CLkXYm3jyBBLbK
         yc4sY3Wg6uW7EYpSAFHppW3fAXehyyCXccL4SfCj/grhqTW5voYnYdjpyayD0LoSNmhB
         FxugRXyR244BXr8Io8u4N9WlFbZ8tujLmoamUXanb6lTM9D9Gno91xvJ/9PYdC/eFJF1
         oUsHhD4arIafJV+IyiRzBx3kg+j8OihQZ/yo6Vu9lXev2IEJ+MC4v5CfCvZ3Esy+DBDO
         Gp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839890; x=1764444690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QzV3cS47xcl7482gfg/MO2kRj1kt2AhYdcrQzdbc/M=;
        b=YNycJvv4i+mTan+0/dLl3rw8TsyEuTE9l90uto1JJgrQb91gdyEclBSXkgYlIHc3sp
         LJhJ4sCUXUI3nRYvxFK1F0xWK+W7Qb53NE4jK2x7sw/oPMmHk/OI0dmumDm2rn0MOp7f
         ZwsruyCHNHcrrNUjs+EN80NfYDneVQaqj8qFtMq1yvU4JLHZ+RxRmRnj1fBH9x5HH1f7
         Miet+1b0aUtNbtLnbf2yEHZ0ZSfKjvErA/88d0uabdI9qJXJdc0Xdwewe5KXwgxYR1Em
         So333rKQYvwJpubIZg+oefHVx4TS4o3kGBgjZWrXEuN13pdKFgkablR4sXSmKlvDqVop
         QIEA==
X-Gm-Message-State: AOJu0YxdUU9blAf9ZRO1sbfDxzk+enp8hr0eIRMXbRuA6VrqxGuUbC6m
	pEZX46zr6RLhHXsH9j5orDjNd2X/Lnk+k5La6R19IyJ0qUz+HCqipZx7RHTu98Xx
X-Gm-Gg: ASbGncsL0oJ0aKh0mCimD2O0ErlrZqNDoGKs9JmVwou5g+aI3+9BcnvPS3VfcSIy+aU
	c7dhuZ0MB1Z94a/WHqXkpmJkwUZKYF26JDQaE7bfVpHwUrqRW9Gzm8McEgNO/UG45EZDmkG5+QN
	LMkDKIej0E34dsHBwzd7Wv6+LMxBgdrt1zBeUU2bQBHL+cdic5ZHmYvi7gWBROMtv0fhcwZvUnR
	YYCjRN05V7ubZPqRTDaxYQBiUpUrEDh6IMq+E7HEbri0CoKOMsdeS+Wq6GzoMcSkk3YOq3xfzTl
	kUBrDM9byN0PRLAJV9E/nErCgLSgnGKkHEdDj2Q0eWroK4zH8V3nqlcO6TdgdmJZhacP4uAT2fu
	aNod9QiH7D0TfHre9r+o0wtfmPFdvQbmJJ/vlfbuVsuX43dx9fm3VjbLheeHEKOuQ3qR6oMpBW0
	q/HJmLVZFl
X-Google-Smtp-Source: AGHT+IE/uBMfCnmQQcq9zafL+NQ0WbkEYpaw8/oe4deY8jod76ci7Iu10AnmpFZJ8jenjfxei/bHww==
X-Received: by 2002:a05:6000:228a:b0:42b:2eb3:c90f with SMTP id ffacd0b85a97d-42cc1ac98b4mr7003109f8f.10.1763839889409;
        Sat, 22 Nov 2025 11:31:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 01/10] monkey: Update status for CVE-2013-2183
Date: Sat, 22 Nov 2025 20:31:19 +0100
Message-ID: <20251122193128.1703871-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121979

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 17bcf478a512c7d75baa3b68e8f650aff7d17bbe)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index d3e22757c4..7b605158e0 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -86,3 +86,5 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/plugins/auth/monkey.users \
                    "
 
+# cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0
+CVE_CHECK_IGNORE += "CVE-2013-2183"

