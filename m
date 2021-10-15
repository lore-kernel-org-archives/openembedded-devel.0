Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8935EC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:45 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4255.1634338544678902070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=wQrJpdDt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so48010297lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tUnYbyoiV+0RwIQ1WY1JwEh+3v5fHzICnKqcElV7co4=;
        b=wQrJpdDtCrzF6gLhJ+EeCug+BYGsCWEyogWhVuD/YuQiZ5YdfxjwHmIj1KKinzpjXo
         gDkzHc+gzpoqfQiw0sXMOwCXd85Q44VZY+ANKBqVMrNdoCXnlbhaN20y9DYLfWta+V+K
         I1VNs/nudtWjntz8BfZwKCvJa+kmb4XG4fdgz74AmLXoCrwEJ1jK7q69Q2b0jn5sfdlN
         TI8rMQmfUWx9cGsYHwXoTxf9KgxAItWbDydTN7zOBbDYheME8TGJ5+0l5gSJbo5ZkVER
         fzXENKbbpeF90+lxlVic0j0jPHiqRNpLkdi7SgvtAwizLHFAj2Ec8ToIebNrMz3YyED5
         WoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tUnYbyoiV+0RwIQ1WY1JwEh+3v5fHzICnKqcElV7co4=;
        b=5lH3rjc2gL6ogTcrVVLyRZc5e0ReQ39FqBC7xvMrIUMWzlL5vrVBM9JGUrfB0p8yod
         dfkOwdZHa9tvhTdl64FJxKKDDj1EA0YdFj0PYMDynF+3giPaqyAcBgKCD8uVhHcAY4Wk
         iLWQoGIGUrKkqaT+SoCh/CuI6d1X2jimifbbL28RuT5/RV5isLrGEXMgTGO+4KLZJ9Pd
         sIYUZrXpAyBgKjpM2sijXpaluOfaMCZIUq/xhnVrtywVCR1QBaec4PgstG4rhWQYM65E
         4Lp7aVidtDknWEbQt1Sh8DUUaHDOspRahjLIoYjaMmvUzIFDplPurDPdlJUwZyx05zdi
         wrdQ==
X-Gm-Message-State: AOAM533/R66NSEAN2e7qJmWcLa0HhOJhZTrrel1egeT9POVFstJDxVat
	qcacFz6Z3zu8f3Wg0xIXMSXlbDWNvoopeBXr
X-Google-Smtp-Source: 
 ABdhPJxb334U/XB0lDH9rGexiBotzjlU5YwMYeXGXwgKDyRj3F02/GGUp2m1gtdEi0iJ9ajMwjbDEA==
X-Received: by 2002:a2e:b804:: with SMTP id u4mr15584950ljo.425.1634338542609;
        Fri, 15 Oct 2021 15:55:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id v3sm698925ljv.7.2021.10.15.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-xlsxwriter: update to 3.0.1
Date: Sat, 16 Oct 2021 00:55:40 +0200
Message-Id: <20211015225540.4161742-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93338

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-xlsxwriter_1.4.5.bb => python3-xlsxwriter_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.4.5.bb => python3-xlsxwriter_3.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb
index ffd3072a9..aeb27cef4 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.1.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "0956747859567ec01907e561a7d8413de18a7aae36860f979f9da52b9d58bc19"
+SRC_URI[sha256sum] = "3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


