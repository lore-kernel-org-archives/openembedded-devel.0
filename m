Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.1943.1596011745705808001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ypWWewWL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id q6so24114966ljp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uMR9sIaUzbojF5ZnL3snOBknRpNBn1WOq0/JWONXuyc=;
        b=ypWWewWL+qtOX57p30T12INcZosJ6LyGGfu3Aa4mDz85CemCChYgrKlhy+jR1nVkL7
         OXcBcKHB0UCnSIRaaO9q/Slc6WiQEk0jXskAOFmZVdmcPHdJBIbIl9ayNtv8h+3UY4KS
         vEzVyIm9pa/8OZE7QhccqDhfETtsYXrVgBl8YQSdS3hiabhjubdXkpD4XD24BFKzBl/A
         7tcQoLhbfwgqSXZZjzgW/bwg2i7+cwaawWVxCFwNRl1VY2CyNNU4olkg7Vesrs0B6B2a
         6KWjxG9xvqSc+m5RlIqxHvaV2+vUlm1ghVPQcQWmWLI2Cr72OgBrq1OeBtTZX02k6MNA
         e50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMR9sIaUzbojF5ZnL3snOBknRpNBn1WOq0/JWONXuyc=;
        b=AdY73G3lW4eArRjjkf/1j43Pgr8UVCgNidz3xW4OBdAw1hyxCqdW1lVVcTUB7kQvz0
         eFeIBpdh5hfASJJt6ec5vqnD05tH/VswkfqB+eJ7TGoXX6nJzC1P/2kt3uK6tfcZmhLx
         etYUAB+EZWmRqKFuldFsdLEAu+sThzBZdMpDHiB1fnmLVqlsJ5Rm4ocKgnJvvjIqHoy9
         ORv8q2MWfCdasSElzJF8cGN1ufqPIGcH08pfGzgosDU0oLXPUzlsM9p1aBQfz6J9RbJG
         1KKWUqLXF4WESQPfcL4uTSKlTfc+iQtMRO9ZKEsEW6s490hsGY+3MyA4PHcqRhTOB8AT
         e4rQ==
X-Gm-Message-State: AOAM531fMuCBbQyOLsy812LNg0TfsvqFwEhD3eqHVDpSe1cJ7yUHMsCB
	FwIxoctMRI8T+OSwrAwU9FO+HDcFWQE=
X-Google-Smtp-Source: ABdhPJzPB/YIUn9OpqfUcdfnxcwCaxah9m45z2fAL6qdApqDrQ8AFO/K8CrMBepHQRqNX0gaBgHxNg==
X-Received: by 2002:a2e:3015:: with SMTP id w21mr8762925ljw.30.1596011743584;
        Wed, 29 Jul 2020 01:35:43 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s9sm258780ljh.46.2020.07.29.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:35:43 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 3/3] opusfile: update to 0.12
Date: Wed, 29 Jul 2020 10:35:37 +0200
Message-Id: <20200729083537.2740433-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729083537.2740433-1-open.source@oleksandr-kravchuk.com>
References: <20200729083537.2740433-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../opusfile/{opusfile_0.10.bb => opusfile_0.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/opusfile/{opusfile_0.10.bb => opusfile_0.12.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
rename to meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
index 3f6dbb8e9..c775cef5a 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ac22b992dde6a891f8949c3e2da8576"
 
 SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
-SRC_URI[md5sum] = "ab3f7d15d766f5b36b0951ee435f9ebf"
-SRC_URI[sha256sum] = "48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f"
+SRC_URI[md5sum] = "45e8c62f6cd413395223c82f06bfa8ec"
+SRC_URI[sha256sum] = "118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b"
 
 inherit autotools pkgconfig
-- 
2.25.1

