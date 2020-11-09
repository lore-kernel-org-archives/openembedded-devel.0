Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.16635.1604949710801767736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UHUNmj7A;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x13so9060600pfa.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9E0dXEOV7kn4lJZHL0mkITcm0JHCL9N6AbDEyJnqdE=;
        b=UHUNmj7AiouSFp9Do0EItfSih6F87J7mNnKFaw17WmD/OCJNoTCbxqT8rbbxXFMIPw
         JUMK3WIQtjfdbr7aJiU85oxhEEOOAqKLatOMvV6JD2Pz+tLEpQbO8ueuGaBFNdBbPhff
         HzbAvqg4KJ2qkeZHCpWYn9wDkt1tNcDaHGx37UCIfpSIB11EQUgSwmiJz2qzTf5BtS5B
         ltkzDSrupqRRMf3w88+fna3aI76wfdZsHhAfAL2KaFSZsl+syabJMHphfW3aG630FMgp
         r18kAOpcJDt1/fWbHmlklWzd2NwjZvn0Czdl68FAGhFXDJdI0e+g7J2J4xxHGoReiz7H
         UyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9E0dXEOV7kn4lJZHL0mkITcm0JHCL9N6AbDEyJnqdE=;
        b=dCELbfV+eotnVltkxHe24QyHjb8nDjuceFq5IhFLHA7rb6lWKnV88AI5DirAkIim39
         j4BIKemtBarMfNqcECz1zzVeQ7ReXo8Eltj9UN/DBtnVnyYi7DgsqAUEAIcVAPmWkWVf
         HwmkVBzF2fpTTVQu13D320QARvOvie4zL2XTZBmF36pySzrUBMKPblywR1NnX7Jn3iIJ
         w5bQGbxvxoO8ZQJIloJGg5huPemSMljUQk4Sse7GzfamNgS36vwQi+ckVuM2rh1dO6Dx
         WeF+Ugfo/AcErwxGZ4UwN9JLkbJRQGVNmEOynD30+hp+co/QsxnBUct/SoAO6oiJO9CX
         4EQg==
X-Gm-Message-State: AOAM530km06bIeQRCmaxp/4oH9O+oxMrquwfOAZD6nDRr325nwjI7Xad
	rDdlXL5MCzPuXGyCBjy4n/ZpPC/U23HldQ==
X-Google-Smtp-Source: ABdhPJyfut4hF0SXpSqJZq/Uy8ZI/QMYnpM2AuDC7PdUlrTdofu6JCy1OOJzgaqbDR0LpwZCC9Oz1w==
X-Received: by 2002:a17:90b:438d:: with SMTP id in13mr713003pjb.17.1604949710105;
        Mon, 09 Nov 2020 11:21:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id p127sm11930685pfp.93.2020.11.09.11.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:21:49 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] Add python3-dill
Date: Mon,  9 Nov 2020 11:21:42 -0800
Message-Id: <20201109192143.3739442-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109192143.3739442-1-raj.khem@gmail.com>
References: <20201109192143.3739442-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory Anders <greg@gpanders.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-dill_0.3.2.bb        | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 248abaff7b..2476e34deb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -426,6 +426,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     gyp \
     python3-jsonref \
     python3-transitions \
+    python3-dill \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
new file mode 100644
index 0000000000..b03e032669
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
@@ -0,0 +1,9 @@
+inherit pypi setuptools3
+
+SUMMARY = "Serialize all of python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
+
+SRC_URI = "https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip"
+SRC_URI[md5sum] = "543607e0a419f154dca65265e87e4812"
+SRC_URI[sha256sum] = "6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e"
-- 
2.29.2

