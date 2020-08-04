Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.9943.1596502448116341547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 17:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eTiaBG6d;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id x6so5977434pgx.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 17:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAzRDq6R4FuquOSc99rNg4HgT+3cWnWt+STWS1xC1J0=;
        b=eTiaBG6dFU4xMDXJkFLypWgQBWu6oY/fPDRgWIxrJBVIYEYMt7wOYVAFHWdl8aNmaw
         t0Hylqmn1OmnShvHY9oMI00sMSqpEIQXDOwy+yvbUNNFGXqxTJDU2wQIRVU2M/7msI+U
         tja2ivkOGWztgQhRdfX3hg8yT6KXeAtXIA4kWE0bmTvTvD0qyVIkc6YPCo3t2LR523NU
         /56uZ34YBi1fkQoPwHXQdiwuIeNYBY3HL/HERXyE87hh+iHCNOmJuT+goMMOynA9DvaJ
         /7mA36u9qBjP1DcGnr78BS79p8MGgfoS6iVROqTvPlsgsGNeYS7tgcEtdKaUPQV1f1E7
         5JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAzRDq6R4FuquOSc99rNg4HgT+3cWnWt+STWS1xC1J0=;
        b=h4AAsjkqXGkCZQOCfdTD0O63oTV3dAwCe3rrRByb71NVkTM0DpZ49lnavuIUynXFUp
         aQIGCaMmE+wzRTGJc7wSLGnLxiE+XuDgI/pV8CYpm2IkblSEQ0ONwGUraYQKTuMfl3Oi
         mOamPIVIRSUqpNFPnmSo4WFYFz5A5mGpemIoq23Sfo5P6WoUcLSiX/y4igjbvn5Z9GTh
         EYU7uBkJMqnVwnTLAHUwIne06BRqKTvm9N49eryDtzfkMYo1IxY9C6/ULByTrGUJYhyS
         gLlUNZwMFh+cEbQyrb0zZIMGP9n2asHXZCqzu14j0jq8Vf6wAivAhCLHU8uXs6VVSdR7
         U/vA==
X-Gm-Message-State: AOAM531GDYWyuCwJVE/lzY6gI5jB96nyO5gaI1JIp2+Wd/yUYbODnlXg
	SrS4XLXzoMWKvr6qhE0xVnZl8rLWISw=
X-Google-Smtp-Source: ABdhPJzqCP6A8/R7Cgcfc0986jVAGELsPuVFFJGOEDyZaoLOb9od1+IEMftsojYT7fgl/Yi1Evp8kQ==
X-Received: by 2002:a63:5b55:: with SMTP id l21mr17697095pgm.348.1596502447311;
        Mon, 03 Aug 2020 17:54:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id r134sm11835596pfc.1.2020.08.03.17.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 17:54:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-textparser: Added recipe
Date: Mon,  3 Aug 2020 17:54:01 -0700
Message-Id: <20200804005401.2416569-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804005401.2416569-1-raj.khem@gmail.com>
References: <20200804005401.2416569-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Added python3 recipe for textparser.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-textparser_0.23.0.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
new file mode 100644
index 0000000000..0c626e7aa2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A text parser written in the Python language."
+HOMEPAGE = "https://github.com/eerimoq/textparser"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad"
+
+SRC_URI[md5sum] = "d5378eac93406156e9029114aaa1b515"
+SRC_URI[sha256sum] = "f009d0f6f78aa7c1e648dca4e3961f6d67495f7f520f1a705245ffad33f4b470"
+
+PYPI_PACKAGE = "textparser"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
-- 
2.28.0

