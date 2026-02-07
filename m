Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78092EE0AD2
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2757.1770460452032359043
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VEMoh5+1;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43590777e22so919505f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460450; x=1771065250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6viYGVKsWeBJsse2iWI0EUwIexJiydLp5Ys88oKPBM=;
        b=VEMoh5+1rWlMXuGTGMjHNH7W9SIb3yXfz1AT8mM0iiaZjYfQ57+qFqk2knk2VqmLXr
         SmhobJaSPbnBiYw5z/u/OtPQQ+ONAu4oDIBcyrnzJS+pCNNPtkS4pSgFkEKHqN0ixm+V
         Wh7MtaDe/j8Tk7fIueK4pcHE38N9mXa/VV23SwMeSclRQKeVoNcALOF7lGYrLXakZ9/V
         N0iyLjXAe20MXm5NVekANUhrfFvEYdKHZ4b5xT37IyfOJQ0TzNI8mlR2jfLX/ITZTLLt
         fPIEHivsdrXuX9eUUoX9tMx3TIIkx5h1CXRKFpYtsbIWJoLXACS8UwbSv2kbtr/rTPSI
         4VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460450; x=1771065250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6viYGVKsWeBJsse2iWI0EUwIexJiydLp5Ys88oKPBM=;
        b=E1bh8s4/uSEEzULlcbd1OrJL/gqsnewVk918g9ctuhVwRVIlnzhmGfe1nPoreCEJGs
         C6+Og/JCZkUh/IajRU88Is6DInmuHzaEavL6BFG7dDhbZUkN0l1LlDPpf/s1oP2RANTI
         cW8loYPSun2k0gse7tiHTggfQn5kKpei46FyZ4QI8/zPAyfNvXxuqem5xlQ8CDsHTPEt
         Ld5SFPFln8GiSfq1/dGBdFJM2Le8SYFTEvb8aycqcO3JiFdsiLADmztvY92XR1hzheGg
         M/XeKF+KZMo8LhWbodfghlpoWeNGxNJuFtgMZ5kH4MS/gDXl2i3VR12VT7d8o4rxq3kX
         NkEg==
X-Gm-Message-State: AOJu0Yyw16MjmDdwd/TcPICS173bJB73psFI8pK2TsYyUmQhh3v5+SSw
	7+4cF4zRVlCzf4NUzZaOdD3KwEfiwx7gOOnryTkhLUWr1xEaLh1V5x1Dox1b9g==
X-Gm-Gg: AZuq6aKvFLmaHm/BOO8tklVr5FzaDezFyUydOUf5n7U8Plxbkb87VkfOCsiljjIwlfq
	3CoQM7zixl8BH2Q4Ffl9H62qRxxdhwBxnmGpsKxH21jg8OWzuM/oWz9H+r8jJzJRfuK0HhF8E0G
	uEQBL0u6hWTKDDmvl2zovO16Z/yWWj2XFZAzcHLjdR8Kiewidbd9/qo8LWDQ0Px6WBJoWh5Svxu
	MHurtWkavoEajxaxP7aujQhx9Qe4yfADaum0EgtqgKCG1VlotZrmkgXSt5CvKYJmXjSUdqieSzs
	FGiQxWfSPpTSSuKlUOWAnA3RBmiZDJN/r0lggrTOHYktQFb3pLpgsoBXFr1i4tKqrdJNKwQm7Yz
	iPXlACHtz5goqYw9bu4O2Wl+xsGzJlpSCxWjSAEwLzxf+tS3B8y5G9Blb+3UbjK1KI8WwpTdH1q
	8RRwpgSSMM
X-Received: by 2002:a05:6000:144c:b0:431:808:2d58 with SMTP id ffacd0b85a97d-436293bb5e4mr7864118f8f.51.1770460450233;
        Sat, 07 Feb 2026 02:34:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 14/15] python3-tornado: mark CVE-2025-67725 patched
Date: Sat,  7 Feb 2026 11:33:56 +0100
Message-ID: <20260207103359.4177243-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124255

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67725

According to the NVD advisory references the same commit
fixes it as CVE-2025-67726. Just extend the CVE tag to
make the cve-checker also see this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-tornado/CVE-2025-67726.patch                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
index 7b210aea42..01f18e3bd9 100644
--- a/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
@@ -8,7 +8,7 @@ certain inputs, which could be a DoS vector. This change adapts
 logic from the equivalent function in the python standard library
 in https://github.com/python/cpython/pull/136072/files
 
-CVE: CVE-2025-67726
+CVE: CVE-2025-67726 CVE-2025-67725
 Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/771472cfdaeebc0d89a9cc46e249f8891a6b29cd]
 (cherry picked from commit 771472cfdaeebc0d89a9cc46e249f8891a6b29cd)
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

