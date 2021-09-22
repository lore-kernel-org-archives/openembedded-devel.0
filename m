Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.926.1632338547459255357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Afih2lxq;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id w8so3794360pgf.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIDt+t4lHsaY4eW8wi9VSPFMV7xGyS1sIqlVgyzzum8=;
        b=Afih2lxqVKHDyjOsI1Fgh4M/u0ZPyMG7NmZrXVASf+6AIsjidFYIWsX4GnCFcvtV23
         5bQ8fuHHTQK+dMB5bl5jAFWhYv2eKKaCmxkeJ52bZ8PsFjhKTK8YwcGdcJJ3Q7fgX4Un
         OqJuD+BETQspj5msISY3j50bQ2/wyRSyUSjcVX1LZV5eY2HUMPaAEZdt8Gge477BRkZ2
         TNF43+qupy4LecYtWgJVfLmI7yuEvrJlNwWQI4Q1/4LEPmMWwKI+G6MNpmaWniNHdezs
         9HP5f9gTlEwWZRuG/8oLRZmLLOu3RY9pLFs5AOjCq/FqD4mTUzSopidiVvom5cEhzejA
         oM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIDt+t4lHsaY4eW8wi9VSPFMV7xGyS1sIqlVgyzzum8=;
        b=CvrkgeaYSx7Y+zQ/b9Y3Sxz1Tqx6ToH9K9g/6LNnmDzzHFZnGHwjvAqYyyARpfTUo7
         y8uMgXcOxdIb7AYbk1eF3UoCdOrPzITps7P+DTaDxg11ukmPVMEgqbg068P4J+Ns3Ugt
         pjHoJV3LtIW2RyzyZMTl3CiHe3bXZXks24nl1wGn7yBR6FMxjAmVHIV5AEKiOqc5vj89
         Yr8BlNK0W/pcufyIKdqMLzA39/X2OR/8Vz8Cn4AOLbmexRkW6SILqKS+9sGirUdTxfir
         PjqDyi3M6GT2y6WAfVSW4V6WoPM0hPe0DePlGf6KACsv+SnP5eSAAC51lu9JWL3Gagd/
         qwTg==
X-Gm-Message-State: AOAM533zeNqc+vEr4dDrNXTKbCRFMJqOeAzR5qf0253fSS+OpPNmqd+o
	6maa+SfF1r/yrkP27MTB47sS6xtE0EYg/A==
X-Google-Smtp-Source: ABdhPJxeNVpa3KTd8wla4x92mnXU6RlQbRt/cVqo0VQ7MhBWz/7B6JIXS3mEgRVmSDBYPcZk/47+7w==
X-Received: by 2002:a62:774b:0:b0:43c:36de:ed14 with SMTP id s72-20020a62774b000000b0043c36deed14mr473116pfc.36.1632338546790;
        Wed, 22 Sep 2021 12:22:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 13/39] xfsprogs: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:47 -0700
Message-Id: <20210922192213.3062719-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
./configure: line 16454: syntax error near unexpected token `libicu,'
./configure: line 16454: `                 PKG_CHECK_MODULES(libicu, icu-i18n, have_libicu=yes, have_libicu=no)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
index 64873ac038..df5f764e16 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.13.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-support-usrmerge.patch \
            "
 SRC_URI[sha256sum] = "4e142d4babe086adf9016d8c606c805829da08e46389a4433f40346204f90cdb"
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
 
-- 
2.33.0

