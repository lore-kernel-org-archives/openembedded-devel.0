Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.7211.1625583207177775609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P2jHX2o+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y2so1198423plc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YNfnNj0NzT5ADTAhIFsvUpgd8S1LPsm8Y4PtEvc7jfk=;
        b=P2jHX2o+2JKMErei9M1d6lEzu14OBcwmrzUiQ/6D/OkHkQWwuceXK/hkvuECq7UvYs
         Q6HXX3L0YFpRiA5iOt5S4/CV+nSordSNw+RJ5cAskzQv4i7NQTdU000w8WGb2fipev/Z
         X0EbmIcsJRjzp/I0skf0iVc2zkP7i+YxnZsX75EHyL22q27i0ij8AQPeBzlWBg6XEeHa
         VbHKsekxTkvplTQYReZeBOqB5GFcVICI1eBowcVyNE7MdfBh3jUj56+KfkCK3k7skVTC
         AIiVuRc7V09nsYPd1MTrlgNc3QDzZ3FZMfHWQE5E442ijwYnXKaChHyFL++fOHWop2wR
         tv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNfnNj0NzT5ADTAhIFsvUpgd8S1LPsm8Y4PtEvc7jfk=;
        b=mIb0Mn88+O4Xhr9tjinRz73KxRQ4oY+zrXIO4sdSEC0sEddUS3NLPTFy6Lpla66TML
         k9XGx5eqTail4T5kuyOgKxsNxYfjqdEizTjuBIodMQk9oh4X1lYzKd5ltd+5woc93mSU
         eHZxA+qq2tIUf+J03nOsvmIc+1HRXBgHL0VRRhyiVWgEkkK4lP0lkWCADKwlYE2cTfI1
         FZOi40SVwVhzmUdsHBqk3FgBFuueDD1TAq6fGs+Okcr3xZZ42BA5j4VrCkWQ9Bh9dXPj
         uWMehV+iq8N9DgdVW6H49MHpMtxLZl3eGHIAnPqglxosZBvAURM+qnfl06FH1nv3W4HE
         JuyQ==
X-Gm-Message-State: AOAM532twRpybIWa0EE2zeu8/p9PCwnPiquSqjiZmzD0vdmj5cpH81Wb
	hylHiJoBTRG0SRRIg0fyOjSq11NQv8YCyA==
X-Google-Smtp-Source: ABdhPJykyQTqMBpnlhtUU3a4XsBxHRlBv2rL8qZxxIKJqfKwHJXBZkil9Jc4ZOS1Powl1RH6MAqI3g==
X-Received: by 2002:a17:902:ed82:b029:ef:48c8:128e with SMTP id e2-20020a170902ed82b02900ef48c8128emr17246043plj.72.1625583206658;
        Tue, 06 Jul 2021 07:53:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:26 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/11] cyrus-sasl: add CVE-2020-8032 to allowlist
Date: Tue,  6 Jul 2021 07:53:15 -0700
Message-Id: <50ffe3b559117cc0209b6aefe34f443f92c4ae04.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>

This affects only openSUSE, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 711e932b14de57a5f341124470b2f3f131615a25)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 26819375448077265cd4c9dbb88b6be08b899e3f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index d55dc4ab7e..d3983eb1ae 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -96,3 +96,6 @@ FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
 
 INSANE_SKIP_${PN} += "dev-so"
+
+# CVE-2020-8032 affects only openSUSE
+CVE_CHECK_WHITELIST += "CVE-2020-8032"
-- 
2.25.1

