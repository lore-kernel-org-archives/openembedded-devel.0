Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A38CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.27.1761328671589398417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcEOA4GP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso18355545e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328670; x=1761933470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Rvux+r8xJ5KPAdPZ6cqWZPhFofdtAktuK1MLJLhJn0=;
        b=AcEOA4GPKCkCjZXyXa6MufDpQkJzNC2vDD4yKllVJllVfuAt5molmMdVS1uul0OeUM
         krh6K5BY+Lr/97acUzxFM32c3IiWLenx0ftes1zrU5EOZZujcXIzRbb79lwktY0+c1+s
         F+fB3wzWZvNSdm+JpH/kso1Ect1j4DZlwWCVS/1+yoM5AVyuRL3zQt7+1c9auN+6To9T
         i7YcU0m69Yhj+zDPD3xur4B2B3IHcMHGzxi8gwfB4D9caspRl8gj5kEQbPe47WYDWtLs
         uvTGivGkq8YCycfGFz3U977V6o0S65m8eCUsb22s6pOmam79XWhwJHw0olvBE3F8LaS9
         Gwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328670; x=1761933470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Rvux+r8xJ5KPAdPZ6cqWZPhFofdtAktuK1MLJLhJn0=;
        b=o8UTJtOPgNxZU5BCRk0jKsmMcX2ePw7QIFN0+e9d4qUAeB+n6rILOrDoIg0AjQNARe
         6Z++3ITBYm8KNMhuVWYfGibfMIGyWGdB2pP3evUqaX25zyqRVRsQSYurdLtxHbe744IW
         g5r/0NrGKPsTeSg1rQI9r+HVcqmcqy5xFPYjLBDCcGeBvxNuHCJ3/fjEIHOVdJfu/x0A
         BEdahEBlPSyt0yGQZ9p4rbAoWhTNYDDe3LQXTQZNaNSpLzyq/9Xgteex7BqEX8kFUAbe
         y/oFTPuxFmTRNTAJyAX7OCMUM02O/gF0KlvmqstwfNFV6c4zBsO5yTgzHqAbLzQRXEse
         d3+w==
X-Gm-Message-State: AOJu0YwHu807nL9MTcyS3gIU3RkXixUhsYc72IWdmwS1kxpskTL3sTgc
	2S0pPrwMvufkGgNv2OpFn9sZz4SYiiYIzyhwMyg4/6NPXMkR5Kp2AS4Lai7MuQ==
X-Gm-Gg: ASbGncsPqos2W74FApu1IdI/Q6QA4vhH+IrJ5doQOQeuAn+LY/IVJdbA4a0pCkXzWDx
	uEzoZK4IqjiMvdloM1RcKO5Q/x3J8Pw8O2D3iY3rqp1xxHEQw4YoxPxcKpM4iM9iGIhs2klWoZf
	rHfeMy4xStEueCRIhGkDZr59hA7/+dcijaJrC+HjkyNI7y0GhhEhi0q9J1Q9Yg6Pmn0ze9pFdfP
	NGTMYuCbOJqBHkB0THhfy5+WJPFIrwF09Xof/7RTliJOvcHYt4JdhUOBT81ztqWfkzXidFte3/V
	KqX2HAeZ5lcbTTuuLzkEaRm+/kEMLwG1iQA8SFACEA8DDzQmvtDogWtGtJQUsC8AFiJusUPqoVV
	YszhDRQuCNogrzHlgDDlhx0BUWHjeTUfdVjuWLL0Xa+hb/dTD2GskkEHWAwXQCf0jb2LkctfwNt
	2bySqI9RHKApyhFHNMlHU=
X-Google-Smtp-Source: AGHT+IFZGevXMS1Isbbd0EPghJcVmanlQ168lwhKn9iJ/CjZlb6SfCbVtcIeck+82SUGTXahdOoAnQ==
X-Received: by 2002:a05:600c:64c4:b0:46e:1d8d:cfb6 with SMTP id 5b1f17b1804b1-475d2ec5782mr27590135e9.19.1761328669848;
        Fri, 24 Oct 2025 10:57:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 02/11] libcrypt-openssl-rsa-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:38 +0200
Message-ID: <20251024175747.704498-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120960

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc     | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 5f700e50d8..62b984dc70 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -11,6 +11,7 @@ PTESTS_FAST_META_PERL = "\
     libcapture-tiny-perl \
     libcrypt-openssl-guess-perl \
     libcrypt-openssl-random-perl \
+    libcrypt-openssl-rsa-perl \
     libcgi-perl \
     libdigest-hmac-perl \
     liberror-perl \
@@ -31,7 +32,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libcrypt-openssl-rsa-perl \
     libdata-hexdump-perl \
     libdbd-sqlite-perl \
     libdigest-sha1-perl \
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
index 2e383a83e1..bcc57ffc09 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
@@ -31,9 +31,11 @@ do_compile() {
     cpan_do_compile
 }
 
-RDEPENDS:${PN}-ptest = " \
-    ${PN} \
+RDEPENDS:${PN}-ptest += " \
     perl-module-file-copy \
     perl-module-test \
     perl-module-test-more \
+    perl-module-lib \
+    libcrypt-openssl-guess-perl \
+    perl-module-english \
 "

