Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF66CDE02E
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 18:17:38 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.51084.1727374658281389953
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 11:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdB6oL7Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so897017a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727374657; x=1727979457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S29y+JQ2Bc88WLIsnU/avq7b2dUPinI16bPdeV9Yp+g=;
        b=gdB6oL7ZYOXGNb2VreJ/FpSeacbTEcEixDnGuz0Mp4L6YS6Ffi0AhkwYMe0YbNb/lU
         gyT5nMpYfsS8siaw8zkKPlDPvXEXtbiHfZ75zhsR7P+LEeEwPfqaRkBICuJAhGQ9JB/1
         ubI+v0u3Jol0hnn3thDsojlCDqWyKAM+/y148shtTF8cYyutOU5gZg3bsIaJtP5WRBZg
         LcdOZeZeuYT4/YLdnqhgszjajz51R98dxUYOyNTDZp3PqtgwxNPjp+yArhxsOiVBN96K
         id527QqgjtUzZZFvnS4+W9oS93jYaS22xF7eGMgvDaivwT/PJBafTFQn4VzT5ekTGb3e
         YjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727374657; x=1727979457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S29y+JQ2Bc88WLIsnU/avq7b2dUPinI16bPdeV9Yp+g=;
        b=M6gVYGSjfK7eicF/L3ttm1IT+Pzb5JRDekPewMDfajV3oFavyWqaVExEaXVqLh8ad/
         OrbU89jncBEHC6D5NwEwpnQuSzqQlhBcdqJsZz2lkkAtTTAovNva9UlCpxN487hydbYf
         jKmOXGomMbZPb7MElROMK+zQwoFEhVlow/VIiCZTZm5Gbdmv8wNeQhSs7yuLzu1ZGuB+
         AAAikJCwEYRvw6pBaWL3YURBH+kDTGZ7soOpswkCO+0tGNZwj0IxXppzHt34NzekEbwe
         E/3Xr+gSlt98uw53gmw/vV+a3Ie8lbOeDURlb6RuMMn6CZIcnZeztAVWNXeFV+3tKkW+
         Tnrg==
X-Gm-Message-State: AOJu0Ywd8TM4DOQsL3lqS4ZBk85lIeeGGxvghm0Jwnoy+1uNZwndgbBM
	FmL7TWvlMpxvykiHW7tAekgWBl9CQ2g0gOd/0xqnwCw0k6Pbaq6GQ8iByw==
X-Google-Smtp-Source: AGHT+IFDUks+iTzxNrXmHU9bMupEg2jEWAVTmmTBGK4AMgwSxf8TrkqljhEFIQxkpjuwWGnsjuNmEg==
X-Received: by 2002:a05:6a20:d805:b0:1d2:ba7c:d8cf with SMTP id adf61e73a8af0-1d4fa64d297mr744987637.7.1727374657403;
        Thu, 26 Sep 2024 11:17:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5ecd1fsm172049a12.58.2024.09.26.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:17:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-sqlparse: Add missing rdep on mypy module for ptests
Date: Thu, 26 Sep 2024 11:17:33 -0700
Message-ID: <20240926181733.932610-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240926181733.932610-1-raj.khem@gmail.com>
References: <20240926181733.932610-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 18:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112522

This is needed for fixing

Failed ptests:
{'python3-sqlparse': ['tests/test_cli.py:test_encoding_stdout[encoding_gbk.sql-gbk]',
                      'tests/test_cli.py:test_encoding_output_file[encoding_gbk.sql-gbk]',
                      'tests/test_cli.py:test_encoding_stdin[encoding_gbk.sql-gbk]']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
index 62de2327cb..daf67607f7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
@@ -16,6 +16,7 @@ export HOST_SYS
 inherit pypi ptest python_hatchling
 
 RDEPENDS:${PN}-ptest += "\
+    python3-mypy \
     python3-pytest \
     python3-unittest-automake-output \
     python3-unixadmin \

