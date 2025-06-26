Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E5BC7EE39
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:56:01 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.4561.1750931758731637223
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 02:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=df+eyMW8;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2e9fd208so158468066b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750931757; x=1751536557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXaxorMu86G8t2klt34K5Kr/NNoi+JVgHQ+YtbLM4dM=;
        b=df+eyMW8UHGjjnyitmYewEIUa/9CCgaFDshzTQR1E1l2Gv3u4nbrKUJjbnSkfII9ll
         +HF7pAjht813sZNIrFPYR781YjYpPFvNRP1uvRhA3LfTPnHRzAafcGIMSNZElCcwyhoN
         VyiCd+aJkv5hd9b32KE9WWlTBNzhYZ1OTN/Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931757; x=1751536557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXaxorMu86G8t2klt34K5Kr/NNoi+JVgHQ+YtbLM4dM=;
        b=j6znXQQMCqCkuL7NkitmbUtQjRDeWIFvATKrJBuVDXiUdatqEGgzXIjK6P7zbA9Ogt
         qI5sI5SkvLtwS35Ijpy256pgtV6268+tJTgDI7SKaF4mXUAMkkGHIn+vK1umyUF1z7kC
         PStbEWV00l/Pq3f0vOmo1LTBmpEHTyqcU6oHryldMz+R13EBLNFb/xG49GblkZgW92OF
         kELlp60VdE4aywK0PK0WNDteH6vnkHzp4BBgZr3ePDc8wgO7AKB5hmAAasvY2nREWWrn
         zntXvX8201LnXdBbTxRGtKYFCFT8wTDxh3dXGPPzqUaOVzGwLdpReatiaPz7nNg5mwGZ
         uY1A==
X-Gm-Message-State: AOJu0YwklpUhd3jvxOw2LrHdbHMuIG7FXAX/2dTjRcCn9/cuUpIznIwo
	w0V65l6LvnKVYl6kON/kzea6wnPk0zw/KvhfLnxMfxyYHNnKzmqMeFuzcz2lB9BcyCP0n9OJ6XZ
	n8wHa
X-Gm-Gg: ASbGnctrKgn0qKS0qYAjrxH3Z5EcozLyNummdkqM6SZpMWKho97qt7tZlkx8fbw92bZ
	//2I1QEQk9gTt3+SyNs5f4ntMnJFVzZt8nf69up01iUQ/4UCVZYkTMejlVIZXNi5C/G7Zt7wMfN
	C1EUvFZ/F/uzpxQImhmSL4WW0zv7M9cyU3EoVoIATfw+EHNCeuFUztha3kE+bWDtk3U2zd8Fm6r
	INsSAjgH3Or15YlOecoMqGFr9bJazgZEZ5l8p1c2oDycZYmOWpqbn4ge82MdXYyM7q0+2mSTIHY
	uzVYiPFSZ0M98cSsy2S4T53TZQdWH84o14HbVoZQTb/xkiYq2UP0R+w2MmDhEXlcxziazEnWuxz
	M6adg9/FUOJg=
X-Google-Smtp-Source: AGHT+IF6ZM/r/Y3+ICRcByx5M50JcKZCQL62b05VImhLRtYIjnOf/pFhcmJSOJiYXDoM3HK2yW12wA==
X-Received: by 2002:a17:906:c108:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae0d0d15df0mr317422766b.41.1750931756775;
        Thu, 26 Jun 2025 02:55:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ab44620csm449628966b.163.2025.06.26.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:55:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-types-psutil: Upgrade 6.1.0.20241102 -> 7.0.0.20250601
Date: Thu, 26 Jun 2025 12:55:53 +0300
Message-Id: <20250626095553.585599-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626095553.585599-1-leon.anavi@konsulko.com>
References: <20250626095553.585599-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 09:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118120

Upgrade to release 7.0.0.20250601:

- Add missing __dir__ method to psutil.Popen
- Replace Incomplete | None = None in third party stubs
- Update psutil to 7.0.*

License-Update: Use LICENSE file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-types-psutil_6.1.0.20241102.bb       | 10 ----------
 .../python3-types-psutil_7.0.0.20250601.bb       | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
deleted file mode 100644
index a24e23be70..0000000000
--- a/meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Typing stubs for psutil"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "8cbe086b9c29f5c0aa55c4422498c07a8e506f096205761dba088905198551dc"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
new file mode 100644
index 0000000000..fead4ea903
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Typing stubs for psutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
+
+PYPI_PACKAGE = "types_psutil"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "71fe9c4477a7e3d4f1233862f0877af87bff057ff398f04f4e5c0ca60aded197"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "\
+	python3-psutil \
+"
-- 
2.39.5


