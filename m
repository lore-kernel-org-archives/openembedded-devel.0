Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6AECAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:06:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.4476.1758650805107371957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOkeuZA0;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2d92b52149so421855466b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758650803; x=1759255603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fwFRbNY+UxBJnH7TI7JX2lCcn7kYPuPzvk7BYOTbkg=;
        b=gOkeuZA04NEAyrVQ6kTtS6eQpQuiePbM8Z4JeborV9cSa0v+th/lkrLB+Bbv5wPZ/H
         OoTyU71xBLkHvRCvSqo10kGpR/yOjyLMqQSuU+zey5kG7qsdoDzAOjEhEDrKgwsRMEUz
         qm85lqZ4YisRxIlxQBOyshSom58i/7WXRYeAhS5uTIxF5n4afnjVVhD3ZssKaLn5vCHe
         xuzyKdNhYTx7TPgNPpsKR6rF8w39VQ+2LAbPfW0eZuL6B2tHD9KCnX74pf1MCk98YlNP
         gwR35u+n2LHfsyFArptrS/tVzepbvJN4PqSlNoRriyyKHNRplxCBFp7LV/Skl0gPgYGl
         bzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758650803; x=1759255603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fwFRbNY+UxBJnH7TI7JX2lCcn7kYPuPzvk7BYOTbkg=;
        b=iXulqge6lRPzsKWk57KRl3iJAs7GPD0BzNHgwDhw/7mfYxZTV9CTtsxQTRp+aqBGoS
         XjoL5c3aNnnbXhesxsNbxt0TxIxiMwx1KdcwXF48f2FKhxLg7f+rIJG3zkw6NmcKe6WA
         5twXVvVBBBZais5iT+MmJTtQZMdkUvCFQNPRGz4BBVcALQLdnpWJJu+avvN9QkSOubOS
         Ejt2cqwGJlecdvpx1oPClV0ABDP/63ABh3SxLY3YRiFziZOLQl+LQx1FdLrtYRhPzyC5
         cbJxggZqq3D5Ci4exg1TN2mybb2yyBxcdyq6eMnMcjRb/tZy+HoPIirWfMVJyLMh24Jk
         CI/Q==
X-Gm-Message-State: AOJu0Yy0Mbbf9dBPl429dp7R5lTSTDR9EgbQXj5m5flYu24ILxb/kpqh
	KqxYqqHHPJ0EbBg1+LD5RAu45ymiNiqDbmA0FE9L0e0ptevzk2xF2gLabdKO+Cs5
X-Gm-Gg: ASbGncvJ4I+oSUbuZtpqjPae066olh3p3vQjyTlH0OzbMOAAqALhJSzvjHZVctrN9ak
	pv84kVAwxBDHDlaHlE7ocpvyCVcsIqwiINvS7mB72c4rMTyx6sxs0IRvTDQaLsgFI2AJtkos424
	NE6jl9ZKVy6GehYGMP/AzSpUIiUHiiLVFDdl6qck/TK7eM4q4talCjGuBIwBuhSfb/cOd2c/oa9
	D/4uLAxk08LHAILXQXg4FrPJ7HDH30moCf+oLSXryrpbm/2w4Nakbyi0klExt9C6e58O6fFDjsd
	JmTzCuGVwtE19pEH1GYrrXuH7IvtD0sXU+yffBi6ZgvJkHBDgyQOYMFVrap5G1nm5ODQONWCW0h
	jJA5Sr4n9n2TrbtK6pwveZ1GBr+wcoeMyP0nmIyA=
X-Google-Smtp-Source: AGHT+IEyxWgEBWB7OIjzZT4msqgh5C6ss6YAGaoA32OBF2ukiGd4WEURIIM3k4deTLEJxRAtfUeyMQ==
X-Received: by 2002:a17:907:86a4:b0:b29:b4ac:d2a8 with SMTP id a640c23a62f3a-b302b80a63bmr360489866b.57.1758650803153;
        Tue, 23 Sep 2025 11:06:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28be3fa38bsm826714866b.46.2025.09.23.11.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:06:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/3] tokyocabinet: switch to working SRC_URI
Date: Tue, 23 Sep 2025 20:06:39 +0200
Message-ID: <20250923180641.2307188-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 18:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119729

The original source seems to be long gone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 75f68ab5f5..a7c10128b3 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://remove-hard-coded-include-and-lib-paths.patch \
            file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "

