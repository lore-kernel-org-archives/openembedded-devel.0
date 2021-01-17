Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.21487.1610905603332644218
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KF2EL08Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b3so8831380pft.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wOE0p8MWmt1DBEqaleWQtS23GYa8RbqrpRn4ypcPH48=;
        b=KF2EL08QAPqNDK3HeT771UdVhAgHP2tJykswFJh5kvh6JNrJsgRptRGU2/4Ry3i6UV
         nF0NLfmwcEiDnRcBm0Ebb3dtuL0fwHgS5U2mgvBAt+Jy2sTkUzY/zQHghNuN5yMulddz
         jzwF5whGTO1ZfVQSVDG7I/Vg7Exx4zJhMSinivdNwuh5f+CRj1iDDiuVxdKV4HqkhVyo
         zFCrUJqvI9K+X+5nhqqYfzvJ6WG7pFA79fyy7OiwpgH/dwheOmFpwftkaq+AwMLFsS6c
         xaty4+lfYBNYVApexXevvoIjcYk+oY7y0iX9n1tlk9magRBcvinjzd1nFRmuGfPSEdA5
         oxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wOE0p8MWmt1DBEqaleWQtS23GYa8RbqrpRn4ypcPH48=;
        b=SLkkPOaxKJWqRcEI1ke9uXf/yzZ9WBvOZwLjaPNgI0j6hGXzpQPyoLWGJhnG/a7/AH
         oLhlNponpCKHzXXPqa6hPTb4643o2wQeo0Ydh5tP8eeXkDc4WVOl4cGRUAkkrRZ7RHhS
         k8gIncrZX5WOXCvqS58xmmkwokoPGUrKC6WABQKYzs5+q0DLEmESAnidCBD7p5KZWYf8
         dOrlZVTITRteTmNrxsR9mQ0zNdL/pSL6dynVeFkmNPMhLpZa6gB17/aXKNaD+UyTu99J
         coOC/qofpqHGo1J9ALJw5YvfTsI4aqBSj18a7anQ7tnIuk1AIr5NNXxICzfW58e4HTWQ
         rbuw==
X-Gm-Message-State: AOAM53315e4mzF1suzvWRucBzY0chWHGzy2zQCTAsUu5ajWkqCVlvv22
	gEqn2i5C56gIjpKxA19+zIlvYvxxvILYdg==
X-Google-Smtp-Source: ABdhPJySn8HNcxojUgRZyoWeHGdkwOp8gfEisLqJTNhFOUcU0xUOE6gAI8EHbR2kg15QQZy9ZwfIbQ==
X-Received: by 2002:a63:585a:: with SMTP id i26mr22358049pgm.330.1610905602774;
        Sun, 17 Jan 2021 09:46:42 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:42 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/28] php: CVE-2020-7070
Date: Sun, 17 Jan 2021 09:46:09 -0800
Message-Id: <8d4826f656e07802cb7c2455164855aa0c5fee9c.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Security Advisory

References
https://nvd.nist.gov/vuln/detail/CVE-2020-7070
https://bugs.php.net/patch-display.php?bug=79699&patch=fix-urldecode&revision=1600650364
https://github.com/php/php-src/blob/master/main/php_variables.c

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aff8a1fefb9a1a311e5ba14ad69871514270803a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 09f5a2ac5ab8550f5f0bd05417f2f54d27995dac)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/CVE-2020-7070.patch               | 24 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
new file mode 100644
index 0000000000..e5b527f989
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
@@ -0,0 +1,24 @@
+Subject: Patch fix-urldecode for HTTP related Bug #79699
+
+---
+ main/php_variables.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/main/php_variables.c b/main/php_variables.c
+index 1a40c2a1..cbdc7cf1 100644
+--- a/main/php_variables.c
++++ b/main/php_variables.c
+@@ -514,7 +514,9 @@ SAPI_API SAPI_TREAT_DATA_FUNC(php_default_treat_data)
+ 		}
+ 
+ 		val = estrndup(val, val_len);
+-		php_url_decode(var, strlen(var));
++		if (arg != PARSE_COOKIE) {
++			php_url_decode(var, strlen(var));
++		}
+ 		if (sapi_module.input_filter(arg, var, &val, val_len, &new_val_len)) {
+ 			php_register_variable_safe(var, val, new_val_len, &array);
+ 		}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index fc01ea1953..73caed6543 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -30,6 +30,7 @@ SRC_URI_append_class-target = " \
             file://phar-makefile.patch \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
+            file://CVE-2020-7070.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-- 
2.17.1

