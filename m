Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC2FC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4174.1790160106448138846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qpBHN39y;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so353389b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160106; x=1790764906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AvpKqoclm5C2c3KvBouB9VSCyiEaBHb93ovK3CGqFc=;
        b=qpBHN39ysy4npwhd5dq5iS0k1w8ZDCNUdpL03oc3rwFitPUrdbJknAbljOEdsOMcm7
         OuVLxQso9s38zkXw9uu5JJ39nN61Y65TtSG9ybAtxRZCTCXqaf1XDwSCfZ8v6czaUmqN
         fyO23km/J/mvLLx6476ywUOexumag7TRQ7XL6W+dYH8jb2/aNdLeDvvqO1ep7zzxdmeG
         0HJ9WTGf2bcy1HHVff5Qc/U42E4B8RgNlbhZEiJix4uUbP5sifcywEgkFmDKXU1yrPRL
         QLhVaU6hXr5MdbtVDRBIftW1eiy65lp2YeSGTL2g+O4Qdbktmxj807l/LctJrs5lJzUk
         lrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160106; x=1790764906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AvpKqoclm5C2c3KvBouB9VSCyiEaBHb93ovK3CGqFc=;
        b=J78S8k8ZxXEw1YyeE2u/Tb6Ko8gjC8IF/FqeYd6Uxq5ZCtsPCwwMo8M0staiutE92O
         mART1sW7sQCyc3kM+16s4zkZRYZji9Az2eWWzlMBk2gFF+Q9nD0K6cWR4QRivGgLusQx
         XKJyvIXo4ItmVhlHQ3pwqzjV+1STMpPfjLkcty9KykvvZHN9tpaw2gW5C21QFkdMT3le
         AO+RFA6Kl6yQRwwMthZ8pfcVAqyOW7AGsqitf0jhAzda5sLi8ZF27rw1vjy+t12jlbwA
         Pi/AgorlFhNt6Sjecx6UtCf/XSs5QAmb5srgMyafBmUE93b7mGJG+FkXJX9y+gljbDdy
         av3w==
X-Gm-Message-State: AFuF++nnlhDfwbbEAOCFFL+JovyiXcZjQ21rDfAGsRmkGouiFAWJ5/yt
	qZc+aE3wmPO6Wy0KGvqjtK4hEY0IifXjPC/c1cDK/uff772kM9AOuU2p+q9dbg==
X-Gm-Gg: AYBFou1D+BhgqxjhSsDpGOAEGmf/eGQJelhO7CRs8x75pCJlPGnMcme3U+ZXqQRA1kK
	NUpmHiBF8+gHN4XdfhUx3MMuPOugPF3Ttp8oh/bKrieVpSwcdxOzNJIQQZxsxyDQKLNafEGN2Z7
	yVRbRbVA0GJTLQbPKKBtSjrpqxq5pjHFrir/UtJxuMku+J+MagTo6O+fafo9kx9hdOGwa14WcDX
	XPWgW7pNfDZYaX80YbnFHBgRq4v6Ly3a1aLojXGL405n8KXmaNnj/vYi/Q1D9Pm7A+kOOt8v6Py
	clzI1qBmjD67/9m0Ms61a60ziEU7U37L0qKpYZvwxY/8eF03w/J+eWQ89QjOo9jmvnxhgJ6Ripa
	1YYXkVHtPzWbkjLxrqxwsERcf2E/VJEAl8PIF+qIg1cGo4coj2bTxLS8mAEAa5rar4R1NfuXN88
	8vKTWhqosfF2ThUkVFwqWMsOi3GuRlPozOvlxJtgTPtOF8S6acxXBxVtZIMYESm0FvwxPXX1VQl
	so5jFOW689I7UzfDwEcNt8=
X-Received: by 2002:a05:6a00:ad1:b0:872:dc9a:7f79 with SMTP id d2e1a72fcca58-87d18d6dcccmr2122012b3a.6.1790160105862;
        Wed, 23 Sep 2026 03:41:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 22/42] python3-tzdata: Upgrade 2026.3 -> 2026.4
Date: Wed, 23 Sep 2026 22:40:36 +1200
Message-ID: <20260923104056.457360-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130209

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2026.4:

- Canada's Northwest Territories moved to permanent -06 on
  2026-08-21.
- Obsolescent settings like TZ="EST5EDT" now conform better to
  POSIX.
- Fix security, performance and porting bugs in zic and localtime.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 76eef1fd48d2a7ab321bb26a265bcf949b627a1a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.3.bb => python3-tzdata_2026.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.3.bb => python3-tzdata_2026.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
index 3284b1bb51..91679e8bee 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff9d1415"
+SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

