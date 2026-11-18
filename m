Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15253.1795015858230478219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r/RC7ko8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso12737025e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015856; x=1795620656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jkxv4/Iwd/8hRn7wpijHJgkD2GzvZjILbix+YNEOT/A=;
        b=r/RC7ko8e9B73auYEOpXgJWWN0pCpweNLslLtC5VcPd/2ng/NuTb5CwG1UZ+P7UGiF
         gn/63yCJ1TK7ooMWmyvHa5oltrZsPzVGVYPnWsn+dNM7BnCKi0Rrh1bvkFvlDiwzd/7a
         Yx3D2oL5JlNt1or/VyDp7jkEdN8gh05zMhRHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015856; x=1795620656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jkxv4/Iwd/8hRn7wpijHJgkD2GzvZjILbix+YNEOT/A=;
        b=VwprUc4GoNoIhduVWLjqN2XftpCafyhfBPILurTeTW3uvltWl/lAGjWOSxkYA3E2hL
         Ef58tvb0S3SsyyZAzzLlDZiDfcuSx8DY2L2mWkgEYeJyUxKi/4wU73I3CouR3sRrUf+X
         bA6BnQzLJj4cxVcDcabdIbDmNM/zZxzJUxvAawcjvNy1XIVIkwE4pfW3bEHuafI42WMZ
         LexH2Baexey02X9mwYKd3gF7kH5kq0+jExhMSlHXI9rtB9ZRzyCGDY8cjE6UIALjc4PP
         GT8SnOUY6OzzQD8AEkJhhQLGdm0zcRKr/6o7UKD143adRU8WQX7kyjUJvelJPfUBvoQX
         cjTA==
X-Gm-Message-State: APuU4Z9EpAH1Do9aEZW9zLGkoV5BunriAvGBsf+3x5R0EY6EurYxAy+b
	Yixr+h9IhIAfOtdQ5AkADnkrDDMWG5gTVWX/2wZYJINzZ4gj8mzpvfAzeAxftM6ILkA9VDk4boX
	PCUbg
X-Gm-Gg: AYBFou31XE9fZ6kcPeDNG7ignJjVGss33Jee2EDT1lPHPRJmLO032aIWU27eglqwey4
	h0hCyp1kvrpgq1tGxRJ9r8BIHTAudz7KDVDt857l4w2r6yq43bhhnLPon+7p3h9NgcOntVUrY3E
	c+oiAyrqIKXb1oQewa7APcoBucgKsdc/pkYUdzbOWgItZlVlG5Bl/6i73L3QEC05Wq5hPDS6XWo
	pagkez6op3u63R0AKPLX5bk2gNxrTRLB83roiNhh1eerRRq9gojlLIgZuf57LvLKz/SksUBVecC
	yYOdo/NiUxvgCwgkENZAsWC85DyiH5Gx8afsMGnxm/GTgUjOFwUM24V2AN+2sOMFTjUNtqttkb+
	vaOVfEn7lmLk0umly5hG6RvvTK29p3xbH6b60Jm0Uy/5R1ZUtgBfvs4Kg+150tVg2I5LphaAhEF
	ShuiKpInOZtL99f0q3qGd/T2LsXWMxgppH1g6ZsJKBIhX/1/+0VTdsy8hJJh9uE58MnvNk9PZfc
	aQtgglDPm8ZIyEtQ18Rn0+hxjpU70IUJk90YZCl4lRMXNpu5NffhrgGxeWy3VSgd09YA0Fd+4TV
	OtrKTPoNA9Iu1AljfP58hmjWMUrFqkzOrSuhayarmhA4hhGd5m8Z0F196IAW+qYZLp8VPV71Xhf
	4B7NreU3tZJVOHrcm2WeKOG61T1VcAz5CH5gk6yhom46aBEeC9QBxWXA=
X-Received: by 2002:a05:600c:1d97:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4bb7da581a9mr61140965e9.30.1795015855935;
        Wed, 18 Nov 2026 07:30:55 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:55 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-annotated-doc: Upgrade 0.0.6 -> 0.0.7
Date: Wed, 18 Nov 2026 17:30:48 +0200
Message-ID: <20261118153053.922769-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132656
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.7:

- Drop support for Python 3.10
- Limit the full test matrix to Python 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-annotated-doc_0.0.6.bb => python3-annotated-doc_0.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-annotated-doc_0.0.6.bb => python3-annotated-doc_0.0.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb
rename to meta-python/recipes-devtools/python/python3-annotated-doc_0.0.7.bb
index 5042ff15c3..807051a1f6 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fastapi/annotated-doc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e36e91f278975b8bb76a769f32582892"
 
-SRC_URI[sha256sum] = "7969bb69912085b2285849c0dcac0b4b374fd180c13cf10a87f284ffcf347bbf"
+SRC_URI[sha256sum] = "0a30ef8f5322a4173720ae6712dc9a5e58f5a19868f3f167b4b5778db066c2b5"
 
 inherit pypi python_pdm
 
-- 
2.47.3

