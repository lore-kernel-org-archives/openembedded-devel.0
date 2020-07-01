Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10744.1593562068783552419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EoeySlYb;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id l6so7106410pjq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/GSk+7x5KPhduYaHbL8WZTFV/e6S93fDYVwVhnDXgaQ=;
        b=EoeySlYbQPHYc2sJG4cGDBEUPvcRrtT4qJiDRnQcZgYjv92t6CGSMHv6PEzA3ovfwY
         v9q7wIcDCegxmWRJOmvVaurjvZup25ffplxSEoHEjwQ+sSIU5hphb+P12K0JkJoEYe11
         Bj29kPz01r6B6zZjFDQnqwpuObJZyS+hFk1iKnZ6FdVLxLoi5xrfmJILMXQPqKYDe7jy
         XE/jLOChJDTQ2NwbFL6UNlPIGizEAAgqV7kivHDgiJmjanOqRNQGKmyu0xrXxslJnUTK
         G1TfrAtHCMn99muM+4q8vbDhfJnzntr8sLEU1nA0OiQP7DMqMYJ1l6D50mXHLcF/02yq
         rcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/GSk+7x5KPhduYaHbL8WZTFV/e6S93fDYVwVhnDXgaQ=;
        b=rM/BTuoT9h9N7PUu/HcdKYxdh07wDgfRjte1mv3+n1Wj/E2IgzQzibPylEwSrAGmrz
         1RAbbDpzTOFz6Y6y3HnMnZMK4Nce+tWoT3SlLCFANxrQWjYtK5IS8KLGke+THsVBUit/
         yD17o5nRPYsh79/uLhcipuI1ZlHUAeZmvFP+tMCd5HEVw90DpbXWUurdhIfkG3SC2K4a
         sunOePbp0tdK0IizZy5GNCVePjMUbS3tuOn2J88ROsOOSZscxeBJ2W1ss9WR4jBynyG2
         t4uuY9v0ZwhcHTRZQ2ALke000p0wCxWgfL9f2LxiUdWGTgar5yHk7NRcOdmw33AMFgAi
         es4A==
X-Gm-Message-State: AOAM530SuF33V/4UVH11cRpySzOO9JHm/By2/LhO7gOOahlffERZPqQ2
	froT2yULlNuYfY2+YAbQsbPJunP7Tdk=
X-Google-Smtp-Source: ABdhPJygUphmVjCNiekrXyp/48JZ1KdYUFQDIxk9QchOp+sOARoqxG1MvZnX6I+QS93UWJ7WzR8Rog==
X-Received: by 2002:a17:902:8649:: with SMTP id y9mr20443516plt.60.1593562068168;
        Tue, 30 Jun 2020 17:07:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 23/32] fuse3: upgrade 3.9.1 -> 3.9.2
Date: Tue, 30 Jun 2020 17:07:08 -0700
Message-Id: <6cef858e02476c819460a19373e399dc35c5ad8d.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See changelog https://github.com/libfuse/libfuse/releases/tag/fuse-3.9.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6979461fdf6709d196efc7485c1e6e0ceace0e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
index 1830fa1668..24b17fc93b 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "26d6b450276fb04e20bf91d83b9423f0"
-SRC_URI[sha256sum] = "1bafcfd6c66ba35b7b0beb822532a9106eb8409ad6cde988888fde85f89be645"
+SRC_URI[sha256sum] = "6999b6d48e7c0a79628fa901f6e66def3513cab4ffdd8097821e7dc3cdeae08a"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.17.1

