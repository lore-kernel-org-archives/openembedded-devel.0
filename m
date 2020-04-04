Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.10034.1586011124053916431
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 07:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sRwxJSiN;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id 65so12091070wrl.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OV1eEsN4HFQXR1Ml6wSzE1bSezl4/G2TQ//IzOJvrnM=;
        b=sRwxJSiNT6EYuomGDQX03RsxUhI0M5MEvmICfZElzXNEVw+QwMeiMHweB9bE5ieCI2
         eNpsxO5WMhSX5AogrobGwZw48vCZCmqUxiSkYoVfSF7AEiI7WRtgJS4+YjiA3fefFO5i
         b7zdN6IDLK94gt/j+h8dMrA6k37eyueO3E+owpTgHtYbCeys+ti8euF1Fd9Cawh308rc
         YBpDz/mpJqXISzHs/k4H/h+0Sd2R9Xokmp5GuAFAq8to51HY8mXgJ76D/3A0IVhMz59Z
         imiMsUjF0VYy+fajp93yybz2K+d9q0rlWLf4r6kWPt05qp4FyrXeHGAFAYTps51brECB
         g5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OV1eEsN4HFQXR1Ml6wSzE1bSezl4/G2TQ//IzOJvrnM=;
        b=Ql9WLebPQE9GDLEf0yTfxGukS3qpgeUP7jFsaM0YQibDiv5mDHZwJc9DksMxxrJrfu
         nqLIUjXJM66VP5yLprmNFmSwVq6zywWQVefP9OTzke1mV8W75cR5xNibli5pYaWAfZA4
         emo2n/Yy2qviWsS5g9fmPIQW7e3t76Et6r9RjDtO1OvNCsClMDlpHwIaPNM24gQJ72op
         cZDv606MZF9BWPfiNPVgiF0g38hLjU6gjkp30rIDwm91q701EPY0xobGunAlXOBoB+5u
         mW+Pk83yT3hSJBJwYEMTH3c3Yb5uGZNa9oXkXl7wzZ/x0dgpsVO1qwYYht8+7TKecpFz
         Akfg==
X-Gm-Message-State: AGi0PuYEfkEKEJRIpHY85FLS4Q0ecEmCkbRcVABnUGRQPyxdC+/v5hxw
	I5c8TpF1fh3BqdAdl3gI1ixfkCXTDRk=
X-Google-Smtp-Source: APiQypIKCH/Eul9qcKsoTjOMg8k/UU/b/nkZYRbLlCxCXFq+h0R7jpJcYQOv/XmmkZyY7YyV9Hn69g==
X-Received: by 2002:a5d:4306:: with SMTP id h6mr8744363wrq.234.1586011121822;
        Sat, 04 Apr 2020 07:38:41 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch. [146.185.2.7])
        by smtp.gmail.com with ESMTPSA id v7sm16751254wrs.96.2020.04.04.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 07:38:41 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: [meta-python][PATCH] python3-pyscaffold: add pyscaffold recipe
Date: Sat,  4 Apr 2020 14:38:37 +0000
Message-Id: <20200404143837.1377-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>

Add recipe which handles pyscaffold package to the layer.

Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 .../python/python3-pyscaffold_3.2.3.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-devtools/python/python3-pyscaffold_3.2.3.bb

diff --git a/recipes-devtools/python/python3-pyscaffold_3.2.3.bb b/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
new file mode 100644
index 0000000..dbd222f
--- /dev/null
+++ b/recipes-devtools/python/python3-pyscaffold_3.2.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python project template generator with batteries included"
+DESCRIPTION = "PyScaffold package helps to setup a new Python project. \
+After installation, it provides a new command [putup], which could be \
+used to create template Projects."
+
+HOMEPAGE = "https://github.com/pyscaffold/pyscaffold"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "PyScaffold"
+
+SRC_URI[md5sum] = "6769d2a26a9d1f3038944b8fbfe728ff"
+SRC_URI[sha256sum] = "96c3e7f5529df0b5b351e879a141e1e5c9f26211f30d493c23d8c09d9d610a6f"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

