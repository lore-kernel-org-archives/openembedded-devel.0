Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6CBC2A077
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60168.1767601927283877976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KaLa8bDW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so76448105e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601926; x=1768206726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90CsBO+tzAPsbXOAJkd9YCnof5Z+13VGDVZmBuMO1DY=;
        b=KaLa8bDWVvUROfr6yI/IyUCaUKKvilR6bTPHFzeQnM234cvF37qov02G0wgMkk33tg
         cuCHaeBpaLZM5x2Dbg8owq9HZ9R22pTB3Q52XfpWUbMf1Qo5jo043qGsExMzaaFi54HN
         opi28iHRI/mssfq0svJztcLaKi8klEV25FFijPuY7TPxirh5C6eM0VUqvxgxyPgU4XbU
         r9ek73bIby5FpYkIUzfs6ge891tvlJaK+G3cyDwZlU//pk1+Kxh50maFFj3xCwZ4Gm3j
         JI/PksoLmu8P7S1tALs1lPmwrd6tuP8H4fT9MM+AIay7cw8GnUWfInza+nDLOeXXlwfk
         qqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601926; x=1768206726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90CsBO+tzAPsbXOAJkd9YCnof5Z+13VGDVZmBuMO1DY=;
        b=QSdMY2yLYnVOfklwZzvbZFYcwFU7cDAXBhK0T7Cx4cDBfKdYlVrUPzOeDA5WfTIIRE
         LZgdXlJLBbeUQj30ttP5YDbQBFJpEGpLCmOFigVB4ZaGbJ30/qh5gMmSLZ+NGZ5eeIaa
         xU8KztdKCzwTkorRQfImY9KTlP08ZhPTfAak+UOH65OkyD19NCguhaqPZx2+myCIosBY
         +3tCdl7qAMf7SetLpEnDm8gbEVYWNnuxW9SinxkwFH0vr6H5+8KGoXnj6t3oX3+eM+yw
         h1BBFRYFsvFGYmF9z8fHO2bfGoHUbRWDGBGzoIUDwCvZuSyJ8vQf0MvbPtCGedbo4+9K
         MnIg==
X-Gm-Message-State: AOJu0YyII52k7OdxM6sJKJelSO7nG7Et3wvWQsxDOvXDCKHezWmDZOEN
	7asBnSh12xPEX7SB/EPI4jqSjO45Rk8QOMolMmbyiZhyj/FtDjjUkDKroMQTjw==
X-Gm-Gg: AY/fxX4SYuZwqcb5Jo3/yzoAxGbn3InsAhFjaUHa1X1/5R1iRpNxSnWDQkCeFkjeL4a
	49p7xgXsI4Mqqi3UE+A6Kh3JqxJDgUSyMQnkl2sFAQp0uJr7D9pMiadlzQSe4VEEWy/1tkfV4xT
	PoHkIcm/Rb/sxDdL9KLX4z/la36AEAOYUKuWLMnsPE1HmJKagd9wnGwc7YnmCANCCQmeSLjn6xk
	+sGpEGCvemKUek9YCC3cpAoei9+OY+utc45KhSMTjjzZDfrm3nwThKpTQEp8vt8hDIoEtgnG2/9
	Z7VEvF3rUBRMOCRDoSXDzmhCApJhkzoerwfLAcFFZetJfuIFaRzmwVNCivFLyEt9I6FVfQpQDE2
	omcgykXsbh3Tv/YYIT9oQZDwfckZAye+Kc7a0H/bmEBfnJImxL0ka6Gq8wmQZfPzsjX49JE2vsi
	KRI667UTt8
X-Google-Smtp-Source: AGHT+IHA6nsjjGqjhel60Zk1NFfoqH//P8ejGVxSFDzvVE7ij+dxlzc+2bPU+XXNT6GnscwepLXkGQ==
X-Received: by 2002:a05:600c:c08a:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d197f67edmr453260885e9.27.1767601925456;
        Mon, 05 Jan 2026 00:32:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be53a0csm54867635e9.3.2026.01.05.00.32.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:32:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-configobj: patch CVE-2023-26112
Date: Mon,  5 Jan 2026 09:32:00 +0100
Message-ID: <20260105083201.1225143-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105083201.1225143-1-skandigraun@gmail.com>
References: <20260105083201.1225143-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123130

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-26112

Pick the patch that resolves the issue referenced in the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-configobj/CVE-2023-26112.patch    | 25 +++++++++++++++++++
 .../python/python3-configobj_5.0.6.bb         |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch

diff --git a/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch b/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
new file mode 100644
index 0000000000..35d8ea77cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
@@ -0,0 +1,25 @@
+From 76dd27ec0dbde6c852f412390ac4e2cfefa8af76 Mon Sep 17 00:00:00 2001
+From: cdcadman <mythirty@gmail.com>
+Date: Wed, 17 May 2023 03:57:08 -0700
+Subject: [PATCH] Address CVE-2023-26112 ReDoS
+
+CVE: CVE-2023-26112
+Upstream-Status: Backport [https://github.com/DiffSK/configobj/commit/7c618b0bbaff6ecaca51a6f05b29795d1377a4a5]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ validate.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/validate.py b/validate.py
+index b7a964c..af76898 100644
+--- a/validate.py
++++ b/validate.py
+@@ -542,7 +542,7 @@ class Validator(object):
+     """
+ 
+     # this regex does the initial parsing of the checks
+-    _func_re = re.compile(r'(.+?)\((.*)\)', re.DOTALL)
++    _func_re = re.compile(r'([^\(\)]+?)\((.*)\)', re.DOTALL)
+ 
+     # this regex takes apart keyword arguments
+     _key_arg = re.compile(r'^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*(.*)$',  re.DOTALL)
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
index 1125a6389d..589ad6f1d9 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
 PYPI_PACKAGE = "configobj"
 SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
 
-SRC_URI += "file://0001-Switch-from-using-distutils-to-setuptools.patch"
+SRC_URI += "file://0001-Switch-from-using-distutils-to-setuptools.patch \
+            file://CVE-2023-26112.patch"
 
 inherit pypi setuptools3

