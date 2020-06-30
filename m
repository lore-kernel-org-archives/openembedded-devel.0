Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web12.4645.1593543942249984668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 12:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Y/GASr9W;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.65, mailfrom: jpuhlman@mvista.com)
Received: by mail-ot1-f65.google.com with SMTP id m2so19296626otr.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvek09ORefYsshmDonnRDpPwKHrbP2PXI7LNQy5YVFk=;
        b=Y/GASr9W07VxL3DPlIFc6fyQIWZ7ilerY9eTCF6iVBSFdPB/bJwt6b0lmMUv8qjXwT
         tTin8qjfnxPBPaj3x5+hr7lBpWZ0fXsb2+Vjmkj58LHv2rLrD8Jueeg4nJOp4ttMp7he
         6iMHXNnCzXBzTxqE/TYZzVPAFGeCmBi0GmQbxSiBuAyZ7mKWx6sNe34EDoEZw24o67ue
         1n2AVliJ/Cvf64AdhwqJCYbA2ZRyxZY2QByxEyImbNhBOlzokbCu14/+avE6H0eLrZng
         f3aG2X/dzKy4ouetBl216nIn1AMBGhaWvQpG9iebcnnlU15WPe8PBQEZpTop8lbLLJfV
         lXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvek09ORefYsshmDonnRDpPwKHrbP2PXI7LNQy5YVFk=;
        b=uGFPckk76FvdAxVBuj5UhIl51yF8k96X73lA/cUzjuDd+BztpNjB8aXmUEkCofkVOy
         EKkb+42Riu/wrnpkz5H71KUOJkz4+T0ImS7oAOVyGUbQHZmJjhfqO6mBS2sWdzQbxGnO
         7/LehCMfFwctvX4Cr4Gd9jpZ3kp3qjKrCd+d53kvh8sorn2JONT6SBA/NyjMTfiKVQyk
         /7qnzh5XbCbCu6UIAjYasiJUcgPE20cXy3u0e2a981K5nuNPoLOacdNufQzxXTOG7ImX
         YEiZEuktKJrUr2c26RrntpYFQgDGie+WZ6Y0u1GE+eYasoXbvOmNHmXwpa1KoV6xcc4O
         Ni9Q==
X-Gm-Message-State: AOAM531c0YN68DlMDzWtqymYY77dns8tiyj6Rd4vYl0Bh4yWiyRwRkWY
	Jp45x/pwHaNZPzbsU2P4EutJMimVHzQ=
X-Google-Smtp-Source: ABdhPJxp03dFz/tScQjJM7aaSva8SvN5POhcW4WSkB44LgR6On3oL1eHNG0SIqmYXUZAff/YWD5XPg==
X-Received: by 2002:a9d:3436:: with SMTP id v51mr4067040otb.171.1593543927028;
        Tue, 30 Jun 2020 12:05:27 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id l23sm909171oot.41.2020.06.30.12.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 12:05:26 -0700 (PDT)
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id D766B2A099A; Tue, 30 Jun 2020 12:05:24 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [meta-java][master|dunfell][PATCH] icedtea7-native: set ALT_CUPS_HEADERS_PATH to staging
Date: Tue, 30 Jun 2020 12:05:23 -0700
Message-Id: <20200630190523.9795-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

ALT_CUPS_HEADERS_PATH eventually gets added to some links as
-I/usr/include

If you are using the buildtools-extended-tarball, the limits.h
from the system gets included first then later the limits.h
from the buildtools tarball gets added again, but is missing
glibc definitions, if the system glibc is much older(centos7).

This leads to:
In file included from /usr/include/limits.h:124,
                 from /usr/include/sys/param.h:26,
                 from ../../../src/solaris/javavm/export/jvm_md.h:35,
                 from ../../../src/share/javavm/export/jvm.h:32,
                 from ../../../src/solaris/native/sun/awt/awt.h:33,
                 from ../../../src/solaris/native/sun/awt/awt_p.h:75,
                 from ../../../src/solaris/native/sun/awt/awt_MToolkit.c:26:
/build/buildtools/sysroots/x86_64-montavistasdk-linux/usr/include/limits.h:145:17: error: missing binary operator before token "("
  145 | #if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b0b9419..ba94927 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -61,6 +61,7 @@ B = "${S}/build"
 # openjdk looks in /usr/include and /usr/lib for freetype by default.
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
 export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
+export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 
 # libfreetype.so.6 is copied from STAGING_LIBDIR
 # which is already stripped.
-- 
2.20.1

