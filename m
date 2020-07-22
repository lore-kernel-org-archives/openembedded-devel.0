Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.858.1595458580970695145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ew1SrSg3;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t15so2138991pjq.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qFGlEaVmaKPJwjaqRgJYUrFkia7Y2FFc6UdXLuV9+5U=;
        b=ew1SrSg3Fm+rmfyTtr/4o3z7LjFezOoCpiWiZ5DR2gQnjVo1KirwOmFQlmjJ71m9uM
         ff7yQNaKEJWTfGkPTg8wZu24BA0ZvMzPj+oV9W3htdrWNC2ejGdfY/caLTWrc9tkcaWB
         XEICrmjrOzmh2uoH7IS7VCWYbrS/i9F9a+4poQWsx3+upMJ07hkznoeqt5oG15Um//wn
         5V7r4r9wEFYUhd3uiG7ifrU/62d6VFPjWmldWXRqhpwdPmRWGmhvhN4fZqsZhd01jY2W
         TVJUuK/sGl7P6+/PlmGez+NbWmOOCWdnMG6qPHjLIs1Mkd+gaqO7PIy/8damakPromcP
         5+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qFGlEaVmaKPJwjaqRgJYUrFkia7Y2FFc6UdXLuV9+5U=;
        b=OTOLpydcizMXgjneRi88XOPq1aL+2SwZkYmBO61fKokNFyz1EOUsknwo+we6TpwU+5
         i7XjTt8+7kMW3Oc21GqJW/YC4qSS21JH13hl2Dny+IPd5CviJogIe0a2rVyGCHJz5Jtg
         bQphBEsAmHxkM1/cM4ZIM7vANTj/6FQYIuf9WIGYiX3/qBYvO6ZXyqgFdLZl7qJZCXXl
         nm5Wm2m8wcwLBeNjZyNpTVpkFvQ+ThmynM9Zp0Y5vOdUmyD6wInbrsbBaIFMvqDogDni
         e4/2Y1YDOsBfzf1mEuiaw/lNb42ssKa1XdeUHQEdHWUaQ3MZGW0PY5GcKOACem2RAPAP
         dTWQ==
X-Gm-Message-State: AOAM531gCHZyHVlsPbiuP58CqBMcpnAEGNRPQOrFw2aCDhRA7RiHQ9RB
	LncWdj3xJSUqJAIbSaYAOLe+zD/HYos=
X-Google-Smtp-Source: ABdhPJxrHEmevu4D6FMh9KnjGY4Pacx+9daO63mjX519ClLdyAOBjSJ7u7qsSz45Uki5bORrWgk5tg==
X-Received: by 2002:a17:902:7483:: with SMTP id h3mr1406953pll.114.1595458580235;
        Wed, 22 Jul 2020 15:56:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id k64sm637357pfd.132.2020.07.22.15.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:56:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-bitstruct: Added recipe
Date: Wed, 22 Jul 2020 15:56:08 -0700
Message-Id: <20200722225608.3968953-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722225608.3968953-1-raj.khem@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created python3 recipe for bitstruct.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-bitstruct_8.11.0.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
new file mode 100644
index 0000000000..a25380418c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "This module performs conversions between Python values and C bit field structs represented as Python byte strings."
+HOMEPAGE = "https://github.com/eerimoq/bitstruct"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
+
+SRC_URI[md5sum] = "8eaf853c95e10ca4b6bca2fe5ff307c6"
+SRC_URI[sha256sum] = "2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d"
+
+PYPI_PACKAGE = "bitstruct"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
-- 
2.27.0

