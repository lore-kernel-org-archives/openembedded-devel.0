Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B957C433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.4266.1634338559170443514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=aKx3dNoW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id r19so46566590lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ks9hJ4qZAoMKSoCIcUZdp4aJx4Q7FskM2zSyMMb0LA=;
        b=aKx3dNoWNZ+v03oobS39Tku3HB713741TNnharZTosK8DK3435ox6DrNMOvAanDD0s
         v8u3CXMTE2cEvrZ9+Un17XUcyGQifpRGMllYEyY7bpskbRBGce25q6ULP4jTgBK3vEZX
         Ehn7rSdn2p9ywjIqUWEwcNMctXasmwNIFlf0SEF0RDZCVezRMN+lHD7iI2vYgASjDkyr
         NOOtDLnyzxwAT/c8EClzcQqlSz3OzT3iI5z2b50r0shfd+CLvJy1ddlWsWIiyC8Ep0/Z
         J0Qp3Da1E1ZjSs6oZTO+FdDXMcghGaoUTb13NWqU+Y6YLiKcpWVcyTtycHqKYway27Ou
         flWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ks9hJ4qZAoMKSoCIcUZdp4aJx4Q7FskM2zSyMMb0LA=;
        b=ZlmBVgakPYQx54z4ZgpqGOIHh8arlVZ5FmzehjyWAyw3hamajqqndL+ZpVrDMFVZgc
         YqWIeKQwxSWMzLVKi1g6seOC0XS72xA14Wlx2IAVOuCY6EcxBqOaQhg3lnQgvmx4HY24
         sc0jMxyP+rNMLwcoV81L8apUD+0DNxNVnCDdSBqeFZtU7WUJIDm2PGG4nrgpqX7IV1gD
         4rb4e/IOwI3MxdXKunlGsSChLSubLWI++2aPlx0o5SAZqbjy4XMlPrh4/Z2QTv8ZaYy+
         ER01r0zCkXRWeMUjRCoA4qqgPfJShbGG+ff+PqhHo7H8PUtwkjJgQCZjRn/xsYPORILZ
         oiRA==
X-Gm-Message-State: AOAM531B9H8qUHTDrF2qCwLTyb0I/nKW8haDjfDTVVYfnkKEWn7OzxUR
	kEx2uQqq422umX7IhWvHiGaQEWC9/86B2Q1t
X-Google-Smtp-Source: 
 ABdhPJwrs/RUKPt/76tHMJy2+vcZSvwFnyZi0cSYHtoJnBf7giExQJr6b0Xid882nOKh/b3tzf6oaQ==
X-Received: by 2002:a2e:9b0e:: with SMTP id
 u14mr15268435lji.247.1634338557278;
        Fri, 15 Oct 2021 15:55:57 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bi9sm672922lfb.40.2021.10.15.15.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:56 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] pytnon3-typeguard: update to 2.13.0
Date: Sat, 16 Oct 2021 00:55:55 +0200
Message-Id: <20211015225555.4162023-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93343

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-typeguard_2.12.1.bb => python3-typeguard_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.12.1.bb => python3-typeguard_2.13.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb
index 6b33c1795..564f98e3f 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "c2af8b9bdd7657f4bd27b45336e7930171aead796711bc4cfc99b4731bb9d051"
+SRC_URI[sha256sum] = "04e38f92eb59410c9375d3be23df65e0a7643f2e8bcbd421423d808d2f9e99df"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


