Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14873.1793092908305834118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ja8Jf/JQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso25300275e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092906; x=1793697706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yexbg9ia+D7MknIeXVYPGMYjNWb2BRaiU79dWQOaO4E=;
        b=Ja8Jf/JQAUVE6ARSess3XDbD8Q5Lg5GPrXPNmBt/MqWTVMWTOHb4uXDTW6X5M8Yp5O
         6QJRbpF8MYC1n8w+DYZL8fb1awRL1NpR9ziMrg/DtPst2TrCFDXimHmbrFb3/jxHKY7K
         ssa5RgDLO+2qMzHaeIA3rlEQahFCp2I8vpynU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092906; x=1793697706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yexbg9ia+D7MknIeXVYPGMYjNWb2BRaiU79dWQOaO4E=;
        b=mTklnvV0dfYZgmDqCxyJMWVH8tUwtmWvdKgT8IbGrglmTpN3uqzoqG8LwvWxgFFT5O
         c+Jh/kH+J06rx+EQyFWiReLAcdfKYai0KafbL9IR58ZjbRDzLC0aTjHVrz6vPqOhx2zN
         tFpMR64aYCUEgFuQW97hSlTCnZEz/2DnraZ+OzON9GG2OLE8k/ri988OF616UP2GUv7H
         ghMpZQrhcM4rV2F2wPAsu9BEesihBUa4sV6+3Dgt1v0Fc4lFeXCZPwguubmZ/Ybpzdvr
         PEn7QEPF6IXQVHaiRU0K7nAv3883g3PuIlSBOqcgxdiQcqtt3zwQgJSDEvR73u7kTUMf
         AcCg==
X-Gm-Message-State: AFq9FYJ72MnVtEdyamhzBOQF4vYZaCXFFjS+2JVwVcnRK5BmL49J9nQ9
	1JiJ1MUwIXYFyeJEGbMMSOIe5TWKp0xmSxLIVfWBpaZBOlYFVY3uUUO+yY29tcjoCcNK8BtwjaN
	TrzYK
X-Gm-Gg: AYBFou19c/DJDPJuU8Dkqt1vYehN9TyhavpXGmDuOU632JwoU3SqhfsV4K+yXN8/6le
	wld6qY3e9HD0yNNnYLvX/svjIa8xBMN3cfFovORsWVHEA2uaWDMwQRsmuyx/tsveSHAfAl/08xO
	FaWpy+TWhJO8xV5a++AmttU0ONvReppzKPK82EricJrE58N5e+QfYhcdHN1xorYC6A4oTwhwcM1
	hcmTf5RezVdBu7ZVfPmPyfoISZ4J4yPM6gyXTagQUntuJok1sa+6tlvFr6bwd/xAfMWxRHqF4+C
	Yjrp+0lbRnf/C/Gz594c58wdE8hteWt+cu1UnxqGqT4uIi/qDYO8PQX8aeUMFmXVwDfZt9LmArI
	2+e1KQJrVcbzaZtVOxDanf/aA0ugOgxx3ms/DEZPP0saO5vI+HrIGl5/9+IRoAJolRd9F+95rPy
	whO91jpCyoaxycQoh0QXRYFwdFT3kiYirqvPT6bN1ECkZeZTpF+cX31RnJBk0MWxwzc+W9STNu1
	XiVeEhIU5rdUcBxT1qCGBq/9hLeq28YTjS+7va6szWpS1JomRcWfMpMRttMJTl3OApDXsa9cxHb
	LcmWEIhSLYlJ2L0pr/o2aE4xs7rKktBg+LI8s/uUyUPa48uUUMrYW30QrkcPWgcp+bZHzqJW2DG
	IZwac
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr173053695e9.8.1793092906615;
        Tue, 27 Oct 2026 02:21:46 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 59/61] python3-zopeinterface: Upgrade 8.6 -> 8.7
Date: Tue, 27 Oct 2026 11:20:26 +0200
Message-ID: <20261027092028.782979-59-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131523
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.7:

- Release Python 3.15 binary wheels.
- Fix free-threaded (no-GIL) data races in the C lookup caches.
  Concurrent lookup() and changed() calls could crash while cache
  fields were being replaced. Their lifetimes are now guarded by a
  critical section on Python 3.13+. Also affects GIL builds.
- Fix reference leaks in the C optimizations when the lazy import
  of zope.interface.declarations fails partway through.
- Drop support for Python 3.10.
- Remove the C optimizations' code path for static types, which was
  only used on Python < 3.11.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-zopeinterface_8.6.bb => python3-zopeinterface_8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_8.6.bb => python3-zopeinterface_8.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.7.bb
index 06f3fe85ab..e7d26dc8c3 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.7.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "zope-interface"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
-SRC_URI[sha256sum] = "b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0"
+SRC_URI[sha256sum] = "0b47b62e8d0d99b24bcdd32f4f2120425e5019c3bee2ad69a0e1d75737487a96"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
-- 
2.47.3

