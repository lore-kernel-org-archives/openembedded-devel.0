Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14658.1793092856477787971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rpWL64aD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27261785e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092855; x=1793697655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vei3Rz4YNkiIWX6cTsNfzhQizdM1TAeeQjH2U+yOAQ=;
        b=rpWL64aDvBJ8o9Y81zWfQn5A26hKkLLrg3rg57Tcu++BNwn+IyCZ0XjSCYyrHK32Zs
         EZDlxnx4Lt+D/V8R5fydKSdmRUxRn4I/W0UafXB8FuF7guxsFHosBP41Q8ER5C9cI9+M
         RzC/3D6mRZq7FCM8dkoU62kCSAKs10oQzyWrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092855; x=1793697655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vei3Rz4YNkiIWX6cTsNfzhQizdM1TAeeQjH2U+yOAQ=;
        b=Q2SPQrCK27FRfXfiESZ2RRXfY49pDURSa787FQDku5MBVtanA8FQGzSADcK8K2s+u0
         oawJr5UVxqaZKZ8hQVYvUL4p4TzgnzgnA8q2YwLpNfm/8TNLsNW17CCp78ybiy3+rdcH
         lHqI2VcGTRwn7ONexhez5JVpnqD7zjLFdnSRXLxZAXdDdhM+LsZEcjiZXUyjdAPiZoAu
         hAuxQYy0FxHVEoazb1bikepRgv8SVgT0z84SrANMOpA7Ya+BuyU4U2dPNNOqyGkGeTW3
         jLo2q8FclOgaVqNgjlCvlnyWbuwwTnN+dxAO1CDSP7mooSyXtpbrsU0h4xhh2jw9P0AP
         z+ZA==
X-Gm-Message-State: AFq9FYJuUAI+jbavVTbMgOLLHBYsfBhIh/pNNM1+94LL4fo/Lch7pckm
	F460iecLdDH4OSEnQAJh3bve2a/beCgeSyJh1wQgchf4O39bSfR5qFs3VfUHjAoy5M6Ic8yxQRj
	Xya++
X-Gm-Gg: AYBFou0K8PgP6EvfyxaJqmXgLJln6jRPVt1JId2sLvMYYv/Gpfflfpw0artdKVfoD1l
	bYGer/a+jTLzvYlTdYZXYThL4eVNFOl2UJOSL/hr4kF8qOWnDC/CwtnlW9WcqQ0/ytbQzxjJ+Pl
	REB8EnOdZqAqj1oKuFOj+oukMWFYGjmoBRpNPKlp4hOp4RPaHMSMY0+65vhHVnw4lCwfLQKKv0M
	R+Kau9yQpCFEa/BfB9MejhttjxtD6BnnmrhpvXiy4pRzsOsPiMeMBEGoibSMtWvY1306L88Nj/1
	ul9U9bLx0+42pRPMVAaqVMGWV4wWSxeOpl7RX9L+q70AcefVaynSqNamKwKOxaCnpzJcNv0O08J
	yBvNYNqkKUe2zc38rYPAVCxWa8Ll0D9cUKxtg+xAEPLgO84u55veIGCB1gxDONRiaed3jL+GWpD
	03iRjQ/zkFmo1mbe9FYuDWGwTgwLY7i8dkvsL7ooMcOuK+J6OUDb69z4HPx+PWlUtKrjKLALdMu
	/d69rhOk5fI9r1GzuMg0v5eUEhbvWznasva2biGsydr3YKVczoLn3VBQx0KJgh0rnn+QLt7EEfl
	L/tGbinkkZ0Qk7iFOPfqz2CFayACMJt2QrIZUd4mVyfigDH+MFp8tWB4et8Y4I3GBgioFQnLwrQ
	uU6IH
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr182186315e9.13.1793092854830;
        Tue, 27 Oct 2026 02:20:54 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 21/61] python3-pymisp: Upgrade 2.5.34.2 -> 2.5.34.4
Date: Tue, 27 Oct 2026 11:19:48 +0200
Message-ID: <20261027092028.782979-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131485
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.5.34.4:

- Fix support for pure-magic-rs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.5.34.2.bb => python3-pymisp_2.5.34.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.34.2.bb => python3-pymisp_2.5.34.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb
index d011ed1768..f0754899da 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "cbf42d6753e788ec4eabeb3b4cfdece12faf36d43551869d4b7cec2329ee9aaf"
+SRC_URI[sha256sum] = "0e5563d4fb1d5850f808c4e53d0ea8cd4e2c7877453034d966e7b2b70c32cdd9"
 
 inherit python_poetry_core pypi
 
-- 
2.47.3

