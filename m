Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.25613.1627657973888094745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LlA0LS6n;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id cf5so2105093edb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbg62XderpiIRM5N2F6YfHGz2VdKk1pi8ejYZasEU/s=;
        b=LlA0LS6nYv0beH/dHhIQNKneq/MOxTFPtf26l/Bnv4Hf6fqQ7DDVNtbgUnza3JlTnP
         +54j8hdfO2xIw4DyynOMZHkNMXfAY6e+B3gXzq1g8a6RyVBql+hs5Tr2z/S2vnZD1wPF
         IHS+qkvvJ/HH7gC/aGYQWkc/bE3l3E0p1Fok36JBturh53y5B3N/j38DWjkezBFZMeMN
         C/hY1L6goKeExt8yJ4iQfFa/7RSCP9D2671gy2R1LIbM40+gx97JneDWJ8wC4FFjkAzC
         xBzwUr0Mk+wDk/4vCgGtqDgMj1+sSnjGHADQlVb9E0oc69RTwuHelzzJsPnCfurnVZ1b
         KRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbg62XderpiIRM5N2F6YfHGz2VdKk1pi8ejYZasEU/s=;
        b=Gp11FQ0hxwQW1SHaoV1ElpNzzBDPMfWHfJtF0K3jbhWEHUaEnRbU9jCe4OKiPj7eYA
         d0TNd2/GXaX/ltL0XZam5YLcHMQTSGSLse59SbyDliPLodUIoj71hXvNANoZXM/d+bSh
         SFMRxDvag7F1y3orwF0fBh74J837P7OJwoCS+HrziPmED7fXSHYo6+CUZ0aYy3+froWT
         JLED8TBnFJj7e9kD5uoNEzRNFjrgtizEHCZNhPVEFYEIHXT0Lek/CnAaVAv3u6+FIqV6
         dWHQOQVTqf0sqWBoDcI0snOC59Pf3glo9fnS5nmKXy4X3B6GUxUz3pll8rMzwMZoRUQJ
         PvWQ==
X-Gm-Message-State: AOAM53250UbwoRM6Etdip9Es/S1fJsp/DzPbjgE8dxnpqpoBbEJdYNQm
	2wJm7X8kAbZWs4Pc3crcblyjMz82/pJmYw==
X-Google-Smtp-Source: ABdhPJxcwdsMzYWL8WID+eevd4cbHP8+K5PdfzXMElnjFH9YB3bKzeeQXIz+h6Tg4jxIEZPWCkhzEw==
X-Received: by 2002:a05:6402:941:: with SMTP id h1mr3572067edz.371.1627657972085;
        Fri, 30 Jul 2021 08:12:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d23sm665380ejc.4.2021.07.30.08.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:12:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 1/2] mariadb: manually fix the conversion
Date: Fri, 30 Jul 2021 17:12:48 +0200
Message-Id: <20210730151249.54702-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index cdf0837be5..0e5e8911ed 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -112,7 +112,7 @@ do_configure:append() {
     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
 }
 
-do_generate_toolchain_file_append_class-native () {
+do_generate_toolchain_file:append:class-native () {
     # If these are set cmake will assume we're cross-compiling, which will
     # result in certain things we want being disabled
     sed -i "/set( CMAKE_SYSTEM_NAME/d" ${WORKDIR}/toolchain.cmake
-- 
2.30.2

