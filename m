Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03343C5DF67
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:50:51 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2488.1786762249679129456
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ogf9Em1+;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1238737a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762249; x=1787367049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yhsY489WnzKSJ69pqlZVerC+CJRorB8FrF0M+Ekn7k=;
        b=ogf9Em1+Ju/FypPOK5CfZ4Ys4CjMihHFvgM8wMtT2cTpDnUMl+8FazozDVyNVDxZXO
         j915UtLR0ZcybPCmahauWbnvh8B+pzhKt2qJd5pP4lZMH3O5Ap5rOJZp8JNsnO/cKsd7
         IDwAayiWSYqDwODBx1ffoHUqRPyvRqVfFlumFQn8tg0rOVSn9/9Gw3BRFuSInYnVjtj9
         mCdKIqAStIIs3wUe0dZ8hrP8Q3gSmx0d/+48o4itRm12b83Mlo8bu0R9r5JoMgWejFkI
         4E+t8XkcNe5sWWYuMa/dZ0mYkQcs3zPwn1BN3zxpjzu8LcCnhJHzRVt7kcgJjYAm1WMo
         WR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762249; x=1787367049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yhsY489WnzKSJ69pqlZVerC+CJRorB8FrF0M+Ekn7k=;
        b=n8z1WcROPx3vUdnnbTIrXGJZmqSOQLRra2JZiAhzd+9hY53SjxZwP5BN/bBDcCOixn
         YtXE7WWaBiTVvMbU+igFh7xc7yqJmrI1aebDVW9my7cA4AGhamJfIGo1KSvNIIK2WJ6N
         Wi2/6PXLmW+oudbsPbVivKDxEx0vFrQVpesd7KvxpIA9CEnDNujyBowaIiFI+w2q5qcp
         qgQ1Nrdx347Yw7JXRDirY4R4oWBEGjJR/xhy00SjH+ra8pA4um13b82TfpqyCeCYFmEm
         ThD0/04TRev7Ooi+WKDe2obzjBQP5Ei+eJMVBXNvYAH+EeH0x+FF+nJuQ0ej/EakTPxV
         OHeQ==
X-Gm-Message-State: AOJu0Yw1TWah/JvYmm+h3BFHHhtZ8vJxhc3D0/nTDKuFvGF2g0ain7cv
	rKGw/mEh1JScfTXrgZ9FrEfq4+1YpSPpaUJQC8Vsf+RM7E8qLAxn9t9nkuMjbKlo
X-Gm-Gg: AR+sD13wXhLaR8ZKyYRZTtcno8ky/Ylkgywszp+/T6ULd7566NJkZU9FaaqXTYZCSXc
	bGRxCxPko5fuT/2TGvPq/1d34aukINqMmJZpJobcO6MdwLFhpu4OcY6SyM+T5oavYYgkG8ijrwE
	pIMIGoEIlfQsHUgSS+aYY+S2Ox/ATTPG6lx85mZn7YZ72a7Ff325HiiE8/3THk1e2iSu84VbL6w
	72gJ00JudCsZKUxQfpHAHFw7UptXgmmqPzWN67ABaLxMk2MJV7k8+GwmTv0XCAr2H07dXHJPlrd
	Tln38itmcav0pZiLf9V0WbH+LwvkqA+/CqyaMrr1linA7DAAMta7K5uBA86qNj0r21d9eEILJO/
	jtyracwsO5nWdlktrfJlkJvT8c8FTE9DEI/HmJuIfFJKOgu6mdji/9LEoCs8U6uxKrhqsKS5P4l
	QSvHeDuA5CYBotLphRDftQEKKZDpsJ21QYSm1z7+ZPluHRlpy0s5pKX5GfV4ZVicZeKBDtTm2Jb
	e+AQWa5u/K7C336XuCzGzLIPQv6Yxo48fSmgef0AfNQsX6cGl2FNWaBaW52D/RpFRCybi55IeDy
	he0RSQgdy1iROUtMXKNMF+COTA7qk6ElLybzMeSZLN3jq9tpv8MaJe/8hF5IuSOWuxLIfdiFzzS
	M3pLv/1JIfHZupW/i/y0UW7al3zOJzRNxH7gowyW6Eo+EaQ==
X-Received: by 2002:a05:6a21:48d:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3cc71e17eacmr12381751637.31.1786762248893;
        Fri, 14 Aug 2026 19:50:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pystemd: add python3-wheel-native to DEPENDS
Date: Fri, 14 Aug 2026 19:50:34 -0700
Message-ID: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129165

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
    fails:

      ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
            wheel
                    wanted: any
                    found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
index b987007e39..9aec45aeeb 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"

 SRC_URI[sha256sum] = "3533f6d287a1ffe39dbfffcf2f547454bb8ef7a169ac6a24e81f446ddb258802"

-DEPENDS = "systemd"
+DEPENDS = "python3-wheel-native systemd"
 RDEPENDS:${PN} += "\
     python3-xml \
     python3-lxml \

