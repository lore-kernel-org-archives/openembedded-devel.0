Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B16CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 20:11:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.2881.1761336714790661164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 13:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WEjPZ5AD;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4298a028de6so1571950f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761336713; x=1761941513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGmBMrXkz6iik5rmzybtc2YPHu+TfRFSAYYCvjLB9B4=;
        b=WEjPZ5ADGz1ltGKd8C+9EHG14P5H4GREAW8FC1rT1KUxnZnd9PbwTVBhsrF6PRgm3S
         xn/1+oCMb1aKdm+znd/siywGSqJN7z/3ZYOelWKg2orIMAAv3Y7ikAx92DBbg30cB7g2
         NJW8TSD1EMaUqSzwXqHCYhSYIKLTIePWHf2beA74Pg0vl1Y+R3CS0VoBlGo1b9jJB8Ez
         mcCS9uDn+6ybIv/Clv3+Jl/EFLx0cqZruRHTP1Ajh6oL/ISsNkrLfA9KGQeF8MOKadi+
         vetGbdc5lY5Mc/UgFddghkvCmB3Qb5i4OgNAl28o4YL/s6GBTF2GKBnf+Wrcu/vISGtK
         Z+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761336713; x=1761941513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGmBMrXkz6iik5rmzybtc2YPHu+TfRFSAYYCvjLB9B4=;
        b=sXPoge+P6TUZI6fFLg7agTlpqlYlEqc/OQHurQMIgEKMIZnWH7jEN9o/0BKrlgU4k9
         aELsbw7HC9Visf0ivRS19MOo5k/Myj14/TYLxdYd+ol5bW6GM0141qizTXMa65bdw34y
         mfOWixmKs2nUW8WesSNmp2G9z+ISbPs+pfQYrA7K71cnMTzw5USGzxlht43FTJY1eF54
         yL89xylBfQXDK/LuIVprEm2w2nyZMMtPC9VCP1ovJX/A0D2p56xyhBXYEx+dh7qzk+Zp
         Bx2ukxfXD7K2WJmmnqK8gVC+QhLqZ0320PgNjn/dBCBdj4AmiBePhu9RrD2Fem8XheMb
         uNKg==
X-Gm-Message-State: AOJu0YwgW/XMByNcAMPvgSR/0hg+Y59sYrEA+bDjPu7Rob3SCX/8Zn6/
	bgARWBMp6uHAJnVp7QGeBC3yu97gsz/3xctLuSQxhjafgra6atGzMg/arnF3CQ==
X-Gm-Gg: ASbGncsELObIwFYBPoPlq8J+pyZjBdFrTW8iGQ7ogiVysLtwopwDwjds3CWo5pWBobc
	O4MmFr00LkwCpR48d/L5k+P9QlNUPnLpx5AqZfLXlUKXG/X6sj3M7/a5EC7HrtkpaEzlACdJM/S
	QUuaP7lN4PzikFWFzOstgktXrCfB0LzIjZFtsrQBYBBT8e8e0kwMcjqNzUXyY3UD9X9j4P8McXM
	Ixr7B7q40fW9XgZzryF5DMRCXO5keB83dSHkpHdzEkXOqj9Sdnrg6b5Eiw83OTO995Vxgaio45e
	Mp1aawGsvBH/uX5zxUbRlpp2rAChH2x498+hwZWRsFf2pxl7a5D53wULnmzpFqctxXwpgaAujr1
	WyFp33qJlB04wiIHgM6HprvYSfD62zBAkepIUANJOw6o9t0TWYzWQmecoqo4GyEYzDN+dtZKeyE
	/e3b+dF+yV
X-Google-Smtp-Source: AGHT+IHI2l+d8QDtmjR5RI0KZS34d00QWl4y/1gBOdw8Sfwp44DNR+U8/ohjRI4wVbDiEDpZ/ge2vw==
X-Received: by 2002:a05:6000:2405:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-4298f58245amr3125169f8f.19.1761336713093;
        Fri, 24 Oct 2025 13:11:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db839sm135918f8f.34.2025.10.24.13.11.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:11:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/2] liburi-perl: fix ptests
Date: Fri, 24 Oct 2025 22:11:48 +0200
Message-ID: <20251024201148.756716-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024201148.756716-1-skandigraun@gmail.com>
References: <20251024201148.756716-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120973

Add required dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 2 +-
 meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 09a1e4c5ba..c77880041c 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -34,6 +34,7 @@ PTESTS_FAST_META_PERL = "\
     libtest-warn-perl \
     libtext-diff-perl \
     libunicode-linebreak-perl \
+    liburi-perl \
 "
 
 PTESTS_SLOW_META_PERL = "\
@@ -49,6 +50,5 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-ssleay-perl \
     libtest-harness-perl \
     libunix-statgrab \
-    liburi-perl \
     libxml-libxml-perl \
 "
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
index 7aeb234dfd..73e4e51d23 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
@@ -37,6 +37,7 @@ RDEPENDS:${PN} += "\
 "
 
 RDEPENDS:${PN}-ptest += " \
+    libmime-base32-perl \
     libtest-fatal-perl \
     libtest-needs-perl \
     libtest-warnings-perl \

