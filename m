Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.472.1614971375610481045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 11:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NwhW9VL0;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id x78so3683633oix.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4O1euR8GSPeK4pHdnL9zt+0xqADCVtTrWjOtzz3gdng=;
        b=NwhW9VL0+cwX3BmI3KJLHR2wpfNTDCSiArm+qFY6wcWAiVgGNwkLTTgOY5jyGg2rLN
         Fe99PKBN5MpjmVCpNMo0OmZmPgNbfgitzRGxHKCm+gdcdYb+fToDKWrnEjzFz4yrt+Pe
         4FqfsyVKc7MUPMRaAlUR3wJTEiQTtmUd9zAQ9C3VBXudMDJLXNB58sraZD6/P6c4zAm5
         faUkmzc2BGMXgORzfx2002fRdOnJd/RFERf74d7eRZWiBWPxHhz50ZnFI1+BRrdUnzwp
         ES82nulGeoVum9EieLDxuJ9AnBoeB743UeaY9tYWz3hLQ0988iJfYFlXXQHHd5y7ySBB
         jB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4O1euR8GSPeK4pHdnL9zt+0xqADCVtTrWjOtzz3gdng=;
        b=mwqweAuYKv00Svg682bKGCok11ZgcOFv2//fsbllh/QJ6x39lY2PLMI8qEeXe7PU2n
         a8HEkSkdbWtsGoWVf99duT9sIYwq0kh/NubeCSs5jnu9nobtTgEgRoP1/NDFWWpXN91M
         T4htz8p+KIohR2GF10G4cRs1N2rYzyTB4RuvnWa12UXDdGErzVIQNOdMwPcSQvO1XQOz
         UJApLsBEm0+6yadyvYDXAlci5dnbXCXdBXqrBBccgXNEqBYksXt4JzHK+WxGSseCsynC
         /oKlR2FOwj9yqM4XM46+vwBC8kFK/1mOLwSdumJOOWgQRwNE9EkUwPh77AuJe4SqeKiJ
         ezWA==
X-Gm-Message-State: AOAM531oI7TaD13ALGkhBr0RKROmggXbl5jFzHbxVOxCnXWEArcCw0SE
	8s46WsbUtSrbiEJVkq6vfIgRMUdwtW4=
X-Google-Smtp-Source: ABdhPJzEFXg4V91Gb7AJMiA0xahnoxE6yUW8B37+GGOe63tXXAV7ptoqIshpWu17jQHomfHHs548Ag==
X-Received: by 2002:aca:c109:: with SMTP id r9mr8064796oif.64.1614971374551;
        Fri, 05 Mar 2021 11:09:34 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id u7sm715537ooq.13.2021.03.05.11.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 11:09:34 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] classes: Add Android sparse image class
Date: Fri,  5 Mar 2021 13:08:59 -0600
Message-Id: <20210305190859.32217-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a class to create sparse image files using the Android tools
---
 meta-oe/classes/image_types_simg.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/classes/image_types_simg.bbclass

diff --git a/meta-oe/classes/image_types_simg.bbclass b/meta-oe/classes/image_types_simg.bbclass
new file mode 100644
index 000000000..a53fafe5e
--- /dev/null
+++ b/meta-oe/classes/image_types_simg.bbclass
@@ -0,0 +1,16 @@
+inherit image_types
+
+CONVERSIONTYPES += "simg"
+CONVERSION_CMD_simg() {
+    in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+    out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.simg"
+    case "${type}" in
+        ext*)
+            ext2simg "$in" "$out"
+            ;;
+        *)
+            img2simg "$in" "$out"
+            ;;
+    esac
+}
+CONVERSION_DEPENDS_simg = "android-tools-native"
-- 
2.30.0

