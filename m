Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.14190.1589552212373522993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=EjenegiE;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id i14so2614439qka.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rraWaAelIwi/IguxeXQpCGZbkN354OqQybANZ7JwLKY=;
        b=EjenegiE4sD5FIz8y0d7j5P6v2PV0IsdYWRswbu+W0xopAdy6mGhnjRLej22lBNEgV
         GA31hkwmKEPEu+nLHBkIPnnSthiZ5SBiQHvQC84Y3j8hqLklpoQUktQjW13PHHyzleyK
         NwIBAWDWFj5yX/58eyHoZnzyNQNft/g8mMOH0loFzotfm3TEN02Pn4CWIshc2D3E6RPm
         8dRsvO5Yuv/RlNiouGGXrFSMUX0Nxaiy5WwbykLuY/C+VAKNHal2vV5SjMjT+NqbZ4B5
         dgJEa0JBbiLDxQOskKhL0evtwlLVN2JxulVNW6fd+3hXQ+eKeoHsW8PYRxupZ9J866UA
         1S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rraWaAelIwi/IguxeXQpCGZbkN354OqQybANZ7JwLKY=;
        b=WG+Jw93TI/PlAQ7SAm3RewFEqmc/idyYdhHg2uBjCX2gPczE8V2/TNkXPIFp99OHcx
         uXUBmw2iIJzJsl6V925d5HFucTMtYp1N3+OeCMSKuSh9QpJXrHqXROhrj1RJi0onaDvX
         BnpMYXv561GtHIq0Kra5EK9hEfbnxQxKAXIqA5/1MiudD1NQCVhPvDeErgbbyRQdDFmJ
         Yg5UwJjUAExyT541zO4z+E2vVSaU2jSDZgB52ylnf1SShlk0SsZKwnT6zFXovxPfLgOB
         Dlw3F9cRoWFXDGGiAPnVrTsaI9fWLCdMWb7dgtz2cDjbwy4blBHWk+q7QuMS4JJiao38
         qnJw==
X-Gm-Message-State: AOAM532nnsNnOOAWausyEC/hN2oV2wqykM0zX0lrHEM8Lwb3CsyEz9Lk
	OBgvKeGIVZ8aRjJBWx2F2UyKaaOCr58=
X-Google-Smtp-Source: ABdhPJycgLRjs1OBTRMSPftel8kAL2CAV4YtdTnjcgErNs2w6D3PClPTyZOzDNhGiNNX1fWvstiwlQ==
X-Received: by 2002:a37:5fc4:: with SMTP id t187mr3336274qkb.484.1589552211439;
        Fri, 15 May 2020 07:16:51 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:51 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 04/11] python3-py-ubjson: Add recipe version 0.16.1
Date: Fri, 15 May 2020 11:16:23 -0300
Message-Id: <20200515141630.27789-4-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-py-ubjson_0.16.1.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
new file mode 100644
index 000000000..31f07a518
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Universal Binary JSON encoder/decoder"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=383b9e6c3f9d1386a4eea17792291d91"
+
+SRC_URI[sha256sum] = "b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-numbers \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

