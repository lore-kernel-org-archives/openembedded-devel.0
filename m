Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14667.1793092873439104680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EW1dW2Ct;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4246835e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092872; x=1793697672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iIY3Wj9QKu0/A0C4ufZ8O2TTiZwKgC3eYIjBeZRl0s=;
        b=EW1dW2CtNrhAZEx1h0vFQvK1ko31YDXXwSlsiAVZH9yb8M8911OKzPRtJyxsW+j2Vi
         Nop8xeSiRIw3DMBCRcjO1x4iMZ6p9Wdw+oIzqZigDjhRjtlRvuA+OFSWADUKGGPnhFt8
         eB5WYg5k0efBi7e4TKr8/0RTQisjmQhxIQ9ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092872; x=1793697672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iIY3Wj9QKu0/A0C4ufZ8O2TTiZwKgC3eYIjBeZRl0s=;
        b=X2ZOefjOuzFEJDQl7HbRf61NnL4iG01aOwh/kmkuGnyjSTmwk5C15KGLJ8rO2R2RfI
         UnBcYWhLBsm12G7O07P7d/WW0rj+NdxYmAexitlB1Wtxr1R8GilsASlBd1edfbiWQLJU
         hINVcD2bth0QsNbvaWi50xPo3QsfKNwrPjFAEzik2iZwFebqggEFGo3/Eu8lgNBdTPTr
         YdR/lg9uSawD7zxLlnzjgv1RaDqFYlp1lWW5k6uABSvrpKiZHASXT+m31DvVJD1XtlJ8
         Ijeco6EaIJ1uPaDHrruQ3TF5mTYj+LGP9E7buseYGJnYugMkulmwLXRJX1Z1BOf59Cnb
         Pb/Q==
X-Gm-Message-State: AFq9FYI8mflVO2GBMHh34cM8NGQq9kNb5tSseHGr6YLvNmRkoINX3Y7W
	9/Y86/bSay3yFKVOcjve8OMxQ9uYqrT38RI4fMb12mm3akX2II2VKqaMglJ8skLS3cFFJt3SLz0
	YTtXp
X-Gm-Gg: AYBFou1ExzzjCjeQP3JMic9nXG5g/2uibMbsZKjrDy0ib/p8CJ/lY+HllGwxvaEg7cT
	mVxih6eRpxr2yxtamaMNbm1vgzv2kwv1iHZCgGzYK0tOrIZu67YhNco/TfwvyGL8vUfzE5+hB62
	zB/+1HHcENygAa9mLdkAIh6iSIHcYUNapTng8UH2pIyZdmq9R4EQGHu3exkoZNs/0CNTRImmC+4
	rBV/WAb3NkbmdNXX7UimUqaM82QEI4zlKHwWRZifvPaAbgjo49rS9IdGLYSrpXyjc2bqqdcOc4a
	3VatzJNlpdWUAEkQ9a01iNoV4+AmNXOvHv9QIghv5iQQbSvyxQsLJX9B+nfVm8MUj4ZKSu2gsXm
	YmZEI6cV4eHVNH/DM8doqynfb1iH6F8loPHSxLLX+ATiozAq4uBZyESVM4LCTWpKLfw+Fd0RrQu
	v9VIQMwPDvO59QJbYdbXEP1rahZk4o18+J1RKNgkrXR0F6a6lXgHh5sJT0F5WuupjaM6BtXAKYS
	OHCoTgJXlOcm4nJc33LDMoJYlLYHB4nLvYyjIhVyB92VNgfNILh5PYg8nFJnmOM/GPRpaMAZ0pN
	31Wy/HYFjIdEliPbsLQICL4siU0jvfmxWaCzbCRykUw0V1p1Lw97kwtWF7IwuTa0qQhhaU+eajo
	4eYMa
X-Received: by 2002:a05:600c:3f0d:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a7c18afbdemr43948145e9.14.1793092871740;
        Tue, 27 Oct 2026 02:21:11 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 35/61] python3-robotframework: Upgrade 7.4.2 -> 7.5
Date: Tue, 27 Oct 2026 11:20:02 +0200
Message-ID: <20261027092028.782979-35-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131499
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.5:

Robot Framework 7.5 is a new feature release with major enhancements to
the library documentation tool Libdoc, support for test/task metadata,
enhanced console logging configuration and several other enhancements
and bug fixes.

For more details, see the full release notes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-robotframework_7.4.2.bb => python3-robotframework_7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.4.2.bb => python3-robotframework_7.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.4.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.4.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.5.bb
index 5c83d923d4..8dbf7ef936 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1c934e7f43600de407860cd2bd2fdc41adad4a4a785d8b46b1ed485fdc0f6c9f"
+SRC_URI[sha256sum] = "ff6233ff752a200ece4d0a6c59f6f9f7d0e96dcff0a7a3458296b997b812482e"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.47.3

