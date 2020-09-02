Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.1372.1599086337109387375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 15:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kpdd6er+;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id c142so554819pfb.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 15:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qruYWVD6SFM2PbQ0VjIU7B9ZyByp4Fwq55eg6C9VoZ8=;
        b=Kpdd6er+QFBd/B5cz8Wi2ptEL/VT69DFRE85WrmF1Z0iUNrnA4sWzl4Y8W7zuvZR7k
         hb9mMA79NLo3o7Sbtt4HLcH8rg1smZVpVhvCGJSFeG++VLdkCEpvJoh6MwKJwXQrwecd
         HJfIX+B+IAY6LYJ0tbXzJFa+7u1JhuKpbsAqfqhZUr8e7hBZJk/AX7Mye22jiKtkjba8
         TtuajCvxx6zvF4q60XaaV4qnYD5XLNi2cwPgcTBjQIhO7Q4B07r0v+2SEFkf+M4Qp6KE
         Z1zl5HmfTb36KD3cI8HTHMv184IJ0TqxZktXbs1DN9LrzZEuJnGu23yvKUQnHdxX1mlj
         XY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qruYWVD6SFM2PbQ0VjIU7B9ZyByp4Fwq55eg6C9VoZ8=;
        b=HWtTA04V2UUcStN+v800+zkqMnXfV5Mjuk59yZLjp38tKmkTmQ7a5zCc5uPD9aLhLW
         FU5ZvqvpgBrMz68mRLxC+//ozHxQ9AGhLuvfTXJH3m1JSsvmZEaAH6hDbDwFdPcRnjOg
         2sBwBj3ZSyyWK2HcB8oivOd1L8pvRcz2li/2VMAwSe8Kfcz8jVKwECAkeV/icvlQwLq9
         JXg83s5a1E3oW1/xead+t5Z9lwI9pWkIc1ReO9w5smyJaWySiCmY7ZBrzCyI21evc9ic
         gR9g+4dBHOgf8Qzp57C0hytwb1f6AzCxSBSI+pVDTXZ4Qhu1u3hN88YL6nLmr8lDHMiC
         ik8w==
X-Gm-Message-State: AOAM532tPhy+8GNi+M2CfF2AjnFECdbgvb+eVH9nsMBunxIP5KSLHmPM
	ZSw6YnaofI5tMPhbfKQA3A/QIfiPIZESnQ==
X-Google-Smtp-Source: ABdhPJy6TYN9aFjIYzemHVbr4rJ2L09erz158gtyhBsRj6OSye36UWVYskNu5g2pPnZKwFJzsmTqEw==
X-Received: by 2002:a62:38d6:: with SMTP id f205mr569271pfa.83.1599086336348;
        Wed, 02 Sep 2020 15:38:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm552256pfc.187.2020.09.02.15.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:38:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 3/5] libdata-hexdump-perl: Use update alternatives for hexdump
Date: Wed,  2 Sep 2020 15:38:50 -0700
Message-Id: <20200902223852.3467735-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902223852.3467735-1-raj.khem@gmail.com>
References: <20200902223852.3467735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hexdump can come from busybox or util-linux, therefore its better to
define it via u-a so it can live along with these packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-perl/libdata/libdata-hexdump-perl_0.02.bb      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 6ab5a42043..44c651c4c2 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535c
 
 S = "${WORKDIR}/Data-HexDump-${PV}"
 
-inherit cpan ptest
+inherit cpan ptest update-alternatives
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/t
@@ -31,3 +31,8 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native"
+
+ALTERNATIVES_PRIORITY = "100"
+ALTERNATIVE_${PN} = "hexdump"
+ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
+
-- 
2.28.0

