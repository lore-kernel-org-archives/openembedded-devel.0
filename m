Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.229.1617899801761762666
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vBfaUSYZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id k25so2809571oic.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CawP+fQ8ZzSj+WQuHSAXEFaqY6Y4CY6F5xZg02mDTnw=;
        b=vBfaUSYZ2xzFKFMihxi5FLG90TXrXN0/PraxTMpRzpAfjSVxTbJIi2gPURD1gmLXhm
         nGQa+w8aokG5gL9rFQarAkoYFJo6Xp4voMowVmJ5/oE1VYJrToS7IQjL0tM6fG0sE5QV
         Hj7UAigsRFnFqE0IGhRIvVI9cE127AgqFH8r4ntk7f2WPzM4gLpTS8xLzFfexRUmx9iz
         bwY9QEsWmtq2Zk5PIlI/agN/y2Vt7eGBEOriCrH2ihivt7Hq8KckI2/5UnbCDCR70AlY
         NjdBUs8qIzAJq3c+neTu/+ZwayRtQVoA0dzqcJfsKfD1+104uOFZIdu+8jZNG8Y8Z0Xt
         fDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CawP+fQ8ZzSj+WQuHSAXEFaqY6Y4CY6F5xZg02mDTnw=;
        b=eZx5QeKFUXi5t7WNxm5xy8LodMC6TaMKCgyjYxheZLIrk90r5w1/MKNTxlR95rOcr1
         3iqcKzWW6kyK0xkzG50os73UnTqbknIdRA7n5BZJY8R2gMFJmNyPuLe0eMUQTjM8JtYW
         /pjz44Z8gkvYt2WNm/X1aH654qHDICZD+5bZLJu10DO4IJrmshU105o6EHWXu0ygFWGc
         3sXwX0aulkouYEMHhqFPWlDMdLvPMwBbSo8KaGl0tKY1HgCUzcBjvFm1tcoa8YNLxX6D
         ljUd4XaowGajL/eMGxyhjE5fjOiNUOfGdexijvcRTA+nVosUqW2j9PJIrG1P59+z+2X1
         5O0Q==
X-Gm-Message-State: AOAM532y4KbjgMkYtt/Sq9AqHGCnJglyuSZ2dTsE5WLmALxMAoxS9swQ
	TcxGhkDoILVVz3P8hF7ASk6kwEWpQ4c=
X-Google-Smtp-Source: ABdhPJzlk3dzFsLBlAXYDZmkE9Zfg0nZJnWF4eWGNNnC3jI3d1EK8VS37K+bDvmQzC1rBgKXBc5qVw==
X-Received: by 2002:aca:4bd6:: with SMTP id y205mr818952oia.77.1617899800977;
        Thu, 08 Apr 2021 09:36:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 30/64] emacs: upgrade 27.1 -> 27.2
Date: Thu,  8 Apr 2021 09:35:37 -0700
Message-Id: <c36fa8754da6a36e68ce24011d6586eeebf93178.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aaef364ac87f6c4b8544cca78e7e530fa3a08750)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/emacs/{emacs_27.1.bb => emacs_27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/emacs/{emacs_27.1.bb => emacs_27.2.bb} (99%)

diff --git a/meta-oe/recipes-support/emacs/emacs_27.1.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
similarity index 99%
rename from meta-oe/recipes-support/emacs/emacs_27.1.bb
rename to meta-oe/recipes-support/emacs/emacs_27.2.bb
index cfc089b3b6a..e3157ec4217 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz"
 
 SRC_URI_append_class-target = " file://usemake-docfile-native.patch"
 
-SRC_URI[sha256sum] = "4a4c128f915fc937d61edfc273c98106711b540c9be3cd5d2e2b9b5b2f172e41"
+SRC_URI[sha256sum] = "b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"
 
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
 PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
-- 
2.17.1

