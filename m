Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7E01061B37
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:38:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17969.1774957118432436006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qGI+SBIH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb439299so52263955e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774957117; x=1775561917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kJ5i1vCgZ1a+4HI8HXPaa4JhJ85NEsCGUrSM/QPXMg=;
        b=qGI+SBIHnJ7oGcel9eBd8FLLyagcNwQ8oRNHfXp2wJcM4BB125OXpuF7NktUWHtT3K
         jNMdMlAgNGkQXUnsuUjFFFQVYfDgsL5tZTlGalMZh1AMEoMXV/ROmZlsOF1Fsaosw6Ag
         1CSyOCRji97+vRYy4bEseOlmMWAclGVA3dDdUJyvM7vGitiuYiWDTMR15mfoCnErM3rM
         yizC7daXCdQpwxIdGTm9379epKeu8aPjYM4C3xiwR2JRVjRDLI2425ExgdqRxvEY0VO3
         04PhweT6V/HFQFLJC6P9WrNlQM8vDR7ymfaJZktFo2hh7QuX9Y5V7ceVtM1BcmXeWiB/
         q2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774957117; x=1775561917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kJ5i1vCgZ1a+4HI8HXPaa4JhJ85NEsCGUrSM/QPXMg=;
        b=RI/3CJH8zJ8Xsv5Gdun48t1l+ZwouTaVa8ayVgjPOiUmIMvwbnZS4qzZs/Z4LJH4rd
         fd30UlI4gB7OfSjZNDmqV9fnZI4xWxi8N+CoJ9l4FiUK0UF7kZR4qN9mNd5saL8JpSem
         HOo5wY2ke9jGrkdm4gY7+cNkySl+YXW5k2okeP5Ap0j54vaazf4lfFQTTH0eculykSZ1
         6yL6z4IuzP24nQzqPwk9v4bAt1GH6jLgf7OIfqSSRGtwBtz0f46S/FPMzS/N+ZEE/yiK
         aeBwY5F9G9di150lDiJCLe4iPCLjFiFTJ/LyzNW7zyAlz6fpoal3g99kYVi2qmJJEMek
         T9tg==
X-Gm-Message-State: AOJu0YwtGW0seZnLZ0hMcqslF5aZMXgyrj5N4oDbK+U3EagO9k4pdkX1
	vQakZk/mqO1jvw3spY9a95FkwpjSfAab0xHSm+7sCtPKpnTtPRVT7nVtb6Z42A==
X-Gm-Gg: ATEYQzyn4TgUujXhZAo2kGbjTIedKV/S5+WGsSvkzLD16SO/cSYF6tpVQBpu6uNffHR
	npTtKXVzIDgd8lFQK2C9Wt5qv4/Go8jMcyAFNCnjapK+xv6e6r/r+dP9sggM+5LxFbo6R+hHv44
	rGwEuXhuXYxyr8fJafcvettSIGhzN65BxnoXZc56Q9JQPp5+rnB/jCPegbevlc8L9HYQw7QYS14
	zxu+MSpeAvpWXSVghJX4JshEPZS2pwPd1ASq2WcXKgNtWojTnPDbnWAcNX8vdTGBRbNAijcHDFW
	/GFeROa+11i2Dy/aJUHyPDkgqFoinBbL2ayhuKriy6PSF5nrh7eMoMS4pWIoIOzcKgj61l6CbCk
	Qap97scP2LJ589/CNOeBayKNha6GK5OgmTEsPjlnQF0qbU1cZ4SIKSY/FETT6szGFzzMn72Gezd
	VZfb10D8SIpi01ukGoTSi/
X-Received: by 2002:a05:600c:608f:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-48728088485mr244875475e9.23.1774957116508;
        Tue, 31 Mar 2026 04:38:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm24401846f8f.17.2026.03.31.04.38.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:38:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-pyjwt: drop obsolete CVE_STATUS
Date: Tue, 31 Mar 2026 13:38:34 +0200
Message-ID: <20260331113835.3567782-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 11:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125887

This CVE is disputed, and it is now tracked with an old version
of the application, it doesn't show up in the CVE report anymore.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 96f060aa4e..eb445f9c91 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
-CVE_STATUS[CVE-2025-45768] = "disputed: vulnerability can be avoided if the library is used correctly"
 
 inherit pypi python_setuptools_build_meta
 

