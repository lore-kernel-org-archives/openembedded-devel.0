Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9674.1597214243627091097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RUFyc+Ex;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id m8so521834pfh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65gj5bCnS0fI/RCmYtsVZpYV+j45gxhUb/Nwzfrc1xQ=;
        b=RUFyc+Exf3BgJxEgKIlCnTzlVZzEjVLq2M210Qt/xVfUCz7sqSp6qFAhZ1qVXxQLgv
         NiYyYLtQ6xv3g+ZY0AslB3fFb/X3vgMrm+fMknKrTbhk1cy8KaErtob+dJwc/nyq822+
         jFyJJLjc5zpl6gslC2hN9cdA4hNlymwB3Rr6Mhsxz71C8F7KFAO4Jw/6NJp3LJdFNP9w
         YCglENnoX5gM/lphRMsfdazm0LBd91rqCSri6eRtw+k6GP9f62Ir68KweSSJKzN5MWBc
         yO0dfxMdyZozzer56eCU1sRzSPAk2Sf8lHUlaRWaO6rne8A/n+ZC7BoxldyFJrq78ztH
         Y8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65gj5bCnS0fI/RCmYtsVZpYV+j45gxhUb/Nwzfrc1xQ=;
        b=Gf9oqRcmgihJFce709h0gKP8tt/eN/aJ9VqhDlaBpIy8aJP1E9kUhphIjQpPLnoBRH
         IvxZG/4zMEKjWypZ32fk+F7c6GzbdWijljyUI0OyQbMzLKHwlELGgVpxgzaOIMCMKGez
         uZq93JwXkZqrW13/cTi+gyyIq6JEelcluJ9ZExWVJ5WgVSv61qbALoGf4DrivwiZT0Bs
         j6eLTEtmz2BHy0LFmf6EkrhsBbIpuPlIw/uFpdCusF26J93FZ2r8rXI14iBiHU2JXREk
         iC3zXRWyXN3g/rtWmGTHJPzy9cwViq9UBHgbmOo6YimNv+z5nBj/e0tFxJBz6Nc1gGyd
         cP5g==
X-Gm-Message-State: AOAM532uqUpxOU1QTSgwW9iPk03vlLfM6bbUh9XCij8uiKI2bKmhgHLI
	1HctNvoSiLakTlPh5l0IA5cVouAdX08=
X-Google-Smtp-Source: ABdhPJyPZIMGW69vvxt2MgdksUcJ5ngezGSJbPPgK1jq6haxXjByJL0YmWNliz7PIFrq42xf8fUvrQ==
X-Received: by 2002:a62:18cc:: with SMTP id 195mr9715885pfy.174.1597214242917;
        Tue, 11 Aug 2020 23:37:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 9/9] freerdp: Upgrade to 2.2.0
Date: Tue, 11 Aug 2020 23:37:11 -0700
Message-Id: <20200812063711.2758315-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../freerdp/{freerdp_git.bb => freerdp_2.2.0.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_git.bb => freerdp_2.2.0.bb} (95%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
similarity index 95%
rename from meta-oe/recipes-support/freerdp/freerdp_git.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
index 7cafbb7993..6a97c24c2f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 inherit pkgconfig cmake gitpkgv
 
 PE = "1"
-PV = "2.0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-# 2.0.0 release
-SRCREV = "5ab2bed8749747b8e4b2ed431fd102bc726be684"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
+SRCREV = "d2ba84a6885f57674098fe8e76c5f99d880e580d"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0 \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
 
-- 
2.28.0

