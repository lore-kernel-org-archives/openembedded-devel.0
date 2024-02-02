Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF517C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:27:06 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.2858.1706905620977388302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso101819939f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706905620; x=1707510420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcrQBGlUFYJQUe/nptMPGWbUImpbLwyhBzlhwUgMVdg=;
        b=EpV9csq7zBRd55bYCTQ/aycjBw4evAkvDHF0GWK5Dglwbk5opUNyoTSSor4GLlcdF8
         kKS3ELWjz+gDaUl1hgXA8HLgcFO+kUEsG0YzLTN1lH/l7e99E0KTKBLBj6bQdWy6+HLD
         Y7dbtF4aWrbWu1bC2DA11syhSSPqHhyfFcFBnb1ISdNBFIuihfKivViMpLJ9C6RLBngQ
         laL0mAKUMGLocyIf791IHWl/WL3i9kmUrEfYuRA9GPUmdIv8K75qp3FaGUOyRzGrWMFE
         h0hJUpWpPn5okCjmctpydWcXdBgQRjp6jdkKmr5qNLGkkyTv/Ttv/sKn94Yp/Ij8FeSE
         YLDw==
X-Gm-Message-State: AOJu0Yw99BcA+ej/82KvowE9XNIt734l0fy6t2JhwcZ1kVx6v+UhnSRi
	kLK8BO4suN4ygXwfHA1iYv0rfy2BFOAUJYZfU9gVg7HxyITULUQeY+tLyPozW0B3Dw==
X-Google-Smtp-Source: AGHT+IEQJkiuTFlUPLlOq+jZTLNIplVUdtw2SuFAmQqiLoKIM34yhgEO0bR4ebHjL6oKGSNVmJ+ClA==
X-Received: by 2002:a05:6602:5dc:b0:7bf:f4bc:45fd with SMTP id w28-20020a05660205dc00b007bff4bc45fdmr9563658iox.16.1706905619764;
        Fri, 02 Feb 2024 12:26:59 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id a4-20020a029f84000000b00470dc55fa86sm628875jam.50.2024.02.02.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:26:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-jsonrpcclient: update to version 4.0.3
Date: Fri,  2 Feb 2024 20:26:25 +0000
Message-Id: <20240202202625.1574229-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108543

Leverage the github repo as src is not published in the latest pypi release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...onrpcclient_4.0.2.bb => python3-jsonrpcclient_4.0.3.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcclient_4.0.2.bb => python3-jsonrpcclient_4.0.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
index 08ee15a92..459726199 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
@@ -3,9 +3,12 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcclient"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10f3d7679914df805c98fb351172e677"
 
-SRC_URI[sha256sum] = "c0d475494b3e1b591ecdee7883739accaf5695edb673f16b7383b8c6bbdb1ca3"
+SRCREV = "e5dd11736925a9a8e463fc9420eab95235f181e3"
+SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=main;protocol=https"
 
-inherit pypi setuptools3
+inherit python_setuptools_build_meta
+
+S = "${WORKDIR}/git"
 
 RDEPENDS:${PN} += "\
     python3-json \
-- 
2.34.1


