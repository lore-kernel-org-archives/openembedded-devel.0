Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1881.1621647342710780942
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PogyRe6O;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id et19so25970179ejc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e2pxkTsO1tGceavJ229tGNjO7Pd52b8Fi6WqeO9TVSk=;
        b=PogyRe6OqIqhBMVC//xvchkBQGiZ+9PKbn37+UvRuI5uCoToqWKMkAeynbzezDbL1E
         qNQp+JZEF1mPQOuYjQNK8QTdAGWCDKW5Ft2MJZogY/EjVk8uYczGv25wHE6vFVf5oDqf
         aRCDNpbjyLooveAW022fPyhgU/L4dl8+GGPaOmKwd5QJVSs9J9kNxSjOttlQiUz8RaDs
         N2f4WG7BQKluw2biqWvCY/Vke1fyL3jizva3f8N8dJQVuZpNkrAOALBpV5pFDQoSSfIv
         M0kXdj2Nd4vXzA/H1sEhYBmwxziuUlo0S3eNPOpvbqiHGhbIJ4FGXavJRW8mzgUDiheE
         icMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e2pxkTsO1tGceavJ229tGNjO7Pd52b8Fi6WqeO9TVSk=;
        b=YqXfKrza9GJ6OS2IS1oYtG99gIJCgHg+uucsuPzOjf6Y0E+5JolsLUKcS0O7uqA+wk
         yd9yDCOTqoXAxzBwNKLTHKdCrj44tBmoTg9V31FIbzbzcT8BZyUnFIxjYFSD080zc5qB
         9b7s6StxlA/k4m7//g20Gt2PrPK9RF9WUxYwnSoeEtpwY+Fcc8nRNZavDyPKLqq40//U
         2459mzX1Kf4YbxenkBXx4IoPbcuDfpNoQFkJZVLfCqjCkm9AizJheAq910NnYPeag6SC
         v5VT5p4XFBx5Sd4TfqyoNWNZEQskuhutj+Aehq1bfSW5UUo6lt/1AYHm68ioeNR2EwEw
         jThQ==
X-Gm-Message-State: AOAM531mysnGQH7NLNqMMqYyrkTz4fCXMhZ0Qt9n27daIf5FqElX7jn7
	lPeVqNT6qJ7U+wLZexQPz3BxhbKnd50=
X-Google-Smtp-Source: ABdhPJx9Qb90/CRZv5g+pff42DK3ZWzBeUiiLjY4O2BmzfQ4SBfr4i+54F8OshPQqowsvMvZQurSBw==
X-Received: by 2002:a17:907:7283:: with SMTP id dt3mr12501853ejc.253.1621647341375;
        Fri, 21 May 2021 18:35:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/17] qpdf: upgrade 10.2.0 -> 10.3.2
Date: Sat, 22 May 2021 03:35:18 +0200
Message-Id: <20210522013521.588774-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_10.2.0.bb => qpdf_10.3.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.2.0.bb => qpdf_10.3.2.bb} (86%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb
similarity index 86%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb
index 4f21575c3..53ebf7b6a 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb
@@ -7,8 +7,7 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[md5sum] = "c8f4430823603ee3b430b3250015ede5"
-SRC_URI[sha256sum] = "43ef260f4e70672660e1882856d59b9319301c6f170673ab465430a71cffe44c"
+SRC_URI[sha256sum] = "062808c40ef8741ec8160ae00168638a712cfa1d4bf673e8e595ab5eba1da947"
 
 inherit autotools-brokensep gettext
 
-- 
2.31.1

