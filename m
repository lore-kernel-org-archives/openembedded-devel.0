Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.12992.1612649175830922502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 14:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=f/sC3Xw8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id h12so16143427lfp.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 14:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7Ux4YWveWo11WX3HVJhdbZv7VGY7U07TA8TVma+oTY=;
        b=f/sC3Xw8AlPP9laLnTfbuS6sdHJzWTrnnNRwQvxa8t7LzByvu0hvsop0l5Yos4RBfA
         1r/r7FtbZDBOSBTfRYwwoOi0zbilOw0ukUz+HuShvbdDJ98Hd7A03kViyg1OuTm/5ZlZ
         lOLhUlxE1kt9lnl1CfgQg6z3liUGZ3ATW1jok/HR1rsoVpyHWYxKXEGN74ZwyeBmWURy
         ix2SgpXaQkrpI0dRovCsWlhpWgpPsN/xEVdUTlWpXvZMzK1CINObgb20aUdOdgWA7XbH
         EDl1a9OrD8OftDacHw8R7d9Mc8lOXeD/Gcsw+u76r+vdm4OiRRPy0oRyk7IPnbyFAAq4
         wjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7Ux4YWveWo11WX3HVJhdbZv7VGY7U07TA8TVma+oTY=;
        b=b59H9KPmp+6+uUJKu4BvjIRiHK6kW+flH/1VbCfFwO6DkH4kJzqxYpmNiVgr9HSXr2
         b2jkk6jicPwM6IBeG5/+bVb5t4s94rvNw/2biUh7Xy/u5OhoMzuHBI+eeeMdWKN+KLQw
         sBByCmKESyJl7dsozTCnUWM3renpAcmvAeJ5Pu6t5hjx+Ts+gDQn1XmTWhey9HX5Ac96
         mJdTr1kgdWO0RDXrjlKqTIVSPaEJezyNpIPIhR+SMCPqRDB5hvEk9YYhMuU1fRyGtflo
         kAD4EUmafsvhb/0WiRGprbXw98oSP6N9sVPFRyggPBHKFPaSkIkMygaKNYF+M0gWnoMy
         0iFg==
X-Gm-Message-State: AOAM532j4o7as7k1J3x3TsP1XYfl8PADPxY//qUymMwSrsojwwi2CoRI
	ivbUtlxOXhY4dO3zwwwcBIzQC2KUDnKtkmdN
X-Google-Smtp-Source: ABdhPJzVIWTavv7e4P96hbcWpy8fJavmXyUXpa6MvRmY0CIrE7G5uEhwphV+9dIOp5h7oaSGYGQBNw==
X-Received: by 2002:a05:6512:31d3:: with SMTP id j19mr6135954lfe.495.1612649173390;
        Sat, 06 Feb 2021 14:06:13 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id x14sm1448688lfg.165.2021.02.06.14.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 14:06:12 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] atftp: update to 0.7.4
Date: Sat,  6 Feb 2021 23:06:07 +0100
Message-Id: <20210206220607.3969325-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-daemons/atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb} (97%)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
similarity index 97%
rename from meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
index ff9084dbf..76a9e144e 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRCREV = "52b71f0831dcbde508bd3a961d84abb80a62480f"
+SRCREV = "e56e8845f1070e89a4a6e509396b681688d03793"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd.init \
-- 
2.25.1

