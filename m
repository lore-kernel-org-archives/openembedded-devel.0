Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.931.1632338568977346812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jy3pdrJj;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id t1so3807785pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pwIPAT4arR2lkGOgaShkFnkyMR+s2D2k7P+B3VsiRzI=;
        b=jy3pdrJjn7TR4CgosTah1x4vqWOnLBBjzwm6gNmiCf5aC378h7KZO5sFbZnqCuC7/c
         nDgoeW39BwGKwqInHZeAzvgGyLuydadz7NC3/rziBn3cQqKagKF0f1JH+J3nDYP+2Pqi
         KrzNRjFAn50qlQyrfCKj3yXDv+TE4r2irP7ec4WawKEO2ZjhgOeuiS+7XTct42RvFdh2
         qPMoWBIZglHihnjt358kKbvcP0xZzSuGiG8U7RVjBYsOzqd2m4K5outcSH5QjvyEIbKV
         HBQhJluz+B3PjP6/fupKOJxyfVHxs1K4jgY+Mn7ucsf5Dz4GMUMNU1ZdZOUfRgVdHyIZ
         YXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pwIPAT4arR2lkGOgaShkFnkyMR+s2D2k7P+B3VsiRzI=;
        b=blBSJ1xF4qRHYE9UWnlDoGIq9LUHM5OaqqY1LjPVhu0Hm+sV0Mu4eJTFUy5nnrj7iV
         kx2idkuYbz5OHnSU+W5dAaoMSbw44FF19on5sNTNizRkiDwLwZJZ+lOdlVrfBUCu8q3M
         lTQUhT0SsiQdMDa1u3sQKoOnCxyOZgnyNUgywlxebn7ofLofFTyv4O1DYmhczqXg3unu
         MF1NbqzazqLM4jZ/9EcytW1e3hB8V5w2is1dJwcqRhd9/0AZqLbIV+QCxTtpZME6ZeC3
         q6svMY9lSazX7SLElxo/clZfglMNufvOUa7j7NPXIv4h2mm8S6+e9488xWmI4U9xsU48
         YhEQ==
X-Gm-Message-State: AOAM533zJ3CHGyJ5rAq3EPzabSVt/+mBmbi7ebGqKdw6++kJAzpbhNt5
	UBwLwIQNlMZ7LEKMnsfzh5M4ZdWr5H57bw==
X-Google-Smtp-Source: ABdhPJy1C0pP4ZDIUJ0wv0aoUbxPW8IGwQSXmRRo2zwt72FtaEs7i4XHgXbTi6yYTN8fespBHj8UVw==
X-Received: by 2002:a63:205:: with SMTP id 5mr463280pgc.433.1632338568277;
        Wed, 22 Sep 2021 12:22:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 37/39] ncmpc: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:11 -0700
Message-Id: <20210922192213.3062719-37-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Did not find pkg-config by name 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
index b811297095..aa1a234a64 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE = "https://www.musicpd.org/clients/ncmpc/"
 
-inherit meson
+inherit meson pkgconfig
 
 DEPENDS += " \
     boost \
-- 
2.33.0

