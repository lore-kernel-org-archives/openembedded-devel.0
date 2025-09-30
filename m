Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BDCAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:09 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.20996.1759223947309008867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpVGa7/z;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42592472031so11612925ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223946; x=1759828746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBfcWNr1J/LRXgDlYYTehfAgrjvHV09FADTJUiaM1UQ=;
        b=WpVGa7/zwJbDl6V4e/uOZN42ZnenqJ9mRQ9Oh9xHSZ5yDJmoMHSKV87iZYSfSQbbiU
         uVH74r4cHU/Xra45/bMmiOWay8pJWfyuA25C7Rqk0sxh3zBKKkkr2DUhOPz/DbVHztwX
         7n7MwdvPdKfhEq2nHy5md1qzsGfObPsEpL2H5UoMLodVQY/KTdWz6p099uoPecSZ1GIV
         gL4kpRsUpvnrr8PhFSmHpP8N9Hjns5kjgCJ+OF2Og7w5N1bZ/MQ4pv6r1JNNFJ5F3QrN
         58/SMknnpvnW+OfJGsdpeCkTrlsr6SOWrACRQDePjTpzVQd1T/tJe9ada1WjIJg8NyU5
         KMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223946; x=1759828746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBfcWNr1J/LRXgDlYYTehfAgrjvHV09FADTJUiaM1UQ=;
        b=A7kgwu1z65qihi3WJKiOHro2RnzhItHjvEkSGhd/wNyZIwpbKBJuLOcO34L4umowTj
         qZYYG4PHUzBJTNn/o5wchDjPiGe+fBoTyuxRFJD/1fLaTaSORWo66VCcs61Y/jcbmsHS
         lKArlHzi/RAtS4MRAiiQ5M4MOjldtW+6X4p7D5oobRWSDOiNd3DZLBRnTCEDF4C+VMfs
         oKnQP8QgkqSVzTkeSgQ00pxGHJUbYMD0YMQoSxshO1eA0qQSnQBe1YWOFs59TH4Ofy59
         5oYTUlo+cn0GSRfiMPJakXUPPhuS3lvNRytdZNBVFWkJeBC3yKnfl7/l/Lpho9Vs7F+P
         UQgw==
X-Gm-Message-State: AOJu0YzqQXuZzObj8wYRYZB1BgaZfsp+QOSP6a3tBSLQs9kVhIn9Asxa
	wraAprDR5Cjb8gvOHbc+I4DCd/dGqAHX0+y/h9BlvLMRWkXgTHdE4sIhauX+Gxxv
X-Gm-Gg: ASbGnctt632+uia4/Xb3g9xtXCM74LCD/hHEQucr8SDB7/2u01KiPMLP9PfzI3KTpkk
	fZVyo+zkZFgjr0b9ap9C3C8LT8XCuVC5vCGtfz+ooIC3rf64UN+KYHXYaNapMLnGANwadRjKxZs
	+40hu+tLEkKdjTuzO6igazKmiBCaEGzy/GEprgqxQ6lSF0RhoXuuJWNdteRDL3o8R50p+wUOZHC
	Yv90LJmZqobI5DhEjS9aGsqhbVK+Qv/xfuxn5CFtejAS2cJ4gsp67w4otpqgaw5mlyrqUU7Cl27
	VtXRGtwdQ7r0o9yRUTs+U3xLeRdLtaYPnwXLY4xLY//umpVUDj4HkKOnh77ZrMC2QC6WT7BiSge
	N/lelcs/jOxoVrcgPl+apvZ5IE/PavHc44KsXuomgzlYAsFH1VuxS4bvJFM27NaD5i7YrUPUFQi
	Os72NTnrjnpQ==
X-Google-Smtp-Source: AGHT+IHj1TCQn12DXspLto+xasl4IZmdkM4BAcHGf+Wv7TRoMRQD1o9uOte9+t9KsGfnH1JvFLnP8g==
X-Received: by 2002:a05:6e02:12cb:b0:42d:7e2c:78b8 with SMTP id e9e14a558f8ab-42d7e2c7ac2mr4864535ab.2.1759223946351;
        Tue, 30 Sep 2025 02:19:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:06 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 07/22] boinc-client: fix hostname reproducibility
Date: Tue, 30 Sep 2025 22:18:26 +1300
Message-ID: <20250930091841.1693131-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120059

From: Yoann Congal <yoann.congal@smile.fr>

The generated svn_version.h contains the hostname which makes it
non-reproducible. Fix this by removing the hostname from the file.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f23543fb6e8dc8af1f50058ed5739c4419e462db)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index cfd134dd4f..624be655a5 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -78,7 +78,10 @@ do_install:prepend() {
 }
 
 do_install:append() {
-	sed -i -e 's#${S}##g' ${D}${includedir}/boinc/svn_version.h
+	# By default, the SVN_VERSION definition looks like:
+	#define SVN_VERSION "$SHA1 [https://github.com/BOINC/boinc] ($HOSTNAME:$S [client_release/7/7.20]) [Server-Release: server_release/1.1/1.1.0]"
+	# ... remove HOSTNAME and S to make it reproducible.
+	sed -i -e '/^#define SVN_VERSION /s#(\S*:\S* \[#([#g' ${D}${includedir}/boinc/svn_version.h
 }
 
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"

