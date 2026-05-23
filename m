Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795BBCD5BC4
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3034.1779512472107403408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IIBLYgfE;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-837dfccd950so3831394b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512471; x=1780117271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U6btIoaXdTIXmOeU9VEuTB7JAs3PB9nON+sR7J3rMg=;
        b=IIBLYgfElMSLUroMP8ddT4IMZBIwyfsca5gnKEIwtjqukjRJxVsRCT/YzYhh2UCaup
         E2nTQG5CK8fPgtvgdkUwXX5qOth4ejCCoU2cT3PPdN5LhNCZ4vWF71SxBaLMU/hfzVrL
         y4OGCmjcNfFClU7LqEYXPEf3f0inr6tuebh46epY9ObU5gWz5QECMWjfzMscxq6GmBGe
         zpBC3V/0TdJnmpH5cc9cGZEdlt6TTxEIuf13IAkehO8Vs6dXayvukd4n8O1EDm6moAaN
         eQu23Uu9SnwVx91RcD5k35Enr7skaXOeznGeJD5mDG7SfT3Vjk0iYzQLKp5QMyZQ7WMN
         G0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512471; x=1780117271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2U6btIoaXdTIXmOeU9VEuTB7JAs3PB9nON+sR7J3rMg=;
        b=sjDr3Oy4wdA/1L9z8wH8qvOI0QA0RebO+PzGEDJke3qs0lgS9VNhDSuhjM3uon2p62
         MWTSvRh5HpxvPCtoqczk+3tqA39kBgyUygaKZ9R7Vn1VTYhJ82JlqkFYi6hHbBWGKKaO
         qMj/0WPst5WPSI4SSnRM2ONpLks+QVZDcCYQRuaByGQJV3LRp4xziqZhF5/Vrymb4wzN
         cnZsAlJ+uB5v97E3ZOKNvOUo7DpfjKNHGUmAt0Yf/RWtd3Da0oMlO7iB3T4K7Nxao4dt
         hMLrbK8FJzB8KKk6D0F8SpIbL4UD3nm44g6ywGFKLutJ+ifOfd5YkVqz+Weruo7JgHTT
         Jadw==
X-Gm-Message-State: AOJu0YwYXLhy7P0UWunLipqNcgFlf4tEMO6ibSFAwcJj4/BAUYENPu4u
	/BIf77xy/UGxtd7ZFxpjjqgtk6IvrysfvxrkhKVrAGtLL4doZ3WUMj94Tz20mXRe
X-Gm-Gg: Acq92OEXMbLHpnpQov/aGN+UoUWca7yEI7P/5Yvn00El+YPVW0zOedAglfl+DZY/Wxf
	WkQAH+VEaQdFGrXsnBNrc5f0UQuHhh6AJPGR+QLwMkN6ggSgrbHqVVIvRQdYzQWxaNPQ9VqHVAF
	e1H5PkVpPa3mqKuvs2hGr7gPKdppDMEyOgGWhYqnwqnJLh4Aj55qF5RA+Z+5YNPVR+72JKXTC6t
	S1Lnhw3aQzPv80CMC6Z2J9pGyn22wYzd5/oI7aGhKkJ6VwQYE+qthc/Zn9E9ThZ3p6P6CH6+oNH
	K2SZB655LuO5tWvibWSk3Gm3khAwitXAKFPo/TsL78lwxKnhb327+dB0DU5Ob37syC30abk9bzB
	qLqMKPKcKaAImC2wHOESaONM8eaCE56eWxPbia4ekoHiWzlWb6pjQVxFvTIUBuZLW6v7S5aZ+yc
	10MacnYodZ+bEhyPmvlkyuUKc5r6Etl/BwSRl8
X-Received: by 2002:a05:6a00:a90c:b0:834:e15a:19f7 with SMTP id d2e1a72fcca58-8415f3a5b7cmr6245478b3a.44.1779512471507;
        Fri, 22 May 2026 22:01:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 12/25] bit7z: upgrade 4.0.11 -> 4.0.12
Date: Sat, 23 May 2026 17:00:14 +1200
Message-ID: <20260523050028.848327-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127162

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 84d4d96d9f08467fce3ac5ead28e8d967b100e1f)

https://github.com/rikyoz/bit7z/releases/tag/v4.0.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
rename to meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
index fa4f910e05..300d9bc3cc 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
 "
 
-SRCREV = "82f359371fda5c16c037ac0659b969334816a9c4"
+SRCREV = "9a43c9fb96003141dcb49c82843382a52afec86a"
 
 # ptest dependencies and their revisions
 SRC_URI_PTEST = " \

