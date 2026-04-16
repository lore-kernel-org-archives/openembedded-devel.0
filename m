Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EADF433FB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:29 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6946.1776318680763731936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ShKWCuD+;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128b9b7e3edso6822535c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318680; x=1776923480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABYWWzS8zWeO3H6zZHs7CIUWwn0LItLq3CLX1ySD994=;
        b=ShKWCuD+iHPKe6q5sMGfzlokoCc7YblFTuFYEH3J575n08BYWCo/36kwbKMJU8LFBV
         ru/Y31uX59bIGrx1IODzR6kS69xn/WGDfLhIdJiE2/CQF4UzBfZAGSsNBGSUc9dPh2zO
         v82XUnIj5sczHIINXjiR7fu+1AX+Djs4/H6nWUmu50Sx9gDtrnoSQzoE4YAFjnO3rucY
         mm1Bl39axWlY0KOfbvp5MYyFD/FpxoyajeHKyC8ertz4Y2oj1cM6kusYyh3t36VvkRut
         EfEIaDMiBhYRZP16dngunbxeEp9//CrntUj667vMb9PV7RlJhtbcY95xIjuCa3w3auJ+
         uglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318680; x=1776923480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ABYWWzS8zWeO3H6zZHs7CIUWwn0LItLq3CLX1ySD994=;
        b=jEin4hSbAG56Ili9lGJ8YMqDTlxmXhAMdlAQOhbAzPxF8QbdRBESBAI1W763Hrf7+m
         NPmx6Bzzb5orNC5NMGPZHpenCg5MDS6hMcwSsfKy5ZqYF/4i8B5r/+XQB5E/f+KYSR5s
         sLSMDBrmg9MMUfGsIYIQ09To0CUSJAzLU2t+exvpSjPzOQ/1txGrN7OUMKQL1cm+mOzW
         GOxL9h4f/D3Dhfz6uTLuqagjnw35U7VHhhbmCAWi27lXsykUF6cBmG0xRlWoNxl3aCCC
         9rgRgslorWumNGMPnjGZl1GA8g1COXpM0udPSz2rmyLf6r4T3oPlS6YDBMlfIx/AA2zn
         t/Rw==
X-Gm-Message-State: AOJu0YzCh5K9UgQewCFMzQj9wsdLuvHi2f+w8moxA8rgHibxQ8m7f62n
	zQ9tV6ZyqynKKTAv4V3hRL/I5Uzjc6G3dzRV54h6rb3Hs97hrkWUjMm+nU/Z8NGp
X-Gm-Gg: AeBDiesxJBDI2CyH6c9OtUpxkwRFGkg9uIZK0h9YXbzmlHS77jd2SG3bHOVdpQldnwu
	KfGF6BiOgxN+NkY18TBe103rpPu/iNn3Y2Sny1X4VmfB54IAkutQOvVC9B72wK8dh2uqLhQRJZa
	3m1AIOKr4u7pQfWJX6UkEfkoh2S43mM5sTkYwdLgHBwRqwh4Owidrk6KUBS1tu7gaHMHWzBpthG
	BQt/28I9/LICUJWedBiopEEoNMwn/MCrghmsdkimVlSRx13rFN53+KMIcgp3d9uve4tRwcyFl/Y
	556ocB0sGKvsG3sVMyj/dlnEVQs1gS35aJhpH1+bUheJhckzP2jS8r/pJbJdNCBvc1vNeBZTfuO
	LuKwISm1/U9t4ahKC/RJeoQ9qIlCmXTB0W7ohKUUjy8GlwpPw0YPBcvdR0DtM0Wn/r7OwAODDv6
	WJ5XMNpE/XreTSkIkc6Qzs/mIKceEPdwvQKri3o41MqXkfxk/PtQSiI0Uq4zQK3z5sUzuhub+22
	tg+632KRUt3fCXx8IHroQfAaNsziYLy4mD2y2AyMXgeYuRpkkPv3ZSXwWHv54NqRdYET7eaXSGN
	4kWwMxEDrQbLL8sD2iYZV5rti5QH5A6DlzYz69c8VjiGD/7Rm3jn9BZiKHUnUw==
X-Received: by 2002:a05:7022:628c:b0:128:d5f1:d593 with SMTP id a92af1059eb24-12c34e3963emr15723848c88.1.1776318679779;
        Wed, 15 Apr 2026 22:51:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/18] xrdp: Guard ptests with x11 distro feature
Date: Wed, 15 Apr 2026 22:50:56 -0700
Message-ID: <20260416055058.792189-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126394

xrdp only builds when x11 is enabled, make it consistent

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0763e218bb..b764d5dd58 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -59,7 +59,7 @@ PTESTS_FAST_META_OE = "\
     utf8proc \
     uthash \
     xdg-dbus-proxy \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'xrdp', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam x11', 'xrdp', '', d)} \
     zeromq \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"

