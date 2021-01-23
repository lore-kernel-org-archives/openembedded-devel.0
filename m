Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.11428.1611429929588338213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 11:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qkxZauFA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a9so8315233wrt.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 11:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IX44GOVBF739GjadR7hZslG4MqGZ1g2R3LDMpaKni70=;
        b=qkxZauFAfTIvXrAMYuxbEn7tN0mOfDZcXUc7azaC9Sbmfq8cCcH8M5pBqEMS7E+AzQ
         hyXzxqjVNnqaW1ukBGfqkCCydieIZswZdKKPDmVVdnJZPR+F5zduVINfM6z25ZbXvpB7
         5QViIN6rBHQQHi66X6g/aaFczBtzt7YX5hjmP36NjIcMlYZhGxC/YbQAqsz+pc1byzIi
         V65X2EfufBQEsiwq9EC1gskq7/f2vYvujIC5fGKDMPFAYyLDsqO8UtJR8UkvPPiUPucn
         kdB5CpSMg5qE0/p3AZTdDz8/EA3vsHNkHW6qJouIb1QBSMCnCtyoDNpOh2rJ15ZP0HU6
         HILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IX44GOVBF739GjadR7hZslG4MqGZ1g2R3LDMpaKni70=;
        b=l/CW1X+Wn+fQmW4dnUcpAm6195NchPm1rEoqWwT9DhBvzvfjw18KFkjkSrCWGRy2zB
         yCEdQ7WaojK+rg1hlrQmBIcmPsvJArS/mjtnwRlu8vSDesxwE9PI+VRrdPtrE8HXMS+h
         kq54gm2kisTEg/GkKA9db4LKaxqUxOB67MypWkHNdCkIzmZvRhb2EEdTKcIl+BYt57AR
         45MJeXeY4kaE16EhIDkvxggNggsnQy2At5OK/ZxV8519IikBQhKOsnCsitIXM3dfLT5e
         Am9W6ivBDHuE2/K/HENRQb66LeXJvsoiUeaKTrEUf1AfLbTW+xLBsWVnE4nl5EmK4J2m
         dtOQ==
X-Gm-Message-State: AOAM533dyyX2CejTjyBG6+IRVfMMCdPGUcwab47uiX7oF2CMzv4M6lxr
	1oKVAyb/5n557FZCHgw9widkyDwnc4xrBQ==
X-Google-Smtp-Source: ABdhPJymeefCidqa6UgECJcUOulhmq2A/kAL+meLFL4lJtAHGeZK9z3vtLnULedUq6sWuQQuuBPAyg==
X-Received: by 2002:adf:8295:: with SMTP id 21mr10036963wrc.32.1611429928285;
        Sat, 23 Jan 2021 11:25:28 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5532665fa05402b8466.dip0.t-ipconnect.de. [2003:f0:7f38:e553:2665:fa05:402b:8466])
        by smtp.gmail.com with ESMTPSA id n11sm19159740wra.9.2021.01.23.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 11:25:27 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH 3/5] python3-send2trash_ initial add 1.5.0
Date: Sat, 23 Jan 2021 20:25:11 +0100
Message-Id: <20210123192513.2663547-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123192513.2663547-1-schnitzeltony@gmail.com>
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently it lives in:

* meta-jupyter
* meta-microcontroller

Seems important so add it to meta-python

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../send2trash/python3-send2trash_1.5.0.bb               | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
new file mode 100644
index 000000000..d906c0b9e
--- /dev/null
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05faa35ba1ca10b723f19d286c9d5237"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "60001cc07d707fe247c94f74ca6ac0d3255aabcb930529690897ca2a39db28b2"
+
+PYPI_PACKAGE = "Send2Trash"
-- 
2.26.2

