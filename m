Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web09.369.1613771646323567252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=DuARtuVj;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id a22so29109188ljp.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GuIbrSK3EFreEN1+Gtxij8x3QwbZhSUwQsOceSEAjvY=;
        b=DuARtuVjQTpEM+s80QFIZioCQ0Ku83NV+kdTviMgzyulTfeeaNjqE3Y0/3nhltNWb/
         IBwcRJGd6NsRLajcfFOYt/Mirc9H9xLilznK0KO5nAy0cAYElxAzLTYdIoOclzf+yT21
         ++4GoIjMsuk20zajf6thuSU0wmL0xW5FH470gvAzg9VQ83/1SBF4O8Y3uB8k0hYGbg1O
         oqtf4Y+plXQ6zMbyazbmnu/EzacHC0aU7pDKgHNrXiyFtCMuW5SNir8xhNxdjs93j8dh
         wTC6anrZytDDs6DKGVTh/Cj0zkxIouyIGH7GQ9w3ubBizYsjFRwvokgzbysD7vx55zSE
         CdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GuIbrSK3EFreEN1+Gtxij8x3QwbZhSUwQsOceSEAjvY=;
        b=OitlDEEUoWcd6kzmUhJ22du6xjPDKMmBhktsCKKcgWSTA5TB8BKV1ZW8Xe1sJWsxBo
         i7fzJjbpUnToBl3N0a80bY6yOdJIyY1LmliIUKIDF93CZLTJFwrJFMlGofD1fL9N5qYz
         g/0TZ/UbiMvjbQxv+ESpDEXkiKewD0fJ5ssB22tsGvAPU1Savgkby49VDCJjyg+ArcTs
         Y+K4zQvgS2+EVcM8H5Sg/zv0eQiskcX33qZ3DHnPtHv2xWcvziYECwrdkzaTwf4m/Ygx
         AQUnGJJL5SLhCfSyFAu4islj+rtHbm6LyjjmmvJpYxrd0b/QE8sr7//dlu/V414SQYFk
         6+8A==
X-Gm-Message-State: AOAM532XEO01IWURRHIogNSgWTt8mrQ2u/rNGJnHgcK/8Tga+msIidP4
	bhle0lRib6cYeu3zMV7o8b9mngen4oqx4620
X-Google-Smtp-Source: ABdhPJxDX8kvPe07zrl/J3WM3UtROPZLy3VHjFk/b+gnxAttU9fChwFJuq9Sdq76NUIw///UTOAAtg==
X-Received: by 2002:a19:2390:: with SMTP id j138mr7182681lfj.385.1613771644238;
        Fri, 19 Feb 2021 13:54:04 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id x82sm1060238lff.110.2021.02.19.13.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:53:57 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-typeguard: update to 2.11.0
Date: Fri, 19 Feb 2021 22:53:46 +0100
Message-Id: <20210219215346.2367571-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-typeguard_2.10.0.bb => python3-typeguard_2.11.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.10.0.bb => python3-typeguard_2.11.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
index cb5c37235..3c9cac86b 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[md5sum] = "cc43e0eb1dea7e409a74c7f1effc4544"
-SRC_URI[sha256sum] = "d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191"
+SRC_URI[sha256sum] = "cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1

