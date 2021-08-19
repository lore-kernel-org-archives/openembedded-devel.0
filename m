Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.68831.1629377483018116987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 05:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtEoxlIT;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d11so12665402eja.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZUEiB3REONd9DNPy8OE4pkP/qno1bpRFF8CrCvcQds=;
        b=rtEoxlITap1mWtZH+fQuAyyDTxqSS4o7Rvno9IgjPVCJydfhB5hz3KiIrlutBygVsT
         GSVc3gsqY3uVf9ay2Y39NGBoydoW1qtpXOvCtCoZeNeLJ8rHq9IM52EJhp++chKXCIJi
         a1rQJ5tzZx2nCgPk7UfFz37NGckuvBz3q5wjLf/KtZzs9JLBuz4gNkkVjwDq0g1ClD7Z
         OGDvYDmMJKf77VJZJu80BxF2sbJWm4t3+4Bj5m75RIb266xZIChOs5FtvlgM6cpScFiB
         eHblIr7Z9002DiPXnxjySt/Pg2VlaNKhQ4lirGHUgauVLnU2YKYCejOqUuNAurUfpX1e
         oX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZUEiB3REONd9DNPy8OE4pkP/qno1bpRFF8CrCvcQds=;
        b=nvDhq+PYHguXGcmiGrdOi3k4EFmRv5xt8vL2V+Eiu6MUAUpIyEOD0QCiqt8ZZ3xv12
         RPhdjpRlD9DMTcrtzrcsOrnzW05M+JSe9d72c4crVKH06kb/kgjuDTNHEVTjZqeE9lik
         7G1/n2EzTAR8M3+WbIz+RnbIuIC7bOWQdyzm3SE+Vksq9PKe9Q9ohu3e47Yfd2nwxp5U
         ROGhA0Kjbu1iW4yRhe+UnlhaYFOK4fOMtAFUchKnkPFRlwHdvLSclixrc5mKbl9EnElZ
         XckwE7N4HhXLrkycmnmBRX9tAFav8waBdVXwt/CAebwk0UIHksKEbbBUFkdGDPnhGosD
         tnsw==
X-Gm-Message-State: AOAM531dWpVhOVeJrT42RfgkplqzHUd9Am5ClPC6ZrF9RDYu9XFaNWIM
	nmk1OEpHKgDqU1NDG8aHqMY/2gApNa712g==
X-Google-Smtp-Source: ABdhPJzjJnA4EadZqljySl7JUJYKqIKnnMqeVdTixPC/4Nr0dubNeg56TaSzA/Zq+vofLTUYKiYDDA==
X-Received: by 2002:a17:906:31cf:: with SMTP id f15mr15774946ejf.272.1629377481324;
        Thu, 19 Aug 2021 05:51:21 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id um4sm1240259ejb.92.2021.08.19.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 05:51:20 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: leimaohui <leimaohui@fujitsu.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] layer.conf: Add ttf-takao to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS on fontconfig
Date: Thu, 19 Aug 2021 14:51:18 +0200
Message-Id: <20210819125118.18123-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* this issue was introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=f58bd1789ad840b04fa36212d67cebbe14ed21e5

* fixes issue detected with sstate-diff-machine.sh:

 === Comparing signatures for task do_package_write_ipk.sigdata between tissot and raspberrypi3-64 ===
ERROR: ttf-takao different signature for task do_package_write_ipk.sigdata between tissot and raspberrypi3-64
NOTE: Starting bitbake server...
Hash for dependent task fontconfig/fontconfig_2.13.1.bb:do_packagedata changed from 96b1c46d82cc5e324700f930658af17cc29c3fd5311164fa4d0babc2e7613257 to 3e925fdfcf4a72b498215611b495a04ac95650924b0bddf13640724e8b7a7dd7
Unable to find matching sigdata for /home/jenkins/workspace/luneos-unstable/webos-ports/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata with hashes 96b1c46d82cc5e324700f930658af17cc29c3fd5311164fa4d0babc2e7613257 or 3e925fdfcf4a72b498215611b495a04ac95650924b0bddf13640724e8b7a7dd7
ERROR: 1 errors found in /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sstate-diff/1629372962/signatures.raspberrypi3-64.do_package_write_ipk.sigdata.log
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 8aaff84b9f..d25db911ce 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -91,6 +91,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-roboto->fontconfig \
   ttf-mplus->fontconfig \
   ttf-sazanami->fontconfig \
+  ttf-takao->fontconfig \
   ttf-tlwg->fontconfig \
   ttf-ubuntu-font-family->fontconfig \
   ttf-vlgothic->fontconfig \
-- 
2.30.2

