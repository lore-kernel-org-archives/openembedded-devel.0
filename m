Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.3213.1598385702581307617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 13:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id c8so8944973edn.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 13:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMm3vPxw+VhILW/xhjoKIWGyoPNIJEvqio3vA+8Sqqg=;
        b=pNuho60S+j7bg7icmKXfSMKli6szEdHQbozLpidOdAOdwpSJKBipfXfQ0MKI9nXNlp
         ryyoiVtsVtBtXVtowVhMwG3TlGCdBvFFowMlXkEj3+pWTsvvRqpRRnyIU9wq7yc/1wXG
         JDJEOGG/0liDXn/+yop/f5KOGnW4oX1CVqbvL9yD8wi2vd8hvumh58mwTRyxseISTrNP
         /9wm6K7FCcG0WVeQr3ePzfyVFW+2oL+agvbXhvwIYIMOjCNHvDOFLnzI+oUs3CyxYNwy
         fvUKfE0kjE8p7pKhPy0mHJFDcUaC+2T8gV88pKMlx0Hha9+OxtXVumeROWCeG22m7gW7
         VzpQ==
X-Gm-Message-State: AOAM532DdfaMBZ41YyAcA6ZtRVgd/qkIZcj+M+Q1xwSlNOi5E9+9BrvU
	OyLAv1Mw9WZEaeqvQ+V9wBHtksiAGo4DXqoO
X-Google-Smtp-Source: ABdhPJwdeqUI2hVm6n0JnTzeq2cfiHhsDcuCZJg0D0N+6q7f1iJIa13gTmOgwENHPtXUr6Ter5Egpw==
X-Received: by 2002:a05:6402:17a2:: with SMTP id j2mr11761379edy.79.1598385700582;
        Tue, 25 Aug 2020 13:01:40 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id z16sm14592676eju.96.2020.08.25.13.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:01:39 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] asio: extend recipe to add native support
Date: Tue, 25 Aug 2020 22:00:39 +0200
Message-Id: <20200825200039.2025025-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Native support is not required by anything in oe-core, but may be useful
for some project specfic use cases.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
index f381d12fb..0f79c0787 100644
--- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
@@ -24,4 +24,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
 PACKAGECONFIG ??= "boost"
 
-PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
+PACKAGECONFIG[boost] = "--with-boost=${STAGING_LIBDIR},--without-boost,boost"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

