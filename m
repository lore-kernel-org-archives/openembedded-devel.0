Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.40496.1585528305263460395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+TRjCYY;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id x7so7863530pgh.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VjHTrdcIYzYEUmY1ipOfdadDmfs4ce5Iq/C9Q7yjK6U=;
        b=s+TRjCYYE9+m5YJKpauCS2bwgYu9i+WyDoxg2rwYXawv6R8L8zb2QUZk34B5EAEe2z
         D7odJQxZyk1qAeEEslD/OyV2uF5wFCya0ixvX2SKMwBu0x6e0PZ9fmeRa48BFusQoZrD
         +AV6H4AtOSd75wCJ0ubg/yQvMnONluuwBfwqIH/yDXra57VFxx3SIljte5AJZyGu4JsJ
         g2aXKU9mwA0GFFYosWHGKzxkbib1SM8+x073pgPef+gRAd/J6H7cTeh81CzCAgGaFe+3
         k4b31g5Pjzbd3pcgnn9iOCYIPXX13aGl4CNWsFI/rE8bFyJKrDuMqMde9sDSCN++FLq0
         seEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjHTrdcIYzYEUmY1ipOfdadDmfs4ce5Iq/C9Q7yjK6U=;
        b=RdpIKkUghEF8BVqiUVhLJfsQ5OYeT/JeBpP2Rfv0Rse40YAKcUfprsnKf+mWc7I8ba
         qah7tyUAQv85UUI5jx0Qctaf/s9z23GpQaMLM+SGBMua06cA1YToLbTYWkuQUQpaHhc5
         CnEadM3novlfCwe0sDH1hwUUd4v8AkbTPG1SQMVUxVepVIIkOOFRy2bh9V3WE5CrdYey
         QesQzggmZZ0UkWQUBxwT2PQ23zd0VkoQdf1YNKrD51JOsGip+SvwDrDIneUFZZ41kJI5
         7vcR6PdOT9iYXAVemAjZ+PaCTkwxCXAzCZiLeqemGqemnCuP+g+BhufMiWvS/piGD8Of
         RNlQ==
X-Gm-Message-State: ANhLgQ1SDuzX/2CwaU0zQ9LpUTKLfiRuYWFmAvtlcP/z487eFDRu6pcK
	kTEFbhPg0OfOD4heT/5m9R1lt7dJArs=
X-Google-Smtp-Source: ADFU+vsXHvg3q0LsU1YopvpfTmCG7o3+jcTJbPhvXNPqcMVFE9VZBJE7WEBCxpRMKM9Edyva1THpnA==
X-Received: by 2002:a63:e856:: with SMTP id a22mr9978323pgk.283.1585528304326;
        Sun, 29 Mar 2020 17:31:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] debsums: Depend on po4a-native
Date: Sun, 29 Mar 2020 17:31:52 -0700
Message-Id: <20200330003155.1670457-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330003155.1670457-1-raj.khem@gmail.com>
References: <20200330003155.1670457-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Move to perl dynamic-layer since po4a comes from meta-perl
- Add meta-perl dynamic layer

Fixes

cd man && po4a --no-translations po4a.cfg
/bin/sh: po4a: command not found
make: *** [Makefile:11: clean] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/layer.conf                                       | 4 +++-
 .../perl-layer}/recipes-support/debsums/debsums_2.2.2.bb      | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)
 rename meta-oe/{ => dynamic-layers/perl-layer}/recipes-support/debsums/debsums_2.2.2.bb (99%)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 434537fd3a..adcec83029 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -25,7 +25,9 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 
 # only activates content when identified layers are present,
 # to ensure yocto compatibility check pass
-BBFILES_DYNAMIC += "meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+BBFILES_DYNAMIC += " \
+meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 "
 
 # This should only be incremented on significant changes that will
diff --git a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
similarity index 99%
rename from meta-oe/recipes-support/debsums/debsums_2.2.2.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
index 13f20eb944..07ab5e62b1 100644
--- a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2.2.2.bb
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
 inherit perlnative gettext
 
+DEPENDS += "po4a-native"
+
 do_install() {
         install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
         install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
-- 
2.26.0

