Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA13C369B4
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12745.1744471832806105272
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RwGnkNjS;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso2677364a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471832; x=1745076632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMJ37BUmKq3TvBeycv5Fi0TuM9P+qpBc+QgrpOtZ4dM=;
        b=RwGnkNjStfDqMlD1A+GaFubPy9MrMvP9Lus1Tf/8Q36RhPhODwK2zKNTinNmaVl50V
         JEIL5+Tpvm40JWqTvCHQ+p9brmkWnr1YweHiMMwscvlOc/1JwN7y8SshUMKRWnUccweG
         fCUmDCJUAuAGxvIcz6OdK2pNhWU+wAmaU0pqgh3QR/Xj+D0ErTEY3UvmP4MVEmrEfgjr
         Pc2i1mnHK1bb6CSXy0/k/k7JrQ90rEeRVqGEmT8kvBX2Dmgs4lPfK3GUAtiMayVn/hWg
         2GU3TaDJrTd/mvkwkPyw4m5HFoVbqdtShGjDa35APcN4bvW6nAYUigYqt3A3a8oxQ7Yd
         0DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471832; x=1745076632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMJ37BUmKq3TvBeycv5Fi0TuM9P+qpBc+QgrpOtZ4dM=;
        b=eek73eA7lIwyTDDcIgvGnHWTnoDdoZY5CDA8tE/qOyZ7gz/bs2ARuhnl+5F/bNEwvp
         SAQ/8HdzSgba0gqWypTae/9eUamlYYAE8tynKn1bd8ZTUP2HAsC+f77UWHFttUr4BIy1
         VYuq1wii8oKxx+10uZfABzeob4z7wJfbioP1oP2aE8vVs+0tB0ilOCY1ZQ4WNt7geKeh
         sL0Jz8lJ7KU7kCpO7vnA8oH129JwUNHIVGfn4+w/hqeiji7RiokTGeIKV7OnFz7BWcDV
         cJ03ucstLauFLcfjoBlYU0FDl1AeJ6J6+iwrOuzWTEztjyLw0OXY7sxpB545vFCme9mx
         h7Xg==
X-Gm-Message-State: AOJu0YylmQUwd85WLM94iI43PBn7q187lTnDP64U6UqMrE5pDV2x2AWb
	PQKgyU5hVKXmW3L2ZjFkNwCCNhVbeShK+45a+yHCbWQ1KZUde0RST8BqL1xF
X-Gm-Gg: ASbGnctm1gXZJUBLGLgs9y8rK5htkS5f/BrhnRMICgSF04app0KTWPfEBj6pCVFCl/c
	/s1wGXDd49EQlRA3wdnt0/xWyafXH8X/MqNv3z/inYkWNenQaHv1b+0gvgAOG5NC5LdXSndMTrn
	mbVVOytAqeS1g2gufGFOGMKrru8/OT9ylr2yqDcT+vPlGDlWOA6QL/Stncd/ABXytvOK8F1HIoH
	a+2Y71fYkvwzAUrNGj5IpWiBbVJOEijtBOcHTvxl3ZtrYzBizaninGN1anAc7px2iH0cs7SvGvo
	RgvsYbJvoFuYDVeZ/aKQtw8hKGMZv9C9
X-Google-Smtp-Source: AGHT+IFV6wmJZE29lRgNfDx8BwUuOfuKcRo4fTzCL6s5iWl9/jN/pLvppVOItAADHlw+AggGPS5ktg==
X-Received: by 2002:a17:90b:2dca:b0:305:5f32:d9f5 with SMTP id 98e67ed59e1d1-30823660b8amr10399345a91.7.1744471831774;
        Sat, 12 Apr 2025 08:30:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 6/8] ptest-packagelists-meta-perl: adjust automated ptest runs
Date: Sat, 12 Apr 2025 08:30:20 -0700
Message-ID: <20250412153022.2343322-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116818

Based on current pass/fail results

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-perl.inc    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index d081c2fdac..e0c5707f4b 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -8,7 +8,6 @@
 # ptests which take less than ~30s each
 PTESTS_FAST_META_PERL = "\
     libcapture-tiny-perl \
-    libcgi-perl \
     libcrypt-openssl-random-perl \
     libdigest-hmac-perl \
     liberror-perl \
@@ -16,12 +15,11 @@ PTESTS_FAST_META_PERL = "\
     libextutils-installpaths-perl \
     libhtml-tagset-perl \
     libmozilla-ca-perl \
-    libmodule-build-tiny-perl \
+    libnet-ldap-perl \
     libstrictures-perl \
     libterm-readkey-perl \
     libtest-nowarnings-perl \
     libtext-diff-perl \
-    liburi-perl \
 "
 
 PTESTS_SLOW_META_PERL = "\
@@ -30,18 +28,19 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libauthen-sasl-perl \
+    libcgi-perl \
     libconfig-autoconf-perl \
     libcrypt-openssl-guess-perl \
     libcrypt-openssl-rsa-perl \
     libdata-hexdump-perl \
     libdbd-sqlite-perl \
     libdigest-sha1-perl \
-    libnet-dns-perl \
-    libnet-dns-sec-perl \
-    libnet-ldap-perl \
     libfile-slurper-perl \
     libhtml-parser-perl \
     libmime-types-perl \
+    libmodule-build-tiny-perl \
+    libnet-dns-perl \
+    libnet-dns-sec-perl \
     libnet-ssleay-perl \
     libsub-uplevel-perl \
     libtest-deep-perl \
@@ -49,5 +48,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libtest-warn-perl \
     libunicode-linebreak-perl \
     libunix-statgrab \
+    liburi-perl \
     libxml-libxml-perl \
 "

