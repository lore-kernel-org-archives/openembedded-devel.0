Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.17727.1628475732552808055
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Aug 2021 19:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZCPa8Yz/;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id l4so6780392ljq.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Aug 2021 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyD1YmO6Vfg611vzPVlVGwTw0AHuZbiqZLc/OT5hxUM=;
        b=ZCPa8Yz/MFI56eGJ6QoUXugcaJraV+0ti/s9/ijsDlgFAotOD6l1NTw0bHhC7l/VPE
         jq/ySwr9853Y4d/If6gtLa9L4SEe491GipL8L2nZcoQ2l1tsg50BnP7qOHjaWV+faGtW
         WGySjdFqdwhFqLspnb6/tRfyjA763WaRQ1m2R9X4wq74IcQK9LGM177q8BhOc3czTMpq
         h006KeUsdiDOmabixWeH3In4fayCzROVg3BkGoui327LTYMfScnv0IIEKMbVL0r4iF7e
         xxcW8jUZT/eDRcgyBtHcphQHTEGNDcCzCQcIZXrA190Qnv2p4kep1GNy38Zn9NqI2W6q
         vprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyD1YmO6Vfg611vzPVlVGwTw0AHuZbiqZLc/OT5hxUM=;
        b=XntZ+Fel37i6jXDXrdOaibXbWE31G1QlgQwpZK4ygfDnxlxnSYYn/yWOpS7WBKte04
         m5Reoesz5DiAJmufRzsJ37c1ErTgtEVuJBXvH55P6KKfLQqvTC2llFbGUxbXA2KZ33yp
         pzYv54EJnZnb87yG9gLHokdGdDMI+PDuHtZAVgvXruQqpvidLB1TxbiNQSijUZWen7j2
         PQCKMbT3RgPE35uX4hyl2euo9LZEM62uYLyWx0sL7S8HuqKHVEil3ddY9K1Js2cn8ROJ
         Ea72pQkziBoOdn5ZEBP/f3Gi75a6vrbfYeq518/8sSMfxKW1PIY7lHRwkq4G4OJd1SIg
         d24A==
X-Gm-Message-State: AOAM531AplBL6QFm/DkTlbuG5GzWHf2LMpmN6rTLZpDUVTRoARZCH0Q8
	Gg9SYvg4Wl6US/AiwUpmIcdBVDO9JdgLsQ==
X-Google-Smtp-Source: ABdhPJwJ+2cLZkxiPEfhflzNpCEUq5dq6lNNQ05RJ1F3/An5svYkps1YZSXBZ5SFjrJBYgLHs0MOdw==
X-Received: by 2002:a2e:a70f:: with SMTP id s15mr13836604lje.343.1628475730297;
        Sun, 08 Aug 2021 19:22:10 -0700 (PDT)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u19sm1585277lfo.205.2021.08.08.19.22.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 19:22:09 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] image_types_sparse: fix sparse image generation
Date: Mon,  9 Aug 2021 05:22:08 +0300
Message-Id: <20210809022208.1285256-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After changing image_types_sparse to follow new override syntax, using
this class generates the syntax error, because CONVERSION_CMD:sparse()
function is added to the generated shell file, but color can not be a
part of the function name. Rewrite it to be the variable rather than the
function, so that it does not end up the run.do_image_FOO file.

DEBUG: Executing shell function do_image_ext4
[.......]/temp/run.do_image_ext4.1247938: line 184: `CONVERSION_CMD:sparse': not a valid identifier
WARNING: [.......]/temp/run.do_image_ext4.1247938:151 exit 2 from 'export systemd_user_unitdir="/usr/lib/systemd/user"'
WARNING: Backtrace (BB generated script):
	#1: main, [.......]/temp/run.do_image_ext4.1247938, line 151
ERROR: Execution of '[.......]/temp/run.do_image_ext4.1247938' failed with exit code 2:
[.......]/temp/run.do_image_ext4.1247938: line 184: `CONVERSION_CMD:sparse': not a valid identifier
WARNING: [.......]/temp/run.do_image_ext4.1247938:151 exit 2 from 'export systemd_user_unitdir="/usr/lib/systemd/user"'
WARNING: Backtrace (BB generated script):
	#1: main, [.......]/temp/run.do_image_ext4.1247938, line 151

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/classes/image_types_sparse.bbclass | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index af3879372b68..65d980fd913f 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -1,16 +1,16 @@
 inherit image_types
 
 CONVERSIONTYPES += "sparse"
-CONVERSION_CMD:sparse() {
-    in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-    out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
-    case "${type}" in
-        ext*)
-            ext2simg "$in" "$out"
-            ;;
-        *)
-            img2simg "$in" "$out"
-            ;;
-    esac
-}
+CONVERSION_CMD:sparse = " \
+    case "${type}" in \
+        ext*) \
+            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
+                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
+            ;; \
+        *) \
+            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
+                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
+            ;; \
+    esac \
+"
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.30.2

