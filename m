Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2223.1612488812544082585
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 17:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxa2S17W;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q20so3261998pfu.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 17:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=De6EPcZAvp3VkvkHu594O+kLkvvAgL4ZSh9PIM8K2/0=;
        b=rxa2S17WHbu35e+eDsd/vR6hwMvrFawMz0bUlFinKizzEzd4Pg9kWWQ9ToTdB2WwA/
         /cDUaH+0nQCgXS4USKJqbD6kiQvgkB0P36k/oDZSkZeZOsVS5tZT1Gl+oiUBnb7G9E5j
         ag4PjHYx8DhF1jTyYsju/SkpTw/W0ydg1+MGnaPw5boI0noWC6CCnsHBAgQw0m/+EYQY
         SiASrw7+V/vemUatvZlyNkItAsirbVBZkO7elGUZqPakDRkCoOtV9zIWbFF9S8zIBEl6
         aAdGjPDTVQ0rdxiIvBs7Rt0AJlXbsk/UO/UawEc/mMX4pTXitF1SaAofMXeMEDmSmIXr
         5j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=De6EPcZAvp3VkvkHu594O+kLkvvAgL4ZSh9PIM8K2/0=;
        b=tMg0usmm6MAW6Gr2Ef6D9uXvWdmfTKLd2biaumzuLcXTp0lokgveIyDciY2lUtAQpJ
         zLp2D47Y1V8p4uw4OThN1i0K+/ajynPZ+NL6zluRPktNO5R2l7Bp/pm+5P2LD2WSkNKB
         kvwa3rFNmcHv87TVMFt++glvoZj4M+DB0tGExOfS2BKAqFHJVclrLwponINJCmr461iW
         oQqLIf6GBvdsqT3fHX6LuyUYJFc26itO6cvzsOaukktr1lCvOVID6JzY1QSOq0ydxB89
         TTvLd+0IUDKsZWmgpGSZVarMXWaeD5q/TIfkWep/JUiEhlZd2gFihGS3pNYUFudRtaB7
         Wmdg==
X-Gm-Message-State: AOAM530WwNFbQHG+EQIqxgtH4LcwaATfMSMcLkwWrvBJqGD+bSDwWjZg
	AVydJx3oSrhFLVS7I6kymFw20rok5JnkDg==
X-Google-Smtp-Source: ABdhPJxJ0dJdBimWeNw7sbUt0x6JG5HFypAsSfiFeN8312oMle3q17wL+Dt8kvXwI7XpcjsA0De1ig==
X-Received: by 2002:a63:7885:: with SMTP id t127mr1809701pgc.15.1612488811945;
        Thu, 04 Feb 2021 17:33:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id y5sm4802292pfp.42.2021.02.04.17.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 17:33:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libsrtp: Do not invoke automake during configure
Date: Thu,  4 Feb 2021 17:33:26 -0800
Message-Id: <20210205013326.773042-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205013326.773042-1-raj.khem@gmail.com>
References: <20210205013326.773042-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It does not use Makefile.am therefore there is no need to regenerate
Makefile.in, which is hand-written

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
index 57b6108a95..6f349e9c81 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
@@ -12,5 +12,6 @@ SRC_URI = "git://github.com/cisco/libsrtp.git"
 inherit autotools pkgconfig
 
 EXTRA_OEMAKE += "shared_library"
+EXTRA_AUTORECONF += "--exclude=automake"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.30.0

