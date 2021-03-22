Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.534.1616451732907186440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 15:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wa8Blv9/;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f10so2656612pgl.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Mar 2021 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rZE2FGALtnlESnWgzl00UH2Z60FpPh6Y0En2lrAdkGM=;
        b=Wa8Blv9/n3DWYhLFrJUd19CYnDVN2Bj3N1CE4ojJkDbD89mBlGw+De8f3FNx/sFZnt
         gr9a+htNRKBzvgoZ2J9GDc3AlrLDKcoxRtReSMCdkQeild2ZqXCntodT5sjxNxhhiVHN
         UVardaGROfWtPBsLijP+1++K6BwkiVz4+efHPmAEDGRJNZuIh7CzV8iWL3B85V7NQw4Y
         ImEkBfvA/D18Mi3t8zjHYiqHP3PKqxRVR47tS/dLBBt4Qq+GD+84uDPXiGRECr593ynM
         5iF5oTEjfBQLpma/IoRFrI1fMHws43LO4dFKcuw7gQmDlFfxpaqfvKKIva6k+jjN9Yaz
         XI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rZE2FGALtnlESnWgzl00UH2Z60FpPh6Y0En2lrAdkGM=;
        b=ML8PhRlQ7+hzCX8YQT+nWzRxozDFWfwVayzDK0IeGyTz6UHaH1Zn6DnvISst9G1uPr
         hAxCy/15hWoXLf3g+8lT79gsn/lTZzqlRPO20fMktFFY8Fap5QVKg2+xYrBKGv/1lLvB
         GS+jTntGuz2/yz8w/VAtJc9ygeqxyDQmEtzDRWRfdNdsGlRFJ9Ko+U2xtW7RqTyfkCl8
         zvDUF7zgkIt0qe6gU2Ng8BAmLdQ8AtnIzmIxSer5jtCUM0Qb54OiWdZTbQg4a4+1l1tU
         iXD/FQSyQA5K3mYxJ6mKyAULxc1GcPEgNAhAeeXTpNTdEE7PjGjkesoF4IO98GGjjuNP
         hSqQ==
X-Gm-Message-State: AOAM530A9wU4e69+iaQQWStowdWHDtgZ2+pC30zFuYr1NIAiAEmYrjNx
	64s2SbWNnIc+0tr6l6grWknEjbnUzdQScg==
X-Google-Smtp-Source: ABdhPJxsSiLTYpZ08UnUm1pz4H9lEu89a+CvGAgRW/6xnUaO94E2ihb0gHujFjwVDUDRckVzjiRddQ==
X-Received: by 2002:a17:902:b781:b029:e4:545d:77 with SMTP id e1-20020a170902b781b02900e4545d0077mr1822539pls.59.1616451731964;
        Mon, 22 Mar 2021 15:22:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4578])
        by smtp.gmail.com with ESMTPSA id x19sm14988771pfc.152.2021.03.22.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 15:22:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH] python3-hexdump: Move cleanup_hexfile into install_append
Date: Mon, 22 Mar 2021 15:22:09 -0700
Message-Id: <20210322222209.3952420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes error seen during staging phase
run.sysroot_stage_all.902827: line 182: cd: TOPDIR/build/tmpfs/work/core2-32-yoe-linux-musl/python3-hexdump/3.3-r0/image/usr/share: No such file or directory

this happens because D is being altered outside pseudo's context, and
alterning D is done after do_install ends so its likely going to race as
well with subsequent functions and change pseudo context too

Fixes occasionally seen build failures on autobuilders

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
index cb04e17dfd..5325048039 100644
--- a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
@@ -19,9 +19,7 @@ S = "${WORKDIR}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_cleanup_hexfile() {
+do_install_append() {
     rm ${D}${datadir}/data/hexfile.bin
     rmdir ${D}${datadir}/data ${D}${datadir}
 }
-
-addtask cleanup_hexfile before do_package after do_install
-- 
2.31.0

