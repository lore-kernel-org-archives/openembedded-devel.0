Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.8338.1598999784058500787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dR6n6Utg;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id ls14so1338663pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbzeD9GIu10Q7+H0zDnQUO2f7xLI73Wsr5wGbds576s=;
        b=dR6n6Utga4bkG0KcADvryCVaGHMKLkCDZN+iCU9s8lJ66AgfKr3hd+N/rJxAw1yhsq
         PPFifP1rJkx8YiYS2MCO5K7UluoDtNNndfRsJEJVRxQ7s0PR6y9qDyK2ZYqB6hcglA3q
         GIHk9i8Ht2Kx+VQePs/fhJHr7tCbZNzur8GWYg5AWhlt3jZKraXOUAP5FTlTqud3IYdi
         bKKIhyJd3jUzAOV1OFOztIncWxX+E9vOtQCasqRsI7k2kJFBweXzwlY+ahtTMrmp3w7Q
         US90cBjX9fccPZ8i9ETtkFny4Or89r6ktXmLNHSBoiW68M9izJeLqSAPwkAC7/Gz4xTs
         Etxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbzeD9GIu10Q7+H0zDnQUO2f7xLI73Wsr5wGbds576s=;
        b=Xh2frmO70dkzBBMXzbJ/nayaukqrhDt2tSYFHlrxSQ6npNkECj3v7JN3u3JSzvqmhi
         nJSpRL/DQCiB+qS7W+qyWmk85sB9ZLDmyoVXRSRIbjs6DmlnOoAPnu7rsPgpNgd5FG4C
         jwmuCahDOkZ+BuIL8C3QW0akRsh6jVR6TOoA9MCG8+5gq9FXe6vcNPRzzDOAHmvbGes9
         wYV5O5WojlRthM7XOu6dllD5Vv3CyZ4doywoIIHaW/DyC3GVNsLugy6x4mMSdTA8knDi
         FZEdaoUemf/js91drC+2aoJaR7nKjHuNXdsuuvHVURDTTo6YTQnE0Dm9GF9pvN/q9Krk
         idoA==
X-Gm-Message-State: AOAM5318ujk39OW22knX8kzjM0TuwMJx2Knk+Vmds0F0A9sCchOnuRMc
	zb8bLgqmivBgUg/uaIhbfbmBRuJ9eMIQLw==
X-Google-Smtp-Source: ABdhPJxJOIzspb+rsh08iokHRVkW/uIZ9N5ulKsJ9h9+oiVEB0c8vVsU/LMY54jmR5McPR3NLVv1ew==
X-Received: by 2002:a17:902:bd87:: with SMTP id q7mr3295327pls.106.1598999783314;
        Tue, 01 Sep 2020 15:36:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/10] netkit-rwho: Use update-alternatives for tftp
Date: Tue,  1 Sep 2020 15:36:10 -0700
Message-Id: <20200901223612.1386026-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So it can live along other providers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
index 92c13e850c..28e016400f 100644
--- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
@@ -16,7 +16,7 @@ SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21c
 SRC_URI[patch18.md5sum] = "cb29e7a33dd85105ba6e6ec4f971e42c"
 SRC_URI[patch18.sha256sum] = "092437d27b4fa88c044ef6290372fee5ce06d223607f0e22a6e527065c8930e7"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
 
 do_configure () {
     ./configure --prefix=${prefix}
@@ -53,3 +53,7 @@ FILES_${PN}-dbg = "${prefix}/src/debug \
     ${bindir}/.debug ${sbindir}/.debug"
 
 RDEPENDS_${PN}-server = "tcp-wrappers xinetd"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-client = "tftp"
+ALTERNATIVE_LINK_NAME[tftp] = "${bindir}/tftp"
-- 
2.28.0

