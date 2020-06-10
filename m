Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.1580.1591752414283262630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 18:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jRyvZjWb;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id e18so229326pgn.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT7OLvAM5m9Zw4jNjJb1txk+ozKVhbVRxMr7D5yyrUo=;
        b=jRyvZjWbVpse1Wy+tWdV37IL35zOb8ONEyhwUDtCXEkaaqsIEPJ91hCNHc7LEZQIC1
         rfpqI58b7ASOXrRJpnKeHByq57pC1ITEEEvWE1yR5Daup7QFAizk00eGz8QKDBMOXtsT
         LFxgO7tJr6mEobUy65/DLlnod0YpnTrHTHogW5t6DJKVuU3mB6YBTqnZPla36YIJGxQG
         EIDjZmO+IFu74+Bd8+05c5g66c/fupbT0zJXVtpAEojPgA9nL0000ee1A5YTjJ8e+4ZU
         jBRvEkfqIQkM6255iFabK08hSUJ6I0bNlujK3BlTVs5QmbDTjSzN8i5A62r2L5sC68xd
         Sy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT7OLvAM5m9Zw4jNjJb1txk+ozKVhbVRxMr7D5yyrUo=;
        b=tpAq8eQGyKM5SKKQNuJSe1b1SRz0pM3CsfgSk5MdQ2SxRDcd15QFpVDpWzY0TU/W1/
         FWFelsfARqo/ZGqdM0yDQsYrs6/KqXfSwZA5fLx0yEH25YHQUFTMIc1SauiHOjx4+pRw
         gd0XQI5+EVxmnZf5ZKArM1+PV3tTJtXy9UltyUjTe/hKVhBZgsPDLcixBtrY+BxDjtqa
         SoOE+fClo6ICgPgMwEKpQvlQ1qTu63eCc8SiwJDd+Yzibh78qpWmomNhMu7tW7u1C7v+
         L4CjneaeSAnEYch+9yQcDGlaG942qNuKtCn1DkVPrz85RhFqr9cQIUxxs0bb0fa7Z9hy
         jerQ==
X-Gm-Message-State: AOAM533iijDUsb4jxiM0WtxZ2XLFDOjQvcwvdYosygiGANa1tpm6S0bH
	2Dwos7tOH/hMuGDtdcLnv1KJXyFZciY=
X-Google-Smtp-Source: ABdhPJzeDYKKfdQouMMRuCUGfS3knlF1ImVDUyeGe+PvBT5Sf6RMCU8qgpfS4i+h5/PPh42rnEZ7JA==
X-Received: by 2002:a62:1692:: with SMTP id 140mr575797pfw.168.1591752413427;
        Tue, 09 Jun 2020 18:26:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::34b9])
        by smtp.gmail.com with ESMTPSA id r3sm3484359pjj.21.2020.06.09.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 18:26:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Adam Miartus <adam.miartus@softhows.eu>
Subject: [meta-oe][PATCH] toybox-inittab: Get rid of bashism
Date: Tue,  9 Jun 2020 18:26:50 -0700
Message-Id: <20200610012650.381662-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Be explicit about copying the files, makes it simpler for dash to handle
it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Adam Miartus <adam.miartus@softhows.eu>
---
 meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
index 8d7ff61e86..9af1e3f149 100644
--- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
@@ -26,8 +26,8 @@ do_patch[noexec] = "1"
 
 do_configure() {
 	# copy over files now to have a fresh start on each config
-	for file in ${SRC_URI}; do
-		cp ${WORKDIR}/${file/file:\/\//} ${S}
+	for f in inittab rcK rcS; do
+		cp ${WORKDIR}/$f ${S}
 	done
 
 	for config in ${PACKAGECONFIG_CONFARGS}; do
-- 
2.27.0

