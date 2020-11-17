Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.16426.1605654247497972492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eUOfob7J;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id v21so4305251pgi.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 15:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8uAkLiXQYthLbF/jDb7OLvnobPtxPfU+6fNpBgl0RM=;
        b=eUOfob7JFajbBQjvzck2xEod+vE8me3moQ0vtLDm7/lE2O+X+xG2QYOC8gCKv8RjdL
         85tHEFuZfuiKg1olmRTfnA5A4+4M+uSFdDTcDGypDqUwZN+waRK3yThSFjpqU678Uw4v
         8KOZEzCTepxmKCxOuySHL5rnmGw1pgh1qGvcTkHlsZ1k59yYyNjWU1AzHUOUMBeAOVZ3
         sYOm29HQYfbGZfDpLxmjP+EJQOMgqOEVPFhf0BztpjUCZlffC5e6lPR7eVa5KMnh56vz
         nuCJvGcqTl8uAzAEb87LOEASrrN3r9JWiBLQn80A0klvgHS0fORtbzmt6OfgQZPjpSiJ
         xCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8uAkLiXQYthLbF/jDb7OLvnobPtxPfU+6fNpBgl0RM=;
        b=G7BiKXgvvokdcMQwLUNcLnBKplMeYsDjHXfUOjToHabJN6uVz5Cs1o1sqVwbmTwaZV
         H/6Z7JhpOe8SO3HhWG+BLnCi6vEq7V2Xdyz5cQ7730okjvHWYYin+KcPhLyFOtMQPVMv
         EC3BmPHG179fbkdFYrEWEq6BRrW7EtMpjup7FoUM2maiXfdCULrBANRz1sNmuyKnXDnS
         B8GckKEk1SvpcceMEKG1qoH5KOfLefj3fAdqdzLvPzWQYRHtBeNTv0ZkWl8JjNULU6N0
         ncaH6anPeOdwm4gmhv3mYqs7YppJsTj540uAzhyYlHHOV6JByMSwBZF6R7OXueF8mG0k
         yb8A==
X-Gm-Message-State: AOAM532ejHy1HWzxKNoE7HDkbdkLfj/l1TECoykPi7LvUYaY17eY/sDw
	smEB9FE2sWIm2Q5yaDcnK7RIz7kZRBmecA==
X-Google-Smtp-Source: ABdhPJz1Nra95tMWTAtLf2r1aZDbWO6DcQll3Y/n5h7+8FX9aL5dkYMaEDSexUWYZ/yWbbaDtxWykg==
X-Received: by 2002:a63:6ecb:: with SMTP id j194mr5412927pgc.420.1605654246707;
        Tue, 17 Nov 2020 15:04:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id t21sm133587pjr.42.2020.11.17.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:04:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/5] openipmi: Inherit python3targetconfig
Date: Tue, 17 Nov 2020 15:04:00 -0800
Message-Id: <20201117230404.880724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
index 85634a70eb..6918485870 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/OpenIPMI-${PV}"
 SRC_URI[md5sum] = "46b452e95d69c92e4172b3673ed88d52"
 SRC_URI[sha256sum] = "2244124579afb14e569f34393e9ac61e658a28b6ffa8e5c0d2c1c12a8ce695cd"
 
-inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
+inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-- 
2.29.2

