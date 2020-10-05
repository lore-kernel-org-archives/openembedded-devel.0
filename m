Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.26885.1601867971533693544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+iNsJse;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id o25so5098613pgm.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=rYfP7hIcM7jxpRxvOJ+eQ/bZMXQBwq5/EuGT1uff/8c=;
        b=k+iNsJsegTEj/u8F78mrU3KE5cL5UcviTz8ZDyqjfpDVAEf/RljkhkDvMI7KkYrM/d
         YA1HFNletOZMhx8Mq4C88DXJLuUQgFtRbR0/JvD3UmLesgvJHtQqxcY0UrTDlIMa+WsL
         0mvjLYpeO3WX2rdeFvZRHUs9WmSHTeYSW7/oNcZ8Py/vg1RYllZddVGcAApfTaYvAliW
         Di/iSxWN32Vdi8pUWRONPigtUEbVp/mZ9XE95fScD7joYZBsQ6Y9yzLi/By6b9VbwnvG
         QR5a0d3xrfYttWYDc2/64a9671mvQ7WLvAuo3xWRYrLvQi41o/59xE7ERvlNeFJtYTNx
         ffRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=rYfP7hIcM7jxpRxvOJ+eQ/bZMXQBwq5/EuGT1uff/8c=;
        b=Wec4uGXs1+4LnajiXNthIhqcc6BYL4mbjH9uCyK4biwTz8jZR/b9hm7Fb2W11ujzEW
         WL5hJqE8SaaGqNT10n0yXlvFU/2Cnfi6qOw1S1NSuCnMrSqZxo4ncftsg6fy/5aQFztE
         LkqbrBrfayr8bu+F+fqvrSY7fkhNxVQTj0BxkqiTENMru5l+5f0p17aV8gi5Ok0ek9rC
         Gqvkku8pCZv6PQSubRy8oT3sqLuImUmuTCy9GKDpPa3X8oNfYF/w7mLjJmMaEU/SbDvv
         6jYnvVION60wJAVMMN9f1DkqcSVX64JxyLcrwkQASw1reFsS8eR+jfQd4HqodjNsycc0
         bcwA==
X-Gm-Message-State: AOAM5338GGBjXNr/txsbysOe8NhBHC0oI9+Asqum+reK2xtKJ2jbEjd0
	zALwIQzqWusHZSmCN/WAN6xFVlg+CfY=
X-Google-Smtp-Source: ABdhPJxaDF0Ev67lzTPno+0BgcrmTinYYzqDr+6F4IHY0cpZaCo7FaTaIrfCkRyNDz07CTevgmpKEw==
X-Received: by 2002:a63:1a23:: with SMTP id a35mr12193056pga.86.1601867970930;
        Sun, 04 Oct 2020 20:19:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 9/9] python3-pykwalify: fix missing comma
Date: Sun,  4 Oct 2020 20:19:19 -0700
Message-Id: <2a5c534d2b9f01e9c0f39701fccd7fc874945b1c.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

...
|/usr/lib/python3.8/site-packages/pykwalify/rule.py:343: SyntaxWarning:
'tuple' object is not callable; perhaps you missed a comma?
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a88c7c9bbe7cfb95280d9c4fa10d56ce8a3df8fc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
 .../python/python3-pykwalify_1.7.0.bb         |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
new file mode 100644
index 0000000000..689355eeaf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
@@ -0,0 +1,34 @@
+From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mart=C3=AD=20Bol=C3=ADvar?= <marti.f.bolivar@gmail.com>
+Date: Mon, 13 Jan 2020 08:42:05 -0800
+Subject: [PATCH] rule.py: fix missing comma
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A line in the defined_keywords list is missing a comma. Add it.
+
+Signed-off-by: Martí Bolívar <marti.f.bolivar@gmail.com>
+
+Upstream-Status: Backport [https://github.com/Grokzen/pykwalify.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pykwalify/rule.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pykwalify/rule.py b/pykwalify/rule.py
+index 7ac2c9e..f044b69 100644
+--- a/pykwalify/rule.py
++++ b/pykwalify/rule.py
+@@ -340,7 +340,7 @@ class Rule(object):
+             ('matching', 'matching'),
+             ('matching_rule', 'matching_rule'),
+             ('name', 'name'),
+-            ('nullable', 'nullable')
++            ('nullable', 'nullable'),
+             ('parent', 'parent'),
+             ('pattern', 'pattern'),
+             ('pattern_regexp', 'pattern_regexp'),
+-- 
+2.18.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 5d029bd761..1bbde6986a 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
 SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
 SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
 
+SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
+
 PYPI_PACKAGE = "pykwalify"
 inherit setuptools3 pypi
 unset _PYTHON_SYSCONFIGDATA_NAME
-- 
2.17.1

