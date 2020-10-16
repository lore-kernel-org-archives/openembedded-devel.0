Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.17761.1602860280670679315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kqg0iv44;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id t18so1435602plo.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96GSxWzCasaLQbzgUIX9OoSOuaul4LUIWKV4YjULwug=;
        b=kqg0iv44W0kebH+YoiRxDTbhtBWHYHFZno2E7jZMGRZiYTcJGZVUiDu1l65p80mYj2
         0dvVl8Raigk7wfsGuiL0BtNWdkI4LBd87KArFSE09f7MBzz2fuoE9pMR1yn6kMgPANbS
         MEVHm4u3JztzwIhxNPkgG99qcmvBZIn0vv6CwLg7PvZ3/pDaEGu2+WmsYu495KH8g0b/
         FyMamYPbRK15DCrMCcbpSNjW4yP45IFH320CPqDX0gWXvx5jCGLT6rnxWF6DsQSEK42y
         a5RaeNyD9dHA3H5UXonRB8k8apM8fXPqDFneNL2jHqjBYPi9xWpW+5VSWYv7FRJ9GG4w
         2qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96GSxWzCasaLQbzgUIX9OoSOuaul4LUIWKV4YjULwug=;
        b=dKjkbW0qFirur3Y2qa42SBeiCLoTk7KubYNbprCeJ9uThANZ69rS1SextnGV96Qura
         ab94Psa1EvOSzXtLEE6HhfaqtCfnc472HVX+v3T6VAMdy0SqAkbeOu8JJjdBM0NED947
         Yq6TLrrY3ZVQcq3Yu3AUkQtE6EpHycpygQnC9xLmQiL12wgc9DACKxF0/N272Jrcym4+
         nPCxqMiA7v8CtJuojc8qBw2pPZQZYtdmaWrxhIta4rrNDVF/sY9FlEDt/mrVJoqNcvNU
         zpEoPrCR2d0M3t4t7bU/P2Q2B/d7WZ29Z0cOMEaO4KhayV2dtbp5dlJVgmKSdPpz8LqE
         q3ug==
X-Gm-Message-State: AOAM530zTF89w0xmVHR0sT4IwS2RWHSJFsFYlOrdP55YxTrJ7KtO1bHP
	uFkUxO3wVLdNUtdBywpEnA54gxyxHQRnNQ==
X-Google-Smtp-Source: ABdhPJxDY0SbU9t0w+LUd46jDIwA9VwwdyaPKAkfYzwP6fKELvcqXhB6s0YFEhhZTJmydaNDh25S9g==
X-Received: by 2002:a17:90b:180c:: with SMTP id lw12mr4447248pjb.181.1602860279684;
        Fri, 16 Oct 2020 07:57:59 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:4938:26a4:cb77:8681])
        by smtp.gmail.com with ESMTPSA id q16sm3006510pfu.206.2020.10.16.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:57:59 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH v2] README: added recipes must add to packagegroup
Date: Fri, 16 Oct 2020 07:57:55 -0700
Message-Id: <20201016145755.9147-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When new recipes are added, they must also be
accompanied by a patch adding them to the
packagegroup-meta-python2

This packagegroup is critical to the function of
the CI system behind this layer.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
Changes since v1:
  Fix typo of packagroup in gitlog

 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index e81533e2..a34cbb0c 100644
--- a/README
+++ b/README
@@ -78,6 +78,9 @@ It is expected that ANY upgrades to a recipe will have undergone run-time testin
 the upgrade. Many other developers depend upon the quality of this layer and will be quite upset with
 you when you break their builds.
 
+It is expected that any patch adding a new recipe will also add the recipe to packagegroup-meta-python2.
+This packagegroup is critical to the function of the CI system behind maintenance of this layer.
+
 Commit messages must include a "Signed-off-by:" line, including a valid email address and a legal name
 (not a nickname). The "Signed-off-by:" line means that you are either the author or have the legal right
 to submit the work. Please refer to the "Submitting a patch to OpenEmbedded" [6] and "Commit Patch
-- 
2.25.0

