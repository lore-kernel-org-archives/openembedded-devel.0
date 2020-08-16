Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.20215.1597561983974678861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2020 00:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O75Uyvz4;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id e4so6262525pjd.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2020 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dmj1LNjiTkNLN7/TLoheQepEqqztLhlfq71Y4LqqHQs=;
        b=O75Uyvz4WIorevylTSigQCsYdSdEpaoD9ZCmNffKnUwrOSt7GUdmnPEJg7LE+Vypun
         5IA7pAkkYTcNGrkKCe3bFaf8VWH14bswjaAugiYy/q/sX4XsO7Gnb+m2Ti0NlQ0BslVP
         RAe9YUNBD85HUiP1nA7XAwaD6Yz35uVpE5VKszpeRZNAH1AK5FuXPBRsKXhjU7yXsbA4
         wvT6oyP34v2rR0Pmcm0yROOqutW1r322O7bcyAT8pQInq/fPVs2PMy/JdwVXyKceOY5L
         qpLNrOtSi7ljDWwTY1avzMrrx9HPwoFuf1Ylsm4MSHzNWzR2qSEa4MMGQlgbgVWL/Ifs
         SOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dmj1LNjiTkNLN7/TLoheQepEqqztLhlfq71Y4LqqHQs=;
        b=UNmaEfLgOaOjKTCG8uxTF9Qpz9AvXZY3heXlJ1QQE7M2vxU65l8W25Jv0wmjczE1Gp
         GhJ72jl5u17thWq1bwtDQJqmDYKnU87Hb0Y+iIPdcI2atU9s5cXNsIlBv3s5/+KMVgB0
         p8t5UqBjtYqpPX6ILy2HYlsqy/5+pZ22UgyDBC94ciOInwje/27+WWkJk4/gokm5NZJU
         v92xq9fKIi/IS6Cald3CwsMDQYji1aHeS/StX1Gr0PCiHhtznoZaKixekD/zPmr2/xVE
         0haSdqV53GJ1zHTxi6Bxee3fZBvuEcVXv6cVyzX/gV58KUsexZDfO2+hF/okp1QX2sDk
         4qRQ==
X-Gm-Message-State: AOAM5314SzhpKsW3Kq09KB/AwG9iXys7b/xnFnCNB8OthPHBNEuLx1IK
	bCo8hPqc8ZGn9zyTQmDAMBB03nkA7ZJ0tQ==
X-Google-Smtp-Source: ABdhPJzgbjDPfinoefn4GnNyuL+Zt1Jb71EGOSP87UwXa2PRjo2Vx91IknDwxNmgbCrXV3yGUnV/Vg==
X-Received: by 2002:a17:902:6ac9:: with SMTP id i9mr7451169plt.128.1597561983057;
        Sun, 16 Aug 2020 00:13:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id q7sm12054386pfu.133.2020.08.16.00.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:13:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] json-schema-validator: Add recipe
Date: Sun, 16 Aug 2020 00:12:59 -0700
Message-Id: <20200816071300.1407768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../json-schema-validator_2.1.0.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
new file mode 100644
index 0000000000..7f6c34eb3d
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "JSON schema validator for JSON for Modern C++"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
+
+SRC_URI = "git://github.com/pboettch/json-schema-validator"
+SRCREV = "27fc1d094503623dfe39365ba82581507524545c"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "nlohmann-json"
+
+inherit cmake
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF"
+
-- 
2.28.0

