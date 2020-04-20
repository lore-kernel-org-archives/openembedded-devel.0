Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.6626.1587402432329510896
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihDRSLAc;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: andrea.adami@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id t63so352894wmt.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2ULi+SK9bLxSwp3Q3AqLww7Pgk6IzG6thrndmcXsU9Q=;
        b=ihDRSLAcjVUzdytFv8868laCF548/iNn4ir73acuGdUaVDuHPshjllh2EIGjrGr0SQ
         /CNNO9n7/bMwPEqsJDcvSNwlyeIRefFPueqNR2FmAHX+vkK99VMJVEDe4w0sy2AE56Gj
         iRFWEaPYfs+F59+ynNKGc+CgBpsEBjLdGmm9yCXCbF78HDOOgigo0UfLOkuJsPI9yQ41
         CCw6yq8wnrwjPwk14EnH+y5HGd943OiICGdD++SmXAEUTuYJ6CZu5MUs5UrgZj7IoP3S
         aKMkAX3nd14LNxA7lFM0BHQMX3gihtEbdRADmYaJ3LXT9xHPmf/o89gQ4c/xIoCKx+0/
         Tx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2ULi+SK9bLxSwp3Q3AqLww7Pgk6IzG6thrndmcXsU9Q=;
        b=Ifx8SGEIJOeTt7MPv0EFc0dZ9JxUXbg7vwOVt9nXpHXNkggEDfC7Rs4GgcoVDZqJfJ
         DDMf/hEYw4rnXTjKlEXI4DwJroWF8TrroA1NGUkmX3JO5Ro9y9C2/Pk4gztC6TlfLrUn
         Jjgla9x/oDWyYpXoULIOZIRzdlInPa3d1YHH+G2BE09NDXQZU8xGszgLIsqtbUO8sI+t
         NVqmnNa85/lhyIw4t5mEeaxF6Jtx2DsqV8Mi+N1ZPGk8VCiJ+jEuZLE/CH/b3L0RbmWX
         8BW5DRdW9sSXSsakxKu0EKTdGAi56Nqdweqlx3I8djzz3rEhr/CRN/Z/CfxrxD3J1USd
         +PpQ==
X-Gm-Message-State: AGi0PuZbJg4HXac84/s1mNvMYqSfpkB2Ejuh2PSPJ3EM9eJ54eGDBzdy
	n29rhr31jwJWFbYpjC+bEYCE4FR9
X-Google-Smtp-Source: APiQypJ9O9htAVMBTaaKUT336U2WL2py1cZmpPXAWRRoF/4uVmY4g6jHYmxLTXvyG6wQyAvNjU2yeQ==
X-Received: by 2002:a1c:9e43:: with SMTP id h64mr352803wme.0.1587402430258;
        Mon, 20 Apr 2020 10:07:10 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id c10sm140366wru.48.2020.04.20.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:07:09 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/4] layer.conf: set compatibility for zeus
Date: Mon, 20 Apr 2020 19:06:55 +0200
Message-Id: <20200420170656.10895-3-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420170656.10895-1-andrea.adami@gmail.com>
References: <20200420170656.10895-1-andrea.adami@gmail.com>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0702f69..31fcb54 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -18,5 +18,5 @@ BBFILE_PRIORITY_meta-handheld = "7"
 
 LAYERDEPENDS_meta-handheld = "core meta-initramfs openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-handheld = "sumo thud warrior"
+LAYERSERIES_COMPAT_meta-handheld = "sumo thud warrior zeus"
 
-- 
2.17.1

