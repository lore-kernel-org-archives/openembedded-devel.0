Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F03D2CE1E
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.21778.1729612085270705350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IdtpRNc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5a5a59094so55159687b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612084; x=1730216884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy9DQ0Qj58ocveBobWH+sinnV4JiJRRsQB+7NFHEPQw=;
        b=IdtpRNc6+LhxdBxjZN70O+jWXMsGhpQr+o+rbLjRhgjITDPEB58H+GtoQmb6I8wD/R
         RrKVp2fYUWJlXbQeGoBgv8Rr6VBE5vD1LCETGHhPyUYOBQ75cJkPf4temJ4RzJE+aO9v
         bs+MWs5LQnqUrStpob9cj6tYH/mP5EZoBQpzmj7TlI7qWVbJxtOznZ/UIynFkgxfOiwa
         wDleEk/CzWhl67iCKgXJCY3Y3caGHjm3Cs9LkqeX+NxYvLAh/Y+yIIORXduT/oy/R4Zl
         V0DqsZrFPg0tL4Jid2JPmb89xuPCQ7WjFK22gATnsoKIyNiA5pQJgg2VJ/7IcTd6bImK
         t9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612084; x=1730216884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy9DQ0Qj58ocveBobWH+sinnV4JiJRRsQB+7NFHEPQw=;
        b=ampzvYkxNsEmbDY2VKT3TI9afUcWMoas2kKVhPWLlRTVT47NpIejAbGOSHr7tjBGIb
         ikz+52jrmvqGl/AZIwofa96xBM3fBPR+32seW1Shr97sTttk3auNUCrJ+TTTPJq5z9Kj
         v1K6e52eJKjyxaYzljO5E1Rijss+hfwf4gUor2S7AmX9jJVHbOoN8Ih6lO7xENVbkLd8
         ZQtl48QTimd6hpt7elIgK/yI6kvMnxaQ8ZeWxfMX60NAVEeyQU0l2hfOws/rwPdVjQqB
         aZc7MM4mQfpzpfkLIfTvIkURrBxCcbGR2fWWNNA5oDs6YfR7pHvUjVEok47af8NG7tk4
         gZKA==
X-Gm-Message-State: AOJu0Yz3FgOxwLsNs4C6HWFjGc7CeYcWu/3oXINGY28aorEEoCIoykQI
	BUV5LAkXpaTo5mFMADdLwDLdB3PuG3J40xBIJ/uqnME7b+wzlTrh5VdOCw==
X-Google-Smtp-Source: AGHT+IEEQLfLMOpjWWLkU91t0ZecGrhAJm2yhU4y1vV7i95+eqmf7z/SEyvLavMJyjyKn4WzWFmFkw==
X-Received: by 2002:a05:690c:9a08:b0:6e3:16da:e74 with SMTP id 00721157ae682-6e5bf9a7543mr157392247b3.16.1729612083951;
        Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 15/46] libextutils-installpaths-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:33 -0400
Message-ID: <20241022154729.20331-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113106

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libextutils/libextutils-installpaths-perl_0.012.bb           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
index 07dab4e16..f4db4ccff 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
-SRC_URI[md5sum] = "9a8d66aab1ffec98ea260faf03ac612b"
 SRC_URI[sha256sum] = "84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed"
 
 S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
-- 
2.43.0


