Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.47584.1598851866802956962
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OEYT591M;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id j11so2478321plk.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLvRGX9DP2V2FcJN85TXHsFZW9wmCVStJsRKD927H7A=;
        b=OEYT591MRqWopcAl4O4l/woHuYD5IDgsQFZap64FgMqeT1NNMdca4I8R/wR4AiOvcY
         Wi74sjcyCld5QkpHxRth9phNZ52Q29pDFotqZfUUiQMFd+Jy5EjQYwKkdxnVoxMoZxyl
         9Firik4edjl0YsFZaKrYXtrrSSDcRRdo66xHxWF0OVM9KbNaT8fqnImkp2RsMX22OWlj
         iVgsrHUpD0enZAgLwJwPLirmCUjEtBm5DeysB8yNdoyXjoE/un0hCu/cDBVR3KRjvdWl
         ZZmU3Wa0dtOPeUews9b4NUC8fButb6mTxVFDyyYjR80xXOlV8cPXbXK2FZAjU2CNhNiW
         nEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLvRGX9DP2V2FcJN85TXHsFZW9wmCVStJsRKD927H7A=;
        b=qFoJUO0CwPyvfPmuwXLAy4+xHrK514CfwDOdPl3SPCS+jayL6QoQQpJ4vnWKbbxIFx
         FJkEJNMbVjcBCp1o3K5hriBGxNW8Q0VBpO8BDPPB5UcX5/Dne96WLQk6lTiGcxqSRD7/
         EMgemv01icYSKjPPk8Zf2ZRfSxH3GIFpJXChmdauGvkmw6nE4DdYe28bcFd2DS9oYrXY
         Dq0v6b+lfxyWGW5tJ1SWe9V/fGbzvWEmpq1TdKyyw/pUAAknHpUrToZEX1UICNy4muHb
         nLdQZak5xt6YIxWUAaIjH4+QE5OS12QP2Iv60B3I/tCqlPSNU68Xet+NGWZt7L+uu4d5
         24/Q==
X-Gm-Message-State: AOAM533pBD1hJIWrPu7WQq8kT8Gy6wb4PJKm/TMFDvSja0ABSoWKuQO8
	GaIhJ3bFrNwb9+i650OCWpAX6R+POXddLA==
X-Google-Smtp-Source: ABdhPJxt4qo6DZVH0d88Sium136ludLy5erSTJ5R5X1OnsVFEx2kaU+XHBVUuKx82wfF77NPK/czRQ==
X-Received: by 2002:a17:90b:282:: with SMTP id az2mr125923pjb.66.1598851865882;
        Sun, 30 Aug 2020 22:31:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] canutils: Use update-alternatives
Date: Sun, 30 Aug 2020 22:30:52 -0700
Message-Id: <20200831053057.1541321-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

canutils provides applications which conflict with can-utils recipe.
update-alternatives helps fix this when both are installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb  | 6 +++++-
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 519368817f..e3ad04f598 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -12,4 +12,8 @@ PV = "2020.02.04"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
+
+ALTERNATIVE_${PN} = "candump cansend"
+ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
+ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index e1508af857..aaa2653483 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -12,9 +12,16 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git \
     file://0001-canutils-candump-Add-error-frame-s-handling.patch \
 "
 
+inherit update-alternatives
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
 # Busybox ip doesn't support can interface configuration, use the real thing
 RDEPENDS_${PN} += "iproute2"
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "candump cansend"
+ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
+ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
-- 
2.28.0

