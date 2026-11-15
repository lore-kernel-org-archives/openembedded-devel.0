Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3812.1794729001066488196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=y+HbLa/0;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3712b6d9843so1902819eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729000; x=1795333800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbFta4l1J0BA1jbYqd0iUo7PnMxz9vE8couUmiY/m50=;
        b=y+HbLa/0Vc+Vk1nvmGJGBaJ70xfpQcwIsNB1xPYIwvlzXrWFYu6HqAlZoUUBdEnx1b
         n8tKS62wZ9LLEQoapDqbslEv/w7aQ+BJeb9IeOmTYiJ8JrL+VKM61wjdORkodO9kjxRk
         DDY18X8lCdaAxPuHHstXN4Gm8kxBrKrUHcEQkoJJOda6Iw8fwDtRSJR6UI7HMIymozq0
         /vUIr49ub7aHOl9TCWioKcDFlosTgW/JbmLrLDVUvGkm890ogxlN7qq8bn4vpcAzMR/0
         VUiFeQ/fzaUf5MZUVKdNwY857lpAX/VNgRcUOBbL+JZdYZ974kOAoZGK8j0brQZS3Y+E
         ZNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729000; x=1795333800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbFta4l1J0BA1jbYqd0iUo7PnMxz9vE8couUmiY/m50=;
        b=FAy+RP6PC8nKKMh1ae+EnwVZkZDNQWFDwjuicncdIbPn0h4fWynpDVhwZn/BazwNM1
         Iz61/B7NPQwGergRFe/G9UZzgs008lhZ1MlK63RdKZoCNjH4X9JbWjmNA06+CkDO6YvX
         RdYIV8+x8kz877qAJVZ0wbDbkdF2yWVyWb5rUhftqXg2udKCu/DKyezsS4x7W5LyPRCq
         tpa99uQxguB2y1F9qtRmU4ue17bWi9vQGbMDxj3ScPBqzmRckWldFmB9bVM+nwIqj3NQ
         qtQqjBjHwPKUjptJr8xYqXhwvHcmMRotUUAnG0fSab6tcY3k/rUG5c+1Goz1hvaSY40P
         ZODQ==
X-Gm-Message-State: APuU4Z8K5D3ujoXfNdWzr9T5Sgwjp+vGhE3l4pBB2fMvuDZA38h9ewEh
	/xLSbjgXozc5ZcA6nzTU+IUcCnBkNMJJcpnMgvI3yjTlAnit5Cs8o5Z/6V4r6+2t
X-Gm-Gg: AYBFou1b2b19lFyehLId/2LgYqrudfVRheeWKaCgq+iHSfFW1XzsVXgi6/t1YzdUjJL
	6fijzFiQ0W/y3kEck07owHsevnhW5A1XGHLE5tOntd2MKy6k6uQLKPy9GzItUgIcjWTXuEmqDw1
	szS2Qmv4qTGvwksFxQdbsGFcfpPfZH+V9D3Nog71Tj8U9w/1IgM/BjzO9yzz5+GK1KA7l4HqnC0
	pD42UGqmDI4aodRE/8yq0pMZ+MgJuGSRzt1OxBifhUDLHLsYtf34ySUtZO9tSLTd7OowkSxr1oE
	rsN2LN8bB6bTfSbj18a+jRlVNqij38N/U9o/YcD6n/S3VZnTalSW76VYkQI7qPdSQ8by4tNRDr1
	gJu0SXCT/wRr+F3aGQ2+c0wqq8xZ/tlfudxQX+nwgtR7a6CkP9xuxlUWbrVToklBdY/Y1JkJcKO
	Oxadu+DteLsNRuaz5dBqn2M8rE8/VmITOfLyuNjnVQNZutKalKs2dnG80lU/Gbsw82lCxz8G2aj
	IBeU+be9reqFR3KoqZ/7R7zlcRiCjVDIVYu7RCPm1X1mmU6Gk2BRyddNz9eDZycKuG1sonkxFxH
	9Rc6oaKPhZnrHc6u/hanyizLxlgpnU1o2NsL3lUhpx4a6sCMxp9JEhv6HH6NjIIKkFPfhaEG/MK
	sUaQmjUSAxmoi40e680iKuSvnF5btTBgOcRCukniq8VHY+VEfESFamUCQmbSnXiu5fEGfIAi74F
	3SQDtkULSN05v4E9CJcdR/d6CZwG+E1vVfcXKLSSNE2d4zytNkrHI2nkQdSD3KZacn8dtOXDMjq
	pXXaRaMDf2taCNmeioQdtHKRA+swzIGSPJJgnjbHYJPraqO4HREcJ6L8PbRUdaVoGpt8H77ipr4
	NpjF/MIQwHSbVpWPoU1QyMwxEw==
X-Received: by 2002:a05:7301:4206:b0:369:535f:4d12 with SMTP id 5a478bee46e88-37963a53df5mr6551058eec.3.1794729000390;
        Sat, 14 Nov 2026 23:50:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/96] libqrtr-glib: upgrade 1.2.2+git -> 1.4.0
Date: Sat, 14 Nov 2026 23:48:03 -0800
Message-ID: <20261115074918.2932593-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132295
Content-Type: text/plain; charset="utf-8"

Switch to the qrtr-1-4 branch and the 1.4.0 release tag.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
index f195008650..94cce4b2f0 100644
--- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protocol=https;branch=qrtr-1-2"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protocol=https;branch=qrtr-1-4"
 
-PV = "1.2.2+git"
-SRCREV = "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
+PV = "1.4.0"
+SRCREV = "69791f8f2a092d0ec8eb83cbe51dfc3d157c3079"
 
 
 inherit meson pkgconfig gobject-introspection
