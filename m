Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web08.17893.1603573724017715684
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2020 14:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lFkiqKhO;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 126so3442133pfu.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2020 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GOPx3fLP6TMH+O6dY11aw4A5nkxFn2Ljsru5d9u3Fs=;
        b=lFkiqKhOEHvuK70ZAD1VBooYlEwcON+Q4h8WsdB5X+qixO141z9JH9jvuyoGDBCiyG
         Cme08+tNshsQVvKRjT2E59ApL/pQy4Lxo+GUgpVznfWr3SDvywu8lLleiukqC2s/d8yS
         po3Ti0Pp4RhzEYfC8VnI8AjWcEEy/qO73LEkuLhOxQ3h2kppLAnVUTr6ydMQeexXoYke
         Z/emVksvf9Y/kr/xSSfB6FparQBfUOJBb838nx+Rb6H9EeIF4ZtUM0zzSpKulUQQXDKZ
         xNfLjYHZIyYgv7wdh3PX2jpRDprpK/+rSwsQidHIESmfZ3NNcDAJ8Xnssv+jtT75o0QH
         lb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GOPx3fLP6TMH+O6dY11aw4A5nkxFn2Ljsru5d9u3Fs=;
        b=sSQNvKk4GbkjtxhaYzwWpMkct4h8Z196ld53lXzyB4eflTC2PssvfYt45Ksq5U4PGm
         d5BwgLb0VMU7N6MrAfbRt+ulg59CFcuysIt+KPenYgi1nRB80xDQ6iHgZOt9+qI6u+2M
         qEbvUViWaDVsbN26YlAuxHVG6Y7CzE5uSTI/dRLdEIk5VAkSWoNt/oMmp/L/8dLm8Xn0
         4NzGQwvae6pD5XdzSIxgGbF4snJMpQ2js/RsXX53BydCaO9o3hPnaA0bpd80Q2KvKN6f
         Rb2lCt6friiKs+BfG35oXlcRCJ+A1WUPtHUq1hf0ZNb2eTSFe/XQqXDraxEqjX55ybCE
         NlzQ==
X-Gm-Message-State: AOAM532CkfqnBH8G4XW3G7U0MPXOy92PZZtD/GwQYei5kPC/AM3ITv09
	JNxjXfFngk4Rxkeie+YvftJ4o1jJVzsiaA==
X-Google-Smtp-Source: ABdhPJwTL8IISKKgtkH9C4I8Vxs+RY1VS9oitzuSuPPx+aPmfk+O7pg7K8LQTQi9Xo4XPDy2hgCAYg==
X-Received: by 2002:a63:1466:: with SMTP id 38mr7359547pgu.150.1603573723100;
        Sat, 24 Oct 2020 14:08:43 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-23-241-71-171.socal.res.rr.com. [23.241.71.171])
        by smtp.gmail.com with ESMTPSA id i5sm7261523pjt.54.2020.10.24.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 14:08:42 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-java][PATCH] Added gatesgarth to LAYERSERIES_COMPAT in conf/layer.conf for Yocto 3.2
Date: Sat, 24 Oct 2020 14:08:25 -0700
Message-Id: <20201024210825.5554-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 294c319..6a98adb 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "dunfell"
+LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.20.1

