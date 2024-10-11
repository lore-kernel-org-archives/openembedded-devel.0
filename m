Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE6CFD2F0
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:55:19 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.7052.1728636916903097886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=it+tjVtz;
 spf=pass (domain: konsulko.com, ip: 209.85.167.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398a26b64fso1798626e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728636915; x=1729241715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzNv4hVp6EPWREn2fZjHzLT6UzBq1Ufg2Y3aAfWYI3o=;
        b=it+tjVtzQf7eSG2XOypeOHpVvzkqdHENFFDNRjoIhDs3qspA35CnmsIUomoDmHcvEb
         KDms8epNAgkPabqUzPLb6BcvO3iDo6GAHifSWyGaxS2xZRk7kaRP16zbsIo1NPSlEwI4
         qih6G6dw0ogag+jhmBksh7zBiD2Tnf7gNEvt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636915; x=1729241715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzNv4hVp6EPWREn2fZjHzLT6UzBq1Ufg2Y3aAfWYI3o=;
        b=JfDaTgeS6tV/txJvY+UD88QP0En39LjxitdreJylTdicGkWdfP0k9UvKUAEsKDFIlB
         KHEyIpFzY1iTzqb36v5zJVupy1aqAb5xzGwjytN+DdPfcrleqOOUqMdMJiHJRhcSDGdl
         FkRAx1/AmIQp2WggzhoGoljdGeeT7QQWNBuv2EuDTD7fgEH1tZxr2GNiRiVDbQknkSzl
         7I1gYxNhdzK6Y0Pwi2YwnWtGazniyvEY4LvuZltbakIWTZa5Bb1i5js4UpiSKRQozmmb
         mChDfGI0WyirHUA8S4PuMksmNXEVn8kV3y5gxs+5RjgnLWf68KSWoRbzsc31MgUnmfMt
         kGFg==
X-Gm-Message-State: AOJu0YwAXSFWmx8dpiYZjlGvkUF2LTJMbnzJl4zSAc/FzZCYMgiY8b8r
	jSW/HQPrhGQqe0nCclksClCAbmd0CTP5yA6pcjHzJK3yT0Ne6ow52rKqcGxfGcLEl19OvMPH8Jo
	3
X-Google-Smtp-Source: AGHT+IEcHC+XnJKUxHbu17WD85PDkAE72WXfO7sCUToi/toYS/J80BeMEZj94O0A4nlFxxt0g/ugdg==
X-Received: by 2002:ac2:4c43:0:b0:536:7cfb:6998 with SMTP id 2adb3069b0e04-539da4e1f18mr1042044e87.35.1728636914585;
        Fri, 11 Oct 2024 01:55:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm1713866a12.47.2024.10.11.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 01:55:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-rich: Upgrade 13.8.0 -> 13.9.2
Date: Fri, 11 Oct 2024 11:55:05 +0300
Message-Id: <20241011085507.3722721-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011085507.3722721-1-leon.anavi@konsulko.com>
References: <20241011085507.3722721-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112792

Upgrade to release 13.9.2:

- Fixed Table columns not highlighting when added by add_row
- Fixed an issue with Segment.split_cells reported in Textual

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rich_13.8.1.bb => python3-rich_13.9.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.8.1.bb => python3-rich_13.9.2.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb
index 10ce1987b..b279edfec 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "8260cda28e3db6bf04d2d1ef4dbc03ba80a824c88b0e7668a0f23126a424844a"
+SRC_URI[sha256sum] = "51a2c62057461aaf7152b4d611168f93a9fc73068f8ded2790f29fe2b5366d0c"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


