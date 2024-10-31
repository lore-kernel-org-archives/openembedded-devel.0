Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872DCD767C8
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.12753.1730382095186050823
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQ9KGyKg;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f8490856so1007853e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382093; x=1730986893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZQx2YvdtrYv0ozsAM59eD2s82ZGksOhhONQZuCsLhM=;
        b=TQ9KGyKgD3LI1/6H8JgiE+sstphxYbfCbbNdXovVVnrK1HxpBrViVmhLqS+Dd4B2TK
         b923hwKAFHjqpuC9g9GzWfFGQlCmW2KB+NiLcLvsD7tIaupQtByIg8reRO2eGjWEUSMn
         HcvhFe/z6nCSBHRA7UL7Sfd8jD8pRa1dPHbFLIkbs+2p/tRXGm6vqBPe0fw7NtvjhqxV
         Ar325rCpNx1EdWT2B0inP8SgVQfYgtmyqxmyuLqgg2Opf0nYtIN+NQuFG08mWzfMOA89
         I+m1kSuVkc+I1IjZU/UV2+PgFLwQltntFk5fTSIDNlOl/HSPuNm6Mb1ewdibQdihzq1U
         BRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382093; x=1730986893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZQx2YvdtrYv0ozsAM59eD2s82ZGksOhhONQZuCsLhM=;
        b=DiwhX+wwTRo4Sau510e060hHwKa0eHHT7e7MvH5Cma4I3FlooSCQ5oIA0g7VYFyJFV
         NxEHM00JiuJEMs+ZoE2YFybNxADjk7yb4Q3iOdmQqQWyQbN8idtIBbz2rpSRh4ZBjvhK
         1mG3m9Gwhd6MYr/kV0up8kC82wsDusm3GFVqyav84SunkzYYgxFkRUHaw15qefU28Llu
         FW/WBP8DoDOc9ZPAUREdZNwOijy5TcHtjec1cz9rijJJx7x97OUS+lvhjkeExc+LGxbY
         B7QzbSozWo6gBjNBIcJAsOvsujRYf7ZMF8fF5Kl6fkN5TADTKdpUTMg20V+hGzkkRaKG
         +JxQ==
X-Gm-Message-State: AOJu0Yw0h7dpIUeJW4BCVa74JjpXQxgmGZdh9OKJEx1kZC4yaYttiil8
	S3MILQsvoJG5RugAl4FgFU/sG4wPZ1bMyCqRJ4Nh9oCXov4wW28/GdxGaA==
X-Google-Smtp-Source: AGHT+IFKg64+jMqOG/ErjqBQ7X/uZrrq8AN+a9GejSkFVZsp7rHetyeUXxQF81rEDYOB4ONFAnsH0A==
X-Received: by 2002:a05:6512:3a91:b0:539:f51e:2465 with SMTP id 2adb3069b0e04-53c79e32369mr1857275e87.22.1730382092711;
        Thu, 31 Oct 2024 06:41:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac78941bsm626488a12.44.2024.10.31.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 09/11] python3-flask-bootstrap: fold .inc file into .bb
Date: Thu, 31 Oct 2024 14:41:12 +0100
Message-ID: <20241031134114.2791747-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113366

* python2 is long dead, kill .inc file as well

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python-flask-bootstrap.inc             | 13 -------------
 .../python/python3-flask-bootstrap_3.3.7.1.bb     | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
deleted file mode 100644
index e476b41add..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "Apache-2.0 & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
-
-SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
-
-PYPI_PACKAGE = "Flask-Bootstrap"
-
-RDEPENDS:${PN} += "\
-    python3-dominate \
-    python3-flask \
-    python3-visitor \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
index 877c754361..7553ce74a2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
+LICENSE = "Apache-2.0 & MIT & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
+
+SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
+
+PYPI_PACKAGE = "Flask-Bootstrap"
+
 inherit pypi setuptools3
-require python-flask-bootstrap.inc
+
+RDEPENDS:${PN} += "\
+    python3-dominate \
+    python3-flask \
+    python3-visitor \
+    "
-- 
2.47.0


