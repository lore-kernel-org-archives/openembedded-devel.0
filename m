Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web08.3885.1615240599397349881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 13:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vYx07aHa;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id t16so10789374ott.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 13:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cu99H7vEb2I5wOqt/sCuIXCX9/NjszmNV4f4jTe0Kwg=;
        b=vYx07aHag4+FglgYK+NvNu/qHkTdGsmuPkMPdgiB1j5JQ+TUjIN5/i+q4rbwJ7ERSM
         mZZt0B5UpupuPyK6rzQwB66POFplH4Ba92beUKVjkkYpj/piC7jTBO6lN9eNAvRVrle1
         gqsIZx9wmuhElQg8BAFNne8IKsWUWcgVFK88LUJiSQVrXG7p/p52FIbvfS0MfpQ9B85t
         jdf1syE9nq5i3vtArcwyAex2Pk+ocJ/bxsttzZmaY5MCUYVL8nvdEo04SRfWgCJZexW7
         F2W08Qrwqs8I3CjL9yItPJ1BTKwSbwOKtBmqqfmvmerAtF8GzwXVZTbLhE4SLKPwqzHg
         HRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cu99H7vEb2I5wOqt/sCuIXCX9/NjszmNV4f4jTe0Kwg=;
        b=WlHjFTQINcffESy7x5LVMIr4Wua3N00IpvMTthI+SLjEjCqgSWDyaNEMelEYxwj4qb
         guAidHu/e4HFbTUrXan1tZhabXt3tEwHnGt3C315kGLk+2xU2567zcNmSyXdvG1lKVZ3
         2/NwTCcLG5cc9gBIvmHLjOm59MNq/ootz1z8JLk0jZfQ5451g8DlI4/6sSBMsh7/tk9Q
         m9jpoBVmrY1f6lSnm6XW3ioU3fV1EIiFjH8nvm3Fsa+ZhntJcfeKICac2PIYJgA6gHWj
         jW1Sfc5ZQnQQvKbiWCbwQwVu+yZ/mt9+b2ohjT9BUG7ZG9H9rFSHpVEAttb8x/0MZRj4
         5rTA==
X-Gm-Message-State: AOAM5304ynOOf9as5NOnGgb88uje2/Y7CZtMhN/xLsVIcsGpfGeOxF16
	8L+iF5+1ZcXDdDGSQWthScOxtCgEb4o=
X-Google-Smtp-Source: ABdhPJxC72ODv+vlUb3yTjv4pT1kkln2JFUeSGkXgLYFWqEFXT8fw4x8jWXdFGeuD23whiOm46zOcQ==
X-Received: by 2002:a9d:4b9a:: with SMTP id k26mr10595424otf.326.1615240598337;
        Mon, 08 Mar 2021 13:56:38 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k9sm3053091ots.24.2021.03.08.13.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 13:56:38 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH v2] classes: Add Android sparse image class
Date: Mon,  8 Mar 2021 15:51:18 -0600
Message-Id: <20210308215118.17127-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210305190859.32217-1-JPEWhacker@gmail.com>
References: <20210305190859.32217-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a class to create sparse image files using the Android tools

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/classes/image_types_sparse.bbclass

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
new file mode 100644
index 000000000..1459f800a
--- /dev/null
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -0,0 +1,16 @@
+inherit image_types
+
+CONVERSIONTYPES += "sparse"
+CONVERSION_CMD_sparse() {
+    in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+    out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
+    case "${type}" in
+        ext*)
+            ext2simg "$in" "$out"
+            ;;
+        *)
+            img2simg "$in" "$out"
+            ;;
+    esac
+}
+CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.30.0

