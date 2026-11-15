Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3826.1794729038456541323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z/JpYbLN;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3151190eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729038; x=1795333838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9j6+NqaYspJkuYSk+yn/JJ3dU48zfqNmW7Hd/cXxZw8=;
        b=Z/JpYbLNtCy6E0LT4O98aAP/Gl8BUdR5dC4GLI2NcoWzYm1YV99lOz/UW4aPQeviXA
         nHlOxqMZk+sPBApIhfhZSThlRoFKu+p4yKSTV2UFpjAYWmxKv4agDzlG2+cuHm5izEfa
         l/t1/9sjUOGWMsIyfYo2xnIT8EYC4SS2wZd4NVmpLWQ3/B2bthx7X1eizqfyJtrNQVsn
         xMni7iXKhG9S8ka6cKu+AX3cJk6dNUDRSMWWGnh1P4UCkoJtxx281n21hA2vrDpdAqV/
         yhCmT2LWB3+zgHXcf0H08qBzbg6wVU3dDqT2qRt/XwjrV9N4nKoyYsBgVtI6cHu++c0q
         y24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729038; x=1795333838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9j6+NqaYspJkuYSk+yn/JJ3dU48zfqNmW7Hd/cXxZw8=;
        b=1XW5G+wTwqcsQbKkShkRiwXv7zPlDGIvpNF9xzusYzCcxKBzzyvCtK0R8XGl/JC/z9
         5ru9e6cV031giJ6v7fdM4HcblQmXIFwodrEZ05eNLstC0YSuXNcC3D0tsyriFBtsifmY
         vR0xdXHsC/wtiRrEg7onOs5UExdlGo4MWVcrcE1mvY7h16jQ1V/WZJWH4hTCg3gOH6UU
         agR75tODnHvsvxmIvm61NdJJT/Lnhodi5P61sXHjtJXjX0I/qOQyd9FrgKC3OV4+/N/I
         cKeSaDKhrnd2GU+JgPc72L7BDJmJxHKYTFigRu51hTfqgED2pDsL51ObyEf6rXkeUNhg
         k8vw==
X-Gm-Message-State: APuU4Z9XqwQiPFYp0KfzXiyJ1GXRkdij/6D7eC2uumntrulSeQbG41Le
	e1/4Vr8smUOxpERZTo2baW9PHIgA8bKAC/zO2D4RU0xKoQKwAjm3XFV5Ag8j2P0I
X-Gm-Gg: AYBFou04Ayhu6FHrsu+iM1LZYi5tj0QoRaIe0F95Hft7H7Sf/snBZpkEAxcKArWshl0
	EfqI8fJ5Wx8gzksYX60fBuQ8vaZjsnAuPZ1KOMZ6HcTEwew5aBRBqQePBgY/jSCAmzKjbWqymG+
	MRjR9cD/QZSofAO7HFmq0zGanNTQkFigofblfbMLeres6avwdENckGKeC0OxjN5c74zR3vTl1cx
	Vsbrq+MmlgoOpBup+xlI5q+Yh4asl4zM0FkbZML3DddUGvyGdNQA9rJFALOmMUDvhBZp4bz6B63
	3viwu1CiTxjWf1uc1cBSPiepf/Kf6CG+syizTf9JPwLjimym0SqfDKdI2fA59ltZSJS6Xa99hWz
	DLRkLVJzPjd0GhkCjmGfQnZY/Z/GJ0z39TwbeTo8Ve54Oo9XkEMFVeS6W5I1Ui3tT/GzeR0bc1Q
	1HVhjdJmBvPONMKIXDwQcCD8UAZLK54RDTPqO3RNcZy4ljS7LhjQNcNlgMhox6h3VKo/0XfLlTG
	ApWvOLS55MGNm03QEnu5hkLGfwykaRdlCo6wq1fkA6e09ie8NUbmnzNn44fUo2XPXFh8Cj1scmN
	NlT1rWydQDItlit2lRJq7IpG/cN1LFlNCX2yNbaA2B/f38/xb87s312O87ox0ZkeqUZ+38QRY+n
	PjgywN9gMECqXtBwK4clVbECVUpMvacsK5f5HdpbDDvPO5VZnQXA7+OptZaViEwbG3qy6Izn65C
	EmFS+Iodmb+SjL86XNT4c8baDxEfpd0BFw94iQFEQ92Gi89ODxiDoZ08gNwekDvaz4YmCCXe34O
	5Aypr+Ff1yvb9GE7mlWwKZ0eHa7chkUnrmKkIEikRxgxu1Vrbw/6GQ4jvBmPYpiby50bp7RileT
	ei/e
X-Received: by 2002:a05:693c:8096:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-37965daa4c0mr7468773eec.12.1794729037813;
        Sat, 14 Nov 2026 23:50:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 48/96] sip: upgrade 6.16.1 -> 6.17.3
Date: Sat, 14 Nov 2026 23:48:26 -0800
Message-ID: <20261115074918.2932593-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132318
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.16.1.bb => sip_6.17.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.16.1.bb => sip_6.17.3.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.16.1.bb b/meta-oe/recipes-devtools/sip/sip_6.17.3.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.16.1.bb
rename to meta-oe/recipes-devtools/sip/sip_6.17.3.bb
index a5034e6982..d5421ffd49 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.16.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.17.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 
 inherit pypi python_setuptools_build_meta python3native
 
-SRC_URI[sha256sum] = "0a739c9cd2929de4e0884456d8caf3cfb22c10534757c7797bd8dc6bd9ed69bc"
+SRC_URI[sha256sum] = "e3b5c2d1429a96f2e1fc25b69d4ceb232bc8b7f2395e864c904cec28905642b5"
 
 DEPENDS += "python3-setuptools-scm-native"
 
