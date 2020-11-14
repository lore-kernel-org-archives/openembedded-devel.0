Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.7593.1605368815961409245
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 07:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AiY4oIDE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id d142so19120831wmd.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 07:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UhtmWd8eTWsHxKzeD/+sCpjdfNeENS/YvEI8/OMDFIA=;
        b=AiY4oIDEfJirDHqeI5qTt2zHY1qSN0AYBnzmYvO5CQOoL92fX9PUjKs/PH9UMkrWiU
         hn9YjkQ5nGgsrJUVILBV251ojK0uJseft63GT8S2Bgx+q2TOu1uSVMHvOr75wWjJVcTW
         AkIWuYJ8HQ7OnVuqu8osJi1Y4G74YCMMgTRUbLBO5o0kr6ysR9FNcEiiiEqZ7UmKG8h3
         2yr+6skeli9XgMxE0gQMCT9yazMqB0qJDSjPiz9rigudYTM9L1sX14+Seg+75euJc6zk
         xEG6SMcSirpcR+XFjz+lOy5jEwIYvrOqP4+GG8T3EH6O3Zeyx0MdqAdq8mLqaKhiqW3B
         PzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UhtmWd8eTWsHxKzeD/+sCpjdfNeENS/YvEI8/OMDFIA=;
        b=gZ81KCtDaqznYeMkNKkW+vjeonIwGvDeT8kc2CxXIUO/8fhqCekEs0ZNuDOJYJj3PO
         0Ulb7MCVh4mYKgFyuSFUuFp0vDNimQad0tK4s1jQWIvU4ty24dN3cbrBYdlRUzIwnF0U
         PNKmEeUgeo/e4Z+dNBQhhoxqiSg6LjoRr5Qyt2A6cL01cTcu3at1Rvy96AUlUf/AT6CW
         rDJ84VTkXo3mnvXCrEZBXms5M/X4guM0XHfeXTA9g+oNzxf2W1M/G27S3uAmz11kZrHk
         3ud9l+qKTrEWjdDc0HQEMprjL2XWEPzRuFihsxRDLYv0MveGHIfWgFUdGy6VIxOTqU9T
         49mw==
X-Gm-Message-State: AOAM531Di1goXEHeKgdW06OV8J+yiQQtVmY9TSU8IWm11YIZ+cFaLao5
	0fD2X3e8vPNK4rUmlGvylS1WbhImQPI9hg==
X-Google-Smtp-Source: ABdhPJznnJxZZ0Qw0CXNfLatE+kBQDuK0tTd6gqb2Ldq9vUY8kclkA11LLIWvFDB7XrAYH70kMDf4Q==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr7220682wma.15.1605368814260;
        Sat, 14 Nov 2020 07:46:54 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 109sm15879810wra.29.2020.11.14.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:46:53 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/2] packagegroup-meta-multimedia: add srt recipe
Date: Sat, 14 Nov 2020 15:46:28 +0000
Message-Id: <20201114154628.2669516-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114154628.2669516-1-quaresma.jose@gmail.com>
References: <20201114154628.2669516-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b4f09cdf54..78c7c06b22 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -101,6 +101,7 @@ RDEPENDS_packagegroup-meta-multimedia-support = "\
     libmediaart \
     gst-instruments \
     libsrtp \
+    srt \
 "
 # devel headers/libraries only packages
 # libsquish
-- 
2.29.2

