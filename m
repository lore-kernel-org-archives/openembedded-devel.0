Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.41421.1609122865487614565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zBs0f/TN;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id o13so21004514lfr.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+q7jN00L6MCQrBdElL5OBu11GskHsL2VvkSKeUfH8PQ=;
        b=zBs0f/TNoXjAZfMpON/6LwBl4ErjtobttTWrvvOUhmlL6R1ISjlAVaeykpLj8OdxwY
         xkYtogShtT1tZhAVVvtRiTIKhg8HX2EVDIsYnmkrvDOV8YivxagoL80TL1avCysv/N4w
         2IBhu3cPzo14wcwOh8cXFGP55e73QDLVsgGieJSiskhD3TylWfyF3Xq+rRrolR67ICZh
         Ehtj0kpAzVONL4KIypO4acaj4StCLYmwfzVYp7XyfHK6m3BOKJhMR77gBX9RjiDK+Cc4
         n4d8CRHlTkH96lxnOvbCS5hFEJC4auM8kyeBZVJFLiyx75SuBxIbj+5QqBq6IYtIMRjW
         1dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+q7jN00L6MCQrBdElL5OBu11GskHsL2VvkSKeUfH8PQ=;
        b=Uk77U/xGJFvy4IOIOSYT3CLTRKwFkrIC02iEajcmLX4u7APauaDdqmBojUnhKlL6LU
         vL2IzhOqDToTDygvPcB8LjRmAdQX38Kcqoej6ITn2VwAzxH+V8JnrGw/l/lvigk5oZsU
         7WwXLiUPMzx62pZBF62N1TOtrmOfIkRV2bES8bLrDU3e2OLZG1Avu3guOA9AgrLzlYC2
         TRfIE02wu03hdoOnS3bVo+sQpejS/bXJ2AcQTU1v3pyl7svTM2UmYjddg7A+oXLpuYtq
         SDr9JU48r0zso/+m/l/KyfWTsMonuL1Q0D4TZSxV9u8xFHpKEOtNgopxPjjJ+NZ1iced
         2mBw==
X-Gm-Message-State: AOAM533bDLRPqBNuu8jZVDNRnU1gly/oTOQIYidPGA9e50/XAXXihvjv
	OUGSHBL0DN7sSEgux8flYNz136AmV2RMhNHo
X-Google-Smtp-Source: ABdhPJxpUrzt3WpXmCPxs+g2yW8RJUU55KgHOikQM4USJzaPiK/XSyrPYz+yEC6Cj9Z/kTN8ewQVTA==
X-Received: by 2002:ac2:5970:: with SMTP id h16mr20434051lfp.338.1609122863519;
        Sun, 27 Dec 2020 18:34:23 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:23 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 7/8] layer.conf: add gnome-layer dynamic entry
Date: Mon, 28 Dec 2020 05:34:06 +0300
Message-Id: <20201228023407.3498609-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BBFILES_DYNAMIC entry for gnome-layer to support packages which
depend on meta-gnome, but do not belong to that layer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 9b3f2870060c..04cef428f2c6 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,6 +28,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 BBFILES_DYNAMIC += " \
 meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
 networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
+gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bb \
 perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 "
 
-- 
2.29.2

