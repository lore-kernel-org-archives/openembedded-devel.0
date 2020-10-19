Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web09.4699.1603137793857372694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 13:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q1WkN5qM;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t14so637897pgg.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQcyy9qtucnvMKlBlt4wsSRrPWMbrXcM7ZWUQxTzKgI=;
        b=Q1WkN5qMBmZPwT75uJearsIAf2OqV3ksmls/MTnRFJKPhxvZAZh/TEWq9nFNGE67YE
         r2eWivOXJZEywbISsOT6ZXz3HFiN6HN4z8h+Snqab0ZyR6FW1yvU3TAJBhG8Mo/raZHa
         6SiFxHrK6Ac2KpvJ+KGNFcIkI5stYyCsDtM7Gzdae8DAnzBQoVF91ZZfvGzjYiR2PGCf
         A029W0LrpnxIvH08zgnnYMkkqnJ7nJ3HGL14mphYBX8pv/roObBEVoOLRUuI70cmc+Rj
         /wy25Bl2aZiPVN9nJWN2UPcjwQoJy7cpdMGbYLhmsM7GXA1qcLcVTy4tWg6ikG4kXg+3
         awoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQcyy9qtucnvMKlBlt4wsSRrPWMbrXcM7ZWUQxTzKgI=;
        b=iC7lgHsacnX86ShKHGutxbOV6uYNkwgayeiW+oMhi16/93AZheyghDH752N1YSNAL3
         y8LBtGRAAeYM09hmU9zy2a084ZvuOy15I+o2v4LdwMrIDX0sufocB8G3sm1lHfBpR+sd
         fq9wn/Hlx9iaSwUsD2c3yZv0sI8KpAU8qO8VuDpuskjD/mqFSiZbntn/d/ypvI1Q6QtV
         7LYXYfYn7XYxjo4096N0IY58IB+SJF+pF9pdMPLGvGZSMcAsSOw7vsqZnQEs4w8fAleF
         gcFfwpXlX6Lluoxe2Y7SRB6h84j47S2ONnWmOudxSsNWFnWdT2tZQ7tkMHmr6FulbRsl
         Fa/A==
X-Gm-Message-State: AOAM531oH3QfzxV9r2EVjsRUtqrIBzt6AygqiseQvIqc/jyyV4R5OyuP
	HYcpvH9SyquG6XG3ibEeKZRUN39usf/u2g==
X-Google-Smtp-Source: ABdhPJwWl5ob2OgY3bcAPhpgn+FTADl0PksbNxab5xld++1xHunwO60DJlhNyXWnNMYYIVGr9Q1f8A==
X-Received: by 2002:a63:f14:: with SMTP id e20mr1253562pgl.52.1603137793132;
        Mon, 19 Oct 2020 13:03:13 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:f979:fa46:ae78:32a4])
        by smtp.gmail.com with ESMTPSA id h21sm387077pgi.88.2020.10.19.13.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:03:12 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][gatesgarth][PATCH] kas-meta-python2-image-base.yml: refspec gatesgarth
Date: Mon, 19 Oct 2020 13:03:06 -0700
Message-Id: <20201019200306.3283-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the gatesgarth stable branch, we only want to use
gatesgarth refspec from upstream layers.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 kas-meta-python2-image-base.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kas-meta-python2-image-base.yml b/kas-meta-python2-image-base.yml
index 6b7293e0..004c8de4 100644
--- a/kas-meta-python2-image-base.yml
+++ b/kas-meta-python2-image-base.yml
@@ -10,14 +10,14 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: master
+    refspec: gatesgarth
     layers:
       meta:
       meta-poky:
 
   meta-openembedded:
     url: http://git.openembedded.org/meta-openembedded
-    refspec: master
+    refspec: gatesgarth
     layers:
       meta-oe:
 
-- 
2.25.0

