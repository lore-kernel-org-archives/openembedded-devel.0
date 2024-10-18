Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D823D3E196
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.29957.1729278803826438104
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1Yjrs2f;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5cec98cceso6846087b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278803; x=1729883603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2KUoUVtmpOoaZbPFW8r7vpvaVgTEkWvxvekCl3baZw=;
        b=B1Yjrs2fT5Sjipt5+lI8/aH1HkDM3i7zcdlnAseltoQwjzUD1VrX+8hmopfbjdQwwt
         q9QApAhSgXWPmU+GRnJtpnAjzUDwuSjg3GIscVQcQobpmrAkFn2gDLfcecJ3EEa8LbJq
         y2FpEWtERPAj17NuGKX16xWIpsk/pwzGP75JDGeYvH+JKkKTJ9GxiaT9cKrAdcO7hacY
         5zyNAf0Co8oRWMbcINuGeFSV3OKARyuWjw+LtQW7ACU/N1cDquIOOk9evOVMCxPmk2sq
         BR94GLw455G8WaAh5qNJd148Wa4FlJVPA1wN0+GBJitin76jZs7gwt1EIByIeHRGRGsJ
         +VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278803; x=1729883603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2KUoUVtmpOoaZbPFW8r7vpvaVgTEkWvxvekCl3baZw=;
        b=b8xutLreo3DMQ8RmMusU1cpluRE/lrvz/aPG6My1hU6ViV9apJ6pckCEmPx9GIHTqg
         d+7e/zVuLiOXsaqZXoRcIw1L0VyhzcK/n0lxU6uhwwYYjZKzXCYhowMRUnM7cemANcxh
         IPeF/fvoOvJBlSAjTNM5yMCnQU0W5xmce9UPFX531vYwQE/HoSH1W63aP8moBbr4Pmem
         q3AjE4/OjrvHvKAYTQZ8HJUbvMup2JkaUW7zUEE5hRJFahh0TEcmXQ9ogcmkJ2ytDPOz
         HQm/hK1vUPuWI2W+8xaJWExNV3bT85Fxdz/7ewj+455ufmnhnagJJrPuR+vs7FzBb7tH
         xrbg==
X-Gm-Message-State: AOJu0YyLEW1TA0kIJ6HjmwPcy3Fiz0c7p01UIISpXvKoZ31bpJp1B3I3
	jLwM7/DzYCD1EbXv9E3KDr546FSToZwyNqgactKzrdoOdSQsOljdhl1Z2Q==
X-Google-Smtp-Source: AGHT+IGIKX7UOcMuIF2tjNMYIc4odmhYZ/zC0XdW6bTMvShsaUX1J+/twmnn2hUB6q80m2HkbIXT3w==
X-Received: by 2002:a05:690c:60c2:b0:6db:31f6:a812 with SMTP id 00721157ae682-6e5bf73c772mr45933807b3.4.1729278802512;
        Fri, 18 Oct 2024 12:13:22 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:22 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 18/68] python3-fann2: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:05 -0400
Message-ID: <20241018191101.25184-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113005

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 2099d791d..3053ca5d7 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -3,7 +3,6 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
 
-SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
 SRC_URI[sha256sum] = "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e"
 
 SRC_URI += " file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-locati.patch"
-- 
2.43.0


