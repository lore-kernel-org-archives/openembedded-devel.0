Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.6572.1588252581569849176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 06:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c7ozAVAX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id a21so6391991ljj.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XUpqpoQdV8BFWLz1rFXKrovop8QiDokQ5p4z8+tnOoE=;
        b=c7ozAVAX7wNpf19LU0PI5AOwivRBVL5o19Jv65RtRtUZL4nIZmDBeCDWxMmJqAiJik
         Tvk0m52SymmfrRwNq4QFySRjh4sQmKDZTgHVnkkgjbsYO7ZqXuDKzl3oqabJlky5YKlu
         5nKe9CVD69KH4Bl2NvCStfcjV+DylXaw6igtw7a0R4TuZZV3KNZGDeRWRjt09AbrNRZ5
         3XrjWQoFpqT/FE9hUKxX3SKYi3Y6MiUPEuE7xJZkIkfUi6wmxG/T6DmWmiqRn3JZ+ERr
         Yggvc36LdJBjXLI5Nl4hB55rZuCKTG/T00gvURy2f8EfWYtDRhrc2NNy6H/VHlqf40ln
         p7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUpqpoQdV8BFWLz1rFXKrovop8QiDokQ5p4z8+tnOoE=;
        b=gdRx9AOQFyvAxx+q22hl60+5EU/5msVR1J0NkTO0nGOlZdKzWwNY0FLdJNqUanFhqB
         EEB9IduX8y/Dy7ZkJbNo/fJS/2H/ABbsqCSUk/kQR33eFmMhDQJ21Hv5XUU94TZsFwQ8
         p+joiBMBmlFUXcfM9qTFFF2YPoTf2zf7iTjTiYKpOeMcTODnMgR6OwGIB5eovvL3Jn3F
         YTYBgbMxpWWbvB2zzzWjKbRpU0mirywKYPQGSgCcen6voedjt9NAKxdxjEOmd7JObD23
         TW/LxGctBROG8XVvvNhBsfjNjRKN2Pbs1WKUbBIUqGKg0+NjwMLb2EjLJYAZ/iKYLHsp
         k9AQ==
X-Gm-Message-State: AGi0PuZoSypP9EgboPZRxftly6SEnge25lUxWZsO4CdUt6LNMo81TWYe
	GiWut3xLMp1x9sy6jEcbfgoQqIEmtkM=
X-Google-Smtp-Source: APiQypK30o376XbiwPYn0ncrHBIdYeFcAdRt9vgGUo7y7E6bOibZIOtz37c/ed/HrOvhIIGn4zvNYQ==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr2071811lji.66.1588252579254;
        Thu, 30 Apr 2020 06:16:19 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id q6sm4824506lfp.28.2020.04.30.06.16.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:16:18 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-java 2/3] icedtea7-native: Fix building with GCC 10
Date: Thu, 30 Apr 2020 15:15:55 +0200
Message-Id: <20200430131556.2150334-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430131556.2150334-1-jacob.kroon@gmail.com>
References: <20200430131556.2150334-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 8d0dc71..b0b9419 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -28,6 +28,9 @@ CXX_append = " -std=gnu++98"
 # WORKAROUND: ignore errors from new compilers
 CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
 
+# Explicitly pass -fcommon since GCC 10 defaults to -fno-common for C sources
+CFLAGS_append = " -fcommon"
+
 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
 inherit python3native
-- 
2.26.2

