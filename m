Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.1995.1609980863311596825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 16:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rPj4K4ly;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id x20so10716334lfe.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 16:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ROzxIfnYSdwzuM7scmTfO0zmRYbhn8AxmcKbYh+UYgQ=;
        b=rPj4K4lyA8J/K0IR//vwZURVTtrGXjbKG5SrODXQv86H8y+Ib4+CO8dyQbNkYcbyiN
         lNepOx3UjmvGpZb+KQqsr/BvaxFBq8XqajDm4xCbsiDfm/IuQTgjj18I8/1FdsaLzir+
         SDrXnf5BmcA+NO72dMb/iX0O89utMvN4BJPPuq+XEgKQv3mFEAJpYUR+7XmFYzSoXuJR
         lKf/dSe6KeRxZ0NsSODdccIXBIcuooUth/DbPe7dX5P1Hqiud156Tgd1ZejIrDp3+PW6
         LJIEFhCSZEsroLH5Bb9Q7YPN6njDSiLJz6XqLc3yEiv3BeulIdSr7cbiJR7CmSdSf2Qa
         /aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ROzxIfnYSdwzuM7scmTfO0zmRYbhn8AxmcKbYh+UYgQ=;
        b=hyte/bg+iiTNJyod/vAO42Uc5jWTZ7n7/fJPS0wY21gjzLVw03lQxIt5uOsciDBEvD
         YRRj43UfICUDr1gA2RMdK5CLc4/DTjWA2cmEoo+HdC1fV+XfgnLQkosu7tmI/tBtnbnX
         pAujr/3Pi1xWWSdXuebpzCEv5K2F5mCb+bMh+2jo36DVqrdcWVJFirDjGoyPmHt2WspT
         IXDQcylJBO2Hv35+ogOXlOt/bOaH6Ql6lYdXSFyZJs0kv4PyX2O/EuUKcZzCL4bENyo8
         JrP+9T2HGcgWDQM8WrIBiNzpSjzHW17y1YD0Bbq+8q9OzslTxlr7fmZNwLETbsjxR7Nn
         uN2g==
X-Gm-Message-State: AOAM531xQK1ey7vggxbJeIkF/vOZElYmybE2oYXM0+JMJY7lAKcXC4Cp
	1UAyPUYrAQ/+oBEa6rdpKaOe4i/9Qg9IWg==
X-Google-Smtp-Source: ABdhPJxtgguMzPCR7UpIWBkbjPBquxE8P9fk7nzsleBiidQohbZRQBRUR1AXSozYYbLQiLwwJa+uEQ==
X-Received: by 2002:a2e:90d2:: with SMTP id o18mr2885566ljg.395.1609980861352;
        Wed, 06 Jan 2021 16:54:21 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.122])
        by smtp.gmail.com with ESMTPSA id v11sm791357ljg.128.2021.01.06.16.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 16:54:20 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/2] xterm: provide virtual/x-terminal-emulator
Date: Thu,  7 Jan 2021 03:54:18 +0300
Message-Id: <20210107005418.779965-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107005418.779965-1-dmitry.baryshkov@linaro.org>
References: <20210107005418.779965-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8826791d795e65851ad20bbc0f34e74b2bf72e07)
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6376388c2757..06c285924d65 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -37,7 +37,12 @@ do_install_append() {
     oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
 }
 
+RPROVIDES_${PN} = "virtual/x-terminal-emulator"
+
 # busybox can supply resize too
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "resize"
+ALTERNATIVE_${PN} = "resize x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/xterm"
+# rxvt-unicode defaults to priority 10. Let's be one point lower to let it override xterm.
+ALTERNATIVE_PRIORITY[x-terminal-emulator] = "9"
-- 
2.29.2

