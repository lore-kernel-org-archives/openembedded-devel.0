Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A14C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75157.1782663767070627210
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HJnbi2B7;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bf132969bso3664845eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663766; x=1783268566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em6MZaXhMAdkMXprKd3L1PmdpTra6DARHhU+0qzRY4A=;
        b=HJnbi2B7l22HsnWmQKRAe7eAAUbPfgL+xS6x/p39Ob93yB4V6lQELJrlsL9l/pvbwO
         xQyBTyw0i2uPpiKXZIChWSsupWAagB1l+0G9j6VfNSVOLZ3lOhuZWSZeoL0h3Hh1OwDq
         Viv/zXqm2tLWvzhVs45+hY7+6V3QTMkImU8mN9Ku6zj4n6oqkQ/fq7xx1G7IJ5uP0OjA
         Sp9XdmZZgJffpoJ665J8l97lyLPp3eeM5Uf64nQBdL0PcQjCTEYURDrrFQTohgwSm0Aj
         vqokgwNbe5kyF1rAx/XDOoai4v4nF3u1MBEZrHfchEF2kXc96I9LWeB2bmINuFG2uI+E
         +N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663766; x=1783268566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=em6MZaXhMAdkMXprKd3L1PmdpTra6DARHhU+0qzRY4A=;
        b=R4Kpw0ZsfNytLK3KqUtsTXV0RxL7OORDzZVib12YR0GXlgqDLsbKGzvq7kw03uzREK
         x4muKz3uoDP58m/oAfqpBFgAfHWQ/Po1xv2i7nX2oly36EEifsNMI7k1O2SzIRtcYhSs
         D09gFe/2+biJmj+wwlDT+kYJkun0XqY1bfRFENpFiTsndg3gpkWE30FRZM+fvtwVRXzN
         glCkwafcRi/5xDJ+hFILJq0+mW8lOqsyzy9YSCSAocnN/2V8RXuL7PeJppKdt64XVbo+
         eowm2x5iVVGaV6LIELjZp7GrkPnh1yXTrP190Ger53al0ipqSIqdpciunq8mKNmK8Gcf
         zSQQ==
X-Gm-Message-State: AOJu0YxfuHEBqu1rzwyJ+YIHxtOlrrq+4nsEGKk1EXhREFHF4Nep1IyA
	2UZYjFSMy6z0aZISU8LThKVcEy2XZuAxfes7R3kLcn83gSzECnGIVLwPwgkyHD/kfZFEVQ==
X-Gm-Gg: AfdE7cnNoV7CfvxG/ca3T9JkZPpY248/AFw2aqeMoU1JZcYN4aY1/yd6j/K8JhAHbt7
	OMLefLv0ayaP8ATQayrAdMeKS3C85rJVOiC+bPoetBQoXzXnqubwKqJw2Fb8dIgctYusinK564X
	Yhc+v3XyUep0OLHJGn+s72td5NKJRvslrxUqaK3ptkuUBPucSZ57cT8TJP59U686AK95T7273gi
	r/amdD7mL2BfqNL1A4lCNn0ls55Oh0rZYtarvMq22DIVNPdyXtRwKNTYkrTiT0gfCcvPxlT/Da6
	oTAg8U3ov9PGZPG/Z2aQFB8ain7dlutGNIi3kXkSydy+jLONCLC2hF0DWi8oqTfXkoQU8Ew0tMb
	2OHSGrYr7+fi9CCPBIzypXAm8Kgj+M01BO3/K8hT0G7Wbt7NSIjZf9sWWpf5EKOKVrSi/WeRz8c
	Xk/4EUnBF/A10L1KIVcrAd7U7Yxita/wcUhsR9vHWzyWU0iSl4/b1tTrX9M7L11cL/FkSSTim95
	6ugmeSaOhhUMKcoT6Tav7UzrN5HZCSdZflNTfO/uwapYla8d6OtMQbPfu2MXXt2rFPPxryX9oZa
	XkXslYr7eEERosvEXrP7W3XxanMRZSqJIx8mPC3m
X-Received: by 2002:a05:7301:9c95:b0:30c:536e:3a87 with SMTP id 5a478bee46e88-30c84b710ccmr14657333eec.3.1782663766384;
        Sun, 28 Jun 2026 09:22:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 121/128] avro-c++: relax -Werror=unused-but-set-variable for GCC 16
Date: Sun, 28 Jun 2026 09:22:15 -0700
Message-ID: <20260628162222.4081517-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127931

GCC 16 reports a set-but-unused variable in the JSON parser, and avro builds
with -Werror:

  lang/c++/impl/json/JsonIO.cc:296:30: error: variable 'n' set but not used
  [-Werror=unused-but-set-variable=]

Extend the existing toolchain-gcc -Wno-error workaround to cover it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/avro/avro-c++_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
index 729763d133..fdc7303280 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
@@ -36,6 +36,6 @@ do_configure:prepend() {
 # the workaround flags aren't recognized by Clang either.
 # To avoid unnecessary warnings and keep the build clean across toolchains, the flags are conditionally added
 # using the toolchain-gcc override. This makes it unnecessary to override anything for Clang.
-CXXFLAGS:append:toolchain-gcc = " -Wno-error=useless-cast -Wno-error=conversion"
+CXXFLAGS:append:toolchain-gcc = " -Wno-error=useless-cast -Wno-error=conversion -Wno-error=unused-but-set-variable"
 
 BBCLASSEXTEND = "native nativesdk"

