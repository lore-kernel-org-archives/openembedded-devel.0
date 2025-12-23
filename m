Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1205EE6FE27
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 16:40:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104088.1766508010517593462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 08:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V41DVtXI;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so2328833f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766508009; x=1767112809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+x4jOTcT8/Fwro7MP3dBRP9upWev7kS7rUklfvqzEmk=;
        b=V41DVtXIraPC2AAtAuzJwvEDPw276dt/xPT3oNLzs+khTY2zhNuEYvA1+KBs6cJ70L
         7+cBvV4DUV9TY7TsYo0N6YcXzrHtf56BoPeyQ1g+WDZ1PeHS99GiOlPnI2/jlSCU/gve
         tYKUiiKah+RFQw3YkRzGzxFTvVWjnT5b3CDJBMENnVVWy3TSJwagqedualGtoYzb0Icr
         aLHPVIm7RbdUOcaP7Gl7BSBAqqCvWUJnXeby5MND3c+fxyonKZAMoNQ5I5DsUZO+HgFS
         5XGGGoXK7e3uzbrEfpIa672bL50Ie9XlwUnlUXZtySaC92YGjy9nOUWj970yr990Ouio
         z/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766508009; x=1767112809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x4jOTcT8/Fwro7MP3dBRP9upWev7kS7rUklfvqzEmk=;
        b=Koyfti2pgpWu5NeYRnQ11xS/8Zn5oWn314aRFbp1qWyKNns3uPK4t7y3fFaTsvfCa+
         HBd3EZMjCREemHbY223cId43KOuaXtg8/ykllESoOKFe56h7fWPibTc4NxHUw2vn7ML+
         93cE56K20avY/Mi2KOQXvuqoSFcWlyzuIWwewB0U6Y68UspUylYxafGbECPlt740dX60
         WhsBquguUxRIsHOFksg10jibYLncsOCx5XBVH51B0SzZc/vXKSFk+rxs2UUDyWLVIyHg
         Yc+pcRz1yJwgT9CaugpXFC1/2ARQAy1FtOU1IDbTPgtZV974qpJ2uvTqkP9ZvtM18RA8
         lANQ==
X-Gm-Message-State: AOJu0Ywdr0q7Tgf+mN6M3kCRRnIZT5CVMeRadDNylycqX70epyTlm8DW
	Y1RPg0+BqGDWJW/oBWYJntTVyNMWxWWCxhp+ZdTPpdEcX/fRjeTYvCRv8kaPWg==
X-Gm-Gg: AY/fxX5rrNVKjAX5b2CvZgDTjM9q9rW9CNYqCHXpT8viwBVGDI98fFnknF9BiQVsOJW
	dxmr8FE/8xfpl1NOZlaULNixEoXogCp5wjaMLoA3QAH31vq4qu8RT5FqHQTNmB5Y6CRIRiK+xnk
	R9n1AuvG5Jxd9+rrEPsLNEOGvuXDRGm1yS8gs84MejM9WcocTANVYsYwp5BvBUah5/wXB/og5Ne
	jXuC8WqAqyYIJx4pxBTqNFmOboMaiMvHjdsmlBIlHwfJSUHwVeajMBOtV+WooYTe1v7uzLVxOX8
	R5I2dYtSfKtTMyjmpMtLl6Brj5YwBUqyit3VjSwsWs4z/cXMhNfYQKxkG1/svGSz2GebLPJF1W6
	QcgeUrry2obQssMKJuJ4DuFCiVyk6nbliGlLDr2yWHuKk8ID5EXYfwCY6KDDfrCKopdjOJTRm5P
	ZilxJM9k2VTlCvmv7Q5Gk=
X-Google-Smtp-Source: AGHT+IEHbV2HYirs6EenEpQvkrscxUxM/isEP9uLZaqMWjvQOk3CN0T5JEurQB/fZYh4BEhi/HFkrw==
X-Received: by 2002:a05:6000:178a:b0:430:f2ee:b219 with SMTP id ffacd0b85a97d-4324e4cbee3mr18047706f8f.25.1766508008592;
        Tue, 23 Dec 2025 08:40:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm29457470f8f.30.2025.12.23.08.40.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 08:40:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] ace: upgrade 8.0.2 -> 8.0.5
Date: Tue, 23 Dec 2025 17:40:06 +0100
Message-ID: <20251223164007.745973-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 16:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122838

Changelog:
8.0.5:
Fixed building ACE for Android with uses_wchar=1
Add support for parallel make using Embarcadero bcc64x compiler
Fixed compile errors when C++23 is enabled
Updated thread name support to work with older Windows versions

8.0.4:
Fixed compile errors in the ACE core when compiled without thread
support (only core of ACE compiled and not tested)

8.0.3:
Deprecated ACE_Copy_Disabled in favor of deleted copy/assignment
Replaced usage of ACE_MIN and ACE_MAX with std::min/std::max
Add support for abstract paths to ACE_UNIX_ADDR
Improve support for 64bit file sizes
Minor fixes to ACE logging classes
Use C++11 default for more classes
GCC versions less than 9 and Clang versions less than 12 are no longer tested in GitHub Actions CI
Dropped support for Embarcadero C++ Builder bcc32c and bcc64 compilers
Updated support for Green Hills INTEGRITY and INTEGRITY-178 tuMP RTOS. Tested on INTEGRITY 11.4.6 and INTEGRITY-178 5.0.0.
Thread names given to ACE_OS::thr_create are now passed down to the OS on Windows and on INTEGRITY.

https://github.com/DOCGroup/ACE_TAO/releases

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/ace/{ace_8.0.2.bb => ace_8.0.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_8.0.2.bb => ace_8.0.5.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.5.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
rename to meta-oe/recipes-connectivity/ace/ace_8.0.5.bb
index 35252c3efc..bd935999ca 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.5.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_2/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_5/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-SRC_URI[sha256sum] = "dba38a905858ec4a44c04b4bbaef42b891adf061e8c0bbdaa1dce2c04fcccb7f"
+SRC_URI[sha256sum] = "2c40ecdbbd04c79fd5a815666e14654e71ab82d4335cdb3aa8669def250c3444"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

