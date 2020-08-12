Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.9576.1597214236988146951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eik/o+op;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id k18so511872pfp.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvxts7dNg40O6viw7/IScahQ5hxtR1wq8cB5p1Vke5E=;
        b=eik/o+opQP7s4sdKv5EV5/pBXcZIx5wNcRBRylj7YycpaQrtJXQNlK9BxoDJdOxSwI
         iWn9RuSP5Wgc1J3LVTXKUQIdAPpL2aaSPiHxSE4C6IqnRMtpKg1BFRU880hlaFVSM3CD
         JRLoBiavohaXbLQpcgiLy67qnQfPVzZE+UP6SxeIoD6RNataohFsM5DbXPkuvU5ivqR9
         qIff6pqKjyJySeBD4Wc6fjzi2uUUOUu/5AKFbRovSZVSEanPWyeVFRaCHd0VqXJL+oUo
         e6GqrC3BWR4OXDUKqycr02Sf2jDGb8KB/MObAqu181zWPje92diPJdqoIViBNutvazQC
         vu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvxts7dNg40O6viw7/IScahQ5hxtR1wq8cB5p1Vke5E=;
        b=ruC6HPardeO55UnCEr/s7qw4dwky/on4XrG4np3pZekdz+uLsARkamKaKoyXJUp7se
         j1dJDoVma+xc3TWlOUq1jlR0/vUszre9l3KZm5QlQXhzuMQJ43QwWYkLYhkLzMd68jm5
         NoFFcalBJFlJtVCsui+HtRfM5IOm+aaM/uPDaHeGTmLZ9nYNVghsNdtsmOhqonlgCgGX
         CW4pUTeubHqHSp6sDAWk/ajRm/ElV6RHXVyZKjmhmqZKXoaMl5rtu0SfYy4m2hkS+UtT
         ejki2cLi0ybfZbe2zMeGX9e40j7wDYBM248JhUu8yttkjMTKJa0hI7oSt8nPfSlWnwmV
         ScQA==
X-Gm-Message-State: AOAM531VfbYOEUPbnS0zdSh1N0flO4BLkZh5wa8YcN2Nk7z5E9iAKcqx
	BfSbK+ogXlguIEvPbH7pcXx1Ne+P4nE=
X-Google-Smtp-Source: ABdhPJx8WbxSHJu1lfSTl70KEH4Fozq3V7j2N8h2+ptf/y+Ewma5oGHGtdDLWftu2O1+UXcmVAuNjg==
X-Received: by 2002:a63:5007:: with SMTP id e7mr3609018pgb.19.1597214236236;
        Tue, 11 Aug 2020 23:37:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 2/9] satyr: Upgrade to 0.30
Date: Tue, 11 Aug 2020 23:37:04 -0700
Message-Id: <20200812063711.2758315-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

satyr 0.30
==========
Fix registers being parsed as modules in kernel oopses in some cases
Use Nettle for cryptographic calculations
Fix builds with GCC 10

Add needed additional dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/satyr/{satyr_0.28.bb => satyr_0.30.bb}   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.28.bb => satyr_0.30.bb} (89%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.28.bb b/meta-oe/recipes-support/satyr/satyr_0.30.bb
similarity index 89%
rename from meta-oe/recipes-support/satyr/satyr_0.28.bb
rename to meta-oe/recipes-support/satyr/satyr_0.30.bb
index fbf018d7f5..7831dd9564 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.28.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.30.bb
@@ -10,13 +10,16 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "8b5547b89b712b39a59f1d8b366e7de0f5f46108"
+SRCREV = "871a07001c64cfce15dffd7e93a5c3d55af6d5e8"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS += " \
     gdb \
+    gperf-native \
+    json-c \
+    nettle \
 "
 
 PACKAGES += "python3-${BPN}"
-- 
2.28.0

