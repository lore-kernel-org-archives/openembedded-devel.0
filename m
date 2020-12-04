Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web09.9776.1607054921917325701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 20:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NMYzzL0T;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id t13so4058268ilp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 20:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=REKq/kAYKkwuUtj0gyIm4hU+wUemaOuDD+egvG+XMZo=;
        b=NMYzzL0TPLNfp9zlUoiS4e/53KrtGjDxi1i1wGgXvLYyhZTXiVO6Vw+9Vxt8FcOEKi
         jeWayK+K0LslaRCgdP+DHtfga4dwMMf742hBsVYgERY/hU5ofYUuB53YDzLHFk8C9yC2
         foT67PKo9EuEQC5FzCCnYbK2IM2NnlycKX96hCaG5LuhPgfwqMoy/JVpL9flLJgtRyoc
         F8Cp03815im+0FhXndNVcq1nc3B7vCEOy4nMPLBvO3pSv5eIN/0vTtpl5hx4SHMXwZYJ
         L4h6TjuRX20spoIdC1CWhUPPq6s5c7jrIvZsGImYE/4x13C0Mw3PLHq7fBH6v9MX3Bkd
         uXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REKq/kAYKkwuUtj0gyIm4hU+wUemaOuDD+egvG+XMZo=;
        b=RlsY+oyg/3qewRcllfFpUkEjrPgBxnsjCZLGT6mfGK1TQ2vhF3kuzNafqJp0Vf/vpO
         EE5bjEFLsV9T+O//Jsl3fRprw5g5a7M5k7XPtoqozX/pTMqTAxkiltcXGF9gFoBKyky8
         PUa9vcp9dcsjJCBnj3SvPiX3jpGlJRYvL9pIT/Ut0VayTAwDRf5Qt6G+53TjjI0nQ/Bv
         TAgGpNBP3aiv9Ztre+rbu+EdbDh6rADpK7rQQ+lXLyDFPRoGk4v4B80vSoGCFfEV0lXH
         DHyCMgQ6JCYEZLAiNx0SjNQX1yPVdqZEVRkSThXfjKYAJqZqC7gCrdaWb3igo41Zq1+d
         uhyA==
X-Gm-Message-State: AOAM532CvNbdlpBMPFvFV+5tMYO3pd4b5UbTrQFwFPt18pnK4lKB5ECC
	u57uAiKi++hrvqVN6p3qsW42EH9/xd2Ysg==
X-Google-Smtp-Source: ABdhPJx0RVQzJETX7o9jaowVzoUFSmgNvrK9P99ro/nPhQ7tV3eOxFVnguXN6GCEPIHnFSUI16pmnA==
X-Received: by 2002:a92:d3c6:: with SMTP id c6mr3711651ilh.7.1607054921183;
        Thu, 03 Dec 2020 20:08:41 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id u1sm661328ilb.74.2020.12.03.20.08.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 20:08:39 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/3] glmark2: update to latest
Date: Thu,  3 Dec 2020 23:08:28 -0500
Message-Id: <20201204040829.38707-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
In-Reply-To: <20201204040829.38707-1-twoerner@gmail.com>
References: <20201204040829.38707-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v1 to v2:
- Added. I had forgotten to submit this the first time.

changes from v2 to v3:
- Fixed do_compile for wayland.
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 320d07dfc..209230572 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -9,13 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
 DEPENDS = "libpng jpeg udev"
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
 
-PV = "20191226+${SRCPV}"
+PV = "2020.11+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
-SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
+SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0.497.g54e85e7af1

