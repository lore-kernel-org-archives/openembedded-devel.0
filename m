Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1111.1620255961369894495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 16:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZqK4guS7;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: romain.naour@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id x5so3538156wrv.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPH24axkpbi9SvSeZTGCLMRSrv38IiEigzS6nHseFlU=;
        b=ZqK4guS72rSbExBIj+1VIYw8VeEb0oCMXx3GrmyvAudrIQQxOAnWDEKkAMGrfGKCW3
         NIUkUF5L98T6Us9FnG2bJNd9PSrhZPk3xgql3pcIh/I07EboCT1+v8Y//yGgGjjvAJhD
         5Ae3VA1agPtSX4tXHt6QFu7HQ9KtTcrJooCTf9yuYm+UdlZNc23oJG51PkKbBUbu9Gg3
         xJ56LeHbpEixayJEegpUbZCGywEoM00pFi5EBblTM5UbTfbLUlliQJ3wDLGfHEu6X2gZ
         XDbGL2iujya/xQIO5/+q4p+L6ScEhTBA6C6RqzOxS6kM70NueSX4iUyKDoG4Htq3W57n
         GMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPH24axkpbi9SvSeZTGCLMRSrv38IiEigzS6nHseFlU=;
        b=E3UmEf4qf+O3eyQu38oc5seqWwigA+YxxByb/f6orbNDGH6N/a93mFl5SkPR1+6aF5
         JcHJrUI7zGWG+Er8mJZtt2VWvgZ4z1mhDLUf1ed9+fc73p73USEEsXPzVpPBDCX/lqyo
         J11wmw1kc+pRcUW5Sle+KEqJKnenZHFom/XyV76DF0rZJi1B1h4HGudYPqrpMHtPWX+m
         JSoivfqumQid3xaf0X3vpw2DtPTuBI1zgNkyuOGRIK4u5eqL+6nDW7AtqG9Gyf4isMqS
         1/4y4QnRHVf+Og3C8/OJynNTADyiD26P8mzEa2Z4doRN7xB4oc/yBsPeW1GdKECMQ6a8
         FyfQ==
X-Gm-Message-State: AOAM533lfOQjOO4jnXCBMq4zbhCrPoI0qdcKD49Aa91c94iBxmWMOmGB
	Lnyd53fN+GYzAaOr3tHLD34Vw4CLRIA=
X-Google-Smtp-Source: ABdhPJzqL0w/JAYXeSnq/7Cb6vN9Ghh3eZXNGyaSqt8/CY94fD0vYvOGgO8bVGhz7XXbLes9EJ6txA==
X-Received: by 2002:a5d:654b:: with SMTP id z11mr1411266wrv.167.1620255959933;
        Wed, 05 May 2021 16:05:59 -0700 (PDT)
Return-Path: <romain.naour@gmail.com>
Received: from localhost.localdomain (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
        by smtp.gmail.com with ESMTPSA id u2sm6924174wmc.22.2021.05.05.16.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:05:59 -0700 (PDT)
From: "Romain Naour" <romain.naour@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@gmail.com>
Subject: [meta-oe][PATCH 2/2] poke: add optional json-c dependency
Date: Thu,  6 May 2021 01:05:45 +0200
Message-Id: <20210505230545.2574514-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505230545.2574514-1-romain.naour@gmail.com>
References: <20210505230545.2574514-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From [1]:
"The poke machine-interface uses a protocol to communicate with
clients, which is based on JSON.  poke uses the json-c library to
parse and build JSON strings.
If this library is not found, poke will build without machine-interface
support."

[1] https://git.savannah.nongnu.org/cgit/poke.git/tree/DEPENDENCIES?h=releases/poke-1.2#n55

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 meta-oe/recipes-devtools/poke/poke_1.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/poke/poke_1.2.bb b/meta-oe/recipes-devtools/poke/poke_1.2.bb
index dcb547ff8..dd118a0aa 100644
--- a/meta-oe/recipes-devtools/poke/poke_1.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_1.2.bb
@@ -24,8 +24,9 @@ acpaths = "-I ./m4"
 
 EXTRA_OECONF = "--disable-gui \
                 --disable-libnbd \
-                --disable-mi \
                 --with-libreadline-prefix=${STAGING_INCDIR} \
                 "
 
+PACKAGECONFIG[mi] = "--enable-mi,--disable-mi,json-c"
+
 FILES_${PN} += "${datadir}/emacs/site-lisp"
-- 
2.30.2

